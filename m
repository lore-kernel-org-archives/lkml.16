Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FEA286D73;
	Fri,  6 Jun 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210411; cv=none; b=Z40QyzqaNpVEbHWjt4UAqBum2nDB7lJmC+k2DWMn+TAdiRlI5vm/pUyo/f1Hw0obWhFzMXMdliPobOUkpwULKGtijv8+yi1BibKvY9sYHLPApfikuQS4GZcZUw5DhQ0k0wSVYFmVUXK11o6ijiih0Fldq5eerTuKtmHyMO2QWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210411; c=relaxed/simple;
	bh=rhvB4ui4y4FdYkobMOH1152Yq6fOix2H5DMS41sL9aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lX5gzv7VAo3D2HO4qj/QQM2hnBFWEsJ6uL+5+2iXMnOpbuCgqmTFnlBNcT2Z5inpV781jRhrVQkx17fVsfVfXnvt8Yr53GvinIjcFXho4UfTO36bY/L2z+JlPh6XwWJtQczfxl/WWO0LU1BqQqGQODyDImZnjXPQiHxU4eqdSVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8ohUU59; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8ohUU59"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so25888495e9.1;
        Fri, 06 Jun 2025 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749210408; x=1749815208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MgYf6F6fSeBu27ICRv37PYa/jAKP+hUr2B7udbzNrM=;
        b=N8ohUU59dYtCPHxoNdxx+v8+3vEuZ6hYamKhGwqO6Lq8KeMwRFFdhQXsUOqEuq58sK
         P9ujKLNENO+VXUh64x58WuODvd0NVlKvUw+PpvChQblnWAw/UV/5eK5G3qz3UCjiNctb
         Cn/CwdhDxvpfEhx8yWhLV0javdBxOwMgERl3bkpkn1P2nge3I+RBjMtrcatCaxhthqe3
         NQTbAxaih8iO8M2Q3Vc/1wWPjgZJ/JjdiwglwBWqD80oZWtQ3lkjEn7GdvAEv5Sil3gM
         6Gg2ycQWE4wsPogx/nGAE+7GBRLv7+Cbh6ZlNQ4LHKhglvSiNzWiH55M3+nIemNljpie
         CvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210408; x=1749815208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MgYf6F6fSeBu27ICRv37PYa/jAKP+hUr2B7udbzNrM=;
        b=KCWmIpyb6xCqR60+iCEsEPS1cK6nAow0u/l5OeR1tnvq1a4Vt8JE10AEEpP98tIxI4
         otDahLbdqj+BqHPMkkjCcjiOlcbyUkZHYsbMLLEwzQ5c5GY2VI/cNq2Zy4oUWyEvsoSR
         zyDAAWjjUpI75KM7NjI4P4ceaFQyHeC6aEcNgkp6oeNM0IgfHZYRIdCeanHdYdftngUL
         Kzh3gS+oHj6nTLxbX9ts/95KTotLij+uAiR0loNtuVz30mDWZ8KiauszBpHZHyewScsa
         v+Xio47mtZ0lIAU08QofQ52rwgqKQBvWChtg5DDOSbZzwUobCSuXyub0cUgQQB7+0BDk
         o9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCU7gc1bDHrJcxe3HZUnCM0FK1YJ9CFEOOT29Jd/XqVSGtAWQcbZMQLdNCTJIV0qyw5F4ijdfMQvOD1k+WMW@vger.kernel.org, AJvYcCUiOP8ZLNdyK5HxsIlpmBv7ak9iA8u9pwdGUHbnnaclwr9kWu9+gbjSXfou/09x3giXZTNC7ghw1xk4@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYj57griC+BY5I3AhC+hEdSasTE+puHEH73Kx/lKh46cRPtBr
	f8+xhNTnN/wSGzacrfIvTUu5LAXaaMH7bvojCbUx1/gUw3B3nUsTut3d
X-Gm-Gg: ASbGnct6Z0AnmhJQj5sPJ7OuseNWFI+ILgBkD2Z2X31zBNItaqljmrLla+vkXyNhxiU
	IQtfQ8bt6atUF/pyKbL50RI2krYrjAB6a+ffR39EPDdibfZNOx/lJJjEgOSFZAOhnKyRyDdOYlj
	Vvybvvep2ZcOVr17IhI8Z+zhq3Mr649sbR4mRnzsX7I2mo4t1vQzf6Bww6Cak/EgJiC2ix+7iuG
	JHAYG9fQo3DGuofXxpGp8NueqBH5kK613+TbN6e8OrrOPu7CEkNGUICQDgzYmieLh4xHdcowT5H
	+QqyIux9afj5dpc3em7jWMiT0KuH12ltL0isiqbOuS6xzbSF43fsEofoTeMsx7wojBs=
X-Google-Smtp-Source: AGHT+IGJaCJqb8KgeLF+rp7LU0psHMN4qsWCIeq3F4/Z7k4HlVzv4f/iLX3p/I7NH5Akoj/6fgTWEQ==
X-Received: by 2002:a5d:6a90:0:b0:3a4:e667:9242 with SMTP id ffacd0b85a97d-3a53188da6bmr2153482f8f.3.1749210407660;
        Fri, 06 Jun 2025 04:46:47 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:4223:e58c:4c9a:459b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464e7fsm1630480f8f.96.2025.06.06.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:46:46 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: jagan@amarulasolutions.com,
	neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
Date: Fri,  6 Jun 2025 13:45:50 +0200
Message-ID: <20250606114644.105371-2-eichest@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606114644.105371-1-eichest@gmail.com>
References: <20250606114644.105371-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
resolution of 480x480 pixels.

This panel is driven by the Sitronix ST7701 controller and uses a MIPI
DSI interface. The settings are based on the panel's datasheet and the
init sequence provided by Winstar.

It was tested on a Verdin iMX8MP from Toradex with a Carrier Board
providing a MIPI DSI interface.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 1f72ef7ca74c9..cf42281393dd9 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -520,6 +520,28 @@ static void rg28xx_gip_sequence(struct st7701 *st7701)
 	st7701_switch_cmd_bkx(st7701, false, 0);
 }
 
+static void wf40eswaa6mnn0_gip_sequence(struct st7701 *st7701)
+{
+	ST7701_WRITE(st7701, 0xE0, 0x00, 0x28, 0x02);
+	ST7701_WRITE(st7701, 0xE1, 0x08, 0xA0, 0x00, 0x00, 0x07, 0xA0, 0x00,
+		   0x00, 0x00, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE2, 0x11, 0x11, 0x44, 0x44, 0xED, 0xA0, 0x00,
+		   0x00, 0xEC, 0xA0, 0x00, 0x00);
+	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x11, 0x11);
+	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE5, 0x0A, 0xE9, 0xD8, 0xA0, 0x0C, 0xEB, 0xD8,
+		   0xA0, 0x0E, 0xED, 0xD8, 0xA0, 0x10, 0xEF, 0xD8, 0xA0);
+	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x11, 0x11);
+	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE8, 0x09, 0xE8, 0xD8, 0xA0, 0x0B, 0xEA, 0xD8,
+		   0xA0, 0x0D, 0xEC, 0xD8, 0xA0, 0x0F, 0xEE, 0xD8, 0xA0);
+	ST7701_WRITE(st7701, 0xEB, 0x00, 0x00, 0xE4, 0xE4, 0x88, 0x00, 0x40);
+	ST7701_WRITE(st7701, 0xEC, 0x3C, 0x00);
+	ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x02, 0xFF, 0xFF,
+		   0xFF, 0xFF, 0xFF, 0xFF, 0x20, 0x45, 0x67, 0x98, 0xBA);
+	ST7701_WRITE(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0);
+}
+
 static int st7701_prepare(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
@@ -1135,6 +1157,107 @@ static const struct st7701_panel_desc rg28xx_desc = {
 	.gip_sequence = rg28xx_gip_sequence,
 };
 
+static const struct drm_display_mode wf40eswaa6mnn0_mode = {
+	.clock		= 18306,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 2,
+	.hsync_end	= 480 + 2 + 45,
+	.htotal		= 480 + 2 + 45  + 13,
+
+	.vdisplay	= 480,
+	.vsync_start	= 480 + 2,
+	.vsync_end	= 480 + 2 + 70,
+	.vtotal		= 480 + 2 + 70 + 13,
+
+	.width_mm	= 72,
+	.height_mm	= 70,
+
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc wf40eswaa6mnn0_desc = {
+	.mode = &wf40eswaa6mnn0_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.panel_sleep_delay = 0,
+
+	.pv_gamma = {
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0x1),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x08),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0c),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x08),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x10),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x0c),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x08),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x04),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x14),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x12),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0xb3),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3a),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x13),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x19),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1f),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0f),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x14),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x07),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x07),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x08),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x07),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x02),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0xf),
+
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x0f),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0xa3),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x0d)
+	},
+	.nlinv = 3,
+	.vop_uv = 4737500,
+	.vcom_uv = 662500,
+	.vgh_mv = 15000,
+	.vgl_mv = -10170,
+	.avdd_mv = 6600,
+	.avcl_mv = -4600,
+	.gamma_op_bias = OP_BIAS_MIDDLE,
+	.input_op_bias = OP_BIAS_MIDDLE,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
+	.gip_sequence = wf40eswaa6mnn0_gip_sequence,
+};
+
 static void st7701_cleanup(void *data)
 {
 	struct st7701 *st7701 = (struct st7701 *)data;
@@ -1265,6 +1388,7 @@ static const struct of_device_id st7701_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
+	{ .compatible = "winstar,wf40eswaa6mnn0", .data = &wf40eswaa6mnn0_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
-- 
2.48.1

