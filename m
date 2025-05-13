Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022072.outbound.protection.outlook.com [52.101.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358413A86C;
	Tue, 13 May 2025 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101817; cv=fail; b=gvnftk5y/9gnG5ENKtI+CyRMFv4BB45WupGuQ2IVNdFrCp08w8JEBFGV+qenRwlCy6U4065UJQdmfb9AQtbwuCMkmIUJrO42GO3S7LpgB0tQ9CQps+OxVi1T5d4cAQ2bGSuF4gGEI3qpniaNJ5esE+dy5sOF3AhpeldjiLjhiRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101817; c=relaxed/simple;
	bh=fFoL3rdgjp4+y/5N+HrtFWZnayANAgkly/CdA1Aev50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xk0DaUJ387ksDarFK7/WSMrYcLP0XjoG0cxZHpOvEVvjtkmvxBbRK+Ft6cOWIRvCVtl1GLF4+dA13Ca2Zfd+1ZXgF5w7ktYXwvpVWxDlWRBBIGMEioZLze0I8dfyKKGB/YtT8fKnsl6mvi1U5bpqJXrd60+7HgWCXWldSFYqLtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+CWH+OMchwJ5Yj7JU1zhz/2hrCntdF+Hq91OEcIDXMKLA6zPh4QOHa9nFCzRURoYYoGqfwwmkTf7tVNFXa5ukbMTrNbKwO9Be/urS3Twi2lv3yvB5P1oSeegT/XDEBPif5n5N3y+vlyK0rO3zcyhC3hpH0NSPRDnNG6Wq0Inh89Gf/6o4fLJa4YLDx2CvL8GZ7E0KFwuuLlXuCj1Omw7lxeDCQS1kwIxX/7Wz7NQyGm76fwt78dv2XRFeQUJoNt0curNWJeMSBkWidrGXE9Jfa1fT0lJD1ZFYQnn1OUnP+zhrI+ZIjj9QzgTY/SMjx+hHjjp0i6trw+Aww8ERnBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaiwQNFdGChfGfZt4ATADiwB8lH9qKzjeyr/Osx7Dcs=;
 b=ql/NhAolQg6/7SyDr56Nk1LSly7ttD59LuH9PThl0O4EbaPWuexB6vBrNLxKfGc0J+/NkdWi8e+IozEgy77MZSI3CgB1jYEYVF3eVYzQaIa+SLVBf3ZtmW4+m8znl5sJJMyIsxJI9Ma9puQqPa5cW2LH/vb99sftFvX+dhbynKcwhUcV92smk46y8rVT5DFCd13UJ3RjvTQRsNcOXqj3fOY5op/Xyf/WchV5h2xE5FN8lGtyRCEqAVwe0/mKwJRZ6uqHUdBVDCBuJvZvIOVukx4GXXZlZf/maglfosFtBrd3I1x7M6Hx4TJlmtuNpBNF03pZGxWCA/DFV8KDJe4rSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b4::10)
 by TYZPR06MB5483.apcprd06.prod.outlook.com (2603:1096:400:288::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 02:03:31 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:2b4:cafe::d9) by TYCP286CA0092.outlook.office365.com
 (2603:1096:400:2b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:30 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A5BD2416051B;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Gary Yang <gary.yang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v8 7/9] dt-bindings: clock: cix: Add CIX sky1 scmi clock id
Date: Tue, 13 May 2025 10:03:25 +0800
Message-Id: <20250513020327.414017-8-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TYZPR06MB5483:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6977b810-580b-4b91-c453-08dd91c25c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jBEdeP2td090eNGky9V8e0NnIY80QLCTXXzVUftnDiAgZxkXtMqkWDsCWLy1?=
 =?us-ascii?Q?X/xHnEqTp4idtcFJI1Z08XxryBx2U1XmZF4zI7bYZjA52ic67ECxsH9G8WM2?=
 =?us-ascii?Q?7FPGRVoHFW4ovhFmUYeyDzgWYrJUEX1PfBj8leb4+mkkbnP75V1k9XSw2vbt?=
 =?us-ascii?Q?9dKgIFXPuOOebQa7ulUXdCsI6/Rm0qowSrSw66T+bPOlmaVBH3X1olel0t6O?=
 =?us-ascii?Q?GRmhtRPRBF0PaAeOsYScSULgm3jWknfVVKjZStyjd1vIjO02hjqTw9q7f5RD?=
 =?us-ascii?Q?D/i12lrs5vUWYirDQkni6sdaiUV6CqRi5DGo2YNJc0adaDUEME21QRB+bwrI?=
 =?us-ascii?Q?VwX/ugxUfo9RftWgSZ1EIOLqryPR/7DUe9Wb5ZTzd4DK1PIzIP3mVjZFUGoW?=
 =?us-ascii?Q?qdlEEFnfGZtVoaqKaZyVr5QN5P3d+gg8DDxZPYtKNso5yHInE2ILk9ki7Zo4?=
 =?us-ascii?Q?avu6YDAo0sU42mnylOmSeyBmcBD4ZPXTECm+dIUTSKG8F+zOIcfL3VaXkzsf?=
 =?us-ascii?Q?s5s+Ym0GGcFAKz1qNEzCpP1DJy8LdbUBJn5gWqmXProC6W20/X5Ek7FYc5aG?=
 =?us-ascii?Q?0x8mufw68NrSPz5BfQcLuj6LHf67RQ3S2+MSbXBhZtujUBpKg+Gb22t0pFJg?=
 =?us-ascii?Q?saJrmvzJ5fbpQjvkfu/8qXDt8cAGHJgaMMGkx0RIjmUcZekm0dFg2k1Tu2Mm?=
 =?us-ascii?Q?o50+RS5Pfkjvqe66L6w4Wz0g7NAl1Dn0J7K5lJITP3Xge2EUFb0bdwxTH9cC?=
 =?us-ascii?Q?YN3fmsHJayAFVd9gSJDlJVwW4bOXMVg/F7DR5iNzRi6X2nxwhqcY+Sqxu/No?=
 =?us-ascii?Q?ulwlPV0Qg5uVQTU5Zgtu1Wl7txx3BgfR3VET42APNPpw3NUHOF/gzfp46Srm?=
 =?us-ascii?Q?Acf+t4MSikkNhuGnH5BkvkZANcnXfnhVP3C9zRILF4YFd4DIDV9gcyQSzwbi?=
 =?us-ascii?Q?5WIKEVGXEnQDyQwHXYbcSBgS0dSL86fjdacr7Ervoy5mwLippxKVT/w1ktCT?=
 =?us-ascii?Q?6lJKqFUpoStVv5KIzrkK+PJ6wHfs9DMCkADOXSf4taD3KhtxW8vtmN+i/zKG?=
 =?us-ascii?Q?E6VztWHlzdWrZeEHCUknDDwnUQUsTZsHmDq+9HHZaJhEM9V9H6gT4t/5ceoz?=
 =?us-ascii?Q?oxrGux4NhOe6GR08MJP4C7Wfm7DkIoMmERGHzzUx8SBAvECfeU9fv1M7czpl?=
 =?us-ascii?Q?L/qcpW+fWyYZTDN55KAHC11w9NXaVtQdqzWjUmFh5R46MnrqQ6Obg+3Qtim/?=
 =?us-ascii?Q?Yq5jO8AEZOHykT0wnJiuEWOI0eGIV7VvE/7DGmZ/lyWtXn2aa/yAkLagUdpR?=
 =?us-ascii?Q?uXaG5MPR3ykkyZvponnNkA6UtgE4s5dVn0rZ6kQAgkPojXwrhxGK3AwlqALT?=
 =?us-ascii?Q?eWCCMb3K7LRutdrRBPWxAlZKKcQnlsU/+KZNnT4ElKLpxtT09c3y6tjHXhx8?=
 =?us-ascii?Q?tHN5v+xtlpQ0kyxy2Wk9CrlAww7DUEOX0OMytCDYbfj+JKk2U5csIeTMK44V?=
 =?us-ascii?Q?pYealGHDQ0rbKLNmoVRMOa7wNn4DkqODWb1D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:30.4820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6977b810-580b-4b91-c453-08dd91c25c0a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5483

From: Gary Yang <gary.yang@cixtech.com>

Add device tree bindings for the scmi clock id on
Cix sky1 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v8:
- Add Krzysztof Kozlowski's Acked-by tag

Changes for v7:
- Rename clock binding file from sky1-clk.h to cix,sky1.h
- Add my Sob

 include/dt-bindings/clock/cix,sky1.h | 279 +++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)
 create mode 100644 include/dt-bindings/clock/cix,sky1.h

diff --git a/include/dt-bindings/clock/cix,sky1.h b/include/dt-bindings/clock/cix,sky1.h
new file mode 100644
index 000000000000..9245ebd1e80a
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2024-2025 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_CIX_SKY1_H
+#define _DT_BINDINGS_CLK_CIX_SKY1_H
+
+#define CLK_TREE_CPU_GICxCLK			0
+#define CLK_TREE_CPU_PPUCLK			1
+#define CLK_TREE_CPU_PERIPHCLK			2
+#define CLK_TREE_DSU_CLK			3
+#define CLK_TREE_DSU_PCLK			4
+#define CLK_TREE_CPU_CLK_BC0			5
+#define CLK_TREE_CPU_CLK_BC1			6
+#define CLK_TREE_CPU_CLK_BC2			7
+#define CLK_TREE_CPU_CLK_BC3			8
+#define CLK_TREE_CPU_CLK_MC0			9
+#define CLK_TREE_CPU_CLK_MC1			10
+#define CLK_TREE_CPU_CLK_MC2			11
+#define CLK_TREE_CPU_CLK_MC3			12
+#define CLK_TREE_CPU_CLK_LC0			13
+#define CLK_TREE_CPU_CLK_LC1			14
+#define CLK_TREE_CPU_CLK_LC2			15
+#define CLK_TREE_CPU_CLK_LC3			16
+#define CLK_TREE_CSI_CTRL0_PCLK			17
+#define CLK_TREE_CSI_CTRL1_PCLK			18
+#define CLK_TREE_CSI_CTRL2_PCLK			19
+#define CLK_TREE_CSI_CTRL3_PCLK			20
+#define CLK_TREE_CSI_DMA0_PCLK			21
+#define CLK_TREE_CSI_DMA1_PCLK			22
+#define CLK_TREE_CSI_DMA2_PCLK			23
+#define CLK_TREE_CSI_DMA3_PCLK			24
+#define CLK_TREE_CSI_PHY0_PSM			25
+#define CLK_TREE_CSI_PHY1_PSM			26
+#define CLK_TREE_CSI_PHY0_APBCLK		27
+#define CLK_TREE_CSI_PHY1_APBCLK		28
+#define CLK_TREE_FCH_APB_CLK			29
+#define CLK_TREE_GPU_CLK_400M			30
+#define CLK_TREE_GPU_CLK_CORE			31
+#define CLK_TREE_GPU_CLK_STACKS			32
+#define CLK_TREE_DP0_PIXEL0			33
+#define CLK_TREE_DP0_PIXEL1			34
+#define CLK_TREE_DP1_PIXEL0			35
+#define CLK_TREE_DP1_PIXEL1			36
+#define CLK_TREE_DP2_PIXEL0			37
+#define CLK_TREE_DP2_PIXEL1			38
+#define CLK_TREE_DP3_PIXEL0			39
+#define CLK_TREE_DP3_PIXEL1			40
+#define CLK_TREE_DP4_PIXEL0			41
+#define CLK_TREE_DP4_PIXEL1			42
+#define CLK_TREE_DPU_CLK			43
+#define CLK_TREE_DPU0_ACLK			44
+#define CLK_TREE_DPU1_ACLK			45
+#define CLK_TREE_DPU2_ACLK			46
+#define CLK_TREE_DPU3_ACLK			47
+#define CLK_TREE_DPU4_ACLK			48
+#define CLK_TREE_DPC0_VIDCLK0			49
+#define CLK_TREE_DPC0_VIDCLK1			50
+#define CLK_TREE_DPC1_VIDCLK0			51
+#define CLK_TREE_DPC1_VIDCLK1			52
+#define CLK_TREE_DPC2_VIDCLK0			53
+#define CLK_TREE_DPC2_VIDCLK1			54
+#define CLK_TREE_DPC3_VIDCLK0			55
+#define CLK_TREE_DPC3_VIDCLK1			56
+#define CLK_TREE_DPC4_VIDCLK0			57
+#define CLK_TREE_DPC4_VIDCLK1			58
+#define CLK_TREE_DPC0_APBCLK			59
+#define CLK_TREE_DPC1_APBCLK			60
+#define CLK_TREE_DPC2_APBCLK			61
+#define CLK_TREE_DPC3_APBCLK			62
+#define CLK_TREE_DPC4_APBCLK			63
+#define CLK_TREE_NPU_MEMCLK			64
+#define CLK_TREE_NPU_SYSCLK			65
+#define CLK_TREE_NPU_DBGCLK			66
+#define CLK_TREE_VPU_APBCLK			67
+#define CLK_TREE_ISP_ACLK			68
+#define CLK_TREE_ISP_SCLK			69
+#define CLK_TREE_AUDIO_CLK4			70
+#define CLK_TREE_AUDIO_CLK5			71
+#define CLK_TREE_CAMERA_MCLK0			72
+#define CLK_TREE_CAMERA_MCLK1			73
+#define CLK_TREE_CAMERA_MCLK2			74
+#define CLK_TREE_CAMERA_MCLK3			75
+#define CLK_TREE_AUDIO_CLK0			76
+#define CLK_TREE_AUDIO_CLK1			77
+#define CLK_TREE_AUDIO_CLK2			78
+#define CLK_TREE_AUDIO_CLK3			79
+#define CLK_TREE_MM_NI700_CLK			80
+#define CLK_TREE_SYS_NI700_CLK			81
+#define CLK_TREE_GMAC0_ACLK			82
+#define CLK_TREE_GMAC1_ACLK			83
+#define CLK_TREE_GMAC0_DIV_ACLK			84
+#define CLK_TREE_GMAC0_DIV_TXCLK		85
+#define CLK_TREE_GMAC0_RGMII0_TXCLK		86
+#define CLK_TREE_GMAC1_DIV_ACLK			87
+#define CLK_TREE_GMAC1_DIV_TXCLK		88
+#define CLK_TREE_GMAC1_RGMII0_TXCLK		89
+#define CLK_TREE_GMAC0_PCLK			90
+#define CLK_TREE_GMAC1_PCLK			91
+#define CLK_TREE_USB2_0_AXI_GATE		92
+#define CLK_TREE_USB2_0_APB_GATE		93
+#define CLK_TREE_USB2_1_AXI_GATE		94
+#define CLK_TREE_USB2_1_APB_GATE		95
+#define CLK_TREE_USB2_2_AXI_GATE		96
+#define CLK_TREE_USB2_2_APB_GATE		97
+#define CLK_TREE_USB2_3_AXI_GATE		98
+#define CLK_TREE_USB2_3_APB_GATE		99
+#define CLK_TREE_USB2_0_PHY_GATE		100
+#define CLK_TREE_USB2_1_PHY_GATE		101
+#define CLK_TREE_USB2_2_PHY_GATE		102
+#define CLK_TREE_USB2_3_PHY_GATE		103
+#define CLK_TREE_USB3C_DRD_AXI_GATE		104
+#define CLK_TREE_USB3C_DRD_APB_GATE		105
+#define CLK_TREE_USB3C_DRD_PHY2_GATE		106
+#define CLK_TREE_USB3C_DRD_PHY3_GATE		107
+#define CLK_TREE_USB3C_0_AXI_GATE		108
+#define CLK_TREE_USB3C_0_APB_GATE		109
+#define CLK_TREE_USB3C_0_PHY2_GATE		110
+#define CLK_TREE_USB3C_0_PHY3_GATE		111
+#define CLK_TREE_USB3C_1_AXI_GATE		112
+#define CLK_TREE_USB3C_1_APB_GATE		113
+#define CLK_TREE_USB3C_1_PHY2_GATE		114
+#define CLK_TREE_USB3C_1_PHY3_GATE		115
+#define CLK_TREE_USB3C_2_AXI_GATE		116
+#define CLK_TREE_USB3C_2_APB_GATE		117
+#define CLK_TREE_USB3C_2_PHY2_GATE		118
+#define CLK_TREE_USB3C_2_PHY3_GATE		119
+#define CLK_TREE_USB3A_0_AXI_GATE		120
+#define CLK_TREE_USB3A_0_APB_GATE		121
+#define CLK_TREE_USB3A_0_PHY2_GATE		122
+#define CLK_TREE_USB3A_1_AXI_GATE		123
+#define CLK_TREE_USB3A_1_APB_GATE		124
+#define CLK_TREE_USB3A_1_PHY2_GATE		125
+#define CLK_TREE_USB3A_PHY3_GATE		126
+#define CLK_TREE_USB2_0_CLK_SOF			127
+#define CLK_TREE_USB2_1_CLK_SOF			128
+#define CLK_TREE_USB2_2_CLK_SOF			129
+#define CLK_TREE_USB2_3_CLK_SOF			130
+#define CLK_TREE_USB3C_DRD_CLK_SOF		131
+#define CLK_TREE_USB3C_H0_CLK_SOF		132
+#define CLK_TREE_USB3C_H1_CLK_SOF		133
+#define CLK_TREE_USB3C_H2_CLK_SOF		134
+#define CLK_TREE_USB3A_H0_CLK_SOF		135
+#define CLK_TREE_USB3A_H1_CLK_SOF		136
+#define CLK_TREE_USB2_0_CLK_LPM			137
+#define CLK_TREE_USB2_1_CLK_LPM			138
+#define CLK_TREE_USB2_2_CLK_LPM			139
+#define CLK_TREE_USB2_3_CLK_LPM			140
+#define CLK_TREE_USB3C_DRD_CLK_LPM		141
+#define CLK_TREE_USB3C_H0_CLK_LPM		142
+#define CLK_TREE_USB3C_H1_CLK_LPM		143
+#define CLK_TREE_USB3C_H2_CLK_LPM		144
+#define CLK_TREE_USB3A_H0_CLK_LPM		145
+#define CLK_TREE_USB3A_H1_CLK_LPM		146
+#define CLK_TREE_USB2_0_PHY_REF			147
+#define CLK_TREE_USB2_1_PHY_REF			148
+#define CLK_TREE_USB2_2_PHY_REF			149
+#define CLK_TREE_USB2_3_PHY_REF			150
+#define CLK_TREE_USB3C_DRD_PHY_REF		151
+#define CLK_TREE_USB3C_H0_PHY_REF		152
+#define CLK_TREE_USB3C_H1_PHY_REF		153
+#define CLK_TREE_USB3C_H2_PHY_REF		154
+#define CLK_TREE_USB3A_H0_PHY_REF		155
+#define CLK_TREE_USB3A_H1_PHY_REF		156
+#define CLK_TREE_USB3C_DRD_PHY_x4_REF		157
+#define CLK_TREE_USB3C_H0_PHY_x4_REF		158
+#define CLK_TREE_USB3C_H1_PHY_x4_REF		159
+#define CLK_TREE_USB3C_H2_PHY_x4_REF		160
+#define CLK_TREE_USB3A_PHY_x2_REF		161
+#define CLK_TREE_PCIE_X8CTRL_APB		162
+#define CLK_TREE_PCIE_X4CTRL_APB		163
+#define CLK_TREE_PCIE_X2CTRL_APB		164
+#define CLK_TREE_PCIE_X1_0CTRL_APB		165
+#define CLK_TREE_PCIE_X1_1CTRL_APB		166
+#define CLK_TREE_PCIE_X8_PHY_APB		167
+#define CLK_TREE_PCIE_X4_PHY_APB		168
+#define CLK_TREE_PCIE_X211_PHY_APB		169
+#define CLK_TREE_PCIE_NI700_CLK			170
+#define CLK_TREE_PCIE_CTRL0_CLK			171
+#define CLK_TREE_PCIE_CTRL1_CLK			172
+#define CLK_TREE_PCIE_CTRL2_CLK			173
+#define CLK_TREE_PCIE_CTRL3_CLK			174
+#define CLK_TREE_PCIE_CTRL4_CLK			175
+#define CLK_TREE_CSI_CTRL0_SYSCLK		176
+#define CLK_TREE_CSI_CTRL1_SYSCLK		177
+#define CLK_TREE_CSI_CTRL2_SYSCLK		178
+#define CLK_TREE_CSI_CTRL3_SYSCLK		179
+#define CLK_TREE_CSI_CTRL0_PIXEL0_CLK		180
+#define CLK_TREE_CSI_CTRL0_PIXEL1_CLK		181
+#define CLK_TREE_CSI_CTRL0_PIXEL2_CLK		182
+#define CLK_TREE_CSI_CTRL0_PIXEL3_CLK		183
+#define CLK_TREE_CSI_CTRL1_PIXEL0_CLK		184
+#define CLK_TREE_CSI_CTRL2_PIXEL0_CLK		185
+#define CLK_TREE_CSI_CTRL2_PIXEL1_CLK		186
+#define CLK_TREE_CSI_CTRL2_PIXEL2_CLK		187
+#define CLK_TREE_CSI_CTRL2_PIXEL3_CLK		188
+#define CLK_TREE_CSI_CTRL3_PIXEL0_CLK		189
+#define CLK_TREE_CI700_GCLK0			190
+#define CLK_TREE_DDRC0_ACLK_CLK			191
+#define CLK_TREE_DDRC1_ACLK_CLK			192
+#define CLK_TREE_DDRC2_ACLK_CLK			193
+#define CLK_TREE_DDRC3_ACLK_CLK			194
+#define CLK_TREE_DDRC0_DFICLK_CLK		195
+#define CLK_TREE_DDRC1_DFICLK_CLK		196
+#define CLK_TREE_DDRC2_DFICLK_CLK		197
+#define CLK_TREE_DDRC3_DFICLK_CLK		198
+#define CLK_TREE_PHY0_SYNC_CLK			199
+#define CLK_TREE_PHY1_SYNC_CLK			200
+#define CLK_TREE_PHY2_SYNC_CLK			201
+#define CLK_TREE_PHY3_SYNC_CLK			202
+#define CLK_TREE_PHY0_BYPASS_CLK		203
+#define CLK_TREE_PHY1_BYPASS_CLK		204
+#define CLK_TREE_PHY2_BYPASS_CLK		205
+#define CLK_TREE_PHY3_BYPASS_CLK		206
+#define CLK_TREE_DDRC_0_APB			207
+#define CLK_TREE_DDRC_1_APB			208
+#define CLK_TREE_DDRC_2_APB			209
+#define CLK_TREE_DDRC_3_APB			210
+#define CLK_TREE_TZC400_0_APB			211
+#define CLK_TREE_TZC400_1_APB			212
+#define CLK_TREE_TZC400_2_APB			213
+#define CLK_TREE_TZC400_3_APB			214
+#define CLK_TREE_S5_SENSOR_HUB_25M		215
+#define CLK_TREE_S5_SENSOR_HUB_400M		216
+#define CLK_TREE_S5_CSS600_100M			217
+#define CLK_TREE_S5_DFD_800M			218
+#define CLK_TREE_S5_CSU_SE_800M			219
+#define CLK_TREE_S5_CSU_PM_800M			220
+#define CLK_TREE_PCIE_REF_B0			221
+#define CLK_TREE_PCIE_REF_B1			222
+#define CLK_TREE_PCIE_REF_B2			223
+#define CLK_TREE_PCIE_REF_B3			224
+#define CLK_TREE_PCIE_REF_B4			225
+#define CLK_TREE_PCIE_REF_PHY_X8		226
+#define CLK_TREE_PCIE_REF_PHY_X4		227
+#define CLK_TREE_PCIE_REF_PHY_X211		228
+#define CLK_TREE_GMAC_REC_CLK			229
+#define CLK_TREE_GPUTOP_PLL			230
+#define CLK_TREE_GPUCORE_PLL			231
+#define CLK_TREE_CPU_PLL_LIT			232
+#define CLK_TREE_CPU_PLL0			233
+#define CLK_TREE_CPU_PLL1			234
+#define CLK_TREE_CPU_PLL2			235
+#define CLK_TREE_CPU_PLL3			236
+#define CLK_TREE_FCH_I3C0_FUNC			237
+#define CLK_TREE_FCH_I3C1_FUNC			238
+#define CLK_TREE_FCH_DMA_ACLK			239
+#define CLK_TREE_FCH_XSPI_FUNC			240
+#define CLK_TREE_FCH_XSPI_MACLK			241
+#define CLK_TREE_FCH_TIMER_FUN			242
+#define CLK_TREE_FCH_APB_IO_S0			243
+#define CLK_TREE_FCH_I3C0_APB			244
+#define CLK_TREE_FCH_I3C1_APB			245
+#define CLK_TREE_FCH_UART0_APB			246
+#define CLK_TREE_FCH_UART1_APB			247
+#define CLK_TREE_FCH_UART2_APB			248
+#define CLK_TREE_FCH_UART3_APB			249
+#define CLK_TREE_FCH_SPI0_APB			250
+#define CLK_TREE_FCH_SPI1_APB			251
+#define CLK_TREE_FCH_XSPI_APB			252
+#define CLK_TREE_FCH_I2C0_APB			253
+#define CLK_TREE_FCH_I2C1_APB			254
+#define CLK_TREE_FCH_I2C2_APB			255
+#define CLK_TREE_FCH_I2C3_APB			256
+#define CLK_TREE_FCH_I2C4_APB			257
+#define CLK_TREE_FCH_I2C5_APB			258
+#define CLK_TREE_FCH_I2C6_APB			259
+#define CLK_TREE_FCH_I2C7_APB			260
+#define CLK_TREE_FCH_TIMER_APB			261
+#define CLK_TREE_FCH_GPIO_APB			262
+#define CLK_TREE_FCH_UART0_FUNC			263
+#define CLK_TREE_FCH_UART1_FUNC			264
+#define CLK_TREE_FCH_UART2_FUNC			265
+#define CLK_TREE_FCH_UART3_FUNC			266
+/* 267~271 not used by AP, skip */
+#define CLK_TREE_GPU_CLK_200M			272
+
+#endif
-- 
2.25.1

