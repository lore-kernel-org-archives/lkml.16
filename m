Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2120.outbound.protection.outlook.com [40.107.22.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C36433AC;
	Wed,  7 May 2025 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602140; cv=fail; b=qd1OU3D7gUujlwnMrrFVokPUA0prCJoKJJKl4YKNC4q/7XZlqfurYNR86Y6WCI/2YKNeebL90QYnm/g1YQaURfz9JBRB4rO0MmU3oRR0vxT1Cpc/zU1vGwtcJVoBp99QuVxLZlq2sJ/r6qt378wwoc1daHl+Ajr4byLSXnGQct4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602140; c=relaxed/simple;
	bh=ymZbdswCowt6TexFzAK2RBxnecXZdpHLnrsTzIJc1jU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwK/1x9Wn3m1YLpQO5YbBlTgLCKvlUYLLoDjKAGriJ4whCDvJZ7T4Gi2iHygBGcg9To6AH3DYaSemYLMARNN6LuqN02NK/IPH16A/q+jujUIYFPoj9cLay6BWw6AoIUEq+BN4i+ZdzVi431znyWKOedXjq6ClZoFKN/37AO5RmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=L6KhXEHY; arc=fail smtp.client-ip=40.107.22.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="L6KhXEHY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QX7FH0TOLl2vIapAa9LNOgRvNTUMdrScbWSvVcWXO/75axytaSPVd8lnRCULUbAPjVQsE95jW2o1oZzfL2tyLcXZchtUsCJLA3Wp/XCEYiqX1i98SAwh2XzR/jIxCjkI/vh4uVtiZt2pstCIi2D580MAtmPTmKfZvgFQEIaqk4r1g1pb/p1ShEXnzYxFWDqO6hpEREddubYaicOjesCmVe/p47fdVdW1cOhIN2ZKm8054o6h+NvBYcaT1g8FP0LatPuiDF2hPs4w2HP6bqy5N1Y0/vKV55naampzoBD+S0ARnzpH1pIcSB6C1gLBggLPfmhaaDX/Ni9cYFKqUW/Jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uuy1RaR/h/EnJWDBV6OsC2yipo82HmoyoeIS+G77NX4=;
 b=v3gSqefuudn08JkCRFEjViNN1rK9t7bE4MlJl6FAwJBkfuOFwG572Jyxm4Ye0gEzj06ngBDV2R6v3GmrSwuJ3iAxDcT+zxiBnXjv3L2E78t9zhtPVCyd2oG8liFx9ynxFzb1tKt8Q/x8hr4VGkoZeetTujsX767h9gFFeZR9nQT8t3VfSDUk3Hm6mlR517UdyO3IO+etE++5r1bNCiwdx7PKEfcteI5QzywMnUV6Wy87IRUIuNA9O6xxpzq8T3TH0CXHGQgW7+C3w8YuJz9Yi3QF1+6o/ezUn8s6uqklQIOu3Y9in6XamfXOc5RNpsqltpxrFIaSN5whY+7VPYNkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuy1RaR/h/EnJWDBV6OsC2yipo82HmoyoeIS+G77NX4=;
 b=L6KhXEHY1cgzIL6p0Bwsb0G75YohS08lQeoHjd6kqQ35zD06W7FiUogGyRx8I3kgvEvo5dptklb7ZGbzBIrpi78+PK7bgbeYd9dkpP4AxiRPd3GyFEC2jectgMy+LgCkYLt8TvjGXm51MgK58EoNlSElnfJZcGmn5U/HIi6qhOvS8m9OVzUal4Bp9VjfFuVlequyknPwRfCVS8bAkhg8E8QHaF3NIrYeq5OR69kid8e5S0G2RrVkaKulhMj3QTsjTjdynBwPfhePnLsWCsxec+9qmghk3qptQ4t1FVo6xYiCenz46851RZHDB3lhE62E0QiZreMR4pO9LWoGqk6IOw==
Received: from PR0P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::16)
 by AM9P195MB0934.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 07:15:34 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:100:1c:cafe::a8) by PR0P264CA0172.outlook.office365.com
 (2603:10a6:100:1c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 07:15:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 07:15:34 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:29 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:26 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>, Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v3 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
Date: Wed, 7 May 2025 00:00:06 -0700
Message-ID: <20250507070008.1231611-3-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|AM9P195MB0934:EE_
X-MS-Office365-Filtering-Correlation-Id: 430abf76-6b40-4386-d184-08dd8d36f59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rz0WjjiCG9ApZoAR6ccop4o4ECKVFi5/YGY+1AUJcgiCuokl7e6UDXYoHhPK?=
 =?us-ascii?Q?zXNjPXyw9N4t36k7Kj2t9aolPzComSnO04Hh5ael3snV2b438pZw04YRKJTO?=
 =?us-ascii?Q?e8CtPF7gS/oFE7Xpsq4BMcPJPMlmJOxxzr0K/Cqi4ecwPf6uk0vnq2DDLdEv?=
 =?us-ascii?Q?x5uHWR+u+9LejGy7zV2Sa9A4yu0UhYrtkxMmk3UpaBjRaeT4fW7Fkb1alU36?=
 =?us-ascii?Q?mfzAvaHxmulHSz1tVGsdZDT0xmYwW1/n6fHcxGZHPqf8tBKxr13t35QVEtp0?=
 =?us-ascii?Q?y83fL96C+pQF9iayUeZNshOYzbIcKlUiKWZKae0JsbVt8mJNyXdusYXhF9Ox?=
 =?us-ascii?Q?a4JPw7Uee0b2wEbdQ/+lzBFAZbxhNrj0Sqx2ahNW6PzpzdoOC2eptQZHZiUC?=
 =?us-ascii?Q?off3QVFDjhmy1qTmR+wKv/HKMm1OO5Ya7SaMJCSgTZGoORUzfj83veo/aQHj?=
 =?us-ascii?Q?4/gUAkrBQouPOSN/YrLqtcNzG2ROxS20/W0plZ06Vy6U7bLY5eQL0c1irwwN?=
 =?us-ascii?Q?htBnOpqOwpPVlbVGkJU3liJGC/JwKwXSAXlK2Xp6mtgGCxsZzVFUln456dZK?=
 =?us-ascii?Q?RJG+RxBVd5El5eq8oLOdnun7PLh1QC0I+DJbcvJQKsUAKUDen+wPAAHBaCL6?=
 =?us-ascii?Q?jXwcic+4R8jylZ2rWAuTLHUepzNGsnOD3b09x9jJs2g+++nfYXMV74ceqXwN?=
 =?us-ascii?Q?vyWC2UIqjYVLC2QQ/po4OcJCPT/NJv2HqkCF4qgMC/pME7cwl5+rUrPra52P?=
 =?us-ascii?Q?ubnI362mHL4lWNUPFIl1DqjchcHAdwUoYYC7ElD/zqU1gRgCUE8eiKK7cXIj?=
 =?us-ascii?Q?kUYv/+mUGKzCgcTnQ9T6fpnwQ50Bt1KKv0z05iZi+GD9iyDQc8vEoKEEOJNn?=
 =?us-ascii?Q?lMd+n3VuXCrMYgZBIXb0vYLGnSrwGvrroqIuZg0aiVcL5Ey4Ph/Y0AfpNudk?=
 =?us-ascii?Q?YLXT9OCApYPPcCMKA6qn9Wx0jjgeZbQ4GlcK9po0gpKhEdINbhJI5rhvWU0e?=
 =?us-ascii?Q?pLUKztRMzJj7FjClR8ecX7CtNWDob9RLksh885v8879alRUHA+e1R8br6z8V?=
 =?us-ascii?Q?2+G4xDXSWUYhwsbpfLaBRwB68BntGJpfq+VSm+CJfTIBGjmLtYWK73paQpIa?=
 =?us-ascii?Q?KQmTputawBZOwFyYzut2odzLK6c99nTCVUjV3KhHteq86XmSCR6b2BY3Texs?=
 =?us-ascii?Q?uxiC32nW1Wzr24DgNXfPpchGZS/7+N9u6L19GJgc9yuarO4qDaBOc/07p4y4?=
 =?us-ascii?Q?Ag7Hq0LRi7bmUeAt/RoRg0GaI6rfZ+zK+dZRBRvLet681/O5qE4dVCAJYQYO?=
 =?us-ascii?Q?dnN5OFTMFN83WzQn9U4nkKwdbPHmaU/pLIuhh8ar6DSyHRk1HcTZl9Yk5G3X?=
 =?us-ascii?Q?2ZXgx1q+33F48ajU4coSv34ZCPQMloBTu9yeNabTBpLJF4MRVKocTGrTAMqJ?=
 =?us-ascii?Q?KUMCxzEPz8i1qJ4WP+Um9C3C2O04BAo/o7w2kSDdNGYYUT1DdMyEZeDaVs1y?=
 =?us-ascii?Q?W+9u6M8p5BjSI1yqg575FIl3JcSdJLeyQk/h?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:15:34.4570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 430abf76-6b40-4386-d184-08dd8d36f59d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0934

For every remote processor, set up dedicated memory regions and
associate the required mailbox channels. Allocate two memory areas
per remote core: one 1MB region for vring shared buffers, and
another for external memory used by the remote processor for its
resource table and trace buffer.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Judith Mendez <jm@ti.com>
---
Changes in v3:
  * Merged mboxes items for c7x and wkup+mcu rf5 nodes.

 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 96 +++++++++++++++++--
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 147d56b87984..0aa8d9bc5df9 100644
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
+	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
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
+	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
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
+	mboxes = <&mailbox0_cluster0  &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
-- 
2.25.1

