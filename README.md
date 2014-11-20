#Nomothesi@ Platform 1.0 Instructions

##Software / Library Dependencies

Java Version: Java™ SE 7
Build Tool: Apache Maven 3.2.1
Web Server: Apache Tomcat 7 (Suggested) / Jetty Server 6.1.7
RDFStore: Sesame Server 2.7.9
XML DB Server: BaseX 7.8.2

##Installation

The project of Nomothesi@ platform is compressed in nomothesia-1.0.0.war file. The .war file in folder /webapps needs to be deployed in a Web Application Server (Apache Tomcat, Jetty) and also collaborates / communicates with 2 external web applications Sesame and BaseX, which also needs to be deployed. We will give instructions of how-to complete installation. After completing installation, you can browse Nomothesi@ platform at http://localhost:8080/nomothesia-1.0.0/GRLegislation/.

1. **Apache Tomcat** (http://tomcat.apache.org/)

Apache Tomcat can be downloaded here (http://tomcat.apache.org/download-70.cgi), depends to the operating system and its distribution. You can find installation instructions here (http://tomcat.apache.org/tomcat-7.0-doc/setup.html). After installation, you can point your browser at this location (http://localhost:8080/) to verify that the deployment succeeded. The easiest way to deploy Nomothesi@ Platform is placing GRLegislation.war in Tomcat's folder /webbapps. You can find information of how-to deploy an application here (http://tomcat.apache.org/tomcat-7.0-doc/deployer-howto.html)

2. **Sesame Server** (http://www.openrdf.org/)

Sesame Server can be downloaded here (http://sourceforge.net/projects/sesame/files/Sesame%202/2.7.11/openrdf-sesame-2.7.11-sdk.zip/download). You can also find the .war files in /webapps folder. The war files needs to be deployed in Apache Tomcat. The easiest way to deploy this application is to place the .war files in webapps folder of Apache Tomcat and restart it. After you have deployed the Sesame Server webapp, you should be able to access it, by default, at path /openrdf-sesame. You can point your browser at this location to verify that the deployment succeeded. You can also manage repositories from the OpenRDF Workbench, which should be available at path /openrdf-workbench.

For the purposes of our project, you need to visit /openrdf-workbench create a new repository called "Legislation"  with type Memory store / persist or Native store and then load our data set from file TEST.owl . You can complete any appropriate action from OpenRDF Workbench's menu.

Any additional information for downloading, installing and interacting with Sesame Server can be found in the website's user's documentation. 

3. **BaseX XML DB Server** (http://basex.org/)

BaseX XML DB Server can be downloaded here (http://files.basex.org/releases/7.8.2/BaseX782.war). You can also find the .war file in /webapps folder. Like Sesame, the war file needs to be deployed in Apache Tomcat. The easiest way to deploy this application is to place the .war file in webapps folder of Apache Tomcat and restart it. After you have deployed the BaseX XML DB Server, you should be able to access it, by default, at path /BaseX782. You can point your browser at this location to verify that the deployment succeeded.

Currently our XML repository is stored in the filesystem, so there is no need for extra steps with BaseX configuration.

Any additional information for downloading, installing and interacting with BaseX XML DB Server can be found in the website's user's documentation. There are also some useful Java examples at http://docs.basex.org/wiki/Java_Examples, which really helps to understand how it works.

##Build up


In case you would like to adjust the code, feel free. In order to use GRLegislation block as dependency you need to install it. First go through terminal to GRLegislation/ directory and execute the following command:

`mvn install`

If everything is fine, you will get a build report message concluding BUILD SUCCESSFUL. Now it's time to package the web application nomothesia. Move into nomothesia/ and call:

`mvn package`

If everything is fine again, you will get a build report message concluding BUILD SUCCESSFUL. Now you will have a new .war file, placed in nomothesia/target/ directory.

You can find additional information for our project below. You can find any additional information about Apache Cocoon at http://cocoon.apache.org/2.2/1159_1_1.html for blocks' construction and at http://cocoon.apache.org/2.2/1362_1_1.html for web application's deployment.

##Configuration

There is a possibility that you need to configure Nomothesi@. For this purpose there is a configuration file called properties.properties, which specify the following information:

XMLDBServer=http://localhost:8080/BaseX782  (BaseX Server path)
XMLDBName=Legislation (BaseX DataBase name)
SesameServer=http://localhost:8080/openrdf-sesame (Sesame Server path)
SesameRepositoryID=Legislation (Sesame Server repository name)
BaseURI=http://www.semanticweb.org/ilias/ontologies/2013/11/untitled-ontology-5#GRLegislation/ (BaseURI of RDF metadata)

CAUTION: Modify this configuration file, only if you are really expertised in Web Application Development.


##Apache Cocoon Framework Overview

Nomothesi@ is implemented as an Apache Cocoon Project. Apache Cocoon is a Spring-based (since version 2.2 of Cocoon) framework built around the concepts of separation of concerns and component-based development. Cocoon implements these concepts around the notion of component pipelines, each component on the pipeline specializing on a particular operation. There are 3 fundamental components generators, transformers and serializers.

*Generators 

Generator is the starting point of an XML pipeline. Usually, it generates XML content as SAX events and initializes pipeline processing. XML content can be either from an XML file or produced from other data models based on request parameters.

*Transformers

A transformer is the central point in a sitemap pipeline. Within a pipeline match, transformers consume SAX events and emit SAX events. It can be compared to an XSL: it gets an XML document (or SAX events), and generates another XML document (or SAX events).

*Serializers

A Serializer is responsible for transforming SAX events to a presentation format. We have Serializers for generating HTML, XML, PDF and of course you can create your own.


+------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                                                          |
|        REQUEST ---> GENERATOR ----> GENERATOR (2) ----> TRANSFORMER ---> TRANSFORMER (2) ---> SERIALIZER ---> RESPONSE                   |
|                                                                                                                                          |
+------------------------------------------------------------------------------------------------------------------------------------------+

*Functionality

The functionality of these 3 parts is combined in pipelines, which are placed in the sitemap, like this:

<map:pipeline id="search">
      <map:match pattern="search">            
            <map:generate type="searchgen"/>
            <map:transform src="search.xslt"/>
            <map:serialize type="xhtml"/>
      </map:match>
</map:pipeline>

Each request matches the appropriate pattern (eg /search). Then the generator (eg searchgen), which are Java classes, act as a Controller to handle the requested function. Generator creates our models(XML files) and push them to the transformer, or just load ready-made models (XML files). We can have multiple generators (e.g. one to load a data model and an other one to create an other data model). The transformers, which are XSLT stylesheets, can act either a Controller either as a View, which means some of them update the model's state and the last one (e.g. search.xslt) creates an output representation for the user. At last, serializer (e.g. XHTML)  is responsible for transforming the output of the last transformer to a presentation format.


## Nomothesi@ Project Components


In our project there are the following components:

*Generators

1. SearchGenarator: has the search functionality. Based on request parameters (search criteria), return the appropriate results as records in a XML file.
2. RDFGenerator: has the functionality to gather RDF metadata. For this purpose connects with the Sesame Server and query (sparql query) our data sets to return any available RDF metadata for specific legal documents.
3. VersionGenerator: has the functionality to gather updated information for specific legal documents. For this purpose connects with the Sesame Server and query (SPARQL query) our data sets to gather RDF metadata for Modifications about specific legal documents. Then uses this information to gather the appropriate Modifications via querying (Xquery) our XML filesystem. Returns these results as records in a XML file.

*Actions

1. UploadAction (DEMO VERSION): has the upload functionality. This is very simple drafting tool. It has been created for development work only.

*Transformers

1. legislation.xslt: uses the input XML file (legal document) to create an output representation of the legal main text in HTML.
2. legislation_updated: uses the input XML file (legal document and modifications) to update this XML file's legal text bases on the modifications.
3. legislation_citations.xslt : uses the input XML file (legal document) to create an output representation of the citations in HTML.
4. legislation_contents.xslt : uses the input XML file (legal document) to create an output representation of the contents in HTML.
5. legislation_timeline.xslt (DEMO VERSION) : uses the input XML file (legal document and info) to create an output representation of this legal document's timeline in HTML.
6. legislation_plain.xslt : uses the input XML file (legal document) to create a plain output representation of the legal main text in HTML, without menu or other information.
7. legislation_pdf.xslt (NOT WORKING!): uses the input XML file (legal document) to create an output representation of the legal main text in PDF.

* There are some more transformers with 'en' tag, which are just English versions of the same transformers. 

*Serializers

We use serializers, which are implemented by Apache Cocoon Framework. These are XHTML, XML and PDF serializers.

*Data Models

Our basic data model is the XML schema. Usually we use pure XML files as data models (objects). There are also 2 classic data models:

1. ModificationBean, which is a classic Java Bean, that we use to load modification records and then tranform them to an XML file.
2. ResultBean, which is also a classic Java Bean, that we use to load search results and transform them to an XML file.
3. Some other Java Beans (eg ArticleBean, PBean) has been partially created but still there is not benefit to use them in this version.

##Demo Sample Files (Legal Documents

PD201154.xml
PD201210.xml
PD201340.xml
LAW20144229.xml


##Test Environment

OS: Ubuntu 13.10
Web Server: Jetty Server 6.1.7
RDFStore: Sesame Server 2.7.9 (on Apache Tomcat 7)
XML DB Server: BaseX 7.8 (on Apache Tomcat 7)

## Known Bugs

1. legislation_updated.xslt: Handling new modifications' addition issue. Deletions and replacements work properly.
2. legislation_pdf.xslt: Can't use Maven dependency for Apache FOP 1.1, Broken links BUG. Greek Characters are not working properly for Apache FOP 1.0.
