<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright 2015-2016 Geoff Hill

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program. If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="css.xsl"/>
  <xsl:import href="js.xsl"/>
  <xsl:output method="xml" doctype-system="about:legacy-compat" media-type="application/xhtml+xml" indent="yes"/>
  <xsl:template match="/mixtape">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" itemscope="" itemtype="http://schema.org/WebSite">
      <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta charset="utf-8"/>
        <meta name="referrer" content="no-referrer"/>
        <meta name="mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1"/>
        <link rel="icon" type="image/png" href="/favicon.png"/>
        <link rel="icon" type="image/png" href="/favicon-128.png" sizes="128x128"/>
        <link rel="icon" type="image/png" href="/favicon-152.png" sizes="152x152"/>
        <link rel="apple-touch-icon-precomposed" href="/favicon-152.png"/>
        <title itemprop="name">
          <xsl:value-of select="/mixtape/name"/>
        </title>
        <xsl:call-template name="css"/>
      </head>
      <body itemprop="mainEntity" itemscope="" itemtype="http://schema.org/MusicPlaylist">
        <header>
          <h1 itemprop="name">
            <xsl:value-of select="/mixtape/name"/>
          </h1>
        </header>
        <main>
          <xsl:for-each select="/mixtape/track">
            <section itemprop="track" itemscope="" itemtype="http://schema.org/MusicRecording">
              <xsl:if test="@artist">
                <h5 itemprop="http://schema.org/byArtist" itemscope="" itemtype="http://schema.org/MusicGroup">
                  <span itemprop="name">
                    <xsl:value-of select="@artist"/>
                  </span>
                </h5>
                <span> — </span>
              </xsl:if>
              <h4 itemprop="name">
                <xsl:value-of select="@title"/>
              </h4>
              <div itemprop="audio" itemscope="" itemtype="http://schema.org/AudioObject">
                <meta itemprop="encodingFormat" content="mp3"/>
                <meta itemprop="fileFormat" content="audio/mpeg"/>
                <meta itemprop="contentUrl">
                  <xsl:attribute name="content">
                    <xsl:value-of select="@src"/>
                  </xsl:attribute>
                </meta>
                <audio preload="none">
                  <xsl:attribute name="src">
                    <xsl:value-of select="@src"/>
                  </xsl:attribute>
                </audio>
              </div>
            </section>
          </xsl:for-each>
        </main>
	<footer><p>Powered by <a href="https://bitbucket.org/geoffhill/xmixgen.git">xmixgen</a></p></footer>
        <xsl:call-template name="js"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
