sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/ui/model/json/JSONModel",
	"sap/ui/core/Fragment",
	"sap/ui/model/Filter",
	"sap/ui/model/FilterOperator"
], function (Controller, JSONModel, Fragment, Filter, FilterOperator) {
"use strict";

return {

    onValueHelpRequest: function (oEvent) {
        var sInputValue = oEvent.getSource().getValue(),
            oView = this._view;

        if (!this._pValueHelpDialog) {
            this._pValueHelpDialog = Fragment.load({
                id: oView.getId(),
                name: "zlab.zlabbook.v2.custom.CurrencyValueHelpDialog",
                controller: "zlab.zlabbook.v2.custom.CurrencyValueHelpDialog"
            }).then(function (oDialog) {
                oView.addDependent(oDialog);
                return oDialog;
            });
        }
        this._pValueHelpDialog.then(function(oDialog) {
            // Create a filter for the binding
            // oDialog.getBinding("items").filter([new Filter("code", FilterOperator.Contains, sInputValue)]);
            // Open ValueHelpDialog filtered by the input's value
            oDialog.open();
        });
    }
};
});