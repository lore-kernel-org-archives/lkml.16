Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0081D327183
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645683; cv=none; b=M2JW4uq8N1dxIFciGSZMbNF7Uq1PVrLYMORhkUtbNniiKhYZfLVoUycNnMSaDZjKfizbpnR+EZEaAin0yFGALCRUS4fQmN9AaiH4WV+BVpHyE8NW+20zXUwoJ6m5LoZF9NK+/gwlh1BYqIz8mDQr5BPTbSANl77WWPk+0WGU/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645683; c=relaxed/simple;
	bh=iGKOR9K+IYXovU50dMFSM5PU98+O5pWxvmMYxBBblOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRYupOwZBRRP1AMMhS/B7eH8EX3dpSdX2KcjcTmEH3xJ4OkH4rIMQvihfRAU2t2gsok9f9mxCCKSWPq0rEPV4qXW/sOIJXJnAymtepwKhCq3/a+m4cjjKOKU24sReTwLDWq3SnSEbY9HH39gBaaLJracXObjnlkVEN9lZCmsXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TydEADM4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TydEADM4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1882305a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645679; x=1752250479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmGBN4vguwr7JXCGrQEzsAEtM0h76i9zDt+HmVvYfZc=;
        b=TydEADM4MVm+OZh9eQDE4/03G/rYKHzrXHz9OitNZciJtECYCIZDG4CemTCdT2tVvv
         TW2dGEcdtrvfEYcd6OfbchqTuJ61OKNXq/ItqULkK7BCzdLNyjECIybzRKwIbNgEaZHw
         25Upg49W7kMTpSjSTIQ2bSrtqgXTMa4f3zG+TsoaBk73g5+SkNo9utgeKDzpqMhClOQk
         5ZVsGwnhLlojkzZYEybKouPRO4dL2Qm9qIMP+z7094YDYUnYbZsXs+FHXYiJBLnHFMOK
         8aE4tobVWGmeF9Lr+copjy56jpNFz3j121dNM5bi94zZdFodDiC6mxfYjth3uz8/wgBo
         rneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645679; x=1752250479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmGBN4vguwr7JXCGrQEzsAEtM0h76i9zDt+HmVvYfZc=;
        b=r/EnVonjPii5lUjSNAArnFOK57HZzLv3Jk1RPzRkjEPqHx4Ro9NBvMo77rvtyS6jUD
         uk7an0lSjEwVQ1woswMK5FWmoVhFdQHBO4pmVD3DXOMi0QyDMr+FPtpa4TDPWYPkT4yl
         ICHV1tyboe5hEjaDyCnPW0yK6Q51fXBtBvsBnJZpjwD4hJ7vUhbYfWgZ0UM64/FA8xO9
         kOiSp3gk+JaEDcw7DVFCRcdi92n3bYygHVlYWCe5WZ5AcMmT2pa3ACyHaflGZQa5c0AM
         E8+5RetJ42QX3DqQpSpqpss8z1j9tauc77Q4s/Ta7ZlyFv6sGgKkJKcU3RVS0BrrFoGO
         D1vg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfqElTps73fnpRpDOXUniBQdnSlVdE01LUC1o2oJAhM8HlGW687fkPrFn9e2c5t+xdHTHDN+cnK+01f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUEiVUfibQm2eAg7NIQQBtDMyBl0YDmLk2F+4in7Agy+DBoxGR
	3oHLf3HHf/XvB5S5C1uU2v9/flQ3Lcl0HDLE7Q+rL8rjKJInaSHeZP2GWvogFOT8FnM=
X-Gm-Gg: ASbGncuaZkxrHMV80XKUiBOZqMaAchyAiqvqeCLoQkrezaVeC84LQcL8TrnE34LnYpq
	STD5r3Bokmem1DBtgDBg391TZ3JGw2glIhzQTqHHjTPYGG18b+nVMEaZywWXA8jpyk1yjUZmak4
	GuWw8ZcoU0pWR207AKXIfb3PFTaZsiw+S9rSQHB424rLFrsSIEyZRcTlCrr+YO1NvoWDMP9Z3vt
	iz1yvETZiwrFDeznAGeLdOmNPJ20VetJp5da4niPcdErXUpZoVizCf4mpQRVxG87sH8lezJyUYi
	BV3hzFlaSZkb746HiutkDscdWLuczkqfIeo0E6nstOB+sDvrnkwI3YLLR0SyPRzm8PXTtyhmnU1
	CwvkRHqyZbV2bDqo=
X-Google-Smtp-Source: AGHT+IGi14ev4epMFpAVcULI0O8fOQuvZidrlt+4KBmokmlyAj9zyscXUfCOlIWYAChv9XzOSvBlZQ==
X-Received: by 2002:a17:907:7ba3:b0:add:f189:1214 with SMTP id a640c23a62f3a-ae3fbc5b749mr340373166b.24.1751645679233;
        Fri, 04 Jul 2025 09:14:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 2/9] clk: renesas: r9a08g045: Add clocks and resets support for PCIe
Date: Fri,  4 Jul 2025 19:14:02 +0300
Message-ID: <20250704161410.3931884-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks and resets for the PCIe IP available on the Renesas RZ/G3S SoC.
The clkl1pm clock is required for PCIe link power management (PM) control
and should be enabled based on the state of the CLKREQ# pin. Therefore,
mark it as a no_pm clock to allow the PCIe driver to manage it during link
PM transitions.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- dropped the power domain support and added MSTOP as power domain
  code is not available anymore in the current linux-next
- adjusted the patch title and description

Changes in v2:
- none

 drivers/clk/renesas/r9a08g045-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 405907925bb7..4a6632ea22cb 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -289,6 +289,10 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0,
 					MSTOP(BUS_MCPU2, BIT(15))),
+	DEF_MOD("pci_aclk",		R9A08G045_PCI_ACLK, R9A08G045_CLK_M0, 0x608, 0,
+					MSTOP(BUS_PERI_COM, BIT(10))),
+	DEF_MOD("pci_clk1pm",		R9A08G045_PCI_CLKL1PM, R9A08G045_CLK_ZT, 0x608, 1,
+					MSTOP(BUS_PERI_COM, BIT(10))),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0,
 					MSTOP(BUS_MCPU3, GENMASK(8, 7))),
 };
@@ -329,6 +333,13 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
+	DEF_RST(R9A08G045_PCI_ARESETN, 0x908, 0),
+	DEF_RST(R9A08G045_PCI_RST_B, 0x908, 1),
+	DEF_RST(R9A08G045_PCI_RST_GP_B, 0x908, 2),
+	DEF_RST(R9A08G045_PCI_RST_PS_B, 0x908, 3),
+	DEF_RST(R9A08G045_PCI_RST_RSM_B, 0x908, 4),
+	DEF_RST(R9A08G045_PCI_RST_CFG_B, 0x908, 5),
+	DEF_RST(R9A08G045_PCI_RST_LOAD_B, 0x908, 6),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -340,6 +351,10 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -356,6 +371,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a08g045_mod_clks),
 	.num_hw_mod_clks = R9A08G045_VBAT_BCLK + 1,
 
+	/* No PM modules Clocks */
+	.no_pm_mod_clks = r9a08g045_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a08g045_no_pm_mod_clks),
+
 	/* Resets */
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
-- 
2.43.0

