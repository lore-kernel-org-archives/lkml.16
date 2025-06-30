Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E9D23BCF2;
	Mon, 30 Jun 2025 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282495; cv=none; b=rJjKVROo3BGJZ3KiZ8tv6WqBJrAGO0Ufsz+3DssT0e4vRnqfgXZ74vtNn3EvZMYQKbtcapmSfpSINcmjeGtoi8k2Dr/GZlINU7dh8yp1TVTleZu5R2BvHzey7UO8Y+cNygrw8l4uz8Bs31H/A40lMRRHrFzlM8nTsUPp77G3nRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282495; c=relaxed/simple;
	bh=70JYZSn9O67rilspuqI5DcMZWYRNGuJCQk+R9y0Nmb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8jqY0FeBxne7GWk8mS5VQMiCJilDV3LdK+QhVDhAmsgjmN4DqewQvQXx+PtfDGlAFZRDb6+Ao/vaaGHz0RQim2gKzrW5s8H+UVrlWBsbiOVbxhzt75Ra6knsvih+fn0xoZ9umUQQvV1olTAbtntMYWtOuIktNUb79hqefx60gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edsbGENl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edsbGENl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7426c44e014so4486798b3a.3;
        Mon, 30 Jun 2025 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751282493; x=1751887293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeoROtSfJkK8b4LRPnYj+jOGBDZuvGw4BS1v/80Yysg=;
        b=edsbGENl9EEcnS99QIzgqrQYuerPmoUiJGweWC3a5esx3BzrFFXbNyRUWrOmnXllsT
         C+7yc4u3kBA7rgPYdpyEuWm6kot5z3LT62Mt2QcCaDn1r4UmqD5cicARxv16r/PE0DVt
         y1g5nE8+x0Y3Nom6QlQa8rXlYbbcqjYc3DFApW6DbvoH0M/cWh+2U/nsrzowb4oHZ92D
         G0trYdJc0hPSwUqJ/U1JlWZ0n+nYmxNS/6exN4gigTyRFUzUNw9xdD5+Flg8+THVOYOP
         Bc8Tp7mPOZ6gGEcwPvXRYIg6UKhr0tFX4K52r4FyEIfd4ozyi1UNjGgN0J4Eifz/wpL1
         7i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282493; x=1751887293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeoROtSfJkK8b4LRPnYj+jOGBDZuvGw4BS1v/80Yysg=;
        b=ioixFdHuYQOKDjls1yGbM4W1V9VfKRdluyozGU2hqUDAUHpelp8Xc1g1JqU8p70K4c
         dKjuEXV0y1GF5L39mXxvprofgtIPKNMqW10y3lO4NoNjQNwXfugXaQXHVkKKFWvp219n
         hi3DGARjJVSN7T0vHk7K8ClnHaMSvGdYCHm57vZBqMnUdVaAZ4uAvCLMIDKOVZe548vC
         6W6wdOjPycXOg1fX4NTidC24ie0iIhHzXjh+Z3alkSMnbScEP6i/KzqCv+dwdYpKLldy
         bjFwGyL4J7//hZ0IMP3ZN5aQL4vIOmwEHYb2No88GkYNzfTONuTEiN164TQK6nFA4V7F
         gxMA==
X-Forwarded-Encrypted: i=1; AJvYcCUAcmuPmbeGZrYl6RFAeBBxxSpih1aCl5zz1hyc2+Tp6+qds4iIqyywvkpthH15imz5q84ZaZE0pxPWQSol@vger.kernel.org, AJvYcCUUCsZNdJaT8GrC9EYCtVuOwr1RfJKDSlpjWm9c0t6/2uLCI8SRKIfHezIaY9W1lb0g5rfC1q45xQA1@vger.kernel.org, AJvYcCVmne/px/MOlaTBOFehFTfK3Bphq8CYP5MbyZmZhqmL9g7dCpYYJaSvnMTcKcd1Qsch7lSMVe49PRKb1Kw=@vger.kernel.org, AJvYcCX3gP/zB6jnNS6iUgstFHEOb0J03/pKwkhUOaYencv1lPUsL7xFNYbABAMwWb+plJTFcPBFGC8OzS9t@vger.kernel.org
X-Gm-Message-State: AOJu0YysALIOwG7l6+OvCtbqounx27iGM8g73Jte5l0Z9d8tTt6OoZlA
	YSkQZqHwMdhyUfSAB22ERRqXltT6gZRKqg6eZEkRC89/7kR7I5bZpXqA
X-Gm-Gg: ASbGncvxF9UxzmTSm25MyWARr7u7xUWyJMvSEtfK+UVRt3kornstEV9ZJSwwirqdpFN
	VcYKMzO0qiBF/oATyic6kI5XtgWKZpZOtKmUaRkgK0MR1Lj3aSjd5OqSvRHtB38XUaP2WOO02jx
	DGEtO4KL7ZWvvckgvCAAixBmhnBPmVTbVrbgOrEAg0DN1uFfockFCVglSjblwmUwHNDjtjHwLbj
	WC/NiDMmua+R/GEMp/XUysdkTY57VM8rzpwK6Hm300ooSaHuUY6wgSqbaXvgBmE9RCgiGCVzV5V
	0KyZSif98c96oCVzt94n8R+0gw/XjiE0f5hKMiQKGeLBy+xXxXeeiziYnAEBBxKdQtKTzPYOrRc
	2fj7GQHcYAJRUAc590WH4
X-Google-Smtp-Source: AGHT+IGKN0CyI3OIOs2vT0SPFHP1/Q1qkjarft8qiZhROX44mOzO7H9AkMbWKPyuKbIWBcSOE0h8DQ==
X-Received: by 2002:a05:6300:6b0d:b0:222:2a34:624b with SMTP id adf61e73a8af0-2222a346af3mr458275637.15.1751282492975;
        Mon, 30 Jun 2025 04:21:32 -0700 (PDT)
Received: from localhost (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54098a3sm8978611b3a.16.2025.06.30.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:21:32 -0700 (PDT)
From: tzuhao.wtmh@gmail.com
X-Google-Original-From: Henry_Wu@quantatw.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 1/2] hwmon: (pmbus) Add support for MPS multi-phase mp2869a/mp29612a controllers
Date: Mon, 30 Jun 2025 19:20:50 +0800
Message-ID: <20250630112120.588246-2-Henry_Wu@quantatw.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630112120.588246-1-Henry_Wu@quantatw.com>
References: <20250630112120.588246-1-Henry_Wu@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Henry Wu <Henry_Wu@quantatw.com>

Add support for the mp2869a and mp29612a controllers from Monolithic Power
Systems, Inc. (MPS). These are dual-loop, digital, multi-phase modulation
controllers.

Signed-off-by: Henry Wu <Henry_Wu@quantatw.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/mp2869a.rst |  86 +++++++++
 drivers/hwmon/pmbus/Kconfig     |  10 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/mp2869a.c   | 299 ++++++++++++++++++++++++++++++++
 5 files changed, 397 insertions(+)
 create mode 100644 Documentation/hwmon/mp2869a.rst
 create mode 100644 drivers/hwmon/pmbus/mp2869a.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b45bfb4ebf30..10bf4bd77f7b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -172,6 +172,7 @@ Hardware Monitoring Kernel Drivers
    menf21bmc
    mlxreg-fan
    mp2856
+   mp2869a
    mp2888
    mp2891
    mp2975
diff --git a/Documentation/hwmon/mp2869a.rst b/Documentation/hwmon/mp2869a.rst
new file mode 100644
index 000000000000..a98ccb3d630d
--- /dev/null
+++ b/Documentation/hwmon/mp2869a.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2896a
+=====================
+
+Supported chips:
+
+  * MPS MP2896A
+
+    Prefix: 'mp2896a'
+
+  * MPS MP29612A
+
+    Prefix: 'mp29612a'
+
+Author:
+
+    Henry Wu <Henry_WU@quantatw.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP2896A, a digital, multi-phase voltage regulator controller with PMBus interface.
+
+This device:
+
+- Supports up to two power rails.
+- Supports multiple PMBus pages for telemetry and configuration.
+- Supports VOUT readout in **VID format only** (no support for direct format).
+- Supports AMD SVI3 VID protocol with 5-mV/LSB resolution (if applicable).
+- Uses vendor-specific registers for VOUT scaling and phase configuration.
+
+Device supports:
+
+- SVID interface.
+- AVSBus interface.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Sysfs Interface
+---------------
+
+The driver provides the following sysfs attributes:
+
+**Current measurements:**
+
+- Index 1: "iin"
+- Indexes 2, 3: "iout"
+
+**curr[1-3]_alarm**
+**curr[1-3]_input**
+**curr[1-3]_label**
+
+**Voltage measurements:**
+
+- Index 1: "vin"
+- Indexes 2, 3: "vout"
+
+**in[1-3]_crit**
+**in[1-3]_crit_alarm**
+**in[1-3]_input**
+**in[1-3]_label**
+**in[1-3]_lcrit**
+**in[1-3]_lcrit_alarm**
+
+**Power measurements:**
+
+- Index 1: "pin"
+- Indexes 2, 3: "pout"
+
+**power[1-3]_alarm**
+**power[1-3]_input**
+**power[1-3]_label**
+
+**Temperature measurements:**
+
+**temp[1-2]_crit**
+**temp[1-2]_crit_alarm**
+**temp[1-2]_input**
+**temp[1-2]_max**
+**temp[1-2]_max_alarm**
+
+
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 441f984a859d..93b558761cc6 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -364,6 +364,16 @@ config SENSORS_MP2856
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2856.
 
+config SENSORS_MP2869A
+	tristate "MP2869A PMBus sensor"
+	depends on I2C && PMBUS
+	help
+	  If you say yes here you get support for the MPS MP2869A MP29612A
+	  voltage regulator via the PMBus interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called mp2869a.
+
 config SENSORS_MP2888
 	tristate "MPS MP2888"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 29cd8a3317d2..42087d0dedbc 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
+obj-$(CONFIG_SENSORS_MP2869A)   += mp2869a.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
diff --git a/drivers/hwmon/pmbus/mp2869a.c b/drivers/hwmon/pmbus/mp2869a.c
new file mode 100644
index 000000000000..e61f1380dbc1
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2869a.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MP2856A/MP29612A
+ * Monolithic Power Systems VR Controller
+ *
+ * Copyright (C) 2023 Quanta Computer lnc.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+/* Vendor specific registers. */
+#define MP2869A_VOUT_MODE			 0x20
+#define MP2869A_VOUT_MODE_MASK		 GENMASK(7, 5)
+#define MP2869A_VOUT_MODE_VID		 (0 << 5)
+
+#define MP2869A_READ_VOUT			 0x8b
+
+#define MP2869A_MFR_VOUT_SCALE_LOOP	 0x29
+#define MP2869A_VID_RES_MASK		 GENMASK(12, 10)
+#define MP2869A_VOUT_SCALE_MASK		 GENMASK(7, 0)
+
+#define MP2869A_MAX_PHASE_RAIL1		 16
+#define MP2869A_MAX_PHASE_RAIL2		 8
+#define MP29612A_MAX_PHASE_RAIL1	 12
+#define MP29612A_MAX_PHASE_RAIL2	 6
+
+#define MP2869A_PAGE_NUM			 2
+#define MP29612A_PAGE_NUM			 2
+
+#define MP2869A_GAIN_BASE			 32000
+
+enum chips { mp2869a = 1, mp29612a };
+
+static const int mp2869a_max_phases[][MP2869A_PAGE_NUM] = {
+	[mp2869a] = { MP2869A_MAX_PHASE_RAIL1, MP2869A_MAX_PHASE_RAIL2 },
+	[mp29612a] = { MP29612A_MAX_PHASE_RAIL1, MP29612A_MAX_PHASE_RAIL2},
+};
+
+static const struct i2c_device_id mp2869a_id[] = {
+	{ "mp2869a", mp2869a },
+	{ "mp29612a", mp29612a },
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, mp2869a_id);
+
+struct mp2869a_data {
+	struct pmbus_driver_info info;
+	int vout_format[MP2869A_PAGE_NUM];
+	int curr_sense_gain[MP2869A_PAGE_NUM];
+	const int *max_phases;
+	enum chips chip_id;
+};
+
+#define to_mp2869a_data(x)	container_of(x, struct mp2869a_data, info)
+
+static int
+mp2869a_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
+	u16 mask)
+{
+	int ret = pmbus_read_word_data(client, page, phase, reg);
+
+	return (ret > 0) ? ret & mask : ret;
+}
+
+struct mp2869a_vout_info {
+	int vid_step_uv;
+	int vdiff_gain_ratio;
+};
+
+static int
+mp2869a_read_vid_and_scale(struct i2c_client *client, struct mp2869a_data *data,
+	int page, int phase,
+	struct mp2869a_vout_info *out)
+{
+	int ret;
+	u16 reg_val;
+	u8 vid_sel, vscale;
+
+	ret = pmbus_read_word_data(client, page, phase,
+		MP2869A_MFR_VOUT_SCALE_LOOP);
+	if (ret < 0)
+		return ret;
+
+	reg_val = (u16)ret;
+
+	/* Analyze VID Step Resolution（bits 12:10） */
+	vid_sel = (reg_val >> 10) & 0x7;
+	switch (vid_sel) {
+	case 0b000:
+		out->vid_step_uv = 6250;
+		break;
+	case 0b001:
+		out->vid_step_uv = 5000;
+		break;
+	case 0b010:
+		out->vid_step_uv = 2500;
+		break;
+	case 0b011:
+		out->vid_step_uv = 2000;
+		break;
+	case 0b100:
+		out->vid_step_uv = 1000;
+		break;
+	case 0b101:
+		/* 1000000 / 256 */
+		out->vid_step_uv = 3906;
+		break;
+	case 0b110:
+		/* 1000000 / 512 */
+		out->vid_step_uv = 1953;
+		break;
+	case 0b111:
+		/* 1000000 / 1024 */
+		out->vid_step_uv = 977;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Analyze VOUT_SCALE_LOOP（bits 7:0） */
+	vscale = reg_val & 0xff;
+	if (vscale == 0)
+		return -EINVAL;
+	/* Store as "magnification * 1000" to avoid floating point */
+	out->vdiff_gain_ratio = MP2869A_GAIN_BASE / vscale;
+
+	return 0;
+}
+
+static int
+mp2869a_read_vout(struct i2c_client *client, struct mp2869a_data *data,
+	int page, int phase, u8 reg)
+{
+	int ret;
+	int raw;
+	struct mp2869a_vout_info vout_info;
+
+	raw = mp2869a_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
+	if (raw < 0)
+		return raw;
+
+	ret = mp2869a_read_vid_and_scale(client, data, page, phase, &vout_info);
+	if (ret < 0)
+		return ret;
+
+	int m = 1;
+	int R = 0;
+	int step = vout_info.vid_step_uv;
+
+	/* Let step = 10^R / m */
+	while (step % 10 == 0 && R > -6) {
+		step /= 10;
+		R--;
+	}
+	/* approximate if step ≠ 1mV, 5mV, etc */
+	m = 1000000 / vout_info.vid_step_uv;
+
+	data->info.m[PSC_VOLTAGE_OUT] = m;
+	data->info.R[PSC_VOLTAGE_OUT] = R+3;
+	data->info.b[PSC_VOLTAGE_OUT] = 0;
+
+	return raw;
+}
+
+static int
+mp2869a_read_word_data(struct i2c_client *client, int page,
+	int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2869a_data *data = to_mp2869a_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = mp2869a_read_vout(client, data, page, phase, reg);
+		break;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
+static int
+mp2869a_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/* Enforce VOUT direct format. */
+		return PB_VOUT_MODE_DIRECT;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int
+mp2869a_identify_vout_format(struct i2c_client *client,
+	struct mp2869a_data *data)
+{
+	int i, ret;
+
+	for (i = 0; i < data->info.pages; i++) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_word_data(client, MP2869A_VOUT_MODE);
+		if (ret < 0)
+			return ret;
+
+		switch (ret & MP2869A_VOUT_MODE_MASK) {
+		case MP2869A_VOUT_MODE_VID:
+			data->vout_format[i] = vid;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static const struct pmbus_driver_info mp2869a_info = {
+	.pages = MP2869A_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -3,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP,
+	.read_byte_data = mp2869a_read_byte_data,
+	.read_word_data = mp2869a_read_word_data,
+};
+
+static int mp2869a_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp2869a_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2869a_data),
+		GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip_id = (enum chips)(kernel_ulong_t)i2c_get_match_data(client);
+	data->max_phases = mp2869a_max_phases[data->chip_id];
+	info = &data->info;
+	*info = mp2869a_info;
+
+	/* Identify vout format. */
+	ret = mp2869a_identify_vout_format(client, data);
+	if (ret)
+		return ret;
+
+	/* set the device to page 0 */
+	i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id __maybe_unused mp2869a_of_match[] = {
+	{ .compatible = "mps,mp2869a", .data = (void *)mp2869a },
+	{ .compatible = "mps,mp29612a", .data = (void *)mp29612a},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mp2869a_of_match);
+
+static struct i2c_driver mp2869a_driver = {
+	.driver = {
+		.name = "mp2869a",
+		.of_match_table = mp2869a_of_match,
+	},
+	.probe = mp2869a_probe,
+	.id_table = mp2869a_id,
+};
+
+module_i2c_driver(mp2869a_driver);
+
+MODULE_AUTHOR("Henry Wu <Henry_WU@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2869A/MP29612A device");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0

