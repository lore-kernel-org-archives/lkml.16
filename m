Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12681A5B92;
	Thu, 27 Mar 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093577; cv=none; b=hNNlLirEn5ZgCTMe/NnprYZ5k0hX4Mw8DmuFkC7YjUNbaqaeATWwiad9mpR0X0LZmNiZuuBPcQTGUi7TXu3krNYQ5UMHO5l92vGzk3/L25Sd+eCiltyYfhf5PDLjFPCmzCJByr3X6Bzf4ri294EkDJU1FE/w5QVSkHhDz683QrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093577; c=relaxed/simple;
	bh=cinDfjgg8mbUOMHFJcqTZc3izlQAeuCXx16BRobbZsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6iFhksnG6VJepLtkNkpUwiawhrGgtHb6qsICKp/VkR6E2yJwnI3QrcdlxK+mv2QWe1BGek1eFoIDmR2c40j25BikdwnXrunowan5GB8lZLv7MadUzJdq41acejvoCecQsh2vS6tuEJ5f9fcUk0WdL4usdiC04y4o5z+cCYPLY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeHfXkkb; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeHfXkkb"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-54298ec925bso1835483e87.3;
        Thu, 27 Mar 2025 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093574; x=1743698374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWj+oZ2EMXAKw1Ymrwp25R0LvcV47DCrjiccqcdcGrc=;
        b=eeHfXkkbkad4hGkGetP6YkQo6V20W0Yz1TBnx68usGI1fek0/JNfazcuhuOmmD8fRs
         /TdZyLWY6D09qIu+IIgtos22uQbfJ+D660I6V9WWgOveQIMdSpuJOi653loY33XCSODm
         L4PDxq28Yccyv0S5FKYRZGW5ccQ6KXqKfJ6/br6IDuk/t81LcfcHwZZs3LWXKQPjZyQw
         IlKnbCziXt3LSPaG4JNUjbXa013lqsZxO4ksq1a5BefaOLfs1sFMfCH6gu4XlGW3ROCL
         FeU9cDPKKfwEM/RHTv0VUUX7fQiIiHSvEUB2d4I0Yy/kxUfYdC12l5ePb6IAPrZZMj3r
         0v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093574; x=1743698374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWj+oZ2EMXAKw1Ymrwp25R0LvcV47DCrjiccqcdcGrc=;
        b=iOCzOuuQDBusftYAWTxesGtthdqriH2apNiKtDQ6xGOkq3JdQEVdObAnVsHsw97BQO
         ZLjbUhcPMet1U73hbWDhcGaeiquBKd41Hpg5LqEdB4mbcmgn++TsZSCBtpvZd/3J7Hh0
         iPUCMCTZ+N9LC3Pc37Ck5liADv0cw9++qo1JKdo623dOGJnzDRI3aygbMrO5qsdvNLpz
         ugQj1xvRFwXOHDU4Wt6NVrJDKfg0R8jfP8P4oHGMppz9fvs16E82ZzRVKDdSSa48JasD
         lPR5DRHxcl7v9Rgv2n5Wm0husp0npwNM8CoilWrl9OvrVuY2kmx9UPnguv25aM8kybAD
         H70w==
X-Forwarded-Encrypted: i=1; AJvYcCVV0t5ZNynMdqwPe5o9PDlFFOh0DkrnZ9jkvGAYRzHv6nRyIhKPfn4lsfzaUpWEobJCKK95Qz3e7pp0E9P2@vger.kernel.org, AJvYcCWqvI01PUOMCZgVbJnn9oNagEECbL782llWiCL5oHMOLm6inu984S4cJz2z1GoMq21bx8wzXv6q+MPw@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQyynnhxtFRE+TbYul4f7LeSNSipoTPB+Pp8LC/mBfFGMxNG2
	lBS4eSBZwY5KcNrlHEcmfwPFe3pNqc1Q/eW6uX+h0EoUYmINVDD4
X-Gm-Gg: ASbGncurMBhXTqbXjHENloaCAuaVR1cURlck1j1p61TfoWt44vqMM2ipoXl+/bo8zx8
	ON6ad/sPWxV0rQqgN77Z10jgb2pqUk6lQww5bxuDT/S9BVGuqtJ30D5V9fPuzNzwYCmnbSiPE+B
	PiQTDS18prXqILq5JCfTDyKE8Q3aacC66Y2sG/0LJg0LCLcoJVdQZO3b+wsBKnqU9JcgDI6Zv0X
	74Nxr7hDyAiUofDzNUF9BzWEO+VjVUdkwOmWgJTaHkc/38Nx5NP6EPLmFtuloCo505wk+AEho7T
	BtACdjAb3hAwLoIy9/VXpSIV/Vi41eNRiQIwk1EGx0svw4nzu93dClBw5A==
X-Google-Smtp-Source: AGHT+IEQc9SjafjwgOphA4UvFg3uKCwFnBis8J9x5nKO8FZ2vwMXlomF6WTq15HIxrf4DeeD7E8pZQ==
X-Received: by 2002:a05:6512:114f:b0:549:4f0e:8e28 with SMTP id 2adb3069b0e04-54b011d5825mr1934697e87.15.1743093573701;
        Thu, 27 Mar 2025 09:39:33 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957feedsm10150e87.110.2025.03.27.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:39:32 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panel: Add Visionox G2647FB105 panel driver
Date: Thu, 27 Mar 2025 19:37:45 +0300
Message-ID: <20250327163750.986815-3-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327163750.986815-1-sanyapilot496@gmail.com>
References: <20250327163750.986815-1-sanyapilot496@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
support found in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 282 ++++++++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1d..c4de2749260d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -977,6 +977,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
+config DRM_PANEL_VISIONOX_G2647FB105
+	tristate "Visionox G2647FB105"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Visionox
+	  G2647FB105 (2340x1080@60Hz) AMOLED DSI cmd mode panel.
+
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cac..31dc893e0b16 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
new file mode 100644
index 000000000000..c926ec16f67c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ *   Copyright (c) 2025, Alexander Baransky <sanyapilot496@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct visionox_g2647fb105 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data visionox_g2647fb105_supplies[] = {
+	{ .supply = "vdd3p3" },
+	{ .supply = "vddio" },
+	{ .supply = "vsn" },
+	{ .supply = "vsp" },
+};
+
+static inline
+struct visionox_g2647fb105 *to_visionox_g2647fb105(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_g2647fb105, panel);
+}
+
+static void visionox_g2647fb105_reset(struct visionox_g2647fb105 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int visionox_g2647fb105_on(struct visionox_g2647fb105 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_g2647fb105_off(struct visionox_g2647fb105 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_g2647fb105_prepare(struct drm_panel *panel)
+{
+	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	visionox_g2647fb105_reset(ctx);
+
+	ret = visionox_g2647fb105_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int visionox_g2647fb105_unprepare(struct drm_panel *panel)
+{
+	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = visionox_g2647fb105_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode visionox_g2647fb105_mode = {
+	.clock = (1080 + 28 + 4 + 36) * (2340 + 8 + 4 + 4) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 28,
+	.hsync_end = 1080 + 28 + 4,
+	.htotal = 1080 + 28 + 4 + 36,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 8,
+	.vsync_end = 2340 + 8 + 4,
+	.vtotal = 2340 + 8 + 4 + 4,
+	.width_mm = 69,
+	.height_mm = 149,
+};
+
+static int visionox_g2647fb105_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &visionox_g2647fb105_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs visionox_g2647fb105_panel_funcs = {
+	.prepare = visionox_g2647fb105_prepare,
+	.unprepare = visionox_g2647fb105_unprepare,
+	.get_modes = visionox_g2647fb105_get_modes,
+};
+
+static int visionox_g2647fb105_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops visionox_g2647fb105_bl_ops = {
+	.update_status = visionox_g2647fb105_bl_update_status,
+};
+
+static struct backlight_device *
+visionox_g2647fb105_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 1023,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &visionox_g2647fb105_bl_ops, &props);
+}
+
+static int visionox_g2647fb105_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct visionox_g2647fb105 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(visionox_g2647fb105_supplies),
+					    visionox_g2647fb105_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	ctx->panel.prepare_prev_first = true;
+
+	drm_panel_init(&ctx->panel, dev, &visionox_g2647fb105_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = visionox_g2647fb105_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void visionox_g2647fb105_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_g2647fb105 *ctx = mipi_dsi_get_drvdata(dsi);
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id visionox_g2647fb105_of_match[] = {
+	{ .compatible = "visionox,g2647fb105" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, visionox_g2647fb105_of_match);
+
+static struct mipi_dsi_driver visionox_g2647fb105_driver = {
+	.probe = visionox_g2647fb105_probe,
+	.remove = visionox_g2647fb105_remove,
+	.driver = {
+		.name = "panel-visionox-g2647fb105",
+		.of_match_table = visionox_g2647fb105_of_match,
+	},
+};
+module_mipi_dsi_driver(visionox_g2647fb105_driver);
+
+MODULE_AUTHOR("Alexander Baransky <sanyapilot496@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for Visionox G2647FB105 AMOLED DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.49.0

