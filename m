Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776122A810
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603992; cv=none; b=AFT4Otx0O3jDNqwIwcaPNC1b/vy3XgT7fwnmeIVE7yuDDjOfTtCGJuIzGEbzpscTQ6rv3rvJzQDOZ3AyroS5qPhEN827d8J91fqrlxDzOfNdMujrVY7JdZRKg5DZ+jyGDbT8xXwf9bL3jFtRGy2UCwjtKsqZ20eOk8b6QLCliRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603992; c=relaxed/simple;
	bh=Ah7Z+DsWBX06w3bVvtMO0K5BDNvk6TjZ7R8qbml2dpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGwBnibUqNXDNoFNEgVHBxLxdbbLRT5G8YTE2WF+kCIrZsBq+AFT4qqm8j9HKR02+X4m7A1DG4bk1wyxRtH2P4rOMfKRLnPngLMxOXCRKK1jQrYH5PSA7Qr38AWY6M7a4h6MNadJ5dJPTpzPzwkA7K53ThTn/ZybcMZuR10pEfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DjpVjCES; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DjpVjCES"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a375888297so1140505f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603988; x=1749208788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=;
        b=DjpVjCESWVc0Bd1YTeQkSuYLD6nXwsQyhHj0r20Nam4ljGqxhIFc/xaH3O4lnlEgTI
         eWLS7i+0uGEnmpQFva5kbbmlnGXt+WB4ktVk3s/Xq190MupoyXKkWBQNposG8m6xfId+
         ggHGPu1iK1SxLp5KvSCcjHhpLoR6C340WgEsek4oxWJTnUP5lP8IeNQ7EHsfx8w81x2a
         3eB+aGjk6rD/zOQzk9Wpse1wu5lxlwyBAfC5NJ1RdQyGp2NK+oyZ7jeEfY6BpGR4CXWb
         eXgtuYxaAai4JHU0Zn4H2LjHBx55aZelEZF+i1nXotaHW9TvOZb+69UKSWf3OH32JTqQ
         aJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603988; x=1749208788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=;
        b=ajweg1RQBy83arwZpJF5TyBCCmMKtpAm0LLchvCFxSonJhRvoODDqgqqoCvoMLS2vo
         UuZ0xr0L0afs6b7mFHfWcV25OGi88hiiPC+Y7hPG1ozj2+JUgfkkC3aEUj3z/LeCfRBa
         WzcVEbDwQ9Ak7Wb1MxrKG1dVH1EzC1BPWWOvnB/nwPNdBuZm15cU7i8D7arLNEyGF4uY
         HXZbvXPM2Fu70E0NNDya0Sb31c7qZ5BLbxpj78ktWsnDkUvntt0nkgR6sqjV2CLremZG
         ekSfdYoveKObqybvHlvAcvP4l1LooOuIPbdL/EkT9uYaDiS8vpeQO1IEkSO6ugDFNvWS
         M0ag==
X-Forwarded-Encrypted: i=1; AJvYcCUvQG9CX4mkcp+/4OzbgUIy6XoEezMNNvw1zpPH1lYWLskkBLUVwijgxMDXT/4cjPlYq3Gt31AXkJBRfGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNkac+tBvv16u2n0Y6mRyQlnWDFrY9zBDQbqPhiLJE30xekhE
	fTvEkAtPJxGgUxgmXQ6hYApFpaO53EU5TUaTAOIFUwlNqmAHKzuMAPjRHF965y9K4zU=
X-Gm-Gg: ASbGncsN90XHkUnwU/adJUfFhfrm5m5HWdshI2XYQtABDqKf4zNiIeAANOvh2kUJyz/
	vw345c9JG8kM/+VKbZKGB/SKSMVr5nME0+89W7UnEIige3SIsGGBwh9phnRjYB4H9u+VDlSGt5r
	gHX6o7hxUPJVMt6OYwcFdRsWvzhnphPL7S9oa2eYVjUt1iAx+0S3xnv56n6g1YXbGlOqwJrRQsA
	KHtSRiOaRnRvo1cDcm2IMTgsqSLRIaqsjxDUrAqF+2HoFPtPuZuoK6kQpmPylMFvgeJFiG37W4Y
	IYBva4mz8lh6TKMwP0Zt0Li8/8h9TNvh9AxXvjZ2DF8eG7g1JMjKnwt0rv00rD6eBoN1ezRM6P0
	s1IOWnA==
X-Google-Smtp-Source: AGHT+IHmpme3ASdZjXhpIgvfrfPC8BzS2kR2b9/W6J51HT2LhURSK9ofZ+2PJlI42CY77vECWpRGwg==
X-Received: by 2002:a05:6000:4029:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a4eedb8a81mr6645254f8f.23.1748603987781;
        Fri, 30 May 2025 04:19:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:47 -0700 (PDT)
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
Subject: [PATCH v2 2/8] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the PCIe
Date: Fri, 30 May 2025 14:19:11 +0300
Message-ID: <20250530111917.1495023-3-claudiu.beznea.uj@bp.renesas.com>
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for the PCIe IP available on the
Renesas RZ/G3S SoC. The clkl1pm clock is required for PCIe link power
management (PM) control and should be enabled based on the state of the
CLKREQ# pin. Therefore, mark it as a no_pm clock to allow the PCIe driver
to manage it during link PM transitions.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/clk/renesas/r9a08g045-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4035f3443598..33219164a19a 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -243,6 +243,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
+	DEF_MOD("pci_aclk",		R9A08G045_PCI_ACLK, R9A08G045_CLK_M0, 0x608, 0),
+	DEF_MOD("pci_clk1pm",		R9A08G045_PCI_CLKL1PM, R9A08G045_CLK_ZT, 0x608, 1),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -282,6 +284,13 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
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
 
@@ -358,6 +367,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
 	DEF_PD("tsu",		R9A08G045_PD_TSU,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
+	DEF_PD("pci",		R9A08G045_PD_PCI,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(10)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -365,6 +376,10 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7)), 0),
 };
 
+static const unsigned int r9a08g045_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -381,6 +396,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
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

