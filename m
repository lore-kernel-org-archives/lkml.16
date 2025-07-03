Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41144275845
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579611; cv=none; b=J7sxV3pmdnitCZ2QmrChX4LrzqKWemREfn6J2QUtJawizxQz107VJcFNrwNfFhy/yeUgBjA3DzloWW5IgPqmqWq16cJs+Ky+XKMw74SDcBlFDBXpW280BCnBsVh5tk2G0Y8/n7+7K8v9i6SZdcqC/shXYSIXJNKAFOn5ncchs3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579611; c=relaxed/simple;
	bh=gReumBugAMPkL+f0s/yNu2rliKIaTFJgDBbHJ0cCnSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lDSGaV1UcqqH4y8v49TZHO1I32lzxm+iAvoe2RyZiQ6ix8L1NL6qVrmQKO3lljzGbfDKxHccKRr2Zm2z7CcbZH83hr4VRLq+lCCA+lQVEwL5sCuPJpYJCE4hxpH/zF6IStICbmjMhIJWQV5wpsYUtMxqhdV6aJaufDza/b3E784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gt4BOjmB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gt4BOjmB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e1d710d8so5539245ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579609; x=1752184409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxuuX3SmTe/KHiGqxZf5tezD/Xp394VdI3B/HTH6SAc=;
        b=gt4BOjmB9j30Xk/N0Ky0uhOdLnXfGS0+HGtDmv65evo7hofyZRLS8N2LTVP0MyHCvQ
         8G9E4aK/nFfffWHNSLvvyHC98nSLJLNSQ2DD14UHoipoGQe8+DQ+Xkn5aVE/vM9XlHwH
         n7hI8zF94jukkut36XOlFytjL0gBGPsQwOnzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579609; x=1752184409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxuuX3SmTe/KHiGqxZf5tezD/Xp394VdI3B/HTH6SAc=;
        b=rcMiz3TtKY0R5xV1SSqDnXulfHbV0nEouNVffUgsCClIU1mFNOHd9YD1mE5I9xuAT6
         9rzqZkJLzIgJHAOsCkrjGXRNmr9ve7I82Iweck8BuAt/88TFkAnIorfeu0k+U/Ex74MW
         Ied1kOdpBsHZdy+HUPhYYBnMTdVkp4F3/fAjyYVzK8OxqjO7owzIjzpP5s0YwfVOoyFe
         95iRLupJ0UH+STwyJgW3OOfUgi6R0fBmpUKFI7ABVP11GaTYczlfBW+2xC3DfvhIc8uY
         lUJI+mY1bK+ev5PuFTra8vPhZilO72RNiylYnZmFR1eWubyyN9rZ66gxGw+KK7oJx2up
         +fRg==
X-Forwarded-Encrypted: i=1; AJvYcCX1CZmv3Rna7YiHFpLPrbLim+NV9GMnfEXWaE3O/Ebt5vgUG0AMW96oINAfMikdch7AwTBVxUiVtutaFlc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx51tu12GCJRvYL1scu2f0FV9KAViCJuwYMpm5hkl28De4ui7ET
	wj/MGSNbzw1MJjW6F+lu4bYm5/ApY/k2oyJbXW9/wu4Sm+dFZnRgH/KCWZvh/K0LNQ==
X-Gm-Gg: ASbGncsWoA2U8N6cuDsmOdXdr3c6hn+GE5UuQJoWU+OT9dujElb9Lu5xiPKXH5Oa4wK
	U2/wr4gZb7PquX1Y3ovNCtMoZLHzT8WgnhXf4hZfWWFTi0ivuThIpvtCcWI8AAkVQePAp8EM1od
	c6BStDRVCGOm4TVvuOqwgX+zNd+5cndTtuDcJwfXEO2yVay/yV0ZvpvRyeHEyUWS9dQjnmvm/sE
	SwhPmHpsrigXzNh3KGBifFR4+xkD+CBaU4acDKF0nhAxelZPrxXm3xPO11+HBB9u7MhoztfYQFy
	JVpcd+JyUCBuZWGbHjAUBMDwVCrHFLTz7enU+onymBbYTdh3mqbFOxmWg9n2u10vMneiu7UHRuj
	9BGMyAfiO9dITN+bb8c/iYWJWfV6aFm6u2s7Bx2M+/A==
X-Google-Smtp-Source: AGHT+IFglctMK4Y0kmMgoX4O2sEYz7+usWw4Ox+ioQ0YNjPdTo5gPJOnupN4TRKyDCVpucZphxoS0w==
X-Received: by 2002:a17:902:f684:b0:210:f706:dc4b with SMTP id d9443c01a7336-23c86064c7amr4212915ad.13.1751579609484;
        Thu, 03 Jul 2025 14:53:29 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:28 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] PCI: brcmstb: Add 74110a0 SoC configuration details
Date: Thu,  3 Jul 2025 17:53:13 -0400
Message-Id: <20250703215314.3971473-4-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703215314.3971473-1-james.quinlan@broadcom.com>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PCIe for 74110a0 SoC.  This chip uses a simple mechanism
to map inbound memory regions.  Both the "ranges" and "dma-ranges"
are identity-mapped to PCIe space.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 362ac083e112..bfedab15a162 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -276,6 +276,7 @@ enum pcie_soc_base {
 	BCM7435,
 	BCM7712,
 	BCM33940,
+	BCM74110,
 };
 
 /*
@@ -291,7 +292,7 @@ enum pcie_soc_base {
  * power of two.  Such systems may or may not have an IOMMU between the RC
  * and memory.
  */
-#define IS_NG_PCI_SOC(t) (0)
+#define IS_NG_PCI_SOC(t) ((t) == BCM74110)
 
 struct inbound_win {
 	u64 size;
@@ -2046,6 +2047,14 @@ static const int pcie_offsets_bcm7712[] = {
 	[PCIE_INTR2_CPU_BASE]	= 0x4400,
 };
 
+static const int pcie_offset_bcm74110[] = {
+	[RGR1_SW_INIT_1] = 0xc010,
+	[EXT_CFG_INDEX]  = 0x9000,
+	[EXT_CFG_DATA]   = 0x8000,
+	[PCIE_HARD_DEBUG] = 0x4204,
+	[PCIE_INTR2_CPU_BASE] = 0x4300,
+};
+
 static const int pcie_offset_bcm33940[] = {
 	[RGR1_SW_INIT_1] = 0x9210,
 	[EXT_CFG_INDEX] = 0x9000,
@@ -2162,6 +2171,15 @@ static const struct pcie_cfg_data bcm33940_cfg = {
 	.num_inbound_wins = 10,
 };
 
+static const struct pcie_cfg_data bcm74110_cfg = {
+	.offsets	= pcie_offset_bcm74110,
+	.soc_base	= BCM74110,
+	.perst_set	= brcm_pcie_perst_set_7278,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.has_phy	= true,
+	.has_err_report	= true,
+};
+
 static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm2711-pcie", .data = &bcm2711_cfg },
 	{ .compatible = "brcm,bcm2712-pcie", .data = &bcm2712_cfg },
@@ -2177,6 +2195,7 @@ static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm7445-pcie", .data = &generic_cfg },
 	{ .compatible = "brcm,bcm7712-pcie", .data = &bcm7712_cfg },
 	{ .compatible = "brcm,bcm33940-pcie", .data = &bcm33940_cfg },
+	{ .compatible = "brcm,bcm74110-pcie", .data = &bcm74110_cfg },
 	{},
 };
 
-- 
2.34.1

