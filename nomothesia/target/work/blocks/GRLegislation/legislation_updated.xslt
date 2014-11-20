<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dc="http://purl.org/dc/elements/1.1/" 
                xmlns:diavgeia="http://diavgeia.gov.gr/schema/model/diavgeia-decision-0.1">
    <xsl:param name="type1"/>
    <xsl:param name="id1"/>

   
    
 <xsl:param name="modificationsDoc" select="'PD201210.xml'" />

  <xsl:variable name="existingURIs" select="//@DocumentURI" />
  <!--<xsl:variable name="mods" select="document($modificationsDoc)//Modification/*" />
  <xsl:variable name="mods" >
      <xsl:for-each select="foo/modifications/modification">
      <xsl:copy-of select="document($file)//Modification[@DocumentURI = $moduri]/*" />
      </xsl:for-each>
  </xsl:variable>-->
  
  <xsl:variable name="mods" select="foo/modifications/*" />
  
  <xsl:template match="node() | @*" name="identity">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" />
    </xsl:copy>
  </xsl:template>
  
  <!-- only elements with DocumentURI can be target of modifications -->
  <xsl:template match="*[@DocumentURI]" name="mod-temp">
    <xsl:variable name="currURI" select="@DocumentURI" />
    <xsl:variable name="matchingMod" select="$mods[@DocumentURI = $currURI]" />

    <!-- replacements and deletions -->
    <xsl:choose>
      <xsl:when test="$matchingMod">
        <!-- no output for empty modifications (they are deletions) -->
        <xsl:if test="$matchingMod[*]">
          <xsl:copy-of select="$matchingMod" />
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="identity" />
      </xsl:otherwise>
    </xsl:choose>

    <!-- additions -->
    <xsl:variable name="siblingURI">
      <xsl:call-template name="substring-before-last">
        <xsl:with-param name="string1" select="$currURI" />
        <xsl:with-param name="string2" select="'/'" />
      </xsl:call-template>
      <xsl:text>/</xsl:text>
    </xsl:variable>
    <xsl:copy-of select="$mods[
      number(substring-after(@DocumentURI, $siblingURI)) &gt; 0
      and not(@DocumentURI = $existingURIs)
    ]" />
  </xsl:template>

  <xsl:template name="substring-before-last">
    <xsl:param name="string1" select="''" />
    <xsl:param name="string2" select="''" />

    <xsl:if test="$string1 != '' and $string2 != ''">
      <xsl:variable name="head" select="substring-before($string1, $string2)" />
      <xsl:variable name="tail" select="substring-after($string1, $string2)" />
      <xsl:value-of select="$head" />
      <xsl:if test="contains($tail, $string2)">
        <xsl:value-of select="$string2" />
        <xsl:call-template name="substring-before-last">
          <xsl:with-param name="string1" select="$tail" />
          <xsl:with-param name="string2" select="$string2" />
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>

