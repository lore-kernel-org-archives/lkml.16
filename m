Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2121.outbound.protection.partner.outlook.cn [139.219.146.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555720C03F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317635; cv=fail; b=Dz4CB86CguZPdwBNES6vpveqqliDqICsVOhttZnds91GyVepVuVTMSbygSzLrDdmmhj0aSdJ3IvQKXLBtMaBZhvfXHM0F+eSOAc2XIvWascJiKAJ9kA3Wp6U+f3rqy1bsYkpJ3kVeHsD4tYBKbhmT8zrxvjm7V3ZeSxJbv+c+aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317635; c=relaxed/simple;
	bh=w5EGxkPRBvz7166tsFSZhJaNvLQcRE1LYf7KzRxE8X8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L28rPEQQpN0gX+NCmUApezCsKgm4ga4S1m8z7bBZWGYrO45xGheHw9YrNdX3RMT36uUoAG7Io3BN7/lIwRsdA/34LE1sbU24YD0XZ6TTnpyxTbn7uVddk4G5xlSGiX+99lU1Ry4jw0K0g47zk64ENSHzr3BnJjmueb9dPKDR9OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsQtQ0sT3usdM38843HRvpuRgakDALWbdL8xrUEVo5BkC+CPT18qYjDhV6NmE0z5z9I5EJ/4Q0x7qcooH+OsSsrzCoIansNdbhqyNlwVQFiC+DbLGL9y0ImwyMEMavIz4JVLkuqimSUfuQkUmwMHXWkMUymIUtm62kSCYGgy6D/gZmx6gHGmD+R7S17QspckSr8rPOAf+kWN7XczU/qC8C6ZJ/+p5AXq3RSqGggx1LicdFKvL2sYPoJZ2F3C/FGwCjO7rOlF6WOmJjhlzHDKjwFmkFItc8mpBfYjysQfjV+fM423ExK6c+zvpvVtggrzvbl/GlUVHErq8gDtalgXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeLpyXpKtOWjvFBC94p61QdYrj6+aJerJ5wpUcQsdHg=;
 b=QwEgi5Jm+hMG5Mgx0BrZoOOG0PbFyvei8K5F/+6GjHJp1sypbQVu47kdBjNEJ3MPc1U4a0UpfDQQAmGxSGs+JEgmvt4GT3CxOiyBtQnCgXDDkGCmBa64HOPoYzCqOXZoY5bwrH29+ilGoC0Bw3b4ntBMUb9s3xo2aZ+nrvumdkDbHL7vwfoBjFsM5tikhgv8Ny1GS+RoBaQ5pK3+Q2uFaliJ+BHoj4lHBCdzp1uTbciFdbpXM/DGBpxNvn3sy2GuozHiK013P2/lEXEoZDOxrxznyTEGA4xVZnJchKUXCnE/59INsFBwAON9eyP18cjU5WhzIFRf/JhgsC1N1i2sgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1241.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 10:12:51 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 10:12:51 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Minda Chen <minda.chen@starfivetech.com>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] phy: starfive: jh7110-usb: Fix USB 2.0 host occasional detection failure
Date: Tue, 22 Apr 2025 18:12:44 +0800
Message-ID: <20250422101244.51686-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::19) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1241:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b35b912-6a60-49c2-5987-08dd81863d64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|41320700013|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	dCiqKbL2GShrf62vsS3PyeqtQxVYIn+dBLy4TNj9RiZ608I26wJurVzxfSmoJ6oJ/O37L5Ln5Vrgx6eiT5vTDOVCN+34su03JF1S54c+Y8kbpGgmBMRqLdkJro5dYwVevv4M7YyjYdIzgh9Uv4ek5P9UcAkxv033AUzH2iSEFM8TWCE5XQfViuGj9109h2aEaugX1eOyaVdqX7SdUmVLQphvA+V4ZBMG/Ta3KQ7mndwAuuBufQY/M+fsuyisEzBqRJJM5NhxVEAP6xxmELLm4Oh3zn6Vn3+XlwNPGdYF6RXUsLr1/4GkwzYt0LHOqDP2YbCQG6+iVm4wVOnHWyiACaP3sDyu2JT51z2klZMLQdL9263C8bcmocJWYYbMelmy4/lxaeWcA9lVQRBvgprB9odF2dPH339ksadb72URC6N3FKt6P7eorZ+Z3ibfmxw10fWXjdmWghy9fO9Ic5RZfqK2YmFuYkI02yNE/FRoXfLQWyYYkA3NM9UiGgp3nGLZdzizNU1Q+8Q1MACQ2b8zruhI/ZNf3rxwWHQwBKnjcTUYeB5ZfZjZfbwz3dCVwCpMEqT0CliTgeAzbFFJ6cILS18IhArKi+GmMZeKWT5dLWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPwKhXBSgnRb6PzEHARAgurt0ojzhefzIee/cpfI5rIPeLaLVZvBMdrBq+ze?=
 =?us-ascii?Q?eVcbSnZ+ajFvwqN0V/V9fNAzY4w27u2aZmCBDdTBPxKPGkcBgIEYRj8F4JQL?=
 =?us-ascii?Q?r31Ex8NOYhxAjrDdZ3+hHlFwGV5ff8JpyR2KXTj4eJeVuK+/jCxlIotG4Fs5?=
 =?us-ascii?Q?vPY5+tpdk7EblqknfweFLjnlRy2uZ+O+9BlWM71YfeW1EMQjUaQgOh4FodYd?=
 =?us-ascii?Q?ZwLV1PHNbrhuCdwqawLx1bRDgV4kLusid7n5nNYUMBE4PXE2+Uh45/mqZK/8?=
 =?us-ascii?Q?RUjqnY0gWuC02AZgzyK4oeZjBJAEESZZdg7QI53KvxAy1UMifvTO/rPefF2q?=
 =?us-ascii?Q?PDm6qzdg6F4GeuszmaPeYHTmHtys41eyGb59UjDe2A0soxlJyJEbbSfuqARd?=
 =?us-ascii?Q?0oG5Nl1+sP+tx0geUivYjFqrGrB0ihOw1BBYKAabrEUFMLX3n7lbvTmnN40C?=
 =?us-ascii?Q?Qz1r55yXozgZn4yEFxLksNrjm45kD81nUbgV4WXuKe7MT43HvblnkDBrGDSM?=
 =?us-ascii?Q?HjcIID68CooGidMwF6gXTA9oeSerQc01HL3lXFbzrjhFICxvTcaqAo2gBqnI?=
 =?us-ascii?Q?pKEjj/im6GulrkyL3AmY5zHvcV8+quum3P0CXVq1al+OTEd05ojJY0cQlrFQ?=
 =?us-ascii?Q?G5EX+QHDHfqrvpWFWdMFKuf3aMYRzFP5QoQVxervB5G/eQBf7ewVltwtUT9m?=
 =?us-ascii?Q?SAci1LoDpKXdq3+jfgwakUq19+Zt6SaKhqgcJvew67W2ZjeynzBKJ2br38OH?=
 =?us-ascii?Q?wsCh40gKSpKa//rccNwhZ26oXJibOapc+cGABIDXTBuNcRtK9oDdkAynzXbI?=
 =?us-ascii?Q?KEb0bxJnciHD3BhaKNBPF7CZ4kDLfVvCHEkPtpbJrzeI3KeM5ZlsFMpux8dS?=
 =?us-ascii?Q?04PvdtdHkWvak6FPvpsVd4/c489wOrIVwpUgLdEbr/kLpqhqYTpDQZdResru?=
 =?us-ascii?Q?0kZL/v1E3/NXQqZpte96q0UcvvXbYxzArWPEvNAGhGizgox5qRBnNseZ2gtO?=
 =?us-ascii?Q?PRSTtpV+H3weEu/S9ve1ERh10cnGznNcLyFKcrF0gPPi6L9GchOtPA06JDi7?=
 =?us-ascii?Q?5lFYm1neQhWAsOvgobVF9lIu14vOOmOaCFXuvrvim+Z1JFiWftanTO4i4ez4?=
 =?us-ascii?Q?uavtBkEwXZ7Leun5qB2VnJkSmUiKVzHtNw+vbTKNsQNSSwOGrKKwSuuF1lTq?=
 =?us-ascii?Q?3Cz8oRuYxGRhoYPrT+zoLbeJCH5XKrFgei5Ail+SeRgRqg7hvXyBa1/ZOwCZ?=
 =?us-ascii?Q?/U1JhZdUgKf6rmAgI1dxTnS9CxC6fJkuR5KYVADrNHEmq+blxGGNH4K6ZwwK?=
 =?us-ascii?Q?zVwRrNcs0aAQUSRloFpVkiXeSpyyUiJRsW40g/dP6WhSTfDqYwaevMARsFSR?=
 =?us-ascii?Q?qInUEx0sscr+/K8sOYgb+hXO4ozbYBItvwUeqg2mBxq3KMnNZymWkF6YoPoS?=
 =?us-ascii?Q?Y7o53NJmnr5wQyY5AVXXOdQdcyApXEDX7rhinZxI1cVgWQQVkFaaH5pbBhAY?=
 =?us-ascii?Q?3T2+Z30kL9k7OJlEj0V5tE3FtFxwSQ20k5w9QtL7yU7NEHCkh2asP0XdJXk2?=
 =?us-ascii?Q?fvAWfeGCcIgLECYBgb3JLSf2mwovv39oJSiD7pO32jMwmm1Ua811iX2LnOQ8?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b35b912-6a60-49c2-5987-08dd81863d64
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:12:51.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEdIqW3p6XnuL6XaCgtTHiCQeTnml7WdZPCqLcdEL8QilIUWcF2j1yyjz2UJEV/zSMAdz+v970lSByldfNqZnHWgtfG4Ei0EfvtXkDeRY/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1241

JH7110 USB 2.0 host fails to detect USB 2.0 devices occasionally. With a
long time of debugging and testing, we found that setting Rx clock gating
control signal to normal power consumption mode can solve this problem.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/phy/starfive/phy-jh7110-usb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/starfive/phy-jh7110-usb.c b/drivers/phy/starfive/phy-jh7110-usb.c
index cb5454fbe2c8..b505d89860b4 100644
--- a/drivers/phy/starfive/phy-jh7110-usb.c
+++ b/drivers/phy/starfive/phy-jh7110-usb.c
@@ -18,6 +18,8 @@
 #include <linux/usb/of.h>
 
 #define USB_125M_CLK_RATE		125000000
+#define USB_CLK_MODE_OFF		0x0
+#define USB_CLK_MODE_RX_NORMAL_PWR	BIT(1)
 #define USB_LS_KEEPALIVE_OFF		0x4
 #define USB_LS_KEEPALIVE_ENABLE		BIT(4)
 
@@ -78,6 +80,7 @@ static int jh7110_usb2_phy_init(struct phy *_phy)
 {
 	struct jh7110_usb2_phy *phy = phy_get_drvdata(_phy);
 	int ret;
+	unsigned int val;
 
 	ret = clk_set_rate(phy->usb_125m_clk, USB_125M_CLK_RATE);
 	if (ret)
@@ -87,6 +90,10 @@ static int jh7110_usb2_phy_init(struct phy *_phy)
 	if (ret)
 		return ret;
 
+	val = readl(phy->regs + USB_CLK_MODE_OFF);
+	val |= USB_CLK_MODE_RX_NORMAL_PWR;
+	writel(val, phy->regs + USB_CLK_MODE_OFF);
+
 	return 0;
 }
 

base-commit: a33b5a08cbbdd7aadff95f40cbb45ab86841679e
-- 
2.43.2

