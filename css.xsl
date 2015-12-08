<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright 2015 Geoff Hill

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
for more details.

See https://www.gnu.org/licenses/gpl-3.0.txt for the full text of the
GNU General Public License, version 3.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="roboto-bold.xsl"/>
  <xsl:template name="css">
    <style xmlns="http://www.w3.org/1999/xhtml" type="text/css">
@font-face {
  font-family: 'xmixgen'; font-style: normal; font-weight: bold;
  src: url('<xsl:call-template name="font"/>') format('woff2');
}
body {
  margin: 0;
  background-color: #eee;
  font-family: 'xmixgen', 'Roboto', 'Droid Sans', sans-serif;
  font-weight: bold;
}
header {
  width: 100%;
  height: 64px;
  line-height: 64px;
  box-shadow: 0 -2px 10px 4px rgba(0, 0, 0, 0.4);
  background-color: <xsl:value-of select="color[@for='banner']"/>;
  color: #fff;
  font-size: 32px;
  text-align: center;
  overflow: hidden;
}
main {
  margin: 48px auto;
  padding: 0 28px;
  max-width: 680px;
  color: #aaa;
  font-size: 24px;
  overflow: hidden;
}
section {
  margin: 18px;
  padding: 18px;
  background-color: #fff;
  box-shadow:
  0 4px 5px 0 rgba(0, 0, 0, 0.11),
  0 1px 9px 0 rgba(0, 0, 0, 0.12),
  0 2px 4px -1px rgba(0, 0, 0, 0.4);
  border-radius: 2px;
  overflow: hidden;
}
section + section { margin-top: -18px; }
section:hover { background-color: #f8f8f8; }
h1, h4, h5 { font-size: inherit; display: inline; }
h5 { color: <xsl:value-of select="color[@for='artist']"/>; }
h4 { color: <xsl:value-of select="color[@for='title']"/>; }
@media (max-width: 639px) {
  header { height: 56px; line-height: 56px; font-size: 28px; }
  main { margin: 20px auto; padding: 0 16px; font-size: 21px; }
  section { padding: 14px; }
}
    </style>
  </xsl:template>
</xsl:stylesheet>
