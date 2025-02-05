Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3F126C03;
	Wed,  5 Feb 2025 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762670; cv=fail; b=Hjhkmr0AoEQJjoEfyJ5nJXFumHww0aJKQt0IRNgtF/Fhw8WLguwl4366GyLvj0Zh65naRoD5CT7ZWS+yTMOqWVtFkIhnRQaC/4nb9s001F3t+lE0nbswr5QYlx2ZVe+scwdYd5OKRHycLn3DmuF/IBllBOAHV/kt/ereQeL3IEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762670; c=relaxed/simple;
	bh=UZDyFGMgTDm9QveolAnHTNZTCq9S6cOnsnF7ZNrDelQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sq3NwIoexCYpQxOGwVs98CvfBnoIjsUuejmr097EuLCa7bNrr27MToeGAQaTLchtB4cQ+1viXHEqApxUNLBnsu7IwhwTmVsi7o/E/hgp1n7C/9D2EZi4dDmVJvi3E/GtIkawhQS4D5eg7DOwUlCmyAJ0QnUzIXqhzUzxDC46E2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xcMJAbwb; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xcMJAbwb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPGesmiFQOuGY1MJJA9NAgI2l+bsUqiEleUfqTN05UIuw7XqdEkIGFiyeTbF5weHuRKU71mBesoFsOWy5oWwddW+LopKEaAjm5kMivyDey9Qset7W2kPk6CtkZWd6uzJbjR2JuIbZLZvb8Kawmw5mLLNds4El8sTF/DohlShWrzZ4XouozJ8Nk8inrgA3x8JY3/T6a6WGmpG4SY4ReNfnd9vnCSmD+bYD9AvdPZ5NoWrQA+gsRbvvF9bjDA5nTr8YZMmbpID85Pid6NPmHl/w7BuyqU/sdIAl2ugHggcoluCsa7bSnkyEJl10fJxWsj5vTkE4L50UwTsjckWxuBvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=qTUmnkly+PF7hbryGB1IydL4FFcZ5gUR6fEOQ1rXIiqfun0tPv0oMzcEujrmeyROxuKaep0Wklo9OyRf/ipKzluFZQ+mvzVJrxQybbyRIuJPZPAEly1romPSBwB4A+cKvZZyObZNmc07o6dKdLMO5LwTrLYNNjBOQoBjQZbCQf34Sq/ppn35i2FZiksu9o+BzzaYxTxiam+2pYjv23/zcDRCj99MCPGq2lRN4Ng6hFZgJSaNgfmM7yRUmOqN07HXOynoXOAl7bWovwBeQ0B7UydXPTNRv6+P+e+FDeB7JmyueRZ15dn7+fgcJ1yWJbCNVO3Y3VfcZX9iaGlBzHoBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=xcMJAbwbBsiYzgd3l42KhqY2d+X+hBLKAlz9MmTDbBHMt3s7VofzNybjfpdMreycLL9hnx1FLlqZrWAjnhuOfJqCQE7hYuLBjIFoaY/ZbFFHizDTM5tS/NvnVnUGxRWywbg7TR6HIoOftWVraAPTccB97ogHzJwq5BpLWY+5uBI=
Received: from MN2PR01CA0061.prod.exchangelabs.com (2603:10b6:208:23f::30) by
 CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Wed, 5 Feb 2025 13:37:46 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::2d) by MN2PR01CA0061.outlook.office365.com
 (2603:10b6:208:23f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Wed,
 5 Feb 2025 13:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Wed, 5 Feb 2025 13:37:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:43 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 07:37:40 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v12 2/3] mtd: Move struct mtd_concat definition to header file
Date: Wed, 5 Feb 2025 19:07:29 +0530
Message-ID: <20250205133730.273985-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CH2PR12MB4072:EE_
X-MS-Office365-Filtering-Correlation-Id: 8878d442-59a6-43fd-ca9b-08dd45ea46be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4nY+QSwQU1AgYGp9m9e/x8sJzthyCJuUQ8CAbg8CNYVGEUFnLiOYpo5z1ukr?=
 =?us-ascii?Q?ann1Pk6tT7nmRtyh6+7t0WkK4QpCKTCvTkRhQ+No48uPIDMsuoYwkpTKIpNH?=
 =?us-ascii?Q?Qowda0gqKdS+K7BBvzHpSDoA6lhyV3is1z6N555Hn4uLzzZMtJF/ZFG6zB7t?=
 =?us-ascii?Q?N1dkiR2fDvZ4KKhm0vBoMuBmtkMjcd7PSuz9jQLKA3pDNqoK2Uy1lL120y93?=
 =?us-ascii?Q?saQZhQ3UalsuzqHG8SVO3VDoPySEPPYB/W7TmdyHIpZtlZsMREA3IoXKqdkF?=
 =?us-ascii?Q?3+fs+62uGrQu6rzU0shCt/lAnKjrESA5Z0z1Llz6o31/WQJFyTNKUlZyD0UZ?=
 =?us-ascii?Q?sdndGuG5b3tae2wxWNr3aM1s3zqtNWYcKjj4syB7G6hT36ys4U9ApAfE+kkX?=
 =?us-ascii?Q?DDSKfLswC2vnLc2ZePLK81w1b4st6Zkf3YKX+G9jt50zQ3PhzZfG9j1vvqqf?=
 =?us-ascii?Q?sqEvfQgkBIwa8ceuV7qWAUtIvoikpOV8495u3E0oEXfeb2s3FkWNwGI2p9u7?=
 =?us-ascii?Q?WCO4Y8xh/TSvNP95Mt/AEQiivkRQrQ4PEMdFRCUsZZVMyYaZGcHUheuQ2oKW?=
 =?us-ascii?Q?fLehFx4mFUmNft30HALeNilykeLzPJx+AYVza6TJPNQbY+1AcclnGMLnSSRE?=
 =?us-ascii?Q?UY9V3Ru31PHdvosX18m0OZTFTEl/sie6mCfar39kcRqPbOC5o4W/4vy3nLjq?=
 =?us-ascii?Q?qSHDG7xztb0+APheTyUk2yhlnuvVzHBKaFcaG/YhN+FJ+5Oih2FcGyvRLx0R?=
 =?us-ascii?Q?fDOKdDbIFUe5iv72GWNU0jmz7Ez57H5S5yeWB058091l+FEvSQTtY31UXSCt?=
 =?us-ascii?Q?YWDi3yp9im1S99cjT3TnMWiIDIs6tizyXIJ1wLkopBwgg96x+6g5SctQ2Vdq?=
 =?us-ascii?Q?fFzorS83YW6u3Oi/2vVtcE8csFYrEgV7TnK0Zffu4JlAQeNpde09XuJE9MHK?=
 =?us-ascii?Q?3KS7Nf/AQit91ov8HU/35Nmn6dsnXC88dmJ1dLr05S+iZ1YnD1QnD3oyc5HD?=
 =?us-ascii?Q?hxQ32dYbOb/9Ha/P/IrbTjFOEGAV4C+5w4pl2sb4E2cHmyKb7DK2WInY6XQ1?=
 =?us-ascii?Q?oqJ4WbItD9RmMDO3B9l/or7ltKsYXGJKRyqbgecV0t++1ZLtPkRlG4JDOCAi?=
 =?us-ascii?Q?k+1C64akn6fokDDD0W+SVc4bBsHGi1EeBxQgcRHfTSyQqhQoz+QfG1G5YHMk?=
 =?us-ascii?Q?wGvmYAtV3kPzO1d3S43xJXrLv1TL/S6yUa1ZeVVVGQJeZ63oWj/+UXJJN7db?=
 =?us-ascii?Q?1rc5SkrnPcW3c1xWHX7pIXJvdTiLqF+5i0iNSNGEbB1OdiK5ib5j2x+affoe?=
 =?us-ascii?Q?6ajO9pNNjAjzkNLopQPPbnXkFu2EqWBG8pFuXddQ/OyE0XJe8WgZ8eKOnoDQ?=
 =?us-ascii?Q?HfRo7hWl5p4KX8Tjrk66sO4FIkbjesWdBCitP/7HHEyF0W5av7OQWuH6pBdl?=
 =?us-ascii?Q?Od6Slkss1rvlNCdWJ7jEdzYm8D8vK1wLcs2C/cWgbJqhN61niJhKH+3b+Egd?=
 =?us-ascii?Q?7yV/uPF5Zz4UFAk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:37:46.7426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8878d442-59a6-43fd-ca9b-08dd45ea46be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072

To enable a more generic approach for concatenating MTD devices,
struct mtd_concat should be accessible beyond the mtdconcat driver.
Therefore, the definition is being moved to a header file.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/mtdconcat.c    | 12 ------------
 include/linux/mtd/concat.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f56f44aa8625..6f2aaceac669 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -20,18 +20,6 @@
 
 #include <asm/div64.h>
 
-/*
- * Our storage structure:
- * Subdev points to an array of pointers to struct mtd_info objects
- * which is allocated along with this structure
- *
- */
-struct mtd_concat {
-	struct mtd_info mtd;
-	int num_subdev;
-	struct mtd_info **subdev;
-};
-
 /*
  * how to calculate the size required for the above structure,
  * including the pointer array subdev points to:
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index d6f653e07426..b42d9af87c4e 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -9,6 +9,18 @@
 #define MTD_CONCAT_H
 
 
+/*
+ * Our storage structure:
+ * Subdev points to an array of pointers to struct mtd_info objects
+ * which is allocated along with this structure
+ *
+ */
+struct mtd_concat {
+	struct mtd_info mtd;
+	int num_subdev;
+	struct mtd_info **subdev;
+};
+
 struct mtd_info *mtd_concat_create(
     struct mtd_info *subdev[],  /* subdevices to concatenate */
     int num_devs,               /* number of subdevices      */
-- 
2.34.1

