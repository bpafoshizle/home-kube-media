helm repo add home-kube-media https://bpafoshizle.github.io/home-kube-media
helm repo update

helm install prowlarr home-kube-media/prowlarr \
    --values ../kube/media/media.prowlarr.values.yml \
    --namespace media

