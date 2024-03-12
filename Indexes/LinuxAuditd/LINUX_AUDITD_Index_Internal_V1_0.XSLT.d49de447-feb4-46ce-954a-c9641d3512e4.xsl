<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xpath-default-namespace="event-logging:3" xmlns="records:2" xmlns:stroom="stroom" xmlns:sm="stroom-meta" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

  <!-- Include the standard Stroom internal base indices -->
  <xsl:import href="Event-Base-Source-Internal-V1.0" />
  <xsl:import href="Event-Base-Device-Internal-V1.0" />
  <xsl:import href="Event-Base-Client-Internal-V1.0" />
  <xsl:import href="Event-Base-Server-Internal-V1.0" />
  <xsl:import href="Event-Base-Outcome-Internal-V1.0" />

  <!-- Match the root -->
  <xsl:template match="/Events">
    <records xsi:schemaLocation="records:2 file://records-v2.0.xsd" version="2.0">
      <xsl:apply-templates />
    </records>
  </xsl:template>

  <!-- -->
  <xsl:template match="Event">
    <record>
      <data name="StreamId">
        <xsl:attribute name="value" select="@StreamId" />
      </data>
      <data name="EventId">
        <xsl:attribute name="value" select="@EventId" />
      </data>
      <xsl:apply-templates select="*" />
    </record>
  </xsl:template>

  <!-- Event Type Id and Action -->
  <xsl:template match="EventDetail/TypeId">
    <data name="Event.TypeId">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <xsl:template match="EventDetail">
    <xsl:for-each select="*">
      <xsl:if test="not(matches(name(), 'TypeId|Description|Classification|Purpose'))">
        <data name="Event.Action">
          <xsl:attribute name="value" select="name()" />
        </data>
      </xsl:if>
    </xsl:for-each>
    <xsl:apply-templates />
  </xsl:template>

  <!-- Index the user various ways -->
  <xsl:template match="User[not(parent::EventSource)]">
    <xsl:if test="Id">
      <data name="SubjectUser.Id" analyzer="KEYWORD">
        <xsl:attribute name="value" select="Id" />
      </data>
    </xsl:if>
    <xsl:if test="Domain">
      <data name="SubjectUser.Domain" analyzer="KEYWORD">
        <xsl:attribute name="value" select="Domain" />
      </data>
    </xsl:if>
    <xsl:if test="Type">
      <data name="SubjectUser.Type" analyzer="KEYWORD">
        <xsl:attribute name="value" select="Type" />
      </data>
    </xsl:if>
  </xsl:template>

  <!-- Add ip address -->
  <xsl:template match="IPAddress[not(ancestor::EventSource)]">
    <data name="Subject.IPAddress">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- Add host name -->
  <xsl:template match="HostName[not(ancestor::EventSource)]">
    <data name="Subject.HostName">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- Add command and arguments -->
  <xsl:template match="Process/Command">
    <data name="Process.Command">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="Process/Arguments[text() !='']">
    <data name="Process.Arguments">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="Process/ProcessId">
    <data name="Process.Id">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="Process/Type">
    <data name="Process.Type">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- Additional attributes -->
  <xsl:template match="Data[@Name='tty']">
    <data name="Tty" value="{@Value}" />
  </xsl:template>
  <xsl:template match="Data[@Name='cwd']">
    <data name="WorkingDirectory" value="{@Value}" />
  </xsl:template>
  <xsl:template match="Data[@Name='exe']">
    <data name="Executable" value="{@Value}" />
  </xsl:template>
  <xsl:template match="Data[@Name='Proctitle']">
    <data name="ProcTitle" value="{@Value}" />
  </xsl:template>
  <xsl:template match="Data[@Name='filterKey']">
    <data name="FilterKey" value="{@Value}" />
  </xsl:template>

  <!-- File related -->
  <xsl:template match="File/Type">
    <data name="File.Type" analyzer="KEYWORD">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>
  <xsl:template match="File/Path">
    <data name="File.Path" analyzer="KEYWORD">
      <xsl:attribute name="value" select="." />
    </data>
  </xsl:template>

  <!-- Suppress other text -->
  <xsl:template match="text()" />
</xsl:stylesheet>
