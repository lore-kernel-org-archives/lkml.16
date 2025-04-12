Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52B189F39;
	Sat, 12 Apr 2025 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744442462; cv=none; b=sWtK8YVRfSWnDLNS/nEiopBfNrzijcl48Wq3D/MvLIbs7IgdtT1C+J+VdjCyAw5oW3TbgSRF2EUgGvuZBW+6+c6vMg1ws4OWxwgJW1wIJ46OUeH9FouqM8/4Dt9Ezw4b9q20vJh7L8fTYutsTuTIm+2rjPn9jEwnqupoqNgB5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744442462; c=relaxed/simple;
	bh=mSeDTcR+tgk9bBe4Dc4bg1bIP7jRg8EpUTpRuxesnJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oflErX3IXDEV8ucLW2qYACtgXPDP6tHwW5qvRviQBCIuCnQY6Zczh1KC6+8TRd+jvi7ncgZpnW7m1eKQpXJXAEZ4GADFMsLlqg7N8VjjzqRRqcFIkYiu1oQC5iL82JJSj1khABzjKDcD99ONlV3QYpfCfEOpQ/sAijvTsJ+nhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrjHsqPw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrjHsqPw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbb12bea54so531588066b.0;
        Sat, 12 Apr 2025 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744442458; x=1745047258; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FbGi7WMei86EFh6Cqcy/J9CQZJXo3+zhxPZsIHVGgcE=;
        b=JrjHsqPwDihhDhy5KJdsHUWymezxjk3TKyrh3NraqvJv3clyNj0d1DhEWo7ocXJdc0
         9die5PMlR6aPTnnLwLS4W40iDd4RvTZ+uSjCksBj78SQb2j6v/eQX9ahUjpG5WdOkX9O
         x31G1Tq+Nh5XX7A7vjFHNxAROShJDv7BVzmX8JcuXFt/ejn1/wKvkxQgyjLyvse0B7Dx
         tkvvp0yflkOv8/qvBP4bJ6tBmmeXrQt4fSlWXGD6bLa/uSarxNTLJIHZBhm4IIIRW9TY
         1Dr76gBDXJatGROvz4rcyee3OLOorHHOXUfNq636Dp37ILHeEEPkCCLE4DzQ2YQIdfGZ
         a2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744442458; x=1745047258;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbGi7WMei86EFh6Cqcy/J9CQZJXo3+zhxPZsIHVGgcE=;
        b=A4ABOWJz1j8cRxOnIvv765fS4xY3EH8pcczGHbvmz28d41sqONcm4JpOjngaMN0Dko
         Ju1qTCDOzB3438IHSgTETzjm2SJCrKlYAW90hFcCCZJGY23tianEKwXXPTlC8MRHuhrA
         EJ0rMe7xf6M7JxkEqABLRUqV09UHvP7/6yOrEHQ9Q+3altOUOP7pB7h6Me2nGD+1FPz0
         lLvzSksRhyIjDyS33mLKsqoZZ08cxXP6jy6nB022TWDlXNp3lK7RNDGo8WKajvWH5x4t
         VRlS9+DNTwS/xul2g8pX0pI9bS8Oz1ji/36ZOPupfrGV8KrACTcRoZuG6VSm04E9GmDC
         jcow==
X-Forwarded-Encrypted: i=1; AJvYcCU9LNp8NMbp0ZLyVSgTrlj9tYwTFLBT4qwOzlp3vE9Dos271YNSWz+cM9oCTos8RTadlNA1sA6jA48v2hjm@vger.kernel.org, AJvYcCW3kxj2HEEvYTx6NPxvhvUc0HvbkhR+PCZc+iDMyuuvijLO4bPQSee/ncoIbZ5KDayTP2Re/gCF3qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuREgRDSWs7GHyGR0HYQNylc579Fyu/dT4vtHgaXg9gxwj+bd2
	yT/1iFb3wCdWp2TOpUZGiIdyqgQZL0u0dti3yUfPul0r5WHWmGbv
X-Gm-Gg: ASbGncs0jhvx16h1QlH9Ss/Brp94nIBOONeicj5pIoxpvaY4MOa1bvNCYSsoQb43Bt0
	fzgD8eJ1CV1nGWLfEd4gHtDJijv5b12WlpQe2Lx/Ts8N+l8dmkdb8xSPBPqwbPflu1ymLedK2Dv
	RbIt8ukzp2xuAO/9+knsxaGudIzfLY4zPF7zUIESj79u2lobwoejTVJSwEwrDgn+WxQdpqJA7qD
	pCgTCcWvzqJWGV3UT8uJB3BpeGwzZdEQ2IzgXt8mxfzN/J+9MvUJPDnJKgwWj8mJ1RkSw5BCG4+
	3UTGkBtl1l6gsxwcqrxKeluaEk/GreOGrR70D90=
X-Google-Smtp-Source: AGHT+IFldD56k+RFFoK1VQksNeNN4T4b5THixoaExuCFihvc44/LrxGvpmwXj5H4JV1y3fS3FSHk8g==
X-Received: by 2002:a17:906:6a07:b0:ac6:da00:83f4 with SMTP id a640c23a62f3a-acad36c1cbfmr452570966b.53.1744442457976;
        Sat, 12 Apr 2025 00:20:57 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acaa1ce70c1sm559914466b.175.2025.04.12.00.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 00:20:57 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 12 Apr 2025 10:20:44 +0300
Subject: [PATCH v4] hwmon: (max77705) add initial support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEsU+mcC/43OMY7CMBCF4asg1xiNx3aMqLgH2sJxJjASiYMdI
 lYod8dAkdVWKd8U3z9PkSkxZXHYPEWiiTPHvgyz3Yhw8f2ZJDdlCwS0oFBL7nlkf5X5PgwxjbK
 NSXb+4ZwDKzP1OaYsfQPKgQ+KghWFGhK1/PhkTj/fneh2L7VxOV44jzH9fl6Z1Pv6rSLaddVJS
 SWxpspUrsJ9Dcdz5/m6C7ET78CEC6rBrESxoHbfIIILTmP9H9ULamDtp7qgZNvKtCE0APYvOs/
 zC/Rk56yXAQAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744442456; l=11828;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=mSeDTcR+tgk9bBe4Dc4bg1bIP7jRg8EpUTpRuxesnJs=;
 b=NF1AnXsCPgc6wJG4v4MG+yTKU9GmzCC+fl+JHuwBBkDrchK/0lnlwbfbVnqxkGDiCatt1kNWt
 vOM12EoSarxC5oDLAnLQP+3zGhp2mWUtBwee0Khy7LXl9lwDCDFrjaF
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
 Documentation/hwmon/max77705.rst |  39 ++++++++++++++++++++++++++++++++
 MAINTAINERS                      |   7 ++++++
 drivers/hwmon/Kconfig            |   9 ++++++++
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/max77705-hwmon.c   | 242 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 299 insertions(+)

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
index f91f713b0105..7109f252dab4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1308,6 +1308,15 @@ config SENSORS_MAX31790
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
index 000000000000..be0a4bd31d33
--- /dev/null
+++ b/drivers/hwmon/max77705-hwmon.c
@@ -0,0 +1,242 @@
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
+static int max77705_read_and_convert(struct regmap *regmap, u8 reg, u32 res,
+				     u8 is_signed, long *val)
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
+		if (channel >= 2)
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
+		if (channel >= 2)
+			return 0;
+
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
+	u8 reg, is_signed;
+	u32 res;
+
+	switch (type) {
+	case hwmon_curr:
+		is_signed = 1;
+		switch (attr) {
+		case hwmon_curr_input:
+			reg = current_channel_desc[channel].reg;
+			res = current_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, is_signed, val);
+		case hwmon_curr_average:
+			reg = current_channel_desc[channel].avg_reg;
+			res = current_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, is_signed, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	case hwmon_in:
+		is_signed = 0;
+		switch (attr) {
+		case hwmon_in_input:
+			reg = voltage_channel_desc[channel].reg;
+			res = voltage_channel_desc[channel].resolution;
+
+			return max77705_read_and_convert(regmap, reg, res, is_signed, val);
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
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250123-initial-support-for-max77705-sensors-ad0170ac1ec5

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

