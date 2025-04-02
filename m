Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED33231A41;
	Wed,  2 Apr 2025 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574367; cv=none; b=KbPGwB/znFfWLyv7d1YwSeCFYlkipW/3Fj18+RdKXJNFGrIohHWyqvsfU/UHrV2qmv0WsbGD5PBOS8ckdxZmaobFKd0WrF+FQX0cAO55PlvjKYZrCoWKMQS326crmIut0rrGsGdWVqM4ufAcedSiViEnvBkZ3w8Khu76jnC4TWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574367; c=relaxed/simple;
	bh=rVktkbhZ73qxhxvZdI9XYvy0vnRRMgoRCdhnvs8LSms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVqfHk9ml6y0ygVk17osK/p5t/eh5nrsJo7BgJZLsF2Gdz+rdSc45eCUh2peczDfOFdWM6pLYgyB/8PeoCBUhA7ebmQeZvOw8GTKuB/82kT4JqVZEKCdrtqHuhkC//juXmDNLA15CqDYJlugNDYAHX8T+J+0Fi8ZGV7QuWGMtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K//bFwEo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K//bFwEo"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db1bc464dso55765531fa.0;
        Tue, 01 Apr 2025 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743574363; x=1744179163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cV5ZHUICuxYNvHb937fMWFTBE1PnQy7W5glkS0eNxdA=;
        b=K//bFwEovblM5WZFfDLQcX+p7nvkc8vaI8KbHhCkTDt3jG33UUcIBxyOzPjA0nebEp
         rAq883z8j78ec6CuMVwRikVtoArehm+eGzRbKPYL4GWqdm3foAqT6lFgueeeMT0QeFL+
         pqJc3wYd5YrHIMc0ZUrQDLgttfK5qP4I/hhdMdP9/C+8y9E3S5Q5OGDqz5ufSddEoFdV
         8afwuIrudJTXNyHVniDnMBCtmFzP7eVlrc5S8bYeovE+Mq1fPRPW2L/xY3OVQXUa0/bR
         wFapQPhxBW30UVRXSPoW6G28WNgyWWXRA1j4dxuwJ773Fu+Ny5JWgogX7he1R44mj4GT
         P+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743574363; x=1744179163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cV5ZHUICuxYNvHb937fMWFTBE1PnQy7W5glkS0eNxdA=;
        b=lwHLk2E79HVGyndpi2V7Hv9v4drkBRWnAVPQbdqxBgtLR/mE4ZmsFrFYGBfx0N9CI3
         uh54q5rzWCd83lN4W/aBMA+MfO7H7FmuCAxXlU8e35AoHiQgBfx8calJkrb7sknG9H44
         7Ikc0q3lUpM9gGJlFQxnkCOpC3u+nAQsdGYUp4S1QNyIFoIhyvU0RDnWyLpHg+w1giOE
         6rHonPZx84s2jEYkTfMpw30cexegPQEyUoy50Euw343e+o1XbffTgRntB0jJtB2EVakr
         C0HawSQthplCbnSyHRYu6Z5dmf8fm7ZHB3QDrmwe0OmifmJyw8Tr2ShXHIexNW81/MGE
         q0XA==
X-Forwarded-Encrypted: i=1; AJvYcCUqpYuoMtQMimdofSQTaB2StCDTzOthdwbB3SLbm/R7c5uhq4dthXMdjCA+uz5aY7xR5Lfb0fP3THv4rziV@vger.kernel.org, AJvYcCWAN3+G2jmCLQX8EAlz2xRhblg+jecg3MnVJp1tjYwqly1WlN2gSCOedoHem4ou6OQ/EIHBGC2BOiAI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ZJbbthgsd3ep6/SD5jRRgs/YdNaFHC5ulHKv+/yScwiTiasQ
	lv2HB3MrLg69fYT7lpXVnR9M3WFowBWv4AzJLHwZDkJuPqdo2Mf6QCaC/HR4Qgo=
X-Gm-Gg: ASbGnctXu1t8xsupWTfMEjaX+IpQFowrLbqhNCWI3Tt6pDLl8ZDCOvy2M0U/whOzAEK
	srZt293gN9hJG/l/hN/8jhIC4C6pov5w1LnSlJvdg405gqyMpkIu4yS4hXWh0uNuxEG7NdYvV0y
	mpW8tpe6beCIkrMRK32IZKi7l/ZLHmmePRR3s8C1OQpPoptj4n9Ph3QkctDI1wZTEa/dT18lmSP
	9q12Zsy+szhmi3hzwoSUfvmOR6aAJVxBm8VXyva6vFQ1KebGLmY0JW/c2k2Fz4k9cj7pPebEkBT
	ax4G7fZu6Am8fYmMDt/1SA2VNjk/JC93uN6q4htzXFR5JrmXGz27DR9j/Kl2lYHBqPJ6Te310oX
	sbLyedKk9Gt5s
X-Google-Smtp-Source: AGHT+IHUj/Ty9pge8mfDlUOKnw6ytZHiet7VpbtZXmZmXojKYPFOv1Gq3ZqDeYGdlJUdlZePoxZnjQ==
X-Received: by 2002:a05:651c:220d:b0:30b:b9e4:13c5 with SMTP id 38308e7fff4ca-30ef90ccfd1mr3413681fa.4.1743574362795;
        Tue, 01 Apr 2025 23:12:42 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:12:41 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 02 Apr 2025 08:12:11 +0200
Subject: [PATCH 2/3] drm/st7571-i2c: add support for Sitronix ST7571 LCD
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
In-Reply-To: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18061;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=rVktkbhZ73qxhxvZdI9XYvy0vnRRMgoRCdhnvs8LSms=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVM4LNkqygoDLJOBkg20tJVmzcYus9680fly
 SskpFIKZEyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVTAAKCRCIgE5vWV1S
 MsaGD/oCrpPWO1u0rg3G0BqD9nVmzHRtsjZ0WdnmyjkT9nF+BMCEvo8Uggi9LoglvvQHW3cS1i+
 h0fTiOBWRAUIov40EmGUs+JAw/VbXqq1HwcCQ/5TU2QxuDOB04F+RJhR/mXLX6YbnWfzfo744S4
 lKXJbcX/drXtj1HItgDWbqZYv32Gg410KYqz4N+HD4dyTcfFYRJ/Lgs4fq4DDZk9Gq8dwkpHjiU
 nHWdureiFq+knrXm+Sa3AQ6VN2hy0FpVTrYYhH/ct9BnRIv5kjsKOpTfoW6+tsHhCpBAwJvMGdF
 EPb/sveXo5gQjVnUymftzyKz5CEUzveDPyoFeVRzLh0fbnvNBNcmz1+kznG4BPMaK0OzoheQiOy
 6L1g6onUMBRK0FASpqWpcXGzsMv4fccD9gK8S3XD133X47VFeK7TUxJ16HRNaP6f4fOzsMW2jfM
 RsoK+fkbzxOKua6zp2idQ9jOBDUC6temS7ItKvPXmUOvAO4x6PqdYdmjhzV8A/sPUhoiwnXQJ4u
 TDm518O45+gnEoAXGyAj2XDXD8hbo7o3PAI3N8bKwJieYhLAsJGClMUtB82FSjTkOJlAGThhU2K
 +dF28+ZoEvvLD/h/Z5ceZyMUo3aA5I8pjwYVTpERNYFyfiGjWCS+Y3S4u69v3//ip11DaVQGyIz
 m6sPSFxwTS9u4hQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
The controller has a SPI, I2C and 8bit parallel interface, this
driver is for the I2C interface only.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig      |  12 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c | 563 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 576 insertions(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94cbdb1337c07f1628a33599a7130369b9d59d98..14096031e7c2d8f73c06c88e08f35aa5a3790a54 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -232,6 +232,18 @@ config TINYDRM_ST7586
 
 	  If M is selected the module will be called st7586.
 
+config TINYDRM_ST7571_I2C
+	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
+	depends on DRM && I2C
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
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
index 60816d2eb4ff93b87228ed8eadd60a0a33a1144b..343813a965e13326bbb8520a5c34d272ec7821d5 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
+obj-$(CONFIG_TINYDRM_ST7571_I2C)	+= st7571-i2c.o
diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
new file mode 100644
index 0000000000000000000000000000000000000000..c26ecf8a4fd2115b808b126cccda74ea9079cd7c
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -0,0 +1,563 @@
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
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_module.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
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
+#define ST7571_COLOR_MODE_BLACKWHITE		(1)
+#define ST7571_COLOR_MODE_GRAY			(0)
+#define ST7571_COMMAND_SET_NORMAL		(0x00)
+
+#define DRIVER_NAME "st7571-i2c"
+#define DRIVER_DESC "ST7571 DRM driver"
+#define DRIVER_MAJOR 1
+#define DRIVER_MINOR 0
+
+#define to_st7571(_dev) container_of(_dev, struct st7571_device, dev)
+
+struct st7571_device {
+	struct drm_device	       dev;
+	struct drm_simple_display_pipe pipe;
+	struct drm_connector	       conn;
+	struct drm_display_mode mode;
+	struct regmap *regmap;
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	u8 bpp;
+	u32 width_mm;
+	u32 height_mm;
+	u32 nlines;
+	u32 startline;
+	bool ignore_nak;
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
+	if (ret < 0)
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
+		u8 bit = (byte >> (7-xrest)) & 1;
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
+		ST7571_SET_PAGE(y/8),
+	};
+
+	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static int st7571_fb_blit_rect(struct drm_framebuffer *fb,
+			       const struct iosys_map *vmap,
+			       struct drm_rect *rect)
+{
+	struct st7571_device *st7571 = to_st7571(fb->dev);
+
+	char row[256];
+	char *pixel = vmap->vaddr;
+	int x1 = rect->x1 * st7571->bpp;
+	int x2 = rect->x2 * st7571->bpp;
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
+static int st7571_fb_blit_fullscreen(struct drm_framebuffer *fb,
+				     const struct iosys_map *map)
+{
+	struct drm_rect fullscreen = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
+
+	return st7571_fb_blit_rect(fb, map, &fullscreen);
+}
+
+static int st7571_conn_get_modes(struct drm_connector *conn)
+{
+	struct st7571_device *st7571 = to_st7571(conn->dev);
+
+	return drm_connector_helper_get_modes_fixed(conn, &st7571->mode);
+}
+
+static const struct drm_connector_helper_funcs st7571_conn_helper_funcs = {
+	.get_modes = st7571_conn_get_modes,
+};
+
+static const struct drm_connector_funcs st7571_conn_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int st7571_conn_init(struct st7571_device *st7571)
+{
+	drm_connector_helper_add(&st7571->conn, &st7571_conn_helper_funcs);
+	return drm_connector_init(&st7571->dev, &st7571->conn,
+				  &st7571_conn_funcs, DRM_MODE_CONNECTOR_Unknown);
+
+}
+
+
+static void st7571_pipe_enable(struct drm_simple_display_pipe *pipe,
+			       struct drm_crtc_state *crtc_state,
+			       struct drm_plane_state *plane_state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+
+	st7571_fb_blit_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
+}
+
+static void st7571_pipe_update(struct drm_simple_display_pipe *pipe,
+			       struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_rect rect;
+
+	if (state->fb && drm_atomic_helper_damage_merged(old_state, state, &rect))
+		st7571_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
+}
+
+static const struct drm_simple_display_pipe_funcs st7571_pipe_funcs = {
+	.enable	    = st7571_pipe_enable,
+	.update	    = st7571_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+};
+
+static const uint32_t st7571_formats[] = {
+	DRM_FORMAT_C1,
+	DRM_FORMAT_C2,
+};
+
+static const uint64_t st7571_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static int st7571_pipe_init(struct st7571_device *st7571)
+{
+	return drm_simple_display_pipe_init(&st7571->dev,
+					    &st7571->pipe,
+					    &st7571_pipe_funcs,
+					    st7571_formats,
+					    ARRAY_SIZE(st7571_formats),
+					    st7571_modifiers,
+					    &st7571->conn);
+}
+
+static int st7571_set_pixel_format(struct st7571_device *st7571,
+				   u32 pixel_format)
+{
+	u8 cmd_list[] = {
+		ST7571_COMMAND_SET_3,
+		ST7571_SET_COLOR_MODE(ST7571_COLOR_MODE_BLACKWHITE),
+		ST7571_COMMAND_SET_NORMAL,
+	};
+
+	switch (pixel_format) {
+	case DRM_FORMAT_C1:
+		cmd_list[1] = ST7571_SET_COLOR_MODE(ST7571_COLOR_MODE_BLACKWHITE);
+		st7571->bpp = 1;
+		break;
+	case DRM_FORMAT_C2:
+		cmd_list[1] = ST7571_SET_COLOR_MODE(ST7571_COLOR_MODE_GRAY);
+		st7571->bpp = 2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static struct drm_framebuffer*
+st7571_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		 const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	int ret = st7571_set_pixel_format(to_st7571(dev), mode_cmd->pixel_format);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
+}
+
+static const struct drm_mode_config_funcs st7571_mode_config_funcs = {
+	.fb_create = st7571_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
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
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.max_width = 128;
+	dev->mode_config.max_height = 128;
+	dev->mode_config.preferred_depth = 1;
+	dev->mode_config.prefer_shadow = 0;
+	dev->mode_config.funcs = &st7571_mode_config_funcs;
+
+	return 0;
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
+	DRM_FBDEV_DMA_DRIVER_OPS,
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
+
+	of_property_read_u32(np, "sitronix,panel-width-mm", &st7571->width_mm);
+	of_property_read_u32(np, "sitronix,panel-height-mm", &st7571->height_mm);
+	of_property_read_u32(np, "sitronix,panel-start-line", &st7571->startline);
+	of_property_read_u32(np, "sitronix,panel-nlines", &st7571->nlines);
+
+	if (st7571->width_mm == 0 || st7571->height_mm == 0) {
+		dev_err(dev, "Invalid panel dimensions\n");
+		return -EINVAL;
+	}
+
+	/* Default to 128 lines if not specified */
+	if (!st7571->nlines)
+		st7571->nlines = 128;
+
+	if (st7571->startline + st7571->nlines > 128) {
+		dev_err(dev, "Invalid line configuration (start-line=%i, nlines=%i)\n",
+			st7571->startline, st7571->nlines);
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
+static void st7571_create_mode(struct st7571_device *st7571)
+{
+	struct drm_display_mode st7571_mode = {
+		DRM_SIMPLE_MODE(128, st7571->nlines, st7571->width_mm, st7571->height_mm),
+	};
+
+	memcpy(&st7571->mode, &st7571_mode, sizeof(st7571_mode));
+}
+
+static void st7571_reset(struct st7571_device *st7571)
+{
+	gpiod_set_value_cansleep(st7571->reset, 0);
+	mdelay(20);
+	gpiod_set_value_cansleep(st7571->reset, 1);
+}
+
+static int st7571_initialize(struct st7571_device *st7571)
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
+	struct drm_device *dev;
+	struct st7571_device *st7571;
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
+	/* Create mode with parsed values */
+	st7571_create_mode(st7571);
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
+	ret = st7571_initialize(st7571);
+	if (ret)
+		return ret;
+
+	ret = st7571_mode_config_init(st7571);
+	if (ret)
+		return ret;
+
+	ret = st7571_conn_init(st7571);
+	if (ret < 0)
+		return ret;
+
+	ret = st7571_pipe_init(st7571);
+	if (ret < 0)
+		return ret;
+
+	drm_plane_enable_fb_damage_clips(&st7571->pipe.plane);
+	drm_mode_config_reset(dev);
+
+	ret = drm_dev_register(dev, 0);
+	if (ret)
+		return ret;
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
+	{ .compatible = "sitronix,st7571-i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7571_of_match);
+
+
+static const struct i2c_device_id st7571_id[] = {
+	{ "st7571-i2c", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, st7571_id);
+
+static struct i2c_driver st7571_i2c_driver = {
+	.driver = {
+		.name = "st7571-i2c",
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
2.48.1

