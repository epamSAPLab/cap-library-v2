//@ui5-bundle zlab/zlabauthor/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"zlab/zlabauthor/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("zlab.zlabauthor.Component",{metadata:{manifest:"json"}})});
},
	"zlab/zlabauthor/i18n/i18n.properties":'# This is the resource bundle for zlabauthor\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Authors\n\n#YDES: Application description\nappDescription=A Fiori application.\n\nflpTitle=Manage Authors\n\nflpSubtitle=\n',
	"zlab/zlabauthor/manifest.json":'{"_version":"1.32.0","sap.app":{"id":"zlab.zlabauthor","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"1.0.0"},"title":"{{appTitle}}","description":"{{appDescription}}","dataSources":{"mainService":{"uri":"library/","type":"OData","settings":{"odataVersion":"4.0"}}},"offline":false,"resources":"resources.json","sourceTemplate":{"id":"ui5template.fiorielements.v4.lrop","version":"1.0.0"},"crossNavigation":{"inbounds":{"zlab-zlabauthor-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"Authors","action":"manage","title":"{{flpTitle}}","subTitle":"{{flpSubtitle}}","icon":"sap-icon://customer","indicatorDataSource":{"dataSource":"mainService","path":"/dynamic_dest/zlablibrary-app-srv/library/Authors/$count","refresh":10}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"resources":{"js":[],"css":[]},"dependencies":{"minUI5Version":"1.97.2","libs":{"sap.ui.core":{},"sap.fe.templates":{}}},"models":{"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"},"i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}}},"routing":{"routes":[{"pattern":":?query:","name":"AuthorsList","target":"AuthorsList"},{"pattern":"Authors({key}):?query:","name":"AuthorsObjectPage","target":"AuthorsObjectPage"},{"pattern":"Authors({key})/book({key2}):?query:","name":"BooksObjectPage","target":"BooksObjectPage"}],"targets":{"AuthorsList":{"type":"Component","id":"AuthorsList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"Authors","variantManagement":"Page","navigation":{"Authors":{"detail":{"route":"AuthorsObjectPage"}}}}}},"AuthorsObjectPage":{"type":"Component","id":"AuthorsObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"Authors","navigation":{"book":{"detail":{"route":"BooksObjectPage"}}}}}},"BooksObjectPage":{"type":"Component","id":"BooksObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"Books"}}}}},"contentDensities":{"compact":true,"cozy":true}},"sap.platform.abap":{"_version":"1.1.0","uri":""},"sap.platform.hcp":{"_version":"1.1.0","uri":""},"sap.fiori":{"_version":"1.1.0","registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"zlablibrary"}}'
}});