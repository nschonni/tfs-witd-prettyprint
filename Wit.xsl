<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:witd="http://schemas.microsoft.com/VisualStudio/2008/workitemtracking/typedef">
  <xsl:output method="html" encoding="utf-16"/>
  <xsl:template match="FIELDS">
    <xsl:for-each select="FIELD">
      <a href='#{@refname}'>
        <xsl:value-of select="@refname" />
      </a>
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="REASONS">
    Default Reason: <xsl:value-of select="DEFAULTREASON/@value" /><br />
    <xsl:for-each select="REASON">
      <a href='#{@refname}'>
        <xsl:value-of select="@refname" />
      </a>
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ACTIONS">
    <ul>
      <xsl:for-each select="ACTION">
        <li>
          <xsl:value-of select="@value" />
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="FIELD">
    Type: <xsl:value-of select="@type"/><br />
    <xsl:if test="@syncnamechanges">
      Since this field has Sync Name Changes, <strong>ensure this is a UserName field</strong><br />
    </xsl:if>
    <xsl:if test="@reportingname">
      Formula: <xsl:value-of select="@formula"/><br />
      Reporting Name: <xsl:value-of select="@reportingname"/><br />
      Reporting RefName: <xsl:value-of select="@reportingrefname"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="ALLOWEDVALUES">
    <li>
      Allows values from the following (<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>ALLOWEDVALUES</a>):
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="ALLOWEXISTINGVALUE">
    <li>
      Field can retain an existing value (<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>ALLOWEXISTINGVALUE</a>)
    </li>
  </xsl:template>
  <xsl:template match="CANNOTLOSEVALUE">
    <li>
      Users cannot clear a field of all values after a value has been specified (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>CANNOTLOSEVALUE</a>).
    </li>
  </xsl:template>
  <xsl:template match="COPY">
    <li>
      <xsl:choose>
        <xsl:when test="@from='clock'">
          Copy the time from the system clock
        </xsl:when>
        <xsl:when test="@from='currentuser'">
          Copy the name of the user who is logged on
        </xsl:when>
        <xsl:when test="@from='field'">
          Copy the value from <a href='#{@field}'>
            <xsl:value-of select="@field" />
          </a>
        </xsl:when>
        <xsl:when test="@from='value'">
          Copy the value "<xsl:value-of select="@value"/>"
        </xsl:when>
      </xsl:choose>
      (<a href='https://msdn.microsoft.com/en-us/library/ms194948.aspx'>COPY</a>)
    </li>
  </xsl:template>
  <xsl:template match="DEFAULT">
    <li>
      <xsl:choose>
        <xsl:when test="@from='clock'">
          Defaults to the time from the system clock
        </xsl:when>
        <xsl:when test="@from='currentuser'">
          Defaults to the name of the user who is logged on
        </xsl:when>
        <xsl:when test="@from='field'">
          Defaults to the value from <a href='#{@field}'>
            <xsl:value-of select="@field" />
          </a>
        </xsl:when>
        <xsl:when test="@from='value'">
          Defaults to the value "<xsl:value-of select="@value"/>"
        </xsl:when>
      </xsl:choose>
      (<a href='https://msdn.microsoft.com/en-us/library/ms194948.aspx'>DEFAULT</a>)
    </li>
  </xsl:template>
  <xsl:template match="EMPTY">
    <li>
      Clears the field of any value that it contains and makes it read-only (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>EMPTY</a>)
    </li>
  </xsl:template>
  <xsl:template match="FROZEN">
    <li>
      As soon as a value is saved, the value can no longer be modified (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>FROZEN</a>)
    </li>
  </xsl:template>
  <xsl:template match="HELPTEXT">
    <!-- <p><xsl:value-of select="."/></p> -->
  </xsl:template>
  <xsl:template match="MATCH">
    <li>
      Must match the pattern "<xsl:value-of select="@pattern"/>"
      (<a href='https://msdn.microsoft.com/en-us/library/ms404842.aspx'>MATCH</a>)
    </li>
  </xsl:template>
  <xsl:template match="NOTSAMEAS">
    <li>
      Prevent the field from having the same value as <a href='#{@field}'>
        <xsl:value-of select="@field" />
      </a>
      (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>NOTSAMEAS</a>)
    </li>
  </xsl:template>
  <xsl:template match="PROHIBITEDVALUES">
    <li>
      Dissallows values from the following (<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>PROHIBITEDVALUES</a>):
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="READONLY">
    <li>
      Cannot Modify the value (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>READONLY</a>)
    </li>
  </xsl:template>
  <xsl:template match="REQUIRED">
    <li>
      Users must specify a value for the field (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>REQUIRED</a>)
      <xsl:call-template name="for-not-permissions" />
    </li>
  </xsl:template>
  <xsl:template match="SERVERDEFAULT">
    <li>
      <xsl:choose>
        <xsl:when test="@from='clock'">
          Defaults to the time from the server's clock when saved to the database
        </xsl:when>
        <xsl:when test="@from='currentuser'">
          Defaults to the name of the user, but only recored when saved to the database
        </xsl:when>
      </xsl:choose>
      (<a href='https://msdn.microsoft.com/en-us/library/ms194948.aspx'>SERVERDEFAULT</a>)
    </li>
  </xsl:template>
  <xsl:template match="SUGGESTEDVALUES">
    <li>
      Users are free to enter their own values, but values are suggested from the following (<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>SUGGESTEDVALUES</a>):
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="VALIDUSER">
    <li>
      Restricts work items from being modified by users who belong to the group
      <xsl:choose>
        <xsl:when test="@group">
          "<xsl:value-of select="@group"/>"
        </xsl:when>
        <xsl:otherwise>
          "Team Foundation Valid Users"
        </xsl:otherwise>
      </xsl:choose>
      (<a href='https://www.visualstudio.com/en-us/docs/work/reference/apply-rule-work-item-field#scope'>VALIDUSER</a>)
    </li>
  </xsl:template>
  <xsl:template match="WHEN">
    <li>
      When the field <a href='#{@field}'>
        <xsl:value-of select="@field" />
      </a> equals "<xsl:value-of select="@value" />", the following rules apply (<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHEN</a>):
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="WHENNOT">
    <li>
      When the field <a href='#{@field}'>
        <xsl:value-of select="@field" />
      </a> <strong>DOES NOT</strong> equal "<xsl:value-of select="@value" />", the following rules apply (<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHENNOT</a>):
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="WHENCHANGED">
    <li>
      When the field <a href='#{@field}'>
        <xsl:value-of select="@field" />
      </a> <strong>HAS</strong> changed, following rules apply (<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHENCHANGED</a>):
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="WHENNOTCHANGED">
    <li>
      When the field <a href='#{@field}'>
        <xsl:value-of select="@field" />
      </a> <strong>HAS NOT</strong> changed, following rules apply (<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHENNOTCHANGED</a>)
      <ul>
        <xsl:apply-templates select="node()" />
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="GLOBALLIST">
    <li>
      (<a href='https://msdn.microsoft.com/en-us/library/ms194977.aspx'>Global List</a>): <xsl:value-of select="@name"/>
    </li>
  </xsl:template>
  <xsl:template match="LISTITEM">
    <li>
      <xsl:choose>
        <xsl:when test="starts-with(@value, '[project]')">
          The project level group "<xsl:value-of select="substring(@value, 11)"/>"
        </xsl:when>
        <xsl:when test="starts-with(@value, '[global]')">
          The collection level group "<xsl:value-of select="substring(@value, 8)"/>"
        </xsl:when>
        <xsl:when test="starts-with(@value, '[Team Foundation]')">
          The server level group "<xsl:value-of select="substring(@value, 17)"/>"
        </xsl:when>
        <xsl:otherwise>
          "<xsl:value-of select="@value"/>"
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>
  <xsl:template name="for-not-permissions">
    <xsl:if test="@for">
      Allowed for users in the group <xsl:value-of select="@for"/>.
    </xsl:if>
    <xsl:if test="@not">
      Dissallowed for users in the group <xsl:value-of select="@not"/>.
    </xsl:if>
  </xsl:template>
  <xsl:template match="/">
    <head>
      <title>WIT Report</title>
      <style type="text/css">
        body{ text-align: left; width: 95%;  font-family: Calibri, sans-serif; }

        table{ margin-left:60px; border: none;  border-collapse: separate;  width: 90%; }
        th{ background: #d0d0d0;  font-weight: bold;  font-size: 16pt;  text-align: left; }
        tr{ background: #eeeeee}
        td, th{
        font-family:'Segoe UI'; font-weight:lighter;
        font-size: 12pt;  padding: 10px;  border: none; }
        h1 {
        margin-top:10px;
        font-size:xx-large;
        font-weight:lighter;
        font-family:'Segoe UI';
        }

      </style>
    </head>
    <body>
      <h1>
        WIT Report for <xsl:value-of select="//witd:WITD/WORKITEMTYPE/@name"/>
      </h1>
      <p>
        <xsl:value-of select="//witd:WITD/WORKITEMTYPE/DESCRIPTION"/>
      </p>
      <h2>Fields</h2>
      <p>
        <a href='https://msdn.microsoft.com/library/ms194953.aspx'>All FIELD XML element reference</a>
      </p>
      <table>
        <tr>
          <th>Name</th>
          <th>Details</th>
          <th>Rules</th>
        </tr>
        <xsl:for-each select="//witd:WITD/WORKITEMTYPE/FIELDS/FIELD">
          <tr>
            <td>
              <a name='{@refname}' /><xsl:value-of select="@name"/><br />
              (<xsl:value-of select="@refname"/>)
            </td>
            <td>
              <xsl:if test="HELPTEXT">
                Help Text: <xsl:value-of select="HELPTEXT" /><br />
              </xsl:if>
              <xsl:apply-templates select="current()" />
            </td>
            <td>
              <ul>
                <xsl:apply-templates select="node()" />
              </ul>
            </td>
          </tr>
        </xsl:for-each>
      </table>
      <h2>Workflow</h2>
      <p>
        <a href='https://msdn.microsoft.com/en-us/library/gg534715.aspx'>All WORKFLOW XML elements reference</a>
      </p>
      <h3>States</h3>
      <xsl:for-each select="//witd:WITD/WORKITEMTYPE/WORKFLOW/STATES/STATE">
        <h4>
          <xsl:value-of select="@value"/>
        </h4>
        <xsl:apply-templates />
      </xsl:for-each>
      <h3>Transitions</h3>
      <table>
        <tr>
          <th>From</th>
          <th>To</th>
          <th>Allowed</th>
          <th>Reason</th>
          <th>Action</th>
          <th>Fields</th>
        </tr>
        <xsl:for-each select="//witd:WITD/WORKITEMTYPE/WORKFLOW/TRANSITIONS/TRANSITION">
          <tr>
            <td>
              <xsl:value-of select="@from"/>
            </td>
            <td>
              <xsl:value-of select="@to"/>
            </td>
            <td>
              <xsl:choose>
                <xsl:when test="@for">
                  <xsl:value-of select="@for"/>
                </xsl:when>
                <xsl:otherwise>
                  Everyone
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td>
              <xsl:apply-templates select="REASONS" />
            </td>
            <td>
              <xsl:apply-templates select="ACTIONS" />
            </td>
            <td>
              <xsl:apply-templates select="FIELDS" />
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </body>
  </xsl:template>
</xsl:stylesheet>
