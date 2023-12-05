<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Meteo</title>
            </head>
            <body>
                <h2>Représentation des données Météo de la date : 2006-1-1</h2>
                <xsl:for-each select="meteo/mesure[@date='2006-1-1']">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Ville</th>
                                <th>Température</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="ville">
                                <tr>
                                    <td><xsl:value-of select="@nom"/></td>
                                    <td><xsl:value-of select="@temperature"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    <!-- Commentaire ce  -->
                    <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="800">
                        <line x1="20" y1="400" x2="1000" y2="400" stroke="black" stroke-width="1"></line>
                        <line x1="20" y1="400" x2="20" y2="10" stroke="black" stroke-width="1"></line>
                        <desc>Commentaire</desc>
                        <xsl:for-each select="ville">
                            <xsl:variable name="XV" select="position()*80"/>
                            <xsl:variable name="H" select="@temperature*10" />
                            <xsl:variable name="YV" select="400-$H"/>
                            <text x="{$XV}" y="420" stroke="blue">
                                <xsl:value-of select="@nom"/>
                            </text>
                            <rect width="20" height="{$H}" x="{$XV}" y="{$YV}" fill="yellow" stroke="blue">
                                <animate attributeName="height" from="0" to="{$H}" dur="1s"></animate>
                                <animate attributeName="y" from="400" to="{$YV}" dur="1s"></animate>
                            </rect>
                        </xsl:for-each>
                    </svg>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>