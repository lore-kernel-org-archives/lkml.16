Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AB202F87
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905451; cv=none; b=rD5UKkJh27IoSMSGfwEi34ORlNr278l01GJkTriY2pfKftZ6NL7AURqMFC+ZNKFOmxdujn72RSqPk/AsMMlY/RkVa0l7oW78uaqQUfdZ1pu4tuhQ8RlCNDc8Ll4cvYgjSriY+pTSHlEnjxtGlCoYpLYYiEGdgWwoJp1Wbn+Jet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905451; c=relaxed/simple;
	bh=yWtCCxpMNPD3uS3Bi7H/Hp18Cho/E9Z77Yln+Cm21OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=qApU/TleyUw74cRWKnxnLj+hwDsKh7OXgT4y8QizjcboW/brXLvf2B7dXSNq3zlbGP/EJjOHKQ5gYWqJElzQuZnvd2BWZxJs91yWR80pA5sxoClaacZBcTDuCo0UWhf2zwyPrBMAYccDAUpC1KhQh6TBz1GMYFgaZh9As81uwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XFthsoYh; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XFthsoYh"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250626023723epoutp02a5d951bf4ef34e4c61129c81cd51d319~MdzlGUFdT2366123661epoutp02S
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:37:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250626023723epoutp02a5d951bf4ef34e4c61129c81cd51d319~MdzlGUFdT2366123661epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905443;
	bh=9jzUBK4rfaWiMXa828Ff+bfipS/KVj9eyi+oP2TMhHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFthsoYhxPVBZGIn4ijlvQNek8TKNJelMJMeyFEhhavzpoDc6kfiWhcdk6fyYZD8Q
	 Ytevyj9Q2Codlab+gL6zX33Mizb1yq3jMlSvBZrNK9pHUC4063pb/9XAznWFoLVELO
	 vfr4QYNoAkg4dkU7UMdM+3pUAKdb7EYwajTNg0hM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250626023722epcas5p36a5140741b9bd88cc7b90a44f9c9d3a8~MdzkMXEq-0375103751epcas5p34;
	Thu, 26 Jun 2025 02:37:22 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.179]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bSNBR5LsWz6B9m7; Thu, 26 Jun
	2025 02:37:19 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250625165258epcas5p4ddbbcfa60703f3682b94ae4eb814da7e~MV1UxW_BP0913509135epcas5p4s;
	Wed, 25 Jun 2025 16:52:58 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165255epsmtip289f7380990344ec0cb7618be15119205~MV1R5dbAo1750917509epsmtip2I;
	Wed, 25 Jun 2025 16:52:55 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-fsd@tesla.com
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>, Hrishikesh Dileep
	<hrishikesh.d@samsung.com>
Subject: [PATCH v2 03/10] PCI: exynos: Reorder MACROs to maintain
 consistency
Date: Wed, 25 Jun 2025 22:22:22 +0530
Message-ID: <20250625165229.3458-4-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625165229.3458-1-shradha.t@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165258epcas5p4ddbbcfa60703f3682b94ae4eb814da7e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165258epcas5p4ddbbcfa60703f3682b94ae4eb814da7e
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165258epcas5p4ddbbcfa60703f3682b94ae4eb814da7e@epcas5p4.samsung.com>

Exynos PCI file follows MACRO definition order where
register offset is defined in ascending order and each
bit field within the offset is defined right after offset
definition. Some MACROs are out of order and so reorder
those MACROs to maintain consistency.

Suggested-by: Hrishikesh Dileep <hrishikesh.d@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 30d12ff9b0c6..b4ec167b0583 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -27,11 +27,11 @@
 
 /* PCIe ELBI registers */
 #define EXYNOS_PCIE_IRQ_PULSE			0x000
+#define EXYNOS_PCIE_IRQ_EN_PULSE		0x00c
 #define EXYNOS_IRQ_INTA_ASSERT			BIT(0)
 #define EXYNOS_IRQ_INTB_ASSERT			BIT(2)
 #define EXYNOS_IRQ_INTC_ASSERT			BIT(4)
 #define EXYNOS_IRQ_INTD_ASSERT			BIT(6)
-#define EXYNOS_PCIE_IRQ_EN_PULSE		0x00c
 #define EXYNOS_PCIE_IRQ_EN_LEVEL		0x010
 #define EXYNOS_PCIE_IRQ_EN_SPECIAL		0x014
 #define EXYNOS_PCIE_SW_WAKE			0x018
@@ -42,9 +42,9 @@
 #define EXYNOS_PCIE_NONSTICKY_RESET		0x024
 #define EXYNOS_PCIE_APP_INIT_RESET		0x028
 #define EXYNOS_PCIE_APP_LTSSM_ENABLE		0x02c
+#define EXYNOS_PCIE_ELBI_LTSSM_ENABLE		0x1
 #define EXYNOS_PCIE_ELBI_RDLH_LINKUP		0x074
 #define EXYNOS_PCIE_ELBI_XMLH_LINKUP		BIT(4)
-#define EXYNOS_PCIE_ELBI_LTSSM_ENABLE		0x1
 #define EXYNOS_PCIE_ELBI_SLV_AWMISC		0x11c
 #define EXYNOS_PCIE_ELBI_SLV_ARMISC		0x120
 #define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE		BIT(21)
-- 
2.49.0

