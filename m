Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B62BA2D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743401930; cv=none; b=RshClMSHvYYxVMwggb+RlltNE2Lkqqi5kbpMiv6vAvyGWxwFbIi/7H++1E+Yvz3gr1Ecsr1T4vdXwwjbOfTCFotmpRZwNPgao387VpjG+LpBfVWbZUYoGyIR/ZS8RTs8cPn3w7CE6vbjchbtoL7UWF7o4dYp4fKiML856JgtZR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743401930; c=relaxed/simple;
	bh=cmceu9nxQ1oQMczlRk0uySnSPdGX5s0U7qK53gpiOr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnpH+rC4quSpc2r0vg5/IMFOYS6XhsYlz0t4i7jHCWW6OhE/GQpkcStToDa5ZPhOgazJ5KbvfSHnsxV19E02/Z51k6u/YcGAwvafRjWB5lhi7jTQJOsIaQMcNLrwjKN309WHSgfDhkXxXZwkFcDV+B7tDqolQLH1RbfidY8Zm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfdrP4q/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfdrP4q/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so7044283a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743401928; x=1744006728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqfZ9w/ImUwiK75rO1HvxehLxAen84p9wgdPi0LkNec=;
        b=VfdrP4q/unQoLSZQqIIo0tRfndL9upcluMlMU9/M3ZGCbRWsGVKZujE5EAyThGgJEv
         Gx/HJ/V5zujK4Emc9r4tvMNumpg8u48uPwly4vSupFAE7VvCyMrS9FsLK3hDsW5DEXbu
         u9GDFg3b3D/sZEAp1Vjc6jSem0Ib3wInKDgVL25bK6LswZJPzyn3tueHeX8SNVz8xy/o
         lBghyNd6kac57JlLT8rYjey4zlHi6ShZbY8rkn7PVIW0JdTyIwqj5ZGcoaPZtl1MmwJ4
         uy1xlg3SBj0DHr6QQOrUbLzNcFMSV7HpOiF8LpUAS0HZFm/2rNA3Yy/SXDwrfwgoETmn
         qxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743401928; x=1744006728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqfZ9w/ImUwiK75rO1HvxehLxAen84p9wgdPi0LkNec=;
        b=itBdyQ2T81Nttq6gPRqUDO0e8H/zzvK2CtscslkjDzZBaJjfCu0rCNWHSQypxJ6XJS
         3ZdLL+/IGglNmt/ZMbk3ZzXJlybV4mRbQ6iWXdDTiQbsBkqFmn2u0RE3LHigDeEULR2D
         V+ccnjme+mxQNGsinZxtsVbIaD4ziFxdKgbJfT4+o8Hp1a833r16Au3IuyH5FampHSp0
         1nFAF8Pictw1pcvg8Trfqmm73ofPUwMzSN33d+MoJtMewKOPXMM4vgVrl40thDt2cBPv
         EF1fKcBhuGl/7ebq1b5+itFhKOon3Djbex+n4osJZ69K78sN4g5AQFU8fV01jkU9Jp3l
         iTTw==
X-Forwarded-Encrypted: i=1; AJvYcCWzB+CRIsniWll87k+6A0cX9u9dLWvIC8vfahiyg5wW7+fyeE8v7KXsPnlHdb0BrDgQNHlNr+AzGyC1oew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGmfcYe7JTdhNtIli0+ifMq5ZqT/r+ZoMihVM1NBzaVKVBQRP
	9YUW1F0izyPqd39E30yrfcLlwqt/Vb8Pq1vUbAnuEtuQ1gwNOUPd
X-Gm-Gg: ASbGncuhLJIhcNpfWnAr/F/g2VgnUpbQ/qOJtyulIA3c1kAhEQHrvLpOueDgbn6GsGQ
	mSoy3WmMxoC+SwMKcLGVmTGzVXQ3utcZcXZ0Qjs6oYjdByHB2YjWCHQBn9MDgjyK8+Z/sGLDIyR
	W7I6rdOt8LmAkkIo6UxxJlZ/h570RmfV2eD8g+6oxpeJ6vI80EcwXZGf5ZiUWX59JEnRxIWwpJ/
	S/Q6bkSG5wpx2ebFs9O1JwmOxwG+xDXgey3T+8JJpQYFmWN1CZ/o/GUkRtdMxbrlTbleXiY/PX7
	shokOrgVpMz6L8gOONgD+BbIJKN7WQ/c1V3vYl8pmRR1z22Fdknf7cXIqyB6BIys
X-Google-Smtp-Source: AGHT+IHaC2BICbj8uY5XRfbnRS9PlYZs2JBVZA/EL8010zewr1McTuIX82yBfpRHcKhShSMuoQVtFA==
X-Received: by 2002:a17:90a:f946:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-30531f7c875mr9920707a91.1.1743401928351;
        Sun, 30 Mar 2025 23:18:48 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([103.4.222.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039e10c545sm8847841a91.23.2025.03.30.23.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 23:18:47 -0700 (PDT)
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
Subject: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
Date: Mon, 31 Mar 2025 11:48:38 +0530
Message-ID: <20250331061838.167781-1-tejasvipin76@gmail.com>
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
failures.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off

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

