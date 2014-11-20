<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:dc="http://purl.org/dc/elements/1.1/" 
                xmlns:diavgeia="http://diavgeia.gov.gr/schema/model/diavgeia-decision-0.1"
                xmlns:jxt="http://apache.org/cocoon/templates/jx/1.0">
    <xsl:param name="type1"/>
    <xsl:param name="id1"/>
    <xsl:param name="type"/>
    <xsl:param name="relative_path" />
  <xsl:template match="foo">
    <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>ΝΟΜΟΘΕΣΙ@</title>
        <meta name="keywords" content="" />
        <meta name="description" content="Η ελληνική νομοθεσία τώρα στο ανοιχτά στο διαδίκτυο!" />
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'/>
        <link href="{$relative_path}css/styles.css" rel="stylesheet"/>
        <link href='http://fonts.googleapis.com/css?family=Jura&amp;subset=latin,greek' rel='stylesheet' type='text/css'/>
        <script src="http://code.jquery.com/jquery-1.9.1.js">//</script>
        <script>
            $(function(){
               $('html, body').animate({scrollTop:$('#<xsl:value-of select="$type1"/>-<xsl:value-of select="$id1"/>').position().top}, 'slow');
                return false;
            });
        </script>
        </head>
        <body  style="background: url('{$relative_path}images/background3.jpg') repeat;">
            <div id="wrapper">
                <div id="header2" style="background-image:url('{$relative_path}images/header.jpg')">
                    <div id="title"><h1>ΝΟΜΟΘΕΣΙ@</h1></div>
                    <div id="header_menu">
                        <ul>
                            <li><a href="{$relative_path}">Αρχική</a></li>
                            <li><a href="{$relative_path}developer">Πληροφορίες</a></li>
                            <li><a href="{$relative_path}about">Σχετικά</a></li>
                            <li><a href="{$relative_path}about">Επικοινωνία</a></li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <div id="content_column">
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/>
                            </xsl:attribute><div class="button21">Τρέχoυσα  Έκδοση</div></a><br/><br/>
                        <a><xsl:attribute name="href">
                           <xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/>/enacted
                            </xsl:attribute><div class="button2">Πρώτη Έκδοση</div></a><br/><br/>
                        <a style="color: #fff;">
                             <xsl:attribute name="href">
                             <xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/data.xml
                             </xsl:attribute><div class="button">XML Μορφή</div></a><br/><br/>
                        <a style="color: #fff;">
                             <xsl:attribute name="href">
                             <xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/data.rdf
                             </xsl:attribute><div class="button">RDF Μορφή</div></a><br/><br/>
                        <a style="color: #fff;">
                            <div class="button">PDF Μορφή</div></a>
                    </div>
                    <div id="content_body">
                        <div id="content_text">
                          <div id="content_bar">
                                 <ul>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1.5em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/contents</xsl:attribute>Περιεχόμενα</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1.5em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if></xsl:attribute>Κείμενο</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1.5em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/timeline</xsl:attribute>Χρονολόγιο</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1.5em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/citations</xsl:attribute>Παραπομπές</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1.5em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/plain</xsl:attribute>Κείμενο Fullscreen</a>
                                    </li>
                                 </ul>
                                </div>
                                <br/>
                                <br/>
                                <div id="content_table1">
                        <!-- Print legal document's info -->
                        <table border="0">
                        <tr><td>ΦΕΚ:&#160;</td> 
                            <td><xsl:value-of select="Legislation/Metadata/diavgeia:fek/issue"/>
                        / <xsl:value-of select="Legislation/Metadata/diavgeia:fek/year"/>
                        / <xsl:value-of select="Legislation/Metadata/diavgeia:fek/fekNumber"/>
                        </td></tr>
                        <tr>
                            <td>ΚΩΔΙΚΟΣ ΑΠΟΦΑΣΗΣ:&#160;</td>
                            <td> <xsl:value-of select="Legislation/Metadata/decisionType"/>
                            &#160; <xsl:value-of select="Legislation/Metadata/Year"/>
                            / <xsl:value-of select="Legislation/Metadata/Number"/>
                            </td>
                        </tr>
                        <tr>
                            <td>ΗΜΕΡΟΜΗΝΙΑ ΕΚΔΟΣΗΣ:&#160;</td> 
                            <td>
                                <xsl:value-of select="Legislation/Metadata/dc:created"/>
                               
                            </td>
                           
                        </tr>
                        <tr>
                            <td>ΥΠΟΓΡΑΦΗ:&#160;</td> 
                            <td>
                                <xsl:for-each select="Legislation/Metadata/diavgeia:signer">
                                <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/>signer/<xsl:value-of select="@uid"/></xsl:attribute>
                                <xsl:value-of select="diavgeia:firstName"/>&#160;
                                <xsl:value-of select="diavgeia:lastName"/>
                                </a>
                                <xsl:choose>
                                <xsl:when test="position() != last()">,&#160;</xsl:when>
                                </xsl:choose>
                                </xsl:for-each>
                            </td>
                           
                        </tr>
                         <tr>
                            <td>ΣΧΕΤΙΚΑ ΜΕ:&#160;</td> 
                            <td>
                                <xsl:for-each select="Legislation/Metadata/diavgeia:tag">
                                <xsl:value-of select="diavgeia:label"/>
                                <xsl:choose>
                                <xsl:when test="position() != last()">,&#160;</xsl:when>
                                </xsl:choose>
                               </xsl:for-each>
                            </td>
                           
                        </tr>
                        </table>
                                </div>
                        <br/>
                        <!-- Print legal document's legal text -->
                        <h4>
                            <xsl:value-of select="Legislation/Metadata/dc:title"/>
                        </h4>
                             <br/>
                             <xsl:for-each select="Legislation/Body/Article">
                                <div><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
                                <p>
                                    <h5>Άρθρο
                                        <xsl:value-of select="Number"/>
                                    </h5>
                                    <xsl:if test="Title">
                                    <h6>
                                        <xsl:value-of select="Title"/>
                                     </h6>
                                     </xsl:if>
                                    <br/>
                                    <ol>
                                    <xsl:for-each select="P">
                                        <div><xsl:attribute name="id">
                                            <xsl:value-of select="@DocumentURI"/>
                                            </xsl:attribute>
                                        <li>
                                         <xsl:for-each select="P2">
                                             <xsl:value-of select="Text"/>&#160;
                                         </xsl:for-each>
                                         <xsl:for-each select="List">
                                             <ol style="list-style-type:lower-greek">
                                             <xsl:for-each select="Case">
                                                 <li>
                                                     <xsl:value-of select="Text"/>
                                                 </li>
                                             </xsl:for-each>
                                             </ol>
                                         </xsl:for-each>
                                         <xsl:for-each select="Modification">

                                            <div id="modification" >
                                             <xsl:if test="P">
                                                <ol>
                                                <xsl:for-each select="P">
                                                    <li>
                                                        <xsl:attribute name="value">
                                                        <xsl:value-of select="Number"/>
                                                        </xsl:attribute>
                                                     <xsl:for-each select="P2">
                                                         <xsl:value-of select="Text"/>&#160;
                                                     </xsl:for-each>
                                                     <xsl:for-each select="List">
                                                         <ol style="list-style-type:lower-greek">
                                                         <xsl:for-each select="Case">
                                                             <li>
                                                                 <xsl:value-of select="Text"/>
                                                             </li>
                                                         </xsl:for-each>
                                                         </ol>
                                                     </xsl:for-each>
                                                    </li> 
                                                </xsl:for-each>
                                                </ol>
                                             </xsl:if>
                                             <xsl:if test="P2">
                                                    <xsl:for-each select="P2">
                                                    <xsl:value-of select="Text"/>&#160;
                                                    </xsl:for-each>
                                             </xsl:if>
                                             <xsl:if test="Case">
                                                 <ol>   
                                                <xsl:for-each select="Case">
                                                 <li><xsl:attribute name="value">
                                                        <xsl:value-of select="Value"/>
                                                        </xsl:attribute>
                                                     <xsl:value-of select="Text"/>
                                                 </li>
                                                </xsl:for-each>
                                                 </ol>
                                             </xsl:if>
                                            </div>
                                         </xsl:for-each>
                                         <xsl:if test="Table">
                                             <div id="law_table">
                                             <xsl:copy-of select="Table"/>
                                             </div>
                                         </xsl:if>
                                        </li> 
                                        </div>                                                           
                                    </xsl:for-each>
                                    </ol>
                                </p>
                                </div>
                             </xsl:for-each>
                    </div>
                    </div>
                </div>
                <div id="footer" style="background-image:url('{$relative_path}images/footer.jpg')">   
                <br/>
            <br/>
            <br/>
            <h6>Τμήμα Πληροφορικής &amp; Τηλ/νωνιών ΕΚΠΑ - Open Data&#160;&#160; <img src="{$relative_path}images/rdf.png" width="15"/> </h6>
            
                </div>
                </div>
        </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

