AUI().use(
	'aui-base',
	'transition',
	function(A) {
		Liferay.namespace('SO');

		Liferay.SO.Activities = {
			toggleEntry: function(event, portletNamespace) {
				var entryId = event.currentTarget.attr('data-entryId');

				var entry = A.one('#' + portletNamespace + entryId);

				var body = entry.one('.grouped-activity-body');
				var bodyContainer = entry.one('.grouped-activity-body-container');
				var control = entry.one('.toggle-entry');
				var subentryHeight = entry.one('.activity-subentry').outerHeight();

				var minHeight = (subentryHeight * 3) + 'px';

				var bodyHeight = minHeight;

				if (entry.hasClass('toggler-content-collapsed')) {
					entry.removeClass('toggler-content-collapsed');

					bodyContainer.setStyle('height', minHeight);
					bodyContainer.setStyle('max-height', 'none');

					bodyHeight = body.height() + 'px';

					if (control) {
						control.html(Liferay.Language.get('view-less'));
					}
				}
				else {
					entry.addClass('toggler-content-collapsed');

					if (control) {
						control.html(Liferay.Language.get('view-more'));
					}
				}

				bodyContainer.transition(
					{
						duration: 0.5,
						easing: 'ease-in-out',
						height: bodyHeight
					}
				);
			}
		};
	}
);