helm repo add home-kube-media https://bpafoshizle.github.io/home-kube-media
helm repo update

helm install readarr home-kube-media/readarr \
    --values ../kube/media/media.readarr.values.yml \
    --namespace media

