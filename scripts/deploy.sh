export VERSION=$(cat .version)
# envsubstでyamlのプレースホルダに環境変数を入れ込む
envsubst < kubernetes/main.yaml | kubectl apply -f -
