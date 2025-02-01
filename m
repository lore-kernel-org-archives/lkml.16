Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF31BD01D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738436100; cv=none; b=HRSMsEOkHdd/s8/TsUlt5J/ktxIFuriDaPw+hDvyqO+pWOAPVbZ9QCg1uuRj9crM476onQih+NgaIif+ghqTw8OK4dF7Yv3H6pTIjn7Zz9cNJLTI6bnEbOHeUYEzQE5etXroac7jwYd3VleMSB/z4jk3mJ8DoIvzdjXeSAX7D+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738436100; c=relaxed/simple;
	bh=5EabESZLm/7YYeW1CkTE7Lb/7Kg1D2CzeUh5HsnGjzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVs8ui3uS0R/2mviDUww8vVMUwZu04X1fQkIygeN++LImC/PcAokdqz5gdRXUCY+DM+ztSckblNL/Rjv9C8nvXoadvJPiExrpT/Z5OrnKBC1r1lIKRa29qe66V2cM0Mbd/8xWQOJTz5czWrctBFDATAHTPA+VyregyDz8dSUqsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF9I7Gl5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF9I7Gl5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163dc5155fso54863855ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 10:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738436098; x=1739040898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ops9ELJDL1NIZCRIYwnyu3rCU1aJ/oZhPS0Iz0V8PzI=;
        b=QF9I7Gl597IL+fpq+teiViCnrE8RgzAqrJ2ywFL7U5i7hvM8d1fCcv0ExzNX/oeift
         J1QJFnvX2uYNwxtBIlC18fVZxJlXyvvoovGJQ3cEzk3maRBafVX5sbR4NmzqpaEzLvIS
         6BSdhfJa0JRw1bT2vrk7R01uZCCQxlVynsGRVM8hYvnBK/nxiq3H6+rCjOic7JOxzvUS
         fkYvc+NrZDf7tM7J3HihI3Z14B6JQoiR02uuKLxG9BgUjlRNy+ns52//p6PNFq8I1u/K
         Mt1klKdzTI96OWdP63JPFST/Qv/FRYl6fiVPHvyX1ktWJBByJeJl9RgKaBhunQOcg/F2
         GMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738436098; x=1739040898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ops9ELJDL1NIZCRIYwnyu3rCU1aJ/oZhPS0Iz0V8PzI=;
        b=lSJglfY/zgiQxFHMuaZCKDirFQxj2G4qVxFtLUKxd4oP7VG50izGsd6F7uKl3P5Z9J
         /ugu/vVLX6RUNDF+88rVArFyljKszhcCcDlErnyQnsL/HbXKpn1uqralCLByAbucYyTW
         BcZ2NlpHO7noLlEkV9Wi45kEVi4/NVpc7iL/z+dzoVn7RZmD2rgfstYbym2iJmS3WbZ2
         kDFEjgByMAFKKt6djWnuICEYrTcXrwJTfhwHMRl802BhwUL84ATkrsjKkoDX0wlmoQ96
         7RVe9x7VedD5s3/w6ARrTJqdZOpH+jjkzrfpLe+eZFOiR9/5OhSoPTtvUW8GhTrWRg3n
         U+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUGnv8U63UsY+/vu2tFzqvcJmbqLsnWujY7Ffc1tGiXLa3pbyycHrNOY+vtk16/JJceqbuRcCHF/7quBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Av1hWxBb5AzIB93DAVLg9sqXdI9bGnXxET6pRICZCrQqBWOy
	fbuOOJ5+3NIkUEu4PnzOJU/8MMRvSk/wO5fTVx0t2qG2eZAJ0sE8+mY0iVJu
X-Gm-Gg: ASbGncviU5WHErHCOLaU+bvIf2ez2OAZRV2XPt59HNUNV4NNDHrBaGVzLuc8GBMCkLV
	KWjoQ6AGZFdBI+KgukpAS9003vC67I7wwLuM5W6L0XWvm5xfHhy6j5fVg9mluqFwX3fx6puB99P
	XQTLfGyhWT/PvVxt6tp8InRghx2HGhZ5LiyAAQIvtnhI1BTYW3G5Zm/46BOzSVUDhQrYLFgQ369
	cy63bzgjbDeeSqlUR2J9F1yY50oh19mXH4c1jcZTYVZ8SEW2lyJILz4cjPeALMJGDxfvfzpG0P4
	2IZzqE/2SVGn0690FOwDazmle4fkn3pXg/mzmBAO
X-Google-Smtp-Source: AGHT+IFhmfTPPLodizZramfbwgrc6Oz3a2e0JcZP2X32XQ8aCjkIReuDmb2qKOkikP37xdL+cFEIcg==
X-Received: by 2002:a17:902:e84c:b0:215:ac55:fd72 with SMTP id d9443c01a7336-21dd7dd86b9mr209518615ad.37.1738436097979;
        Sat, 01 Feb 2025 10:54:57 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([2401:4900:6285:9329:d5f4:874f:7c80:132b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de4a91af6sm46942785ad.17.2025.02.01.10.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 10:54:57 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi wrapped functions
Date: Sun,  2 Feb 2025 00:24:39 +0530
Message-ID: <20250201185439.157613-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes the sharp-ls060t1sx01 panel to use multi style functions for 
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 59 +++++--------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 74c760ee0c2d..0b4e0983639b 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -44,60 +44,39 @@ static void sharp_ls060_reset(struct sharp_ls060 *ctx)
 static int sharp_ls060_on(struct sharp_ls060 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int sharp_ls060_off(struct sharp_ls060 *ctx)
+static void sharp_ls060_off(struct sharp_ls060 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	usleep_range(2000, 3000);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(121);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 2000, 3000);
 
-	return 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 121);
 }
 
 static int sharp_ls060_prepare(struct drm_panel *panel)
 {
 	struct sharp_ls060 *ctx = to_sharp_ls060(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_enable(ctx->vddi_supply);
@@ -125,10 +104,8 @@ static int sharp_ls060_prepare(struct drm_panel *panel)
 	sharp_ls060_reset(ctx);
 
 	ret = sharp_ls060_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	if (ret < 0)
 		goto err_on;
-	}
 
 	return 0;
 
@@ -154,12 +131,8 @@ static int sharp_ls060_prepare(struct drm_panel *panel)
 static int sharp_ls060_unprepare(struct drm_panel *panel)
 {
 	struct sharp_ls060 *ctx = to_sharp_ls060(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = sharp_ls060_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	sharp_ls060_off(ctx);
 
 	regulator_disable(ctx->vddh_supply);
 
-- 
2.48.1

