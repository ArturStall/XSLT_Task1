<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="style.css"/>
			</head>
			
			<body>
				<xsl:for-each select="event">
					<h3><xsl:text>Event </xsl:text><xsl:value-of select="@id"/></h3>
					<h1><xsl:value-of select="heading"/></h1>
					<a href="url"><xsl:value-of select="external-link/@source"/></a>
					
					<div id="top_block">
						<xsl:for-each select="doc-level">
							<xsl:if test="@position='left'">
								<div id="small_block" class="left">
									<xsl:for-each select="para">
										<p><xsl:value-of select="."/></p>
									</xsl:for-each>
								</div>
							</xsl:if>
							<xsl:if test="@position='center'">
								<div id="small_block" class="center">
									<ul>
										<xsl:for-each select="para/list-item">
											<li><xsl:value-of select="."/></li>
										</xsl:for-each>
									</ul>
								</div>
							</xsl:if>														
							<xsl:if test="doc-level/@position='right'">
								<div id="small_block" class="right">										
									<lable>Date: <xsl:value-of select="doc-level/para/date"/></lable>
									<div id="image">
										<xsl:call-template name="image"/>
									</div>
								</div>
							</xsl:if>							
						</xsl:for-each>
					</div>
					<xsl:call-template name="qa"/>										
				</xsl:for-each>				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="image">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select='doc-level/image/@source'/>
			</xsl:attribute>			
		</img>
		<p><xsl:value-of select="doc-level/image/@description"/></p>
	</xsl:template>
	
	<xsl:template name="qa">
		<div id="bottom_block">
			<div id="question">
				<xsl:text>Questions:</xsl:text>
				<xsl:for-each select="doc-level/qa-block/question">
					<div id="item">
						<xsl:value-of select="."/>
					</div>
				</xsl:for-each>
			</div>
			<div id="answer">
				<xsl:text>Answers:</xsl:text>
				<xsl:for-each select="doc-level/qa-block/answer">
					<div id="item">
						<xsl:value-of select="."/>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	
</xsl:stylesheet>		