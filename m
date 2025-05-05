Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA551957FC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464686; cv=none; b=L0TnAfNz55823/DhmaMGpScKZatV0S4Ugw6hQ+suCcAllpNUdvCuJt557zG5VKhFS0Qz77G36PLeajy3llAy/y39gXNXTBLJBkPQiYK5eVgsr0PEPHFSguL3g9XSzRDPBYEV88B3L6HX9t/dlAFaRaRbOAatiZo+IKPf0BDlTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464686; c=relaxed/simple;
	bh=f1unv9uKWkpLkfv0FcoXEn2Mw9gnEODhyfQHPGruINo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxS1liyRKXdtmYakl+zPxSUh+OLAEJjNNp7H5MgU2/2wtQxBVxGn30VIYR0LzVILUAb+0WoNxS3KZPjfA0UzMZ4j6k7bymslSd2axC9GUhLD1V7t7jT9B089TDEUlbQ6uOpRFhdUbeeCGJj4O8sd3hTxYeTRO9br4nTqLUUW9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ventureresearch.com; spf=pass smtp.mailfrom=ventureresearch.com; dkim=pass (2048-bit key) header.d=ventureresearch.com header.i=@ventureresearch.com header.b=dAzBLF60; arc=none smtp.client-ip=67.231.154.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ventureresearch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventureresearch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventureresearch.com header.i=@ventureresearch.com header.b="dAzBLF60"
Received: from engine.ppe-hosted.com (unknown [10.110.50.102])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id E524D602A2;
	Mon,  5 May 2025 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ventureresearch.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=selector-1717781956; bh=sruw//HjQB6XJQIxHMRHC9dIAmbSQWjtCq2IsgN/sbI=;
 b=dAzBLF60Qkk7ahCJWVoinInWp4RsLt0SZWRoUG30RNueTNbgC7Y92Z0AJ+GMmv4suDnqZS9Y0PmhJ33JSxoQEVAZm7LBD+Vte0F9lMlBgvfE29kQXssJS3kxFrARC5PrqkJh4O55mulESP86/VEOOVVHqZnUGuQokmUkxBglT2v1cgvfj2nvXig1WHRnD+nKLZmobq29q4hv1/o91nBXokGmGkA+F5wgXr+xzyhtc2IN/upsmN7pEXPngbfzcPT8JvSztC4IC7OiqsqNSu4zSuPWE3aQwEl7a9+JpFiXE+8oODs+TbxMqqYFh3pNzfnJa8UXF1afUypwC6WiqZs4bQ==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from Mail2019.crm.ventureresearch.com (unknown [67.210.242.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id DB60B340085;
	Mon,  5 May 2025 17:04:33 +0000 (UTC)
Received: from build01-deb.crm.ventureresearch.com (2605:ed00:15b3:1::5:1) by
 mail.ventureresearch.com (2605:ae00:1849:1::1:19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 5 May 2025 12:04:33 -0500
From: Kevin Baker <kevinb@ventureresearch.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
	<sam@ravnborg.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Alex Gonzalez <alex.gonzalez@digi.com>,
	Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Kevin
 Baker <kevinb@ventureresearch.com>
Subject: [PATCH v2] drm/panel: simple: Update timings for AUO G101EVN010
Date: Mon, 5 May 2025 12:02:56 -0500
Message-ID: <20250505170256.1385113-1-kevinb@ventureresearch.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MDID: 1746464675-oNH0tDlgHK0m
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1746464675;oNH0tDlgHK0m;<kevinb@ventureresearch.com>;58e32da1f0e7946bb9643c97f392fd2c
X-PPE-TRUSTED: V=1;DIR=OUT;

Switch to panel timings based on datasheet for the AUO G101EVN01.0
LVDS panel. Default timings were tested on the panel.

Previous mode-based timings resulted in horizontal display shift.

Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
Fixes: 4fb86404a977 ("drm/panel: simple: Add AUO G101EVN010 panel support")
---
 drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index df718c4a86cb..c79dc8581054 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1026,27 +1026,28 @@ static const struct panel_desc auo_g070vvn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_g101evn010_mode = {
-	.clock = 68930,
-	.hdisplay = 1280,
-	.hsync_start = 1280 + 82,
-	.hsync_end = 1280 + 82 + 2,
-	.htotal = 1280 + 82 + 2 + 84,
-	.vdisplay = 800,
-	.vsync_start = 800 + 8,
-	.vsync_end = 800 + 8 + 2,
-	.vtotal = 800 + 8 + 2 + 6,
+static const struct display_timing auo_g101evn010_timing = {
+	.pixelclock = { 64000000, 68930000, 85000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 8, 64, 256 },
+	.hback_porch = { 8, 64, 256 },
+	.hsync_len = { 40, 168, 767 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 4, 8, 100 },
+	.vback_porch = { 4, 8, 100 },
+	.vsync_len = { 8, 16, 223 },
 };
 
 static const struct panel_desc auo_g101evn010 = {
-	.modes = &auo_g101evn010_mode,
-	.num_modes = 1,
+	.timings = &auo_g101evn010_timing,
+	.num_timings = 1,
 	.bpc = 6,
 	.size = {
 		.width = 216,
 		.height = 135,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.39.5

