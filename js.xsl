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
  <xsl:template name="js">
    <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript"><![CDATA[
var tracks = document.getElementsByTagName('section');
var audios = document.getElementsByTagName('audio');
for (i = 0; i < tracks.length; i++) {
  tracks[i].childAudio = audios[i];
  if (i+1 < tracks.length) {
    tracks[i].nextTrack = tracks[i+1];
  } else {
    tracks[i].nextTrack = tracks[0];
  }
}

var toggle = function(section) {
  var audio = section.childAudio;
  for (i = 0; i < tracks.length; i++) {
    var other = tracks[i].childAudio;
    if (other !== audio) {
      other.pause();
      if (other.currentTime !== 0) {
        other.currentTime = 0;
      }
    }
  }
  if (audio.paused) {
    if (!section.style.background) {
      section.style.background = '#f8f8f8';
    }
    audio.play();
  } else {
    audio.pause();
  }
}

var drawProgress = function(section) {
  var audio = section.childAudio;
  var progress = 100 * (audio.currentTime / audio.duration);
  section.style.background = 'linear-gradient(to right, ]]><xsl:value-of select="/mixtape/color[@for='progress']"/><![CDATA[ ' + progress + '%, #f8f8f8 ' + progress + '%)';
}

var click = function(event) {
  toggle(event.currentTarget);
}

var dblclick = function(event) {
  var audio = event.currentTarget.childAudio;
  if (!audio.paused) {
    audio.currentTime = 0;
  }
}

var playing = function(event) {
  var section = event.currentTarget.parentSection;
  for (i = 0; i < tracks.length; i++) {
    var track = tracks[i];
    if (track.intervalId) clearInterval(track.intervalId);
    if (track !== section) {
      tracks[i].style.background = null;
    }
  }
  section.intervalId = setInterval(drawProgress, 1000, section);
}

var ended = function(event) {
  var section = event.currentTarget.parentSection;
  clearInterval(section.intervalId);
  section.style.background = null;
  toggle(section.nextTrack);
}

window.onload = function() {
  for (i = 0; i < tracks.length; i++) {
    var track = tracks[i];
    track.addEventListener("click", click);
    track.addEventListener("dblclick", dblclick)
    var audio = track.getElementsByTagName('audio')[0];
    audio.parentSection = track;
    track.childAudio = audio;
    audio.addEventListener("playing", playing);
    audio.addEventListener("ended", ended);
  }
}
]]></script>
  </xsl:template>
</xsl:stylesheet>
