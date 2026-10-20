# 1. Definimos las partes de la URL por separado para que el chat no las altere
URL_START="https://github.com"
URL_MID="/Bearer/bearer/releases/download"
URL_END="/v2.1.2/bearer_2.1.2_linux_arm64.tar.gz"

# 2. Descargamos el archivo directamente a tu Mac en la carpeta local
curl -L "${URL_START}${URL_MID}${URL_END}" -o bearer.tar.gz

# 3. Compilamos la imagen usando el archivo local que acabamos de bajar
docker build --no-cache -t mi-bearer-arm64 .