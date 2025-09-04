#!/bin/bash
echo "====== String-Operationen mit Variablen ======"

# Grundvariable
text="Hallo Bash Welt"
echo "Original: $text"

# String-Länge ermitteln
laenge=${#text}
echo "Länge: $laenge Zeichen"

# Teilstrings extrahieren
teil1=${text:0:5}      # Erste 5 Zeichen
teil2=${text:6:4}      # 4 Zeichen ab Position 6
teil3=${text:11}       # Alle Zeichen ab Position 11
echo "Teil 1: $teil1"
echo "Teil 2: $teil2"
echo "Teil 3: $teil3"

# String ersetzen
neuer_text=${text/Bash/Shell}      # Erstes Vorkommen ersetzen
echo "Ersetzt: $neuer_text"
alles_ersetzt=${text//a/A}         # Alle 'a' durch 'A'
echo "Alle 'a' ersetzt: $alles_ersetzt"

# Groß-/Kleinschreibung
gross=${text^^}    # Alles groß
klein=${text,,}    # Alles klein
echo "Großbuchstaben: $gross"
echo "Kleinbuchstaben: $klein"

# String verkettet
vorname="Max"
nachname="Mustermann"
vollername="$vorname $nachname"
echo "Voller Name: $vollername"

# Mit Separator verkettet
email="$vorname.$nachname@example.com"
echo "Email: $email"
