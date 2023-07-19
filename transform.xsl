<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" >
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <script src="https://kit.fontawesome.com/2fd670a4d1.js" crossorigin="anonymous"></script>
                <link rel="stylesheet" type="text/css" href="src/style.css"/>
                <title>Progetto d'esame di Codifica di Testi, di Emanuela Fortuna</title>
            </head>

            <body>

                <div class="header">
                    <h2><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h2>
                    <h3><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></h3>
                </div>

                <div class="sezione1">
                    <h1>Informazioni sulla fonte</h1>
                    <div class="containerTabelle">
                        <div class="containerTabella">
                            <h2>Descrizione bibliografica</h2>
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents"/>
                        </div>
                        <div class="containerTabella">
                            <h2>Descrizione fisica</h2>
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc"/>
                        </div>
                    </div>
                </div>

                <div class="container">

                    <div class="controlPanel">
                        <div class="divBottoni">
                            <div>
                                <h2>Evidenzia</h2>
                                <button class="addBtn" onclick="mostraFenomeno('add', 'darkblue', 'ev')">AGGIUNTE</button>                                
                                <button class="placeBtn" onclick="mostraFenomeno('place', 'darkgreen', 'ev')">LUOGHI</button>
                                <button class="personBtn" onclick="mostraFenomeno('person', 'mediumvioletred', 'ev')">PERSONE</button>
                                <button class="abbrBtn" onclick="mostraFenomeno('abbr', 'crimson', 'ev')">ABBREVIAZIONI</button>
                                <button class="delBtn" onclick="mostraFenomeno('del', 'darkslategray', 'ev')">CANCELLATURE</button>
                            </div>
                            <div>
                                <h2>Mostra</h2>
                                <button class="suppliedBtn" onclick="mostraFenomeno('supplied', 'darkcyan', 'show')">AGG. EDITORIALE</button>
                                <button class="expanBtn" onclick="mostraFenomeno('expan', 'darkslateblue', 'show')">ESPANSIONI</button>
                            </div>
                        </div>
                        <div class="divCambioPagina">
                            <button onclick="cambioPagina(-1)"><i class="fa-solid fa-arrow-right fa-rotate-180"></i> Pagina precedente</button>
                            <button onclick="cambioPagina(1)">Pagina successiva <i class="fa-solid fa-arrow-right"></i></button>
                        </div>
                    </div>

                    <h2 id="indicatorePagina">Pagina X</h2>
                    <xsl:apply-templates select="tei:TEI/tei:text/tei:group"/>

                    <div class="controlPanel">
                        <div class="divCambioPagina">
                            <button onclick="cambioPagina(-1)"><i class="fa-solid fa-arrow-right fa-rotate-180"></i> Pagina precedente</button>
                            <button onclick="cambioPagina(1)">Pagina successiva <i class="fa-solid fa-arrow-right"></i></button>
                        </div>
                        <div class="divBottoni">
                            <div>
                                <h2>Evidenzia</h2>
                                <button class="addBtn" onclick="mostraFenomeno('add', 'darkblue', 'ev')">AGGIUNTE</button>
                                <button class="placeBtn" onclick="mostraFenomeno('place', 'darkgreen', 'ev')">LUOGHI</button>
                                <button class="personBtn" onclick="mostraFenomeno('person', 'mediumvioletred', 'ev')">PERSONE</button>
                                <button class="abbrBtn" onclick="mostraFenomeno('abbr', 'crimson', 'ev')">ABBREVIAZIONI</button>
                                <button class="delBtn" onclick="mostraFenomeno('del', 'darkslategray', 'ev')">CANCELLATURE</button>
                            </div>
                            <div>
                                <h2>Mostra</h2>
                                <button class="suppliedBtn" onclick="mostraFenomeno('supplied', 'darkcyan', 'show')">AGG. EDITORIALE</button>
                                <button class="expanBtn" onclick="mostraFenomeno('expan', 'darkslateblue', 'show')">ESPANSIONI</button>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="sezione2">
                    <h1>Sul progetto</h1>
                    <p>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition"/>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability"/>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
                    </p>

                    <h1>Bibliografia</h1>
                    <p>
                        <xsl:apply-templates select="tei:TEI/tei:text/tei:back/tei:div/tei:listBibl"/>
                    </p>
                </div>

                <footer>
                    <p>Pagina web realizzata usando la trasformazione XSLT della codifica XML TEI delle carte 7r, 7v e 8r del Codice degli Abbozzi di Petrarca (Vat. lat. 3196)</p>
                    <p>Vedi su <a target="_blank" href="https://github.com/EmmaFortuna/progettoCodificaCodiceAbbozziPetrarca/tree/main">GitHub</a>.</p>
                    <br/>
                    <p>Emanuela Fortuna, 2023</p>
                </footer>

                <script type="text/javascript" src="src/script.js"></script>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="tei:msContents">
        <table>
            <tr>
                <td><strong>In breve</strong></td>
                <td><span><xsl:value-of select="tei:summary"/></span></td>
            </tr>
            <tr>
                <td><span><strong>Identificazione</strong></span></td>
                <td>
                    <table>
                        <tr>
                            <td><strong>Posizione</strong></td>
                            <td><span><xsl:value-of select="../tei:msIdentifier/tei:settlement"/></span>, <span><xsl:value-of select="../tei:msIdentifier/tei:country"/></span></td>
                        </tr>
                        <tr>
                            <td><strong>Istituzione</strong></td>
                            <td><span><xsl:value-of select="../tei:msIdentifier/tei:institution"/></span></td>
                        </tr>
                        <tr>
                            <td><strong>Collezione</strong></td>
                            <td><span><xsl:value-of select="../tei:msIdentifier/tei:collection"/></span></td>
                        </tr>
                        <tr>
                            <td><strong>Manoscritto</strong></td>
                            <td><span><xsl:value-of select="../tei:msIdentifier/tei:idno"/></span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <xsl:for-each select="tei:msItem">
                <tr>
                    <td><strong>Item <span><xsl:value-of select="@n"/></span></strong></td>
                    <td>
                        <table>
                            <tr>
                                <td><strong>Titolo</strong></td>
                                <td><span><xsl:value-of select="tei:title"/></span></td>
                            </tr>                            
                        </table>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <table>
            <tr>
                <td><span><strong>Supporto</strong></span></td>
                <td><span><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></span></td>
            </tr>
            <tr>
                <td><span><strong>Quantità</strong></span></td>
                <td><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent"/></td>
            </tr>
            <tr>
                <td><span><strong>Organizzazione</strong></span></td>
                <td><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:collation"/></td>
            </tr>
            <tr>
                <td><span><strong>Condizioni</strong></span></td>
                <td><span><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></span></td>
            </tr>
            <tr>
                <td><span><strong>Impaginazione</strong></span></td>
                <td><span><xsl:value-of select="tei:objectDesc/tei:layoutDesc"/></span></td>
            </tr>
            <tr>
                <td><span><strong>Mani</strong></span></td>
                <td><span><xsl:value-of select="tei:handDesc"/></span></td>
            </tr>
            <tr>
                <td><span><strong>Storia</strong></span></td>
                <td><span><xsl:value-of select="../tei:history"/></span></td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:group">
        <xsl:for-each-group select="node()" group-starting-with="tei:pb">
            <xsl:variable name="nPagina" >
                <xsl:value-of select="position()-1"/>
            </xsl:variable>

            <xsl:if test="position()>1">
                <div class="page">
                    <xsl:apply-templates select="//tei:facsimile/tei:surface[@n=$nPagina]"/>

                    <div class="trascrizione">
                        <p>
                           <xsl:apply-templates select="current-group()"/>
                        </p>
                    </div>
                </div>
            </xsl:if>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="alt">Immagine <xsl:value-of select="@xml:id"/></xsl:attribute>
        </xsl:element>

        <xsl:element name="map">
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:for-each select="tei:zone">
                <xsl:element name="area">
                    <xsl:attribute name="onmouseout">evidenzia(this, "off")</xsl:attribute>
                    <xsl:attribute name="onmouseover">evidenzia(this, "on")</xsl:attribute>
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:lb">
        <xsl:if test="@rend = 'double_stroke'">
            =
        </xsl:if>
        <br/>
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">nRiga</xsl:attribute>
            <xsl:value-of select="@n" />&#160;
        </xsl:element>
    </xsl:template>

    <!-- abbreviazione -->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- aggiunta -->
    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- cancellature -->
    <xsl:template match="tei:del">
        <xsl:variable name="idGlifo">
            <xsl:value-of select="substring(tei:g/@ref,2)"/>
        </xsl:variable>        
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:value-of select="id($idGlifo)/tei:mapping"/>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- agg. editoriale -->
    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">supplied</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- espansione -->
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- spazio -->
    <xsl:template match="tei:space">
        <xsl:text>&#160;&#160;&#160;&#160;&#160;</xsl:text>
    </xsl:template>
    
    <!-- visualizza glifi -->
    <xsl:template match="tei:am">
        <xsl:variable name="idGlifo">
            <xsl:value-of select="substring(tei:g/@ref,2)"/>
        </xsl:variable>        
        <xsl:value-of select="id($idGlifo)/tei:mapping"/>
        <xsl:element name="span">
            <xsl:attribute name="class">am</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>    

    <!-- persone -->
    <xsl:template match="tei:persName">
        <xsl:element name="span">
            <xsl:attribute name="class">person</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- luoghi -->
    <xsl:template match="tei:placeName">
        <xsl:element name="span">
            <xsl:attribute name="class">place</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--bibliografia-->
    <xsl:template match="tei:listBibl">
        <ul>
            <xsl:for-each select="tei:biblStruct/tei:monogr">
                <li>
                    <xsl:value-of select="tei:title"/>,
                    <xsl:value-of select="tei:author"/>,
                    <xsl:value-of select="tei:imprint/tei:date"/>,
                    <xsl:value-of select="tei:imprint/tei:publisher"/>;
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    

    

</xsl:stylesheet>
