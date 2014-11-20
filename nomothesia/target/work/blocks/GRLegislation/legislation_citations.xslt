<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:diavgeia="http://diavgeia.gov.gr/schema/model/diavgeia-decision-0.1">
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
        </head>
        <body  style="background-image:url('{$relative_path}images/background3.jpg')">
            <div id="wrapper">
                <div id="header" style="background-image:url('{$relative_path}images/header.jpg')">
                    <div id="title"><h1>ΝΟΜΟΘΕΣΙ@</h1></div>
                    <div id="header_locale">
                        <table>
                            <tr>
                                <td>
                                    gr
                                </td>
                                <td>
                                    /
                                </td>
                                <td>
                                   en
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="header_menu">
                        <ul>
                            <li><a href="{$relative_path}">Αρχική</a></li>
                            <li><a href="{$relative_path}developer">Πληροφορίες</a></li>
                            <li><a href="{$relative_path}about">Σχετικά</a></li>
                            <li><a href="">Επικοινωνία</a></li>
                        </ul>
                    </div>
                    <div id="header_social">
                        <table>
                            <tr>
                                
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="content">
                    <div id="content_column">
                    <a><xsl:attribute name="href">
                            <xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/>
                            </xsl:attribute><div class="button2">Τρέχων Έκδοση</div></a><br/><br/>
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
                            <div class="button">PDF Μορφή</div></a><br/>
                    </div> 
                    <div id="content_body">
                        <div id="content_text">
                            <div id="content_bar">
                                 <ul>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/contents</xsl:attribute>Περιεχόμενα</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if></xsl:attribute>Κείμενο</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/timeline</xsl:attribute>Χρονολόγιο</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/citations</xsl:attribute>Παραπομπές</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href"><xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>/plain</xsl:attribute>Κείμενο Fullscreen</a>
                                    </li>
                                 </ul>
          
                                </div>
                            <br/>
                            <br/>
                        <table border="0">
                        <tr><td>ΦΕΚ:&#160;</td> 
                            <td><xsl:value-of select="Legislation/Metadata/diavgeia:fek/issue"/>
                        / <xsl:value-of select="Legislation/Metadata/diavgeia:fek/year"/>
                        / <xsl:value-of select="Legislation/Metadata/diavgeia:fek/fekNumber"/>
                        </td></tr>
                        <tr>
                            <td>ΚΩΔΙΚΟΣ ΑΠΟΦΑΣΗΣ:&#160;</td>
                            <td> <xsl:value-of select="Legislation/Metadata/diavgeia:decisionType/diavgeia:label"/>
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
                        <br/>
                        <h4>
                            <xsl:value-of select="Legislation/Metadata/dc:title"/>
                        </h4>
                  
                                                 <br/>
                                                 <div id="citations"><xsl:choose>
                                                <xsl:when test="Legislation/Introduction/Citation">
                                                 Έχοντας υπόψιν τα εξής: 
                                                 <ol>
                                                 <xsl:for-each select="Legislation/Introduction/Citation">
                                                        <li>
                                                            <xsl:choose>
                                                            <xsl:when test="@DocumentURI"><a>
                                                                <xsl:attribute name="href">
                                                        <xsl:value-of select="@DocumentURI"/>
                                                         </xsl:attribute><xsl:value-of select="Text"/></a>
                                                            </xsl:when>
                                                            <xsl:otherwise><xsl:value-of select="Text"/>
                                                            </xsl:otherwise>
                                                            </xsl:choose>
                                                        </li>
                                                 </xsl:for-each>
                                                 </ol>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <h4>Δεν υπάρχουν παραπομπές στο συγκεκριμένο έγγραφο.</h4>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/><br/>
                                                </xsl:otherwise>
                                                 </xsl:choose>
                                                 </div>
                    </div>
                    </div>
                </div>
                <div id="footer" style="background-image:url('{$relative_path}images/footer.jpg')"/>
                <br/>
            <br/>
            <br/>
            <h6>Τμήμα Πληροφορικής &amp; Τηλ/νωνιών ΕΚΠΑ - Open Data&#160;&#160; <img src="{$relative_path}images/rdf.png" width="15"/> </h6>
            </div>
        </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

