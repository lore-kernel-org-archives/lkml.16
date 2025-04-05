Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A8125B2;
	Sat,  5 Apr 2025 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743867025; cv=none; b=AbmV+f5bg4HVhvV/l3b6lQAj8Q8XK89laPQsDgSv/etntYsjBanhr7J7O7qPjpp2QYaNOEoVEJmbFSR0oc9SpsK8aGlEK8g5Lb+XBEauejaZNP8qI7DJYHYhjV2sBeLYRMpXzh+SATTxi1O8wLBj+MVkNYaTSmoFxzimHKFyZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743867025; c=relaxed/simple;
	bh=aRlJLTmUp5tdCiD00zDR1GGKCG6fLcuztrMn0cT7beQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kyrfWloSu5cxQ2HGzIOOw8YbP888rGVOy2PoczFh4Hnl0jrJrFiB2nyuuJjc2RXmRWmZrcQUdmpR4Ag5oya1o6xoKY8Y1BsFPZsLsu65zGndiFW9SveAkLx9UoY4Acnns7wD4UinOIGCkopSAI8m2kbgmPqAxC0zJ7vN1YLIYqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ3ffC3e; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ3ffC3e"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so4871744a12.0;
        Sat, 05 Apr 2025 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743867021; x=1744471821; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HfodeP++aE3SzPS91QS6yvzYgKSgtGmMzZNiqM32dis=;
        b=nJ3ffC3el5Y/HXptZdUm+BJPbT1afonCGxxhQZ1lpKGjH1daVFadWzDVXh3eiZluUm
         NlbLQdusezGylFu8elMawlWR9JZWVAhE0r0J8/0UDM2PfhnxuAWtDLcDS1ObfGoxrrCB
         VcXX7eb8QWC6rN/yPmECF3QD1Hq6fcHitGLqLiWedUMcOLZaJmUUjjcx4vxddDQyLr1t
         SlYwuH0/O+4BsyJ7QyUmof9njwtNJAiNYNSXqf9mP/wplq1d+91LmibpjVe7YICAymPP
         qzv6SNRG9iSOPcotf+g87FJ4EK/bl6wPenpyaeQCPhGIMfWDfTWQiXQMxTI8xYU3EjVq
         GRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743867021; x=1744471821;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfodeP++aE3SzPS91QS6yvzYgKSgtGmMzZNiqM32dis=;
        b=omwKHbHLe97/lnNZIQ4pHYrnj7r1bhT9s2oUoTHAbc56PlXPYQCMxmXPaZV/Z/izW4
         e71uXcWXIzZhF41XVvITM4uAod7AlqGuQduVE3gg31YLw3YB3Lo0mWUuH0xG/gzJCCXd
         7u4jbuoQxc978WmYBXNKGw/E0LKsipPZxzifa3WEqbZ+I40n0zRBEwmVSh3QYBSu/LMe
         M7NU3XBuV8j1qyRuz2BF3C+Ea8UA9ncIltqizt8hFBN1v/gtdMzVHiQZYXDqDXhO7q8h
         o2o5NlLSybYiOzjsEFEAxIX2fYQRXEKnTijPX1QbKyMQMgmq2QFiD0OCLXH51BHEpfbi
         KlKw==
X-Forwarded-Encrypted: i=1; AJvYcCVnTmhIKNUYKrh37dnHBqgu+ZQrqx1eMAMLC58QvXbXz/l3Uuoso63LalhPVJTwQMszM7k+Kj21lP75olMg@vger.kernel.org, AJvYcCXSoSXP2+kjW4kwM9Rfb3BzC2QTyV20kp9uaUpmwWM5yHc+pYMtBvlA9+NsUgyKZ9tGavJC+QSHzl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6EtsGqT52KDqwg1wcpSNepYs+V9WPE+HxpFkbGnskFQIU922
	lFSWrXvUu5CP6fnsmvzUEV7YkYMITjfahvUpPHkjEJ5fyJcDrp1g
X-Gm-Gg: ASbGncudStO2gsPNGmUMElX/UougbswXdjC41HwswldqEGr05aRNwaA+5AyRJI+XaYm
	WKxHoc0dHpzY4P1tfaIGphQ6VoAFJmFEobeuifN3ddFzfsAMLKkNCUmaBfz/CYQmCvLbqPKgvQQ
	rFLq8P55qjRZ3pMRaVFMVG2XdqN5Jyl+Pegy7rJltJdCK8EuaI2qa586j73B30jQZ9S3sYjHTBB
	2xJ6goRMNZrsZDfLfqlfME+vdZMw5O2PzGV5ioE/Pmt4QmRPPIxDze5T3OyyrPQzZTkQu7AWBdT
	SlXua8FAA94t/paPLXWV95rkzL62OnbrGLXXrkGsoeU=
X-Google-Smtp-Source: AGHT+IHCy0YaXIz4pyE5ZeQXuXSrsO2xl+TNIcOQoSHK5r4AWg9QYjvgRYPN9l6wae994bkfWMbE8g==
X-Received: by 2002:a17:907:1b08:b0:abf:a387:7e35 with SMTP id a640c23a62f3a-ac7d19f4f50mr728436966b.53.1743867020897;
        Sat, 05 Apr 2025 08:30:20 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7bfea13dcsm443543766b.66.2025.04.05.08.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 08:30:20 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 05 Apr 2025 18:30:08 +0300
Subject: [PATCH v3] hwmon: (max77705) add initial support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH9M8WcC/42OQQ6CMBBFr0K6dkw7UEpceQ/jopRRJxGKLRIN4
 e4WXODS5fuL9/4kIgWmKA7ZJAKNHNl3CfJdJtzNdlcCbhILlKilwhy444HtHeKz730Y4OIDtPZ
 ljJEaInXRhwi2kcpI6xQ5LZKqD3Th15o5nb8c6PFMtWEbbxwHH97rlVEt67eKqP+rjgoUYE1lU
 ZoSq1oer63l+975ViyBETdpLos/pZikumoQpXEmx/pXOs/zB33yYSRCAQAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743867019; l=11530;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=aRlJLTmUp5tdCiD00zDR1GGKCG6fLcuztrMn0cT7beQ=;
 b=/Y0NbHwqseKCrn/No1vmaHxnlcfd0/Dg0/Th8zZQEv8fjzjHoBjygwDkEu0AwzR12+q48fvAP
 L5s/u/imtw9BJ72qfei2PP4/HPWb46nnwUc3d7FRyi1jBtRS4+IhD4y
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
Changes in v3:
- Fix review comments.
- Fix v2 changed message.
- Link to v2: https://lore.kernel.org/r/20250304-initial-support-for-max77705-sensors-v2-1-58d2207c732b@gmail.com

Changes in v2:
- Fix review comments.
- Link to v1: https://lore.kernel.org/r/20250225-initial-support-for-max77705-sensors-v1-1-2be6467628b0@gmail.com
---
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
 Documentation/hwmon/max77705.rst |  39 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   7 ++++++
 drivers/hwmon/Kconfig            |  10 ++++++++
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/max77705-hwmon.c   | 246 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 304 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f0ddf6222c44..764c1c91ed70 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -161,6 +161,7 @@ Hardware Monitoring Kernel Drivers
    max6639
    max6650
    max6697
+   max77705
    max8688
    mc13783-adc
    mc34vr500
diff --git a/Documentation/hwmon/max77705.rst b/Documentation/hwmon/max77705.rst
new file mode 100644
index 000000000000..9037226c50b9
--- /dev/null
+++ b/Documentation/hwmon/max77705.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver max77705
+====================
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
index 78467ad7a8fe..2e1e5233a011 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18369,6 +18369,13 @@ S:	Maintained
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
index f91f713b0105..37f3bee91e3f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1308,6 +1308,16 @@ config SENSORS_MAX31790
 	  This driver can also be built as a module. If so, the module
 	  will be called max31790.
 
+config SENSORS_MAX77705
+	tristate "MAX77705 current and voltage sensor"
+	depends on I2C
+	select REGMAP_I2C
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
index 766c652ef22b..22ceebf10299 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
 obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
 obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
 obj-$(CONFIG_MAX31827) += max31827.o
+obj-$(CONFIG_SENSORS_MAX77705) += max77705-hwmon.o
 obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
 obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
 obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
diff --git a/drivers/hwmon/max77705-hwmon.c b/drivers/hwmon/max77705-hwmon.c
new file mode 100644
index 000000000000..47fe1cf53041
--- /dev/null
+++ b/drivers/hwmon/max77705-hwmon.c
@@ -0,0 +1,246 @@
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
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mfd/max77705-private.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
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
+static const struct regmap_range max77705_hwmon_readable_ranges[] = {
+	regmap_reg_range(AVGISYS_REG,	AVGISYS_REG + 1),
+	regmap_reg_range(IIN_REG,	IIN_REG + 1),
+	regmap_reg_range(ISYS_REG,	ISYS_REG + 1),
+	regmap_reg_range(VBYP_REG,	VBYP_REG + 1),
+	regmap_reg_range(VSYS_REG,	VSYS_REG + 1),
+};
+
+static const struct regmap_access_table max77705_hwmon_readable_table = {
+	.yes_ranges = max77705_hwmon_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77705_hwmon_readable_ranges),
+};
+
+static const struct regmap_config max77705_hwmon_regmap_config = {
+	.name = "max77705_hwmon",
+	.reg_bits = 8,
+	.val_bits = 16,
+	.rd_table = &max77705_hwmon_readable_table,
+	.max_register = MAX77705_FG_END,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE
+};
+
+static int max77705_read_and_convert(struct regmap *regmap, u8 reg, u32 res, long *val)
+{
+	int ret;
+	u32 regval;
+
+	ret = regmap_read(regmap, reg, &regval);
+	if (ret < 0)
+		return ret;
+	*val = mult_frac((long)regval, res, 1000000);
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
+		if (channel >= ARRAY_SIZE(voltage_channel_desc))
+			return 0;
+
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_curr:
+		if (channel >= ARRAY_SIZE(current_channel_desc))
+			return 0;
+
+		switch (attr) {
+		case hwmon_curr_input:
+		case hwmon_in_label:
+			return 0444;
+		case hwmon_curr_average:
+			if (current_channel_desc[channel].avg_reg)
+				return 0444;
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
+			return max77705_read_and_convert(regmap, reg, res, val);
+		case hwmon_curr_average:
+			reg = current_channel_desc[channel].avg_reg;
+			res = current_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, val);
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
+			return max77705_read_and_convert(regmap, reg, res, val);
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
+

---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250123-initial-support-for-max77705-sensors-ad0170ac1ec5

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

