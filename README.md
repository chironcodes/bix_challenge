


# Bix_challenga


# Creating a service account that will work with mageai


```sh

export GOOGLE_CLOUD_PROJECT=adilton

gcloud iam service-accounts create mageai-job-runner \
    --display-name="Mageai Job Runner"


MAGEAI_SERVICE_ACCOUNT=mageai-job-runner@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com

```

## Give it all permissions required.

```sh

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
    --member serviceAccount:$MAGEAI_SERVICE_ACCOUNT \
    --role roles/bigquery.dataEditor \
    --role roles/bigquery.dataViewer \
    --role roles/bigquery.jobUser \
    --role roles/storage.objectViewer \
    --role roles/storage.insightsCollectorService
    
```

Export it locally
```sh

gcloud iam service-accounts keys create secrets/mageai-job-runner.json \
    --iam-account $MAGEAI_SERVICE_ACCOUNT

tr -d '\n' < secrets/mageai-job-runner.json > secrets/mageai-job-runner-oneline.json


```


```sh

```