<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/reservaeventos'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>Restaurantes</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main>
		<!-- Aplicar plantilla a restaurante -->
		<xsl:apply-templates select="restaurante"/>
       </main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
<!-- Plantilla restaurante -->
  <xsl:template match="restaurante" >
	<!-- Variable de nombre de restaurante-->
	<!-- /*Aqui si cambiamos el nombre de restaurnate en la variable se cambian todas las informaciones de la pagina */--> 
	<xsl:variable name="nombre" select="nombrerestaurante[text()='Eneko']"/>
		<xsl:choose>
			<xsl:when test="$nombre">
				<h1><a href="{informacion[@tipo='web']}" target='blank'><xsl:value-of select="nombrerestaurante"/></a>-
	            <xsl:value-of select="//restaurante[nombrerestaurante=$nombre]/ciudad"/></h1>
												
				
		<article class="restaurante">
				<h3>Degustacion</h3>
				<xsl:for-each select="menu[@tipo='degustacion']/plato">
				<p><xsl:value-of select="."/></p>
				</xsl:for-each>
        </article>
			<!-- Usando "if" para distinguir entre tipos de menu -->
		<article class="restaurante">
			    <xsl:if test="$nombre='Eneko'">
				  <h3><xsl:value-of select="'fin de semana'"/></h3>
				<xsl:for-each select="//menu[@tipo='fin de semana']/plato">
				  <p><xsl:value-of select="."/></p>
				</xsl:for-each>
				
				</xsl:if>
				
				<xsl:if test="$nombre='El clarete'">
				  <h3><xsl:value-of select="'menu del día'"/></h3>
				<xsl:for-each select="//menu[@tipo='menu del día']/plato">
				  <p><xsl:value-of select="."/></p>
				</xsl:for-each>
			    </xsl:if>
		</article>
					
			      
			</xsl:when>
		</xsl:choose>	
				
	</xsl:template>

</xsl:stylesheet>