Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65732459D0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750743941; cv=none; b=pEHc8tExAT97fNn7SNnglopLZ2+B+P0b52aWaaH9Pd9j7xkiKLwW7LeziGuf7Gs4AANmBAPl/hAWG8Ygx5rUMQQt1UnUr0vSSrrywSo8qKZsGJvgmg4pBQlQu8Z+nIBWpz5Zbs34NjQDCJDKgKBS1XFSNAOH2jghe0rW3HfCgVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750743941; c=relaxed/simple;
	bh=Oexe/8QD8uFqCuagDVRbWvMsin+UY6v/OQBrm2i2hKo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b16c2l+Aaei0M8bbgNmiWR2cL+3Lf8i5t82CxUmT/8yrO4+kofs+dMbibfrDXQ+BSRp4eBh0ySgtlctDuMc8PEktrSL4YHV0XKIHnJ6E7ACUjC0Y0EvfjrBYoH+9wPbMDw7QLegB4IKEWwb7pt+rDIgnT5doPcijJMmXSPYrlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sCaBgi3Z; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sCaBgi3Z"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O5ita91699734;
	Tue, 24 Jun 2025 00:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750743895;
	bh=Y/ioxQgw5NxX3d/2qfq2d6PvoOYWGX0nsj+uln0FJTo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sCaBgi3ZYAoM/lt/nJv0ghmLNbJJK0MmPbSMyPLZinIkBpnVgGdiefq91T+VsGCVt
	 Y46f0a9GFP7iQ2MxV/TCp5rzq1sr5oL8Klm7QK4CGyJ8JXvamegJDAaVntggNYa9L7
	 xMuwqFtwdznONieQjpASBRXJDrNFwMITJrvYeLAw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O5it0t3929002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 00:44:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 00:44:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 00:44:51 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O5ioLT961963;
	Tue, 24 Jun 2025 00:44:51 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
        <lumag@kernel.org>, <dianders@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
        <airlied@gmail.com>, <simona@ffwll.ch>, <lyude@redhat.com>,
        <luca.ceresoli@bootlin.com>, <viro@zeniv.linux.org.uk>,
        <andy.yan@rock-chips.com>, <linux@treblig.org>, <javierm@redhat.com>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v4 1/5] drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for connector initialisation in bridge
Date: Tue, 24 Jun 2025 11:14:44 +0530
Message-ID: <20250624054448.192801-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624054448.192801-1-j-choudhary@ti.com>
References: <20250624054448.192801-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Now that we have DBANC framework, remove the connector initialisation code
as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
is used. Only TI K3 platforms consume this driver and tidss (their display
controller) has this flag set. So this legacy support can be dropped.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 187 +-----------------
 1 file changed, 10 insertions(+), 177 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index cb5f5a8c539a..6e78c337fdfa 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -739,12 +739,8 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	spin_lock(&mhdp->start_lock);
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
-	if (bridge_attached) {
-		if (mhdp->connector.dev)
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
-		else
-			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
-	}
+	if (bridge_attached)
+		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 }
 
 static int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp)
@@ -1444,56 +1440,6 @@ static const struct drm_edid *cdns_mhdp_edid_read(struct cdns_mhdp_device *mhdp,
 	return drm_edid_read_custom(connector, cdns_mhdp_get_edid_block, mhdp);
 }
 
-static int cdns_mhdp_get_modes(struct drm_connector *connector)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
-	const struct drm_edid *drm_edid;
-	int num_modes;
-
-	if (!mhdp->plugged)
-		return 0;
-
-	drm_edid = cdns_mhdp_edid_read(mhdp, connector);
-
-	drm_edid_connector_update(connector, drm_edid);
-
-	if (!drm_edid) {
-		dev_err(mhdp->dev, "Failed to read EDID\n");
-		return 0;
-	}
-
-	num_modes = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	/*
-	 * HACK: Warn about unsupported display formats until we deal
-	 *       with them correctly.
-	 */
-	if (connector->display_info.color_formats &&
-	    !(connector->display_info.color_formats &
-	      mhdp->display_fmt.color_format))
-		dev_warn(mhdp->dev,
-			 "%s: No supported color_format found (0x%08x)\n",
-			__func__, connector->display_info.color_formats);
-
-	if (connector->display_info.bpc &&
-	    connector->display_info.bpc < mhdp->display_fmt.bpc)
-		dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
-			 __func__, connector->display_info.bpc,
-			 mhdp->display_fmt.bpc);
-
-	return num_modes;
-}
-
-static int cdns_mhdp_connector_detect(struct drm_connector *conn,
-				      struct drm_modeset_acquire_ctx *ctx,
-				      bool force)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
-	return cdns_mhdp_detect(mhdp);
-}
-
 static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
 {
 	u32 bpp;
@@ -1547,114 +1493,6 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
 	return true;
 }
 
-static
-enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
-					  const struct drm_display_mode *mode)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
-	mutex_lock(&mhdp->link_mutex);
-
-	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
-				    mhdp->link.rate)) {
-		mutex_unlock(&mhdp->link_mutex);
-		return MODE_CLOCK_HIGH;
-	}
-
-	mutex_unlock(&mhdp->link_mutex);
-	return MODE_OK;
-}
-
-static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
-					    struct drm_atomic_state *state)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-	struct drm_connector_state *old_state, *new_state;
-	struct drm_crtc_state *crtc_state;
-	u64 old_cp, new_cp;
-
-	if (!mhdp->hdcp_supported)
-		return 0;
-
-	old_state = drm_atomic_get_old_connector_state(state, conn);
-	new_state = drm_atomic_get_new_connector_state(state, conn);
-	old_cp = old_state->content_protection;
-	new_cp = new_state->content_protection;
-
-	if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
-	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		goto mode_changed;
-	}
-
-	if (!new_state->crtc) {
-		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
-			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return 0;
-	}
-
-	if (old_cp == new_cp ||
-	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
-	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
-		return 0;
-
-mode_changed:
-	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
-	crtc_state->mode_changed = true;
-
-	return 0;
-}
-
-static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
-	.detect_ctx = cdns_mhdp_connector_detect,
-	.get_modes = cdns_mhdp_get_modes,
-	.mode_valid = cdns_mhdp_mode_valid,
-	.atomic_check = cdns_mhdp_connector_atomic_check,
-};
-
-static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-	.reset = drm_atomic_helper_connector_reset,
-	.destroy = drm_connector_cleanup,
-};
-
-static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
-{
-	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
-	struct drm_connector *conn = &mhdp->connector;
-	struct drm_bridge *bridge = &mhdp->bridge;
-	int ret;
-
-	conn->polled = DRM_CONNECTOR_POLL_HPD;
-
-	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
-
-	ret = drm_display_info_set_bus_formats(&conn->display_info,
-					       &bus_format, 1);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(conn, bridge->encoder);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to attach connector to encoder\n");
-		return ret;
-	}
-
-	if (mhdp->hdcp_supported)
-		ret = drm_connector_attach_content_protection_property(conn, true);
-
-	return ret;
-}
-
 static int cdns_mhdp_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -1671,9 +1509,11 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 		return ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		ret = cdns_mhdp_connector_init(mhdp);
-		if (ret)
-			goto aux_unregister;
+		ret = -EINVAL;
+		dev_err(mhdp->dev,
+			"Connector initialisation not supported in bridge_attach %d\n",
+			ret);
+		goto aux_unregister;
 	}
 
 	spin_lock(&mhdp->start_lock);
@@ -2367,17 +2207,10 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(work,
 						     struct cdns_mhdp_device,
 						     hpd_work);
-	int ret;
 
-	ret = cdns_mhdp_update_link_status(mhdp);
-	if (mhdp->connector.dev) {
-		if (ret < 0)
-			schedule_work(&mhdp->modeset_retry_work);
-		else
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
-	} else {
-		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
-	}
+	cdns_mhdp_update_link_status(mhdp);
+
+	drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 }
 
 static int cdns_mhdp_probe(struct platform_device *pdev)
-- 
2.34.1

