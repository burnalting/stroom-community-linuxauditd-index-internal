<?xml version="1.0" encoding="UTF-8" ?>

<!-- Index processing for Base Event Devices-->
<xsl:stylesheet xpath-default-namespace="event-logging:3" xmlns="records:2" xmlns:stroom="stroom" xmlns:sm="stroom-meta" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

  <!-- Index Fields - EventSource Device
  
  Device.HostName - String - Keyword
  Device.IPAddress - String - Keyword
  
  -->

  <!-- Index the Device -->
  <xsl:template match="EventSource/Device/HostName">
    <data name="Device.HostName">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="EventSource/Device/IPAddress">
    <data name="Device.IPAddress">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- -->
</xsl:stylesheet>
