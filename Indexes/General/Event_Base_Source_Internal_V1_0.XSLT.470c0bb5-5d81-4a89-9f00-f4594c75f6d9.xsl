<?xml version="1.0" encoding="UTF-8" ?>

<!-- Index processing for Base Event -->
<xsl:stylesheet xpath-default-namespace="event-logging:3" xmlns="records:2" xmlns:stroom="stroom" xmlns:sm="stroom-meta" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

  <!-- Index Fields - EventTime and EventSource
  
  EventTime - Date - Keyword
  ReceiptTime - Date - Keyword
  
  InitiatingUser.Id - String - Keyword
  InitiatingUser.Domain - String - Keyword
  InitiatingUser.Type - String - Keyword
  
  RunAsUser.Id - String - Keyword
  RunAsUser.Domain - String - Keyword
  RunAsUser.Type - String - Keyword
  
  System.Name - String - Keyword
  System.Environment - String - Keyword
  System.SecurityDomain - String - Keyword (Schema 4.0.0 and beyond)
  
  -->

  <!-- Index the tims -->
  <xsl:template match="EventTime/TimeCreated">
    <data name="EventTime">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventTime/TimeSource/Data[@Name='receiptTime']">
    <data name="ReceiptTime">
      <xsl:attribute name="value" select="@Value" />
    </data>
  </xsl:template>

  <!-- Index the Initiating User -->
  <xsl:template match="EventSource/User/Id">
    <data name="InitiatingUser.Id">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/User/Domain">
    <data name="InitiatingUser.Domain">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/User/Type">
    <data name="InitiatingUser.Type">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- Index the RunAs User -->
  <xsl:template match="EventSource/RunAs/Id">
    <data name="RunAsUser.Id">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/RunAs/Domain">
    <data name="RunAsUser.Domain">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/RunAs/Type">
    <data name="RunAsUser.Type">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- System -->
  <xsl:template match="EventSource/System/Name">
    <data name="System.Name">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/System/Environment">
    <data name="System.Environment">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/System/SecurityDomain">
    <data name="System.SecurityDomain">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- -->
</xsl:stylesheet>
