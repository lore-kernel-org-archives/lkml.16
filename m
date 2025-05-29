Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089EF1E0DE2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516697; cv=none; b=KxihhRiX3OJ/faoY0UvqE1YW6LMBK6NH0sYP7JuS+0ptsgTCtFCc8fNp3WTcgdUAuR5UM/CJ67GW08Eib2Ui9ORACHgnFRlpn32kXBdizpVqTnUAwI8ZozfgVZYCt7v9IWq9okn7exWLii6X3kcy5RiYTZ+YLll6+hQW6MRjdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516697; c=relaxed/simple;
	bh=L7eeCaEmQT3B2EkVt74tDBVVWouAKiKcV7oF52jndK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tfy8xP3/2bkZeN+YtBO5fbZHmeP13UQlxVF+5puHBbOfkiH4k5furCrg6bQlPAI8EI9vL9CSQ+xBEuFf4sAvpKAw6+0AyU8dEjaj3wtznGWUU367VXXQwooc4iFk3etJoR7laheyMYv+HoIkfWLJEImGc2NuGh1ciEsGrJfTpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wTad5+HL; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wTad5+HL"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TB4KGp2383070;
	Thu, 29 May 2025 06:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748516660;
	bh=Iw23YeKhX7fGnl9l2Fbn9RFA0j/KiCK+ixD/+jWdDSA=;
	h=From:To:CC:Subject:Date;
	b=wTad5+HLpT9jGceTDpzarKEOqfihDSBuuMvbGxl958WSgj1qdJbHPTnWkqw014AiN
	 bcW7aRxPuAy8BCyE8QKUmT0X+whcZaggLpIgpieY96gVhP/xX4zbuUmKXmpm60UQs5
	 wmNe1czMhsLr6fW3KrCGIrALxuixis0zutrUJQJo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TB4JR0103762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 06:04:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 06:04:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 06:04:19 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TB4IpD1450759;
	Thu, 29 May 2025 06:04:19 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
        <ernestvanhoecke@gmail.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <kieran.bingham+renesas@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
        <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type
Date: Thu, 29 May 2025 16:34:18 +0530
Message-ID: <20250529110418.481756-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

By default, HPD was disabled on SN65DSI86 bridge. When the driver was
added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
call which was moved to other function calls subsequently.
Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
state always return 1 (always connected state).

Set HPD_DISABLE bit conditionally based on "no-hpd" property.
Since the HPD_STATE is reflected correctly only after waiting for debounce
time (~100-400ms) and adding this delay in detect() is not feasible
owing to the performace impact (glitches and frame drop), remove runtime
calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
calls, to detect hpd properly without any delay.

[0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)

Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Changelog v2->v3:
- Change conditional based on no-hpd property to address [1]
- Remove runtime calls in detect() with appropriate comments
- Add hpd_enable() and hpd_disable() in drm_bridge_funcs
- Not picking up "Tested-by" tag as there are new changes

v2 patch link:
<https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>

[1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>

This would also require dts changes in all the nodes of sn65dsi86
to ensure that they have no-hpd property.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 60224f476e1d..e9ffc58acf58 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -190,6 +190,7 @@ struct ti_sn65dsi86 {
 	u8				ln_assign;
 	u8				ln_polrs;
 	bool				comms_enabled;
+	bool				no_hpd;
 	struct mutex			comms_mutex;
 
 #if defined(CONFIG_OF_GPIO)
@@ -352,8 +353,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
 	 * change this to be conditional on someone specifying that HPD should
 	 * be used.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+
+	if (pdata->no_hpd)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
+				   HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -1195,9 +1198,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int val = 0;
 
-	pm_runtime_get_sync(pdata->dev);
+	/*
+	 * The chip won't report HPD right after being powered on as
+	 * HPD_DEBOUNCED_STATE reflects correct state only after the
+	 * debounce time (~100-400 ms).
+	 * So having pm_runtime_get_sync() and immediately reading
+	 * the register in detect() won't work, and adding delay()
+	 * in detect will have performace impact in display.
+	 * So remove runtime calls here.
+	 */
+
 	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
 
 	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
 					 : connector_status_disconnected;
@@ -1220,6 +1231,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
+static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	pm_runtime_get_sync(pdata->dev);
+}
+
+static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	pm_runtime_put_sync(pdata->dev);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
@@ -1234,6 +1259,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.debugfs_init = ti_sn65dsi86_debugfs_init,
+	.hpd_enable = ti_sn_bridge_hpd_enable,
+	.hpd_disable = ti_sn_bridge_hpd_disable,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1322,7 +1349,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
+				    DRM_BRIDGE_OP_HPD;
 
 	drm_bridge_add(&pdata->bridge);
 
@@ -1935,6 +1963,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(pdata->refclk),
 				     "failed to get reference clock\n");
 
+	pdata->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
+
 	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
 	pm_runtime_use_autosuspend(pdata->dev);
-- 
2.34.1

