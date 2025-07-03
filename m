Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A562BFC7F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579608; cv=none; b=HSOdr5CRx03szG4OuvCqAzFSnbSC0+7LNDCiqFSoMfCNzBo/qFe3gGajFKbh6oAR7INbHz60C1/JNxzpGXAO6atN0lwqhlg7inprLieKra5/zGqF9uCDOXz3sylZopXxik9/h7MoGaqIr0hmDAUDxxtI0j4CAnBcl9ZVps1mhCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579608; c=relaxed/simple;
	bh=+4mWhPKns0RSEJTdCXraQDLnv9KiyINud1kAAW+E3Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X62j6YcYpCFA5G6oGYWHBWvVmEDF+j1e9PYvb1fiqj8y/XWjyVX1FiRVhoLJuko8Ubd3NRVde1JtF9KlfxJmyyLWw2KSoIVNUuVmbvReAytGdoZ3yGb3jRKRBsHpNpl7BTdxITg1oJdwxXQohyd7cySf+dcL99XTe+hFek3/kXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ETbzGj0E; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ETbzGj0E"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23508d30142so5432605ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579606; x=1752184406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibqJ1qfXyj8EfT7QyMpwHVnExe5FA06OoPBrLNd9L70=;
        b=ETbzGj0EresgGiS8eBVPdmc3lEN4nQVDw/e9lnYTKCjIiCxss3HWtAJ7aBapejgTwW
         NmV/ODZE+3FsUfQSGKPL2BG55FyCEL3VT/eaABnVqFg8eKFilv+/Mdkb321hgVP8OPWd
         9dKs8T8PIOn+0FAkRpU0x88VWrz15A5WpK8og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579606; x=1752184406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibqJ1qfXyj8EfT7QyMpwHVnExe5FA06OoPBrLNd9L70=;
        b=KiZiqzCo93XOCWtsAM/hldxO07HnCS7zAfbSgwZzaJIqQXhISAAhDRhMatSh3h6ZDk
         j13f3/+94GxBoWeJqYhQmMQGYubkehLqNTt/NzHdDMPSO/eUesnB1n3TMMTcKeCGOIkt
         Xi4tvrEmWr1xwuwUHkxgGunFYCqTvScCBs2zcwwbkbbFS72OjITNaebHrKcec+Xuke+5
         4pOZC6rDTknREyqydknp/ghxIUeHAhGUyUt0+irYUTH7b7OvHR5LqDMjdsB+SFvyIwhq
         CnvuvT25dqsDNNwWaoUjHlWjmAWXCi1L1Zd8nCou6epSX1uChxvw48a9IcSAOWmySOfl
         Wo3A==
X-Forwarded-Encrypted: i=1; AJvYcCUIMS6IZFilk5em2zvwHDugiO6tyCwjO5drvhwFgfzYdJujywz1rcvLVqJocngndDkT+nmuUm+4ib47hTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNLuMU9ON8JnABpAS9g28cCDqMnST5/+xfge5WXI9GhPN0tyF
	suk/B8KgPq+X5k+PYV4UIOkVSwJ4A0KddyeJrA0A5JIrUmjcPlO61AkkkoQ6+B6nlQ==
X-Gm-Gg: ASbGncsNSsYnPNDUjUTe3RiHe/irqKy+GcxqSXPU36t1JLNnzFGJEJYByn4Ut1iRmxB
	pQcqXYVuex1+R1zsYeWo3YmzAqTMQ4FPpTZebGvvpR9Bd/hNT9QTwHmnkqEyNEiSdUNh7EkyTrL
	VIithNIJxUD4xDNxvRiFzvGjksFMUXVp8aEL7Znx9/m+Wy93Fu47lGQRePcRizKH+u5J4NRfXcx
	rDvGJbNm8dTpuJroqRw3b5HoWvPajetxjeLz+Fg2Noe5AsLRAkvmnJ60cBs9+jVdF6+ngn8G5le
	XUWPTpHlYM3LFRY28NpWhdyszFWhXjpY1U8SGGCDBn5iTDiKk/m20Vi5K0iZqO6QUq3h22pNGdO
	Bv6HJCWfutXrlhdpJByzv9lpeOdxORCeVuLR96iaIyju0OAxGaXlL
X-Google-Smtp-Source: AGHT+IG43raFFh4Sga/+BHu1LSaZfdBpoQXF3HpuWwfM1okK6fDZ+ygvWWjun6fbVM2HU0P90x4sUg==
X-Received: by 2002:a17:903:1a03:b0:234:a139:11fa with SMTP id d9443c01a7336-23c85d9e22emr5623665ad.3.1751579606352;
        Thu, 03 Jul 2025 14:53:26 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:25 -0700 (PDT)
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
Subject: [PATCH 2/3] PCI: brcmstb: Acommodate newer SOCs with next-gen PCIe inbound mapping
Date: Thu,  3 Jul 2025 17:53:12 -0400
Message-Id: <20250703215314.3971473-3-james.quinlan@broadcom.com>
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

New SoCs are coming that are not encumbered with a baroque internal memory
mapping scheme or power-of-two restrictions on the sizes of inbound
regsions.  Enable the driver to use these SoCs.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 61 ++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 5c8aa5e36338..362ac083e112 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -152,6 +152,8 @@
 
 #define PCIE_MSI_INTR2_BASE		0x4500
 
+#define PCIE_MISC2_BAR1_CONFIG_SIZE				0x4700
+
 /* Offsets from INTR2_CPU and MSI_INTR2 BASE offsets */
 #define  MSI_INT_STATUS			0x0
 #define  MSI_INT_CLR			0x8
@@ -282,6 +284,15 @@ enum pcie_soc_base {
  */
 #define IS_CM_SOC(t) ((t) == BCM3162 || (t) == BCM33940 || (t) == BCM3392)
 
+/*
+ * Newer chips (NG is "Next Generation") have simplified the design of how
+ * inbound regions are mapped to system memory as compared to previous STB
+ * designs.  In addition, the inbound window size is not restricted to be a
+ * power of two.  Such systems may or may not have an IOMMU between the RC
+ * and memory.
+ */
+#define IS_NG_PCI_SOC(t) (0)
+
 struct inbound_win {
 	u64 size;
 	u64 pci_offset;
@@ -1008,7 +1019,8 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		 * memory.  That being said, each window's size must still
 		 * be a power of two.
 		 */
-		if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base))
+		if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base)
+		    || IS_NG_PCI_SOC(pcie->cfg->soc_base))
 			add_inbound_win(b++, &n, size, cpu_start, pcie_start);
 
 		if (n > pcie->cfg->num_inbound_wins)
@@ -1020,6 +1032,22 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		return -EINVAL;
 	}
 
+	if (IS_NG_PCI_SOC(pcie->cfg->soc_base)) {
+		/*
+		 * STB NG SoCs may still be limited with three inbound
+		 * windows, and if so, the last one should be disabled.
+		 */
+		if (pcie->cfg->num_inbound_wins == 3) {
+			n = 2;
+			add_inbound_win(b++, &n, 0, 0, 0);
+		}
+		/*
+		 * NG SoCs do not have internal mapping system that enables
+		 * multiple memory controllers, so return now.
+		 */
+		return n;
+	}
+
 	/*
 	 * 7712, CM, and newer chips do not have an internal memory
 	 * mapping system that enables multiple memory controllers.  As
@@ -1120,6 +1148,17 @@ static u32 brcm_ubus_reg_offset(int bar)
 		return PCIE_MISC_UBUS_BAR4_CONFIG_REMAP + 8 * (bar - 4);
 }
 
+/*
+ * NG SoCs have configurable inbound region size registers (as opposed to
+ * having to set them to a power of two).  There are multiple contiguous
+ * registers, one for each inbound window.  This function provides the
+ * register offset for a specific window.
+ */
+static unsigned int brcm_calc_config_size_reg_offset(int bar)
+{
+	return PCIE_MISC2_BAR1_CONFIG_SIZE + (bar - 1) * 4;
+}
+
 static void set_inbound_win_registers(struct brcm_pcie *pcie,
 				      const struct inbound_win *inbound_wins,
 				      u8 num_inbound_wins)
@@ -1134,6 +1173,24 @@ static void set_inbound_win_registers(struct brcm_pcie *pcie,
 		u32 reg_offset = brcm_bar_reg_offset(i);
 		u32 tmp = lower_32_bits(pci_offset);
 
+		if (IS_NG_PCI_SOC(pcie->cfg->soc_base)) {
+			/* PCIe address */
+			writel(lower_32_bits(pci_offset), base + reg_offset);
+			writel(upper_32_bits(pci_offset), base + reg_offset + 4);
+
+			/* Size of region */
+			reg_offset = brcm_calc_config_size_reg_offset(i);
+			/* Register value has granularity of 4k units */
+			writel(size >> 12, base + reg_offset);
+
+			/* CPU address */
+			reg_offset = brcm_ubus_reg_offset(i);
+			writel(lower_32_bits(cpu_addr), base + reg_offset);
+			writel(upper_32_bits(cpu_addr), base + reg_offset + 4);
+
+			continue;
+		}
+
 		u32p_replace_bits(&tmp, brcm_pcie_encode_ibar_size(size),
 				  PCIE_MISC_RC_BAR1_CONFIG_LO_SIZE_MASK);
 
@@ -1264,6 +1321,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	 */
 	if (IS_CM_SOC(pcie->cfg->soc_base))
 		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_FOR_CM;
+	else if (IS_NG_PCI_SOC(pcie->cfg->soc_base))
+		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_GT_4GB;
 	else if (inbound_wins[2].pci_offset >= SZ_4G ||
 		 (inbound_wins[2].size + inbound_wins[2].pci_offset) < SZ_4G)
 		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_LT_4GB;
-- 
2.34.1

