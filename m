Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADAF187346;
	Tue,  3 Jun 2025 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748979770; cv=fail; b=hRLj1BwQjjcvfNkP6eqSsPXyO+1D/LsN3BjP4oj7Fuaf5PIRDnQHnl0g8w9GT5YdEp+/GTYgqGBwFaqulYwJ2wALY1y2/yhLkJ6CIIrK/uJqPambetqlIFKA/uWZDhZATBOlzaZ2o6VH5zJ/jWmLytoFrPIz0wVnV9rGEON2Bfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748979770; c=relaxed/simple;
	bh=UZDyFGMgTDm9QveolAnHTNZTCq9S6cOnsnF7ZNrDelQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PKsRQinyGkA+lOOcbXbgjNJJPJczSHAbXdjjr4rFoX7gO2ksLQu7hm7474uZUfg+i+/CjGxZzoxPeCSUpWLIeEYSALBoaLmqPVlUmsj9V+qzYJyVy1J0i8fIG8d/MMVzSXZ2s32N0EYzl2U/XTsfJsfefVs8X0OvlCfHU+ssMHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GANB3rVO; arc=fail smtp.client-ip=40.107.92.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GANB3rVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLuYvETRddDUUJBv1mk3WV7hFipM8JVpAHNSJf2TAIpdAGAky19ok2QASxuT/En2JhsRXKdHkTzSdzrh6vsqbwTWSsBP1nec5oPIVLpNoTGQ813EJB1ATWJFRoi2DEH8IKFAN6/eWn2NkJDEG/yL1k5ZCTT3JedF90oe6vttsVIn0Ti7rlFalVhOSvZ/j10uX8DTEIoiWxFKeAoqq7ezoyOsoFYCfvcnj7xz0yJ0NQ0UEtUcBuCkCMRhAADiscjgeLrzORmhmI0dilr5YS623QSytFMiVE9Re3PnSu0eMjZn1NizzLealzSc5/3Zhd5vCUXpfU4+FZwqTdwPiAdwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=xY0PwWpNjtTUWAfRPc0x/qcqeL6ytBpkESALMqyTgtraPYJEwHjNcNSZ0S1MR/osAIprK3yTKzuIvlzphjCP+llG1KLXVC2LJzMlzLtQ8N3cKu2/KFKvrB68mbTgNOr+lKM1VImVaP+PWQ8S8/mY8p0D8D2RoX/JA4ClGlC4QiD9gKuz59GgnuScZzVuk8oV40bpM0Lwoq2gq/O3gz2EePaL7n1bCR/nS8jR3Qcerg6xyF6gciwcoPNub/TOmOtj61/as5yNyy0gvQDwSFFBFsE/zsNFYleIcHczhjivX4FBChPxz8aOb+jEb/VQZpMXpkYWCq8+mTWuYrCEkeyKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=GANB3rVONi00cVhhssjoqOPVVeA/lGW8Dt7/WH1fH1eUD5UzfperXeLP9QJcRl3xvgrHt6Yw4oPfm2WIn24OQn4mbYASPI2fZdB5Az/ctl5N4g45KjmTxRGm36o1eVOiiIKKWXu58wRbGs5Io9bkBiHEAoKBRnysQQgjQ0syYLI=
Received: from MN0P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::30)
 by IA0PR12MB8981.namprd12.prod.outlook.com (2603:10b6:208:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 19:42:24 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::2f) by MN0P222CA0028.outlook.office365.com
 (2603:10b6:208:531::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Tue,
 3 Jun 2025 19:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:42:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:21 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 14:42:18 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v13 2/3] mtd: Move struct mtd_concat definition to header file
Date: Wed, 4 Jun 2025 01:12:08 +0530
Message-ID: <20250603194209.1341374-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|IA0PR12MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f33bd5-a745-4297-bf06-08dda2d6c311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1KXkgI4O+tzAw1kFnk1lXi3CyLsKAkhhrUllqxkvb/wI8rFANTl024rx8OHx?=
 =?us-ascii?Q?JFekO6qSaTY+QZsgmoBKt0fGFNjACdLgo95iJhufxfRq4d5Ot/DoO+o2BSQJ?=
 =?us-ascii?Q?G4eqVcTwBcZWTqq+rmPcO56qk5B2V7XPArFZH9Eo1vTLWRf3e4FmG58DOqdJ?=
 =?us-ascii?Q?HCedgQQ55iUWIptWmcXHTdGL78vtGPZvaty8YZGsP2t7g03EDUSMAANjs02o?=
 =?us-ascii?Q?HQqwtEALo9EjwOLz1wjuchJzSiH/dCEuSr8HjPRMrRE+3O/jiwLX5woOfoOO?=
 =?us-ascii?Q?0rRNO9YhBGRk1/T/4rJi5g05BRsHz7LAkJsqCGccnLzeREHbFD8QkjJ85lpD?=
 =?us-ascii?Q?0mSGxMJqQ10eSArnwzo5FE65Yc0iYaBsbPIv9A4yGezfXkr1pArCZ5kCLZm/?=
 =?us-ascii?Q?bqF3KDSmXT2pX3dcR7WVoCIC1WgonUUphd+knchudcbDWgWby4pRLnqctUUu?=
 =?us-ascii?Q?vngcDpIcCMA+HYwM4+dpXURaLAZ2bw7KqYzb+KkHuSyOp7Ag36v6jVS97nCO?=
 =?us-ascii?Q?2iJ+tTL4qh6KdESZ1mqn+2GBW1BXys0nER00RkRYcg9jnHiZxSAsNmxsqCMo?=
 =?us-ascii?Q?ArdOS+RqXs06nawiR+iLAzhT02IqCdw9IqC72VaLAM8clexZmeG0vVk4t6Em?=
 =?us-ascii?Q?BmIUK9ZI4oI8WaGjSAYAje/hEfp/bOLDcyz8LIR7hoL1eUPJ06023L9RpCcP?=
 =?us-ascii?Q?WSvXcfJ0PaJTL4cwYYvgnkv6+hCmJsruUSs+KhX7ek5x0M27kbVeMLFJU7GS?=
 =?us-ascii?Q?4cU2YExd2AKi4LDbBdFETHRyxKWfbcLMrqb94ZqMdWQ881wWmqppJOr/2ddG?=
 =?us-ascii?Q?PdYT2nHrr2TmTHWU7zcTl+dv+pT++FwDKeQEb/NWJxmay9CW0/qivicDwndT?=
 =?us-ascii?Q?Pj1jtIO7X01dkwpR/kGPfzaOvDFa+UVXCAoUdRyHOzhOmj7rCMdjxbKVJyOK?=
 =?us-ascii?Q?3R0VWZ4bmlyjcnv+wereBzOjkAd1R3Up6CO1B0Ys21ta4WOkvnf4QCe58AUv?=
 =?us-ascii?Q?rXlG6jCGp2n/gWOixMVCB2CQfUhh3w36YCUqCJikL/GGl5iSlmzay1sxyQqU?=
 =?us-ascii?Q?ygNZLhys7NZD2BG/CrmmdweTmg5cO3XtH1CXzzvNop3ZnUuVqX7bovFywRiC?=
 =?us-ascii?Q?tVxqbmGrZ/0s+4BcSTh5Lb0J37XzIHa9OBZPenrxxyPYhK8bXQ+j40RKM1Tg?=
 =?us-ascii?Q?R2WaOMIs1Elo7UBdARIdl2s7GGFE0f07p+c+r+YSSx3lIGSDZ8vwEGalrPsf?=
 =?us-ascii?Q?4ZAoAy19Lu8Ku/zjr8ZO3FhvVUlurTJ2VGCUa5R87UX6kObqCG+mX1RBTgJM?=
 =?us-ascii?Q?AcxBn1QuRlLq0FesaaJIoJRC7qGJ2tqO4dlJcODedUQIVlV9RFzG8XAkoBrx?=
 =?us-ascii?Q?KjhVRpywrlB8KHGlB7Sv8vKHZtgL4bjmlwcF7RG6vxONr66WlKVWV9FWt6gn?=
 =?us-ascii?Q?UsLBXsc+n5PivRfClJegbcNlSTpGZWxO1vn37noiiebxd/ywgjkUgD15nO/A?=
 =?us-ascii?Q?INsiqDzWDZx0TLXEKFcMtCLyHCSIxi0J38Lk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:42:23.5457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f33bd5-a745-4297-bf06-08dda2d6c311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8981

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

