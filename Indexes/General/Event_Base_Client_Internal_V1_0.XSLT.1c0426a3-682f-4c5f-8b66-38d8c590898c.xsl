<?xml version="1.0" encoding="UTF-8" ?>

<!-- Index processing for Base Event Client-->
<xsl:stylesheet xpath-default-namespace="event-logging:3" xmlns="records:2" xmlns:stroom="stroom" xmlns:sm="stroom-meta" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

  <!-- Index Fields - EventSource/Client
  
  Client.HostName - String - Keyword
  Client.IPAddress - String - Keyword
  
  -->

  <!-- Index the Client -->
  <xsl:template match="EventSource/Client/HostName">
    <data name="Client.HostName">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/Client/IPAddress">
    <data name="Client.IPAddress">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- -->
</xsl:stylesheet>
