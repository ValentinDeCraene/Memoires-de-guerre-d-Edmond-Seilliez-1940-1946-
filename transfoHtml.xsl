<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- Attention une sortie HTML => exclusion du préfixe tei des résultats -->

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <!-- pour éviter les espaces non voulus -->
    <xsl:template match="/">
        <!-- On stocke le nom le chemin du fichier courant -->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'memoireEdmondSeilliez.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="path_homepage">
            <xsl:value-of select="concat($witfile, 'html/homepage', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_pers_index">
            <xsl:value-of select="concat($witfile, 'html/indexpersos', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_lieux_index">
            <xsl:value-of select="concat($witfile, 'html/indexlieux', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_orga_index">
            <xsl:value-of select="concat($witfile, 'html/indexorga', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_chrono">
            <xsl:value-of select="concat($witfile, 'html/chrono', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_texte_facsimilaire">
            <xsl:value-of select="concat($witfile, 'html/versionfacsimilaire', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_texte_corrigé">
            <xsl:value-of select="concat($witfile, 'html/versioncorrigee', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_a_propos">
            <xsl:value-of select="concat($witfile, 'html/apropos', '.html')"/>
        </xsl:variable>
        
        
        <xsl:variable name="title">
            <xsl:value-of select="//titleStmt/title/text()"/>
        </xsl:variable>
        <xsl:variable name="author">
            <xsl:value-of select="concat(//editionStmt//forename, //editionStmt//surname)"/>
        </xsl:variable>
        <xsl:variable name="idPerson">
            <xsl:value-of select="./@xml:id"/>
        </xsl:variable>
        <xsl:variable name="footer">
            <footer class="text-center text-white" style="background-color: #f1f1f1;">
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    <p>Valentin De Craene - 2022</p>
                </div>
            </footer>
        </xsl:variable>
        
        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="description"
                    content="Édition numérique du{$title}"/>
                <meta name="keywords" content="XML, TEI, XSLT"/>
                <meta name="author" content="{$author}"/>
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                crossorigin="anonymous"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"/>
            </head>
        </xsl:variable>
        
        <xsl:variable name="nav_bar">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between">
            <a class="navbar-brand" style="padding-left: 5px" href="{$path_homepage}">
                <xsl:value-of
                    select="$title"
                />
            </a>
            <!-- Pour chaque output HTML, on crée un lien de navigation dans la barre de navigation -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <!-- On récupère une variable entre {}. Les variables suivantes étant les chemins de fichier des différents outputs. -->
                    <a class="nav-link" href="{$path_homepage}">Page d'accueil </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_pers_index}">Index des personnages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_lieux_index}">Index des lieux</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_orga_index}">Index des organisations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_chrono}">Chronologie</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_texte_facsimilaire}">Texte version facsimilaire</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_texte_corrigé}">Texte version corrigée</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$path_a_propos}">A propos</a>
                </li>
            </ul>
        </nav>
        </xsl:variable>
        
        <xsl:result-document href="{$path_homepage}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                        <div>
                            <p>Bienvenue dans ce projet d'édition numérique du
                                <i>Carnet des mémoires de guerre d'Edmond Seilliez (1940-1946)</i> .</p>
                            <p>
                                <xsl:value-of select="//edition"/>
                            </p>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_pers_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div>
                        <h1>Index des personnes</h1>
                        <ul>
                            <xsl:for-each select=".//listPerson/person">
                                <li>
                                    <xsl:choose>
                                        <xsl:when test="persName/surname[@cert = 'low'] or persName/forename[@cert = 'low']">
                                            <xsl:value-of
                                                select="concat(persName/forename, ' ', persName/surname, ':', descendant::note)"/>
                                            <xsl:text> Attention, l'identité de cette personne est incertaine. </xsl:text>
                                        </xsl:when>
                                        <xsl:when test="persName/surname[@cert = 'high']">
                                            <xsl:value-of
                                                select="concat(persName/forename, ' ', persName/surname, ':', descendant::note)"/>
                                            <xsl:text> La certitude concernant l'identité de cette personne est plutôt élevée. </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="concat(persName/forename, ' ', persName/surname, ':', descendant::note)"
                                            />
                                            <xsl:text>L'identité de cette personne est certaine. </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text>Nombre d'occurences : </xsl:text>
                                    <xsl:call-template name="person"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_lieux_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div>
                        <h1>Index des lieux</h1>
                        <ul>
                            <xsl:for-each select=".//listPlace/place">
                                <li>
                                    <xsl:attribute name="n">
                                        <xsl:number count="." format="1"/>
                                    </xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="@cert = 'low'">
                                            <xsl:value-of
                                                select="concat(placeName, ':', location/country, ',', location/district, ',', location/geo, ',', location/note)"/>
                                            <xsl:text> Attention, l'exmplacement de ce toponyme est incertain. </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="concat(placeName, ':', location/country, ',', location/district, ',', location/geo, ',', location/note)"
                                            />
                                            <xsl:text> L'emplacement de ce lieu est certain. </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text> Nombre d'occurences : </xsl:text>
                                    <xsl:call-template name="place"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_orga_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div>
                        <h1>Index des organisations</h1>
                        <ul>
                            <xsl:for-each select=".//listOrg/org">
                                <li>
                                    <xsl:attribute name="n">
                                        <xsl:number count="." format="1"/>
                                    </xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test= "orgName[@cert = 'low']">
                                            <xsl:value-of select="concat(orgName, ':', note)"/>
                                            <xsl:text> Attention, l'identité de cette organisation est incertaine. </xsl:text>
                                        </xsl:when>
                                        <xsl:when test="orgName[@cert = 'medium']">
                                            <xsl:value-of select="concat(orgName, ':', note)"/>
                                            <xsl:text> Attention, l'identité de cette organisation est moyennement certaine. </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="concat(orgName, ':', note)"/>
                                            <xsl:text> L'identité de cette organisation est certaine. </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:call-template name="org"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>ù
        
        <xsl:result-document href="{$path_chrono}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div>
                        <h1>Chronologie</h1>
                        <ul>
                            <xsl:call-template name="chronologie"/>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_texte_facsimilaire}">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <xsl:element name="div">
                            <xsl:apply-templates select="//text" mode="sic"/>
                        </xsl:element>
                        
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_texte_corrigé}">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <xsl:element name="div">
                            <xsl:apply-templates select="//text" mode="corr"/>
                        </xsl:element>
                        
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_a_propos}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1 style="text-align: center; padding: 20px;">Projet d'édition numérique -
                            des <i> Mémoires de guerre d'Edmond Seilliez (1940-1946)</i>, édité par Valentin De Craene,
                            arrière-petit fils de l'auteur.</h1>
                        <h2 style="text-align: center; padding: 10px;">Encodage XML-TEI</h2>
                        <p>Ce projet d'édition numérique s'inscrit dans le cadre de l'évaluation d'une part du module de formation
                            à l'encodage XML/TEI et d'autre part au langage de transformation XSLT, au sein du master 2 
                            TNAH de l'Ecole nationale des Chartes (2021-2022).
                            S'agissant d'un document personnel, des règles spécifiques d'encodage ont été appliquées dans le but de :</p>
                        <ul>
                            <li>Mettre en évidence les erreurs grammaticales et de conjugaison de l'auteur dans une optique d'étude de la maitrise de la langue
                            par un soldat ordinaire.</li>
                            <li>Proposer un index des personnages, des organisations et des relations que l'auteur a pu entretenir avec ceux-ci.</li>
                            <li>Proposer un index des espaces et des lieux parcourus par l'auteur dans le contexte militaire afin de fournir une analyse
                            de la représentation de l'espace des combats.</li>
                            <li>Proposer une chronologie des événements</li>
                        </ul>
                        <h2 style="text-align: center; padding: 10px;">Transformations XSL</h2>
                        <p>Les transformations XSL ont pour but de réaliser une sortie HTML depuis
                            l'encodage en XML. L'édition numérique se présente ainsi sous la forme
                            de plusieurs pages HTML :</p>
                        <ul>
                            <li>Une page d'accueil</li>
                            <li>La transcription facsimilaire du passage encodé</li>
                            <li>La transcription corrigée du passage encodé</li>
                            <li>L'index des personnages</li>
                            <li>L'index des organisation</li>
                            <li>L'index des noms de lieux</li>
                            <li>Une page retraçant la chronologie des événements, de la mobilisation d'Edmond Seilliez à sa capture et déportation en Prusse Orientale.</li>
                            <li>Une page à propos donnant des informations sur le projet</li>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>


    
<!--    Template des modes permettant d'afficher une sortie du texte correspondate d'une part
    au texte original, et d'autre part au texte corrigé.-->
    
    <xsl:template match="choice" mode="sic">
        <xsl:value-of select="sic/text()"/>
    </xsl:template>

    <xsl:template match="choice" mode="corr">
        <xsl:value-of select="corr/text()"/>
    </xsl:template>
    
    
<!--    Templates appellés ci-dessus-->

    
    <xsl:template name="person">
        <xsl:variable name="idPerson">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
            <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]">
                <xsl:value-of select="count(//p/preceding-sibling::persName) + 1"/>
                <xsl:choose>
                    <xsl:when test="position() = last()">.</xsl:when>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
    </xsl:template>

    <xsl:template name="place">
        <xsl:variable name="idPlace">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:for-each select="ancestor::TEI//body//placeName[replace(@ref, '#','')=$idPlace]">
            <xsl:value-of select="count(//p/preceding-sibling::placeName) + 1"/>
            <xsl:choose>
                <xsl:when test="position() = last()">.</xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="org">
        <xsl:variable name="idOrg">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:for-each select="ancestor::TEI//body//orgName[replace(@ref, '#','')=$idOrg]">
            <xsl:value-of select="count(//p/preceding-sibling::orgName) + 1"/>
            <xsl:choose>
                <xsl:when test="position() = last()">.</xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="chronologie">
        <xsl:for-each select=".//list/item">
            <li>
                <xsl:attribute name="n">
                    <xsl:number count="." format="1"/>
                </xsl:attribute>
                <xsl:value-of select="concat(date, ':', p)"/>
            </li>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
