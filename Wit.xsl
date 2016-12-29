<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:witd="http://schemas.microsoft.com/VisualStudio/2008/workitemtracking/typedef">
	<xsl:output method="html" encoding="utf-16"/>
	<xsl:template match="FIELDS">
		<xsl:for-each select="FIELD">
			<a href='#{@refname}'><xsl:value-of select="@refname" /></a>
			<ul>
				<xsl:apply-templates select="node()" />
			</ul>
		</xsl:for-each>
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
		<li>Field can retain an existing value (<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>ALLOWEXISTINGVALUE</a>)</li>
	</xsl:template>
	<xsl:template match="CANNOTLOSEVALUE">
		<li>Users cannot clear a field of all values after a value has been specified (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>CANNOTLOSEVALUE</a>).</li>
	</xsl:template>
	<xsl:template name="for-not-permissions">
		<xsl:if test="@for">
			Allowed for users in the group <xsl:value-of select="@for"/>.
		</xsl:if>
		<xsl:if test="@not">
			Dissallowed for users in the group <xsl:value-of select="@not"/>.
		</xsl:if>
	</xsl:template>
	<xsl:template match="COPY">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194948.aspx'>COPY</a>)</li>
	</xsl:template>
	<xsl:template match="DEFAULT">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194948.aspx'>DEFAULT</a>)</li>
	</xsl:template>
	<xsl:template match="EMPTY">
		<li>Clears the field of any value that it contains and makes it read-only (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>EMPTY</a>)</li>
	</xsl:template>
	<xsl:template match="FROZEN">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>FROZEN</a>)</li>
	</xsl:template>
	<xsl:template match="HELPTEXT">
		<!-- <p><xsl:value-of select="."/></p> -->
	</xsl:template>
	<xsl:template match="MATCH">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms404842.aspx'>MATCH</a>)</li>
	</xsl:template>
	<xsl:template match="NOTSAMEAS">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>NOTSAMEAS</a>)</li>
	</xsl:template>
	<xsl:template match="PROHIBITEDVALUES">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>PROHIBITEDVALUES</a>)</li>
	</xsl:template>
	<xsl:template match="READONLY">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>READONLY</a>)</li>
	</xsl:template>
	<xsl:template match="REQUIRED">
		<li>Users must specify a value for the field (<a href='https://msdn.microsoft.com/en-us/library/ms404857.aspx'>REQUIRED</a>)</li>
	</xsl:template>
	<xsl:template match="SERVERDEFAULT">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194948.aspx'>SERVERDEFAULT</a>)</li>
	</xsl:template>
	<xsl:template match="SUGGESTEDVALUES">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194947.aspx'>SUGGESTEDVALUES</a>)</li>
	</xsl:template>
	<xsl:template match="VALIDUSER">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/dd997577.aspx'>VALIDUSER</a>)</li>
	</xsl:template>
	<xsl:template match="WHEN">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHEN</a>)</li>
	</xsl:template>
	<xsl:template match="WHENNOT">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHENNOT</a>)</li>
	</xsl:template>
	<xsl:template match="WHENCHANGED">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHENCHANGED</a>)</li>
	</xsl:template>
	<xsl:template match="WHENNOTCHANGED">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194966.aspx'>WHENNOTCHANGED</a>)</li>
	</xsl:template>
	<xsl:template match="GLOBALLIST">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194977.aspx'>Globale List</a>): <xsl:value-of select="@name"/></li>
	</xsl:template>
	<xsl:template match="LISTITEM">
		<li>(<a href='https://msdn.microsoft.com/en-us/library/ms194947'>LISTITEM</a>)</li>
	</xsl:template>
	<xsl:template match="/">
		<head>
			<title>WIT Report</title>
			<style type="text/css">
				body{ text-align: left; width: 95%;  font-family: Calibri, sans-serif; }

				table{ margin-left:60px; border: none;  border-collapse: separate;  width: 90%; }

				tr.title td{ background: white;font-size: 26px;  font-weight: bold; }

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

				.ProjectsHeader {

				}
				span.tab{
				padding: 0 80px; /* Or desired space*/
				}
				tr.info td{}
				tr.warning td{background-color:yellow;color:black}
				tr.error td{background-color:red;color:black}

				a:hover{text-transform:uppercase;color: #9090F0;}
			</style>
		</head>
		<body>
			<h1 style="margin-left:60px">WIT Report for <xsl:value-of select="//witd:WITD/WORKITEMTYPE/@name"/></h1>
			<p><xsl:value-of select="//witd:WITD/WORKITEMTYPE/DESCRIPTION"/></p>
			<h2>Fields</h2>
			<p><a href='https://msdn.microsoft.com/library/ms194953.aspx'>All FIELD XML element reference</a></p>
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
			<h2>States</h2>
			<xsl:for-each select="//witd:WITD/WORKITEMTYPE/WORKFLOW/STATES/STATE">
				<h3><xsl:value-of select="@value"/></h3>
				<xsl:apply-templates />
			</xsl:for-each>
			<h2>Transitions</h2>
			<table>
				<tr>
					<th>From</th>
					<th>To</th>
					<th>Allowed</th>
					<th>Fields</th>
				</tr>
				<xsl:for-each select="//witd:WITD/WORKITEMTYPE/WORKFLOW/TRANSITIONS/TRANSITION">
					<tr>
						<td><xsl:value-of select="@from"/></td>
						<td><xsl:value-of select="@to"/></td>
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
						<td><xsl:apply-templates select="FIELDS" /></td>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</xsl:template>
</xsl:stylesheet>
