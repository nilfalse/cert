# cert

Obtain automated SSL/TLS certificates with wildcard support using this `Makefile`. Can run on CI (e.g. Github Actions).

## Prerequisites

- ZeroSSL EAB credentials, see details at https://zerossl.com/documentation/acme/
- DNS for the domain must be managed by [Cloudflare](https://www.cloudflare.com/en-gb/).

## Sample `cli.ini`

```ini
email = root@example.com

agree-tos = true
no-eff-email = true
non-interactive = true
staple-ocsp = true

rsa-key-size = 4096

server = https://acme.zerossl.com/v2/DV90
eab-kid = ...
eab-hmac-key = ...
```

## Optional fine-tuning

Optionally you may want to configure the following CAA records for your apex domain:
  - `iodef mailto:youremail@example.com`
  - `issuewild sectigo.com`
  - `issue sectigo.com`
