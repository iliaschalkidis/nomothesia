<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:dc="http://purl.org/dc/elements/1.1/" 
                xmlns:diavgeia="http://diavgeia.gov.gr/schema/model/diavgeia-decision-0.1"
                xmlns:jxt="http://apache.org/cocoon/templates/jx/1.0">
    <xsl:param name="type1"/>
    <xsl:param name="id1"/>
    <xsl:param name="relative_path" />
    <xsl:param name="type" />


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
            <div id="wrapper2">
                <div id="header2">
                    <div id="header_back">
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="$relative_path"/><xsl:value-of select="Legislation/Metadata/Type"/>/<xsl:value-of select="Legislation/Metadata/Year"/>/<xsl:value-of select="Legislation/Metadata/Number"/><xsl:if test="$type">/<xsl:value-of select="$type"/></xsl:if>
                        </xsl:attribute>
                        <b>
                            &#60;&#160;<u>Πίσω σε πλήρη προβολή</u>
                        </b>
                        </a>
           </div>
                    <div id="title"><br/><h1>&#160;ΝΟΜΟΘΕΣΙ@</h1></div>
                    
                    
                    
                </div>
                <div id="content2">
		    <div id="google_translate_element"></div>
                    <script type="text/javascript">
                                        function googleTranslateElementInit() {
                                          new google.translate.TranslateElement({pageLanguage: 'el', includedLanguages: 'en,ru,uk,ur,bn', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, autoDisplay: false}, 'content_text');
                                        }
                                    </script>
                                    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">//</script>
                    <div id="content_body">
                        <br/><br/>
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
        </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

