//@ui5-bundle zlab/zlabbook/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"zlab/zlabbook/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("zlab.zlabbook.Component",{metadata:{manifest:"json"}})});
},
	"zlab/zlabbook/i18n/i18n.properties":'# This is the resource bundle for zlabbook\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Books\n\n#YDES: Application description\nappDescription=A Fiori application.\n\nflpTitle=Manage Books\n\nflpSubtitle=\n',
	"zlab/zlabbook/manifest.json":'{"_version":"1.32.0","sap.app":{"id":"zlab.zlabbook","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"1.0.0"},"title":"{{appTitle}}","description":"{{appDescription}}","dataSources":{"mainService":{"uri":"library/","type":"OData","settings":{"odataVersion":"4.0"}}},"offline":false,"resources":"resources.json","sourceTemplate":{"id":"ui5template.fiorielements.v4.lrop","version":"1.0.0"},"crossNavigation":{"inbounds":{"zlab-zlabbook-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"Books","action":"manage","title":"{{flpTitle}}","subTitle":"{{flpSubtitle}}","icon":"sap-icon://education","indicatorDataSource":{"dataSource":"mainService","path":"/dynamic_dest/zlablibrary-app-srv/library/Books/$count","refresh":10}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"resources":{"js":[],"css":[]},"dependencies":{"minUI5Version":"1.97.2","libs":{"sap.ui.core":{},"sap.fe.templates":{}}},"models":{"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"},"i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}}},"routing":{"routes":[{"pattern":":?query:","name":"BooksList","target":"BooksList"},{"pattern":"Books({key}):?query:","name":"BooksObjectPage","target":"BooksObjectPage"}],"targets":{"BooksList":{"type":"Component","id":"BooksList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"Books","variantManagement":"Page","navigation":{"Books":{"detail":{"route":"BooksObjectPage"}}}}}},"BooksObjectPage":{"type":"Component","id":"BooksObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"Books"}}}}},"contentDensities":{"compact":true,"cozy":true}},"sap.platform.abap":{"_version":"1.1.0","uri":""},"sap.platform.hcp":{"_version":"1.1.0","uri":""},"sap.fiori":{"_version":"1.1.0","registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"zlablibrary"}}'
}});
