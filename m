Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B61F3B8C;
	Fri,  4 Apr 2025 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774665; cv=none; b=DpEWmOAbiwLr+oJkwQWENgdPB029uggPER7/ct4671RGqJ64n1IY8W77pwfA8JKK915XsCelcSCcNKRjkSSk6VcnlGGwlCUd0HDsUuC/8RdIyYZbRmzu85WtYi9MMd+2jTD9dzrTJF3lxFdyFQx7C7gd+xCgvvTJnWv5FAiOQ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774665; c=relaxed/simple;
	bh=X4W7yRod4eyz7LxkAwDKzkROjYYkZiMZ1ThV40BXHAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knzi0TI5/jLeBTYsLFsP0GzryKIrF/QsXHTS9QthS6VW9Z8C4/0xim6UNsL5f9AAjfm6papzLnw/DGqdukjjvAh29hXhiDJuEh/37JS30jh5thoC+hLjavz+1fZjO5qpn4F3wa4u2AbT1jURex6IE6NPThA+MaS9IcBV9j2xdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJsH6WJO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJsH6WJO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549946c5346so2458073e87.2;
        Fri, 04 Apr 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743774661; x=1744379461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+FWGRxndw8lgRZE20/nhPn3swMIOQD7fv5k2MtzArY=;
        b=bJsH6WJOYsTIPlK3sy3dVFNpHG5seEizB09GzQeRg8g8EeUE7SK4NbTleDElWH3a8M
         C8DXcNyNwhCZZbo0BKndej12P8bnsvtzaYDwYkVX8iCZMiyJ8+0/m4jN0Ld5wy38LPkM
         7u3fWdGGIgq/lt+3qnyYezQ761JtjmHb1UKw8rixp7Yq0juVyfm8XvFp/azociGeFRo1
         7wpC+GX90vr/r/rCtlMHi70tgAcmbJfyuo4DyMFBzCgO+cxx95x9rTL7q0xjvBl8BdD1
         Q+OKBANJP0+TYnYgxDYaGJcZmKWJFPZpbykeJbfhcjXNYqwafwChsOF+i9q5h5KugvRU
         /1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774661; x=1744379461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+FWGRxndw8lgRZE20/nhPn3swMIOQD7fv5k2MtzArY=;
        b=bXFfckWt+kFCQOrxCDV+c6EpTXk0cW07lYqmEJTz/Pd48OmLj/hG7xpRwwlNI5dAvV
         kCptKrg6Mdwau9npM18jcOq+wYZdbTQ3VCTn5WMeDZcCt/4H2rtICq4Iold/YYgbWuoS
         wBTXw2ZwS+EQsnY2DvXYLWEFTL8LaX4edXWB1cMyR2YqL7L+PJtX0KHvGVL0NdlfspiB
         rjGQttO8048PYxiBFMLLHaqTfx1BAoeVv+TKPHD+iv37IO4kY3y2fNKMGRjIqYeJOaME
         Eb1AanZdzOeMLFzouCwS6FGjfIR7+pOTPndPq4awNW26M/gvkORncBy4nW2tUiornm9U
         kGwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZjXQkyBGy/fcl6LINPqX1npFCszFTJkasmvK//6k6/BueIAKgDu+S5ma+AZeVURA2v7VL2TLObWBr@vger.kernel.org, AJvYcCX0uQzea8ZJMOilGnAJVt29a0hbk0aV3Q6VtnCYtdMZcacd1ijR6tcwzNEE4WJ1oWGCTNYLZaZ2mfg/2sqj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ol3JOxUQsb6e2WrqwzsXIgDxRyX0Ibu1FWAdmlSa3arnkdVO
	egPqeCaZNOYLvG3RrQxP+8igFl8o1wNkemnb8DQRfbA3ewnsYn+EWnm2t16lh8M=
X-Gm-Gg: ASbGncuLHbgJpfdCL5UyV0GW4DvmLPjmRJ7gMghlfe0Gd3ajKNl3TNf/nvigv14gHau
	aUoDbjI4q/0Pl88kZ2MD0nIAuntF0/wf7LbwI11TqzpU4FbLSNs5l+fn0nAQUuTNPm89/5JnOk2
	Zp44oiwhvELH9oG0Dp2siyJnwHAHxqeUn0bOhWIFrRky5o8Cqpd7mMSvIOKU+zphEs6sAGXGuIb
	rUAnJRuK0nbgKu+Qck24F7OuIIpoE/Ls7CjMd0jk91Inn3iZgqm23antPk2CsKDr50RA0rdKuTr
	SEhgbjAzVLSKnnyOP9BQRQ5EM5HwGndVb35Qs+Gkexr4l8z/G8XrvM6RJaNWAJuSYjK/qy6sHNf
	wrlPGH2kxplGvpZ5MNlh5Jztk
X-Google-Smtp-Source: AGHT+IF2pyjE9zAzVab28JVvSDKRLdQ9dJIdpnNGZniZMzyLsZOeeUEIuXjzLkSud/nygCt/URILTw==
X-Received: by 2002:a05:6512:33d2:b0:545:944:aae1 with SMTP id 2adb3069b0e04-54c22767d83mr993797e87.12.1743774660496;
        Fri, 04 Apr 2025 06:51:00 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:50:59 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 04 Apr 2025 15:50:33 +0200
Subject: [PATCH v2 2/3] drm/st7571-i2c: add support for Sitronix ST7571 LCD
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-st7571-v2-2-4c78aab9cd5a@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
In-Reply-To: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22618;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=X4W7yRod4eyz7LxkAwDKzkROjYYkZiMZ1ThV40BXHAQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+O2WRskSfLVu060byALkeuckFirjpyBXe2P8
 yAYxy51AlSJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/jtgAKCRCIgE5vWV1S
 MgI/D/4npsQCqZD0Gkmdi6lt/76XIK2BrPveazwMv7gKjvbhCst/148ZOR0RO52mUITrCwv1f7t
 wtqCVjESDCLbVKVGIAYSJFItwqshW2Zjw3G27aJ+m3a5I9pO66hcjxtWfItRFJz668E95ZFnkkh
 6vsTWhQmOhMYfSbpdqD6Od3Qzy/kbzZzGYOr0g0iVpxRYM+Id/hmKb6tICWeBOoKuVgmvywWsPX
 OH+LE5PBnC2x22y9yzBz2aOfpJ8K4KAuZNeY/saLXvlc00FyFOKetq+HqVIOiyG7hsVeUxUkb5h
 PdM/lur26LHOjESAX1KI9PYKFwkWykYoI1gKVQdX0OnB9ZSykCKxJt8oWmbjmjLbKk2lLkMG5kx
 gVaK8q8mPgzjG9mM+G57ceeAjtj0KYq1MLaM7rpDf3V6Eku3RBBu1eJpUDXR4E7ldT0dg7Gxrnw
 CmAmRjJ++hsUGZM2dLpe4AiDycSKAgTClbRZCT+eUPxgJjdPDfZjY0QnsGDBzUMrwcxBQ0ngZgi
 qJFsyUs8/n83uzmP/9ahPaK2vBKwI59RnfvDPaN2OyCMElWSnaDs/1VnOSC7OTVdUxzeJ7Fi5mH
 eEuaGG3fBZg42FPiV9WWQrKPtEybjERHIXdyGBXe9MJdBa63tcnmdh0cuKb7ecR8dMWoZEp8oFo
 Alnk5T/u4Tnt+tA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
The controller has a SPI, I2C and 8bit parallel interface, this
driver is for the I2C interface only.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig      |  11 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c | 720 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 732 insertions(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94cbdb1337c07f1628a33599a7130369b9d59d98..6c711f4b799e05a8edc8e5fd68de0542d9cb6cab 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -232,6 +232,17 @@ config TINYDRM_ST7586
 
 	  If M is selected the module will be called st7586.
 
+config TINYDRM_ST7571_I2C
+	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
+	depends on DRM && I2C
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select REGMAP_I2C
+	help
+	  DRM driver for Sitronix ST7571 panels controlled over I2C.
+
+	  if M is selected the module will be called st7571-i2c.
+
 config TINYDRM_ST7735R
 	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 60816d2eb4ff93b87228ed8eadd60a0a33a1144b..ed767dd9d22b3bb98f50fa2007cad7fb3f3d95e4 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -15,5 +15,6 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
+obj-$(CONFIG_TINYDRM_ST7571_I2C)	+= st7571-i2c.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
new file mode 100644
index 0000000000000000000000000000000000000000..196ecd662c73dfaa9940fc601a656305c81a1619
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Sitronix ST7571, a 4 level gray scale dot matrix LCD controller
+ *
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_module.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/display_timing.h>
+#include <video/of_display_timing.h>
+
+#define ST7571_COMMAND_MODE			(0x00)
+#define ST7571_DATA_MODE			(0x40)
+
+/* Normal mode command set */
+#define ST7571_DISPLAY_OFF			(0xae)
+#define ST7571_DISPLAY_ON			(0xaf)
+#define ST7571_OSC_ON				(0xab)
+#define ST7571_SET_COLUMN_LSB(c)		(0x00 | ((c) & 0xf))
+#define ST7571_SET_COLUMN_MSB(c)		(0x10 | ((c) >> 4))
+#define ST7571_SET_COM0_LSB(x)			((x) & 0x7f)
+#define ST7571_SET_COM0_MSB			(0x44)
+#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | (((d) << 3) & 0x8))
+#define ST7571_SET_CONTRAST_LSB(c)		((c) & 0x3f)
+#define ST7571_SET_CONTRAST_MSB			(0x81)
+#define ST7571_SET_DISPLAY_DUTY_LSB(d)		((d) & 0xff)
+#define ST7571_SET_DISPLAY_DUTY_MSB		(0x48)
+#define ST7571_SET_ENTIRE_DISPLAY_ON(p)		(0xa4 | ((p) & 0x1))
+#define ST7571_SET_LCD_BIAS(b)			(0x50 | ((b) & 0x7))
+#define ST7571_SET_MODE_LSB(m)			((m) & 0xfc)
+#define ST7571_SET_MODE_MSB			(0x38)
+#define ST7571_SET_PAGE(p)			(0xb0 | (p))
+#define ST7571_SET_POWER(p)			(0x28 | ((p) & 0x7))
+#define ST7571_SET_REGULATOR_REG(r)		(0x20 | ((r) & 0x7))
+#define ST7571_SET_REVERSE(r)			(0xa6 | ((r) & 0x1))
+#define ST7571_SET_SEG_SCAN_DIR(d)		(0xa0 | ((d) & 0x1))
+#define ST7571_SET_START_LINE_LSB(l)		((l) & 0x3f)
+#define ST7571_SET_START_LINE_MSB		(0x40)
+
+/* Extension command set 3 */
+#define ST7571_COMMAND_SET_3			(0x7b)
+#define ST7571_SET_COLOR_MODE(c)		(0x10 | ((c) & 0x1))
+#define ST7571_COMMAND_SET_NORMAL		(0x00)
+
+
+/* hactive is fixed to 128 */
+#define ST7571_HACTIVE				(128)
+
+#define DRIVER_NAME "st7571"
+#define DRIVER_DESC "ST7571 DRM driver"
+#define DRIVER_MAJOR 1
+#define DRIVER_MINOR 0
+
+enum st7571_color_mode {
+	ST7571_COLOR_MODE_GRAY = 0,
+	ST7571_COLOR_MODE_BLACKWHITE = 1,
+};
+
+#define drm_to_st7571(_dev) container_of(_dev, struct st7571_device, dev)
+
+struct st7571_device {
+	struct drm_plane primary_plane;
+	struct drm_connector connector;
+	struct drm_display_mode mode;
+	struct drm_encoder encoder;
+	struct drm_device dev;
+	struct drm_crtc crtc;
+
+	struct i2c_client *client;
+	struct regmap *regmap;
+	bool ignore_nak;
+
+	struct gpio_desc *reset;
+
+	u32 width_mm;
+	u32 height_mm;
+	u32 nlines;
+	u32 startline;
+};
+
+static int st7571_regmap_write(void *context, const void *data, size_t count)
+{
+	struct i2c_client *client = context;
+	struct st7571_device *st7571 = i2c_get_clientdata(client);
+	int ret;
+
+	struct i2c_msg msg = {
+		.addr = st7571->client->addr,
+		.flags = st7571->ignore_nak ? I2C_M_IGNORE_NAK : 0,
+		.len = count,
+		.buf = (u8 *)data
+	};
+
+	ret = i2c_transfer(st7571->client->adapter, &msg, 1);
+	/*
+	 * This is a workaround for the ST7571, which sometimes fails to acknowledge
+	 *
+	 * Unfortunately, there is no way to check if the transfer failed because of
+	 * a NAK or something else as I2C bus drivers use different return values for NAK.
+	 *
+	 * However, if the transfer fails and ignore_nak is set, we know it is an error.
+	 */
+	if (ret < 0 && st7571->ignore_nak)
+		return ret;
+
+	return 0;
+}
+
+static int st7571_regmap_read(void *context, const void *reg_buf,
+			       size_t reg_size, void *val_buf, size_t val_size)
+{
+	return -EOPNOTSUPP;
+}
+
+static int st7571_send_command_list(struct st7571_device *st7571,
+				    const u8 *cmd_list, size_t len)
+{
+	int ret;
+
+	for (int i = 0; i < len; i++) {
+		ret = regmap_write(st7571->regmap, ST7571_COMMAND_MODE, cmd_list[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
+static inline u8 st7571_transform_xy(const char *p, int x, int y)
+{
+	int xrest = x % 8;
+	u8 result = 0;
+
+	/*
+	 * Transforms an (x, y) pixel coordinate into a vertical 8-bit
+	 * column from the framebuffer. It calculates the corresponding byte in the
+	 * framebuffer, extracts the bit at the given x position across 8 consecutive
+	 * rows, and packs those bits into a single byte.
+	 *
+	 * Return an 8-bit value representing a vertical column of pixels.
+	 */
+	x = x / 8;
+	y = (y / 8) * 8;
+
+	for (int i = 0; i < 8; i++) {
+		int row_idx = y + i;
+		u8 byte = p[row_idx * 16 + x];
+		u8 bit = (byte >> (xrest)) & 1;
+
+		result |= (bit << i);
+	}
+
+	return result;
+}
+
+static int st7571_set_position(struct st7571_device *st7571, int x, int y)
+{
+	u8 cmd_list[] = {
+		ST7571_SET_COLUMN_LSB(x),
+		ST7571_SET_COLUMN_MSB(x),
+		ST7571_SET_PAGE(y / 8),
+	};
+
+	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static int st7571_fb_blit_rect(struct drm_framebuffer *fb,
+			       const struct iosys_map *vmap,
+			       struct drm_rect *rect)
+{
+	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
+	int bpp = fb->format->format == DRM_FORMAT_C1 ? 1 : 2;
+	char *pixel = vmap->vaddr;
+	int x1 = rect->x1 * bpp;
+	int x2 = rect->x2 * bpp;
+	char row[256];
+
+	for (int y = rect->y1; y < rect->y2; y += 8) {
+		for (int x = x1; x < x2; x++)
+			row[x] = st7571_transform_xy(pixel, x, y);
+
+		st7571_set_position(st7571, rect->x1, y);
+
+		/* TODO: Investige why we can't write multiple bytes at once */
+		for (int x = x1; x < x2; x++)
+			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
+	}
+
+	return 0;
+}
+
+static int st7571_set_color_mode(struct st7571_device *st7571, enum st7571_color_mode  mode)
+{
+	u8 cmd_list[] = {
+		ST7571_COMMAND_SET_3,
+		ST7571_SET_COLOR_MODE(mode),
+		ST7571_COMMAND_SET_NORMAL,
+	};
+
+	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static int st7571_set_pixel_format(struct st7571_device *st7571,
+				   u32 pixel_format)
+{
+	switch (pixel_format) {
+	case DRM_FORMAT_C1:
+		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE);
+	case DRM_FORMAT_C2:
+		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int st7571_connector_get_modes(struct drm_connector *conn)
+{
+	struct st7571_device *st7571 = drm_to_st7571(conn->dev);
+
+	return drm_connector_helper_get_modes_fixed(conn, &st7571->mode);
+}
+
+static const struct drm_connector_helper_funcs st7571_connector_helper_funcs = {
+	.get_modes = st7571_connector_get_modes,
+};
+
+static const uint32_t st7571_primary_plane_formats[] = {
+	DRM_FORMAT_C1,
+	DRM_FORMAT_C2,
+};
+
+static const uint64_t st7571_primary_plane_fmtmods[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static int st7571_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_device *dev = plane->dev;
+	struct drm_rect damage;
+	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
+	int ret, idx;
+
+	if (!fb)
+		return; /* no framebuffer; plane is disabled */
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	ret = st7571_set_pixel_format(st7571, fb->format->format);
+	if (ret) {
+		dev_err(dev->dev, "Failed to set pixel format: %d\n", ret);
+		return;
+	}
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		st7571_fb_blit_rect(fb, &shadow_plane_state->data[0], &damage);
+	}
+
+	drm_dev_exit(idx);
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+}
+
+static const struct drm_plane_helper_funcs st7571_primary_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = st7571_primary_plane_helper_atomic_check,
+	.atomic_update = st7571_primary_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs st7571_primary_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+/*
+ * CRTC
+ */
+
+static const struct drm_crtc_helper_funcs st7571_crtc_helper_funcs = {
+	.atomic_check = drm_crtc_helper_atomic_check,
+};
+
+static const struct drm_crtc_funcs st7571_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+/*
+ * Encoder
+ */
+
+static const struct drm_encoder_funcs st7571_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+/*
+ * Connector
+ */
+
+static const struct drm_connector_funcs st7571_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static enum drm_mode_status st7571_mode_config_mode_valid(struct drm_device *dev,
+						       const struct drm_display_mode *mode)
+{
+	struct st7571_device *st7571 = drm_to_st7571(dev);
+
+	return drm_crtc_helper_mode_valid_fixed(&st7571->crtc, mode, &st7571->mode);
+}
+
+static const struct drm_mode_config_funcs st7571_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = st7571_mode_config_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static struct drm_display_mode st7571_mode(struct st7571_device *st7571)
+{
+	struct drm_display_mode mode = {
+		DRM_SIMPLE_MODE(ST7571_HACTIVE, st7571->nlines,
+				st7571->width_mm, st7571->height_mm),
+	};
+
+	return mode;
+}
+
+static int st7571_mode_config_init(struct st7571_device *st7571)
+{
+	struct drm_device *dev = &st7571->dev;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = ST7571_HACTIVE;
+	dev->mode_config.min_height = 1;
+	dev->mode_config.max_width = ST7571_HACTIVE;
+	dev->mode_config.max_height = 128;
+	dev->mode_config.preferred_depth = 1;
+	dev->mode_config.funcs = &st7571_mode_config_funcs;
+
+	return 0;
+}
+
+static int st7571_plane_init(struct st7571_device *st7571)
+{
+	struct drm_plane *primary_plane = &st7571->primary_plane;
+	struct drm_device *dev = &st7571->dev;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 1,
+				       &st7571_primary_plane_funcs,
+				       st7571_primary_plane_formats,
+				       ARRAY_SIZE(st7571_primary_plane_formats),
+				       st7571_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(primary_plane, &st7571_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	return 0;
+}
+
+static int st7571_crtc_init(struct st7571_device *st7571)
+{
+	struct drm_plane *primary_plane = &st7571->primary_plane;
+	struct drm_crtc *crtc = &st7571->crtc;
+	struct drm_device *dev = &st7571->dev;
+	int ret;
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&st7571_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(crtc, &st7571_crtc_helper_funcs);
+
+	return 0;
+}
+
+static int st7571_encoder_init(struct st7571_device *st7571)
+{
+	struct drm_encoder *encoder = &st7571->encoder;
+	struct drm_crtc *crtc = &st7571->crtc;
+	struct drm_device *dev = &st7571->dev;
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, &st7571_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	return 0;
+}
+
+static int st7571_connector_init(struct st7571_device *st7571)
+{
+	struct drm_connector *connector = &st7571->connector;
+	struct drm_encoder *encoder = &st7571->encoder;
+	struct drm_device *dev = &st7571->dev;
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &st7571_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &st7571_connector_helper_funcs);
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
+
+DEFINE_DRM_GEM_FOPS(st7571_fops);
+
+static const struct drm_driver st7571_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+
+	.name		 = DRIVER_NAME,
+	.desc		 = DRIVER_DESC,
+	.major		 = DRIVER_MAJOR,
+	.minor		 = DRIVER_MINOR,
+
+	.fops		 = &st7571_fops,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+};
+
+static const struct regmap_bus st7571_regmap_bus = {
+	.read = st7571_regmap_read,
+	.write = st7571_regmap_write,
+};
+
+static const struct regmap_config st7571_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.use_single_write = true,
+};
+
+static int st7571_parse_dt(struct st7571_device *st7571)
+{
+	struct device *dev = &st7571->client->dev;
+	struct device_node *np = dev->of_node;
+	struct display_timing dt;
+	int ret;
+
+	ret = of_get_display_timing(np, "panel-timing", &dt);
+	if (ret) {
+		dev_err(dev, "Failed to get display timing from DT\n");
+		return ret;
+	}
+
+	of_property_read_u32(np, "width-mm", &st7571->width_mm);
+	of_property_read_u32(np, "height-mm", &st7571->height_mm);
+
+	st7571->startline = dt.vfront_porch.typ;
+	st7571->nlines = dt.vactive.typ;
+
+	if (dt.hactive.typ != ST7571_HACTIVE) {
+		dev_err(dev, "Invalid timing configuration (hactive != %i).\n",
+			ST7571_HACTIVE);
+		return -EINVAL;
+	}
+
+	if (st7571->width_mm == 0 || st7571->height_mm == 0) {
+		dev_err(dev, "Invalid panel dimensions.\n");
+		return -EINVAL;
+	}
+
+	if (st7571->startline + st7571->nlines > 128) {
+		dev_err(dev, "Invalid timing configuration.\n");
+		return -EINVAL;
+	}
+
+	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(st7571->reset))
+		return PTR_ERR(st7571->reset);
+
+	return 0;
+}
+
+static void st7571_reset(struct st7571_device *st7571)
+{
+	gpiod_set_value_cansleep(st7571->reset, 1);
+	udelay(20);
+	gpiod_set_value_cansleep(st7571->reset, 0);
+}
+
+static int st7571_lcd_init(struct st7571_device *st7571)
+{
+	/*
+	 * Most of the initialization sequence is taken directly from the
+	 * referential initial code in the ST7571 datasheet.
+	 */
+	u8 commands[] = {
+		ST7571_DISPLAY_OFF,
+		ST7571_SET_MODE_MSB,
+
+		ST7571_SET_MODE_LSB(0x94),
+		ST7571_SET_SEG_SCAN_DIR(0),
+		ST7571_SET_COM_SCAN_DIR(1),
+
+		ST7571_SET_COM0_MSB,
+		ST7571_SET_COM0_LSB(0x00),
+
+		ST7571_SET_START_LINE_MSB,
+		ST7571_SET_START_LINE_LSB(st7571->startline),
+
+		ST7571_OSC_ON,
+		ST7571_SET_REGULATOR_REG(5),
+		ST7571_SET_CONTRAST_MSB,
+		ST7571_SET_CONTRAST_LSB(0x33),
+		ST7571_SET_LCD_BIAS(0x04),
+		ST7571_SET_DISPLAY_DUTY_MSB,
+		ST7571_SET_DISPLAY_DUTY_LSB(st7571->nlines),
+
+
+		ST7571_SET_POWER(0x4),	/* Power Control, VC: ON, VR: OFF, VF: OFF */
+		ST7571_SET_POWER(0x6),	/* Power Control, VC: ON, VR: ON, VF: OFF */
+		ST7571_SET_POWER(0x7),	/* Power Control, VC: ON, VR: ON, VF: ON */
+
+		ST7571_SET_REVERSE(0),
+		ST7571_SET_ENTIRE_DISPLAY_ON(0),
+
+		ST7571_DISPLAY_ON,
+	};
+
+	/* Perform a reset before initializing the controller */
+	st7571_reset(st7571);
+
+	return st7571_send_command_list(st7571, commands, ARRAY_SIZE(commands));
+}
+
+
+static int st7571_probe(struct i2c_client *client)
+{
+	struct st7571_device *st7571;
+	struct drm_device *dev;
+	int ret;
+
+	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
+				    struct st7571_device, dev);
+	if (IS_ERR(st7571))
+		return PTR_ERR(st7571);
+
+	dev = &st7571->dev;
+	st7571->client = client;
+	i2c_set_clientdata(client, st7571);
+
+	ret = st7571_parse_dt(st7571);
+	if (ret)
+		return ret;
+
+	st7571->mode = st7571_mode(st7571);
+
+	/*
+	 * The chip nacks some messages but still works as expected.
+	 * If the adapter does not support protocol mangling do
+	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
+	 * cruft in the logs.
+	 */
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
+		st7571->ignore_nak = true;
+
+	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
+					   client, &st7571_regmap_config);
+	if (IS_ERR(st7571->regmap)) {
+		dev_err(&client->dev, "Failed to initialize regmap\n");
+		return PTR_ERR(st7571->regmap);
+	}
+
+	ret = st7571_lcd_init(st7571);
+	if (ret)
+		return ret;
+
+	ret = st7571_mode_config_init(st7571);
+	if (ret) {
+		dev_err(&client->dev, "Failed to initialize mode config\n");
+		return ret;
+	}
+
+	ret = st7571_plane_init(st7571);
+	if (ret) {
+		dev_err(dev->dev, "Failed to initialize primary plane\n");
+		return ret;
+	}
+
+	ret = st7571_crtc_init(st7571);
+	if (ret < 0) {
+		dev_err(dev->dev, "Failed to initialize CRTC\n");
+		return ret;
+	}
+
+	ret = st7571_encoder_init(st7571);
+	if (ret < 0) {
+		dev_err(dev->dev, "Failed to initialize encoder\n");
+		return ret;
+	}
+
+	ret = st7571_connector_init(st7571);
+	if (ret < 0) {
+		dev_err(dev->dev, "Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_mode_config_reset(dev);
+
+	ret = drm_dev_register(dev, 0);
+	if (ret) {
+		dev_err(dev->dev, "Failed to register DRM device\n");
+		return ret;
+	}
+
+	drm_client_setup(dev, NULL);
+	return 0;
+}
+
+static void st7571_remove(struct i2c_client *client)
+{
+	struct st7571_device *st7571 = i2c_get_clientdata(client);
+
+	drm_dev_unplug(&st7571->dev);
+	drm_atomic_helper_shutdown(&st7571->dev);
+}
+
+static const struct of_device_id st7571_of_match[] = {
+	{ .compatible = "sitronix,st7571" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7571_of_match);
+
+
+static const struct i2c_device_id st7571_id[] = {
+	{ "st7571", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, st7571_id);
+
+static struct i2c_driver st7571_i2c_driver = {
+	.driver = {
+		.name = "st7571",
+		.of_match_table = st7571_of_match,
+	},
+	.probe = st7571_probe,
+	.remove = st7571_remove,
+	.id_table = st7571_id,
+};
+
+module_i2c_driver(st7571_i2c_driver);
+
+MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");
+MODULE_DESCRIPTION("DRM Driver for Sitronix ST7571 LCD controller");
+MODULE_LICENSE("GPL");

-- 
2.49.0

