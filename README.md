# unleash.nix

Unleash feature management with Nix


## Creating new feature toggles via API

```
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
