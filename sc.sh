#!/bin/zsh

WORD=("クラT" "東京 観光" "渋谷 ラーメン" "北海道 お土産" "渋谷　デート" "池袋 サウナ")

for i in $WORD; do
echo $i
curl -sGN "http://aramakijake.jp/keyword/index.php" --data-urlencode "keyword=$i"|
grep -B 1 -m 10 '<td class="result-google">'|
sed -e 's|<td class="result-google">||g' -e 's| ||g' -e 's|</td>||g' -e 's|<tdclass="result-order">||g' -e 's|--||g'|
awk '{printf "%-10s %s\n",$1,$2}'
echo "----------------------"
done
