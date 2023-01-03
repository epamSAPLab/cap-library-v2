sap.ui.define(["sap/ui/core/mvc/ControllerExtension", "sap/ui/model/Filter"], function (ControllerExtension, Filter) {
	"use strict";
	return ControllerExtension.extend("zlab.zlabbook.v2.custom.BookInLibraryView", {
		override: {
			onViewNeedsRefresh: function (mParameters) {
				var oTable = this.getView().byId("zlab.zlabbook.v2::BooksList--fe::CustomTab::BookInLibraryTab--BookInLibraryViewTable"),
					oBinding = oTable.getBinding("items"),
					oFilterInfo = mParameters.filterConditions;
				var basicFilter = {
					"sPath" : "status_ID",
					"sOperator" : "EQ",
					"oValue1" : "0"
				}
				
				delete oFilterInfo.$editState;

				// Prepare binding info with filter/search parameters
				var duplicateFilterInfo = Object.assign({}, oFilterInfo);
				var oConvertedFilter = this.base.getExtensionAPI().createFiltersFromFilterConditions(duplicateFilterInfo);
				oConvertedFilter.filters.push(basicFilter);
				oTable.setShowOverlay(false);
				var oFilter = new Filter({ filters: oConvertedFilter.filters, and: true });
				oBinding.filter(oFilter);
				oBinding.changeParameters({ $search: oConvertedFilter.search });
			},
			onPendingFilters: function () {
				var oTable = this.getView().byId("zlab.zlabbook.v2::BooksList--fe::CustomTab::BookInLibraryTab--BookInLibraryViewTable");
				if (oTable) {
					oTable.setShowOverlay(true);
				}
			}
		}
	});
});
