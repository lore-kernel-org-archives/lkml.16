Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1F288529;
	Fri,  6 Jun 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211645; cv=none; b=MOe+jdW8SLhkVcjAMI3QUBgEUcKp9GZWrFEwBteLat0T4HRoq4qZWb+3Mc1UgkD38iwjbzT1zgtof6IyVVyP5WGDw/vsi9u9PxEKE4r7wbr16t5DrJLb7I9BIyatUFFdCmkCg/XwQgufVYPya8BBg8q/75wYvaw9ZPIjecIyOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211645; c=relaxed/simple;
	bh=bzsmLdMIa9al6ePD3W8m1sI9gk9fXKse2kjwCyIVlQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lull5MO13/APoXaUXeTzJBUe8v+hk3APO0b7jzMMm0XsarfEqhT/z8ADRBSjM5i7flwv/oew+Xn03r0ZuWXG9PDBJx08LyWjAeFSY1DLndjwwMM14laEoFeIqsCWbv6YHreWzrs0IIi5cy03AQ5/RfIcyNVyIvLdeUAvYkzm2XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgDaxd/4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgDaxd/4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso19444825e9.2;
        Fri, 06 Jun 2025 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211638; x=1749816438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO90m1UkbLNgxP6Sovv0JKa3HNyJrE5FmdEr+Gs6aC8=;
        b=bgDaxd/4hNkU7Hri5EBEmbYeUVxxOZ6hYCqFdmbqUI7z4WQlHrR9v3pUSscty1sC7E
         V2BlGaiincwUG2ffFYRBUZxYCq/YsTOWTbHX5r8YYQ39jIVInFdgNzPlefdVvdMQ5BDR
         iKIbuYU1LOaAjFTBiLFavwqVY/qJZ+Z3wIw/lRG5ay/ZdXhq/H2VH1vODyH3WHm/+kfg
         cGrjBmNr68VH+0avILvJQ8cDvSxoC35vjV5/xnGUw/r393xdK1uR8JArdnX/ZKmrOw3R
         fg+Z+PSRWicsUx0EW96uSVBL+S1DusDoFGH+8I9KgcV0zNus4Gith9w47n3pEwt9YenH
         tkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211638; x=1749816438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tO90m1UkbLNgxP6Sovv0JKa3HNyJrE5FmdEr+Gs6aC8=;
        b=WFvykS9DO4uipPsay2XEL94d+yi1JI2wGaXundxlnyOxJP2/0oDSDy/F2qU18Y2AlR
         Y9D5DegRUNWwIsXy32CXvYpV4LBTV2ZCBWokoNevPxji05xFF3hIlVMWo0Yv1PWp3Rsx
         0mPlJsDGrPgJlZB7It4G7PmoXhnYyj/0bocg3szBxisCjywnGczr3Rv39bTWtZAib7Gc
         V2xjeuBzv7fk6goL9EbP1IAmuP6Tu9lJkZ5UHbc1OmMXKIIFRMugr8z7g7ErjfgCfEpx
         izFi7TRZrO66qVAyM0k8aE1Ljd4cA13mKGGFUQpCMu+wcRiFmdENCvc6CAn1jKUsBtyJ
         5R9A==
X-Forwarded-Encrypted: i=1; AJvYcCVWmm3joOKMly5zEW5UYLkp8vRBpjYRm9vN1CdiFwP3Olt0coJuA9HdtkFyL3pYEtzlhWkevwkjbny8@vger.kernel.org
X-Gm-Message-State: AOJu0YzlyA2kua+q82sVMeHpWzJhiBl2OteP/l2y1DxaLcAYc4a0EtQA
	nAd4W2FjiB6haFzCFISRO71U35v8PYbP5TeUTEu2nCVbRbxklUyGCLC8H/C9Bg==
X-Gm-Gg: ASbGncv1JidYQ0gtLY+5ERYeFMfgt5MYkE3JJ1CF2q5NL7nUy7QeSHOP5QL988Uwh7x
	v1o79/x0wDmpHK4YXwzlZCjFBe/p6/HiGNHJy0Ovk52oYat0jCnsCC8eopvAgoFisU81c52KV8T
	s0Q+AOvG9MJFJOZe//UedOkMiquMmG0t1NDzqtdUK+uvPQ1p0P+jk9G1ErgCXicX/VUVguz2rjj
	jBIgo/f10R16Ey07Rb/6B1+NxdqMM4PIuXxo4OcYGGm8uoGediuI/4ZuSPhda6XtaEaBpQT+qe/
	Z8/rhH6kMGhSBFQtKfe3wN0wmtzi7XY7EJIpbXFrPIGHEs0xiW0mzZ9QZTt2PTrnUAFSztHO5vl
	VxyBTJ801qZa2mA==
X-Google-Smtp-Source: AGHT+IECTaxH5rhBPhCQRpz4CVtt0hMT5KWfQwFDDYGh0e0E4xCcYp5fIZAuhIoHoRJdQUJrm4LaDQ==
X-Received: by 2002:a05:600c:c16d:b0:450:d611:eb95 with SMTP id 5b1f17b1804b1-4520137c97emr38049505e9.17.1749211637171;
        Fri, 06 Jun 2025 05:07:17 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm1671874f8f.74.2025.06.06.05.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:07:16 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC EEPROM chips
Date: Fri,  6 Jun 2025 12:06:30 +0000
Message-ID: <20250606120631.3140054-3-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adds support for STMicroelectronics M24LRxx devices, which expose
two separate I2C addresses: one for system control and one for EEPROM
access. The driver implements both a sysfs-based interface for control
registers (e.g. UID, password authentication) and an nvmem provider
for EEPROM access.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
Changes in v3:
 - Fully support the M24LR chips, including EEPROM access, no need for
   the standard at24 driver to handle EEPROM separately.
 - Rename the driver file from m24lr_ctl.c to m24lr.c.
 - Rename all identifiers from the m24lr_ctl prefix to m24lr.
 - Retain the m24lr_ctl prefix for control-related routines to distinguish
   them from EEPROM-related logic.
 - Drop usage of the I2C mux API.
 - Use the NVMEM subsystem to handle EEPROM access.
 - Add REGMAP support for EEPROM register access.
 - Update Kconfig entry to reflect that the driver now supports both
   control and EEPROM functionality.

Changes in v2:
 - Fix compiling Errors and Warnings
 - Replace scnprintf with sysfs_emit
 - Drop success log message from probe.

Comment:
 - Running checkpatch emit a warning for non-const regmap_config.
   The variable must remain auto and mutable due to runtime manipulation.
---
 drivers/misc/Kconfig  |  17 +
 drivers/misc/Makefile |   1 +
 drivers/misc/m24lr.c  | 705 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 723 insertions(+)
 create mode 100644 drivers/misc/m24lr.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index c161546d728f..96dc2bf2ad45 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -644,6 +644,23 @@ config MCHP_LAN966X_PCI
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
 
+config M24LR
+	tristate "STMicroelectronics M24LR RFID/NFC EEPROM support"
+	depends on SYSFS
+	select REGMAP_I2C
+	select NVMEM
+	help
+	  This enables support for STMicroelectronics M24LR RFID/NFC EEPROM
+	  chips. These dual-interface devices expose two I2C addresses:
+	  one for EEPROM memory access and another for control and system
+	  configuration (e.g. UID, password handling).
+
+	  This driver provides a sysfs interface for control functions and
+	  integrates with the nvmem subsystem for EEPROM access.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called m24lr.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 054cee9b08a4..689b68fad9fd 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -75,3 +75,4 @@ lan966x-pci-objs		:= lan966x_pci.o
 lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
+obj-$(CONFIG_M24LR)		+= m24lr.o
diff --git a/drivers/misc/m24lr.c b/drivers/misc/m24lr.c
new file mode 100644
index 000000000000..46a3c8ef7b0f
--- /dev/null
+++ b/drivers/misc/m24lr.c
@@ -0,0 +1,705 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * m24lr.c - Sysfs control interface for ST M24LR series RFID/NFC chips
+ *
+ * Copyright (c) 2025 Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+ *
+ * This driver implements both the sysfs-based control interface and EEPROM
+ * access for STMicroelectronics M24LR series chips (e.g., M24LR04E-R).
+ * It provides access to control registers for features such as password
+ * authentication, memory protection, and device configuration. In addition,
+ * it manages read and write operations to the EEPROM region of the chip.
+ */
+
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/nvmem-provider.h>
+
+#define M24LR_PAGESIZE_DEFAULT	  1u
+
+#define M24LR_WRITE_TIMEOUT	  25u
+#define M24LR_READ_TIMEOUT	  (M24LR_WRITE_TIMEOUT)
+
+#define to_sys_entry(attrp)   container_of(attrp, struct m24lr_sys_entry, attr)
+
+/**
+ * struct m24lr_sys_entry - describes a sysfs entry for M24LR device access
+ * @reg_addr:  register address in the M24LR device
+ * @reg_size:  size of the register in bytes
+ * @attr:      sysfs attribute used for exposing register access to userspace
+ *
+ * Used to define readable/writable register entries through sysfs.
+ */
+struct m24lr_sys_entry {
+	unsigned int reg_addr;
+	unsigned int reg_size;
+	struct device_attribute attr;
+};
+
+/**
+ * struct m24lr_chip - describes chip-specific sysfs layout
+ * @page_size:	   chip-specific limit on the maximum number of bytes allowed
+ *		   in a single write operation.
+ * @eeprom_size:   size of the EEPROM in byte
+ * @n_entries:	   number of entries in the array
+ * @n_sss_entries: number of sss entries required for the chip
+ * @entries:	   array of sysfs entries specific to the chip variant
+ *
+ * Supports multiple M24LR chip variants (e.g., M24LRxx) by allowing each
+ * to define its own set of sysfs attributes, depending on its available
+ * registers and features.
+ */
+struct m24lr_chip {
+	unsigned int page_size;
+	unsigned int eeprom_size;
+	unsigned int n_entries;
+	unsigned int n_sss_entries;
+	const struct m24lr_sys_entry *entries;
+};
+
+/**
+ * struct m24lr - core driver data for M24LR chip control
+ * @page_size:	   chip-specific limit on the maximum number of bytes allowed
+ *		   in a single write operation.
+ * @eeprom_size:   size of the EEPROM in byte
+ * @ctl_regmap:	   regmap interface for accessing the system parameter sector
+ * @eeprom_regmap: regmap interface for accessing the EEPROM
+ * @lock:	   mutex to synchronize operations to the device
+ * @sss_entries:   array of sssc sysfs entries specific to the chip variant
+ * @n_sss_entries: number of entries in the sss entries array
+ *
+ * Central data structure holding the state and resources used by the
+ * M24LR device driver.
+ */
+struct m24lr {
+	unsigned int page_size;
+	unsigned int eeprom_size;
+	struct regmap *ctl_regmap;
+	struct regmap *eeprom_regmap;
+	struct mutex lock;	 /* synchronize operations to the device */
+	struct m24lr_sys_entry *sss_entries;
+	unsigned int n_sss_entries;
+};
+
+static ssize_t m24lr_ctl_show(struct device *dev,
+			      struct device_attribute *attr, char *buf);
+static ssize_t m24lr_ctl_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count);
+static ssize_t m24lr_ctl_unlock_command(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count);
+static ssize_t m24lr_ctl_newpass_command(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count);
+
+static const struct regmap_range m24lr_ctl_vo_ranges[] = {
+	regmap_reg_range(0, 63),
+};
+
+static const struct regmap_access_table m24lr_ctl_vo_table = {
+	.yes_ranges = m24lr_ctl_vo_ranges,
+	.n_yes_ranges = ARRAY_SIZE(m24lr_ctl_vo_ranges),
+};
+
+static const struct regmap_config m24lr_ctl_regmap_conf = {
+	.name = "m24lr_ctl",
+	.reg_stride = 1,
+	.reg_bits = 16,
+	.val_bits = 8,
+	.disable_locking = false,
+	.cache_type = REGCACHE_RBTREE,/* Flat can't be used, there's huge gap */
+	.volatile_table = &m24lr_ctl_vo_table,
+};
+
+/* define the default sysfs entries for M24LR chips */
+static const struct m24lr_sys_entry m24lr_ctl_sys_entry_default_table[] = {
+	{.attr = __ATTR(unlock, 0200, NULL, m24lr_ctl_unlock_command)},
+	{.attr = __ATTR(new_pass, 0200, NULL, m24lr_ctl_newpass_command)},
+	{.reg_addr = 2324, .reg_size = 8,
+	 .attr = __ATTR(uid, 0444, m24lr_ctl_show, NULL)},
+	{.reg_addr = 2334, .reg_size = 1,
+	 .attr = __ATTR(mem_size, 0400, m24lr_ctl_show, NULL)},
+};
+
+/* Chip descriptor for M24LR04E-R variant */
+static const struct m24lr_chip m24lr04e_r_chip = {
+	.page_size = 4,
+	.eeprom_size = 512,
+	.n_sss_entries = 4,
+	.n_entries = ARRAY_SIZE(m24lr_ctl_sys_entry_default_table),
+	.entries = m24lr_ctl_sys_entry_default_table,
+};
+
+/* Chip descriptor for M24LR16E-R variant */
+static const struct m24lr_chip m24lr16e_r_chip = {
+	.page_size = 4,
+	.eeprom_size = 2048,
+	.n_sss_entries = 16,
+	.n_entries = ARRAY_SIZE(m24lr_ctl_sys_entry_default_table),
+	.entries = m24lr_ctl_sys_entry_default_table,
+};
+
+/* Chip descriptor for M24LR64E-R variant */
+static const struct m24lr_chip m24lr64e_r_chip = {
+	.page_size = 4,
+	.eeprom_size = 8192,
+	.n_sss_entries = 64,
+	.n_entries = ARRAY_SIZE(m24lr_ctl_sys_entry_default_table),
+	.entries = m24lr_ctl_sys_entry_default_table,
+};
+
+static const struct i2c_device_id m24lr_ids[] = {
+	{ "m24lr04e-r", (kernel_ulong_t)&m24lr04e_r_chip},
+	{ "m24lr16e-r", (kernel_ulong_t)&m24lr16e_r_chip},
+	{ "m24lr64e-r", (kernel_ulong_t)&m24lr64e_r_chip},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, m24lr_ids);
+
+static const struct of_device_id m24lr_of_match[] = {
+	{ .compatible = "st,m24lr04e-r", .data = &m24lr04e_r_chip},
+	{ .compatible = "st,m24lr16e-r", .data = &m24lr16e_r_chip},
+	{ .compatible = "st,m24lr64e-r", .data = &m24lr64e_r_chip},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, m24lr_of_match);
+
+/**
+ * m24lr_parse_le_value - Parse hex string and convert to little-endian binary
+ * @buf:	Input string buffer (hex format)
+ * @reg_size:	Size of the register in bytes (must be 1, 2, 4, or 8)
+ * @output:	Output buffer to store the value in little-endian format
+ *
+ * Converts a hexadecimal string to a numeric value of the given register size
+ * and writes it in little-endian byte order into the provided buffer.
+ *
+ * Return: 0 on success, or negative error code on failure
+ */
+static int m24lr_parse_le_value(const char *buf, u32 reg_size, u8 *output)
+{
+	int err;
+
+	switch (reg_size) {
+	case 1: {
+		u8 tmp;
+
+		err = kstrtou8(buf, 16, &tmp);
+		if (!err)
+			*output = tmp;
+		break;
+	}
+	case 2: {
+		u16 tmp;
+
+		err = kstrtou16(buf, 16, &tmp);
+		if (!err)
+			*(__le16 *)output = cpu_to_le16(tmp);
+		break;
+	}
+	case 4: {
+		u32 tmp;
+
+		err = kstrtou32(buf, 16, &tmp);
+		if (!err)
+			*(__le32 *)output = cpu_to_le32(tmp);
+		break;
+	}
+	case 8: {
+		u64 tmp;
+
+		err = kstrtou64(buf, 16, &tmp);
+		if (!err)
+			*(__le64 *)output = cpu_to_le64(tmp);
+		break;
+	}
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+/**
+ * m24lr_regmap_read - read data using regmap with retry on failure
+ * @regmap:  regmap instance for the device
+ * @buf:     buffer to store the read data
+ * @size:    number of bytes to read
+ * @offset:  starting register address
+ *
+ * Attempts to read a block of data from the device with retries and timeout.
+ * Some M24LR chips may transiently NACK reads (e.g., during internal write
+ * cycles), so this function retries with a short sleep until the timeout
+ * expires.
+ *
+ * Returns:
+ *	 Number of bytes read on success,
+ *	 -ETIMEDOUT if the read fails within the timeout window.
+ */
+static ssize_t m24lr_regmap_read(struct regmap *regmap, u8 *buf,
+				 size_t size, unsigned int offset)
+{
+	int err;
+	unsigned long timeout, read_time;
+	ssize_t ret = -ETIMEDOUT;
+
+	timeout = jiffies + msecs_to_jiffies(M24LR_READ_TIMEOUT);
+	do {
+		read_time = jiffies;
+
+		err = regmap_bulk_read(regmap, offset, buf, size);
+		if (!err) {
+			ret = size;
+			break;
+		}
+
+		usleep_range(1000, 2000);
+	} while (time_before(read_time, timeout));
+
+	return ret;
+}
+
+/**
+ * m24lr_regmap_write - write data using regmap with retry on failure
+ * @regmap: regmap instance for the device
+ * @buf:    buffer containing the data to write
+ * @size:   number of bytes to write
+ * @offset: starting register address
+ *
+ * Attempts to write a block of data to the device with retries and a timeout.
+ * Some M24LR devices may NACK I2C writes while an internal write operation
+ * is in progress. This function retries the write operation with a short delay
+ * until it succeeds or the timeout is reached.
+ *
+ * Returns:
+ *	 Number of bytes written on success,
+ *	 -ETIMEDOUT if the write fails within the timeout window.
+ */
+static ssize_t m24lr_regmap_write(struct regmap *regmap, const u8 *buf,
+				  size_t size, unsigned int offset)
+{
+	int err;
+	unsigned long timeout, write_time;
+	ssize_t ret = -ETIMEDOUT;
+
+	timeout = jiffies + msecs_to_jiffies(M24LR_WRITE_TIMEOUT);
+
+	do {
+		write_time = jiffies;
+
+		err = regmap_bulk_write(regmap, offset, buf, size);
+		if (!err) {
+			ret = size;
+			break;
+		}
+
+		usleep_range(1000, 2000);
+	} while (time_before(write_time, timeout));
+
+	return ret;
+}
+
+static ssize_t m24lr_read(struct m24lr *m24lr, u8 *buf, size_t size,
+			  unsigned int offset, bool is_eeprom)
+{
+	struct regmap *regmap;
+	long ret;
+
+	if (is_eeprom)
+		regmap = m24lr->eeprom_regmap;
+	else
+		regmap = m24lr->ctl_regmap;
+
+	mutex_lock(&m24lr->lock);
+	ret = m24lr_regmap_read(regmap, buf, size, offset);
+	mutex_unlock(&m24lr->lock);
+
+	return ret;
+}
+
+/**
+ * m24lr_write - write buffer to M24LR device with page alignment handling
+ * @m24lr:  pointer to driver context
+ * @buf:    data buffer to write
+ * @size:   number of bytes to write
+ * @offset: target register address in the device
+ *
+ * Writes data to the M24LR device using regmap, split into chunks no larger
+ * than page_size to respect device-specific write limitations (e.g., page
+ * size or I2C hold-time concerns). Each chunk is aligned to the page boundary
+ * defined by page_size.
+ *
+ * Returns:
+ *	 Total number of bytes written on success,
+ *	 A negative error code if any write fails.
+ */
+static ssize_t m24lr_write(struct m24lr *m24lr, const u8 *buf, size_t size,
+			   unsigned int offset, bool is_eeprom)
+{
+	unsigned int n, next_sector;
+	struct regmap *regmap;
+	ssize_t ret = 0;
+	long err;
+
+	if (is_eeprom)
+		regmap = m24lr->eeprom_regmap;
+	else
+		regmap = m24lr->ctl_regmap;
+
+	n = min(size, m24lr->page_size);
+	next_sector = roundup(offset + 1, m24lr->page_size);
+	if (offset + n > next_sector)
+		n = next_sector - offset;
+
+	mutex_lock(&m24lr->lock);
+	while (n) {
+		err = m24lr_regmap_write(regmap, buf, n, offset);
+		if (IS_ERR_VALUE(err)) {
+			mutex_unlock(&m24lr->lock);
+			if (ret)
+				return ret;
+			else
+				return err;
+		}
+
+		offset += n;
+		size -= n;
+		ret += n;
+		n = min(size, m24lr->page_size);
+	}
+	mutex_unlock(&m24lr->lock);
+
+	return ret;
+}
+
+/**
+ * m24lr_write_pass - Write password to M24LR043-R using secure format
+ * @m24lr: Pointer to device control structure
+ * @buf:   Input buffer containing hex-encoded password
+ * @count: Number of bytes in @buf
+ * @code:  Operation code to embed between password copies
+ *
+ * This function parses a 4-byte password, encodes it in  big-endian format,
+ * and constructs a 9-byte sequence of the form:
+ *
+ *	  [BE(password), code, BE(password)]
+ *
+ * The result is written to register 0x0900 (2304), which is the password
+ * register in M24LR04E-R chip.
+ *
+ * Return: Number of bytes written on success, or negative error code on failure
+ */
+static ssize_t m24lr_write_pass(struct m24lr *m24lr, const char *buf,
+				size_t count, u8 code)
+{
+	__be32 be_pass;
+	u8 output[9];
+	long ret;
+	u32 pass;
+	int err;
+
+	if (unlikely(!count))
+		return -EINVAL;
+
+	if (count > 8)
+		return -EINVAL;
+
+	err = kstrtou32(buf, 16, &pass);
+	if (err)
+		return err;
+
+	be_pass = cpu_to_be32(pass);
+
+	memcpy(output, &be_pass, sizeof(be_pass));
+	output[4] = code;
+	memcpy(output + 5, &be_pass, sizeof(be_pass));
+
+	mutex_lock(&m24lr->lock);
+	ret = m24lr_regmap_write(m24lr->ctl_regmap, output, 9, 2304);
+	mutex_unlock(&m24lr->lock);
+
+	return ret;
+}
+
+static ssize_t m24lr_ctl_newpass_command(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
+
+	return m24lr_write_pass(m24lr, buf, count, 7);
+}
+
+static ssize_t m24lr_ctl_unlock_command(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
+
+	return m24lr_write_pass(m24lr, buf, count, 9);
+}
+
+static ssize_t m24lr_ctl_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
+	struct m24lr_sys_entry *entry = to_sys_entry(attr);
+	unsigned int reg_size = entry->reg_size;
+	unsigned int reg_addr = entry->reg_addr;
+	u8 output[8];
+	int err = 0;
+
+	if (unlikely(!count))
+		return -EINVAL;
+
+	if (count > (reg_size << 1))
+		return -EINVAL;
+
+	if (unlikely(!is_power_of_2(reg_size) || reg_size > 8)) {
+		dev_dbg(dev,
+			"Invalid register size: must be a power of 2 and <= 8 bytes (%u)\n",
+			reg_size);
+		return -EIO;
+	}
+
+	err = m24lr_parse_le_value(buf, reg_size, output);
+	if (err)
+		return err;
+
+	return m24lr_write(m24lr, (u8 *)&output, reg_size, reg_addr, false);
+}
+
+static ssize_t m24lr_ctl_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	long ret;
+	u64 val;
+	__le64 input = 0;
+	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
+	struct m24lr_sys_entry *entry = to_sys_entry(attr);
+	unsigned int reg_addr = entry->reg_addr;
+	unsigned int reg_size = entry->reg_size;
+
+	if (unlikely(!is_power_of_2(reg_size) || reg_size > 8)) {
+		dev_dbg(dev,
+			"Invalid register size: must be a power of 2 and <= 8 bytes (%u)\n",
+			reg_size);
+		return -EIO;
+	}
+
+	ret = m24lr_read(m24lr, (u8 *)&input, reg_size, reg_addr, false);
+	if (IS_ERR_VALUE(ret))
+		return ret;
+
+	if (ret != reg_size)
+		return -EIO;
+
+	switch (reg_size) {
+	case 1:
+		val = *(u8 *)&input;
+		break;
+	case 2:
+		val = le16_to_cpu((__le16)input);
+		break;
+	case 4:
+		val = le32_to_cpu((__le32)input);
+		break;
+	case 8:
+		val = le64_to_cpu((__le64)input);
+		break;
+	};
+
+	return sysfs_emit(buf, "%llx\n", val);
+}
+
+static int m24lr_nvmem_read(void *priv, unsigned int offset, void *val,
+			    size_t bytes)
+{
+	struct m24lr *m24lr = priv;
+
+	if (unlikely(!bytes))
+		return bytes;
+
+	if (offset + bytes > m24lr->eeprom_size)
+		return -EINVAL;
+
+	return m24lr_read(m24lr, val, bytes, offset, true);
+}
+
+static int m24lr_nvmem_write(void *priv, unsigned int offset, void *val,
+			     size_t bytes)
+{
+	struct m24lr *m24lr = priv;
+
+	if (unlikely(!bytes))
+		return -EINVAL;
+
+	if (offset + bytes > m24lr->eeprom_size)
+		return -EINVAL;
+
+	return m24lr_write(m24lr, val, bytes, offset, true);
+}
+
+static const struct m24lr_chip *m24lr_get_chip(struct device *dev)
+{
+	const struct m24lr_chip *ret;
+	const struct i2c_device_id *id;
+
+	id = i2c_match_id(m24lr_ids, to_i2c_client(dev));
+
+	if (dev->of_node && of_match_device(m24lr_of_match, dev))
+		ret = of_device_get_match_data(dev);
+	else if (id)
+		ret = (void *)id->driver_data;
+	else
+		ret = acpi_device_get_match_data(dev);
+
+	return ret;
+}
+
+static int m24lr_probe(struct i2c_client *client)
+{
+	struct regmap_config eeprom_regmap_conf = {0};
+	struct nvmem_config nvmem_conf = {0};
+	struct m24lr_sys_entry *sss = NULL;
+	struct device *dev = &client->dev;
+	struct i2c_client *eeprom_client;
+	const struct m24lr_chip *chip;
+	struct regmap *eeprom_regmap;
+	struct nvmem_device *nvmem;
+	struct regmap *ctl_regmap;
+	unsigned int n_sss;
+	struct m24lr *m24lr;
+	u32 regs[2];
+	long err;
+	u8 test;
+	int i;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+
+	chip = m24lr_get_chip(dev);
+	if (!chip)
+		return -ENODEV;
+
+	m24lr = devm_kzalloc(dev, sizeof(struct m24lr), GFP_KERNEL);
+	if (!m24lr)
+		return -ENOMEM;
+
+	err = device_property_read_u32_array(dev, "reg", regs, ARRAY_SIZE(regs));
+	if (err) {
+		dev_err(dev, "device_property_read_u32_array\n");
+		return err;
+	}
+	/* Create a second I2C client for the eeprom interface */
+	eeprom_client = devm_i2c_new_dummy_device(dev, client->adapter, regs[1]);
+	if (IS_ERR(eeprom_client)) {
+		dev_err(dev,
+			"Failed to create dummy I2C client for the EEPROM\n");
+		return PTR_ERR(eeprom_client);
+	}
+
+	for (i = 0; i < chip->n_entries; i++) {
+		const struct device_attribute *attr = &chip->entries[i].attr;
+
+		err = device_create_file(dev, attr);
+		if (err)
+			dev_warn(dev,
+				 "Failed to create sysfs entry '%s'\n",
+				 attr->attr.name);
+	}
+
+	n_sss = chip->n_sss_entries;
+	if (n_sss) {
+		sss = devm_kzalloc(dev, n_sss * sizeof(struct m24lr_sys_entry),
+				   GFP_KERNEL);
+		if (!sss)
+			return -ENOMEM;
+
+		for (i = 0; i < n_sss; i++) {
+			char *name = devm_kasprintf(dev, GFP_KERNEL, "sss%d", i);
+
+			sss[i].reg_size = 1;
+			sss[i].reg_addr = i;
+			sss[i].attr.attr.name = name;
+			sss[i].attr.attr.mode = 0600;
+			sss[i].attr.show = m24lr_ctl_show;
+			sss[i].attr.store = m24lr_ctl_store;
+
+			err = device_create_file(dev, &sss[i].attr);
+			if (err)
+				dev_warn(dev,
+					 "Failed to create sysfs entry '%s'\n",
+					 name);
+		}
+	}
+
+	ctl_regmap = devm_regmap_init_i2c(client, &m24lr_ctl_regmap_conf);
+	if (IS_ERR(ctl_regmap)) {
+		err = PTR_ERR(ctl_regmap);
+		dev_err(dev, "Failed to init regmap\n");
+		return err;
+	}
+
+	eeprom_regmap_conf.name = "m24lr_eeprom";
+	eeprom_regmap_conf.reg_bits = 16;
+	eeprom_regmap_conf.val_bits = 8;
+	eeprom_regmap_conf.disable_locking = true;
+	eeprom_regmap_conf.max_register = chip->eeprom_size - 1;
+
+	eeprom_regmap = devm_regmap_init_i2c(eeprom_client,
+					     &eeprom_regmap_conf);
+	if (IS_ERR(eeprom_regmap)) {
+		err = PTR_ERR(eeprom_regmap);
+		dev_err(dev, "Failed to init regmap\n");
+		return err;
+	}
+
+	mutex_init(&m24lr->lock);
+	m24lr->page_size = chip->page_size;
+	m24lr->eeprom_size = chip->eeprom_size;
+	m24lr->eeprom_regmap = eeprom_regmap;
+	m24lr->ctl_regmap = ctl_regmap;
+	m24lr->n_sss_entries = n_sss;
+	m24lr->sss_entries = sss;
+
+	nvmem_conf.dev = &eeprom_client->dev;
+	nvmem_conf.owner = THIS_MODULE;
+	nvmem_conf.type = NVMEM_TYPE_EEPROM;
+	nvmem_conf.reg_read = m24lr_nvmem_read;
+	nvmem_conf.reg_write = m24lr_nvmem_write;
+	nvmem_conf.size = chip->eeprom_size;
+	nvmem_conf.word_size = 1;
+	nvmem_conf.stride = 1;
+	nvmem_conf.priv = m24lr;
+
+	nvmem = devm_nvmem_register(dev, &nvmem_conf);
+	if (IS_ERR(nvmem))
+		return PTR_ERR(nvmem);
+
+	i2c_set_clientdata(client, m24lr);
+	i2c_set_clientdata(eeprom_client, m24lr);
+
+	err = m24lr_read(m24lr, &test, 1, 0, true);
+	if (IS_ERR_VALUE(err))
+		return -ENODEV;
+
+	return 0;
+}
+
+static struct i2c_driver m24lr_driver = {
+	.driver = {
+		.name = "m24lr",
+		.of_match_table = m24lr_of_match,
+	},
+	.probe	  = m24lr_probe,
+	.id_table = m24lr_ids,
+};
+module_i2c_driver(m24lr_driver);
+
+MODULE_AUTHOR("Abd-Alrhman Masalkhi");
+MODULE_DESCRIPTION("st m24lr control driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

