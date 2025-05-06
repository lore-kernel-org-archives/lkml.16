Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3521267389;
	Tue,  6 May 2025 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523654; cv=none; b=cu+MKC0y8i22XMGi4E/S/tQ+1NsFiCRP/6bg3DtL0GtnJ+5qqL9+c73EIrBaYr0ymSk5iH6LH69v7opIkGLF07ObBykHaxHsWg0HThodU6o2wv/wM/E/ERtMNPZduhupSurbHZEwLNYuW1U0rGZzH5i1yOqq8JOaBB/2Frchjuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523654; c=relaxed/simple;
	bh=Q7sDIxBaBqnt1ggT8CqHgCug6P9NdcpiKSkvCf/QnpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwHu5e35oxI0nzZESH/V9gG92FkL8AGxHKQEkRU0mw6XsVypf5/Ns1InDPC1KZL8aI5mFW/gA/gkembrnYtmYI7bOqmr4BuJ7rgGa8eSkuKJ85X6SOQTibd8VU498jZg1g3FUFHpzD2GNSkRYcPeZZGez6v2wnPTnnZaNyOEDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZZHTeOa; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZZHTeOa"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so8158902a12.3;
        Tue, 06 May 2025 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523651; x=1747128451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPsMRRyqU9kLt4ctQ/S1nlywRWwftNW4JfqL3Gg9Xk0=;
        b=RZZHTeOa24hDv4wtIu/f0zeZhICtf72MN1wJphcc/ASWbLFjOsD+v11z/Fme0PiPGF
         W9bq/xQEu+lwMlix+dCb8GRTQJKmeGUX6Q8AVpd8ZXa37R+jOkFBMxBT7Jh0TQox5IGJ
         Xb4doNrb40VgMwRKrqSUMbrNk9aM+mOjmd5v1pD5+9r0+sVGmADCc/9ZzHGIPpWZ0arB
         Z59bN6joGXEq1H+71kb+1eDTn4ruMKi/eFIdErHQkNNhXQqHL2JKHF0ZPazW5k3BrgId
         k0qdV7jUJo4K15C38K9Sj+lW2KXfn5JO4VsgeZ8JWJJzWVCURJuVDA4+OgKla+74AQSc
         ENQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523651; x=1747128451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPsMRRyqU9kLt4ctQ/S1nlywRWwftNW4JfqL3Gg9Xk0=;
        b=dZWDHfvQREbCXaXMfLTlAN/ImJ4YzR90JGPDobMSvRjfo3DSM0x+5VCUczCLj0G5qs
         Mm2pCkq5n5AzW/MGjy0OvK0d2XV19K/EpttgdwLUNeMne/B5/bbMcdnLAbmI6TJrpgIX
         6/D2m+0BB4cOXOttT3JVKg1M0WyCHdgJRaDX6oRKBi8YgEg2TAJFXDZt9wN8aZ8g9EgS
         9DcMO/SPMRqRJw+c+apA/QsmFjBdMFwVLQiVk7tyE06YhYVirG9NwbIgp3v3sezDbIam
         VndVkzszKK7nwhZWCeDvj2wrl29EQeGPhC4jmOYJcU/wlqdZZwXe1+RexzeQo7p6rYki
         Q2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw9sI8cYLVeFOS7pJ8zeypMHhm2x/ms9Aas89XTT3icJ3Fn339NgUZ9dhsju/jD2vOr+rlcP1fac83@vger.kernel.org, AJvYcCX4HEndLUawTLSpo1XMkWCj8wDw7eNLwCYgvLKhQqbUgSGl3w5St1UCTlUgtaT6VfNpOdO6gQzxzHqdhHP6@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1loNZXYE0UL56op7eTY+1DkMXqpxX85c/J+8qFW/aNrnbMC9
	2kteLiGzDL8R4QJX+u64U7VyZloyOSZs+jQeN6xgTH9oAWoQYsDg
X-Gm-Gg: ASbGnctPXjgq/RVyVXpEO/eXAjqnh+saQMaA1QY+DjQ3KkV3OwoyXchbpCkeAQnONm9
	CNhsogE60NcthMPH+JhxMAmfwafDvCiw9SRhxqj8614pBDZJgaSENIkS3/i3EVl+ih2Ddx4jL/z
	4KXIeDiRsC1H3C01pPrKI7H/vrYcWbRqNSDF6XltlGfp7ATK/ARjmV+o/XrSZCfm4HITc7b5PH0
	dt9bYB3STc2Iq/fCZ8bM/FoS/o15c5zA3TB6XgW9gx/6Y5k1m+sxn18sbudL4uS6+2MD686CIXL
	5GxgPwD1SYmPoGQpCy04ZUKfjmvVte3x
X-Google-Smtp-Source: AGHT+IF0G52K5OTADThlZDTrSm95WmPjzAO5b6B7TD2AwzGrMQeRJpmOGTQWhJTo8w20KM+D00kqDg==
X-Received: by 2002:a05:6402:d0e:b0:5f3:4665:bfa5 with SMTP id 4fb4d7f45d1cf-5fab05e1bbcmr8721986a12.33.1746523650457;
        Tue, 06 May 2025 02:27:30 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:27:30 -0700 (PDT)
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
Subject: [PATCH v3 2/4] drm: panel: Add support for Renesas R61307 based MIPI DSI panel
Date: Tue,  6 May 2025 12:27:16 +0300
Message-ID: <20250506092718.106088-3-clamor95@gmail.com>
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

R61307 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Supported compatibles are:
- hit,tx13d100vm0eaa
- koe,tx13d100vm0eaa

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                |  13 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 325 +++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 639f4324db61..d15ad60d977f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -635,6 +635,19 @@ config DRM_PANEL_RAYDIUM_RM69380
 	  This panel controller can be found in the Lenovo Xiaoxin Pad Pro 2021
 	  in combination with an EDO OLED panel.
 
+config DRM_PANEL_RENESAS_R61307
+	tristate "Renesas R61307 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for KOE tx13d100vm0eaa
+	  IPS-LCD module with Renesas R69328 IC. The panel has a 1024x768
+	  resolution and uses 24 bit RGB per pixel.
+
+	  This panel controller can be found in LG Optimus Vu P895 smartphone
+	  in combination with LCD panel.
+
 config DRM_PANEL_RONBO_RB070D30
 	tristate "Ronbo Electronics RB070D30 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 5eec88e4ac3d..196288532c9f 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67200) += panel-raydium-rm67200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
new file mode 100644
index 000000000000..319415194839
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -0,0 +1,325 @@
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
+#define R61307_MACP		0xb0 /* Manufacturer CMD Protect */
+#define   R61307_MACP_ON	0x03
+#define   R61307_MACP_OFF	0x04
+
+#define R61307_INVERSION	0xc1
+#define R61307_GAMMA_SET_A	0xc8 /* Gamma Setting A */
+#define R61307_GAMMA_SET_B	0xc9 /* Gamma Setting B */
+#define R61307_GAMMA_SET_C	0xca /* Gamma Setting C */
+#define R61307_CONTRAST_SET	0xcc
+
+struct renesas_r61307 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *vcc_supply;
+	struct regulator *iovcc_supply;
+
+	struct gpio_desc *reset_gpio;
+
+	bool prepared;
+
+	bool dig_cont_adj;
+	bool inversion;
+	u32 gamma;
+};
+
+static const u8 gamma_setting[][25] = {
+	{ /* sentinel */ },
+	{
+		R61307_GAMMA_SET_A,
+		0x00, 0x06, 0x0a, 0x0f,
+		0x14, 0x1f, 0x1f, 0x17,
+		0x12, 0x0c, 0x09, 0x06,
+		0x00, 0x06, 0x0a, 0x0f,
+		0x14, 0x1f, 0x1f, 0x17,
+		0x12, 0x0c, 0x09, 0x06
+	},
+	{
+		R61307_GAMMA_SET_A,
+		0x00, 0x05, 0x0b, 0x0f,
+		0x11, 0x1d, 0x20, 0x18,
+		0x18, 0x09, 0x07, 0x06,
+		0x00, 0x05, 0x0b, 0x0f,
+		0x11, 0x1d, 0x20, 0x18,
+		0x18, 0x09, 0x07, 0x06
+	},
+	{
+		R61307_GAMMA_SET_A,
+		0x0b, 0x0d, 0x10, 0x14,
+		0x13, 0x1d, 0x20, 0x18,
+		0x12, 0x09, 0x07, 0x06,
+		0x0a, 0x0c, 0x10, 0x14,
+		0x13, 0x1d, 0x20, 0x18,
+		0x12, 0x09, 0x07, 0x06
+	},
+};
+
+static inline struct renesas_r61307 *to_renesas_r61307(struct drm_panel *panel)
+{
+	return container_of(panel, struct renesas_r61307, panel);
+}
+
+static void renesas_r61307_reset(struct renesas_r61307 *priv)
+{
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int renesas_r61307_prepare(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+	struct device *dev = &priv->dsi->dev;
+	int ret;
+
+	if (priv->prepared)
+		return 0;
+
+	ret = regulator_enable(priv->vcc_supply);
+	if (ret) {
+		dev_err(dev, "failed to enable vcc power supply\n");
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+
+	ret = regulator_enable(priv->iovcc_supply);
+	if (ret) {
+		dev_err(dev, "failed to enable iovcc power supply\n");
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+
+	renesas_r61307_reset(priv);
+
+	priv->prepared = true;
+	return 0;
+}
+
+static int renesas_r61307_enable(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 80);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_msleep(&ctx, 20);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&ctx, MIPI_DCS_PIXEL_FMT_24BIT << 4);
+
+	/* MACP Off */
+	mipi_dsi_generic_write_seq_multi(&ctx, R61307_MACP, R61307_MACP_OFF);
+
+	if (priv->dig_cont_adj)
+		mipi_dsi_generic_write_seq_multi(&ctx, R61307_CONTRAST_SET,
+						 0xdc, 0xb4, 0xff);
+
+	if (priv->gamma)
+		mipi_dsi_generic_write_multi(&ctx, gamma_setting[priv->gamma],
+					     sizeof(gamma_setting[priv->gamma]));
+
+	if (priv->inversion)
+		mipi_dsi_generic_write_seq_multi(&ctx, R61307_INVERSION,
+						 0x00, 0x50, 0x03, 0x22,
+						 0x16, 0x06, 0x60, 0x11);
+	else
+		mipi_dsi_generic_write_seq_multi(&ctx, R61307_INVERSION,
+						 0x00, 0x10, 0x03, 0x22,
+						 0x16, 0x06, 0x60, 0x01);
+
+	/* MACP On */
+	mipi_dsi_generic_write_seq_multi(&ctx, R61307_MACP, R61307_MACP_ON);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 50);
+
+	return 0;
+}
+
+static int renesas_r61307_disable(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 100);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	return 0;
+}
+
+static int renesas_r61307_unprepare(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+
+	if (!priv->prepared)
+		return 0;
+
+	usleep_range(10000, 11000);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(5000, 6000);
+
+	regulator_disable(priv->iovcc_supply);
+	usleep_range(2000, 3000);
+	regulator_disable(priv->vcc_supply);
+
+	priv->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode renesas_r61307_mode = {
+	.clock = (768 + 116 + 81 + 5) * (1024 + 24 + 8 + 2) * 60 / 1000,
+	.hdisplay = 768,
+	.hsync_start = 768 + 116,
+	.hsync_end = 768 + 116 + 81,
+	.htotal = 768 + 116 + 81 + 5,
+	.vdisplay = 1024,
+	.vsync_start = 1024 + 24,
+	.vsync_end = 1024 + 24 + 8,
+	.vtotal = 1024 + 24 + 8 + 2,
+	.width_mm = 76,
+	.height_mm = 101,
+};
+
+static int renesas_r61307_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &renesas_r61307_mode);
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
+static const struct drm_panel_funcs renesas_r61307_panel_funcs = {
+	.prepare = renesas_r61307_prepare,
+	.enable = renesas_r61307_enable,
+	.disable = renesas_r61307_disable,
+	.unprepare = renesas_r61307_unprepare,
+	.get_modes = renesas_r61307_get_modes,
+};
+
+static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct renesas_r61307 *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct renesas_r61307, panel,
+				    &renesas_r61307_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->vcc_supply = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(priv->vcc_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
+				     "Failed to get vcc-supply\n");
+
+	priv->iovcc_supply = devm_regulator_get(dev, "iovcc");
+	if (IS_ERR(priv->iovcc_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
+				     "Failed to get iovcc-supply\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset gpios\n");
+
+	if (device_property_read_bool(dev, "renesas,inversion"))
+		priv->inversion = true;
+
+	if (device_property_read_bool(dev, "renesas,contrast"))
+		priv->dig_cont_adj = true;
+
+	priv->gamma = 0;
+	device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
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
+static void renesas_r61307_remove(struct mipi_dsi_device *dsi)
+{
+	struct renesas_r61307 *priv = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id renesas_r61307_of_match[] = {
+	{ .compatible = "hit,tx13d100vm0eaa" },
+	{ .compatible = "koe,tx13d100vm0eaa" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_r61307_of_match);
+
+static struct mipi_dsi_driver renesas_r61307_driver = {
+	.probe = renesas_r61307_probe,
+	.remove = renesas_r61307_remove,
+	.driver = {
+		.name = "panel-renesas-r61307",
+		.of_match_table = renesas_r61307_of_match,
+	},
+};
+module_mipi_dsi_driver(renesas_r61307_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Renesas R61307-based panel driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

