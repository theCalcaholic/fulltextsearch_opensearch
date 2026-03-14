/**
 * SPDX-FileCopyrightText: 2026 Felix Oertel
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

/** global: OCA */
/** global: opensearch_elements */
/** global: opensearch_settings */
/** global: opensearch_status */

$(document).ready(function () {

	/**
	 * @constructs OpenSearchAdmin
	 */
	var OpenSearchAdmin = function () {
		$.extend(OpenSearchAdmin.prototype, opensearch_elements);
		$.extend(OpenSearchAdmin.prototype, opensearch_settings);

		opensearch_elements.init();
		opensearch_settings.refreshSettingPage();
		opensearch_status.startPolling();
	};

	OCA.FullTextSearchAdmin.openSearch = OpenSearchAdmin;
	OCA.FullTextSearchAdmin.openSearch.settings = new OpenSearchAdmin();

});
