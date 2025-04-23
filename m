Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D7A291170;
	Wed, 23 Apr 2025 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435924; cv=none; b=Rtx+nj6Dj0Q9SDfB7+plw17RzMG+QeZT9rp/Pajs7Le/ZpO2xRXHQ0r0vQPpXelayJZZRLrQK3ZzVa76v9gXnkqx+uXjp5PlgWW5F+QIEwG99IpXzKKSKEXtI2vVrcmt/h0DfFBpHNyZuMyAPIXgpXmw5OEJ82cFlOg2s+G+xEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435924; c=relaxed/simple;
	bh=DsaNBg7kkCyMfyjSK+lMewVbgSsJc/88OwBkVoIMDfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORNC9Dg4x1tL/TRz72EKFelogXd5LLjNNDZzETeTxrm1jh+HwT2PIMVcxNJoMX5Iqr8qzFPJio6D2hilLF+yrf6CatPEjM3jimHUo328SDToXOgM6FY4jsa22gmcxc6wXvmGleTl/G8TdbI2CFc25idyz+Ewp0urhVCyMB5NLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kv2XEnpF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kv2XEnpF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2243803b776so3264645ad.0;
        Wed, 23 Apr 2025 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435922; x=1746040722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGPo16mSphfxbc3aNmKamBwbL4h4Z65tWk3KvEu3074=;
        b=kv2XEnpF1zDmrdtyZYlqcE8vDTIcn3xWE/V1IY1w8HI57cuiqRkg9AoqyZNmq/kjJg
         a13X3zi32tNs88YH/j0HFo+o9RoH1YliPUfIR36xf61qZf98JgnKcpZzMgcKRrvOAI5/
         591nC63/uNUtbJ1/mqDYSrznCILQZuwQNGgjV9lrGMfFZ6Vl63f8606894NYhgim3y0T
         qUUVXNSfYg5bc+o6qY3R5NuKQba7fvpkVIwN2sxY39ikIXOckt+nIE+49a018PgndwTt
         gYIayYojzILKMTFgGDQwAEOiiGOsHIqkg0dscPhCQD6UJJWwGztdbv/aozqGrpjoDK3h
         Sqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435922; x=1746040722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGPo16mSphfxbc3aNmKamBwbL4h4Z65tWk3KvEu3074=;
        b=ngVc/xPPJqS2mpjibA7bD2zFceJhaistYZwY3+amL3wadGadIBxrHFZev4qC9gJYpn
         /cSehLYV67flcR0z24gNwsIyGHvJMiY9W5uvtiALtcIefdWCPIAtrO5oUnZ8zjfWazFm
         FFHxcBSajK+czsUdIwFaoixZOckNGTLdS9SWtOaueVXv/QT5l0aSmqPRVlBxdEM5npEu
         fgmTtnroHNdkCh0Osa94YXLQSm97e7DOblqFuUl2EcXEx15cIHV5tijOn5z6IkW/597g
         MCBndZC3T/OAEtGqRiyti8a4mUWseHhhhQuRh1ytYVFSDXxb8gegZ9M94muNlQU5vWEH
         3Zyg==
X-Forwarded-Encrypted: i=1; AJvYcCUaFkdP+a7J9oedlkijj/tx9vj0RiC/YGd3d6YHxDDkFriSDv0GsNClomBkHlH22AvYdk3w5o057KpOA1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFWuU6/1jGGMNtWMzojKK+u6ZdXOfwd+D4UCenYNUCq094r/d
	b5GFLZUzLHplbSI9jmEN0FE+QOW5XZN2FOYuTgP3sPWZvDi8WMT2
X-Gm-Gg: ASbGncvoKIuT/wS3pltTFCh1JUFl1EI3ty5Yj0g0vsBdfwdWGaaoMVa5PuK+6Zg+Lfr
	1LvrSTtflwGstJ9Ljmrzx0rVwuUCfVHSza9AlRmQn10EUL97tJ6rdb1FXk55DXcKsnSsDONv7EN
	hzgo8/6rMP9FBXvT6YTqn+TEDjSwoyFQ/CvZOkOCB7rqSawVISwvbASHhRiUjIdXRZLJU2AwHPq
	wuHPFapV68siHOqJ2gay9MiaXdcUyK482D3GMwmXmyQicmeTF5ZLWlwO3oKBdom+/M4dcIvhHzd
	JtMfqJdf9c0Il/Q7ozvuucJOy0hFluvW40Euz0G5qHUARIJ9qGte
X-Google-Smtp-Source: AGHT+IFEvoxvIVnkqXQwSw6RMLr+CI8H7rnlskB3ZOddu5ASGlBOyFVAWwonlx4hYUUL7O+wc3NSrA==
X-Received: by 2002:a17:903:904:b0:227:e74a:a057 with SMTP id d9443c01a7336-22db1b3fe85mr9138715ad.44.1745435921710;
        Wed, 23 Apr 2025 12:18:41 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:41 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:18:32 +0400
Subject: [PATCH 2/3] soc: Add VIA/WonderMedia SoC identification driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-wmt-soc-driver-v1-2-bd8bf32521c2@gmail.com>
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
In-Reply-To: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=6371;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DsaNBg7kkCyMfyjSK+lMewVbgSsJc/88OwBkVoIMDfM=;
 b=DE0AJQzoN3d0lr5J/TlpMJOJnWCf/lankDlc7MJI71gwaU5NW4o0GUBO3lv74bEUeN0M1dmR2
 hfmZhBD39pkC2noUGj7WdwEuOuYaF9FVPF5MqEpEICR1YrVcZpTDg2N
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add a small SOC bus driver to parse the chip ID and revision made
available on VIA/WonderMedia SoCs via their system configuration
controller's SCC_ID register.

This is intended to select appropriate sets of on-chip device quirks
at runtime, as it has been found that even within the same SoC
version there can be register-incompatible differences, such as
with the SDMMC controller on WM8505 rev. A0-A1 vs. rev. A2.

The list of SoC versions is compiled from various vendor source dumps
and not all of them have corresponding mainline driver support.
Some of them also have been seen with varying on-chip markings while
sharing the same hardware chip ID's (as is the case with e.g. WM8850
vs. WM8950). In such cases the selection of names to use here among
those seen in various source dumps and chip markings was arbitrary.

Suggested by Krzysztof at [1] - thanks a lot!

[1] https://lore.kernel.org/all/14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org/

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/vt8500/Kconfig       |  20 +++++++
 drivers/soc/vt8500/Makefile      |   2 +
 drivers/soc/vt8500/wmt-socinfo.c | 121 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 145 insertions(+)

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 6a8daeb8c4b96cd29d56343b338a423140b89896..37ca3f094f8994c7e9c7c99c3ba47d168d41ce30 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -28,6 +28,7 @@ source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
 source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
+source "drivers/soc/vt8500/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 2037a8695cb2898659a434803dcdfa2d95b1dbd6..777255401252eab554f56bded7ff8ea5611704bf 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -34,4 +34,5 @@ obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-y				+= versatile/
+obj-y				+= vt8500/
 obj-y				+= xilinx/
diff --git a/drivers/soc/vt8500/Kconfig b/drivers/soc/vt8500/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..2b2350678c3f70297c51f94eb77674c01be773d8
--- /dev/null
+++ b/drivers/soc/vt8500/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_VT8500 || COMPILE_TEST
+
+menu "VIA/WonderMedia SoC drivers"
+
+config WMT_SOCINFO
+	bool "VIA/WonderMedia SoC Information driver"
+	default ARCH_VT8500
+	select SOC_BUS
+	default ARCH_VT8500
+	help
+	  Say yes to support decoding of VIA/WonderMedia system configuration
+	  register information. This currently includes just the chip ID register
+	  which helps identify the exact hardware revision of the SoC the kernel
+	  is running on (to know if any revision-specific quirks are required)
+
+endmenu
+
+endif
diff --git a/drivers/soc/vt8500/Makefile b/drivers/soc/vt8500/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..05964c5f2890989c1d794af4f5af10f849a497bc
--- /dev/null
+++ b/drivers/soc/vt8500/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_WMT_SOCINFO)	+= wmt-socinfo.o
diff --git a/drivers/soc/vt8500/wmt-socinfo.c b/drivers/soc/vt8500/wmt-socinfo.c
new file mode 100644
index 0000000000000000000000000000000000000000..81dd6f722ede35150289a0d87cf09b95d9446948
--- /dev/null
+++ b/drivers/soc/vt8500/wmt-socinfo.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 Alexey Charkov <alchark@gmail.com>
+ * Based on aspeed-socinfo.c
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+static struct {
+	const char *name;
+	const unsigned long id;
+} const chip_id_table[] = {
+	/* VIA */
+	{ "VT8420", 0x3300 },
+	{ "VT8430", 0x3357 },
+	{ "VT8500", 0x3400 },
+
+	/* WonderMedia */
+	{ "WM8425", 0x3429 },
+	{ "WM8435", 0x3437 },
+	{ "WM8440", 0x3451 },
+	{ "WM8505", 0x3426 },
+	{ "WM8650", 0x3465 },
+	{ "WM8750", 0x3445 },
+	{ "WM8850", 0x3481 },
+	{ "WM8880", 0x3498 },
+};
+
+static const char *sccid_to_name(unsigned long sccid)
+{
+	unsigned long id = sccid >> 16;
+	unsigned int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(chip_id_table) ; ++i) {
+		if (chip_id_table[i].id == id)
+			return chip_id_table[i].name;
+	}
+
+	return "Unknown";
+}
+
+static const char *sccid_to_rev(unsigned long sccid)
+{
+	char letter, digit;
+
+	letter = (sccid >> 8) & 0xf;
+	letter = (letter - 1) + 'A';
+
+	digit = sccid & 0xff;
+	digit = (digit - 1) + '0';
+
+	return kasprintf(GFP_KERNEL, "%c%c", letter, digit);
+}
+
+static int __init wmt_socinfo_init(void)
+{
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	struct device_node *np;
+	void __iomem *reg;
+	unsigned long sccid;
+	const char *machine = NULL;
+
+	np = of_find_compatible_node(NULL, NULL, "via,scc-id");
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	reg = of_iomap(np, 0);
+	if (!reg) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+	sccid = readl(reg);
+	iounmap(reg);
+
+	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENODEV;
+
+	/*
+	 * Machine: VIA APC Rock
+	 * Family: WM8850
+	 * Revision: A2
+	 * SoC ID: raw silicon revision id (0x34810103)
+	 */
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->family = sccid_to_name(sccid);
+	attrs->revision = sccid_to_rev(sccid);
+	attrs->soc_id = kasprintf(GFP_KERNEL, "%08lx", sccid);
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->machine);
+		kfree(attrs->soc_id);
+		kfree(attrs->revision);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("VIA/WonderMedia %s rev %s (%s)\n",
+			attrs->family,
+			attrs->revision,
+			attrs->soc_id);
+
+	return 0;
+}
+early_initcall(wmt_socinfo_init);

-- 
2.49.0

