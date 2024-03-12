<?xml version="1.0" encoding="UTF-8" ?>

<!-- Index processing for Base Event Outcome -->
<xsl:stylesheet xpath-default-namespace="event-logging:3" xmlns="records:2" xmlns:stroom="stroom" xmlns:sm="stroom-meta" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

  <!-- Index Fields - Outcome
  
  Outcome.Success - String - Keyword
  Outcome.Permitted - String - Keyword
  Outcome.Description - String - Keyword
  Outcome.Reason - String - Keyword
  
  -->

  <!-- Index the Outcome -->
  <xsl:template match="Outcome/Success">
    <data name="Outcome.Success">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="Outcome/Permitted">
    <data name="Outcome.Permitted">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="Outcome/Description">
    <data name="Outcome.Description">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="Outcome/Reason">
    <data name="Outcome.Reason">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- -->
</xsl:stylesheet>
