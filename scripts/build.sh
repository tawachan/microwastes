VERSION=$(cat .version)
HOST_NAME=asia.gcr.io
PROJECT_ID=microwastes

WASTES_NAME=$HOST_NAME/$PROJECT_ID/main:$VERSION
docker build . -f Dockerfile -t $WASTES_NAME
gcloud docker -- push $WASTES_NAME
