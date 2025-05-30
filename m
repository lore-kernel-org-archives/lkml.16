Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E5226D0B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603989; cv=none; b=SKyzh1DOQ1L+cqUY44unkWIV9h3FHQDh5HMZiwiFYFjL1QfCcqrZc/dBA5iTCjpNVvc4BGPt6R5L+oLWcom5nx7BIL7KyDRi1lc+bf9o2mT2yQvGnjoGCwFCfklHD+k/b7Fr+XxGnjtWTYSSJk7gcuFCI7PltSDCI4u7auMh9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603989; c=relaxed/simple;
	bh=9gMdTLQyNxVz7af3fV90ZGtGbx4kngU4HShq2JFBz3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duh89a7BIeaxnHrj78xl0oBTKYRtfJ9xeDr7i1BvsAmfr2xlUTJY3Jod3MgoD1I0qCJcD2De9+faMgGCtbX12TyCv0tjHyci3YxjiLGYsdge4qD8jwFPi6iqSwdn+CYcFOlZWxB7T97zljGjQWv4jo0xaYl0nJLyJ8bC1+ZI+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RVjWQ0ps; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RVjWQ0ps"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so15637615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603986; x=1749208786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gq3kcPvzJsccZDf4CUDvMYgsYUhJg6mS1FeaP1e3W0=;
        b=RVjWQ0psJ3ytgrKa2M7/4bsm3/zExuTE5ddGWayoTbRe7S1AmCf8D+g1WlmOB9JjVl
         4oA00orTEDAdVw76NqL4pDe37U9ySUWdzHhxd9LWCzeo4IQbmr9h0cTCxLcr85vYWv9D
         AOnlwBunRT8dMW2QhZkdMPMQrKi3+AIxG8dIek4JfhsP+xpPNSYYPsqIS0xPHLzutw0I
         SLdq8qlztMW+X5Mhj16Rj4piA5lALEYg7F2A2rAmOxitXFw68TyirDFZV33m1e25f3t5
         Ww2vHC/OxsNQn8/NMtdU23OJLlJxP1oa91Q8bpn8HGkxe7mYCVjcojAcNWUz2GnHjHNO
         qtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603986; x=1749208786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gq3kcPvzJsccZDf4CUDvMYgsYUhJg6mS1FeaP1e3W0=;
        b=GCY5LzHpB5SCv7+tL33B3NT3m0xqtxQF3LnFwh8R4sgm9EXxDU3rVJgCy74Un+KX+E
         o+rTeVa1D2q6bLyTly7X2W9fmuL0H9O2N3Kp4Gud4/RURIYsoOhFPj+IhlIrKDXbXRRR
         D6ozF8JKh1mmxpHI5CKpJmIixb1W/JQVpkb4CEMLxcTZ50g0zxK0s8qhrNN08Hk5IE00
         7A6qpPetuGlHuUMByUr9htkKSMG1HOBdAzYHtHX2TlqPLoqSW2Cmw4IF5RdM9QEa4O9O
         AFbB+dgKGpIDroyRDs9u0Cc/NdbNfOnS9Zcfgfn/HoVJRPi8q2LxPje4kdKj+09OPKbs
         /m9w==
X-Forwarded-Encrypted: i=1; AJvYcCVRu4OUpFhxxpoHfyGWrkj/8k5aJwFrPszmt8ocQ6ZyGloTULhhnKRWNhrIiuHwb60d4ZfQQNlNpYfVuLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0VM1XSBFhPcjiYeeUSHaM27Wlsv/WQ4mVFT5tJ2Iu4yR/N64
	nNuGAmi6ARzf9HO919zP+9AUOHZHEa1L3l9KW0UMRwWE79Xtp+LkAxEy160n64ZGPfw=
X-Gm-Gg: ASbGncsH5qRAIDF6OMmU8vvQ5oZCZEc9BVL2CxNMF/9OKFJ9EO1jZoKXdHitxfdMRJ3
	99vOoB1sL9IcxfAHCTkn87oiP39PQ4oPFjL6OXyCWBIj2bPglxO4qzwqu48jNGUBWQd4O/dcKIo
	9NqOanwE2+a/qv9vuIYQT0JQokiTH3utC07qfJZZrn9koONH4W9PSMhc6fLQG48XBpzerT265J/
	Xl2MEnLWrCbvW4AyTNn6C5YpRMME1EbyNERpCLEvv2x9MhxpiOsuVMdE9M4jFFRsEX8odqvHhzI
	z/00mUFKmWyqxPJF46qNPN2ZMspO8EffdMkSJ47VJ7VT3ulgHvs8urgW4b2nTLCmFpeBFd9voDJ
	0acQFNSbR+A5ql56R
X-Google-Smtp-Source: AGHT+IHxP8yrQk0faz+i2kakVOIuZar9snW+APNS7fIiJYJ6lw0GyyoJSXv4ka1hHNrf4oEIpPYSzQ==
X-Received: by 2002:a05:600c:4f4d:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-450d65338acmr30683445e9.9.1748603985804;
        Fri, 30 May 2025 04:19:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/8] soc: renesas: rz-sysc: Add syscon/regmap support
Date: Fri, 30 May 2025 14:19:10 +0300
Message-ID: <20250530111917.1495023-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Madieu <john.madieu.xa@bp.renesas.com>

The RZ/G3E system controller has various registers that control or report
some properties specific to individual IPs. The regmap is registered as a
syscon device to allow these IP drivers to access the registers through the
regmap API.

As other RZ SoCs might have custom read/write callbacks or max-offsets,
add register a custom regmap configuration.

[claudiu.beznea:
 - s/rzg3e_sysc_regmap/rzv2h_sysc_regmap in RZ/V2H sysc
   file
 - do not check the match->data validity in rz_sysc_probe() as it is
   always valid
 - register the regmap if data->regmap_cfg is valid]

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- picked the latest version from John after he addressed the review
  comments received at [1];
- I adjusted as specified in the SoB area

[1] https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/

 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c | 10 ++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  | 10 ++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 10 ++++++++++
 drivers/soc/renesas/rz-sysc.c        | 17 ++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  3 +++
 6 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7..f3b7546092d6 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -437,6 +437,7 @@ config RST_RCAR
 
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
+	select MFD_SYSCON
 
 config SYSC_R9A08G045
 	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..0ef6df77e25f 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -18,6 +18,16 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 	.specific_id_mask = GENMASK(27, 0),
 };
 
+static const struct regmap_config rzg3s_sysc_regmap __initconst = {
+	.name = "rzg3s_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0xe20,
+};
+
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.regmap_cfg = &rzg3s_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index cd2eb7782cfe..a3acf6dd2867 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -62,6 +62,16 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 	.print_id = rzg3e_sys_print_id,
 };
 
+static const struct regmap_config rzg3e_sysc_regmap __initconst = {
+	.name = "rzg3e_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x170c,
+};
+
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.regmap_cfg = &rzg3e_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 4c21cc29edbc..c26821636dce 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -62,6 +62,16 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.print_id = rzv2h_sys_print_id,
 };
 
+static const struct regmap_config rzv2h_sysc_regmap __initconst = {
+	.name = "rzv2h_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x170c,
+};
+
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+	.regmap_cfg = &rzv2h_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index ffa65fb4dade..70556a2f55e6 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -6,8 +6,10 @@
  */
 
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 
 #include "rz-sysc.h"
@@ -100,14 +102,19 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
 
 static int rz_sysc_probe(struct platform_device *pdev)
 {
+	const struct rz_sysc_init_data *data;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
 	struct rz_sysc *sysc;
+	int ret;
 
 	match = of_match_node(rz_sysc_match, dev->of_node);
 	if (!match)
 		return -ENODEV;
 
+	data = match->data;
+
 	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
 	if (!sysc)
 		return -ENOMEM;
@@ -117,7 +124,15 @@ static int rz_sysc_probe(struct platform_device *pdev)
 		return PTR_ERR(sysc->base);
 
 	sysc->dev = dev;
-	return rz_sysc_soc_init(sysc, match);
+	ret = rz_sysc_soc_init(sysc, match);
+	if (ret || !data->regmap_cfg)
+		return ret;
+
+	regmap = devm_regmap_init_mmio(dev, sysc->base, data->regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return of_syscon_register_regmap(dev->of_node, regmap);
 }
 
 static struct platform_driver rz_sysc_driver = {
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 56bc047a1bff..447008140634 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -9,6 +9,7 @@
 #define __SOC_RENESAS_RZ_SYSC_H__
 
 #include <linux/device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
@@ -34,9 +35,11 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @regmap_cfg: SoC-specific regmap config
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	const struct regmap_config *regmap_cfg;
 };
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
-- 
2.43.0

