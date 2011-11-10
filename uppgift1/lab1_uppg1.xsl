<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template match="/">
	<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html" charset="UTF8"></meta>
		<link rel="stylesheet" href="style.css" type="text/css" />;
	</head>
	<body>
		<h1>XSLT</h1>
		<div>
			<h2>Sorterat på pris</h2>
			<table>
				<tr>
					<th colspan="2">Produkter för 10 kronor och billigare</th>
				</tr>
				<xsl:apply-templates select='//produkt[pris&lt;11]'/>
			</table>
			<table>
				<tr>
					<th colspan="2">Produkter mellan 11 och 19 kronor</th>
				</tr>
				<xsl:apply-templates select="//produkt[pris &gt;= 11 and pris &lt; 20]" />
			</table>
			<table>
				<tr>
					<th colspan="2">Produkter för 20 kronor och dyrare</th>
				</tr>
				<xsl:apply-templates select="//produkt[pris &gt;= 20]" />
			</table>
		</div>
		<div>
			<h2>Sorterat på namn</h2>
			<table>
				<xsl:apply-templates select="//produkt">
					<xsl:sort select="produktnamn"></xsl:sort>
				</xsl:apply-templates>
			</table>
		</div>
	</body>
	</html>
</xsl:template>

<xsl:template match="produkt">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 0">
			<tr>
				<td><xsl:value-of select="produktnamn"/></td>
				<td><xsl:value-of select="pris"/></td>
			</tr>
		</xsl:when>
		<xsl:when test="position() mod 2 = 1">
			<tr class="odd">
				<td><xsl:value-of select="produktnamn"/></td>
				<td><xsl:value-of select="pris"/></td>
			</tr>
		</xsl:when>
	</xsl:choose>
		
</xsl:template>

</xsl:stylesheet>