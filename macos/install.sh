#!/bin/sh
# Instala somente o iniciador; não copia, altera ou substitui arquivos do jogo.
set -eu

SCRIPT_DIRECTORY="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
SOURCE_APP="$SCRIPT_DIRECTORY/../The Sims Life Stories PT.app"
DESTINATION="${PATCH_PORTUGUESE_DEST:-$HOME/Desktop/The Sims Life Stories PT.app}"

if [ ! -d "$SOURCE_APP" ]; then
    echo "Erro: o pacote The Sims Life Stories PT.app não foi encontrado." >&2
    exit 1
fi

if [ -e "$DESTINATION" ]; then
    echo "Erro: o destino já existe: $DESTINATION" >&2
    echo "Remova o iniciador anterior ou escolha outro destino." >&2
    exit 1
fi

/bin/mkdir -p "$(dirname "$DESTINATION")"
/usr/bin/ditto --rsrc "$SOURCE_APP" "$DESTINATION"
/bin/chmod 755 "$DESTINATION/Contents/MacOS/applet"

echo "Instalado em: $DESTINATION"
