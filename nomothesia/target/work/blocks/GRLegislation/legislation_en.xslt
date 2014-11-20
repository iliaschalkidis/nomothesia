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
        <meta name="google-translate-customization" content="d04b9807188f6071-f105a0214bb60244-gae9357c6b9494053-1c"></meta>
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'/>
        <link href="{$relative_path}css/styles.css" rel="stylesheet"/>
        <link href='http://fonts.googleapis.com/css?family=Jura&amp;subset=latin,greek' rel='stylesheet' type='text/css'/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">//</script>
        <script type="text/javascript">
           $("document").ready(function(){
            $(window).scrollTop($('#<xsl:value-of select="$type1"/>-<xsl:value-of select="$id1"/>').offset().top);            
            
             $(window).scroll(
                function() {
                    var t = $(window).scrollTop();
                    if (t > 200) {
                        // define your scroll CSS here
                        ("#content_column").css({"margin-top" : "10px"});
                    }
                }
            );
            
          });
            
         
        </script>
        </head>
        <body  style="background: url('{$relative_path}images/background3.jpg') repeat;" class="notranslate">
            <div id="wrapper">
                <div id="header" style="background-image:url('{$relative_path}images/header.jpg')">
                    <div id="title"><h1>ΝΟΜΟΘΕΣΙ@</h1></div>
                    <div id="header_locale">
                        <table>
                            <tr>
                               
                            </tr>
                        </table>

                    </div>
                    <div id="header_menu">
                        <script type="text/javascript">
           ${request.getAttribute('mods2')}
        </script>
                        <ul>
                            <li><a href="http://localhost:8888/GRLegislation">Home</a></li>
                            <li><a href="">Information</a></li>
                            <li><a href="">Help</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </div>
                    <div id="header_social">
                        <table>
                            <tr>
                                <td>
                                    <h6>Follow us on social media!</h6>
                                </td>
                                <td>
                                    <img src="{$relative_path}images/facebook-logo.png" align="right" width="30" height="30"/>
                                </td>
                                <td>
                                    <img src="{$relative_path}images/twitter-logo.png" align="right" width="30" height="30"/>
                                </td>
                                <td>
                                    <img src="{$relative_path}images/rss-logo.png" align="right" width="25" height="25"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="content">
                    <div id="content_column">
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                            </xsl:attribute><div class="button3" style="width:115px;">Latest&#160;available&#160;(Revised)</div></a><br/><br/>
                        <a><xsl:attribute name="href">
                           <xsl:value-of select="Legislation/Metadata/dc:identifier"/>/enacted
                            </xsl:attribute><div class="button3" style="width:115px;">Original&#160;(As &#160; enacted)</div></a><br/><br/>
                        <a style="color: #fff;">
                             <xsl:attribute name="href">
                             <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                             <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/data.xml
                             </xsl:attribute><div class="button">XML Format</div></a><br/><br/>
                        <a style="color: #fff;">
                             <xsl:attribute name="href">
                              <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                              <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/data.rdf
                             </xsl:attribute><div class="button">RDF Format</div></a><br/><br/>
                        <a style="color: #fff;">
                            <xsl:attribute name="href">
                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                            <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/data.pdf
                           </xsl:attribute><div class="button">PDF Format</div></a>
                        <br/>
                        <br/>
                         <ul style="list-style-type: none; margin:0; padding:0;">
                                   <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1em;">
                                    <a style="color: #fff;">
                                <xsl:attribute name="href">
                                   https://www.facebook.com/sharer/sharer.php?u=<xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                </xsl:attribute>
                                <img src="{$relative_path}images/share.png" width="65px" height="25"></img>
                            </a>
                                   </li>
                                   <li style="font-size: 16px; font-weight: bold; float:left; padding-right:1em;">
                                    <a style="color: #fff;">
                                <xsl:attribute name="href">
                                   http://twitter.com/share?url=<xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                </xsl:attribute>
                                <img src="{$relative_path}images/tweet.png" width="65px" height="25"></img>
                            </a>
                                   </li>
                                </ul>    
                       
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
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href">
                                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                            <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/contents
                                        </xsl:attribute>Contents</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href">
                                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                            <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>
                                        </xsl:attribute>Text</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href">
                                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                            <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/timeline
                                        </xsl:attribute>Timeline</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href">
                                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                            <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/citations
                                        </xsl:attribute>Citations</a>
                                    </li>
                                    <li style="font-size: 16px; font-weight: bold; float:left; padding-right:2em;">
                                        <a><xsl:attribute name="href">
                                            <xsl:value-of select="Legislation/Metadata/dc:identifier"/>
                                            <xsl:if test="$type">
                                                <xsl:value-of select="$type"/></xsl:if>/plain
                                        </xsl:attribute>Fullscreen Text</a>
                                    </li>
                                 </ul>
          
                                </div>
                                <br/>
                                <br/>

                        <table border="0">
                        <tr><td>GAZETTE:&#160;</td> 
                            <td><xsl:value-of select="Legislation/Metadata/diavgeia:fek/issue"/>
                        / <xsl:value-of select="Legislation/Metadata/diavgeia:fek/year"/>
                        / <xsl:value-of select="Legislation/Metadata/diavgeia:fek/fekNumber"/>
                        </td></tr>
                        <tr>
                            <td>SERIAL NUMBER:&#160;</td>
                            <td> <xsl:value-of select="Legislation/Metadata/decisionType"/>
                            &#160; <xsl:value-of select="Legislation/Metadata/Year"/>
                            / <xsl:value-of select="Legislation/Metadata/Number"/>
                            </td>
                        </tr>
                        <tr>
                            <td>DATE ENACTED:&#160;</td> 
                            <td>
                                <xsl:value-of select="Legislation/Metadata/dc:created"/>
                               
                            </td>
                           
                        </tr>
                        <tr>
                            <td>SIGNERS:&#160;</td> 
                            <td>
                                <xsl:for-each select="Legislation/Metadata/diavgeia:signer">
                                <a><xsl:attribute name="href">{$relative_path}signer/<xsl:value-of select="@uid"/></xsl:attribute>
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
                            <td>TAGS:&#160;</td> 
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
                </div>
                <br/>
            <br/>
            <br/>
            <h6>Department of Informatics &amp; Telecommunications UOA - Open Data</h6>
            </div>
        </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

