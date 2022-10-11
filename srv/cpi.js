const cds = require('@sap/cds');
const constants = require('./constants');

module.exports = {
    orderBook: orderBook
}

const { Books, Authors } = cds.entities('epam.sap.dev.library')

async function orderBook(req) {
    try {
        const { bookUUID } = req.params[0];
        const quantity = req.data.Quantity;
        const orderInfo = await SELECT.from(Books).where({ bookUUID: bookUUID });
        if (quantity > 0) {
            const authorInfo = await SELECT.from(Authors).where({ authorUUID: orderInfo[0].toAuthor_authorUUID });
            const payload = JSON.stringify({
                bookUUID: orderInfo[0].bookUUID,
                authorUUID: orderInfo[0].toAuthor_authorUUID,
                authorfirstName: authorInfo[0].firstName,
                authorlastName: authorInfo[0].lastName,
                bookName: orderInfo[0].bookName,
                quantity: quantity,
                price: orderInfo[0].price,
                CurrencyCode_code: orderInfo[0].CurrencyCode_code,
                status_ID: "1"
            });
            const cpi = await cds.connect.to('CPIDestination');
            await cpi.tx(req).post('/http/order', payload);
            await UPDATE(Books, { bookUUID: bookUUID }).with({ status_ID: "1" });
        } else return req.error(400, constants.genericErrors.quantityNotApplicable);
    }
    catch (error) {
        console.log("Dispatch to CPI was not successful. Rejected with error: ", error)
    }        
}