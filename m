Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E120B801;
	Mon,  3 Feb 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600768; cv=fail; b=IPXLK5Hq6gaLypuWDL20F4WSKJ13VQgD1N3MlByTMggG8i+02VGK//JcfyMnNG0/8GJN3t0hQ+zg3+9u5xZWd+aWaxa9rq5F/OnYbLlm12LxFVDpybaKt3hnbsbSKd6m9j4PMzpMaf1nTVyGHuX7rKl95oYUcz1mcliLy0+7jHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600768; c=relaxed/simple;
	bh=SRKiQvcGNEMRm/4GUXAPfsYw74I79ay7nhdSUnx+Yig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leiMVWFAFLIAanT2NYjVnPfTeZTx4KTau89EzexejvowD7tSIIe8kiadhTvWANvtyQSBVC7lB77XQMM9/HJXXFGn3xIrQyf3oxNIx5wVHdk1I4yXTFjiWi4qxJjn55unYT+/21evbSPg9G7p6ygVSNccelc+5+UbJD7yu49/ALo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cucqjrmi; arc=fail smtp.client-ip=40.107.100.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cucqjrmi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZHkmIE7d/osBYC3iyqNVjl1IX9E0feqJQqM5yvYDTV7KTpbexGaOhbYSPQwaJm+DY3Eb+A9GBDkySfSl4d55IW3arN/kR20/cWI3WPxFURBYoRiqfchxWvKiCBPCMarcqoYYPGGl+8kceEX8tK0KPpuolYVSm5oR5fGBShd5air3MQx9Owu9zHvq5TXkg7FhcHwx5ESWYj3PCShITGssAwnssTrnGLW76MG8Ex+cRIkr1bCgdOG9CFCGbUsHIKEJNbW9harmy81NT/zb25US83ZmGOuANrY2m0oDSfreqTEO8xW+15yLSmPY4n5n9Bh53teE+s5U2g/ChdRPBc4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wn2rlqCQZUL4PxOBMb33QP51ZrUhOtl9fvyyS8WAn2Q=;
 b=U8PRpZlXFOOV1JubouO+Lup5ZCc15GU63SbeBW2ISf9LRccXVAH5wevlqiqvuIrEjW9Fs26DvCThp4Pgs5VzZ4tGFaNLGnZTAFb8ABJtgu0CrqYH6mqfzLWDnhfcmvnLNuduHCr+/ZaIie/3ohN4V4DXKEq8w4LrjE3DZjJFgxlcaDu+2n/v/j9lC+f8P7ODGycNC80UykLgJvKhWfy8Lu/ZxiA4F8AdKZ4wqVyghRXTlv95/MHhehFEsR8+fvjVhG0VhT8/gtXiOcYPciyefii8AIOh+/7zkr4oznheneA2h4pwROBqAmKxI+LJUqPoJUwxirB/fwQ3R4vqTcDBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wn2rlqCQZUL4PxOBMb33QP51ZrUhOtl9fvyyS8WAn2Q=;
 b=cucqjrmiGPXJt6Azegasg6GspwwOtmKAYBfm2gQ7thQGgkQaLO8WGlYaiP/m2Ugt3ijKPzV2uaXHTJnXk23hLlUmChuNZGXufuYAfol3equU+83KqAziRmDjz5AS8s9j5Frcds0xKouYXlawHB2b3veN36hobOy6Qbavm6tmQMg=
Received: from SA9PR13CA0072.namprd13.prod.outlook.com (2603:10b6:806:23::17)
 by CY8PR12MB7361.namprd12.prod.outlook.com (2603:10b6:930:53::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 16:39:21 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::8) by SA9PR13CA0072.outlook.office365.com
 (2603:10b6:806:23::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Mon,
 3 Feb 2025 16:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 16:39:21 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:39:19 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/2] arm64: zynqmp: Use DT header for firmware constants
Date: Mon, 3 Feb 2025 17:39:10 +0100
Message-ID: <c3f011812597f4c3095448726f5924b2334c7da1.1738600745.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738600745.git.michal.simek@amd.com>
References: <cover.1738600745.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=michal.simek@amd.com; h=from:subject:message-id; bh=SRKiQvcGNEMRm/4GUXAPfsYw74I79ay7nhdSUnx+Yig=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvQFH/Wui685ozF3RmnUrtxTL/ec71t0TT5Y3bq6zfSsN 89OzT3uHbEsDIJMDLJiiizSNlfO7K2cMUX44mE5mDmsTCBDGLg4BWAiRlMY5qf2WQg/vOHsav9x y9rztW8vRzHdXMswz+5pyz272dd4A5l2/D8u9pDp1jqVNAA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|CY8PR12MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7b9b51-c951-417c-8216-08dd44714fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5g6ZihDLpDTrZtHR9jCXtafn/+NBfeGLa4hzok1Of2xVxqQi7X8T1R6gMWb8?=
 =?us-ascii?Q?i8AXEItGNdlUt44pAvsfZJvi0Bi3mGIwRjgrvnN1LIhi9/c9KrnRrN3HcVsI?=
 =?us-ascii?Q?BVd4kLEGotyvn0ALIwUJ4tAo5nNDSygTE3hqKO1dc+4hC0UnwoISM57XwqI7?=
 =?us-ascii?Q?8sKNtzWHyl+OstPEcxGMzQCdsuxsJMMEPMfGOCj0/DX6JuKyRCIikh5wyMrS?=
 =?us-ascii?Q?iJ2vL0adc0I5B273sHaafscvpI1UK3J5qDL/c+ReCsM25G51jJDxahFB0ev0?=
 =?us-ascii?Q?CR6meAnH6eEAlHsMkTpOZ6W9HrsaT6FhKJQhfe6o32ynwTnayCv6vtUfw2q3?=
 =?us-ascii?Q?DPhhPVGghEqOxIeKpFdT3M72PBNJK+Btj0637cjNUl/VhLFeYpwb3bKxSxz6?=
 =?us-ascii?Q?+unEZWkGabeHJXeofcu1II78xViplrovktCDwaFN3JL6aBymTSICdzTa4PDL?=
 =?us-ascii?Q?YaEbSyZ0t/UEZ5PzFVGoy63YY7LNYgsuvnAU/62NV07dTnRhB3a7k6ydChrt?=
 =?us-ascii?Q?VESzSe1tA6nJqdP7Y63wA+EDkpkjutOzhvzXzpdVIjcLAmpOZ2M6/fNUXVAq?=
 =?us-ascii?Q?tJRghvdR6Qq22r8hFLVqwD0pFbRIQWTfIdmwzaZBYYjSELbIKmlaV/Wp2blQ?=
 =?us-ascii?Q?CVNBJnrQ6JgmqSyvC6YDL6Xf2Pxdb04qf7ic/+JqrUW235++K2gQ1p1fc0Ch?=
 =?us-ascii?Q?c+7onnMxE97wfSS3CmMKHfijRrHGrPBlsdLwY+2dcFKSgBsRvV2LwT2g/V0C?=
 =?us-ascii?Q?L0i825nQLoZhp+4FpS8Q+0c9NAmz6XFDDoLB5sQE/uK7B3e0HH1NPwrcjGJR?=
 =?us-ascii?Q?+hawYCA9VJHtUpFm5mbgZTthgluEsJtNql978rWYI2ksjVNukYal16woXhFv?=
 =?us-ascii?Q?QV9YOovEJIEH3+5Mr1FOrz/qv5nIZfYgQ+mendwSIxxk8ySzAudU442VSmVC?=
 =?us-ascii?Q?CWgwsdcl/Q54CRjjeymMZExtMFRFZ1scEsaVDy/IriKwr9r21t0nXV2wfKww?=
 =?us-ascii?Q?gxbIG8n5FU5sdHon+ddQn6rnGU4ti/iVjM+b01j9Dtrv2F3yg1mNbeFXpFE1?=
 =?us-ascii?Q?4MDmytWwL59DDaU15DGastYfKCH5GeocLiRdgzo9ygsuJW/kPpOomiW6vAjB?=
 =?us-ascii?Q?lDQAQQ85+60QMp1aX8peGvkZtX0mJcGrhNTqu6DPqoQr0+cbMDXQAEEbUWkw?=
 =?us-ascii?Q?jbSKl50oezlIp0OBO6HOAeIlmtdsgGv4tWz6Ug0zuwa1B/YkT2Xb8avpi3Vw?=
 =?us-ascii?Q?qedmQ5UvxJnC1aKLEDsdmFuXAfZJBJ3x2Jj+7LOD8gZ+cA93UdrR/lDHPdYb?=
 =?us-ascii?Q?5PJsU4j39svcHJm0eWc3fp2E7Uo/V+7JKdnAg0DyO5IbjQecPLqM3CBE5e7A?=
 =?us-ascii?Q?JMcVurfoor4pOWovUlqiJxXdeE1zhRmZ47gN80DkbP66guFPEbIlH463kRht?=
 =?us-ascii?Q?n79jA4JsTeGLxwFOK89MFEEHQs7t2ZVMX1JG/5j3fLoWuyB4JOjCrG6l2Ibu?=
 =?us-ascii?Q?haB3q979gti1/YY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:39:21.4462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7b9b51-c951-417c-8216-08dd44714fad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7361

Firmware contants do not fit the purpose of bindings because they are not
independent IDs for abstractions. They are more or less just contants which
better to wire via header with DT which is using it. That's why copy header
to platform folder (align macro) and use it locally.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h  | 126 ++++++++++++++++++
 .../arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi |   2 +-
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h

diff --git a/arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h b/arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h
new file mode 100644
index 000000000000..0aa17f2a2818
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx Zynq MPSoC Firmware layer
+ *
+ *  Copyright (C) 2014-2018 Xilinx, Inc.
+ *
+ */
+
+#ifndef _XLNX_ZYNQMP_CLK_H
+#define _XLNX_ZYNQMP_CLK_H
+
+#define IOPLL			0
+#define RPLL			1
+#define APLL			2
+#define DPLL			3
+#define VPLL			4
+#define IOPLL_TO_FPD		5
+#define RPLL_TO_FPD		6
+#define APLL_TO_LPD		7
+#define DPLL_TO_LPD		8
+#define VPLL_TO_LPD		9
+#define ACPU			10
+#define ACPU_HALF		11
+#define DBF_FPD			12
+#define DBF_LPD			13
+#define DBG_TRACE		14
+#define DBG_TSTMP		15
+#define DP_VIDEO_REF		16
+#define DP_AUDIO_REF		17
+#define DP_STC_REF		18
+#define GDMA_REF		19
+#define DPDMA_REF		20
+#define DDR_REF			21
+#define SATA_REF		22
+#define PCIE_REF		23
+#define GPU_REF			24
+#define GPU_PP0_REF		25
+#define GPU_PP1_REF		26
+#define TOPSW_MAIN		27
+#define TOPSW_LSBUS		28
+#define GTGREF0_REF		29
+#define LPD_SWITCH		30
+#define LPD_LSBUS		31
+#define USB0_BUS_REF		32
+#define USB1_BUS_REF		33
+#define USB3_DUAL_REF		34
+#define USB0			35
+#define USB1			36
+#define CPU_R5			37
+#define CPU_R5_CORE		38
+#define CSU_SPB			39
+#define CSU_PLL			40
+#define PCAP			41
+#define IOU_SWITCH		42
+#define GEM_TSU_REF		43
+#define GEM_TSU			44
+#define GEM0_TX			45
+#define GEM1_TX			46
+#define GEM2_TX			47
+#define GEM3_TX			48
+#define GEM0_RX			49
+#define GEM1_RX			50
+#define GEM2_RX			51
+#define GEM3_RX			52
+#define QSPI_REF		53
+#define SDIO0_REF		54
+#define SDIO1_REF		55
+#define UART0_REF		56
+#define UART1_REF		57
+#define SPI0_REF		58
+#define SPI1_REF		59
+#define NAND_REF		60
+#define I2C0_REF		61
+#define I2C1_REF		62
+#define CAN0_REF		63
+#define CAN1_REF		64
+#define CAN0			65
+#define CAN1			66
+#define DLL_REF			67
+#define ADMA_REF		68
+#define TIMESTAMP_REF		69
+#define AMS_REF			70
+#define PL0_REF			71
+#define PL1_REF			72
+#define PL2_REF			73
+#define PL3_REF			74
+#define WDT			75
+#define IOPLL_INT		76
+#define IOPLL_PRE_SRC		77
+#define IOPLL_HALF		78
+#define IOPLL_INT_MUX		79
+#define IOPLL_POST_SRC		80
+#define RPLL_INT		81
+#define RPLL_PRE_SRC		82
+#define RPLL_HALF		83
+#define RPLL_INT_MUX		84
+#define RPLL_POST_SRC		85
+#define APLL_INT		86
+#define APLL_PRE_SRC		87
+#define APLL_HALF		88
+#define APLL_INT_MUX		89
+#define APLL_POST_SRC		90
+#define DPLL_INT		91
+#define DPLL_PRE_SRC		92
+#define DPLL_HALF		93
+#define DPLL_INT_MUX		94
+#define DPLL_POST_SRC		95
+#define VPLL_INT		96
+#define VPLL_PRE_SRC		97
+#define VPLL_HALF		98
+#define VPLL_INT_MUX		99
+#define VPLL_POST_SRC		100
+#define CAN0_MIO		101
+#define CAN1_MIO		102
+#define ACPU_FULL		103
+#define GEM0_REF		104
+#define GEM1_REF		105
+#define GEM2_REF		106
+#define GEM3_REF		107
+#define GEM0_REF_UNG		108
+#define GEM1_REF_UNG		109
+#define GEM2_REF_UNG		110
+#define GEM3_REF_UNG		111
+#define LPD_WDT			112
+
+#endif /* _XLNX_ZYNQMP_CLK_H */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
index 385fed8a852a..52e122fc7c9e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
@@ -8,7 +8,7 @@
  * Michal Simek <michal.simek@amd.com>
  */
 
-#include <dt-bindings/clock/xlnx-zynqmp-clk.h>
+#include "xlnx-zynqmp-clk.h"
 / {
 	pss_ref_clk: pss-ref-clk {
 		bootph-all;
-- 
2.43.0

