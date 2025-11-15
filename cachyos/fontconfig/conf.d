<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

  <!-- 日本語(lang=ja)のときだけ、常に CJK を後ろに足す（append） -->
  <!-- family を限定しない＝全ジャンル（sans/serif/monospace/アプリ独自指定）に効く -->
  <match target="pattern">
    <test name="lang" compare="contains">
      <string>ja</string>
    </test>
    <edit name="family" mode="append" binding="strong">
      <string>Noto Sans CJK JP</string>
      <!-- serif 文書で日本語の“明朝” -->
      <!-- <string>Noto Serif CJK JP</string> -->
      <!-- 代替例（導入している実在名だけ残す）：
           <string>Source Han Sans JP</string>
           <string>Source Han Serif JP</string>
           <string>IPAexGothic</string>
           <string>IPAexMincho</string> -->
    </edit>
  </match>

</fontconfig>
