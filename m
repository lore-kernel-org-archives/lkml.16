Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC4264604
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829714; cv=none; b=qStAN9RMMELBERY9T639QgAYuQtbuW3lSlZz33495wv/EIHXXGJnpRjk6ZQYKWRhqqX/pEbHV+dUWnCLxoml3PHuqehTTxBDMg02YiYFVnK7/rCOqfLtrQ0lLuqcEqUf9Avg81jph7xLsHPmq+n6rv1q7vhF7BgumAyrA6qNyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829714; c=relaxed/simple;
	bh=Kjsjk4e5aC82Vjk9dZ6KH431FG2D7hzfomRJ1yK6eTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfotonVo1nZpByknNXJqgsc1Efix3s237snrVaH4oc0A+m7HwYcTEzWJfn1WitbKTpWzI44ohAXTxTFNK0JnCa4DnuJU4o7nytDo9hkM6YyiGgtAkdr6ZII0N/cLWckfrccBHEwgeQf2T/H3zq5uFGKFJpArNbIbHz4s7ptoIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BOpGrQ9o; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BOpGrQ9o"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e7e5bce38so29302825ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746829712; x=1747434512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r01UKsFQHMizWN+7NERjXgKGoiCMs947wub+Eu3dEZg=;
        b=BOpGrQ9oUGB0g6lY7odfU31mAkiI3UG9/Mn+YF+MkhGPP5Lg2pDsLjUu2YiV82OdOq
         idfLEaOhOXwzLvBQC6qwPTkkktbhp1g7Yyu4wf7vfQ8YO+Y57/vIP3D7R9R9tZ/CWC4Y
         9QuGpkWOOdzHJEhjf2N1pUyWyyaiqJlRRF8bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829712; x=1747434512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r01UKsFQHMizWN+7NERjXgKGoiCMs947wub+Eu3dEZg=;
        b=HrQrXwx0jHyA4hrgn2s0w3xR9uExejURe2LS7OHe9DJQcCRX4M/PlRqAPA7oI+1ecD
         Mj2fSpA6acKLqTqUc+YXCojDBrAjEyku0ck2qgbbCaq0fE8ZXWMFmFLB/DhJNUqc+xhw
         Favsesj4khzfMfBaPPbk+s/JnBElZWSG/KmneHKm6wDhdRQgLIJlbX/uElfK7TjTuk+b
         A25U0p9DwtoJA2eXYh5Q8Z/Mfzz77pO6+YYggVYPdVyNOtFN9TZZxhJ5eGw7K8tBp2oe
         UDI6IrIKcHva0XWyiIB9al9xtCz9UNFnU7HcZnAAMT12/on6I6nfDbXtuuOb2+4qXgol
         yFuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRZTeZcQkHQvSXSy4noYC3eZAuLm5otQ/a4E2yJZE/Yp//SImvYWXRC+CttHGmsFs8I6if7kiKpGzrBTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp95LEwZtsPY7te/clBVKAZg0ddIuNXVt1xCPBV2+1eXDlHdSw
	Oj8xS1icVoJ/VXR6mJPrgIl4aFPqxVFn1SvwIhro5CsZ1QtKbgUAgzFirPCiaw==
X-Gm-Gg: ASbGnctJGu+enLo1N5MjadwuMvQiQr59050CIDdnCvslJnDJOhJLjgSe3TJIcBNPdg2
	Jbej75EDlB0pv7I7KJYKZ3X5UkDs+exKLrn4EgzY62sLRYRa+toJteczP50U1NHb2exPeJPEfv9
	uxESgcRhR55Fcc7DimgO4NZk7CKgSjFNx7m7zS0S2cQFoKNdUktdHC0ZZu2IHYLuUKW8bloXIHC
	iqz2P2AlwMsZUYxGk/t85UaJrkqE50t2AngXiycsFLfC7qd40cuquHKYCRvDJ7ulBGwpbKWu73L
	pE7354vozGdCUsTjwVaHAPlgl57uuhmWS0xwzZz5+gwk8u0t/qJqtTpjEHj7m4NMdGonLpz1pHw
	mh1gcHOzKXC1WudYnAhsxkSkso/VE/Gwo4j1jWXlO5A==
X-Google-Smtp-Source: AGHT+IFuDBZRbVYjG0G4X/dCVr4J6+/l3hVYk/ScgrrBw/Yp2Kx+9CCGefV6GRrHSuO5N3jNQSf5cA==
X-Received: by 2002:a17:903:986:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22fc8e995b4mr83439675ad.38.1746829711780;
        Fri, 09 May 2025 15:28:31 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544fadsm22584465ad.24.2025.05.09.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:28:31 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
Date: Fri,  9 May 2025 18:28:13 -0400
Message-ID: <20250509222815.7082-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509222815.7082-1-james.quinlan@broadcom.com>
References: <20250509222815.7082-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, we use automatic HW negotiation to ascertain the number of
lanes of the PCIe connection.  If the "num-lanes" DT property is present,
assume that the chip's built-in capability information is incorrect or
undesired, and use the specified value instead.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index e19628e13898..76fd4f515898 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -46,6 +46,7 @@
 #define  PCIE_RC_CFG_PRIV1_ID_VAL3_CLASS_CODE_MASK	0xffffff
 
 #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
+#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
 #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
 
 #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
@@ -55,6 +56,9 @@
 #define PCIE_RC_DL_MDIO_WR_DATA				0x1104
 #define PCIE_RC_DL_MDIO_RD_DATA				0x1108
 
+#define PCIE_RC_PL_REG_PHY_CTL_1			0x1804
+#define  PCIE_RC_PL_REG_PHY_CTL_1_REG_P2_POWERDOWN_ENA_NOSYNC_MASK	0x8
+
 #define PCIE_RC_PL_PHY_CTL_15				0x184c
 #define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK		0x400000
 #define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK	0xff
@@ -1072,7 +1076,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	void __iomem *base = pcie->base;
 	struct pci_host_bridge *bridge;
 	struct resource_entry *entry;
-	u32 tmp, burst, aspm_support;
+	u32 tmp, burst, aspm_support, num_lanes, num_lanes_cap;
 	u8 num_out_wins = 0;
 	int num_inbound_wins = 0;
 	int memc, ret;
@@ -1180,6 +1184,26 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK);
 	writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
+	/* 'tmp' still holds the contents of PRIV1_LINK_CAPABILITY */
+	num_lanes_cap = u32_get_bits(tmp, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK);
+	num_lanes = 0;
+	/*
+	 * Use automatic num-lanes HW negotiation by default.  If the
+	 * "num-lanes" DT property is present, assume that the chip's
+	 * built-in link width capability information is
+	 * incorrect/undesired and use the specified value instead.
+	 */
+	if (!of_property_read_u32(pcie->np, "num-lanes", &num_lanes) &&
+	    num_lanes && num_lanes_cap != num_lanes) {
+		u32p_replace_bits(&tmp, num_lanes,
+			PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK);
+		writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
+		tmp = readl(base + PCIE_RC_PL_REG_PHY_CTL_1);
+		u32p_replace_bits(&tmp, 1,
+			PCIE_RC_PL_REG_PHY_CTL_1_REG_P2_POWERDOWN_ENA_NOSYNC_MASK);
+		writel(tmp, base + PCIE_RC_PL_REG_PHY_CTL_1);
+	}
+
 	/*
 	 * For config space accesses on the RC, show the right class for
 	 * a PCIe-PCIe bridge (the default setting is to be EP mode).
-- 
2.43.0

