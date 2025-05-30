Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E228C01B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644850; cv=none; b=kt0GIg39TQo31ZFMRpfYHiX36qa9ERjWSa5U3+T+BCP8Syhs/nCob/68o7CvfhHLaXcLhQi//zJVc7zEUhGmcWvT2Xh4SrI3PjU9VC1tuYpSeS+jm8TuxiL3+UAGsSMFJSzwfG1N8jvNHGrjo9SjZkULQUsDxOFQiMzaNkn5/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644850; c=relaxed/simple;
	bh=BGvgbn1BZa2sYB+McU5CilQTpp9thj8nlJpUAkHvvj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aclOq/MSxq6NJmz3jUJ81cZZoWhSTLfKzonaBdoWlX5olFFDbmL0rrMkWiLhL4n2CHU9ifsRzGiwMCknpYmvlLKnOExQza0vqpIWFSf8LfjCQfAqvg3XG+70X1MnckCefOft+bMBHsIdgzCU/DtMfimPK+LK0xW5tI7i6n3+aY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KL4sA+P3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KL4sA+P3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2351227b098so17121695ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748644848; x=1749249648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meW30IDDO+azkqeYGaD+b0CQRVW934zmu7s9bUahNtU=;
        b=KL4sA+P3BA3y5VWJ+T58sFUDlaPxR/njNqDm8lMORDIfjHEvnr7ITHWJ0h0KqpOhiZ
         qlcJCWQduGtQPyV+ZH6EwX1ErSO1LD2ByO4YAN1EgUu/MGqricAraSv6BIoLhnXCvkRA
         HsEzeMXpH7EAqQ1PV25xRdb61mD2ITb2cb+Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644848; x=1749249648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meW30IDDO+azkqeYGaD+b0CQRVW934zmu7s9bUahNtU=;
        b=svYGfrgDI7MsihDrQcCRPrWQlYAvCm/kXh0vouNV5Z9DqrYyPyuOd+0w74tB/UuxPB
         SZ/OlTlG2/gvvX4L+txL2syr+3ORGXLXN8uwpH5YRudbCwDanw9VnxOZWKiBi9POqb4h
         hOqLo/9CXuT87AjYeTYX3KJ+j4xVQT8Ys11svJ/86XbX+o6vnGH5lbegBoFKlLCjFGI9
         OagYIQlkCIPhoqr6bmLiGV5+OeAlm+HwnsC4u4/9Fa8GLmPG8l+lNM5uvpd+7/8Nl3fc
         7LBDo1TOnA/UFLcOyeUmwLFzsz4zNV3/sTqlz+hZ/HI4LrQ5Py3iibMa8AKjuRYcZanz
         /lTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUblSaRKfU3aeQZL8eweMkGa0VyY+EfTQtC4HL0nYLkmUck9LwM7qymn6DFsxLRJQ0qS00KTfAvk4H26zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMF4Bb/e+9P2BLUu3mPkCWVW9aQL6iOqorSL63pjD4GkSOBhV
	mUHM5+YkXNkODWjvq0UjqtzcMk0aChbE7qTl5UxzBW1iDdrwJP1jBQL3PaIxP9o/5l22WTqPFbS
	XQLVB6w==
X-Gm-Gg: ASbGnctJTmtkqXceD50KXM2J79PfXk+Xz9YnxGH4QdILN6043trtiefgezyrjkA3D/a
	FECS+rF5SPqjNkaiYyt3qaj3fqv1mr/Y2+6tMT8rW8nHHU2HfKRXoEChw/6AOjQL5t+G9MoSXx2
	g1HVDIAL2PUhM5Vj4aXi71ho+2xKw25jJ3HY1+GvV6vNUXZt7SKfKPNBb9WneXeGgtm+tgVPjKT
	rBfXKfY97bYbMus38d1UcjB3lfHPAt/NssnwFfj9QBtbE0ekyTFuu/EG9Tla43IQ/w/fP1VKChj
	b7app+z5VZDZk5faF2EA1Q6PvWf5DbJpwoveFc7VepQp0KF4SRoaHzqlbzBDFZe88aXy5NR0fxx
	SPimuAmQRTSxGV0hxSIdzt8Zo8As0k6vhUt2/+e6K4w==
X-Google-Smtp-Source: AGHT+IGL4F0Y7fvmsQ/3UEqROCzrPd3eOAG4Vh0WKC1WvYBSk1U1yO1TsWce/E4di6e9o+pfZ3ki5g==
X-Received: by 2002:a17:902:d4c1:b0:234:8eeb:d82d with SMTP id d9443c01a7336-23528de8f60mr78383255ad.19.1748644848195;
        Fri, 30 May 2025 15:40:48 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf523esm33109385ad.170.2025.05.30.15.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:40:47 -0700 (PDT)
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
Date: Fri, 30 May 2025 18:40:33 -0400
Message-ID: <20250530224035.41886-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530224035.41886-1-james.quinlan@broadcom.com>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
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
index e19628e13898..79fc6d00b7bc 100644
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
+	    num_lanes && num_lanes <= 4 && num_lanes_cap != num_lanes) {
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

