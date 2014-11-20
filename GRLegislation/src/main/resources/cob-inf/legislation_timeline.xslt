<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:diavgeia="http://diavgeia.gov.gr/schema/model/diavgeia-decision-0.1">
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
        <meta name="google-translate-customization" content="d04b9807188f6071-f105a0214bb60244-gae9357c6b9494053-1c"></meta>
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Jura&amp;subset=latin,greek' rel='stylesheet' type='text/css'/>
  
        <link href="{$relative_path}css/styles.css" rel="stylesheet"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">//</script>
        <script type="text/javascript">
           $("document").ready(function(){
            $(window).scrollTop($('#<xsl:value-of select="$type1"/>-<xsl:value-of select="$id1"/>').offset().top);
           })
        </script>
        </head>
        <body  style="background: url('{$relative_path}images/background3.jpg') repeat;" class="notranslate">
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
                            </xsl:attribute><div class="button21">Τρέχουσα Έκδοση</div></a><br/><br/>
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
		    <div id="google_translate_element"></div>
                    <script type="text/javascript">
                                        function googleTranslateElementInit() {
                                          new google.translate.TranslateElement({pageLanguage: 'el', includedLanguages: 'en,ru,uk,ur,bn', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, autoDisplay: false}, 'content_text');
                                        }
                                    </script>
                                    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">//</script>
                    <div id="content_body">
                        <div id="content_text" class="translate">
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
                        <h4>
                            <xsl:value-of select="Legislation/Metadata/dc:title"/>
                        </h4>
                         <br/>
                         <br/>
                         <!--<iframe src='http://cdn.knightlab.com/libs/timeline/latest/embed/index.html?source=0AvRJs1S16yopdFVZYjN0SG5FLWNUdmlKVHlKOHc0Vmc&amp;font=PTSerif-PTSans&amp;lang=el' width='100%' height='500' frameborder='0'></iframe>-->
                         <h2>  Η υπηρεσία δεν είναι ακόμη διαθέσιμη</h2>
                         <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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