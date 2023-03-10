<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/reservaeventos'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>teatro</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
	    <!-- Aplicar palantilla a teatro -->
				<xsl:apply-templates select="teatro">
        <!--ordenar fechas  -->
                <xsl:sort select="fechahora/@dia" order="descending"/>
                </xsl:apply-templates>
                
				
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
<!-- Plantilla para el teatro-->
	<!--Lista de obras ordenada por fecha descending y precio menor que 20 subrayado  -->
</xsl:template>
<xsl:template match="teatro">
    <xsl:choose>
        <xsl:when test="precio &lt; 20">
         <ul>
           <li class='subrayado'><xsl:value-of select='fechahora/@dia'/> : <xsl:value-of select='obra' /> </li>
         </ul>
       </xsl:when>
       <xsl:otherwise>
         <ul>
           <li><xsl:value-of select='fechahora/@dia'/> : <xsl:value-of select='obra' /> </li>
         </ul>
       </xsl:otherwise>
    </xsl:choose> 
</xsl:template>


</xsl:stylesheet>