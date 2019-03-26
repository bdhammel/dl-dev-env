set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

TYPE=$1

if [ "$TYPE" == "base" ]; then
    docker build -t dl_base -f Dockerfile .
elif [ "$TYPE" == "gpu" ]; then
    docker build -t dl_docker:gpu -f Dockerfile.gpu .
elif [ "$TYPE" == "cpu" ]; then
    docker build -t dl_docker:cpu -f Dockerfile.cpu .
else
    echo "Must pass argument of ['base', 'gpu', 'cpu']"
fi
