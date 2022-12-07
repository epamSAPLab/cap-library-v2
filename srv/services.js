const cds = require('@sap/cds');
const cpi = require('./cpi');
const constants = require('./constants');

module.exports = cds.service.impl(async function () {

    let { Books, Readers, Authors, Booking } = this.entities;

    const external = await cds.connect.to('CE_SOURCINGSUPPLIERLIST_0001');
    const bupa = await cds.connect.to('API_BUSINESS_PARTNER');

    this.on('READ', 'Suppliers', async req => {
        return bupa.run(req.query);
    });
    
    this.on('READ', 'Suppliers1', async req => {
        return external.run(req.query);
    });

    this.on("READ", 'Books', async (req, next) => {
        if (!req.query.SELECT.columns) return next();
        const expandIndex = req.query.SELECT.columns.findIndex(
            ({ expand, ref }) => expand && ref[0] === "supplier"
        );
        if (expandIndex < 0) return next();

        // Remove expand from query
        req.query.SELECT.columns.splice(expandIndex, 1);

        // Make sure supplier_ID will be returned
        if (!req.query.SELECT.columns.indexOf('*') >= 0 &&
            !req.query.SELECT.columns.find(
                column => column.ref && column.ref.find((ref) => ref == "supplier_ID"))
        ) {
            req.query.SELECT.columns.push({ ref: ["supplier_ID"] });
        }

        const books = await next();

        const asArray = x => Array.isArray(x) ? x : [ x ];

        // Request all associated suppliers
        const supplierIds = asArray(books).map(book => book.supplier_ID);
        const suppliers = await bupa.run(SELECT.from('LibraryService.Suppliers').where({ ID: supplierIds }));

        // Convert in a map for easier lookup
        const suppliersMap = {};
        for (const supplier of suppliers)
            suppliersMap[supplier.ID] = supplier;

        // Add suppliers to result
        for (const note of asArray(books)) {
            note.supplier = suppliersMap[note.supplier_ID];
        }

        return books;
    });

    this.on('orderBook', 'Books', cpi.orderBook);

    this.before('NEW', 'Books', async (req) => {
        const { maxID } = await SELECT.one`max(bookID) as maxID`.from(Books);
        req.data.bookID = maxID + 1;
        req.data.status_ID = '0';
    });

    this.after('READ', 'Books', (each) => {
        if (each.status_ID == '0' || each.status_ID == '2') {
            each.orderBookEnabled = true;
        }
    })

    this.before('UPDATE', 'Books', async (req) => {
        if (req.data.shippedQty && (req.data.requestedQty == null || req.data.requestedQty == undefined)) {
            const { copyQty } = await SELECT.one`copyQty`.from(Books).where({ bookUUID: req.data.bookUUID });
            req.data.copyQty = copyQty + req.data.shippedQty;
        }
    });

    this.before('NEW', 'Readers', async (req) => {
        const { maxID } = await SELECT.one`max(readerID) as maxID`.from(Readers);
        req.data.readerID = maxID + 1;
    });

    this.before('NEW', 'Authors', async (req) => {
        const { maxID } = await SELECT.one`max(authorID) as maxID`.from(Authors);
        req.data.authorID = maxID + 1;
    });

    this.after('READ', 'Booking', (each) => {
        if (each.bookingStatus_ID == '2') {
            each.returnTheBookEnabled = true;
        }
    })

    this.before('NEW', 'Booking', async (req) => {
        const { maxID } = await SELECT.one`max(bookingID) as maxID`.from(Booking);
        req.data.bookingID = maxID + 1;
        req.data.bookingStatus_ID = '2';
    });

    this.before('CREATE', 'Booking', async (req) => {
        const today = (new Date).toISOString().slice(0, 10);
            req.data.beginDate = today;
            req.data.beginTime = (new Date).toISOString().slice(11, 19);
    })

    this.before('CREATE', 'Books', async (request) => {
        const book = request.data;
        if (book.pageNumber < 0)
            return request.error(400, constants.genericErrors.wrongPagesInput);
        if ( book.copyQty < 0)
            return request.error(400, constants.genericErrors.wrongCopiesInput);
    });

    this.on('returnTheBook', 'Booking', async (req) => {
        const { bookingUUID } = req.params[0];
        return UPDATE(Booking, bookingUUID).with({
            bookingStatus_ID: '1',
            endDate: (new Date).toISOString().slice(0, 10),
            endTime: (new Date).toISOString().slice(11, 19)
        });
    });

    this.before('SAVE', 'Booking', async (req) => {
        const { bookID_bookUUID } = req.data;
        let { copiesBook } = await SELECT.one`copyQty as copiesBook`.from(Books).where({ bookUUID: bookID_bookUUID });
        let { takenBooks } = await SELECT.one`count(bookingStatus_ID) as takenBooks`.from(Booking).where({ bookId_bookUUID: bookID_bookUUID, bookingStatus_ID: '2' });
        if (copiesBook <= takenBooks) {
            return req.error(400, constants.genericErrors.bookNotAvailable);
        } 
    });
})