set -x

export manager0=dosmanager0

export appVersion=0.1.1
export newImage=daominah/example_app:${appVersion}
docker build --tag=${newImage} .
docker push ${newImage}

docker-machine ssh ${manager0} \
    "docker service update --image ${newImage} example_app"

set +x
