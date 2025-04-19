Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA11E154BF5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745035966; cv=none; b=JfPY5sdLyNrsh12y186VPfwTxg6Mit23qajRiO3/KZ8QaKMXJaQuIhoKM/8NjKQfa2G0/MRQ8N++QSBsLO/FR8taDwg8FP3Ay6BC4NF+MIWcryU2u/dyuY7m3n0UW3gvyyZFiy9BxqzA+IcL0qhtCpa7bcQKoI4IXmyeZRDwVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745035966; c=relaxed/simple;
	bh=08I5j8Hm5O8WnBoWjTcHEyUtM/C/jXUM1rbXd2EDju0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kq4QX9aPhAxeY6hqE22qSk29JddGH6vcIKUjvLRF9XYEx68j2cmxM1nIMNRgLgNuKZtrJDHRsetTU3QJEHByrt/SoMa51yOj+EE7i811tr5YRMhD18PnHF0n7qAJNaQP/XgQA2ivZ+lCF5mOggwp1xpvGmAPde/Kcw4nNE76lpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIAaOZTR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIAaOZTR"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c3407a87aso37607515ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745035964; x=1745640764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tqOfb+8mO0V0cNAlNgnOyeQSPHVA6JlcJEWPbfL6rw=;
        b=bIAaOZTRfQz4I4BPnsgyjxLW15jiZvEaq7iTXoDbmmwTu7MHjXanwSQZywjhP5Ech3
         iIh+XKwkxwwZBg+e9J0Wk0ooXizFVrc6D+x4CIVF7jAX03MJfy+EDMGSgc88QOFRHhEO
         vkRh3GzafQBi8W4fn+tzbU1wDdA3wo8fao3HBr8roEMpNfAp6Cjh7EXeB+GTEkQ2ySZQ
         eAjNlqp3js3YyvGO0b/sx9UNCt/ewIJ1yY6Wh+WEw3CsKgQa+ZT0r4XxqK/uR5Jpcbwq
         J7/a7x3IYvcnKOJZBXVBbAu0GNWhkEB+x79BzyF7G/fVKnn9h+Nf0amvLMSfSPaeBSGy
         nm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745035964; x=1745640764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tqOfb+8mO0V0cNAlNgnOyeQSPHVA6JlcJEWPbfL6rw=;
        b=QLq4K64xfFrQoiRQzlGUiFiTy3cCkplLLqeR83S60+Xos6XMYtNepRvTE/cK+ELp1n
         sNxHZBUM4w9zrTJEEHszJDrBuQHSgkeiBLWazspWCf1eG6FTLg8m6o4V7orrrbbAhgp1
         zB2pdOyFeVebk0UZkv63UBa+z8knifl00CVjWa01dBjRV/yIybLu9Gauf2XeWklzuXV3
         DqFoMBK1tetdqGmJqtEMsI3rA5iTr0oq+IecIQaoH06xEV6beKC2cjHMcKCHZ1uEOJdX
         ZRsiv5hTQkKtijP2hxUtmK/o/eds6vgJuqDS4Y3FajSFLKXVnfHEwIBWXY0h2gA+hke7
         J+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpeoRTQbI1UPkbhaq5b9bWtDG0bksNz9+L0Az7aZxv80547rr4PbfJPxzxDsA5Eufd72wKH/5BAYeg6TY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Lx+KZ4zKLC9uS7dvjpRvPliB2X4xbFWrmMwU63x7LJgWsccx
	7u8y+cAwBKtMHkcQsRbnT3jTfGoX5fywM4SnMVF25ikEsCTUPbZL
X-Gm-Gg: ASbGnct64Kmplburp8z3UN/7h0ewZF7GI/eSkzd31C4zvHDAOgKnPmiFy1ZOFTdFKlO
	AsUvLgr58BhFB5as26C3cr47tsh8L6OVSdPcRPaRtjvMx+M7AeE9tcLeCfKEgQRMd3B/vXJnkqF
	o7sgjYbmX+QqAfaox7me9b6FJQ65aXBW98daysiolEFeSIft/kL/YSLdkNaFTXMLhiS1J+YDQ7w
	0x7AnwVVYNSKfRG3LfVQPo5uxTczJVcStLny3RuEykmkK+3OKtdnxRmDJlwNtuqehtRFoduSA2N
	EKmoc140s/9jNduGI7BRYI5JvzLK2e7QalZJwseXMtb0hsLtKxtiEhMiZjM=
X-Google-Smtp-Source: AGHT+IH06zoUn2Wpu1DAvBAzJLwDM1yMXb2JZbxWISTMcBXQTSv9rJ/poBbsUoc77IM/298QgBrLYg==
X-Received: by 2002:a17:903:1103:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22c535acc23mr79544505ad.24.1745035963921;
        Fri, 18 Apr 2025 21:12:43 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde283sm25296545ad.6.2025.04.18.21.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 21:12:43 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped functions
Date: Sat, 19 Apr 2025 09:42:09 +0530
Message-ID: <20250419041210.515517-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419041210.515517-1-tejasvipin76@gmail.com>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes the samsung-sofef00 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 70 ++++++-------------
 1 file changed, 21 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 04ce925b3d9d..e20c85d5d9e1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -44,66 +44,44 @@ static void sofef00_panel_reset(struct sofef00_panel *ctx)
 static int sofef00_panel_on(struct sofef00_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	usleep_range(10000, 11000);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
 
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sofef00_panel_off(struct sofef00_panel *ctx)
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
-	msleep(40);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 40);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(160);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 160);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sofef00_panel_prepare(struct drm_panel *panel)
@@ -122,7 +100,6 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 
 	ret = sofef00_panel_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		return ret;
 	}
@@ -133,13 +110,8 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 static int sofef00_panel_unprepare(struct drm_panel *panel)
 {
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
-
-	ret = sofef00_panel_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
 
+	sofef00_panel_off(ctx);
 	regulator_disable(ctx->supply);
 
 	return 0;
-- 
2.49.0

