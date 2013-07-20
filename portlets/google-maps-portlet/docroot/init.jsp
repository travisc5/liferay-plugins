<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="com.liferay.compat.portal.util.PortalUtil" %><%@
page import="com.liferay.googlemaps.portlet.GoogleMapsConstants" %><%@
page import="com.liferay.portal.kernel.util.Constants" %><%@
page import="com.liferay.portal.kernel.util.GetterUtil" %><%@
page import="com.liferay.portal.kernel.util.ParamUtil" %><%@
page import="com.liferay.portal.kernel.util.StringPool" %><%@
page import="com.liferay.portal.kernel.util.Validator" %><%@
page import="com.liferay.portlet.PortletPreferencesFactoryUtil" %>

<%@ page import="javax.portlet.PortletPreferences" %>

<portlet:defineObjects />

<liferay-theme:defineObjects />

<%
PortletPreferences preferences = renderRequest.getPreferences();

String portletResource = ParamUtil.getString(request, "portletResource");

String directionsAddress = GetterUtil.getString(preferences.getValue("directionsAddress", null));
boolean directionsInputEnabled = GetterUtil.getBoolean(preferences.getValue("directionsInputEnabled", null));
String mapAddress = GetterUtil.getString(preferences.getValue("mapAddress", null));
boolean mapInputEnabled = GetterUtil.getBoolean(preferences.getValue("mapInputEnabled", null));

boolean enableChangingTravelingMode = false;

if (directionsInputEnabled) {
	enableChangingTravelingMode = GetterUtil.getBoolean(preferences.getValue("enableChangingTravelingMode", null));
}

int height = GetterUtil.getInteger(preferences.getValue("height", null), 400);
boolean showDirectionSteps = GetterUtil.getBoolean(preferences.getValue("showDirectionSteps", null));
boolean showGoogleMapsLink = GetterUtil.getBoolean(preferences.getValue("showGoogleMapsLink", null));
%>