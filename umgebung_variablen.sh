#!/bin/bash
echo "====== Numerische Variablen ======"

# Zahlen definieren
zahl1=15
zahl2=7

# Grundrechenarten
summe=$((zahl1 + zahl2))
differenz=$((zahl1 - zahl2))
produkt=$((zahl1 * zahl2))
quotient=$((zahl1 / zahl2))
rest=$((zahl1 % zahl2))

echo "$zahl1 + $zahl2 = $summe"
echo "$zahl1 - $zahl2 = $differenz"
echo "$zahl1 × $zahl2 = $produkt"
echo "$zahl1 ÷ $zahl2 = $quotient (ganzzahlig)"
echo "$zahl1 % $zahl2 = $rest (Rest)"

# Variable inkrementieren/dekrementieren
counter=10
echo "Counter start: $counter"
((counter++))
echo "Nach ++ : $counter"
((counter--))
echo "Nach -- : $counter"
counter=$((counter + 5))
echo "Nach +5 : $counter"

# Vergleich
if [ $zahl1 -gt $zahl2 ]; then
    echo "$zahl1 ist größer als $zahl2"
fi
