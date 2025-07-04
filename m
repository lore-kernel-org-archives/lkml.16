Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E020D4F8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656836; cv=none; b=ua3FaqnChzzaTzI9nAOPNDbYd1bQKoOcrh4Py+B1NCJFttzXYFhfxpv9AmRXSdfd2hU7X191A6E3pH5s8meFau1HB7EY9fbN5QIcd4ruWlXHJKlIbbz7TWGQUERxjqJS1gjhRdgusU+I0NxVsjiGngbJ+jS5D60RL65f+ueeR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656836; c=relaxed/simple;
	bh=1K02/yxlbKA0C2mZz21mc6q8YxTEIMwWof78fLucno8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBFnejh2oMcuVSCqj9DPtBJx/H7JhdHSAdx5/rFKTdq8XkyTAtToixA3UcUnqjA8Lm0pnp5SS8ICxwRQx83U3wEZ37YBwLMPS3bG0jNIeaFHRqIfwcrsr4yXjbOiGbIuYFWpMHXkWnVkIQarc13cp3vyvzNwVTGjixqmQ+p3rz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=PR+2xoaQ; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="PR+2xoaQ"
Received: from wse-pc.fritz.box (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 3E54F2FC00A3;
	Fri,  4 Jul 2025 21:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1751656824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FI4wcSRyziI8xdf6I8dg5gPLqWgZXWsbhhOo4O2J6c=;
	b=PR+2xoaQw7M1ghb2QA3aJ/RFQbhx8sN242qKExuCiPyvbVyELiEVSwI9pFrLObTm7pvCgo
	VR8m4h0I4Q2lso6Q3ncq1N7z5TuV7BgPWUR8VDFgZMj7pPqPLO5fhTUoP7Gg81vXputRxz
	UuFagD0xRAQaiM/HFL5yoDthgEpr2h4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] drm/i915/display: Avoid unsupported 300Hz output mode on a TUXEDO device
Date: Fri,  4 Jul 2025 21:03:46 +0200
Message-ID: <20250704192007.526044-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704192007.526044-1-wse@tuxedocomputers.com>
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>

Removes all display modes with more than 240 Hz for the integrated display
on a TUXEDO Stellaris 16 Gen7, because using the iGPU with higer refresh
rates causes screen flicker.

Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
 drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 640c43bf62d4c..5ce00cfe36ee1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1436,6 +1436,11 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	if (mode->clock < 10000)
 		return MODE_CLOCK_LOW;
 
+	if (intel_has_quirk(display, QUIRK_EDP_MAX_240HZ_HOOK) &&
+	    intel_dp_is_edp(intel_dp) &&
+	    drm_mode_vrefresh(mode) > 240)
+		return MODE_BAD;
+
 	fixed_mode = intel_panel_fixed_mode(connector, mode);
 	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
 		status = intel_panel_mode_valid(connector, mode);
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index a32fae510ed27..438ce2cb37a01 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -72,6 +72,12 @@ static void quirk_no_pps_backlight_power_hook(struct intel_display *display)
 	drm_info(display->drm, "Applying no pps backlight power quirk\n");
 }
 
+static void quirk_edp_max_240hz_hook(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_EDP_MAX_240HZ_HOOK);
+	drm_info(display->drm, "Applying max 240Hz quirk\n");
+}
+
 static void quirk_fw_sync_len(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -120,6 +126,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
 	return 1;
 }
 
+static int intel_dmi_edp_max_240hz(const struct dmi_system_id *id)
+{
+	DRM_INFO("Restrict output refreshrate to maximum 240Hz %s\n", id->ident);
+	return 1;
+}
+
 static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 	{
 		.dmi_id_list = &(const struct dmi_system_id[]) {
@@ -166,6 +178,24 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 		},
 		.hook = quirk_no_pps_backlight_power_hook,
 	},
+	{
+		.dmi_id_list = &(const struct dmi_system_id[]) {
+			{
+				.callback = intel_dmi_edp_max_240hz,
+				.ident = "TUXEDO Stellaris 16 Intel Gen7",
+				.matches = {DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
+				},
+			},
+			{
+				.callback = intel_dmi_edp_max_240hz,
+				.ident = "TUXEDO Stellaris 16 Intel Gen7",
+				.matches = {DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
+				},
+			},
+			{ }
+		},
+		.hook = quirk_edp_max_240hz_hook,
+	},
 };
 
 static struct intel_quirk intel_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index cafdebda75354..8fe3f3467106a 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -20,6 +20,7 @@ enum intel_quirk_id {
 	QUIRK_LVDS_SSC_DISABLE,
 	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
 	QUIRK_FW_SYNC_LEN,
+	QUIRK_EDP_MAX_240HZ_HOOK,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.43.0

