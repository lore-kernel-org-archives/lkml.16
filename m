Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A631E0DD9;
	Sat,  3 May 2025 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265335; cv=none; b=WgKW6lAVW66op5IDfmsfQENfZxBwaAhJOz5IfAiFL5tqM8pvzzOz0l5MLUTLuV2QevJmIK4xIOs5GFaKafk0l3g102WwGGo/vm14sYGnU4c7NLWrnFhb9q5BAk3+gX6osY5tzqRWyTwWW/wS5SQ6aEqK8erTdh6BBk8TyxZadTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265335; c=relaxed/simple;
	bh=QWOHOiCLaqD8QKcIQAUmWI1m//A+kEpn7vmUo/zlRxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHJwXC0O/0wdzsVJSwXh8d0i3FM6JfIPW4StTOr4RCVcurHqpROatFJ1JHi/uDf7Fr7M5QUBwbpG2wvr1RyHTBSbgcFCgaNys+yQgLe+ta+HWdtLZ0emnIH9lIb2x6H0hCPi3GRIjEXgLWTZTqXYiuHsFB0HqOckqWySZWheSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4iQLbDV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4iQLbDV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2aeada833so525836566b.0;
        Sat, 03 May 2025 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265332; x=1746870132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFuxSn6XO2LJxO7m7jcl/wHqLyG8qlITz6/SsfnYv4s=;
        b=A4iQLbDVSUXr0NGjFJGppM4raO4RbuHZRjFq31TN/X1gLx3taiRReBNNwRX69/kczU
         Os1I7CZcmG22WHI2i/WIOAqEryCHHS60ZPEXcnx4YdxrdZrG5QdABMf6enzdA/mvE14n
         6PIZXhsYBfZH2W3oUmMG5DAwisFk53by9jAQ8R7A0OLkptbGV4cj0aLH9FqATDevu00B
         oqSe+RpL5aO9jDLa7ZzSALOR6n7osieeBkp4O3SKA7Bdj2aEvUeAPrWbcxvMvrOnON6m
         dQZUBglQpZDJkZeIYucQRNTKzLHbCU5taZweYt11ZcsAJSOsBuWG9OqzCEeImdP6X5wG
         HgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265332; x=1746870132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFuxSn6XO2LJxO7m7jcl/wHqLyG8qlITz6/SsfnYv4s=;
        b=bVtPhuTNGfLyYy+TxgyneT+MhhgXIEIMvMx6xXhgWaaVbQ+UAljEKa/ykMN+6/oCC1
         Osn4xErcpE95tZ64SeSblYGPeV53BsG4oGyhJoUQK2aBgGAl1wq5qh3L22VwRXFdLi51
         bl11p63MYyu0uJ/bKlX3qWEx5n9jcekwr9xAYUTo0zGNEx35McbQ5Tn71bvrBckeaFZW
         bckwGKM55govgkBivHpyarFSGusBo1jz4woHgt+6NiwqEDqUjMADYBBWvjt2664Qb4xB
         kia4ZhaWm/d7vrjWKlAe6fYpQblM/v4PZnCNhqxT3v85LhyDKtTJ00FwXVA7uVtAI4ql
         24jw==
X-Forwarded-Encrypted: i=1; AJvYcCVNF5bXOFhMM8j52+0PCucLnOMilNYY0XhPPNCnndyb+nIKDOj4L6Al/95SpNi4PA0iOuB9rYIcVjE3@vger.kernel.org, AJvYcCWVwMMxL3SXSxlWT38NkcJpkV8qz7OEib5zVxFEARfh56eSfS6Jf10+v3bi10uXfEm2+IapOxCF7hEmNdPO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcz3KKSmiQKPf1wt8fVBsFZA49Ghp7XnGXidY3fBrWqnW/EHd7
	OG4GSdaueH878AeXJWMC9mamTJGr2NoXTXmVVqwH5QSZ2iTxbHvh
X-Gm-Gg: ASbGncvMCdCmEr5CPgohs1+MIPw54T6F4YqCfhRnHKf2ee7mOJaSmSTKsnBqNwYfhy7
	WUDlcrbuW0eF1R6xS+hYIm3QTDjLpfyGiLIS8r1dgRAIjUAARqfxpw1CEr68x3+WbeKXhycX/vR
	mtoz8y8yYgsLCLceZ//J4UmQlOlxMPR7+Mb1iKHn5FzoXSd9fRF7+IYmsJSJIJtrSST0PcV4b9E
	londxma8mq7wtIal0pvYZHKC/b22QljEwpw9CS3Qd+AuJxWnBKyX+ytcVk7qZHUgBFH9P3r4SeQ
	UFzrzXSYHZJuxk6glZpxbALkBNYfDto6uj2D2NdTmp8=
X-Google-Smtp-Source: AGHT+IFiJJS9T7yjMh6KUPf0R5CWBIjfNnMiQZyQ8NVplyk1Yyy6iGv/T+u2wGcOvVEica1qbMhlNg==
X-Received: by 2002:a17:906:c109:b0:ace:f075:3e56 with SMTP id a640c23a62f3a-acefed6affamr933581166b.11.1746265331555;
        Sat, 03 May 2025 02:42:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 02:42:11 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm: panel: Add support for Renesas R69328 based MIPI DSI panel
Date: Sat,  3 May 2025 12:41:49 +0300
Message-ID: <20250503094149.29201-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094149.29201-1-clamor95@gmail.com>
References: <20250503094149.29201-1-clamor95@gmail.com>
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
---
 drivers/gpu/drm/panel/Kconfig                |  13 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 283 +++++++++++++++++++
 3 files changed, 297 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index e8723f42cafb..86c66f818a11 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -618,6 +618,19 @@ config DRM_PANEL_RENESAS_R61307
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
index 61d8853df1a7..37e4e13165a9 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
new file mode 100644
index 000000000000..ea627660563c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -0,0 +1,283 @@
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
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
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
+	drm_panel_init(&priv->panel, dev, &renesas_r69328_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&priv->panel);
+		return ret;
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

