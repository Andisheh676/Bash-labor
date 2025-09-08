#!/bin/bash

# Globale Variablen für das Labor
LABOR_VERSION="1.0"
BENUTZER=""
AUFGABEN_GELOEST=0

zeige_menu() {
    clear
    echo "======================================="
    echo "    BASH VARIABLEN LABOR v${LABOR_VERSION}"
    echo "======================================="
    echo "Benutzer: $BENUTZER"
    echo "Gelöste Aufgaben: $AUFGABEN_GELOEST"
    echo "---------------------------------------"
    echo "1) String-Übungen"
    echo "2) Zahlen-Rechner"
    echo "3) Array-Experimente"
    echo "4) Umgebungsvariablen erkunden"
    echo "5) Variable Debugging"
    echo "6) Mini-Quiz"
    echo "7) Alle Variablen anzeigen"
    echo "0) Beenden"
    echo "======================================="
    echo -n "Ihre Wahl: "
}

string_uebungen() {
    echo
    echo "=== String-Übungen ==="
    read -p "Geben Sie einen Text ein: " input_text
    echo "Original: '$input_text'"
    echo "Länge: ${#input_text} Zeichen"
    echo "Großbuchstaben: '${input_text^^}'"
    echo "Kleinbuchstaben: '${input_text,,}'"
    echo "Erste 3 Zeichen: '${input_text:0:3}'"
    echo "Letzte 3 Zeichen: '${input_text: -3}'"

    read -p "Ersetzen Sie welches Wort? " alt_wort
    read -p "Durch welches Wort? " neu_wort
    ersetzt=${input_text/$alt_wort/$neu_wort}
    echo "Ersetzt: '$ersetzt'"

    AUFGABEN_GELOEST=$((AUFGABEN_GELOEST+1))
    echo
    read -p "Drücken Sie Enter..."
}

zahlen_rechner() {
    echo
    echo "=== Zahlen-Rechner ==="
    while true; do
        read -p "Erste Zahl (oder 'q' zum Beenden): " zahl1
        [[ "$zahl1" == "q" ]] && break
        read -p "Zweite Zahl: " zahl2

        if [[ "$zahl1" =~ ^[0-9]+$ && "$zahl2" =~ ^[0-9]+$ ]]; then
            echo "Addition: $zahl1 + $zahl2 = $((zahl1 + zahl2))"
            echo "Subtraktion: $zahl1 - $zahl2 = $((zahl1 - zahl2))"
            echo "Multiplikation: $zahl1 × $zahl2 = $((zahl1 * zahl2))"
            if [[ $zahl2 -ne 0 ]]; then
                echo "Division: $zahl1 ÷ $zahl2 = $((zahl1 / zahl2))"
                echo "Modulo: $zahl1 % $zahl2 = $((zahl1 % zahl2))"
            fi
            echo
        else
            echo "Fehler: Bitte geben Sie nur ganze Zahlen ein!"
        fi
    done

    AUFGABEN_GELOEST=$((AUFGABEN_GELOEST+1))
    read -p "Drücken Sie Enter..."
}

array_experimente() {
    echo
    echo "=== Array-Experimente ==="
    declare -a meine_liste=()
    echo "Fügen Sie 5 Elemente zu Ihrem Array hinzu:"
    for i in {1..5}; do
        read -p "Element $i: " element
        meine_liste+=("$element")
    done

    echo
    echo "Ihr Array:"
    for i in "${!meine_liste[@]}"; do
        echo "[$i] ${meine_liste[$i]}"
    done

    echo
    echo "Array-Informationen:"
    echo "Anzahl Elemente: ${#meine_liste[@]}"
    echo "Alle Elemente: ${meine_liste[*]}"
    echo "Erstes Element: ${meine_liste[0]}"
    echo "Letztes Element: ${meine_liste[-1]}"

    AUFGABEN_GELOEST=$((AUFGABEN_GELOEST+1))
    echo
    read -p "Drücken Sie Enter..."
}

umgebung_erkunden() {
    echo
    echo "=== Umgebungsvariablen erkunden ==="
    echo "USER: $USER"
    echo "HOME: $HOME"
    echo "PWD: $PWD"
    echo "SHELL: $SHELL"
    echo "HOSTNAME: $HOSTNAME"
    echo "LANG: $LANG"

    read -p "Setzen Sie eine eigene Variable (Name=Wert): " user_var
    if [[ $user_var == *"="* ]]; then
        export "$user_var"
        var_name="${user_var%%=*}"
        echo "Variable $var_name gesetzt!"
        echo "Wert: ${!var_name}"
    fi

    AUFGABEN_GELOEST=$((AUFGABEN_GELOEST+1))
    echo
    read -p "Drücken Sie Enter..."
}

variable_debugging() {
    echo
    echo "=== Variable Debugging ==="
    gesetzt="Ich bin gesetzt"
    leer=""
    # nicht_gesetzt bleibt undefiniert

    echo "gesetzt='$gesetzt'"
    echo "leer='$leer'"
    echo "nicht_gesetzt='$nicht_gesetzt'"

    echo
    echo "Tests:"
    [[ -n "$gesetzt" ]] && echo "✓ 'gesetzt' ist nicht leer"
    [[ -z "$leer" ]] && echo "✓ 'leer' ist leer"
    [[ -z "$nicht_gesetzt" ]] && echo "✓ 'nicht_gesetzt' ist nicht gesetzt"

    AUFGABEN_GELOEST=$((AUFGABEN_GELOEST+1))
    echo
    read -p "Drücken Sie Enter..."
}

mini_quiz() {
    echo
    echo "=== Mini-Quiz über Variablen ==="
    local punkte=0
    local antwort

    echo "1. Wie definiert man eine Variable in Bash?"
    echo "   a) var = wert   b) var=wert   c) set var=wert"
    read -p "Antwort: " antwort
    if [[ "$antwort" == "b" ]]; then
        echo "✓ Richtig!"
        punkte=$((punkte+1))
    else
        echo "✗ Falsch. Richtig ist: b) var=wert"
    fi
    echo

    echo "2. Wie gibt man den Wert einer Variable aus?"
    echo "   a) echo var   b) echo \$var   c) print var"
    read -p "Antwort: " antwort
    if [[ "$antwort" == "b" ]]; then
        echo "✓ Richtig!"
        punkte=$((punkte+1))
    else
        echo "✗ Falsch. Richtig ist: b) echo \$var"
    fi
    echo

    echo "3. Wie ermittelt man die Länge eines Strings?"
    echo "   a) \${#var}   b) length(var)   c) \$var.length"
    read -p "Antwort: " antwort
    if [[ "$antwort" == "a" ]]; then
        echo "✓ Richtig!"
        punkte=$((punkte+1))
    else
        echo "✗ Falsch. Richtig ist: a) \${#var}"
    fi
    echo

    echo "Quiz beendet! Sie haben $punkte von 3 Punkten erreicht."
    AUFGABEN_GELOEST=$((AUFGABEN_GELOEST+1))
    echo
    read -p "Drücken Sie Enter..."
}

alle_variablen_anzeigen() {
    echo
    echo "=== Alle definierten Variablen ==="
    echo "Labor-Variablen:"
    echo "  LABOR_VERSION=$LABOR_VERSION"
    echo "  BENUTZER=$BENUTZER"
    echo "  AUFGABEN_GELOEST=$AUFGABEN_GELOEST"

    echo
    echo "Lokale Variablen (erste 10):"
    set | grep "^[a-zA-Z_]" | head -10

    echo
    read -p "Drücken Sie Enter..."
}

# Hauptprogramm
main() {
    echo "Willkommen zum Bash Variablen Labor!"
    read -p "Wie ist Ihr Name? " BENUTZER
    local wahl
    while true; do
        zeige_menu
        read wahl
        case $wahl in
            1) string_uebungen ;;
            2) zahlen_rechner ;;
            3) array_experimente ;;
            4) umgebung_erkunden ;;
            5) variable_debugging ;;
            6) mini_quiz ;;
            7) alle_variablen_anzeigen ;;
            0)
                echo
                echo "Auf Wiedersehen, $BENUTZER!"
                echo "Sie haben $AUFGABEN_GELOEST Aufgaben gelöst."
                exit 0
                ;;
            *)
                echo "Ungültige Wahl!"
                sleep 1
                ;;
        esac
    done
}

# Programm starten
main
