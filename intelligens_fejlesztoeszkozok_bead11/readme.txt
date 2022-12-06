v001 - órai kód átalakítva
v002 - kód javítás
v003 - teljesen hibas a kod ez nem 3 SISO kell, hanem 1 MIMO
v004 - nem, a MIMO fgv -bol csak 1 hivas kell, vektorokat adsz at, es vektort kapsz vissza. aztan ezt bontod majd 3 fele. 
v005 - plot javítva
v006 - latex dokumentacio
v007 - Nincs benne S, az csak a VSSM-ben volt; nezd meg a Lorenz peldaprogramot, azt alakitsd at, ott sokminden keszen van, ne a SISO peldabol induljal ki.; ez elsorendu rendszer, nem masodrendu. Tehaht a doksiban, az 1.3 nincsen mert itt nincs hibametrika; A kinematikai block ugy lenne igaz, hogy a kifejezes =0-val, de ott nem 3 van, tehat a kifejtes sem jo... a plot-okbol mar gyanus lehetett volna, hogy valami nem jo
v008 - ez elsorendu rendszer, nem masodrendu. A kinematikai block ugy lenne igaz, hogy a kifejezes =0-val, de ott a rossler rendszer egy elsorendu rendszer, tehat n=1-re ird fel, mint ahogy a kodban jol is szerepel a plotolasnal; az elso abranal a nominalis ott van, de a megvalosult x,y,z a kodbol hianyzik, amit te a figure(2) raktal... a kettot egyutt kell szerepeltentni, hogy es altalaban a megvalosult van felul szagatott vonallal.a fazisteret elnezted, nem a Deformalt van benne, a nominalisnal, szerintem csak elgepelted, es copy-ztad... a szabalyzo jelnet, meg az ido fuggvenyeben abrazold (elso kordinata az idon, nem a nominalis palya.); valamint kell a masodik futas is, valamint, hogy szamolod ki a kezdoertekeket.




