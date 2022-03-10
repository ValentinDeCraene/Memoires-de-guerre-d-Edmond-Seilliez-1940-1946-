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
            <i>
            <xsl:value-of select="//titleStmt/title/text()"/>
                </i>
        </xsl:variable>
        <xsl:variable name="author">
            <xsl:value-of select="concat(//editionStmt//forename, //editionStmt//surname)"/>
        </xsl:variable>
        <xsl:variable name="idPerson">
            <xsl:value-of select="./@xml:id"/>
        </xsl:variable>
        <xsl:variable name="footer">
            <br/>
            <br/>
            <br/>
            <footer class="text-center text-dark fixed-bottom footer-transparent">
                <div class="text-center p-1" style="background-color: rgba(0, 0, 0, 0.8);">
                    <p class="text-light">Valentin De Craene - 2022 : <a class="text-light"
                        href="https://twitter.com/VDCrne" target="_blank"
                        >Twitter</a> - <a class="text-light" href="https://github.com/ValentinDeCraene" target="_blank">Github</a></p>
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
        
<!--        Insertion des métadonnées du teiHeader par le biais de cette présentation succinte dans la page d'accueil.--> 
       
        <xsl:result-document href="{$path_homepage}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                        <div>
                            <h1 class="container col-sm-10 text-center p-3">Bienvenue dans ce projet d'édition numérique du
                                <i>Carnet des mémoires de guerre d'Edmond Seilliez (1940-1946)</i> .</h1>
                            <p style="text-align: center">
                                <xsl:value-of select="//edition"/>
                            </p>
                            <p class="container col-5 text-justify">
                                <h2 class="m-4 text-center">Présentation de la source.</h2>
                                <ul class="m-2 text-justify">
                                    <li class="m-2 text-justify"><b>Titre</b> :<br/><i><xsl:value-of select="$title"/>.</i></li>
                                    <li class="m-2 text-justify"> <b>Résumé</b> : <br/><xsl:value-of select="//summary"/></li>
                                    <li class="m-2 text-justify"><b>Lieu de conservation</b> : <br/> <xsl:value-of select="concat(//settlement, ',', //repository)"/>.</li>
                                    <li class="m-2 text-justify"><b>Analyse codicologique</b> : <br/> <xsl:value-of select="concat(//supportDesc, //layoutDesc, //bindingDesc)"/></li>
                                    <li class="m-2 text-justify"><b>Analyse paléographique </b>: <br/> <xsl:value-of select="//handDesc"/></li>
                                    <li class="m-2 text-justify"><b>Edition </b>: <br/> <xsl:value-of select="//resp"/> <xsl:value-of select="$author"/>, arrière petit-fils de l'auteur. Une ODD détaillée du projet se trouve à cette adresse : <a href="https://github.com/ValentinDeCraene/Memoires-de-guerre-d-Edmond-Seilliez-1940-1946-TEI-XSLT/blob/main/sortie_ODD_memoires.html">https://github.com/ValentinDeCraene/Memoires-de-guerre-d-Edmond-Seilliez-1940-1946-TEI-XSLT/blob/main/sortie_ODD_memoires.html</a></li>
                                </ul>
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
                        <h1 class="text-center">Index des personnes</h1>
                        <ul style= "text-justify; padding-left: 110px;">
                            <xsl:for-each select=".//listPerson/person">
                                <xsl:sort select="persName" order="ascending"/>
                                <li class="p-3">
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
                                            <xsl:text> L'identité de cette personne est certaine. </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text> Occurences aux pages suivantes : </xsl:text>
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
                        <h1 class="text-center">Index des lieux</h1>
                        <ul style= "text-justify; padding-left: 110px;">
                            <xsl:for-each select=".//listPlace/place">
                                <xsl:sort select="placeName" order="ascending"/>
                                <li class="p-3">
                                    <xsl:attribute name="n">
                                        <xsl:number count="." format="1"/>
                                    </xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="@cert = 'low'">
                                            <xsl:value-of
                                                select="concat(placeName, ':', location/country, ',', location/district, ',', location/geo, '.', location/note)"/>
                                            <xsl:text> Attention, l'exmplacement de ce toponyme est incertain. </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="concat(placeName, ':', location/country, ',', location/district, ',', location/geo, '.', location/note)"
                                            />
                                            <xsl:text> L'emplacement de ce lieu est certain. </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text> Occurences aux pages suivantes : </xsl:text>
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
                        <h1 class="text-center">Index des organisations</h1>
                        <ul style= "text-justify; padding-left: 110px;">
                            <xsl:for-each select=".//listOrg/org">
                                <xsl:sort select="orgName" order="ascending"/>
                                <li class="p-3">
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
                                   <xsl:text>Occurences aux pages suivantes : </xsl:text> 
                                    <xsl:call-template name="org"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$path_chrono}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div>
                        <h1 class="text-center">Chronologie</h1>
                        <ul class="text-justified">
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
                    <div class="container col-lg-5 text-justify">
                        <header> 
                            <h1 class="text-center">
                                <xsl:value-of select="$title"/>
                            </h1>
                        </header>
                        <br/>
                        <div class="container">
                            <xsl:apply-templates select="//div" mode="sic"/>
                        </div>
                        
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
                    <div class="container col-sm-5 text-justify">
                        <header> 
                            <h1 class="text-center">
                                <xsl:value-of select="$title"/>
                            </h1>
                        </header>
                        <br/>
                        <div class="text-justify">
                            <xsl:apply-templates select="//text" mode="corr"/>
                        </div>
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
                            <li>Proposer une chronologie des événements.</li>
                            <li> Une ODD détaillée du projet se trouve à cette adresse : <a href="https://github.com/ValentinDeCraene/Memoires-de-guerre-d-Edmond-Seilliez-1940-1946-TEI-XSLT/blob/main/sortie_ODD_memoires.html">https://github.com/ValentinDeCraene/Memoires-de-guerre-d-Edmond-Seilliez-1940-1946-TEI-XSLT/blob/main/sortie_ODD_memoires.html</a></li>
                        </ul>
                        <h2 style="text-align: center; padding: 10px;">Transformations XSL</h2>
                        <p>Les transformations XSL ont pour but de réaliser une sortie HTML depuis
                            l'encodage en XML. L'édition numérique se présente ainsi sous la forme
                            de plusieurs pages HTML :</p>
                        <ul>
                            <li>Une page d'accueil.</li>
                            <li>La transcription facsimilaire du passage encodé.</li>
                            <li>La transcription corrigée du passage encodé.</li>
                            <li>L'index des personnages.</li>
                            <li>L'index des organisation.</li>
                            <li>L'index des noms de lieux.</li>
                            <li>Une page retraçant la chronologie des événements, de la mobilisation d'Edmond Seilliez à sa capture et déportation en Prusse Orientale.</li>
                            <li>Une page à propos donnant des informations sur le projet.</li>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <xsl:apply-templates/>
    </xsl:template>


    
<!--    Template des modes permettant d'afficher une sortie du texte correspondate d'une part
    au texte original, et d'autre part au texte corrigé.-->
    
    
    
    <xsl:template match="choice" mode="sic">
        <xsl:value-of select="sic"/>
    </xsl:template>

    <xsl:template match="choice" mode="corr">
        <xsl:value-of select="corr"/>
    </xsl:template>
    
    <xsl:template match="foreign" mode="#all">
        <xsl:element name="i">
            <xsl:value-of select="."/>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="placeName" mode="#all">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'memoireEdmondSeilliez.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="path_lieux_index">
            <xsl:value-of select="concat($witfile, 'html/indexlieux', '.html')"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$path_lieux_index"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="persName" mode="#all">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'memoireEdmondSeilliez.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="path_pers_index">
            <xsl:value-of select="concat($witfile, 'html/indexpersos', '.html')"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$path_pers_index"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="orgName" mode="#all">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'memoireEdmondSeilliez.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="path_orga_index">
            <xsl:value-of select="concat($witfile, 'html/indexorga', '.html')"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$path_orga_index"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="date" mode="#all">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'memoireEdmondSeilliez.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="path_chrono">
            <xsl:value-of select="concat($witfile, 'html/chrono', '.html')"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$path_chrono"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pb" mode="#all">
        <br>
            <p style="text-align: center; padding: 10px;">
            <xsl:value-of select="pb"/>
            -- page n°  <xsl:value-of select="@n"/>  --</p>
        </br>
        <br>
            <xsl:value-of select="."/>
        </br>
    </xsl:template>
    
<!--    Templates appellés ci-dessus-->

    
    <xsl:template name="person">
        <xsl:variable name="idPerson">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
                <xsl:for-each
                    select="ancestor::TEI//body/div/p/persName[replace(@ref, '#', '')= $idPerson]">
                        <xsl:value-of
                            select="parent::p/@n"/>
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
        <xsl:for-each
            select="ancestor::TEI//body/div/p/placeName[replace(@ref, '#', '')= $idPlace]">
            <xsl:value-of
                select="parent::p/@n" />
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
        <xsl:for-each
            select="ancestor::TEI//body/div/p/orgName[replace(@ref, '#', '')= $idOrg]">
            <xsl:value-of
                select="parent::p/@n"/>
            <xsl:choose>
                <xsl:when test="position() = last()">.</xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="chronologie">
        <xsl:for-each select=".//list/item">
            <li class="p-3">
                <xsl:attribute name="n">
                    <xsl:number count="." format="1"/>
                </xsl:attribute>
                <xsl:value-of select="concat(date, ':', p)"/>
            </li>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="//body//p" mode="#all">
        <xsl:element name="p">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lb" mode="#all">
        <br/>
        <xsl:number select="." level="any" format="1"/>
        <xsl:text> - </xsl:text>
    </xsl:template>

</xsl:stylesheet>


