Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540CFBA49;
	Tue, 24 Jun 2025 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750921; cv=none; b=bjq8kGbjwuNvbW7XX+a4q3t4j76JVhjSkt0yxWk1mI8AlHVsXBQ5tOOMhU2Zz9fmxetKYbxmLuqswMdq7caUf0DJTwYW27+r16mcga4YsAHnX5h52re3pW/1vlbBktWqsYtWMz5CtUAD77SkqntIzDlQScyg7gPF7RX0s165Z+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750921; c=relaxed/simple;
	bh=wRrFjyYmf+pqkgzflrSKyWgTj+6DjX7d/ZthudwecgM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EFeeCI+ssCPmiNLTF/8exg/zvLsEjPUl16LgAhsLi8a0h588qDC5WmPCcVqizEbUp8XULOWskJ4Np0Q5MYfo8loQ6waNpQyU/TGqAWstp0g40NaaK1KK/4dlUHUUw8SXzAWxTT/ZZI59LUXYl2CoiJF5dSCcTiX/TgUQ4S50D6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijaq8h77; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijaq8h77"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748e378ba4fso205161b3a.1;
        Tue, 24 Jun 2025 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750750918; x=1751355718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0MaS2mhRT3COCNMfauQrWP0nXvsvD2JhHBor2LXcus=;
        b=ijaq8h776Zgp3EuOqI3SB0KYmjWuBWSKqH7z0rW9SPdHHtEgZOp9mdGV1kp28IkfaS
         WDQZlw2YRPS1IfGt6ImULpcioIqDoUmr87c3EGsOrS6x0MBAMgcMCt6kBgOeJlAqK3Xz
         pDWnDQaebYZ593E9IRw/dPWwS0JYeIFa916d+Q5wv+VYgCXRwavNINdbOd5rUQT8LStW
         1iYF8eM8zCb2R9KxRn+BpJ9VTrURw+EAiusQjuTbchab7Jsz/O39p0uDj3zU3oJFLF1S
         579RoBVaFE/64fHrlN8iCpgnMQgE78wbP/rhdCVxoap+r4V99w3MzztbDJ283liFcmaS
         vQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750918; x=1751355718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0MaS2mhRT3COCNMfauQrWP0nXvsvD2JhHBor2LXcus=;
        b=lVlK+lNAHekC9+i7SDSMUBJbCYPeJ473oWIRTu74cnJM53xcAMy4H8dieo/uUgJR1N
         WmLUHIRTyFwzBJh4fwxWSrjI2QMqKafieLTVH22W2eQW3w+lygdVW1m5QU5UGqX0Um4k
         6sEc+vrGDwZ4FS6LZRfsRh6A8NM3S86SO5z+YvNg/6PVQGfwQ3yGtymfbfs4jrRIjHJF
         F/05wiLwtdbhFZLdLbdglk/0z20xSsaDWVYZxEk15OjnQuPFX07lDv2pnZcR/53NLlfd
         c5I6BokbP9w4QqoCLuV6t9gnEt1fovduaRNTx2Qsu1plN55Smpd3EIBNHEDAj59iuWto
         D+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUNzGjCwQsubFaHPplOTkZPFo6LqTmnEUd75FbItaOHt/KRRHuRoyTwmUzWKEGqMcluBPPQLtSYUY7U@vger.kernel.org, AJvYcCVcUcAy7946kaHibMiXOmJ1+JiWhZSXJ44iEdCr1x8ufkOO5yqZ8G8u2D28XLs6gqkT516pHjVd7Yua@vger.kernel.org, AJvYcCWFZl0CaXfCgN5hU8peM0dEPpLR6NrKE4XllucaAz6WJMo05ip4sPGyuYcgeEg0F6GYSw6ccnbNmEFs/9E=@vger.kernel.org, AJvYcCWMgp7oAwAWemzBzUdGCHCKpammLYP3EfjPKwUb+rzoLp0XNOcFJjWJJcg/5+Ba1fTL/iSHHSuZQqGYwkEH@vger.kernel.org
X-Gm-Message-State: AOJu0YxTA7hOYxA5OkyS6VXMK0XnJlFyUKuFI0mHUHr0P33Qlwq7FfO9
	7T+iSZ+pzN0uZd3//C0cyacr1StDmdpHYKQOV9493zW7bm2TITkTHwl2
X-Gm-Gg: ASbGncswry66GAowl4lQNsk/MRb0MSK4OQ/hDm5zOFV1f8+HHwwv1MSX3V3XZOHKFj0
	11toXItSnCa4Y+81+VbaDRZBqMElmtx3M7KQmTvIEmbf2epmsFiZL28N5WynmcL6XqTwZUxR/YL
	ZKqHvYRYhaYLisAW8TVc2Phj3hHn4HgdMYCmH22CxNVA6xjJAcuGbuQF4idrrZoO3x8bEBQQnQp
	vUEm3vpF/QtIezGoiUTmdDQ1cRJxzHnVXzAEgjXPCG7il9scbuXgg9fpGbVm3zEPfJtUCWlyO2B
	Z/TSEn4ApiudZEdjCay5FxW6TZdxPn/eUzOSj9/O0t14Itdv3C7bVWylhHqAS6BUxPJj81LB0T1
	F9PjERDCX8ocl8B6PAgFw29e266h8Ck/b5IO3RjbBt5e511MhjGfMEKBXuHM=
X-Google-Smtp-Source: AGHT+IFDNPGPe05sdONHtK/am5hlTpioRGrUWD3KLlquPEqP2LdTKYA2q3MV5GTJrKWWSk3eGWlbSw==
X-Received: by 2002:aa7:8896:0:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-7490d6a6a33mr24041339b3a.21.1750750918374;
        Tue, 24 Jun 2025 00:41:58 -0700 (PDT)
Received: from localhost (2001-b400-e3db-4096-e87a-5c33-d510-e9d5.emome-ip6.hinet.net. [2001:b400:e3db:4096:e87a:5c33:d510:e9d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8873175sm1159740b3a.173.2025.06.24.00.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:41:57 -0700 (PDT)
From: tzuhao.wtmh@gmail.com
X-Google-Original-From: Henry_Wu@quantatw.tw
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase mp2869a/mp29612a controllers
Date: Tue, 24 Jun 2025 15:41:33 +0800
Message-ID: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
X-Mailer: git-send-email 2.43.0
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
index 000000000000..7fa03cad1953
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
+#define MP2869A_VOUT_MODE		     0x20
+#define MP2869A_VOUT_MODE_MASK       GENMASK(7, 5)
+#define MP2869A_VOUT_MODE_VID        (0 << 5)
+
+
+#define MP2869A_READ_VOUT			 0x8b
+
+#define MP2869A_MFR_VOUT_SCALE_LOOP  0x29
+#define MP2869A_VID_RES_MASK         GENMASK(12, 10)
+#define MP2869A_VOUT_SCALE_MASK      GENMASK(7, 0)
+
+#define MP2869A_MAX_PHASE_RAIL1		 16
+#define MP2869A_MAX_PHASE_RAIL2		 8
+#define MP29612A_MAX_PHASE_RAIL1	 12
+#define MP29612A_MAX_PHASE_RAIL2	 6
+
+#define MP2869A_PAGE_NUM			 2
+#define MP29612A_PAGE_NUM			 2
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
+struct MP2869A_data {
+	struct pmbus_driver_info info;
+	int vout_format[MP2869A_PAGE_NUM];
+	int curr_sense_gain[MP2869A_PAGE_NUM];
+	int max_phases[MP2869A_PAGE_NUM];
+	enum chips chip_id;
+};
+
+#define to_MP2869A_data(x)	container_of(x, struct MP2869A_data, info)
+
+static int
+MP2869A_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
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
+MP2869A_read_vid_and_scale(struct i2c_client *client, struct MP2869A_data *data,
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
+		out->vid_step_uv = 3906;
+		break; // 1000000 / 256
+	case 0b110:
+		out->vid_step_uv = 1953;
+		break; // 1000000 / 512
+	case 0b111:
+		out->vid_step_uv = 977;
+		break; // 1000000 / 1024
+	default:
+		return -EINVAL;
+	}
+
+	/* Analyze VOUT_SCALE_LOOP（bits 7:0） */
+	vscale = reg_val & 0xff;
+	if (vscale == 0)
+		return -EINVAL;
+	// Store as "magnification * 1000" to avoid floating point
+	out->vdiff_gain_ratio = 32 * 1000 / vscale;
+
+	return 0;
+}
+
+static int
+MP2869A_read_vout(struct i2c_client *client, struct MP2869A_data *data,
+	int page, int phase, u8 reg)
+{
+	int ret;
+	int raw;
+	struct mp2869a_vout_info vout_info;
+
+    raw = MP2869A_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
+    if (raw < 0)
+		return raw;
+
+    ret = MP2869A_read_vid_and_scale(client, data, page, phase, &vout_info);
+    if (ret < 0)
+		return ret;
+
+	int m = 1;
+	int R = 0;
+	int step = vout_info.vid_step_uv;
+
+	// Let step = 10^R / m
+	while (step % 10 == 0 && R > -6) {
+		step /= 10;
+		R--;
+	}
+	m = 1000000 / vout_info.vid_step_uv;  // approximate if step ≠ 1mV, 5mV, etc
+
+	data->info.m[PSC_VOLTAGE_OUT] = m;
+	data->info.R[PSC_VOLTAGE_OUT] = R+3;
+	data->info.b[PSC_VOLTAGE_OUT] = 0;
+
+    return raw;
+}
+
+static int
+MP2869A_read_word_data(struct i2c_client *client, int page,
+	int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct MP2869A_data *data = to_MP2869A_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = MP2869A_read_vout(client, data, page, phase, reg);
+		break;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
+static int
+MP2869A_read_byte_data(struct i2c_client *client, int page, int reg)
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
+MP2869A_identify_vout_format(struct i2c_client *client,
+			    struct MP2869A_data *data)
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
+		return -EINVAL;
+		}
+		}
+	return 0;
+}
+
+static struct pmbus_driver_info MP2869A_info = {
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
+	.read_byte_data = MP2869A_read_byte_data,
+	.read_word_data = MP2869A_read_word_data,
+};
+
+static int mp2869a_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct MP2869A_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct MP2869A_data),
+		GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
+
+	memcpy(data->max_phases, mp2869a_max_phases[data->chip_id],
+		sizeof(data->max_phases));
+
+	memcpy(&data->info, &MP2869A_info, sizeof(*info));
+	info = &data->info;
+
+
+	/* Identify vout format. */
+	ret = MP2869A_identify_vout_format(client, data);
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
+
+MODULE_AUTHOR("Henry Wu <Henry_WU@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2869A/MP29612A device");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.43.0

