Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2100.outbound.protection.outlook.com [40.107.103.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB227B4E9;
	Tue,  6 May 2025 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532544; cv=fail; b=mjsuWvWWvB6NSXvYnlRnzVc0o0zVnZOiwg2jhpOjnru9dIRwkApvcf1VwCHnWGdWwdK84mZPcXj2rt42qBQo5Bo/MPR4dJGdHjJjI4Iwu56DpChtLDQHsDm6SaJLTnSCZQm/Ujb4JbawtCsrhsdTp4w0JkJTrsUjWvUfFmULUjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532544; c=relaxed/simple;
	bh=7V9IRm0qD9yDqcjjCppIVtzjKDkqHkXaNgO/Mijulw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBrTnXvY2d09oMDfvH4gXtaiZNfrdk0NFP7/3JcMypk6s87JjwEnFXOU7vilYMAabNIowIAAQ7AgQYp8AxAveirKxzuGa+xIr12VLzZZESwgqjix2m2QNWyNQRAVSmahG1R37pmhnIzCPdVFUTHh0SuyQ5vk6Pm/08RgY0NGJUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Uua5nVCY; arc=fail smtp.client-ip=40.107.103.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Uua5nVCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKYGkpamxxi6acF0yBrDkFAVpR/INfnAocPhGs8eEYv6iZkIweeiIKpPIvt47aGvZFqTbAqAgCVhJnU6U3SMYvYCvh79OS0pDhChjuztNVl90wdOjOnb2Alrc/quDPZiWx+LtsZmNIJ2tSm14isJ3gt5fVaucAgpNmr3LmMuwZp5sZuQzR3tfYkIkLtjA9TmlWQ5hZyBS3R5u9F9+RQrgDRtDQzPF8yHoK/OmABzAG/0xK6qcG2gOxZvKAxf1tswGQAT5weskUVW8hOoHD0R1gfnUTWyWAypEihi9h3LKec/fgIuidGM32m/dP9PICZIrjBhG3I4/4epCBDhUqAUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6NeFz3IFZAX4MPCpdCWywkx/ixlzqoga1MKZ07wUak=;
 b=qY1ztQ8pjz8QMHlr5VCAo5MVZH3WDoFcjhJ0mbRg2y3BXq1JRNVaFExONF7XTohDP8N1GQfocZnztSKFANgT+yC29AEXN26MOcqVF3BqKbUHwuQJlnx920Ec6hSgC6j9vxcJT00l3EPtM7zMjCEH3IUylc35CfzaUGtr0/nKYAPj4ckAQCffo+GMET1ZzqR6LjP10FCGo+BhN/SyOat7kSUknXYgETFNiRH7HbCRuY9uSQb8w7uCZKuTcWcp7yfdzpA1T3/TUxGAf6nMhHOZvv5w8cGWHzxEsvIyD8YN985u0L3w8dOX9MSeibl3kUhOB211sCmVXXSf4KK2A9QzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6NeFz3IFZAX4MPCpdCWywkx/ixlzqoga1MKZ07wUak=;
 b=Uua5nVCYNKtOBegdyhSPEAO7EqPAgbdhpGeXANmWFU4IGFx+XwPLXY2/kSByQvGdZYeuswjUzFCo5JeAbCjJFYiPZTdBZ5uE6COETxWxGZ0ynFijZ4M0/tRX773fLjx9e16d/vD+/jGNYXOv18DMDiZzdRIv4BobvRVqcqGEFwY/yUFk6bCdz9AUHO4BusCOsnePsZD/lpc3DuzZsGHCDS665zjoygedRZT10UrKt2MEcMhY2ZXLS4mCFFPptrEzNLxdogI7Sji/0RZBR7eO6ncHvXcgA2RYCBDXRaAkNRqp/OpXhrRzQEkyAL4tViU4v7AdWuzUVKDRGmc1Y37lxg==
Received: from AS9PR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::27) by PRAP195MB1434.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:278::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 11:55:37 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::5f) by AS9PR01CA0045.outlook.office365.com
 (2603:10a6:20b:542::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 11:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:55:36 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:20 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:18 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
Date: Tue, 6 May 2025 04:54:59 -0700
Message-ID: <20250506115502.3515599-2-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|PRAP195MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: 433db1c9-f866-4e95-01f4-08dd8c94e9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?stSK06VYUYZasCXMT+lRkKYhHd7LY9V8Jb9PLgnj+sv945DDD+GfHpVx3YKy?=
 =?us-ascii?Q?e5M74L9FpVxcrjKhy8bXYvCrVRy8ckrmXSSjI7iiiAt5cwHS9RjzRnLffbV1?=
 =?us-ascii?Q?zbCt26VK1aPg4Mg9SElAiAZV2OSI5bscZkb/hNHhVUD3rMJHtEEKlZPr3yit?=
 =?us-ascii?Q?FIr9DTqj0COhgJv7E6ixFaBeORna2dIax7D5t57phuZConioGhRqLn01ZvgM?=
 =?us-ascii?Q?m2HxURKbc6JoPtMJ6q4oOnMJIUVwG9a2yN0aO2WuIJCJiwmNdbWw18kYQkg5?=
 =?us-ascii?Q?/btrFHfGh6yDqQJk9p/sjMZqbTgBq2NSAwAYeQ2wtnpOGUTSfgQaeEyTZnvy?=
 =?us-ascii?Q?IEFO6aXYP1YuEqFYj/V4EVl+NBp6cLzDs7UhydQRGzCdxPyr/q5rcrzsSaus?=
 =?us-ascii?Q?MMBm/k/ndDizD0s/S/PBO+AmQKTl4OeRmeZ47apqbmNmQCtk+DglS3zKp+8x?=
 =?us-ascii?Q?OOhYa7xovWQSieyrmgPJ/UzxxrDLqmoSegsGC/Ev2/Qo4V+GdUM0sjxpDpge?=
 =?us-ascii?Q?iXbicUNmpg4x9acT9zgWhug6VHk0MauqbismZoOPqT1mxr3/BnAs5TRt4zRf?=
 =?us-ascii?Q?iYt+EU0HhoSY6qxx3ne87dE31YfF0BWOlFi8d5zUFbINN9Anmt/Kf3qQBDp+?=
 =?us-ascii?Q?qM9bccRdrM4WBch65kGgJmXY4UyUDRl7ifqmuYf/9Hi9aA9pOBoXNwX57bzt?=
 =?us-ascii?Q?1KF7VnzlWsvA02+7nTbNW9c4iRYxTWFHbX2t3NSq9qbjgIo5uZOQQacpZq3y?=
 =?us-ascii?Q?5yXLZ/4Q9uPMtkWOD7QV7zR0n7ppOFAYvtb8IqM/bV4huCArvl01+ZDAAJR/?=
 =?us-ascii?Q?8cUsXOeQtI659fC5SPT6FIKD9IHKNknrX3ywA1O+J1YukyvRtnLHqsmwNTRC?=
 =?us-ascii?Q?Nc53pm9r7FjNDEjjifh1RC7FFJSsBthMrW2XcrIu7RvXpJPMYfAlWb45lASE?=
 =?us-ascii?Q?tCARzNX8soamBrMvobL5M2OFI7/7FqRdmvf0hlY4kkKduiPSrb31vmWjGDqT?=
 =?us-ascii?Q?eCN7Y7+ZEYB9nTcvLNsgmODBgP+Q0aHa94PQKtE9SZVKU1l6vC2NsxQPz7A0?=
 =?us-ascii?Q?+5J12hsyHK3DBYvP+I+JtUXCPWuqq6i33NCW+8fum4Lp+pgL6XO8Fg+M6Q3C?=
 =?us-ascii?Q?1rRreHNrWSzZEt7hJLT2pDMfqvjFIP4/W+8E9aVIvjt+o/UIIHRxVg+aa5eL?=
 =?us-ascii?Q?zdxoE+aAT6AWLwrKZCjav58hZ0bnyEgkG/S9yaVn+I6c+G36uuP9+ueCTdW3?=
 =?us-ascii?Q?4N/oKbZgyw70BIrk0vLyPU0THg557UTTQfqOjJXYki/oLnJTxoRIPhacZtfY?=
 =?us-ascii?Q?u+SOp0e2Y1gDM0/ZneesFAMskcovht8U3bh0xaqKw+joUR0UIN8yZFuN17ia?=
 =?us-ascii?Q?BLMxqGhujy/HysXracb8FjGGY4AL6Z93f6e3a/RZftmoaRovWgQ2jXfJUsdx?=
 =?us-ascii?Q?TgihukUp8bsuzaM6X9cAs2JAlg4WpNHJJr8+Ug8IoR4bvm/DfnGpns7JPZWb?=
 =?us-ascii?Q?oa7mutEQKxafl/YRZy23ZQm+ryUHTxay2ysF?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:55:36.3628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 433db1c9-f866-4e95-01f4-08dd8c94e9ec
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP195MB1434

For every remote processor, set up dedicated memory regions and
associate the required mailbox channels. Allocate two memory areas
per remote core: one 1MB region for vring shared buffers, and
another for external memory used by the remote processor for its
resource table and trace buffer.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 2ef4cbaec789..71d165a7abe0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -57,6 +57,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -68,12 +80,6 @@ secure_ddr: optee@9e800000 {
 			alignment = <0x1000>;
 			no-map;
 		};
-
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9db00000 0x00 0x00c00000>;
-			no-map;
-		};
 	};
 
 	vcc_5v0_som: regulator-vcc-5v0-som {
@@ -226,10 +232,17 @@ cpsw3g_phy1: ethernet-phy@1 {
 };
 
 &mailbox0_cluster0 {
+	status = "okay";
+
 	mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
 };
 
 &main_i2c0 {
@@ -365,3 +378,13 @@ &sdhci0 {
 	non-removable;
 	status = "okay";
 };
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
-- 
2.25.1

