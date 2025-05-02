Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1772566D3;
	Fri,  2 May 2025 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195996; cv=fail; b=NKDy7W+RyGZmVlDEDp8PYz7Xrj1fpyN8EpebQ+XbdWR+5Wtx5PwgTLKNRH/yGnrcQ/TBITcBRsh6jj8242rU0q9kSMYUisB+pEcgYhMTmkZ0P1ky313DceFl24vt1ZyKpu7RcPCXoSEjj/qeBNbrgItYQ1fzFda4hjbC7B5+XWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195996; c=relaxed/simple;
	bh=MO5lR6rRLk5CgQ5uqLmIXWYNsJsarivHN52Ro341JCU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l6Dpgif4x1QdGx8AK7RevFXpBSF4hMkCHrQBKteSd64XEbJptaZWN/64acDQUdlNHW3CWJZEwjgASWOBGG2zb08hYWQXJGqo7jgSjbL3n40VmgwyQn9yKXC0qFvhydq/JLy2IeBQGZfhJTxq/LTfd90ProBaNozoTYaklIyuczk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=BzzYZmoF; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="BzzYZmoF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSLKlwuibLklBRghBKaKm3q4/1NJwppOoUt1oDe/MRo8G/Q3WAmEGmhemOVBHDOyap3+Nk80LYCLpMopvi8lMh7H4z/EySD9uVwA/3g4KlEJ0OkPncj7FeNfLI12ASWGShcW7ycqVcEuIFKk4yqgJIN2xk8ceAua0KBvIzn2CDwgxfGIQa/GQl6wMf0Md3YmBYfeKHlAJprXs2DUTZSpyZBzKyozV1fJkPOGWTVLWwT9suFYDMfPp08qt+jQSCZqyN/qjuNnjKcAK+WJoaQ3lCOnnoGJcWtV8ag9Ta5BS0xgF8cGgdBtdS2kEeOWp42EBAe/vMLN2n2lOPokzOtSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbH1Xx2Bspbo8b5a07oMy1KXVKdFJV2ljjkhKZ3iIXs=;
 b=I6o4f1SAeAs1CQKrIgtUmUATQBmA6LZiB7F8Uu82KxTHKBYZcSHPv32V2+Xk+/Tl1gSJdXE3MNyXyFiEBErZHOLgqH0rPnUci31/egJAUGmXp5qS2EarMbOvsWYuDX1R8Tw1WU9CfHLZLDDT6MrWegMAV7Q6SuHW/bcGuLSpZBkIf6qlWWG2lUk/RiytXOpbNJ3kGM5usV7ACUDpAcLcGNyVWdAb+DgX7QHalvDPCnvVprrXOFap77unQ3kp7Ql5eHv0wrpteuIpcMfStgvP2OgGXiRfQ5s1BH44B67qdPnVSCU7+SVbjJzdv36MqH6yxfW0ylK51auZjABKVHu3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbH1Xx2Bspbo8b5a07oMy1KXVKdFJV2ljjkhKZ3iIXs=;
 b=BzzYZmoFRNmuRT6d1WPjUnZNtfw8sQk/ToaVJVlnJO3wVQ+TSO0I/x4+/y8NALex4sMdVL4kP/YLrl69k9+l7GBZuS9jwroUjp6INiWTv/DNevSAF7GtB8nsAqFWqVkSZawyOofody4yR8bSP/RlUt+NF+zMPVDDwXsy4CDUOC9DCLJ5QdfmQ/ZeHjmucl8oHrY4BMiWuPfl1kz9I29UZCqUupupZLq/vjv9GRQEX4buQvNMNQTdIiS8WVbovzssqf3ZcaWFCcZtv8z2iAMOv8pbdZiugN1DDmtcnVAMzNXes+2usHnmFhNLHhNbvpaaujXE9C+j8tyf3UEU4iUfIQ==
Received: from DU6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::25)
 by GV1P195MB2551.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 14:26:24 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::c0) by DU6P191CA0072.outlook.office365.com
 (2603:10a6:10:53e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 14:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 14:26:23 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 2 May
 2025 16:26:22 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 2 May
 2025 16:26:20 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
Date: Fri, 2 May 2025 07:26:04 -0700
Message-ID: <20250502142606.2840508-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|GV1P195MB2551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1fea80-b91d-43e1-16d5-08dd898550d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0yvAL3ep3pphtDGTtZJOc8T6PuQiQQgdo1SgXuHpUyLHSWqeJbTnGdQ9k0J6?=
 =?us-ascii?Q?yi1g7Q/v8dNWsfKk9dCdoB98jp44SPQI//7B+8erFvsVi8T/Kou1anQDPe/t?=
 =?us-ascii?Q?ckKFjzq8nUnX6z7F8qaSae/w4ol3r2UWTEtMbJKtQqKyJFDBpgKTTc2OtzIA?=
 =?us-ascii?Q?BZp6Fd/bA3FQYDSCOVZLr7cmlG9GB0w/FdS//MD42+eoCzm0PtcmvhRwu3ba?=
 =?us-ascii?Q?KOsPpMvzsTEbEJi1mIVSRFHXJ16L3abdbgFOSlP2gMX88ld0RbgAS1DHejTS?=
 =?us-ascii?Q?SrEp/MpTkmsKVClMAXGUliIltkj+eYb1VmItdjMoj2+eZhbCq6l8SP1oTayU?=
 =?us-ascii?Q?ALAiqPV8/bqN+l775rNjOcf+haLY2HR9CEkbgI7HqYF59gJbjbIQzo3avXOV?=
 =?us-ascii?Q?mV23z+lB7bjWMjbn2VEtMb42+mkqtjxue/P6rKocTQ81kItbtafPAJMTjF1z?=
 =?us-ascii?Q?Plowf8fIZ0qrH9XLjxpmHMD7dH3qCfx8uKKZ+WrhVAQeeEgu8Yy2lkwYDJUo?=
 =?us-ascii?Q?dWwuoDC7TfQUaicWL8QUF3kMSIHavyAS7y9t7lPt2KR0/bd4/HS09cNjuhE3?=
 =?us-ascii?Q?COceGbajnBSYYC4LFUa2k3XQoqPvxdJXMqraUvsAPDPl7PxVPiVot/EnJbZt?=
 =?us-ascii?Q?BOylpJFwNSd76MtGAGyn3j0VAtLljRaQjJHTX3aunm9Sr7kjHyRHTHFAEKWC?=
 =?us-ascii?Q?uwuj+RML1IByVWgpLz8YovJRiEJdCbsEL56+qJOXD9VFzG/jY47UwaR3QG7H?=
 =?us-ascii?Q?sGzwJZugSjnRnQ3dErmVlD0n9Ms1a9naFYzFdc11cLv8QyW5Y313gfbJcKTf?=
 =?us-ascii?Q?4EIYxRZxsAxXIUJv8OPGNHDsD1PnQzvfaUNd2w2fdBiKjJzf/KmxDuWIh0fo?=
 =?us-ascii?Q?y2y4L3g/wNxfkDDdnG78tmsSw0y7UqRWD22T80MWn1G2fOArKWmA575fYgY6?=
 =?us-ascii?Q?EZ5DkmI0XA2hZJBDH2U9Qafn7Yj8Xm6CjOGFJVUwybBL8wIbbgorYsohPZdc?=
 =?us-ascii?Q?EEA4o1Qg/AlJoh6Akm6RPrRXuo8FC6I3QOz8u/PP0CLB/Gpcojvj3v/XnXZN?=
 =?us-ascii?Q?2nJhfzm/BPcAvFxGk3AQpVrOY9nrmgZVmBmkcGjPSYICI5nURjrzyWk5vjos?=
 =?us-ascii?Q?9HJ/L6jrBFTLvhl0d27k+AgRmhWjesB+aCqjBG35e2ZwIThwMxaKtaYITnlm?=
 =?us-ascii?Q?Ql4N2hpdjR9J2FtDWwogYrnWLjAvVYSZXstxNrumIdPhQ+Pi6cohmikakhEp?=
 =?us-ascii?Q?C4Nv04AVJp+MJSVjC6nMiKrpUNzDqTWix4D1PjnyPzIJcHPnkHdkXx9rLegj?=
 =?us-ascii?Q?1T91R7iH/n1rSvc4ohJLJ6L8viYrF5zdeB1JEfH5PY5uBAE6Bk8r1/h1I/2X?=
 =?us-ascii?Q?iuCY2MLTGC3tZOjIJv2QDJqwH0foK7J9EffRdsJmIcL6Hfkp1W3rlmC0Yoof?=
 =?us-ascii?Q?Vt6t0ZNZzoIiBTwWIjEa6QA4LmhZs9+nI8dqxTifm9Gz3+JTPUkofFYHa2xT?=
 =?us-ascii?Q?KkWvx03Up0FCPlZodQC6V6uEugwcAFPln/QZ?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:26:23.5774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1fea80-b91d-43e1-16d5-08dd898550d8
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2551

Enable throttling down the CPU frequency when an alert temperature
threshold (lower than the critical threshold) is reached.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 57 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi        |  4 ++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
index c7486fb2a5b4..39ff9118b6c4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
@@ -12,12 +12,29 @@ main0_thermal: main0-thermal {
 		thermal-sensors = <&wkup_vtm0 0>;
 
 		trips {
+			main0_alert: main0-alert {
+				temperature = <95000>;
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
+				temperature = <95000>;
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
+				temperature = <95000>;
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

