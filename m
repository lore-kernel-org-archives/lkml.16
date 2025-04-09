Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171E26B2D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216247; cv=none; b=V64WLfjyHl12sS/VvKgY1AqBzq8lxx/cEaQTOyNDfhUr9VW0c+uvc3wx81s9KaOK+FN34iZVQKq1H/tReV4suyKp6Q6hRTT/wE0rBoyutqkdOaMvRFM5P4udVPQmpfJTdC65Jb5A993XJD3f3JOWOS4uHn+nkNPxamdTn8XbT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216247; c=relaxed/simple;
	bh=UeTrrZiGC4g6FG2Qnmk09OC7YXGPlzyFy/Av0RePg+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDOKi9wkRmxya2NJY1+WQlcSpuvPQ1AiOcQl7wEf3whOCwty9nP8b6dOnsZgR3PpRVJIZvA1POJOx9gZuR7CzrsRFZYTD6Qq1btcjonSwG+Qg42T575dYvKuE3Fx5NSsNiQ4ZZj8NgXLELCe5I9lMa4ZTquCG8D8tvKcjJGT2EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XRQjGNaA; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XRQjGNaA"
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1F5742FC0052;
	Wed,  9 Apr 2025 18:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1744216235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv1LGOUNmwh012y33sRSiC7ve03lgZzUYhRmkjBwcVA=;
	b=XRQjGNaAsffNeMT1xzJZ/i2Bd7TmAdxH7TPzVC7w9SP+FIx+zgLwLELTfbNfohYTNpTpTA
	gnaGqNlrxQNhyEW+m4BjBzxQ0UKgxStGUVVk2tOUofLxMllcEZUv2x0ELu2fCpM+FGUbTt
	A8rOEcPJSZboiSdAByCdRk0kHXnUr2Y=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type on some TUXEDO devices
Date: Wed,  9 Apr 2025 18:27:00 +0200
Message-ID: <20250409163029.130651-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409163029.130651-1-wse@tuxedocomputers.com>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display backlight on TUXEDO Polaris AMD Gen2 and Gen3 with panels
BOE 2420 and BOE 2423 must be forced to pwn controlled to be able to
control the brightness.

This could already be archived via a module parameter, but this patch adds
a quirk to apply this by default on the mentioned device + panel
combinations.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 39df45f652b32..2bad6274ad8ff 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1625,11 +1625,13 @@ static bool dm_should_disable_stutter(struct pci_dev *pdev)
 struct amdgpu_dm_quirks {
 	bool aux_hpd_discon;
 	bool support_edp0_on_dp1;
+	bool boe_2420_2423_bl_force_pwm;
 };
 
 static struct amdgpu_dm_quirks quirk_entries = {
 	.aux_hpd_discon = false,
-	.support_edp0_on_dp1 = false
+	.support_edp0_on_dp1 = false,
+	.boe_2420_2423_bl_force_pwm = false
 };
 
 static int edp0_on_dp1_callback(const struct dmi_system_id *id)
@@ -1644,6 +1646,12 @@ static int aux_hpd_discon_callback(const struct dmi_system_id *id)
 	return 0;
 }
 
+static int boe_2420_2423_bl_force_pwm_callback(const struct dmi_system_id *id)
+{
+	quirk_entries.boe_2420_2423_bl_force_pwm = true;
+	return 0;
+}
+
 static const struct dmi_system_id dmi_quirk_table[] = {
 	{
 		.callback = aux_hpd_discon_callback,
@@ -1722,6 +1730,20 @@ static const struct dmi_system_id dmi_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 665 16 inch G11 Notebook PC"),
 		},
 	},
+	{
+		// TUXEDO Polaris AMD Gen2
+		.callback = boe_2420_2423_bl_force_pwm_callback,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
+		},
+	},
+	{
+		// TUXEDO Polaris AMD Gen3
+		.callback = boe_2420_2423_bl_force_pwm_callback,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
+		},
+	},
 	{}
 	/* TODO: refactor this from a fixed table to a dynamic option */
 };
@@ -3586,6 +3608,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	struct amdgpu_device *adev;
 	struct drm_luminance_range_info *luminance_range;
 	int min_input_signal_override;
+	u32 panel;
 
 	if (aconnector->bl_idx == -1 ||
 	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
@@ -3610,6 +3633,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_support = false;
 	else if (amdgpu_backlight == 1)
 		caps->aux_support = true;
+	else if (amdgpu_backlight == -1 &&
+		 quirk_entries.boe_2420_2423_bl_force_pwm) {
+		panel = drm_edid_get_panel_id(aconnector->drm_edid);
+		if (panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0974) ||
+		    panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0977))
+			caps->aux_support = false;
+	}
 	if (caps->aux_support)
 		aconnector->dc_link->backlight_control_type = BACKLIGHT_CONTROL_AMD_AUX;
 
-- 
2.43.0

