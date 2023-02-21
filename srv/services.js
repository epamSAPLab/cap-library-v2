const cds = require('@sap/cds');
const cpi = require('./cpi');
const constants = require('./constants');

module.exports = cds.service.impl(async function () {

    let { Books, Readers, Authors, Booking } = this.entities;

    this.on('orderBook', 'Books', cpi.orderBook);

    this.before('NEW', 'Books', async (req) => {
        const { maxID } = await SELECT.one`max(bookID) as maxID`.from(Books);
        req.data.bookID = maxID + 1;
        req.data.status_ID = '0';
    });

    this.after('READ', 'Books', (each) => {
        if (each.status) {
            if (each.status.ID) {
                if (each.status.ID == '0' || each.status.ID == '2') {
                    each.orderBookEnabled = true;
                }
            }
        }
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
        if (book.copyQty < 0)
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