Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC95C1E411C;
	Mon, 10 Feb 2025 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187400; cv=fail; b=YVZWFOQs4z3dm+2oqZzdJ85E/NeGA/KekkondnEtEIRzPHGBGux5D+sso/ArAbjK63/DOE82VowF70QEdjxeMTjg/gpUgdxyQOWKq1Zoob0MWRI6iDm4AtLWbKM6Bay+9xdyoDXsg/jWgBLBZHgzLrCP0dw6FpkAXSR316xysRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187400; c=relaxed/simple;
	bh=yFu5NV+PVWQyIqOET3Vf5Yjvi+UuTDRfGSU5vIokajM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpyGVR9DIShtOwgxHpModfmIlcu2xoIGoSfO2SY+60N6SLER7vKrGcr9PPTeSwHXPzxQxSftX9zyC0nsPX0zdZFKW3tFt9IkslhtH2aSigY3tZgc8XY+EgDQRuFrJFaLSb7BFeEZQP2WQ2U7cGfLbqrI6SPDItZ8bzQJFQuZLDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gff19JFf; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gff19JFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lK945BnLlzvVrYkvY9B+K6KWD9FXfdT1Jj/gSUErrrRq4zF0GmS1FPwFfZcJl8+lzMXHWGdV95grtT9O05Pu5RCZP/7li8chCarX66TQ38nFWcCDF2bixiKfcpIIO1fLU4hVtCYy4GKNxBehTQ8uZFx4tzlQomJx2A6nehzn0vQcLXks3oes5uvB0Wv2ZCKbYNXEcIbUTaNFSc8iGUhH5ouRKdKvX+pUbhcvq4CQxkDn3m47LrT+kK4IazORNrpMl6mKFmxx7qQH2SEG8bNThGFrmipQswkzpPqO7F+vhvLFJT/B8mrChUJ57QUnuZq/8F0U0XJ+0xQrMHL7Bz4dEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35aUbmsXLXC4V/2D2BxYPJgwL+UtZgNCqKo+natNpiI=;
 b=QvhEwzW8qioNEOWorrxfMKH5shh3IcmH1sU4OTf8m8PKmiV22cbjwuz/U5qvN32/5yE6RxC5GJwq+UMMgXhyGJA8LR5OiqU361fexz3+udh7FqloMb6vZ9SfJi0b1OK05Kl/Bof2eTx9eEDygXOcL17qEGZIJmueIp3D7pLSlAh4TQPcvmKvM8JQ2KlFCm1Wh02YIP9l8R/rS56Xt2rTZDsuoZZ+gdSsezVaBN1BCVuwJyAULJqnaEC4p3bCkT53QkiBDRJ2N8DUGdG5R0PIq3UCexAYoliuoe3oIz4dximbqUyb17G9Mvk772+145jC1vgIIOeibtTE3TFhcTvPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35aUbmsXLXC4V/2D2BxYPJgwL+UtZgNCqKo+natNpiI=;
 b=Gff19JFf56VS33Xs44685nUS2jH0tMY4NuFgYXCsN3auzWxj8aVCGfgwLAvzekrujkPwNbtgzo7Kwk8LO37+svzXhZSIr2T+uBf/VysEa+KMHGGE1WOmNezOdgV1JkInZq/0IoZwskix3SBELHpV5x0Sz4L4yQHgOMOPxatD7Nc=
Received: from BY3PR10CA0017.namprd10.prod.outlook.com (2603:10b6:a03:255::22)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 11:36:34 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::21) by BY3PR10CA0017.outlook.office365.com
 (2603:10b6:a03:255::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 11:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.0 via Frontend Transport; Mon, 10 Feb 2025 11:36:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 05:36:31 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 10 Feb 2025 05:36:30 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Rohit Visavalia" <rohit.visavalia@amd.com>
Subject: [PATCH v3 1/2] clk: xilinx: vcu: unregister pll_post only if registered correctly
Date: Mon, 10 Feb 2025 03:36:13 -0800
Message-ID: <20250210113614.4149050-2-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210113614.4149050-1-rohit.visavalia@amd.com>
References: <20250210113614.4149050-1-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 139f6cfe-2bd9-4286-86a0-08dd49c72c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zDZusRy2CQN2ZlIM4IrK1zs+T0VJDFl9RqEdDoSEOr1AOPkMBqQoOKOzyiI4?=
 =?us-ascii?Q?N1MwpQR55Zg9MLDgW8lej5bbCnryXPI4hYRczwvgWoPg7tdS4sxZ0AqY1ch8?=
 =?us-ascii?Q?q1GZ6ik/3KKX5c3Zx7bZRGAXjoEGRaM4Tb2L3PiVSTZKUqUWiifBNaM3Nvs+?=
 =?us-ascii?Q?mQiUvejM2Uqx7EegAO3F4cT4ZvQLaLrv7QFSKyLAguWwUuxWaTofb8YFFPlb?=
 =?us-ascii?Q?ODeBiQwqJIz6OaFOEEHETMTulmsp140maNlI7tylrmYzQEeDVzd9BHqqfTZ7?=
 =?us-ascii?Q?PfNIkRAh47NWsCBBF2cOuShQ674ihVVC6+f0OjjANeR0d89hOwUAuWyzcE+h?=
 =?us-ascii?Q?KmrW21XyuJ5mXJ7EIpL6Jj3Axbb62TbnzRkxAt4JumapXQK/NM4zCHiX/Vic?=
 =?us-ascii?Q?Fl/LfcBlDKdDltLyYNyD2Qb3fDYwGgELDm0Qu6IXB/bTfPOu2zxX0cbixXa0?=
 =?us-ascii?Q?7OIvFOlM9ngWGS+nZiFo6sqi92QAqUj/IQqr6kBEWi5s86XQKwv5bOR6HsGh?=
 =?us-ascii?Q?R2f5Xje0ORm7rDLwwlKlIcxst16KvQJAIzfBnDPauZmuDwD89/oiAMdZIZZR?=
 =?us-ascii?Q?zi2+l/jIuC8QBbpsxtzAZ1Cdt2Q4dZh/+UDRh/5qTaDTpMv/gsB4+yRJmZD3?=
 =?us-ascii?Q?cqWy64dCTgdWzcBIn+mBlcj5xocPdnpK/BB73KF0dyRG2HzmgUq+IE7z7Ip4?=
 =?us-ascii?Q?qw8XsQNyoIQCtlJ2YFQXKEdnhyzE+U8zSUusMBiJYruJkFhJUnBKJUPOUrEX?=
 =?us-ascii?Q?chUUPsNz6tT7ahpyNqRGe9KT4uagCOQZCo3WcK3C/RThrxQSRtsMg4lIrn77?=
 =?us-ascii?Q?4pzu5k7P1Oi12dGBNBzTkYivBZOuKREn39UioaqQIX1Rpm1weC/nA9DuTnUZ?=
 =?us-ascii?Q?K9jVZcqCJ1apcl2eOGXxZmz+vVQA885r60bZjtN6kM1UB5sHwOPnQu+srbvF?=
 =?us-ascii?Q?GQkmYAgg9JGnccFfwo6Re5mADZ0NP7tw2t7JGBEjHJ286GuKsYi0dpGhhP0U?=
 =?us-ascii?Q?Vj6jU6KjtxYUOnw988tjlYR/vYw4uv1fsmHB8RGGag98ca/1rOlIwFTyYu6T?=
 =?us-ascii?Q?rQ7U2bjk4DirmbHDsrrQzMYT3rCEkDY3cG3QMzbZX6vRDfhDQccqTjEBWzhZ?=
 =?us-ascii?Q?GHaGRTsoNPCg2q6dIUeIkPhM3CjBGQUiOzgmxTahOEUVu8BY03JmzXsIN4yJ?=
 =?us-ascii?Q?io4sOBu+pUJWDh5TNGBNNwtKBoH3HylnUyzcvengY86EhAMlFONddg8svzmK?=
 =?us-ascii?Q?bcxo5amYvy7DJqIADT5p/M70ODUnKoyag88LdMbq5E6smbqvjCh2TzHWDhrQ?=
 =?us-ascii?Q?Rtg0vG0sSDwLqO1TwJOXIaXouoNV+EO2kX+VBzFr5GAVwNCMJx3Y3wSn6a7O?=
 =?us-ascii?Q?UHoai/UJWbRagsGtZw83piAy2pHw8mvH4FfTdXQqJ+ZBYCfMYoAH6S4L0KMI?=
 =?us-ascii?Q?td1GxdgWvYFEcTwKItj/cvLrbeNoL4hB2sF7hMxEw3Uj66NybaYgsVr2FbN8?=
 =?us-ascii?Q?n7Wgg+HhEhhWcd8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:36:34.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 139f6cfe-2bd9-4286-86a0-08dd49c72c03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

If registration of pll_post is failed, it will be set to NULL or ERR,
unregistering same will fail with following call trace:

Unable to handle kernel NULL pointer dereference at virtual address 008
pc : clk_hw_unregister+0xc/0x20
lr : clk_hw_unregister_fixed_factor+0x18/0x30
sp : ffff800011923850
...
Call trace:
 clk_hw_unregister+0xc/0x20
 clk_hw_unregister_fixed_factor+0x18/0x30
 xvcu_unregister_clock_provider+0xcc/0xf4 [xlnx_vcu]
 xvcu_probe+0x2bc/0x53c [xlnx_vcu]

Fixes: 4472e1849db7 ("soc: xilinx: vcu: make pll post divider explicit")
Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 81501b48412e..88b3fd8250c2 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -587,8 +587,8 @@ static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
 	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
-
-	clk_hw_unregister_fixed_factor(xvcu->pll_post);
+	if (!IS_ERR_OR_NULL(xvcu->pll_post))
+		clk_hw_unregister_fixed_factor(xvcu->pll_post);
 }
 
 /**
-- 
2.25.1

