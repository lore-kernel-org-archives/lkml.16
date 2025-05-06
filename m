Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2139.outbound.protection.outlook.com [40.107.105.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6338D27C164;
	Tue,  6 May 2025 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532546; cv=fail; b=Cq5NjKeUoi81UUTsL98FRdwyR+wELlH/TMx7Ev2y2oLg6abSZMW/D8LAMPPHKDZI2fw4ogA1BS3f+Bnc1htc/xM7NqY14P8LPZNrf45fdDYAHfd7XGMNlfWB8Br5iaDS9PU6qk3nkTutz1Tbd2p5WMnUJygiz7juoyFaKJ+PHb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532546; c=relaxed/simple;
	bh=2uwKdRvldoyti+ej27fbit/6gx9RKqgvOheaEfoT/C0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mgk5ZdCKzgtHGABTzzvIcrugwA+lrDrr0bDPOWQrz20c9PGaViR4d2m+88zNMcLjwicSTf52bfJ8wTGyXyn0TOQIF/Ihxl0NGfu7QF9mSx4cScBGwREvLMms8uo+w/Bx5BJwE8VHNzz9upta64LjBOfyIEGTurw+9iimnXy1rwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=iow1XwUf; arc=fail smtp.client-ip=40.107.105.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="iow1XwUf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt70nR/0COHMrAZ5ovCfJ3ysvIsMKS3God8msvCw+SEkedg6tsHKYsRN9Ff+9AQQ0DN7aD62t5BX9yqUWEUBwCMIHE7fsoDrVynUOQwJrP0lndxb7WNG/YJDeiELV9u8Y5okto8+cS8wNNOrENmj1VXuITM+wjCV7GYSSm+hu3W0hwfick6Ss8ZaJKJJOP47TfFDDQu0BlWJ+lDqhH40hd6B5gtPULD8S3fpQgT2pr5lklZOUZ3tRs/pKUCJtvkgPJgicXYR7m2c61Wf8sNDww2GxdYKKvi1TgIOLZHDcUpzHDs1SmaFVO9IRxObGMq17CYdirqumiS0ujc/rdAA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAoY/KXaYKzlWtuJOqdx/LhI+PZIPvPJzLHUUT3pits=;
 b=U9XibaYnpg1tsI+7qYl30PXc95qvXhkfyuRs3oXMDudkdQSHvWNnzqSFq08mqrxIEouyv/eUbY1Rb6N2j5JF7WdekBLpFcoNVsm4i+FAS4s3LBFTqbut/3G0oUisXKZqc/2amjDNzNQDda+sGju1ezVtBQVkUpy7L9P/auoIMsVaHfwWHlhQg3Qw/bGzixYakuWJT2bd23KS2iEU7wMW1/DGqiLsTDRUsahMZYiV5SmMEoNV987u1Bwg5HfPiqKYCIW7YilpeLpTc4kgWIXXzzSgBQwLC0eYf3YQIfos3lNGO6p5CWxRKySqUPnVxTPI3g5K+SE8l+XQYz4/lg3YWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAoY/KXaYKzlWtuJOqdx/LhI+PZIPvPJzLHUUT3pits=;
 b=iow1XwUfMXUwxyadnz0sRlUYrGHmjpSXhWkmsWDoO6OCoTXDFy0XWCzQH/aFcFhUqxlXjoEO9d3bqZh4OTKcqFmztQ/vndNWYDeYhDv890uAYQMwk20D3AjwQcIe72JZntBUpIGR+7koohvbKI5orZ+WAxxWCRkMOslnKdVCPsSqTK8HOBlKpRa3flUNRM+3hlTmiqz0lUjQRmaYgXrqkK2ptEq6gP6MNdMLRqM/rGI5+6ce7W7oSft5i/ZcC8UuBGEH7nt5MmUOwQ1F7v7T4dd9L+cP+TJv2Jd8aGWJBL5Ih0AtUAMj/gVKVolNUvpWtc2yTZqf5q3r/Jt+o+PHdw==
Received: from AS9PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::21) by DU0P195MB1771.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3b5::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:55:37 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::cf) by AS9PR01CA0043.outlook.office365.com
 (2603:10a6:20b:542::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Tue,
 6 May 2025 11:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:55:37 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:23 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:20 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
Date: Tue, 6 May 2025 04:55:00 -0700
Message-ID: <20250506115502.3515599-3-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|DU0P195MB1771:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e62e96-ab69-4e61-b8d0-08dd8c94ead0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99iKKcD9OsYKG0+w1u3onAcmziOpIJAYLspjwXYZYz+nVkgZ64Qw7HuDFHiH?=
 =?us-ascii?Q?CKN3iYfjgc0WjlXZfwAp7NKVzJvibQngJmjnqp3f3+hcZPO3LxtFuAGuE4d7?=
 =?us-ascii?Q?hXxD+CX8ftFwnT5TSmDpORBvvUpcfBH1h1hf9zSYwZsLXbkCjp8nZ8WsT/bb?=
 =?us-ascii?Q?hB4+BQrBNN1U97f8MJr8WcTGvBsniW1456l7h0EZ68Xgn1g2z9wL0vcp1Y1p?=
 =?us-ascii?Q?qz2Yuae9Pu5QKTPExWhfJ19cK6a6JJHhlZnp9MUGC1WFCDZKj3eo2p7lK3rV?=
 =?us-ascii?Q?GbD8Un58GRDx90+KAUCJNTS4eGpzpWpEwiOBaJYakBpfaKxsWzdMM/5Tl0nq?=
 =?us-ascii?Q?n1126or6+4m42rdns/u7F7v9ctyjkMLglnkSWsBGstf04Cizc5EXuN/LKZXs?=
 =?us-ascii?Q?9Ryf4qNoaqDqFzfRgDAgQgwxqSGjHQEE0RzR8Sw4dnDAGk8Hlw2g1340guKN?=
 =?us-ascii?Q?XtgN4qNuOegy3xkXNqJPp4Jxr9/zG6SH8+jMwXyugO0SApRcYROXTjb6jP5Q?=
 =?us-ascii?Q?TDg/UbSCzMEDX4Pcz1z1bova4fxugabQa2NDsaTyoSK1pM7z0vTZi1Kzr2XE?=
 =?us-ascii?Q?0FHF6D1IRQQ95EF2Len+XRw68ZDI7FY+3usV5Qi6k+xj6AquqF720yzqZz0r?=
 =?us-ascii?Q?vLkgl6JMNocTayCX3bVMRkTFqumeEfBgXX0qzYymlIUoZn7EauGyasmbprSV?=
 =?us-ascii?Q?OFz57S3qTRp6skuj8oT3J2zRARzwWKMsfD0arDeFLMKSQhOiHOxhxLFX6Nlk?=
 =?us-ascii?Q?fB+8gn6Er1FUC/Uyi+oEAbipGVW4QBEZFX5yb7CYjbcq6wMzCUq9pN1u2CnJ?=
 =?us-ascii?Q?ifqxkKqonjInxptRTwOQe+yk2X4UAQBenmB2BnuKgtQwT9kEVKa7mzeCsSfr?=
 =?us-ascii?Q?ALF7T4+D8l5g8uxky9MvB1M/QvtL6hkjv19aJ1P3/1OkytNfl1iRUTV7oO9X?=
 =?us-ascii?Q?7KiTuEtm51qGepOs0U4OiaV1cfY2cOlK0MiIXIJX4yuaFbw6UFXBJxL534zx?=
 =?us-ascii?Q?DFLfk+rEo9ZuL1pzfRllqTenxvpPlfKxusmk1gAMBTFcmrBjPfxFHdpaZzBU?=
 =?us-ascii?Q?ggIiO24HE3ar+xMPeLrUEIB5mQRQlPzjkJRuybLe3UPFOcMgZBeblJ4X6jdt?=
 =?us-ascii?Q?NSwkay4a7CEHW96OLS9VaAWhalK2HQzFI8l5DmtFYBBv/a7ODRWc81z5S2Xu?=
 =?us-ascii?Q?EuZjAlXrPwvxM+xQcxudqKij3PeP4kleJLOPDg62KxHh5Cfr9pug3CEiLj35?=
 =?us-ascii?Q?mkTg8Uw9TYKiiG7T/hyUiCEgzhLIGfw41p9TWQHMthDlcxRiJaq1DgI17aR4?=
 =?us-ascii?Q?1ZJ6V4hTvWXikw7ZuBNspfKz4k+riyAhDrfrtJPbYTFoE7ucw7WpcGuUjmSl?=
 =?us-ascii?Q?DRbZ2rb8lWqJBkxjTvwqrtutuadYc0TklUGZARJPZJuXWQl2LJKU+P6KS5Ym?=
 =?us-ascii?Q?TR5m1HPAQxUTiOermck1ooGs7n/8Mi9MdO/Zj5gLNOou2oDLxKjdlu4ELdw0?=
 =?us-ascii?Q?FEp9d7shHQUvCgebjxoA5jjIE0YJlApRFGSt?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:55:37.8626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e62e96-ab69-4e61-b8d0-08dd8c94ead0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1771

For every remote processor, set up dedicated memory regions and
associate the required mailbox channels. Allocate two memory areas
per remote core: one 1MB region for vring shared buffers, and
another for external memory used by the remote processor for its
resource table and trace buffer.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 96 +++++++++++++++++--
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index a5aceaa39670..fc252543f18a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -58,6 +58,42 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x99800000 0x00 0x100000>;
+			no-map;
+		};
+
+		c7x_0_memory_region: c7x-memory@99900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x99900000 0x00 0xf00000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b800000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b900000 0x00 0xf00000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -69,12 +105,6 @@ secure_ddr: optee@9e800000 {
 			alignment = <0x1000>;
 			no-map;
 		};
-
-		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
-			no-map;
-		};
 	};
 
 	vcc_5v0_som: regulator-vcc-5v0-som {
@@ -164,6 +194,13 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) EXTINTn */
 	};
 };
 
+&c7x_0 {
+	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
+	memory-region = <&c7x_0_dma_memory_region>,
+			<&c7x_0_memory_region>;
+	status = "okay";
+};
+
 &cpsw3g {
 	status = "okay";
 	pinctrl-names = "default";
@@ -192,6 +229,33 @@ &fss {
 	status = "okay";
 };
 
+&mailbox0_cluster0 {
+	status = "okay";
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	status = "okay";
+
+	mbox_c7x_0: mbox-c7x-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "okay";
+
+	mbox_mcu_r5_0: mbox-mcu-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
@@ -302,6 +366,16 @@ &main_gpio_intr {
 	status = "okay";
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+};
+
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins_default>;
@@ -328,3 +402,13 @@ &sdhci0 {
 	non-removable;
 	status = "okay";
 };
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
-- 
2.25.1

