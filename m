Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723D274656
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916572; cv=none; b=qDHfNrKqMzVe6kSxKfdSqnVzLIL9is+hpVgGwa2zkMe47cqU856Of1YPmoJ6kAnjJn6f4u/vpD3pl66nmgZcSqcnKY0ahb4EVKSvoZRIYgQVIyJk5dITw8swvJEfTCUDYJeS/8BEZiEGhRzW1cxgjYUa4l8Rhg/qeTrklEvtaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916572; c=relaxed/simple;
	bh=Y+YNRUn6nDZXhgPRqJFgkRV9JHzCFOUktj/ZS6hwyk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWoXkCUq7sQjSvbYk7Z7SrcWX7A3P/L1KGeQabPtYsvT7BJAeIP+Ui2E2N8uouENTw6QEXtbFyUDS91fTeK+mh4kgwq0ZU7cEN1juyDiPSQ7bsyeM7AorQdboGIgOvibL+t12GNwUTP4+KhmibNCYY3iL9Ra591yLVZ7dL2NRzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+f8gO3z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+f8gO3z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so8202618a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916568; x=1746521368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeYXWrbDPIe582+hLadmsueMm8iAc4fIl9vPeooNz1Q=;
        b=o+f8gO3zg86yMf7PRy/hKy3Q8QN1lyR4U0oZeFQ2kKFDDXAf8xF2EbSIthbigHdk6d
         MDqj4DRVJFCcLGhBPFdn0ui8+43JX3xoiScFVtwQjQbHeUrTZCyrifa9XpasH0TBPvLX
         oo5eggU/EWw9hr81wviug5HN9iXC2StIeXipa/ww//E7UX0Ow9F7Y7UVJWwb7ho9lO6J
         03uFsTvdfH0vEqJtS4o6RaAYqZZgAodqBB+77IzFBGzBs58LUqgnwJnUM2NFQOyhvH2H
         eSytkJTblKVj0jHwNkRk31L1cPPavxUMpilZHT69f0721R+iv6ZueShIn0+gduBYKOor
         GQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916568; x=1746521368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeYXWrbDPIe582+hLadmsueMm8iAc4fIl9vPeooNz1Q=;
        b=tYY92n0jZQGQsti2Mv4LzdgTOzRZtp+kRWcuoUaSKBFSxxuhCA6eI9eaOPGM1gACtF
         O432Jea1qOFhPzBr5aGZH62yUQq/Q7alhW9DPTrMrpbWA1/Ra6UAaPFQcwgJbNF/Q2Rv
         CVDt6/EgqCC+gvmGRkiE+jxxp4sS7bT2vjD/BqLXE0iYxt4hwbX1olxuae1QDSIzo50r
         kzrYOQljWswwfMfeK8h99M8fuQ2HdVVFE9faFuEHnk+xN/GAWTuY9dUsjnOW2zMllLWz
         WtHqLMSjFRCYxwMRuii9PvAYsCj9Lyrcw2OtRtc6K1q3b9xM8ltnuuNmsDo9LvRSy41f
         G1Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUxFYHc50bwAw0nmyWcEfFRh/ciHEWHrfDap+G+KykzE4RRcywkX0aU6BFTKZLX5UerkL4bTt0cPFkEYkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiKVAi/6uNluJYp938K7sfQU+g6GALNVj6sIMLyNsw/8cmpJY4
	UmFxfj768B/vapGsKiWL0ADQjkHiIdoWQz72FyX8wyq4HCJvbBIeFdlqZdBU1d8=
X-Gm-Gg: ASbGncv48FU/YaaB2SVh/T36z384qGBNNwCLc3QXAsF/UWSmA37xoijK969CmQDXSRD
	xQDbgdYZhFCVOLLCJ6PgfsOS/uRjXW/Uf8pKcudZp7ZHgpNU8xG31XMpgdyltDkNSRP8wPJvg6e
	6fF0WwrLmZl2FgSR1wpZtkMlLn9ECGk+IA3jfItnHmwxXtfkocpyp/aQ5rhJq7rM+03kd8JUloV
	Oxo+iFfidO0VQmzV5FMAx3P/4QvifIEi5tyN8zB7hx6LnU7SCrxjuWS85fvgOYtUl2Q20+PXv3I
	Clq1ux0CJPXQFHuwXYR2p8qZfWsN6jx+jFPxUXJJBvPhXLhPlKw5JckPQdEkHerzY/4JU8sYwRe
	hK3iPDRitGE+J/21CdL6Rc51X
X-Google-Smtp-Source: AGHT+IFzsdzLq0N4FqNybCrqo3s1JLy/WZZPcFkAEx21WO1BYxDl4k17etxA0M+ge3novFvtYXCeWA==
X-Received: by 2002:a05:6402:2685:b0:5ed:599a:3cbe with SMTP id 4fb4d7f45d1cf-5f839224516mr2358189a12.4.1745916568451;
        Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:49:25 +0100
Subject: [PATCH 2/2] phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP
 where appropriate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-exynos5-phy-field-prep-v1-2-39eb279a3e0e@linaro.org>
References: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
In-Reply-To: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Commit 9b6662a0f715 ("phy: exynos5-usbdrd: use GENMASK and FIELD_PREP
for Exynos5 PHY registers") added FIELD_PREP_CONST() in many cases
where FIELD_PREP() would have been more appropriate. It also switched
existing uses of FIELD_PREP() to FIELD_PREP_CONST().

FIELD_PREP() is the preferred macro to use whenever possible while
FIELD_PREP_CONST() is meant to be used in constant initialisers.

Switch (back) to FIELD_PREP().

Fixes: 7e6c2ffe6c22 ("phy: exynos5-usbdrd: convert some FIELD_PREP_CONST() to FIELD_PREP()")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 62 +++++++++++++++-----------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 4ea1fabd4d6f9c9fe412f17d4d26be07724b6361..6cbe563a7bd0449248d6b41c4f6785c91ccc47ba 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -540,8 +540,7 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 
 	/* Use EXTREFCLK as ref clock */
 	reg &= ~PHYCLKRST_REFCLKSEL;
-	reg |=	FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
-				 PHYCLKRST_REFCLKSEL_EXT_REFCLK);
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_EXT_REFCLK);
 
 	/* FSEL settings corresponding to reference clock */
 	reg &= ~(PHYCLKRST_FSEL_PIPE |
@@ -549,24 +548,24 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 		 PHYCLKRST_SSC_REFCLKSEL);
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_50M_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_50M_REF));
 		break;
 	case EXYNOS5_FSEL_24MHZ:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF));
 		break;
 	case EXYNOS5_FSEL_20MHZ:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF));
 		break;
 	case EXYNOS5_FSEL_19MHZ2:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF));
 		break;
 	default:
 		dev_dbg(phy_drd->dev, "unsupported ref clk\n");
@@ -590,8 +589,7 @@ exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
 	reg &= ~PHYCLKRST_REFCLKSEL;
-	reg |=	FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
-				 PHYCLKRST_REFCLKSEL_EXT_REFCLK);
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_EXT_REFCLK);
 
 	reg &= ~(PHYCLKRST_FSEL_UTMI |
 		 PHYCLKRST_MPLL_MULTIPLIER |
@@ -647,8 +645,7 @@ static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 	/* Set Tx De-Emphasis level */
 	reg &= ~PHYPARAM1_PCS_TXDEEMPH;
-	reg |=	FIELD_PREP_CONST(PHYPARAM1_PCS_TXDEEMPH,
-				 PHYPARAM1_PCS_TXDEEMPH_VAL);
+	reg |= FIELD_PREP(PHYPARAM1_PCS_TXDEEMPH, PHYPARAM1_PCS_TXDEEMPH_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
@@ -669,7 +666,7 @@ exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(struct exynos5_usbdrd_phy *phy_drd)
 
 	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
 	reg &= ~SECPMACTL_PMA_REF_FREQ_SEL;
-	reg |= FIELD_PREP_CONST(SECPMACTL_PMA_REF_FREQ_SEL, 1);
+	reg |= FIELD_PREP(SECPMACTL_PMA_REF_FREQ_SEL, 1);
 	/* SFR reset */
 	reg |= (SECPMACTL_PMA_LOW_PWR | SECPMACTL_PMA_APB_SW_RST);
 	reg &= ~(SECPMACTL_PMA_ROPLL_REF_CLK_SEL |
@@ -799,15 +796,13 @@ static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 	/* Set Loss-of-Signal Detector sensitivity */
 	reg &= ~PHYPARAM0_REF_LOSLEVEL;
-	reg |=	FIELD_PREP_CONST(PHYPARAM0_REF_LOSLEVEL,
-				 PHYPARAM0_REF_LOSLEVEL_VAL);
+	reg |= FIELD_PREP(PHYPARAM0_REF_LOSLEVEL, PHYPARAM0_REF_LOSLEVEL_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 	/* Set Tx De-Emphasis level */
 	reg &= ~PHYPARAM1_PCS_TXDEEMPH;
-	reg |=	FIELD_PREP_CONST(PHYPARAM1_PCS_TXDEEMPH,
-				 PHYPARAM1_PCS_TXDEEMPH_VAL);
+	reg |= FIELD_PREP(PHYPARAM1_PCS_TXDEEMPH, PHYPARAM1_PCS_TXDEEMPH_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 
 	/* UTMI Power Control */
@@ -838,7 +833,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
 	reg =	LINKSYSTEM_XHCI_VERSION_CONTROL |
-		FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
+		FIELD_PREP(LINKSYSTEM_FLADJ, 0x20);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
@@ -1145,8 +1140,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 	/* Use PADREFCLK as ref clock */
 	reg &= ~PHYCLKRST_REFCLKSEL;
-	reg |= FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
-				PHYCLKRST_REFCLKSEL_PAD_REFCLK);
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_PAD_REFCLK);
 	/* Select ref clock rate */
 	reg &= ~PHYCLKRST_FSEL_UTMI;
 	reg &= ~PHYCLKRST_FSEL_PIPE;
@@ -1169,7 +1163,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	else
 		reg &= ~HSPHYPLLTUNE_PLL_B_TUNE;
 	reg &= ~HSPHYPLLTUNE_PLL_P_TUNE;
-	reg |= FIELD_PREP_CONST(HSPHYPLLTUNE_PLL_P_TUNE, 14);
+	reg |= FIELD_PREP(HSPHYPLLTUNE_PLL_P_TUNE, 14);
 	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYPLLTUNE);
 
 	/* High-Speed PHY control */
@@ -1187,7 +1181,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	 */
 	reg |= LINKSYSTEM_XHCI_VERSION_CONTROL;
 	reg &= ~LINKSYSTEM_FLADJ;
-	reg |= FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
+	reg |= FIELD_PREP(LINKSYSTEM_FLADJ, 0x20);
 	/* Set VBUSVALID signal as the VBUS pad is not used */
 	reg |= LINKSYSTEM_FORCE_BVALID;
 	reg |= LINKSYSTEM_FORCE_VBUSVALID;
@@ -1350,7 +1344,7 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	/* Set VBUS Valid and D+ pull-up control by VBUS pad usage */
 	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
-	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
+	reg |= FIELD_PREP(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
 	if (!phy_drd->sw) {
@@ -1367,19 +1361,19 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg &= ~SSPPLLCTL_FSEL;
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 7);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 7);
 		break;
 	case EXYNOS5_FSEL_26MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 6);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 6);
 		break;
 	case EXYNOS5_FSEL_24MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 2);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 2);
 		break;
 	case EXYNOS5_FSEL_20MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 1);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 1);
 		break;
 	case EXYNOS5_FSEL_19MHZ2:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 0);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 0);
 		break;
 	default:
 		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",

-- 
2.49.0.901.g37484f566f-goog

