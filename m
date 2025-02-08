Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E71DE8A6
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739012025; cv=none; b=pkdHky/ytyodVcq7tZHJ1CIRrxhsEa2i6/cwtQD+xF82g5MKfyxEkuHaXWmrQ9d2fuCt1EDQpK89WP9OS1PVX+P9gGeGfiPa1GO0ZyuvYJUAkz1cPSCQZgtnZdY6vEfMsjaG3NyEB4XjwhBD5chXHWmCOfYqqcnYZKGmFDCyvKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739012025; c=relaxed/simple;
	bh=wXfBCVoqlqpOMjX0aU/GVCGoTONgLufRcDWuwuB/oMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1hLvLtkF10o/Jkx2ChAaehBfT3jpDMfjGG3UXvyEfGkWciUm9XFz3FOaS4VoGmzwwkUgDeY4DzFEjXcGpbtUyjptkoKT2qXdRXGryvatJX2EKyy30c8zv6lxELoNtfp7AD9mfqmTGwF3yM0dmVGW5h5tdsB2VRRC51kcNYtmI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=CUOfoky5; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="CUOfoky5"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so4034097a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1739012021; x=1739616821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeklVRho+7zZc940FdohEDo3Z+5NvmbAIJqxNmuL5t4=;
        b=CUOfoky59icbv4yLqvGh9sfIn4Ta9cDSBQoBBpCsiEcHpVUNjaGQedInykx2CHju4/
         HF6tAOCCtAA9mfSoyHeVLy3316Jz4CnRvQda3QTb5SZ7/+0XnhBOnZ9Ss/KAQjkfRonM
         a55ndIaKihetTyRGuKv0bB/pL3gbL6pO8DwKOhan4ACcShk4cH954C/lahQklOm1FeKW
         /I+z6pkG5da06wR4GLel7Nx1AOcN1/40M2doul7BEvIOZ+esS6RgrDWTdO4YwyTm0RWr
         9ly4wfX6OlS/TBqt2hieBol4Vl1tC4vP+14nYHMkopA28XgZQpM8xqp35fjqHwly7bdj
         HV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739012021; x=1739616821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeklVRho+7zZc940FdohEDo3Z+5NvmbAIJqxNmuL5t4=;
        b=WIiLoj88BvLarXtZ751bdycXmiEqFPmjyzKOmFM+y2z4xnGc3fVKrsUMwdtHDYcyFJ
         k8Y8HHBBfZ96oGnfc9apyKtD/EE1DQIUdnlCAJebt6oH3u0eseqmAE3l0bEDDtkFnrmO
         60Uueyj5Bc33D3Lk5BLFmtrLeOP9dIKPfDgCJm70Lxy6IWKU1OTnYnhvq2WEZljTrfGo
         AbXgbd5OaEza+0LLStDL/FmNyAsMQS3XIjKjj/Kpwvn2BjTixqIYpsS1HF5EBbi0rcor
         N8iUmHZinOtUuBqDrVu2tmJ442OjqS/NAcfek+7y3yOf8pay0AtrFWIdMNRCVTtclMvZ
         thEg==
X-Forwarded-Encrypted: i=1; AJvYcCV+aWRyY4DJip/1EzlgveygcYZ9Tjok6ZPRHRGRnOFPY0oCL/IRftbepHgcsl/g9CbGe6IdciI72MDB/Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySk0ssBfFiVzkan7lf1lQZ5hxWce/2xjr0AU+LF1lm4qqTZznJ
	1R4e1F3lvV16qZkE9bibbthALYnd7BkTXOVAldGIT+0yibZ9ePlFVhmRmRDWNlY=
X-Gm-Gg: ASbGnctEVVmusSP7+smSI13n7jpLIwBjNDPEdeB8/LNR7Zfde6KMKh/LFQaD9dh/wSH
	d0iEpAxCn7Ca+gCoiWKPDz19PSNYBD9uMoy9bCmVPzieDEZ9TQWRgjHeMXOylzgZpGWpUx2wp5r
	LBAYN/x0M6shdBChLoqX/QiK+gb3SljQIVeBKglSOAgk72NIMCHANVN9dlHXO4jQb13wj0BN3pF
	NuhoOsrUR8Tlkjup08oIfvpscO8LP/yPYZNGV+tLlnxx4giJ0bS0olOlHVka7kSY5f8owkIYhYr
	PL2zXaUh7VVVF0AMIE7GU5BOMxU9YFCxzYYOK2k4OfOTkDgCAdI/ZwgqHpJfNEY=
X-Google-Smtp-Source: AGHT+IHD22o7AGc+X0siq5WiLvQGpJyf6g6SA5TM+bUj6Ymdv1XTUCEcjtcEEJGPovssGHgm6YmCWg==
X-Received: by 2002:a17:90b:368c:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2fa24064823mr10076929a91.8.1739012021543;
        Sat, 08 Feb 2025 02:53:41 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa36f185c5sm2142003a91.16.2025.02.08.02.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:53:41 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 2/3] drm/panel: panel-himax-hx83102: support for kingdisplay-kd110n11-51ie MIPI-DSI panel
Date: Sat,  8 Feb 2025 18:53:25 +0800
Message-Id: <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kingdisplay-kd110n11-51ie is a 10.95" TFT panel. The MIPI controller
on this panel is the same as the other panels here, so add this panel
to this driver.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 115 ++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index c3f4f5ee175d..9a818dea653f 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -494,6 +494,96 @@ static int ivo_t109nw41_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 };
 
+static int kingdisplay_kd110n11_51ie_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(50);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xb3, 0xb3, 0x31, 0xf1,
+				     0x33, 0xe0, 0x54, 0x36, 0x36, 0x3a, 0x3a, 0x32, 0x8b,
+				     0x11, 0xe5, 0x98);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x8b, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x2c,
+				     0x80, 0x3c, 0x9f, 0x22, 0x20, 0x00, 0x00, 0x98, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x64, 0x64, 0x64, 0x64, 0x64, 0x64,
+				     0x40, 0x84, 0x64, 0x84, 0x01, 0x9d, 0x01, 0x02, 0x01, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4, 0x80, 0x9c, 0x36, 0x00,
+				     0x0d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x32, 0x32, 0x22, 0x11, 0x22, 0xa0,
+				     0x31, 0x08, 0xf5, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e, 0x13, 0x88, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00,
+				     0x0f, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x07, 0x06, 0x00, 0x02,
+				     0x04, 0x2c, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x40, 0x04,
+				     0x08, 0x04, 0x08, 0x37, 0x07, 0x44, 0x37, 0x2b, 0x2b, 0x03,
+				     0x03, 0x32, 0x10, 0x22, 0x00, 0x25, 0x32, 0x10, 0x29, 0x00,
+				     0x29, 0x32, 0x10, 0x08, 0x00, 0x08, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x07, 0x06, 0x07, 0x06, 0x05, 0x04,
+				     0x05, 0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0x01, 0x00,
+				     0x18, 0x18, 0x25, 0x24, 0x25, 0x24, 0x1f, 0x1f, 0x1f, 0x1f,
+				     0x1e, 0x1e, 0x1e, 0x1e, 0x20, 0x20, 0x20, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
+				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xe0, 0x10, 0x10, 0x0d, 0x1e, 0x9d,
+				     0x02, 0x52, 0x9d, 0x14, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x7f, 0x11, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
+				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0, 0x05, 0x15, 0x55, 0x45,
+				     0x55, 0x50, 0x05, 0x15, 0x55, 0x45, 0x55, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00, 0x24, 0x01, 0x7e, 0x0f,
+				     0x7c, 0x10, 0xa0, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x03, 0x07, 0x00, 0x10, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0f, 0x3f, 0xff, 0xcf, 0xff, 0xf0,
+				     0x0f, 0x3f, 0xff, 0xcf, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01,
+				     0x00, 0x00, 0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00,
+				     0x20, 0x9d, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x66, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
+				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0, 0x0f, 0x2a, 0xaa, 0x8a,
+				     0xaa, 0xf0, 0x0f, 0x2a, 0xaa, 0x8a, 0xaa, 0xf0, 0x0a, 0x2a,
+				     0xaa, 0x8a, 0xaa, 0xa0, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	hx83102_enable_extended_cmds(&dsi_ctx, false);
+
+	return dsi_ctx.accum_err;
+}
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -582,6 +672,28 @@ static const struct hx83102_panel_desc ivo_t109nw41_desc = {
 	.init = ivo_t109nw41_init,
 };
 
+static const struct drm_display_mode kingdisplay_kd110n11_51ie_default_mode = {
+	.clock = 182750,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 124,
+	.hsync_end = 1200 + 124 + 80,
+	.htotal = 1200 + 124 + 80 + 80,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 88,
+	.vsync_end = 1920 + 88 + 8,
+	.vtotal = 1920 + 88 + 8 + 38,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc kingdisplay_kd110n11_51ie_desc = {
+	.modes = &kingdisplay_kd110n11_51ie_default_mode,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init = kingdisplay_kd110n11_51ie_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -809,6 +921,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "ivo,t109nw41",
 	  .data = &ivo_t109nw41_desc
 	},
+	{ .compatible = "kingdisplay,kd110n11-51ie",
+	  .data = &kingdisplay_kd110n11_51ie_desc
+	},
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
-- 
2.34.1

