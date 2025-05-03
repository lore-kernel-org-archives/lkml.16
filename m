Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0691EFFB9;
	Sat,  3 May 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273175; cv=none; b=tuCpTh0Bg6BvxJol9PHRyLy7JwQlX/w3mf8x/FGdt4GRvxRq7mrg3lsUUihADPfTMOyW1EwtwcIHNmzsNs4hrviv5W0z4t7kg5M8ttyCmu//knbExRtFWgFXlUmfYbHD9NXz3wnIFKyvz3fC1x0cbvQOO+RmzIFFTIVA/sxQTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273175; c=relaxed/simple;
	bh=2eWns/mvd2DOjO4WQsDwacWvY07f8ZzkBblZGzu9jjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aegWuXP6f9p4ogF91uMIVEYuzV4bXMPIlPogpUv6SAi0YuTyBd9y1Q63sy6xkF/GV4qTP1vBGJThT/+K+f22wWwhN5YozkvHczhG9f+okv0k89zvcapIK7JKDeU7e2YTgoI6mIRxVmfO0DOO6YHmG+WTVLRct/ANXilyfWXGI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afGJAXI2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afGJAXI2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so3268817a91.1;
        Sat, 03 May 2025 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273173; x=1746877973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqT9icyH5L3HVEZ++wzzfeTDQafQM9FU6JdKrhZWgZg=;
        b=afGJAXI2UvDE/vZPy2SWQ1JswBf8nrRyYE2BZDR4QfzAUWvA8iV6xPMQV56oHDdLqj
         a7dcCKor+043aAZyi7weRucbSuQ+vDSt2Mw81CAQ63CN6/Yx9rGSNdQ+ZC9WCY25ctLA
         bRgI6gULfKt2zrSSaYNPedgCclLmlj6adyai1mYSg8Wg0gtXILN+5z4VnD3KxW8Be3TN
         8dJAg1bR1Epa+qec2HcDg6wSg6YRfJXpiAtDqVfE59TDpKDGwFGueQcJ8xaw5zv3MupF
         DcOuY2ARyTfP+caxyneV0O0CaCOT8cyMX2qX18t6LERhkl01uIfPfpSJVUEuNfoiOVOn
         CgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273173; x=1746877973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqT9icyH5L3HVEZ++wzzfeTDQafQM9FU6JdKrhZWgZg=;
        b=pPkGwMueEuwZlUyMXoTpxfs/3QAV4Aq/JiWvz8kVp5Hh2vbGn6nqbzEIaoJYGskSIK
         deG1kBcku1tsR4wCkEaEmEq6EpXLNrSXGlxeoctKJEtAZBBNdnM4uiuQoIM3JnHLHX7e
         UbGQZrg4/tol/7L8S7B0Ru9hXIwc52wvvUnzGDP7At94uf+kDnw5xopXQEmMNM6BH26R
         iSZOoH5BBXKDy3AmIdhFIsZAYQYblRbMFElmu/IpAQDS/tIyhnwSky4pryO9XYasHXLS
         JH/VOkSIwy8rUD+ihulfKodqziPuXA5tyaClHbgWdqVuUM/YQOt8Shh2/Gf9WX5NKEIm
         c+rA==
X-Forwarded-Encrypted: i=1; AJvYcCV9VaHHrWREayz9zg5j/3P0oQJUcwNetsrmqNzUnZNJISHyF0fcuiJ+FH/mzyDwsH/Jm/K7Q1gDS/hi4lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypvtDWG3pqC03Olq1pdJdtmWBPbpb+VEvLjhpFjp6XsbP1nAbb
	79W/Vd2XI2mvISxb7WMkMFDOICZ4Tx/AhV5RBjQt4+oqIuU2Ss9pJFawZ7K5Ml4=
X-Gm-Gg: ASbGnctt91Q0Sbfdrdl8O+NOefMLPQDLZ0PnsejgEHQDAMuFlNa4MkpXf2n2docUiBO
	q7HtN6AN62Z6DrCQVxILikXTlGYakx1pQWwSDLvrOFCFvCpvHfaapYx8kUCM1zm1hRNU5dnHhu5
	TdAdrkhkw1DklTn+nyO4CdYNvnd0SgUsQmWO49atJtuknVOybY6fNsjyxMzxYPE8dinc9pTZsxp
	Z7F5p4eBHACUosY9x+AJ7L+6qtCfgHAUv92pJgqIG1uH+MgmyKxK/szwoQBYJ/V5X0Sh1nzeoMW
	3Cw6v5cMOMmMmfxZPNfUAUcTmw5eyCYosItl19aLLaFjY4oq0bHW
X-Google-Smtp-Source: AGHT+IHQhvoRErDN2QCfzbLkAlmsUP77fmt4s0T6uEiLCc40SI8a0i7UcGlUXSUwhazGx7urCpWHGA==
X-Received: by 2002:a17:90b:2550:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-30a619a1991mr1084307a91.21.1746273173005;
        Sat, 03 May 2025 04:52:53 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:52 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 15:52:32 +0400
Subject: [PATCH v3 2/3] soc: Add VIA/WonderMedia SoC identification driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v3-2-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=6618;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2eWns/mvd2DOjO4WQsDwacWvY07f8ZzkBblZGzu9jjc=;
 b=je2W2HPA4ou65jbIZvmq1kg8oZAW69kfNCMzwVGRXD7ac4c2cPuIJOyp+RC7+uaGoBK+llxSZ
 KfinPCF0hlnBh2j9ig/N/l5fzhHZaJD3vbjo4vUdxpyCnfYqYjWaDr+
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
 drivers/soc/vt8500/wmt-socinfo.c | 125 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 149 insertions(+)

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
index 0000000000000000000000000000000000000000..461f8c1ae56ee367dc2c84a58ff8fada0dfdaed0
--- /dev/null
+++ b/drivers/soc/vt8500/wmt-socinfo.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 Alexey Charkov <alchark@gmail.com>
+ * Based on aspeed-socinfo.c
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sys_soc.h>
+
+static const struct {
+	const char *name;
+	const u32 id;
+} chip_id_table[] = {
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
+static const char *sccid_to_name(u32 sccid)
+{
+	u32 id = sccid >> 16;
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
+static int wmt_socinfo_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	char letter, digit;
+	void __iomem *reg;
+	u32 sccid;
+
+	reg = devm_of_iomap(&pdev->dev, np, 0, NULL);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	sccid = readl(reg);
+
+	attrs = devm_kzalloc(&pdev->dev, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	/*
+	 * Machine: VIA APC Rock
+	 * Family: WM8850
+	 * Revision: A2
+	 * SoC ID: raw silicon revision id (34810103 in hexadecimal)
+	 */
+
+	attrs->family = sccid_to_name(sccid);
+
+	letter = (sccid >> 8) & 0xf;
+	letter = (letter - 1) + 'A';
+	digit = sccid & 0xff;
+	digit = (digit - 1) + '0';
+	attrs->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					 "%c%c", letter, digit);
+
+	attrs->soc_id = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%08x", sccid);
+
+	if (!attrs->revision || !attrs->soc_id)
+		return -ENOMEM;
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	dev_info(&pdev->dev,
+		 "VIA/WonderMedia %s rev %s (%s)\n",
+		 attrs->family,
+		 attrs->revision,
+		 attrs->soc_id);
+
+	platform_set_drvdata(pdev, soc_dev);
+	return 0;
+}
+
+static void wmt_socinfo_remove(struct platform_device *pdev)
+{
+	struct soc_device *soc_dev = platform_get_drvdata(pdev);
+
+	soc_device_unregister(soc_dev);
+}
+
+static const struct of_device_id wmt_socinfo_ids[] = {
+	{ .compatible = "via,vt8500-scc-id" },
+	{ /* Sentinel */ },
+};
+
+static struct platform_driver wmt_socinfo = {
+	.probe = wmt_socinfo_probe,
+	.remove = wmt_socinfo_remove,
+	.driver = {
+		.name = "wmt-socinfo",
+		.of_match_table = wmt_socinfo_ids,
+	},
+};
+module_platform_driver(wmt_socinfo);
+
+MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
+MODULE_DESCRIPTION("VIA/WonderMedia socinfo driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0

