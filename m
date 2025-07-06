Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazrln10223027.outbound.protection.outlook.com [52.103.171.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EC2AD0B;
	Sun,  6 Jul 2025 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.171.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751822244; cv=fail; b=V+hq/gn3X8u7S9YhDmYE4QECUZzIUpAlec/NebhkjlPuo03tktFoCrcgkE/es2zORkuJTO/1REzqrj4/ha2aFMsbpR3OLCCVu6mS7W9VPWmNKoTnkPju406PO/eZfuAZIrgtCMTGk4pIthBMALdDtmkVyE+DTMHrRrUCf4SN3+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751822244; c=relaxed/simple;
	bh=s7VMnlcYRlXdsDWTq+cogAwm02sTkoT4f7G3RQwGrhs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxfjGAE/4jINgvnslrTltht2Ohl62tHBD1e2r+iYOxou3W8VGaekPIjxuAgB5n38aJhkdbAZR774XA/XFRO3SwlyE235xAoeLaDG8wCOCfg0GkKzARPIK+8H6KwXystS8BscJXc6KICVKjNTW5WWOvKgS6Zd5dxzD8Tur1Jck8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=jbR6q9SU; arc=fail smtp.client-ip=52.103.171.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="jbR6q9SU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSzyWhhKh7DnzisasmcQSqEdRko6WJYzobhFSPt8RQVRetmyp1xfZfcUekZArVZ8SsgX0ngkJfafD6jrbcMFHTVOiTwWucRQIzn2WyHAbP9dvZQ8OwqqE6y/pY7dN8w6bYhwm4c2lEUYeEbLPsYDjv2Ivkyr4O8ogf6lBdqixPnACitvRMBHR8AN38OTWx097BTseiQ1WtuwASStLR2MF4G9J/CYHikMlIvGW+JzTHoI0XSOayYKmhQCcXMItpP/PabLwXOC2AJ+kH60ZUUHgXFXACcbTOTzUroHU1V5/fLlCnylyQmTYTrlWqmtarSgD2SsqoaDTI6K+NEOM9ShNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9sKOw91WAFiMFFKG33jvuNxfpHDF4CfgkdwnKhB5Vk=;
 b=WDF1rBRTEcqOyoyfZEHvYFTzhS6RPZE838ff+v58OIxxj8bz7zBrINLuMZGba5BUqmBx7fjNOl6JdddVOiSRb6F68iCk+rdG7CqkldpLTddqZ2BHPIQNqw3Gb2OsW81rKcfyLJ4culrCf0vLH7ei5F3qKCNQMiUNcjWcozsvsJwjPbn0CSG3t3T+kbkuki6dhnvpiA9Z9pu40QSyzFgdxwqcpXavvGXubNGO/t+06QCtc+R5U4ULSQVuNkRWZj2CX7GSFndhVrfKNKX8Ok5eUl6gqpT1G6ofIzA3brOEnjL7D5BVJnbuQ3u7kOv6WjfZ/92o2bHBJZihuwKIOexAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9sKOw91WAFiMFFKG33jvuNxfpHDF4CfgkdwnKhB5Vk=;
 b=jbR6q9SUOOIAOU5gvHR4sg60OqYmUtP+koRy3UEyx3o0hk3ufWRPLfGGjhnwHKKCgWtDHBaue14zuKLUkg6brHuz9gXPFpeiFn5lck0vr9chMYIesK89Ng6ub6EVTcz00xQpt+7mZ/3RDmqbIZbXoJnLZ/B7qfFeBnvHkcaeBuw=
Received: from TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b4::18)
 by TY1PPF538CF1BBD.apcprd03.prod.outlook.com (2603:1096:408::a57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 6 Jul
 2025 13:42:23 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:400:2b4:cafe::f5) by TYCP286CA0095.outlook.office365.com
 (2603:1096:400:2b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Sun,
 6 Jul 2025 13:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sun, 6 Jul 2025 13:42:22 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 21:42:15 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 6 Jul 2025 21:42:15 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id A95B55F652;
	Sun,  6 Jul 2025 16:42:14 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A69CCDC3163; Sun,  6 Jul 2025 16:42:14 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: nuvoton: add refclk and update peripheral clocks for NPCM845
Date: Sun, 6 Jul 2025 16:42:07 +0300
Message-ID: <20250706134207.2168184-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250706134207.2168184-1-tmaimon77@gmail.com>
References: <20250706134207.2168184-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|TY1PPF538CF1BBD:EE_
X-MS-Office365-Filtering-Correlation-Id: f632c777-5207-4162-1c5d-08ddbc92ef3a
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|48200799018|7093399015|7416014|376014|82310400026|35950700016|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/HaM+wWkOwtBHfVauKQDZIIXceKfwW/Z8Au3jNe57Zz0ORd68c0h33gBjXI?=
 =?us-ascii?Q?Bidh52NNFYrVucp61Kl7QaC4pkv/hSIEM1+jxTZ6Wb0z3WsuSlTjyylGsE0A?=
 =?us-ascii?Q?bM1RigIsvflHA3MamKLxfTzZcZLK7iNYo9wSWpjjOGNdFCRyyKaLIortakbg?=
 =?us-ascii?Q?mrlyqaZpnlsnQrKGzFk/VyujWfyiO10Pm7FwVDsxQPJ+RbmZsJurnYuymJqF?=
 =?us-ascii?Q?7TpfofZGFbvlS/NNFtTawxhIdyxb0SN0l7bCsw1kF7538Y1DpJ6cgOVw9bJu?=
 =?us-ascii?Q?XrYWF1RSr2afOpmRW39Hu45fNWStNjOZg2kYKci36JJeyzCF4H+2AtS0Et3L?=
 =?us-ascii?Q?pgQY9cV8Oxmiq4eTVHCHT9vPHk9QarlKTtZVjCAKQJkwVDMhZ9Mnpvc0rayw?=
 =?us-ascii?Q?ZEehkeO5mntUUtjSq79d0d4luJDpSRjG3o3fBNxbBaibLKrSOdbDlGVE+DCs?=
 =?us-ascii?Q?S5eqfFKtni8CebQsf2heBUEu/8IueRWsO2xIYi4QvUo+kFhWoIC1DrxCnIAa?=
 =?us-ascii?Q?b61Zd0j9kOchk8a1LIrItfD9AsrW3kpOL0YFvE4I60fSE831KTaGRyTUPkhW?=
 =?us-ascii?Q?cCColDX/mmVKN6zpE5X4A0g2qmO5mLPXJzdE3G3VYsNRG587bzLnK8AIEl7/?=
 =?us-ascii?Q?0Hu7MX0glYxs8jBpuCAxVvKbNoPW6V+/avzoNKnBjR/j91Mm46JjuxeWH4p1?=
 =?us-ascii?Q?EIvBV4Tk2p03axkxNUREONGZuwuca4Z/ZkI50SDG/LhDGz3ruSsud4kcRmED?=
 =?us-ascii?Q?YZOvpTGF/YpEa1aXjeguqXjDTgoew6nl6lDmzO7HErzK4YVOg1hBaKovhBJo?=
 =?us-ascii?Q?auDjlOs5+erjDWB5IX0KIaR2dyedLxR8Y79kkA5K25zt1ESnGICC8IoUoEB9?=
 =?us-ascii?Q?Is02sDlNn52WQTNMaDPxjrAYJ1ynbeAoqT7XIMU57VCffXGzq/BmMdQ3nnn2?=
 =?us-ascii?Q?NlIa/JwMv9yY9G1aHSWp2aRbuUGhAuqnhylKEggy8woJNcco+xyzgXtfVL3I?=
 =?us-ascii?Q?Mxbun4GF1MamSNE4jMS2pVYMyJSMuoJeTTD1leB0TejJdZGtDgYkcg2SZyXX?=
 =?us-ascii?Q?s49qEc210oZZ9zdi0fBgJuVU6Ol/5HKj080rSMwMfd6FUcFocYKhYiPjoeU7?=
 =?us-ascii?Q?kKWTh8Zd8RBFqdCP3Mt/Xag6lTZ0Sy+uWFShrAq9YGN/AV9/pDhyka8WveBf?=
 =?us-ascii?Q?cP3tEGHeFQ9jMInPSyxtfz9nikwgpYxYp8remPNusQwYMMM9lB5Rlj2Yg5+3?=
 =?us-ascii?Q?LvBtQ/uWCJ7eDuHndFOEvAhXxbXf7MXm4WgJWK0ymbyy/PKb00S1ZSf+T3YI?=
 =?us-ascii?Q?RnE949HvgxUW1RrkRM9QN5XnbbdeENmltosBxFokmumYruylYIJ7eziFJsSr?=
 =?us-ascii?Q?fDApIY/z+p4EkVbciZktvJl9XB3XhXYBUGlYCek2M0DvofxGnYxPupmlP5fX?=
 =?us-ascii?Q?wz1QXjohqNfFkccGdoUCjVKd5kYfk8dSZAJzDst9P43uBzIA3VN6U/q5A8xR?=
 =?us-ascii?Q?T/O+e9nRXR+3YvkFyAamvLLPmUiFKm+8ZkAh?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(61400799027)(48200799018)(7093399015)(7416014)(376014)(82310400026)(35950700016)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 13:42:22.0450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f632c777-5207-4162-1c5d-08ddbc92ef3a
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF538CF1BBD

Add a 25 MHz fixed-clock node (refclk) in the NPCM845-EVB board device
tree to represent the external reference clock used by the NPCM845 reset
and clock controller.

Update peripherals (timer0, watchdog0-2) in the NPCM845 device tree to
reference this refclk directly instead of the previous clock controller
output (NPCM8XX_CLK_REFCLK).

Depends-on: arm64: dts: nuvoton: Combine NPCM845 reset and clk nodes

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 6 ++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 2a36d0b2824e..04a5029bfc7e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -52,6 +52,7 @@ clk: rstc: reset-controller@f0801000 {
 			reg = <0x0 0xf0801000 0x0 0xC4>;
 			nuvoton,sysgcr = <&gcr>;
 			#reset-cells = <2>;
+			clocks = <&refclk>;
 			#clock-cells = <1>;
 		};
 
@@ -76,7 +77,7 @@ timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				clock-names = "refclk";
 			};
 
@@ -148,7 +149,7 @@ watchdog0: watchdog@801c {
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x801c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -157,7 +158,7 @@ watchdog1: watchdog@901c {
 				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x901c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -166,7 +167,7 @@ watchdog2: watchdog@a01c {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xa01c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index eeceb5b292a8..2638ee1c3846 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -19,6 +19,12 @@ chosen {
 	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	refclk: refclk-25mhz {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
 };
 
 &serial0 {
-- 
2.34.1

