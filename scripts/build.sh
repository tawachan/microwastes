VERSION=$(cat .version)
HOST_NAME=asia.gcr.io
PROJECT_ID=microwastes

WASTES_NAME=$HOST_NAME/$PROJECT_ID/wastes:$VERSION
docker build . -f Dockerfile -t $WASTES_NAME
docker push $WASTES_NAME
