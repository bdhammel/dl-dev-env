set -o errexit
set -o pipefail
set -o nounset

THIS_DIR=$(pwd | sed "s|^$HOME|/root|")

if [[ $OSTYPE == linux* ]]; then
    docker run --rm -it \
        -e DISPLAY=$DISPLAY \
        --network=host \
        --hostname $(hostname) \
        --runtime=nvidia \
        --workdir="/root/Documents" \
        --volume="/Users/$USER/Documents:/root/Documents" \
        --volume="$HOME/.Xauthority:/home/mythic/.Xauthority" \
        --user root \
        dl_docker:gpu \
        bash
else
    docker run --rm -it \
        -e DISPLAY=host.docker.internal:0 \
        --workdir="/root/Documents" \
        --volume="/Users/$USER/Documents:/root/Documents" \
        --user root \
        dl_docker:cpu \
        bash
fi
