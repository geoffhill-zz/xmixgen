<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy-compat"/>
  <xsl:template match="/mixtape">
    <html lang="en" itemscope="" itemtype="http://schema.org/MusicPlaylist">
      <head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta charset="utf-8" />
	<meta name="mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1" />
	<title><xsl:value-of select="/mixtape/name" /></title>
	<style>	<![CDATA[
@font-face {
  font-family: 'xmixgen'; font-style: normal; font-weight: normal;
  src: url(']]><xsl:value-of select="/mixtape/font[@face='regular']" /><![CDATA[');
}
@font-face {
  font-family: 'xmixgen'; font-style: normal; font-weight: bold;
  src: url(']]><xsl:value-of select="/mixtape/font[@face='bold']" /><![CDATA[');
}
body {
  margin: 0;
  background-color: #eee;
  font-family: 'xmixgen', sans-serif;
}
header {
  width: 100%;
  height: 64px;
  line-height: 64px;
  box-shadow: 0 0 12px 4px rgba(0, 0, 0, 0.4);
  background-color: ]]><xsl:value-of select="color[@for='banner']" /><![CDATA[;
  color: #fff;
  font-size: 32px;
  text-align: center;
  overflow: hidden;
}
main {
  margin: 48px auto;
  padding: 0 28px;
  max-width: 620px;
  color: #aaa;
  font-size: 24px;
  overflow: hidden;
}
section {
  margin: 18px;
  padding: 18px;
  background-color: #fff;
  box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14),
              0 1px 9px -1px rgba(0, 0, 0, 0.12),
              0 2px 4px -1px rgba(0, 0, 0, 0.4);
  border-radius: 2px;
  overflow: hidden;
}
section + section {margin-top: -18px;}
@media (max-width: 639px) {
  header { font-size: 28px; height: 56px; line-height: 56px; }
  main { margin: 30px auto; padding: 0 18px; font-size: 21px; }
  section { padding: 12px; }
}
h1,h4,h5 { font-size: inherit; display: inline; }
h5 { color: ]]><xsl:value-of select="color[@for='artist']" /><![CDATA[; }
h4 { color: ]]><xsl:value-of select="color[@for='title']" /><![CDATA[; }]]>
	</style>
      </head>
      <body>
	<header>
	  <h1 itemprop="name"><xsl:value-of select="/mixtape/name" /></h1>
	</header>
	<main>
	  <xsl:for-each select="/mixtape/track">
	    <section itemprop="track"
		     itemscope="" itemtype="http://schema.org/MusicRecording">
	      <xsl:if test="@artist">
		<h5 itemprop="http://schema.org/byArtist"
		    itemscope="" itemtype="http://schema.org/MusicGroup">
		  <span itemprop="name"><xsl:value-of select="@artist" /></span>
		</h5>
	      <span> &#8212; </span>
	      </xsl:if>
	      <h4 itemprop="http://schema.org/recordingOf"
		  itemscope="" itemtype="http://schema.org/MusicComposition">
		<span itemprop="name"><xsl:value-of select="@title" /></span>
	      </h4>
	      <audio preload="none">
		<xsl:attribute name="src">
		  <xsl:value-of select="@src" />
		</xsl:attribute>
	      </audio>
	    </section>
	  </xsl:for-each>
	</main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
