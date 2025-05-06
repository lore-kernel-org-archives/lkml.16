Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8F27A939;
	Tue,  6 May 2025 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531724; cv=fail; b=V8pcW9Zey1fnRHZZTfZn8HovfPRw31ruM3RGcYS2wruOhtmNkf+BtmaxosMxKLswZIVxqiVdWYqBKS111Z9chRz21KSQu4ftgE04T7r9xyPZdy7/z7mJSNwO9PgDu6sPFtnpWb3iMo148X+yCZI4a5Lz333/3tesbOEfM641IbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531724; c=relaxed/simple;
	bh=QheWpA1fwcEhZU01SGLfb7XIW4noxKXTdJgOTsWpLMw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MXAXbKCc2J6EBQby7iNOSvtaTQBUKVSbkRk5kiCXaGS2QZGl2L5hVIDDt0bIHy2fjQovFBpWs8DUu/5+muUbLsUIb1Tz04ep1P313QuKj6E5K+LzzBm9aQmEjq/+XuJqB3Hqq5eDo9lI3D718LU80wKZ975Yfe1gPbjs4EpT7lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=TRigUO0+; arc=fail smtp.client-ip=40.107.21.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="TRigUO0+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV1tCqDu5VHTY/tGrCvuufjHS8dRmWVxMruIxfB8etAnme5NMGNa67MtZwJRGjNd3H8RXEilHiCeVG4reXwldO2dBZcytshSTh1ZjouLkCSHLZHtA+iqiYWxl2qMeceoxFoswlpwDzMAM+TB17F9EfVs5koCSbn157Gpke1MxNc3GXf/wJloUGGROyCuTQjN8/l10GMP4VZP4dM8CbKNH3ZjMGFx6Vb+KTGfHVQn7rQilhU5WYSrghS0YRssBXFYe7mdqhzogGC1KKYsPwIl0q3HkJcjiONxy4vRPyPInENBe6wU3quZt1/g6z0W+Y1r++riN+U2c5M0eoMPRDFrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0XSAG37MV9z5iiQAxZ1ISgtX2NgQN491ynRpP1pnAI=;
 b=Mtb69/Z8l2hSh8SoXf7bhT3HsEN3jaCi2IWxFPsxyKE4HtM5sryKOmvaOsDqrfKT6KbvzKQk7vgN8XlFgrWPzkbuwV/ogfDIRweGlGo6D34YeDRqo9WRMxO204ctuLDLDcpw0QUOlHHDBSvmx+r/LZje19Nt6T4mD+EqcZ56vPGmTzjX6LhzIKCQ7tIGG52yYD9fC6b8P8ttDGUZsivSGKE3WsdrKHaqfQ688XhZUIIMV+L0FzREd9pOc4TrsOSS0tokCLMK/gpPY13t24rHsRI93FVEOeifL60crcouWHlC0bcKOoJVxa/I9JJV6jNR8Hj1P28M06Fs3g9tuuN5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0XSAG37MV9z5iiQAxZ1ISgtX2NgQN491ynRpP1pnAI=;
 b=TRigUO0+/wbYBVMfUlvPOAWIzLj3fW4CqAn+2dfBmkgEH1Bffyw7YPfckbJCcKvDYTKRCgQyX8nCXMs+tYxKJR/NwFdQfolaLGfIPEyVjUmL3DypcHbY5ApV8zkInTNDx3hrAri6tGLvWVDwy3aPLSkxqPq+6qH2KMl5TW8dEqjLfi6Xw3hhMYDp7wGyYpKBPb85lGScbu7NB+fMcBoHEru+TrjCFZN2R35M5VgRFHqVU9dntcQiQqNOno7H0WiA8sX31zSQiiJIU4GFNM1MjGkhCzuUM8rkUmQg1YlLv1DHUvv3GHEtlsuO8Ixjc7fwtZAYTWjwtjoK3UM9mvWCcw==
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by AM8P195MB1009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:1e9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 11:41:55 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::ed) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 11:41:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:41:55 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:41:54 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:41:52 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
Date: Tue, 6 May 2025 04:41:33 -0700
Message-ID: <20250506114134.3514899-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|AM8P195MB1009:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed69e32-2724-41ee-d039-08dd8c930083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ry1hUcdN/9yFwgTgKSp6OOoLGj/9QZy1u1FuCjo8T+DlIZRtLE1GEAC3U0Bc?=
 =?us-ascii?Q?ukUWx7ZhoNGJgorg5fOnCIaFV+DdBGbfQrrT85HSvD1cBi3/TfOQKuWvUEQu?=
 =?us-ascii?Q?6KhGx79CoxhLrbneVUpUFIQJJOHuyeSV+KwwXgC1cLg+Owmkhao56PgUrDot?=
 =?us-ascii?Q?5e3JD2YwuuDsOP6XbLqTJYJXLgS6co5pM2ENccX/AHSL5/H8YshKLnLOREEq?=
 =?us-ascii?Q?AYelvLPMxx3n6+E1QrC/xNodLwLxw35TGpLrWs1aWmAV67CeDIrxMo95Crpf?=
 =?us-ascii?Q?U13wQ4TNzlttb1CNXYq53As8IP8BXW1dIcbO5NPgrwSuVfwY5KSOHCvyrm41?=
 =?us-ascii?Q?sfTKlmz+Hbt338FHYBtLF9L7M+LxRVfoFdV3xeiB6hv9hdFsAQtM6hsvWlj3?=
 =?us-ascii?Q?1/aS4xacnG7RkMej133n+jjmt4aDHzHW+Ohl4yKCL+7aCCgxp5ijU/CmsjIB?=
 =?us-ascii?Q?gnW9hY5NAPul6+BAKsAcg7RIVi84LyZm/olVqc6R0VrSLrxciKBKcLr+5Ej1?=
 =?us-ascii?Q?BBLTL4n+yWwX3/KAY36g4P5av3R6wKEtxE6amoudrYQHwYiH0GdTaiJ6oc/U?=
 =?us-ascii?Q?iUWyQzBZOJ9XgZtC7lILBzhPCXDbnt01ykyIjd4/PGjCj0o6/x5HEE7hfX/h?=
 =?us-ascii?Q?bdK5YWynjyDWbOTkpwuY+tsz3H1uVsGya3Cnj2+pYZ3nMkh2xOsRMh8Kh3rT?=
 =?us-ascii?Q?rW9HfEYRi5uJZ4KuGSG4WtXcOZXf38uH5WBSfnEWC3g8sb0gFZzFRU2OUJ3W?=
 =?us-ascii?Q?mv/TGmOeCB2cduD/Ped99HFl+zsLbFKYZrU8Y5g9kEybsavPzf8kTWh1tHlI?=
 =?us-ascii?Q?6YF5Znm8x1cPnrzSrKvWKnz1MWjXcolMYh6Y44K4BuqBkVQK8umvr0FnI4xQ?=
 =?us-ascii?Q?26sb+qjR1eBJq1KpBkLxdiD+gPnFxwUa8fXOiYxaaeKnLYJ8J2u7Vzjj78zj?=
 =?us-ascii?Q?Q2O5FtGJAZRXhRPAayjaAScZk6HiM9a8bwftZNYgaaXbzFULk7+YKRtUCkQF?=
 =?us-ascii?Q?dQkWdN+eUz81sXKK/pPdObpXJgT+wAdOVOgYQtchaiL2G7tRkhNY1kqnkMB/?=
 =?us-ascii?Q?y7RHCBtGojkfu/KtQpmRT+YVuAZ+/7mS2058VTC2gR67aKPHxPnjydlsYqp3?=
 =?us-ascii?Q?0gI34aWflb3hiHroruYwfpFpCgc4pQRJUdDeBUrMwo6mqdvsQSKZBrDBrp0N?=
 =?us-ascii?Q?TFeq7sqoIuLVlCb4EwH03PklLIiBBAPXSAE7IKDjrU1KrfxaIunsLJ8wL2YZ?=
 =?us-ascii?Q?kJ+mDEl9IWMc1knZxiK60IvnuRcO667ZVJMHycwZX6P8FxVimuFjIF1DCWl3?=
 =?us-ascii?Q?/DZd076/3Qbb0CTPtzt6+6ACzNF+3UORt1OSeH/YhOBzUW+92t6oc2RZsaOH?=
 =?us-ascii?Q?B2/WT/6Th1UqYi4MjxdpfhEgFaDVvUdwwoAQpTWiVGIREX791cLDQ1IQ1cgf?=
 =?us-ascii?Q?gr5Oe6dYdOVDNCrpcfIUCdIUUeE5l0jKVqB5KfnomNxv0w9SITS+Gjvkt2ty?=
 =?us-ascii?Q?O9Lx3pkfBa7KXmmewk5D6JWEvaDvkDR6LoZk?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:41:55.2501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed69e32-2724-41ee-d039-08dd8c930083
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB1009

Enable throttling down the CPU frequency when an alert temperature
threshold (lower than the critical threshold) is reached.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
Changes in v2:
  * Increased passive trip point to 115C (10C below crit)
  * Dropped patch which decreased critical trip point.

 arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 57 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi        |  4 ++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
index c7486fb2a5b4..3aa127157d24 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
@@ -12,12 +12,29 @@ main0_thermal: main0-thermal {
 		thermal-sensors = <&wkup_vtm0 0>;
 
 		trips {
+			main0_alert: main0-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main0_crit: main0-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main0_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 
 	main1_thermal: main1-thermal {
@@ -26,25 +43,59 @@ main1_thermal: main1-thermal {
 		thermal-sensors = <&wkup_vtm0 1>;
 
 		trips {
+			main1_alert: main1-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main1_crit: main1-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main1_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 
 	main2_thermal: main2-thermal {
-	       polling-delay-passive = <250>;	/* milliSeconds */
-	       polling-delay = <500>;		/* milliSeconds */
-	       thermal-sensors = <&wkup_vtm0 2>;
+		polling-delay-passive = <250>;	/* milliSeconds */
+		polling-delay = <500>;		/* milliSeconds */
+		thermal-sensors = <&wkup_vtm0 2>;
 
 		trips {
+			main2_alert: main2-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main2_crit: main2-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main2_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7.dtsi b/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
index 6c99221beb6b..b6e5eee99370 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
@@ -50,6 +50,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -66,6 +67,7 @@ cpu1: cpu@1 {
 			next-level-cache = <&L2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -82,6 +84,7 @@ cpu2: cpu@2 {
 			next-level-cache = <&L2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -98,6 +101,7 @@ cpu3: cpu@3 {
 			next-level-cache = <&L2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
+			#cooling-cells = <2>;
 		};
 	};
 
-- 
2.25.1

