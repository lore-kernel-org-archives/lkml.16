Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDEE1FDD;
	Wed, 23 Apr 2025 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745384089; cv=none; b=t9FebEgBHKCeg6M1iURMp4+OfIZErNU8aS7LCeukwNlxypdcKlbG/OjOLz0xHHBWbnDsquB4+fZ6ZrM4erj9dwSHEmRkCdQtAuLVK/xWrlMRILryzy+LnArW+cTbwQ6GN1cksePfy5Pt9566W4J0IbEPD4hVd2+qnMhJasaaQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745384089; c=relaxed/simple;
	bh=FlUNC1S3R4ZCxuwrDP3JlFcsRn2suUvfLx56Qi/sy0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qrr6gOYqwuECso7l0TbnjMztjAouy4eHhAoTzYbYNl9q6sBWciEVV9+tCTvBTJ/p3tzRPwpKt1f5vSLgw660Z8fYWNnio5C8zBi5zY4gRy6j+OyidxpVt8jzMxjx+dnPad4fqxcPCkiVy3sU9AFqwPL2thbUSVsUFjaRZdbg32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EclOmB6a; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EclOmB6a"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acbb85ce788so433255066b.3;
        Tue, 22 Apr 2025 21:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745384086; x=1745988886; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXQm53wssfsR4khuJkdMWGbGQvYys2yw8n2LLmP1Oz8=;
        b=EclOmB6aUM2s9DMJHqGz/i0Lajuj9v7mgtIdzEeP9ZJPhr8hG3Xqe75g3/hNHZPEoU
         1qLnyTkB7UhIyxSD+7X8yTV1VDy1c5EzB+TuEruFSYvwpnUV3ncgvn1VHW4/KySGIumY
         9anpFJVqd8GNGFizFjm7Eabs58y+PyLBBKuwBZz9zXhaKqB66/WlFYDSxcLWV0SNR+eJ
         EIq8GHL55oKCga0I85OcBS6+uqsiZqKYs/QLZnpYfdM7p6abuAtLGfAj6o/L7WF34hup
         sIwoOnEzeBhDjYCoqybOXQCFYVoQ0f5/s1IbrN9/XXcYR8Crla7J2obrYCxNua/5m5OT
         uX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745384086; x=1745988886;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXQm53wssfsR4khuJkdMWGbGQvYys2yw8n2LLmP1Oz8=;
        b=bHBi76Zj0dX5yhZG71O04eCZhibVW6O31HUNR0teopbxhem8WHxlvEKaCFGJwbTkND
         kjvKRkRZC/mHXgErTH6NdtVEKWUsj7SYdLwcxm2Tm1/6ptvNCe9c7faHtJGGWj175kPT
         RXGA+NSExVR3xIuTi8uxhNUD0n1LWtugDUy0+TlN1BHHPx5t4pke+6WdH7J2fLQjYLzU
         +Xydhxzj3a5cT59iMoE/DE0mvc0Ku1BIX6ljqOEMSjF3foTfReu8yDC1NaIsugPziVhn
         HmQLjf3YLhywmKPW+rlChJaQx5gmc+AJZkCSwcfllGmYcmaggk2BursWezO4LrNZ50bu
         ytNw==
X-Forwarded-Encrypted: i=1; AJvYcCV9bG8DZbcMdTsCwXYUUJ85An473zA9Hm48nPpGsJWwauqNYyy7BJ0f7CPzOCECb+izt/LsjH4JaVU=@vger.kernel.org, AJvYcCVGjWGo+4OQkJ81asUKCPgrfzJkmKA0QCajfF4g80azF/KMr7WO4l6iOkTm7wS8FLuHVGH9yAAKzkFPDQ2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOLWYahTIhqHQYOBIWYdYY2zX/j78BEmhGdGB5qQx3Og24IxJ
	IYXD2bAS5NyWWLie5xUbZNJxRQfcSrbXWnMefTkbHSQrchOCyHpw6dWy6g==
X-Gm-Gg: ASbGnctDlb9iBV+T7NtA94xl4GuG9WmMG5Oi+DGv0ujvHUA73VRyMh9tIPPWeyP0rER
	jvVGNih//oBwh0JLHn7qB0Zn84vGXAYAx1N1Sr+knnDPH0YNPU1vLoIGR34P1RUsjVOIZjHLfQ/
	qgDf+06RpgvZjDMGsFZxwRLJtKrZ7Wlva1ud70lW8AxqwtrUS4123iA5Q7hl1hxdDo6nKmbSqea
	CN7OrltzXitjauCfc4jR3ShU8+7lQodk9CaBQGEGE95gk4qJDeIDx9JwrWiQqHj1m6DdhaBppnK
	c4zgy1+xrge8R/0hI5v+UFWIS0zS+UBPA11hdV0=
X-Google-Smtp-Source: AGHT+IG20OTjEUbbePlbwZYHrhhEFmZ0WtTV2WQeS9gkkVhpedaqSavtc1ZZSofbEK0OjYGBt4sUgw==
X-Received: by 2002:a17:906:ef95:b0:acb:b08c:76ae with SMTP id a640c23a62f3a-acbb08c7980mr669036566b.16.1745384085695;
        Tue, 22 Apr 2025 21:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6eefd952sm751321866b.113.2025.04.22.21.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 21:54:45 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 23 Apr 2025 07:54:36 +0300
Subject: [PATCH v6] hwmon: (max77705) add initial support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-initial-support-for-max77705-sensors-v6-1-ff379e1b06c5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAItyCGgC/43PTW6DMBAF4KtEXtfVePxHuuo9qi6MGRJLAVObo
 FQRd69JFqB0w/KNNN+bubNMKVBmH4c7SzSFHGJfgnk7MH92/Yl4aEpmCKhBoOShD2NwF56vwxD
 TyNuYeOdu1lrQPFOfY8rcNSAsOC/Ia1aoIVEbbo+ar+9nTvRzLW3jOjyHPMb0+zhlEsv02Yqo9
 7VOgguONRllrMGqhs9T58Ll3ceOLQUTrqgEtRPFguqqQQTrrcT6FZUrqmDvpbKgpFujWu8bAP2
 Kqg0qcCeqlvdJ+RZN5WTz7329RY87UV1QVRbcsVZV7cQWnef5D0DS3Y5BAgAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745384083; l=11923;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=FlUNC1S3R4ZCxuwrDP3JlFcsRn2suUvfLx56Qi/sy0c=;
 b=Cz6JfYPKJ84cptSM7+0Q7qF2Rnv5V1sx7Hd+Vk60O/4RpVyL6L8n2+09tqhnxXYaSU7f6tTRX
 r+0VdxjFV9NAb0f/xEfbRXgKFZCoI+E1zKdJApxdHNIpWDnYOGdEAhT
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for max77705 hwmon. Includes charger input, system bus, and
vbyp measurements.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Maxim MAX77705 is a Companion Power Management and Type-C interface IC.
It includes charger and fuel gauge blocks, and is capable of measuring
charger input current, system bus volatage and current, and bypass
voltage.

Add support for mentioned measurements.
---
Changes in v6:
- fix compile warning
- run build with W=1, assert there's no warnings on max77705-hwmon
- rebase on latest linux-next/master
- Link to v5: https://lore.kernel.org/r/20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com

Changes in v5:
- fix compile warning
- review fixes
- Link to v4: https://lore.kernel.org/r/20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com

Changes in v4:
- Fix review comments.
- Link to v3: https://lore.kernel.org/r/20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com

Changes in v3:
- Fix review comments.
- Fix v2 changed message.
- Link to v2: https://lore.kernel.org/r/20250304-initial-support-for-max77705-sensors-v2-1-58d2207c732b@gmail.com

Changes in v2:
- Fix review comments.
- Link to v1: https://lore.kernel.org/r/20250225-initial-support-for-max77705-sensors-v1-1-2be6467628b0@gmail.com
---
Changes in v6:
- remove max77705_hwmon_readable_ranges because unused

Changes in v5:
- remove now unneeded max77705_hwmon_readable_table
- remove channel num check in max77705_is_visible, since there's only 2
  channels
- make is_signed bool
- remove is_signed: pass is_signed as true/false

Changes in v4:
- documentation: "===" line is as long as the text
- simplify the dependency to depends on MFD_MAX77705
- cleanup headers
- sign_extend current measurements - add 'is_signed' parameter to
  max77705_read_and_convert function
- replace ARRAY_SIZE(voltage_channel_desc) to 2
- remove last blank line

Changes in v3:
- change resolution type to u32
- pass regmap from parent
- rebase on latest linux-next, containg max77705 driver

Changes in v2:
- sort headers alphabetically
- swap curr channel info, to align indeces with channel_desc struct
- reword coverletter
- fix checkpatch --strict warnings
- remove struct max77705_hwmon, use regmap directly
- move register validation logic to is_visible function
- move common register reading and converting logic to separate function
- remove unnessesary {} in if statement
- s/i2c->dev/pdev->dev in dev_err_probe
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/max77705.rst |  39 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                      |   7 +++++++
 drivers/hwmon/Kconfig            |   9 ++++++++
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/max77705-hwmon.c   | 221 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 278 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index da5895115724..20028dd5c1eb 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -162,6 +162,7 @@ Hardware Monitoring Kernel Drivers
    max6639
    max6650
    max6697
+   max77705
    max8688
    mc13783-adc
    mc34vr500
diff --git a/Documentation/hwmon/max77705.rst b/Documentation/hwmon/max77705.rst
new file mode 100644
index 000000000000..4a7680a340e1
--- /dev/null
+++ b/Documentation/hwmon/max77705.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver max77705
+======================
+
+Supported chips:
+
+  * Maxim Integrated MAX77705
+
+    Prefix: 'max77705'
+
+    Addresses scanned: none
+
+    Datasheet: Not available
+
+Authors:
+      - Dzmitry Sankouski <dsankouski@gmail.com>
+
+Description
+-----------
+
+The MAX77705 PMIC provides current and voltage measurements besides fuelgauge:
+- chip input current
+- system bus current and voltage
+- VBYP voltage
+
+Sysfs Attributes
+----------------
+
+================= ========================================
+in1_label         "vbyp"
+in1_input         Measured chip vbyp voltage
+in2_label         "vsys"
+in2_input         Measured chip system bus voltage
+curr1_label       "iin"
+curr1_input       Measured chip input current.
+curr2_label       "isys"
+curr2_input       Measured chip system bus current.
+================= ========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 903a8b9a6d79..a058e71f7c40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18519,6 +18519,13 @@ S:	Maintained
 F:	Documentation/hwmon/pc87427.rst
 F:	drivers/hwmon/pc87427.c
 
+MAX77705 HARDWARE MONITORING DRIVER
+M:	Dzmitry Sankouski <dsankouski@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/max77705.rst
+F:	drivers/hwmon/max77705-hwmon.c
+
 PCA9532 LED DRIVER
 M:	Riku Voipio <riku.voipio@iki.fi>
 S:	Maintained
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 832d7e5f9f7b..80e277448c71 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1318,6 +1318,15 @@ config SENSORS_MAX31790
 	  This driver can also be built as a module. If so, the module
 	  will be called max31790.
 
+config SENSORS_MAX77705
+	tristate "MAX77705 current and voltage sensor"
+	depends on MFD_MAX77705
+	help
+	  If you say yes here you get support for MAX77705 sensors connected with I2C.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called max77705-hwmon.
+
 config SENSORS_MC34VR500
 	tristate "NXP MC34VR500 hardware monitoring driver"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index af18deb0422e..50df221f67c2 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
 obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
 obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
 obj-$(CONFIG_MAX31827) += max31827.o
+obj-$(CONFIG_SENSORS_MAX77705) += max77705-hwmon.o
 obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
 obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
 obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
diff --git a/drivers/hwmon/max77705-hwmon.c b/drivers/hwmon/max77705-hwmon.c
new file mode 100644
index 000000000000..990023e6474e
--- /dev/null
+++ b/drivers/hwmon/max77705-hwmon.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MAX77705 voltage and current hwmon driver.
+ *
+ *  Copyright (C) 2025 Dzmitry Sankouski <dsankouski@gmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/mfd/max77705-private.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct channel_desc {
+	u8 reg;
+	u8 avg_reg;
+	const char *const label;
+	// register resolution. nano Volts for voltage, nano Amperes for current
+	u32 resolution;
+};
+
+static const struct channel_desc current_channel_desc[] = {
+	{
+		.reg = IIN_REG,
+		.label = "IIN_REG",
+		.resolution = 125000
+	},
+	{
+		.reg = ISYS_REG,
+		.avg_reg = AVGISYS_REG,
+		.label = "ISYS_REG",
+		.resolution = 312500
+	}
+};
+
+static const struct channel_desc voltage_channel_desc[] = {
+	{
+		.reg = VBYP_REG,
+		.label = "VBYP_REG",
+		.resolution = 427246
+	},
+	{
+		.reg = VSYS_REG,
+		.label = "VSYS_REG",
+		.resolution = 156250
+	}
+};
+
+static int max77705_read_and_convert(struct regmap *regmap, u8 reg, u32 res,
+				     bool is_signed, long *val)
+{
+	int ret;
+	u32 regval;
+
+	ret = regmap_read(regmap, reg, &regval);
+	if (ret < 0)
+		return ret;
+
+	if (is_signed)
+		*val = mult_frac((long)sign_extend32(regval, 15), res, 1000000);
+	else
+		*val = mult_frac((long)regval, res, 1000000);
+
+	return 0;
+}
+
+static umode_t max77705_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+		case hwmon_in_label:
+			return 0444;
+		case hwmon_curr_average:
+			if (current_channel_desc[channel].avg_reg)
+				return 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int max77705_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+				int channel, const char **buf)
+{
+	switch (type) {
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_in_label:
+			*buf = current_channel_desc[channel].label;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*buf = voltage_channel_desc[channel].label;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int max77705_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u8 reg;
+	u32 res;
+
+	switch (type) {
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			reg = current_channel_desc[channel].reg;
+			res = current_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, true, val);
+		case hwmon_curr_average:
+			reg = current_channel_desc[channel].avg_reg;
+			res = current_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, true, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			reg = voltage_channel_desc[channel].reg;
+			res = voltage_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, false, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops max77705_hwmon_ops = {
+	.is_visible = max77705_is_visible,
+	.read = max77705_read,
+	.read_string = max77705_read_string,
+};
+
+static const struct hwmon_channel_info *max77705_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL
+			),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_AVERAGE | HWMON_C_LABEL
+			),
+	NULL
+};
+
+static const struct hwmon_chip_info max77705_chip_info = {
+	.ops = &max77705_hwmon_ops,
+	.info = max77705_info,
+};
+
+static int max77705_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "max77705", regmap,
+							 &max77705_chip_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
+				"Unable to register hwmon device\n");
+
+	return 0;
+};
+
+static struct platform_driver max77705_hwmon_driver = {
+	.driver = {
+		.name = "max77705-hwmon",
+	},
+	.probe = max77705_hwmon_probe,
+};
+
+module_platform_driver(max77705_hwmon_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_DESCRIPTION("MAX77705 monitor driver");
+MODULE_LICENSE("GPL");

---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250123-initial-support-for-max77705-sensors-ad0170ac1ec5

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

