Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F284322A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 04:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744516814; cv=none; b=OgpxJLfaSx0gzZbAuvj9toEcuhcVkj0KhyrB+8on5iHfZ4PfaT/FX4CRaHlZxVM7TkK1quWZcIwoRt2KOGqOMyyOM1u+0lIqJXORifm/s7UCsNzOn77h4+3vEWRArhB7b/15rvseHUWFa5SAXr2qD3wxrjLKh4KGLp5WodT+ZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744516814; c=relaxed/simple;
	bh=p40QxyHHyQc6KOZk1deCazCdl+mt7HdoC4+Xo/OBp1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uH/T1ge6r77o2Wjq7DBuyUxrwJSQQ+ucg3RK5S8KYbR+aOn4dwsIcQQTm4s+ZPbszoC86QOsah63JoKdqYYeKdt9fsIsVGZirbVG60hukYlFdCXysuIvmQZR9uqEtIovMUjsv5lLH4FuqL6NMuJ3YqjcCnU4iq4FxUohPR8GSTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR1KFM2q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR1KFM2q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2932447b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 21:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744516812; x=1745121612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqI6Xg+tP1YvCk+YIG6SA8ycGL1vJCda4FkJGkBHxOA=;
        b=JR1KFM2qaCW1yX+gx2KNKtyUYQb32xhAb2X7KKV+ZQqvtbchES4ubwaT/VeMHQ/ntx
         V5Xjly3diEH96wJ0kbGe6SX5nirBIQ1cVjJSwhs7wnki9QrgOXrwmlCxx70KPtVa7JCz
         ErZAHBPx41JgrNIt+QELvFPuPjEfRU26WRjUlKLu7iMPjzZpxoZhY8yrbBEoSKae2IJa
         vSl2Z/iRL+l66ZFQdLxjjbrprmT1eR3+mnt19IuuDQrGSoMMm0TxoukksrGNs6oPORuI
         Qa192Kt/gx1qPgmD0Od38Q1vg7ofGDGiVOsR4DS9ediLvr4+VxjsjrS2GRRgmjyLUtXX
         cg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744516812; x=1745121612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqI6Xg+tP1YvCk+YIG6SA8ycGL1vJCda4FkJGkBHxOA=;
        b=Qbxxj1QUI3YWgvm1awwp2BhJx2YIfShjAZ8eDtsmH52xLnDZILCHcMDRM5q0xLNmfs
         utLQx+9tyJrOd5AB4zWFfyIcMd56l8y4ye2d0ZsTnPgJ7cBmQ7RVbvLbXVxrO1RI9hyJ
         cbJoXJG4eF+1rWyROQ+ad9K+QfvPJNkyfPinBGrg0bfWOSpZzbcYPQ/aoTD1ZUhZmK7Q
         AEABPcsstR999EUCzIq6K71UDnelmvWLL6Jot4l9AoJp5yX0Ed+8XrxP2tEAFUKSR1jt
         +Vhhw+uHHfDsLWnblQGucGoOY//fiRW8q2HOYk/Manj8onRQQv/Im3CIRtyqpE4VsfWd
         6bRg==
X-Forwarded-Encrypted: i=1; AJvYcCW9sXW7P6dEmLkcnTV4O8y//jgGI9N6RJSUbbgZgM1GPYvFpoGYFMLTqaCGCcrklZMmCN2j6sFkxMCm/ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfenbBNLfMHXvLhY57aucUFN7BQ2c25GnxQhxfwX889WvFDp2z
	Y9iEOg9YdobCwL4LVdbvgUFzTQGU2YljWRwd6AFRXy78q+abEm12
X-Gm-Gg: ASbGnctRvmUktXinCTLh2JMl9GfVkrfFuYUcBM00TKRZBQ8CMYDtslrFd3s8k0ZXzL/
	ICRtGzoJHidjbYk0fVxQWw57MvG5k5Go1paJpRn8KGsWXDzip9EjdrRu23bqt2XUzNBWuWSGRqz
	bJGqyJikBdWp2RiRdmAH3h++4RP04Szjb4PK672dKx1P9tGwsxlJ9PWPZs+y5J3Rh4x7fMZI4dY
	x3Qv3Grupe1/1j8pdXqOxuWm3oUvxrxXVa23G/43MG8G6ZLpV1Uw97r7scmfdNHKVK+Jzr0ltaB
	RUTWF2bV2dMnFb+xd7skMRQXdE5oW+czXvraVENuTX01Bc4spVKQpvPpKAI=
X-Google-Smtp-Source: AGHT+IH4z1XO9PKG2LeQ+zLCK87XjAg8XpDkF9DVoeFsRX0I6R5xjTm+AlGTaFzpspsTdU7i4GaSBA==
X-Received: by 2002:a05:6a00:2405:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-73bd1203c12mr8268514b3a.14.1744516811348;
        Sat, 12 Apr 2025 21:00:11 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3870sm4193836b3a.48.2025.04.12.21.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 21:00:10 -0700 (PDT)
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
	asrivats@redhat.com,
	Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
Date: Sun, 13 Apr 2025 09:29:59 +0530
Message-ID: <20250413035959.255842-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes the boe-bf060y8m-aj0 panel to use multi style functions for
improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
after the off commands are run in boe_bf060y8m_aj0_off regardless of any
failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
boe_bf060y8m_aj0_prepare fails.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v3:
    - Disable regulators in boe_bf060y8m_aj0_prepare if
      boe_bf060y8m_aj0_on fails.
Changes in v2:
    - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off

Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipin76@gmail.com/
Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipin76@gmail.com/
---
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 114 +++++++-----------
 1 file changed, 44 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bb..dbbfee22ae76 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,77 +55,56 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
 static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
-	mipi_dsi_dcs_write_seq(dsi, 0xf8,
-			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(30);
-
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0,
-			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
-			       0x2a, 0x31, 0x39, 0x20, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
-			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
-			       0x5c, 0x5c, 0x5c);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
-
-	msleep(30);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
-
-	return 0;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8,
+				     0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 30);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0,
+				     0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
+				     0x2a, 0x31, 0x39, 0x20, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
+				     0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
+				     0x5c, 0x5c, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
+
+	mipi_dsi_msleep(&dsi_ctx, 30);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
 }
 
-static int boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
+static void boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* OFF commands sent in HS mode */
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	usleep_range(1000, 2000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-
-	return 0;
 }
 
 static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 {
 	struct boe_bf060y8m_aj0 *boe = to_boe_bf060y8m_aj0(panel);
-	struct device *dev = &boe->dsi->dev;
 	int ret;
 
 	/*
@@ -157,13 +136,14 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 
 	ret = boe_bf060y8m_aj0_on(boe);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(boe->reset_gpio, 1);
-		return ret;
+		goto err_on;
 	}
 
 	return 0;
 
+err_on:
+	regulator_disable(boe->vregs[BF060Y8M_VREG_VCI].consumer);
 err_vci:
 	regulator_disable(boe->vregs[BF060Y8M_VREG_VDDIO].consumer);
 err_vddio:
@@ -178,15 +158,11 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 static int boe_bf060y8m_aj0_unprepare(struct drm_panel *panel)
 {
 	struct boe_bf060y8m_aj0 *boe = to_boe_bf060y8m_aj0(panel);
-	struct device *dev = &boe->dsi->dev;
-	int ret;
 
-	ret = boe_bf060y8m_aj0_off(boe);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	boe_bf060y8m_aj0_off(boe);
 
 	gpiod_set_value_cansleep(boe->reset_gpio, 1);
-	ret = regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vregs);
+	regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vregs);
 
 	return 0;
 }
@@ -234,13 +210,11 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	u16 brightness = backlight_get_brightness(bl);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int boe_bf060y8m_aj0_bl_get_brightness(struct backlight_device *bl)
-- 
2.49.0

