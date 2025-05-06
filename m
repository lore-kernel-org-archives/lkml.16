Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9826A1DD;
	Tue,  6 May 2025 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523657; cv=none; b=fBKtgKyCMxLrpSqo38WhcFLp00ikJ6cHmI8PzeIDjjqrM7U5dNZI0o20VpXx/YHHEZNYpH+2RKbSqKcu4Ddgp23YG8Tf4XkC0hNNjiRnhTtXCrOFAZo7p7GueDixHP3E4PmNRvkUy5FVPmdJu8hZeNwE2q1qGRVMboz6MEXeOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523657; c=relaxed/simple;
	bh=IhY1yIFj9h6RW2LIS/lVZqNPfgaSCqHFq07RIdTjyAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r68aw8ph7L5+6ayh296oGKU59GNy07CmqcCXpLioKeXwOVjpppgckwAwUNHDzw+b6Hfp7OWuJi/FjPccgR8q3uCL6WqFhzaRuR5OkM8FKezQXtQM81Q4d6AIK0G3EsZ5FcQK2Nby2HF1iy8kwGRvlUUfXWYpcOAN1kEKtumHVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2j+my5l; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2j+my5l"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so4325485a12.2;
        Tue, 06 May 2025 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523653; x=1747128453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDObaPUFymmSapRackHVcFMDUXPg/Fr2VSQlC/mfW7I=;
        b=F2j+my5lZwbGcGZ3aY2HZ+XPjzrPbtKi1eY6juPuNyG449OeJVFTzkI82T1O44DLE5
         Txu4lDA+KyYlbFNVF1+oDhLKRo8aOo6lRZSIXKwhZj0Cm643h//GDeXkxsViSox5ImUQ
         HIexygn+GfmrYOS1yHqVamVESEDQHEW6dJ07za5MEcFiXPm7+P99gpcn77FXec/LXhb3
         +H7VaV9LvtC1saGvs8/jet7XNCFnHNJdSycwJ/3Qn9mLdQKJkAEm20C5xenKy8+ECT/W
         yLrZzD2KpE/+c7LFXiKYE7FmYo3ep13mJLNWw2SEP5DzpomTuPYf5Lec1O6iQBD9lK8L
         BHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523653; x=1747128453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDObaPUFymmSapRackHVcFMDUXPg/Fr2VSQlC/mfW7I=;
        b=xEamLV+91aNgxvDSh0aKlji0Aj5fNPnoxnaizWz0OnWMKQvvnstXbVjcI2RHxRGTwD
         f6YOh4ssyyCfQwW7Bc+ZFhzpu6KFHoccSJdT8eN6UNCgwn9TVZP6jZ4J6m+0lOaWKqGv
         ZU3dBXsSHK9apdsH9h4/OLiQdhstie3RJzDY2JWolm3Kz4GNZVczaP/E4HR0myhrNmnF
         YmDz4AraaFkYvACSjY9/nU82IpZ6wyorVVRTi14kD5Vr0Y7qZ3nqBqXHdAEJy1FahN4w
         RGzSe/OFig4TDb9+txI7Ath3bZRZriQG+xaoCmE6ArMcU9gq6DG1ir7VYh3HcWiIJlvt
         1mnw==
X-Forwarded-Encrypted: i=1; AJvYcCWv4RwNeoZqoMpkniQ62qg2xuZ6AWX9Z09B3p2MtvzolwXAbqN472qyzcmoTYtcpWC3D0jk/LcS+kBb7WY9@vger.kernel.org, AJvYcCXLlW3VgAFAA0/qg8ISEWNtGEoUe/IQi8RjakMzgvSw8hV2mg37lQLAELD1S1B0XtNEtlE6fZw/TOof@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxj2sXCS7tHeO4+kXTqPc0nVw5LGmiwwjxVGbcLJxxcRCWl2SP
	wpwny/tPCI5IGmUksZm4kgM1Di0tM97ZTS1yorNJRFklJj3xZZyc
X-Gm-Gg: ASbGncu4Gi5e4QuxGNX0oxbL3hnXr2dmdsOhLru2uoNiLkAAp5cha3rV7lUHB//NKhc
	CMQEAsZCXU6pCf1Rm9lsR5HU94+h5SDY9dmfOdpaZiIsKpBoVNfe5LRaRR0mGhf+JFaXIon4Fym
	OBx12ZV895dbNF2DQI1eZF12rY2h2L8eTuojO2UOHgBouH4K3G9CB0/obuneligisoO4k6ve5bE
	NUJ6C7zooAtyjYNLbdi8I6eURF0T3EeL/PSojB3krYFrJEneNiZ04Wcy7qy9Rgar2cqLYknjkYK
	0JJ0TrbcZk6ykusf/qp6Bj3U+3efLpV14SP3uyo8dyE=
X-Google-Smtp-Source: AGHT+IEpDgr8e9tyVD+ac1wmxZ3H6FI8eQzMbsOuI488S2jkWHOXVcrqdzNCyy8feALvMyptZKioDg==
X-Received: by 2002:a05:6402:2351:b0:5f4:ade4:88c5 with SMTP id 4fb4d7f45d1cf-5fb71042e17mr1764411a12.34.1746523653130;
        Tue, 06 May 2025 02:27:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:27:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] drm: panel: Add support for Renesas R69328 based MIPI DSI panel
Date: Tue,  6 May 2025 12:27:18 +0300
Message-ID: <20250506092718.106088-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Driver adds support for panels with Renesas R69328 IC

Currently supported compatible is:
- jdi,dx12d100vm0eaa

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                |  13 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 281 +++++++++++++++++++
 3 files changed, 295 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d15ad60d977f..18adcac9e227 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -648,6 +648,19 @@ config DRM_PANEL_RENESAS_R61307
 	  This panel controller can be found in LG Optimus Vu P895 smartphone
 	  in combination with LCD panel.
 
+config DRM_PANEL_RENESAS_R69328
+	tristate "Renesas R69328 720x1280 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for JDI dx12d100vm0eaa
+	  IPS-LCD module with Renesas R69328 IC. The panel has a 720x1280
+	  resolution and uses 24 bit RGB per pixel.
+
+	  This panel controller can be found in LG Optimus 4X P895 smartphone
+	  in combination with LCD panel.
+
 config DRM_PANEL_RONBO_RB070D30
 	tristate "Ronbo Electronics RB070D30 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 196288532c9f..5d961e966eb7 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
new file mode 100644
index 000000000000..46287ab04c30
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define R69328_MACP		0xb0 /* Manufacturer Access CMD Protect */
+#define   R69328_MACP_ON	0x03
+#define   R69328_MACP_OFF	0x04
+
+#define R69328_GAMMA_SET_A	0xc8 /* Gamma Setting A */
+#define R69328_GAMMA_SET_B	0xc9 /* Gamma Setting B */
+#define R69328_GAMMA_SET_C	0xca /* Gamma Setting C */
+
+#define R69328_POWER_SET	0xd1
+
+struct renesas_r69328 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *vdd_supply;
+	struct regulator *vddio_supply;
+	struct gpio_desc *reset_gpio;
+
+	bool prepared;
+};
+
+static inline struct renesas_r69328 *to_renesas_r69328(struct drm_panel *panel)
+{
+	return container_of(panel, struct renesas_r69328, panel);
+}
+
+static void renesas_r69328_reset(struct renesas_r69328 *priv)
+{
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int renesas_r69328_prepare(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+	struct device *dev = &priv->dsi->dev;
+	int ret;
+
+	if (priv->prepared)
+		return 0;
+
+	ret = regulator_enable(priv->vdd_supply);
+	if (ret) {
+		dev_err(dev, "failed to enable vdd power supply\n");
+		return ret;
+	}
+
+	usleep_range(10000, 11000);
+
+	ret = regulator_enable(priv->vddio_supply);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable vddio power supply\n");
+		return ret;
+	}
+
+	usleep_range(10000, 11000);
+
+	renesas_r69328_reset(priv);
+
+	priv->prepared = true;
+	return 0;
+}
+
+static int renesas_r69328_enable(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	/* Set address mode */
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_set_pixel_format_multi(&ctx, MIPI_DCS_PIXEL_FMT_24BIT << 4);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+
+	mipi_dsi_msleep(&ctx, 100);
+
+	/* MACP Off */
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_MACP, R69328_MACP_OFF);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_POWER_SET, 0x14, 0x1d,
+					 0x21, 0x67, 0x11, 0x9a);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_A, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_B, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_C, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00);
+
+	/* MACP On */
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_MACP, R69328_MACP_ON);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 50);
+
+	return 0;
+}
+
+static int renesas_r69328_disable(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 60);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	return 0;
+}
+
+static int renesas_r69328_unprepare(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+
+	if (!priv->prepared)
+		return 0;
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+
+	usleep_range(5000, 6000);
+
+	regulator_disable(priv->vddio_supply);
+	regulator_disable(priv->vdd_supply);
+
+	priv->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode renesas_r69328_mode = {
+	.clock = (720 + 92 + 62 + 4) * (1280 + 6 + 3 + 1) * 60 / 1000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 92,
+	.hsync_end = 720 + 92 + 62,
+	.htotal = 720 + 92 + 62 + 4,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 6,
+	.vsync_end = 1280 + 6 + 3,
+	.vtotal = 1280 + 6 + 3 + 1,
+	.width_mm = 59,
+	.height_mm = 105,
+};
+
+static int renesas_r69328_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &renesas_r69328_mode);
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
+static const struct drm_panel_funcs renesas_r69328_panel_funcs = {
+	.prepare = renesas_r69328_prepare,
+	.enable = renesas_r69328_enable,
+	.disable = renesas_r69328_disable,
+	.unprepare = renesas_r69328_unprepare,
+	.get_modes = renesas_r69328_get_modes,
+};
+
+static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct renesas_r69328 *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct renesas_r69328, panel,
+				    &renesas_r69328_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->vdd_supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(priv->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vdd_supply),
+				     "Failed to get vdd-supply\n");
+
+	priv->vddio_supply = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(priv->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vddio_supply),
+				     "Failed to get vddio-supply\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		drm_panel_remove(&priv->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void renesas_r69328_remove(struct mipi_dsi_device *dsi)
+{
+	struct renesas_r69328 *priv = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id renesas_r69328_of_match[] = {
+	{ .compatible = "jdi,dx12d100vm0eaa" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_r69328_of_match);
+
+static struct mipi_dsi_driver renesas_r69328_driver = {
+	.probe = renesas_r69328_probe,
+	.remove = renesas_r69328_remove,
+	.driver = {
+		.name = "panel-renesas-r69328",
+		.of_match_table = renesas_r69328_of_match,
+	},
+};
+module_mipi_dsi_driver(renesas_r69328_driver);
+
+MODULE_AUTHOR("Maxim Schwalm <maxim.schwalm@gmail.com>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Renesas R69328-based panel driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

