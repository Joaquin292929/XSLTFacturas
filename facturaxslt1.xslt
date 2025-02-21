<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Digital</title>
                <style>
                    body {
                        font-family: 'Courier New', Courier, monospace;
                        background-color: #222;
                        color: #eee;
                        padding: 20px;
                    }
                    .container {
                        max-width: 800px;
                        margin: auto;
                        background: #333;
                        padding: 20px;
                        border-radius: 8px;
                    }
                    h2 {
                        text-align: center;
                        color: #ff9800;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }
                    th, td {
                        border: 1px solid #555;
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background: #444;
                    }
                    td {
                        background: #666;
                    }
                    .total {
                        font-weight: bold;
                        color: #ff9800;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h2>Factura Digital</h2>
                    <table>
                        <tr>
                            <th>Fecha</th>
                            <td><xsl:value-of select="//InvoiceIssueDate"/></td>
                        </tr>
                        <tr>
                            <th>Emisor</th>
                            <td><xsl:value-of select="//SellerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>Receptor</th>
                            <td><xsl:value-of select="//BuyerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td class="total"><xsl:value-of select="//InvoiceTotalAmount"/> €</td>
                        </tr>
                        <tr>
                            <th>Moneda</th>
                            <td><xsl:value-of select="//InvoiceCurrencyCode"/></td>
                        </tr>
                    </table>
                    <h3>Detalles de la Factura</h3>
                    <table>
                        <tr>
                            <th>Descripción</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th>Total</th>
                        </tr>
                        <xsl:for-each select="//Items/InvoiceLine">
                            <tr>
                                <td><xsl:value-of select="ItemDescription"/></td>
                                <td><xsl:value-of select="Quantity"/></td>
                                <td><xsl:value-of select="UnitPriceWithoutTax"/> €</td>
                                <td><xsl:value-of select="TotalCost"/> €</td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>