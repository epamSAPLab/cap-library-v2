sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/ui/model/json/JSONModel",
	"sap/ui/core/Fragment",
	"sap/ui/model/Filter",
	"sap/ui/model/FilterOperator"
], function (Controller, JSONModel, Fragment, Filter, FilterOperator) {
"use strict";

return {

    onValueHelpSearch: function (oEvent) {
        var sValue = oEvent.getParameter("value");
        var oFilter = new Filter("code", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
    },

    onValueHelpClose: function (oEvent) {
        let context = oEvent.getSource().getBindingContext();
        var oSelectedItem = oEvent.getParameter("selectedItem");
        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
            return;
        }

        context.setProperty("CurrencyCode_code", oSelectedItem.getTitle());
    }
};
});