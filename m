Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E103C3C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743347603; cv=none; b=F3s7B2RZIAeylNnEPtBGNTOIl8oaiqjyIcqWnNo3LW/4TzfvATNWuMd9ON+JwOFHfEdWaEPCa88dxKimR5bml7OcxBSWFmXYMP7ppTLQhcJCt/eSi3ZX3s6lS3OzsQgrLLulR4tp1n5a/5SuN5Ch6uZyc+tgAXh4LZcCmcMcItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743347603; c=relaxed/simple;
	bh=r4eKyKOf8p6eMne2ml5qlZRtyj7KrzDm2GcJnthCYk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNB46GFQSAQnF2Zx1WtvbgKoxFVpLAzMpuvH57+1WjBsy7QTINbvChUg28wd76qCy94F4bV9YoSXlpfNMfWxv6Ui6v20pgVP5hUGCJbp878hfquQgRG8TBzvJUXIYR51tVOFch89ifHXfEyMiIsAUffl82PqtGg2yc7DeZudttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlKUZCbC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlKUZCbC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22403cbb47fso77759245ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743347601; x=1743952401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlVLtOXTk2IyM0Aka9pHJk9+dLoQ8r5FHHUbG7LJJhg=;
        b=RlKUZCbCCXTYtKXHV4BEAEoH8lY67AD5tEnCOgpaejEZxKs4Y3S49SaGMGM37P5ZgF
         x1RAXV2g2DIbDmVi5HutF151qH7myQLEaA8ppjrbbG4VDrAFSDA4Z4u+mq41ORJIzds4
         5rqKbfvKTgDvtBOZPKchUbkfMEGhOGNYQ7gM7LkvEeCZYalt/N6K7D3NfDaUSDoS0hH8
         Q4MC9aIBFEEMbT7AtzYsK35Kid+4z94hukKPx6BKgZuv4O08XbV3HomT5nc5FXaAS4DQ
         2DQS6utDhzzvtONvnlYC7D7CPPpUXKdei1Uva3GbS7Z9UTCA1/fBC+1FH6ayABDQk/FT
         naXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743347601; x=1743952401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlVLtOXTk2IyM0Aka9pHJk9+dLoQ8r5FHHUbG7LJJhg=;
        b=IaO1wzUVyXiRD/0wC+nF/6fzEuOxy3zHF9bfg2OtQj3A1dsJOvOJIsSd4+jzYPcN1z
         X3bWI0xnZ9+h5Xrm/s4lzEH4Hb41vFA+3ClfQvcPLEGspJ6mHOrUq/xa6uIVl9gJVwsB
         vXS4TJH3MTCC45DZPqT0kLAk4DvHw4xuJt3U8b0gJS94NEqhF+5g+plJxJRf1cZSdCz+
         EEkWZZi4W2pU/I2fMKSuKOF5tkUTNiFmaVe0/UwBRs29h35WvOC7Gb8k4DzPy51mGWHc
         M7CRA2fMEea4awUvI+637Usj2+Uu1JuxEgF9jKZ4OtuPtTBCivcKU+w7tpTUL0+b06ga
         tALw==
X-Forwarded-Encrypted: i=1; AJvYcCWfm2qA0H2iofoNUrzW1ZD8Htnx1Dj9sokl4n3dlXxhoPw3UlGkOOMSKyuMnwYPokdaUfeDKtgXPSVVxc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4LcULWFgVy618BhUKKdeCGfmk+llQoWZ1hpzTkcXngkN8VjSu
	5mR+f8LWaWOHdUR9/1YcHM4jTa1s+dCcFcMB5k7N/G1nK4IA8huxtEm4Pti8XYU=
X-Gm-Gg: ASbGncvj7uDmLFTu3Kf4rEsSVEe04u8Pzvg/6NbGkeZyR9onihOJzuyGBC0bi8u5SDd
	cf2T99TqCXf+yFkF2spZbilPrUEx5UU/3T4jBChCjD6qoYPrAc8PSIGggS4rsVmM1bVGCGzSS+T
	fMCDR+4d6iwmIUolq7qPsnRmN5vUUPsWXCnnlEaIhI9NdUi2dABFalKPtgta/dMd3EyqbGYEjoC
	SKZVi5GLIzdQCVoV4ZMf83qyAmr3ZrwX9I+EPSpaB0yqAJmajwT6mjeNFCgO3E3rJ67vmv6h5/3
	3p+emNHqmqeaiVOWc3jNByt0T9WXND3JRHV7SDSXN+SweEtchmuTYp4BFPIWBfQW
X-Google-Smtp-Source: AGHT+IFhkVjZEtZZiDR/lIq7Xt06caYzDaHpT1YLwfNEV7T0glEpa/c6E7kzVsqz8dSB9FmG2yDuYw==
X-Received: by 2002:a17:902:ebd1:b0:223:3630:cd32 with SMTP id d9443c01a7336-2292fa162abmr98837035ad.53.1743347601318;
        Sun, 30 Mar 2025 08:13:21 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([103.4.220.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dee68sm52840595ad.205.2025.03.30.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 08:13:21 -0700 (PDT)
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
Subject: [PATCH] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
Date: Sun, 30 Mar 2025 20:43:04 +0530
Message-ID: <20250330151304.128417-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes the boe-bf060y8m-aj0 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 112 +++++++-----------
 1 file changed, 43 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bb..d017f9c00d69 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,71 +55,52 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
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
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	usleep_range(1000, 2000);
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	return 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+	if (!(dsi_ctx.accum_err))
+		dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 }
 
 static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
@@ -157,7 +138,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 
 	ret = boe_bf060y8m_aj0_on(boe);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(boe->reset_gpio, 1);
 		return ret;
 	}
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

