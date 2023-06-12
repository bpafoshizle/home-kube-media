helm repo add home-kube-media https://bpafoshizle.github.io/home-kube-media
helm repo update

helm install radarr home-kube-media/radarr \
    --values ../kube/media/media.radarr.values.yml \
    --namespace media

