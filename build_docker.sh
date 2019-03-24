set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

TYPE=$1

if [ "$TYPE" == "base" ]; then
    docker build -t dl_base -f Dockerfile.base .
else
    docker build -t dl_docker -f Dockerfile .
fi
