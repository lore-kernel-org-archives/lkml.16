Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29083FB31
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744432223; cv=none; b=ejnkVpCYNHEsv+8jOInlganQdCxSm9gfviWcrALS3S6mNXab6973+jxNE2vGWZHcfB1YWNlq2VFAX5HHbQ1YAVMCdBnSKUBgL+DQa4jlCr1RRGV/groUXZ8UN0rhBCbDSiCMQWBOjdrzEEBVEfopkTGR+xw7eJ032XVZwRtZZt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744432223; c=relaxed/simple;
	bh=6YOT/moxWjZb8k6BhIpFgiHq7cJE6mOhJBhiFtJPR0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mD6h8sUVUVwLWxnTGXl33Lo292apcuaX13s1C4YzW886s9Ogh28hiktaJTlJ0u5AcJsPPC0u6n7dBQXMR/95G/E5I5akvi1bnQGN/0Z50sYiiHA2QwG4PNS+XB+gLChbmsAJG7mlaNqxJjMHUGYVEFcUTKHMmGOTLH+0BvsZuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USX0NHWD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USX0NHWD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2243803b776so39488025ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744432221; x=1745037021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDhSa3AcnQgGZ0qW17JjUnYX02p0uaoX46BLV4hADcQ=;
        b=USX0NHWDX2qwNl2crHT6RgyHLVJiB/We/Q7bn8eDSNfedCpYOEozDVsk+Sen9ni+Zv
         xVbpW8AqYyLfo+qzxUUzm8b1XkGXLP8BBG8toMH8D2T7rJEwHROFSAtCNC8LJG3qNv42
         P3npOowsGYjqjaAB7qnHIScjM2C56kqWw8i47jJzv8E41r0+rbzPAd9NNH1Z3LGl3F2S
         RZKS6itTuZlbSv5eL3q7jWu3qfahx/0gFp4XvA2t8DwgbLE/ecmMz0fhmiUE54JlLQbH
         P23kHNuMVOcHYNloK/fsh8mRtHv5sQhPgprC1+GCrqEf6aEX79/rlnh6jhTA8Fmwi9eS
         bJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744432221; x=1745037021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDhSa3AcnQgGZ0qW17JjUnYX02p0uaoX46BLV4hADcQ=;
        b=APp7lqGLw5qPywNQkoPQ+tjAqYyGTiSw6avbhU+KJYvhb0ZSCfUG9tuEaPbzgEnw3W
         hfZ1ljymTMv3lK5l5X04jGTPKD6w5lgqJmu0UWfGnRlvrrIkv0fAhgdWf+s5QoQOPpa8
         1etvIqxdGN+wUXGh2ccpyDxi/yaHpgZnQZRKbcGw7gj5DbpFEWIIueZSdbDFwAPPZoz3
         hIOfMlHcqwRa8IqF1FC3Rwsr+Mo3fuDjuyauCPW2SDLrTfIGCcO8Ey1k71jM/TLtHJvu
         bONtljZqIRuUu5l5azFNEw6qzgRNBEIWieFtpi6QB04mHIeQqHjN7TIV9/SiO1O0wU1k
         LgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3aEsqwC8hPbWFJ3RraU3F+tCALZ8QQstnErTon11xdkagKrNFMLJc94JU2226UdYU6XxkJYIrFML31qo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0hdgW0ThL+Boiy1S5xP/rQE6fxiIIzSR9SiN9gLUFdNNyrah
	dwA5MDxXwj9a+eV6cBrH986UiBlQzfc0nWkEcrTJ88oJrvI2kGsH
X-Gm-Gg: ASbGncsV0aMMqhuvNYTCTacyfOEBU2p4tUqW2x36FbpuND2inPG4laKEGY5WEa94CXf
	qnJniY8I3r5ndEOKEUA2Tyx8URRhICI4qFOulTvMc+njcRiZBb6H4l4H2/KraE9djZe9FIbuKFy
	C5AdCap86HjnHq7QVyNasDL50zUpetMjuMjG7ykLpLGYsJ/xgDDpdXcmJVTSpvQ2mVkJLEFkqTi
	0iThGbWvHng0xzdNAcKgqXlQxBRQ6qRGhEeXRhmyKSx1QFGHO1HWPpboMRi+QOQIPTt3KB4Rugs
	cMZR0iYwHA/Ai7h+NUuC7CHyZHV2S/1J7t83v6eDTqy0PqrGYVJJQgchFdLg
X-Google-Smtp-Source: AGHT+IFQUDaw5Qn/FevW6MhUUNES9hoV6FjooWmvxfQieavJU99MyqeELfHh0ArOibku1gAFEbV4Aw==
X-Received: by 2002:a17:902:d591:b0:224:c76:5e57 with SMTP id d9443c01a7336-22bea4ef9e9mr80769855ad.39.1744432220749;
        Fri, 11 Apr 2025 21:30:20 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([103.4.220.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb53d0sm59435575ad.175.2025.04.11.21.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:30:20 -0700 (PDT)
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
Date: Sat, 12 Apr 2025 10:00:06 +0530
Message-ID: <20250412043006.188641-1-tejasvipin76@gmail.com>
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
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 109 +++++++-----------
 1 file changed, 41 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bb..3b174b4a41b6 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,71 +55,51 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
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
@@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 
 	ret = boe_bf060y8m_aj0_on(boe);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(boe->reset_gpio, 1);
 		return ret;
 	}
@@ -178,15 +157,11 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
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
@@ -234,13 +209,11 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
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

