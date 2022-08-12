# unleash.nix

Unleash feature management with Nix


## Creating new feature toggles via API

```bash
curl --location --request POST 'http://localhost:4242/api/admin/projects/default/features' \
    --header 'Authorization: INSERT_API_KEY' \
    --header 'Content-Type: application/json' \
    --data-raw '{
  "type": "release",
  "name": "",
  "description": "",
  "impressionData": false
}'
```

## Adding user IDs to feature parameters

```bash
curl --location --request POST 'http://localhost:4242/api/admin/projects/default/features/INSERT_FEATURE_NAME/environments/production/strategies' \
    --header 'Authorization: INSERT_API_KEY' \
    --header 'Content-Type: application/json' \
    --data-raw '{
  "name": "userWithId",
  "constraints": [],
  "parameters": {
    "userIds": "1"
  }
}'
```
