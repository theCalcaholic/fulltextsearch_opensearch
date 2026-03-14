# Full text search - OpenSearch Platform

This is a platform provider extension for Nextcloud's [Full text search](https://github.com/nextcloud/fulltextsearch) framework that uses [OpenSearch](https://opensearch.org/) as the search backend.

## Features

- Full implementation of `IFullTextSearchPlatform` for OpenSearch 2.x
- Using official OpenSearch PHP client
- Admin settings UI with real-time indexing status monitoring (👩‍🔧 tbd)
- Cluster health, index info, queue progress, and runner state (👩‍🔧 tbd)
- Adaptive polling (3s while indexing, 30s when idle)
- OCC command for CLI configuration
- Config Lexicon support (Nextcloud 32+)
- Ingest attachment pipeline for binary document extraction

## Requirements

- Nextcloud 32 or 33
- OpenSearch 2.x with the `ingest-attachment` plugin
- PHP 8.2+

## Configuration

### Admin UI

Navigate to **Administration Settings → Full text search** to configure:

- **OpenSearch Host**: URL(s) of your OpenSearch instance (e.g. `http://nextcloud-aio-opensearch:9200`)
- **Index Name**: Name of the OpenSearch index to use (e.g. `nextcloud-aio`)
- **Analyzer Tokenizer**: Custom tokenizer (default: `standard`)
- **Allow Self-Signed Certificates**: Skip SSL verification
- **Enable Client Logging**: Log client requests (warning: credentials may appear in debug logs)

## Building

```bash
# Install dependencies
make vendor

# Scope vendor libraries (required for production)
make scoper

# Lint PHP files
make lint
```

or do it all at once

```bash
make all
```

## License

AGPL-3.0-or-later
