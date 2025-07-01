Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEF7286D60;
	Tue,  1 Jul 2025 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401244; cv=none; b=smHFTtW96udrROAkdJtxM7etbpPmV9YU4fuCFS+pufOFScZsBNcqW0c0zDffAnAoB3qh7y9wcaCLV4jowshn5hMLnVqh8OsuSdix1m3t9S/4E4LS72JE0YJyVEIxktINdnb/IbbmtoAeCABns8xL+efzo88MmHMjw+WAtFVk2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401244; c=relaxed/simple;
	bh=8kK/21NkJz+jMn49WLjQQ6ERfOGrwVnuFssPmLcQ7io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ypj8EBX6GStg2QiM7V6MQgiWCzQl5QlbeGRU527xyP3PFvf2MEhWDEd7WPwcMyF+cHRy+inPuT4grAzCxWzT7dqUI+mlV7ZoZeppuph+dxaGuGCZQuh0R/mFnZ4IUIEKmxPwDydY06ipjtJqndqQ8+3OfApejSXAJEO2mr7a9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BC4291F0003D;
	Tue,  1 Jul 2025 20:20:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4DABEAC96B3; Tue,  1 Jul 2025 20:20:41 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 4308BAC968E;
	Tue,  1 Jul 2025 20:14:29 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/2] drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS support
Date: Tue,  1 Jul 2025 22:14:26 +0200
Message-ID: <20250701201426.814750-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201426.814750-1-paulk@sys-base.io>
References: <20250701201426.814750-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel
with a mode operating at 33.3 MHz.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0a3b26bb4d73..b3d7a0eeabd5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3655,6 +3655,29 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode olimex_lcd_olinuxino_5cts_mode = {
+	.clock = 33300,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 20,
+	.htotal = 800 + 210 + 20 + 26,
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 10,
+	.vtotal = 480 + 22 + 10 + 13,
+};
+
+static const struct panel_desc olimex_lcd_olinuxino_5cts = {
+	.modes = &olimex_lcd_olinuxino_5cts_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+
 static const struct display_timing ontat_kd50g21_40nt_a1_timing = {
 	.pixelclock = { 30000000, 30000000, 50000000 },
 	.hactive = { 800, 800, 800 },
@@ -5214,6 +5237,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "olimex,lcd-olinuxino-43-ts",
 		.data = &olimex_lcd_olinuxino_43ts,
+	}, {
+		.compatible = "olimex,lcd-olinuxino-5-cts",
+		.data = &olimex_lcd_olinuxino_5cts,
 	}, {
 		.compatible = "ontat,kd50g21-40nt-a1",
 		.data = &ontat_kd50g21_40nt_a1,
-- 
2.49.0

