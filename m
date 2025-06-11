Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EDB101F2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749619817; cv=none; b=U524iniprCkwlUXsA4+TOVHxzPRSQeYZ+y3GjZ8FjJ35oP/PovMZ9lLVXgW5JiJ6T7H7uGQctEsJuYISiPArTGrw8xCFEzT/tv4nAAwdycfXMbUTw6QFGIFFV0HdyZA+mgFvnPVT30vPVApwHHlnBOLXMZxjkWCWNiif+GjOXqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749619817; c=relaxed/simple;
	bh=aM/OFT++rI+086qQ55x0UqKTRTCF80K4UhLLZIkALcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aV0fT01ZVslWVXHyxFaAVxGs4egOcb1CMVyfTsG5d46aTKIpd37NDdmAbrOOfECdXx+Mbq2Y67Ky5p+ad1BeiIVa84UIWmd/BZfrP0LGQqJ4xHCiHz2mWyplsdne0WJ+wFKs5iPYpyWHmFj+80AWNkYyk5Zik5SVJvCf5IPxVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=g4QxcQKd; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="g4QxcQKd"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B5Towf2505597;
	Wed, 11 Jun 2025 00:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749619790;
	bh=Rf7ZPcEuwNT3RKggihs5cQU8+X3/WsG1MOZZ5+ZTdfs=;
	h=From:To:CC:Subject:Date;
	b=g4QxcQKdD7Y9QUAosp3IPv5GZ3blmc1IRT6SOl5EWAAdrHBhaDkumzyOjLsijCHR8
	 OVnT40mKJ5AKuRKD1US56Qwm0nnkfLbxaBXJx2Zg5O0rnmX77MprJsQQfd2WnUE6Hp
	 AFkcP077PCRYOqecItITzn2lbu4kl+x++lGZmtiQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B5TnVF783115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 00:29:49 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 00:29:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 00:29:49 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B5Tm7t4186376;
	Wed, 11 Jun 2025 00:29:48 -0500
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
        <devarsht@ti.com>, <j-choudhary@ti.com>, <geert@linux-m68k.org>
Subject: [PATCH v4] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type
Date: Wed, 11 Jun 2025 10:59:47 +0530
Message-ID: <20250611052947.5776-1-j-choudhary@ti.com>
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

Set HPD_DISABLE bit conditionally based on connector type.
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

Changelog v3->v4:
- Remove "no-hpd" support due to backward compatibility issues
- Change the conditional from "no-hpd" back to connector type
  but still address [1]

v3 patch link:
<https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

Changelog v2->v3:
- Change conditional based on no-hpd property to address [1]
- Remove runtime calls in detect() with appropriate comments
- Add hpd_enable() and hpd_disable() in drm_bridge_funcs

v2 patch link:
<https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Drop additional property in bindings and use conditional.
- Instead of register read for HPD state, use dpcd read which returns 0
  for success and error codes for no connection
- Add relevant history for the required change in commit message
- Drop RFC subject-prefix in v2
- Add "Cc:" tag

v1 patch link:
<https://lore.kernel.org/all/20250424105432.255309-1-j-choudhary@ti.com/>

[1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 ++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 60224f476e1d..b674a1aa1a37 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -348,12 +348,20 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
 	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
 	 * delay in its prepare and always disable HPD.
 	 *
-	 * If HPD somehow makes sense on some future panel we'll have to
-	 * change this to be conditional on someone specifying that HPD should
-	 * be used.
+	 * For DisplayPort connector type, now that HPD makes sense and is
+	 * required, use the connector type to conditionally disable HPD.
+	 *
+	 * NOTE: The bridge type is set in auxiliary_bridge probe but
+	 * enable_comms() can be called before. So for DisplayPort,
+	 * HPD will be enabled once bridge type is set.
+	 * "no-hpd" property is not used properly in devicetree description
+	 * and hence is unreliable. Therefore HPD is being enabled using
+	 * this conditional.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+
+	if (pdata->bridge.type != DRM_MODE_CONNECTOR_DisplayPort)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
+				   HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
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
@@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
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
@@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.debugfs_init = ti_sn65dsi86_debugfs_init,
+	.hpd_enable = ti_sn_bridge_hpd_enable,
+	.hpd_disable = ti_sn_bridge_hpd_disable,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
+				    DRM_BRIDGE_OP_HPD;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.34.1

