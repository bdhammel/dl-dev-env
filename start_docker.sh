set -o errexit
set -o pipefail
set -o nounset

THIS_DIR=$(pwd | sed "s|^$HOME|/root|")

if [[ $OSTYPE == linux* ]]; then
    docker run --rm -it \
        -e DISPLAY=$DISPLAY \
        --network=host \
        --runtime=nvidia \
        --hostname $(hostname) \
        --workdir="/root/Documents" \
        --volume="/Users/$USER/Documents:/root/Documents" \
        --volume="$HOME/.Xauthority:/home/mythic/.Xauthority" \
        --user root \
        dl_docker \
        bash
else
    docker run -it \
        -e DISPLAY=host.docker.internal:0 \
        --workdir="/root/Documents" \
        --volume="/Users/$USER/Documents:/root/Documents" \
        --user root \
        dl_docker \
        bash
fi
