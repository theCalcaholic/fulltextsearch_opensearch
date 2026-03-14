# SPDX-FileCopyrightText: 2026 Felix Oertel
# SPDX-License-Identifier: AGPL-3.0-or-later

APP_NAME := fulltextsearch_opensearch

.PHONY: all
all: vendor scoper lint

.PHONY: vendor
vendor: composer.json
	composer install --no-dev --prefer-dist
	@echo "Vendor libraries installed."

.PHONY: scoper
scoper: vendor
	# Ensure minimum-stability allows dev dependencies (jetbrains/phpstorm-stubs)
	mkdir -p vendor-bin/php-scoper
	echo '{"minimum-stability":"dev","prefer-stable":true}' > vendor-bin/php-scoper/composer.json
	# Install php-scoper via composer-bin-plugin
	composer bin php-scoper require --dev humbug/php-scoper:^0.18.19
	# Run php-scoper (outputs to lib/Vendor)
	vendor-bin/php-scoper/vendor/humbug/php-scoper/bin/php-scoper add-prefix \
		--config=scoper.inc.php \
		--output-dir=lib/Vendor \
		--force
	@echo "Vendor libraries scoped to OCA\\FullTextSearch_OpenSearch\\Vendor"

.PHONY: clean
clean:
	rm -rf vendor/ lib/Vendor/ vendor-bin/

.PHONY: lint
lint:
	! find lib/ -name "*.php" -exec php -l {} \; 2>&1 | grep -v "^No syntax errors"

.PHONY: cs
cs:
	php-cs-fixer fix --dry-run --diff
