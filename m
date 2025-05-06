Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2098.outbound.protection.outlook.com [40.107.22.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B8283158;
	Tue,  6 May 2025 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538601; cv=fail; b=YC8rwzgZIovpXZ+0k72qYICYl8Q4c2oRsW9RGjlii5l3VvbafhVjOHC2RWShM8xfsTzMtx0xakQTzYSz1vJwthF6bNmqdRvXQ26pQ6I7T5GoHYq47NT7sdL9LJRTFGcPk0Cx4jJoYic2+EZpxBE7hcFsA+KFx/BS+rUUahYsizM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538601; c=relaxed/simple;
	bh=3TmcWZLwHZUv7uWWX8ohi21we9etRo2WQw5hkEY3/t8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kY+zYAcfUYqADK6izmGUFLhRgOG4jH7wYcXSxioDTxDZ6f/EeujStPOimzpdBCU/MLICU0yhdQBf7nIdx0zY8bvouJ9IA/28nX0Hd9N501dJSccq8/p6IzWnfWJF+x7daUlgH+1Z2TP3diVVQhouV4jhWCrt49n2SrKDILuK2JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ooGI4F8H; arc=fail smtp.client-ip=40.107.22.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ooGI4F8H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKCTWwZ28fGr4FT2mcft6yh0BqwGbbg8+PQ8ID4vneZ+PTPeOuVDiApfZEIA9ncEUxdXTLyZWzwW0m7gZdq6RaDICcAiqjiFRyMZnuRp/NgoufspZuPOy4JM3eDnv7IJ+LwEYHIpWxearG0oG1GIs7hm0UBLVvkMpReYECSy3xvKekkUXR0+J2gM0tqMMO1YomVWbwcXp1n/ZEUbQxXCg3waAtGTNjyYFS6itf6dgQj3VyHPv5px45isoDQ7DrhES+zi3X7Z6ZuqPLgQDN41P1GY8s2gX3Zzn9X7AkyFFN8EdCPaitswkQJoBZik1YzatUWRTDknnwl1DxSOUf+Z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XXwHnoXdr8GK5RkDIEb/FLk7U97aMlUi1iQekkbLN4=;
 b=rbuuqPCfKFMEz9H/dVvlZBxToosFNVagUuXH7qIy2h+L3M8D+SyQaQdvxqPvZNgTrjkzbk0KcXy5G3YSTQnFTrBNGliB0lJsOS+8eX2ET54WgZHaWsG8iRlgGc7O+nrCXEzrRxL8aPrhlraL4VHd8d78d128jvBXL+taWe0pqEexft23V6WOALSvcvOcMODHDRXYaBQy1+/1BFPDdRSRoI9thIfDZOU711Giak5116jnaW1xrmcH4Xl7okLfk94I6FyG3SZxtryU6KVO3ziaFgrlVadztkq3e9zYqh3vLYXJGpo7+EjYvWfzajxfotFbubmwJNXBGeF3+lUKe6+EBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XXwHnoXdr8GK5RkDIEb/FLk7U97aMlUi1iQekkbLN4=;
 b=ooGI4F8HzK4pMa7GBcO+H0KKIEmVTANVzNJiO1LIh5JFMT/2O8ngnBNa7EMT8cLA+cc0YS/uTv8oC+aPs5FUPwJvlvk04Bgp80xlte5sHJV9H4V5Sdzn6dyiPCpeqyzmntEmvIauPOPDg+ZDiaKoyncZLRc1pCXFbECCqqsmmIwGd5TzmlhrVPdzYsYW8l9oAcna1Sn2cGu0Fm+wN2WehTRn1UdttDaIusknz36ZY3rqqk7bU2cOEpunJtGzsp4hsOfUUfMS5aQD42s0gNw8y5ZwcD9loCWSjgrdFX7se8nAGvvV4d/HRv6STaXM2KajWOXUF6ylxF1hbPS5pDURKQ==
Received: from AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::22)
 by AM9P195MB1186.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 13:36:33 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::a8) by AM0PR10CA0042.outlook.office365.com
 (2603:10a6:20b:150::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 13:36:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 13:36:33 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:29 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:26 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
Date: Tue, 6 May 2025 06:36:02 -0700
Message-ID: <20250506133604.294920-3-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506133604.294920-1-d.schultz@phytec.de>
References: <20250506133604.294920-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AM9P195MB1186:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c735ff-e0c8-47b7-b965-08dd8ca30401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?03++kXaBTgK/dWBOWc+wKqTNdp4XuiR13h9EnobyFfRHSMja69U7N40ulnax?=
 =?us-ascii?Q?sb1hW8Y4uZW1xGti5XQar58QObN2/MAnaLyo0lo2tSlih8u8Hr+whvsnBycU?=
 =?us-ascii?Q?t+D31TNEibQe6Y5UK98slhU8LduoDliJ6ZBs0l8Nhjkd3fviBGb9IMqHo2fS?=
 =?us-ascii?Q?ehC7IsAoGOkuiVWFOUQ/NFhBUXvwtblzJohyBXWdgg+LfaAP9z31ojZ7KMqi?=
 =?us-ascii?Q?6ZUkZTyP0mZ9vYeEkfHQgBYGh0fynnePaqU8tIoS+j7qr8XKm6O+2TIJ8I81?=
 =?us-ascii?Q?KkGsXuDfSeuSVn7JE1v6WAFID9EkXQ5O5jMUnTiZSyy2dRmDf4Y3meF2BbiG?=
 =?us-ascii?Q?s7dgIX9uQgLZCVkGJcqW0l1LPWOpvL1920fzN0S+/W43R+w2ZArgj1MvQReY?=
 =?us-ascii?Q?ekHJD7dsKCPzB/9CIkdgpND+dzNVK+HgenEFZbA4Q1ve9eGzcVTjUeZsg6/+?=
 =?us-ascii?Q?frJCCDTYDELnANWGrto0ZfG4RJ85WQVtjzkBgC0wgY/naBFWmqH8grqn0+WT?=
 =?us-ascii?Q?95RGkY9r6VLb4ueiS6Xx/q9baqhy6nRsbgll/fUgeh4ALVwC1/WJAhz4i9Pm?=
 =?us-ascii?Q?7j4f4DyFetx6hEj7jHnC7XmVX2RFz213qwkkXkKSMjCyeHA0ZQnjWBCT+GD8?=
 =?us-ascii?Q?8POt0YhVFRJjU1sZe/iEqLW0XZbSdwBBYBYjJIGHIaFKXd5U2TzG5LnqS1RO?=
 =?us-ascii?Q?ZsOEB1cy/4dyyPyr2lrWDflEiLSe5U3BQ7VhNXJPD6FSUVjxD4KczgN3al7g?=
 =?us-ascii?Q?E4LOfJWgCzpLpOy9JljjVUa509ENGPjUUc5c4P9w0hWb/OtW28c88k1uOJl/?=
 =?us-ascii?Q?8dIrdOlxHBQgmoEjhsuIeleGgNma3MepWuP+EdpAHz4aqvXhzAtwTbuS/aX8?=
 =?us-ascii?Q?zUjzXis+xTroX8XuMUvmRwNbnwwTNnqzlasjCyjCOTzIpKEtWuE1mMI74Cya?=
 =?us-ascii?Q?pmWvougmzEg8nrS9Gl2tuWE54Eq6/3Ta7EkTUUqUlyFE0LAkhS0s1mHvnW9F?=
 =?us-ascii?Q?IoxRu46LarYJ1VmajyuEtawMxiDhNvSgr34FSUaPx1oyGxx65W8MgOhSATYL?=
 =?us-ascii?Q?GUlGtgAslU5PxQtyv48SU5k19Cdq0GW0p6Hh6xehnYdzicCCJDBRzP2Ca2y6?=
 =?us-ascii?Q?S6x08za5L8RJ6j3sr7286I38w6FPrWa4GZIls49+H05pTph4oKQHv8OsHdcZ?=
 =?us-ascii?Q?pAEDHpbV9pQmpXwJsaANzpIA/sV76I65PLIQ4LJgiKzb/GzzZhwaf4OJ8XLW?=
 =?us-ascii?Q?QFiHJ/NH+ofljMQfOPXwjX4uoeL14+t0L/seWpuBs0ipeGiI91QLL1/CS51u?=
 =?us-ascii?Q?gZSn4OjkdXfYbMo7PhIFpLyJrqZaHleDOtMnZXqdLwIkz5B7vmN7sDrcvpd1?=
 =?us-ascii?Q?LMlcaSYR8bsue0gRxIFEiS4z1Ws8CxjsJvXdcVQ02ATlFs0le/UNBekmuI8I?=
 =?us-ascii?Q?nDOD3+JTMXvkgw+il17Q9HcuUpv4JgYK/1JzbvHCXW51R9FJly+GOP8GP7aC?=
 =?us-ascii?Q?V+RZtdU73TBRhD5IeHl2hE6EALj+Fr1yckCN?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:36:33.0816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c735ff-e0c8-47b7-b965-08dd8ca30401
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1186

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
index 147d56b87984..049aa358e796 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,6 +59,42 @@ linux,cma {
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
@@ -70,12 +106,6 @@ secure_ddr: optee@9e800000 {
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
@@ -170,6 +200,13 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) EXTINTn */
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>;
@@ -200,6 +237,33 @@ &fss {
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
@@ -315,6 +379,16 @@ &main_pktdma {
 	bootph-all;
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
@@ -343,3 +417,13 @@ &sdhci0 {
 	bootph-all;
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

