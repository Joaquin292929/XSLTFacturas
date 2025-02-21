<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/" 
    exclude-result-prefixes="fe">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Simplificada</title>
                <style>
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        margin: 20px;
                        background-color: #f9f9f9;
                    }
                    .container {
                        border: 2px solid #1e88e5; /* Blue border */
                        padding: 20px;
                        background-color: #ffffff;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 20px;
                    }
                    th, td {
                        border: 1px solid #ccc;
                        padding: 10px;
                    }
                    th {
                        background-color: #e0e0e0;
                        text-align: left;
                        width: 20%;
                    }
                    td {
                        background-color: #e8f5e9;
                    }
                    .currency {
                        color: #1e88e5;
                    }
                    h2, h3 {
                        color: #444;
                    }
                    .header {
                        display: flex;
                        align-items: center;
                        margin-bottom: 20px;
                    }
                    .header img {
                        height: 50px;
                        margin-right: 20px;
                    }
                    .header h1 {
                        font-size: 24px;
                        color: #333;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>Nombre de la Empresa</h1>
                    </div>
                    <h2>Factura Simplificada</h2>
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
                            <th>CIF/NIF Emisor</th>
                            <td><xsl:value-of select="//SellerParty/TaxIdentification/TaxIdentificationNumber"/></td>
                        </tr>
                        <tr>
                            <th>Receptor</th>
                            <td><xsl:value-of select="//BuyerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>CIF/NIF Receptor</th>
                            <td><xsl:value-of select="//BuyerParty/TaxIdentification/TaxIdentificationNumber"/></td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td><xsl:value-of select="//InvoiceTotalAmount"/> €</td>
                        </tr>
                        <tr>
                            <th>Moneda</th>
                            <td class="currency"><xsl:value-of select="//InvoiceCurrencyCode"/></td>
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