<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template for the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Library Documentation</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    h1, h2, h3 {
                        color: #333;
                    }
                    .function {
                        border: 1px solid #ccc;
                        padding: 10px;
                        margin-bottom: 20px;
                        border-radius: 5px;
                        background-color: #f9f9f9;
                    }
                    .doc-text {
                        margin-top: 10px;
                    }
                    .dependency {
                        margin-left: 20px;
                        margin-bottom: 5px;
                    }
                </style>
            </head>
            <body>
                <h1>Library: <xsl:value-of select="Library/LibraryName"/></h1>
                <xsl:apply-templates select="Library/Function"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each function -->
    <xsl:template match="Function">
        <div class="function">
            <h2>Function: <xsl:value-of select="FunctionName"/></h2>
            <h3>Dependencies:</h3>
            <ul>
                <xsl:for-each select="DependOn/FunctionDepend">
                    <li class="dependency">
                        <strong>Function Name:</strong> <xsl:value-of select="FunctionName"/>
                        <br />
                        <strong>Library:</strong> <xsl:value-of select="FunctionLib"/>
                    </li>
                </xsl:for-each>
            </ul>
            <div class="doc-text">
                <h3>Documentation:</h3>
                <pre><xsl:value-of select="DocText" disable-output-escaping="yes"/></pre>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
