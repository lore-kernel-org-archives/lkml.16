Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF64301136;
	Wed,  2 Jul 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471817; cv=fail; b=ruQLdfNeTCzvTfxkZD4LiFObPQSip+snxpUmzeWSW5X+Yz82Sc104EzoxUZJuP9JffjrBnarQ8dLICjafyeDEHU8KFpxOtfhTrriKmsgzi9Z0vDrFVrOM5nTZKCJ3lXsvdcBcS4/WaN8XLn99aFWTC+V60Ym0IO1lrdVAF7izjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471817; c=relaxed/simple;
	bh=OFFehtcvDNqd0teoQK4hGb/OxCM6JyYHvn/4et8YNT0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRAL0eARI4baliM/yuHmfczOicBZw+ARR56WFUDsDxvGOvgd6+iBuoQtzbyuCIL5HRmrW2pQMhW0HQWDrmMa51fk7c0jzt616IWCq5RmsA/zV82s3/ZSmR8V2vL/6yt+hLEsOOhXHf+ie/dwnPpS1JFNWLUpMniX84rcZpC+IHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lQEP/fZM; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lQEP/fZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNvfoUg1WmgBmwICbxKl3tCAnbIz9QYF+yJZo/IMOm6yUEYVKObE6eSFqqEyqK23jvnbEIpVOJDpaEyOquXNaPk1rqIq7IE1gY188yFVEOCa/9pqTDeYQFdJ7Hcy88ncyitkbuQSPaPKekcZKF1T2mfLHI9RsiL4ZJmPEfGgsWdHa/v7Tgxzm9MrxEWV9vCTR1QKpvf7I9HNvGHXLWpZ3GFcWq8bkY0nE9g47H2UwMA8valquHSMt26wVAUH8eLPhkBLgnWZl0jHe/xt7JbHBZLkWxnRq2HxJUlbFC9pyPbA4VFNEo4b4xNNIPL26aGgVh2ZIx+p8H9A6XLx7EUYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAtbRtZeUwmOdtlonTJrDR6RlOBMrOsYhe4fWNIQVbM=;
 b=Av84sRSk49FGoaYuYvn5VDjeIICaCqwOP2vvV/n4Vp1z4TniNixN6Z1UdXKwi7eSDgmthZng8YlhQynCgzOgA6CMnUzoywWYUhUXyCpG818lFMxnaFNxFwE7vrPUgvi+JVe176FIs0kV2X0j91jZEQI17xjM7Bd8gngJM14c6DE1aH4pvxI5zKuFu54jm4C9aD+CcPlMPHe17bCzUKkrSoqkEGVn9MUDhs+T3Qa9aUo9NV0PtV0xyrYEBySCY8+2PSJ+TiHSCD4EdHQDCVtSjwa7+atgpg//NnfHa7Di2Xam5nkHozMRM2JKSJ8/b1c07Ao2ttraLwlPfD5MEsgmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAtbRtZeUwmOdtlonTJrDR6RlOBMrOsYhe4fWNIQVbM=;
 b=lQEP/fZMXcei75xWMKCSglPizYYnmert8kiAO/HWBtCqW2sbltvT55aHc+PYTAcQV9zuleQT3L+7I9GQTcJoLKbMfVNmWNWG0LfX+58E4TfsmUz7A6ykvMfBcVn7N4qWwe63J6sYOupXQMDwSq30D0LhOXBTfqglhmVq7sztx3w=
Received: from BN1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:408:e2::30)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 15:56:48 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::7a) by BN1PR13CA0025.outlook.office365.com
 (2603:10b6:408:e2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.18 via Frontend Transport; Wed,
 2 Jul 2025 15:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 2 Jul 2025 15:56:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:42 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 10:56:41 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V1 3/9] dt-bindings: power: Add AMD Versal power domain bindings
Date: Wed, 2 Jul 2025 08:56:24 -0700
Message-ID: <20250702155630.1737227-4-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 2feff4ff-a995-4bab-3f34-08ddb9810d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2lP3AAtDEsOD8TDFNmk3Z3+AXeLJMjKk+Vq3E4lhTxr0B4DYOMLfe0XsOlz1?=
 =?us-ascii?Q?LzwJzJhdGtVrrOu92ebLPizaTxHLeC8aZDTLWEPTfeEojc8nYf8LJ0PikFFi?=
 =?us-ascii?Q?JvaIX8bhzhqnVoy9QeIzkdfB7XRnv2cxPV/Vq/54/iuah4vqMIjYu4ebWcfH?=
 =?us-ascii?Q?VvRHU1QSxyWPXF5ykdoNAbLS/OOTs9R3k2b4DVInZ1PS8Mf6xJNAQT+uz8Ec?=
 =?us-ascii?Q?zNF8nT8t5VQBDc6AR7HJbvPN4D4Rihjd5+W9De9q+Adq55CZWXoSn7aEs5wH?=
 =?us-ascii?Q?8FMz+hkqBAYUAzENTl4uc/X7PrqvfMtVx4/8IMubw2K4ubr4J562j2VtFvKS?=
 =?us-ascii?Q?Uv8jHmnhxI40x++1wP16Ho916yVtfQHjyUzd+d/LEG7aITCu96hOho7TBUSn?=
 =?us-ascii?Q?X0wx1pDgj0ZXAWm7dnEXm6SagMOC49l63BNoGOkvvih6HW0YMU9lz67kuYxG?=
 =?us-ascii?Q?U6s28uoC7Pbk2mMYa9NvMsgUjF0HLKvEctT6WDuFDr3YFz/+4HWfAT9nteBZ?=
 =?us-ascii?Q?CTAkyA1+EvO01m9+iCfOjnrpgveGDoMmEBi+i97gFt2VtMJD4hbmQeSU5GZP?=
 =?us-ascii?Q?ZVBms6zELguFxEKxLa/lWvqtT4hN5lbjevnCB/J2zsDb05yg1Z+ci8+mDYoc?=
 =?us-ascii?Q?uqGdc5zqJIJEXHgVVVPRBRT/P6NiUIpb00dLCkc0lCTpgkw4nWHnD1m686fu?=
 =?us-ascii?Q?GBxDOTquVfBxAmjFgRwMHM9Ib8kE2yrLMglJDy11S+oH+ACVu+I2aPQx6vDi?=
 =?us-ascii?Q?C0JqRDtEWf5SjCABUKiYV8LgFIcI2TklC5qrL4JMFdf3xvMkNVmR1XBwTGpW?=
 =?us-ascii?Q?uK4iRGujgOYi6n/htsKLdH6nS2GUb7T19u39C++Cmq8QvqrhGLcCRwBl/tig?=
 =?us-ascii?Q?uIiUh2H5E5uxrJaKyvwuJrrAcGroZvFu0WzYpwXqzhuD43y3TlE4fqgJbOjC?=
 =?us-ascii?Q?151f6w4nBT8aLXPnemCls/nOv+bVLxBvMucn51Czr3TJFV9jYLBaQYcgQsW9?=
 =?us-ascii?Q?l/ll0bY0JAOuVuF55cnNQM280/I6SNZmMelQYBgl1xKRZvh+YRsyqh+9bysw?=
 =?us-ascii?Q?mVPdURxYw/KJABuL5bjy3l6l5r036vPoIrVh3gWdq9sod1yIlGMLvRq5PhXA?=
 =?us-ascii?Q?l5bDz8Fb+4HskaRE/Lp49vLlTMpfjDb9VWEbEg7/mGL/Ep/yAPt8TXs95k6E?=
 =?us-ascii?Q?ofB/4tRfgvFbaXXT6vIt93qao9Fcfpk7py7HOyW42oq5nVjhQWUbwTLNL41o?=
 =?us-ascii?Q?5sYEPKfvkgRfw0iNmxXiRnk0dxymU0oFTskwj4BaqTFalmqEq19fLKfhp3D0?=
 =?us-ascii?Q?Xs8xkSsAqj6V2PaQCZTHi6mevpxE0X4GmvY6PdRnM4tUtsnbCK55dRxW0Goy?=
 =?us-ascii?Q?jPFz+afutM9+C5RwoLW9WqitsQO5grA474Av5/JPaELrdbENGkkkRvCgnGzJ?=
 =?us-ascii?Q?eTYkJ6ZdeX4CZuU9kK3KkakHghMznqaPY9Pcn3oy8hL0EiFqyRlCsg5mmUbD?=
 =?us-ascii?Q?//VJHXMNgq6oLr67Nr7u8bEOml6+tYKkfCjJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:48.2525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feff4ff-a995-4bab-3f34-08ddb9810d62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611

Define Versal power domain value macros.

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 include/dt-bindings/power/xlnx-versal-power.h | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 include/dt-bindings/power/xlnx-versal-power.h

diff --git a/include/dt-bindings/power/xlnx-versal-power.h b/include/dt-bindings/power/xlnx-versal-power.h
new file mode 100644
index 000000000000..effbc70e5a12
--- /dev/null
+++ b/include/dt-bindings/power/xlnx-versal-power.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ *  Copyright (C) 2019 - 2021 Xilinx, Inc.
+ *  Copyright (C) 2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _DT_BINDINGS_VERSAL_POWER_H
+#define _DT_BINDINGS_VERSAL_POWER_H
+
+#define PM_DEV_RPU0_0				(0x18110005U)
+#define PM_DEV_RPU0_1				(0x18110006U)
+#define PM_DEV_OCM_0				(0x18314007U)
+#define PM_DEV_OCM_1				(0x18314008U)
+#define PM_DEV_OCM_2				(0x18314009U)
+#define PM_DEV_OCM_3				(0x1831400aU)
+#define PM_DEV_TCM_0_A				(0x1831800bU)
+#define PM_DEV_TCM_0_B				(0x1831800cU)
+#define PM_DEV_TCM_1_A				(0x1831800dU)
+#define PM_DEV_TCM_1_B				(0x1831800eU)
+#define PM_DEV_USB_0				(0x18224018U)
+#define PM_DEV_GEM_0				(0x18224019U)
+#define PM_DEV_GEM_1				(0x1822401aU)
+#define PM_DEV_SPI_0				(0x1822401bU)
+#define PM_DEV_SPI_1				(0x1822401cU)
+#define PM_DEV_I2C_0				(0x1822401dU)
+#define PM_DEV_I2C_1				(0x1822401eU)
+#define PM_DEV_CAN_FD_0				(0x1822401fU)
+#define PM_DEV_CAN_FD_1				(0x18224020U)
+#define PM_DEV_UART_0				(0x18224021U)
+#define PM_DEV_UART_1				(0x18224022U)
+#define PM_DEV_GPIO				(0x18224023U)
+#define PM_DEV_TTC_0				(0x18224024U)
+#define PM_DEV_TTC_1				(0x18224025U)
+#define PM_DEV_TTC_2				(0x18224026U)
+#define PM_DEV_TTC_3				(0x18224027U)
+#define PM_DEV_SWDT_LPD				(0x18224028U)
+#define PM_DEV_SWDT_FPD				(0x18224029U)
+#define PM_DEV_OSPI				(0x1822402aU)
+#define PM_DEV_QSPI				(0x1822402bU)
+#define PM_DEV_GPIO_PMC				(0x1822402cU)
+#define PM_DEV_I2C_PMC				(0x1822402dU)
+#define PM_DEV_SDIO_0				(0x1822402eU)
+#define PM_DEV_SDIO_1				(0x1822402fU)
+#define PM_DEV_RTC				(0x18224034U)
+#define PM_DEV_ADMA_0				(0x18224035U)
+#define PM_DEV_ADMA_1				(0x18224036U)
+#define PM_DEV_ADMA_2				(0x18224037U)
+#define PM_DEV_ADMA_3				(0x18224038U)
+#define PM_DEV_ADMA_4				(0x18224039U)
+#define PM_DEV_ADMA_5				(0x1822403aU)
+#define PM_DEV_ADMA_6				(0x1822403bU)
+#define PM_DEV_ADMA_7				(0x1822403cU)
+#define PM_DEV_AI				(0x18224072U)
+
+#endif
-- 
2.34.1

