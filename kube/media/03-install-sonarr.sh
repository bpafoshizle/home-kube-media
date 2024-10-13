helm repo add home-kube-media https://bpafoshizle.github.io/home-kube-media
helm repo update

helm install sonarr home-kube-media/sonarr \
    --values ../kube/media/media.sonarr.values.yml \
    --namespace media

