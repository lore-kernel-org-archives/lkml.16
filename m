Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060.outbound.protection.outlook.com [40.107.249.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595191EB1BF;
	Thu, 15 May 2025 05:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286472; cv=fail; b=apeeRmfnkW2QI8QbMJMpDBMIlVE12JJWeLnjZiARNxg+rfTXVaIHk9SGaBGdrkYlEABEl66QAblHSLXSaWzeA0VQaiPyuGr/9b7yku7VlNNmmB3agbDx2wr3cpNky3YZI22KF09/spFArR+G+DFbxykDes+fpfSgfqOkhs2H600=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286472; c=relaxed/simple;
	bh=M0DPujxJdnZUK8SL4hw5D5GPHdSRRZWdEhBxwgoPHQE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gJfju3Tu+1Vs+TvXO3FBt8oMD/16SaMxO+vLWN/ZxKHGAKNZKogvnME3d4EONh3+NzzNsuO4POUb3xrBNgvcb1BN9d6uTjMnu9secvTmTUagN1lkibCT9qwNT6SpL3vu/PnRuPdCoTW3wyu+9FCBkBSyUGaTjdo/ZmHsXadnz34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O86C7qma; arc=fail smtp.client-ip=40.107.249.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O86C7qma"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLxb4VuvC1u51ZSm5WseJPObMS3y6zFxuxoO+LDJ1WUiPPjlrjp3o38yxvLsh+0BnvUjxQdS8szdBWJCdZSs6s8A5yVOanMgYuJ9/fDjtP8iq06wFAEtGV8Koic6j1+mI+GNVZY6PVn4DLdMQNQ1ACp3oYNLf95Olv1E/ze7t4Ix9y0za3EVPm2HU+Bori+s0H/poh30tjj8WbuUok4dkGjNj6Ibst1QcD28KzDuImFMS15Koxg1vVN8mLyGBTi8qTCQse+HlVvMUQvn+TWNG+w4D645LE1gY9JzEIn9K22JS66uhxiF/pOIkqjctSy+ZZcMeH78jhBCz4XRiL/JrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txkDWPPpNEAcaEh+aWgGR1UfHR3w7+ZNo1Fv3Glj858=;
 b=IhFPPCJzjS8uMdmOxIubCFKGwC1m0nSzF7UM0aQWs3m5cM0xUgPdY4AdgsAiY5hIkpsb60KqFJgWymWlX2LN6DUZdKJBsQLZS6NMKbyKgb/5fK+RBQUWu/z2jA8/MFoUcpr6P6xZzmc3PkfN6y1YlGiXxDvSjEwdZXF+eHMhmjfimnJb0+aNpDxr8Fpw4A8z24eLc3aOBgZ5Fxien7f7W33blD25OcHjaCtzv/OUqFCv/cpn8xC9HfXLQSI9rn0T5+p/ymvGFq1VjRAIqfR5Whlfo+6adDa9/DqhO60sccOfsyDvE/5sd3FeUFHfzHAuwBcNSM9aJ5GXmwb8PKqG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txkDWPPpNEAcaEh+aWgGR1UfHR3w7+ZNo1Fv3Glj858=;
 b=O86C7qmaFUSfGNJSqPACQvl/jYHcE0X8XEOh/AmbnxYKMHYYlDqaa4tepzjqbhLQboxXEopnq10Rpo3NTIHEUyYShu8h9RZZVdxuzoYuOcYqGCi/bUA3xiKlujHOn5LEsT67Xg0doYuUzPTM218yc1cF2IsWgPY8lf8WLZAvCCSEMbRMq99Lb3k2Dj7tHFri4MnES5L4ErTuFLYDXGdgdOtQatHpESHpjVYMszQhE1/R4BVQEtWHucHn+fyFqUUF7OLWomieoGgEFQSGyylTYFsQFcgBtNT2fbclBy96oloLp4FTv/r/TFrM5U1fiKcwwtd/9zXe+hLhcTrUtqPaiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:08 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	carlos.song@nxp.com
Subject: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
Date: Thu, 15 May 2025 13:18:55 +0800
Message-Id: <20250515051900.2353627-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10914:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1ed2a2-2dd1-432f-a767-08dd93704c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tgZdLn6ANiMy5lRHKaKK2HOF24Kz03OINgrOwG1EXr13rthYTGBfarC97ZLE?=
 =?us-ascii?Q?d3GjA1MrpOwlzHdthcu5LA/UaHT9YXxxJkR/8De0gCCe77TtXZhKdZDIPr4T?=
 =?us-ascii?Q?ni3REJ9SyVRDD05Ce7WV7Rtlr1T2nY1dEAZC5gjRFKE1+6PReHeIBuG2brY+?=
 =?us-ascii?Q?6cuYEH83GRNecKM4ncXgfMGwP2NHszIjLDawSFf21CcvVUuk9UnGAbUGPDT/?=
 =?us-ascii?Q?zLYCjTVP7Fp8m3o+q0NQgI2/YJgi0OoMqpzsN4ZlMGF0infAt8tF/q0p6Bds?=
 =?us-ascii?Q?SO6de/FM11ZZCs0roTV/iyjXoxYM1x8gG3ySkmvMtgOAadg/eK0Mo9p4qVSO?=
 =?us-ascii?Q?n8FyBINbb1aR03jhF+8F1GJ20QQkMw/BW59gtV/J+GOoDiouY7CmLXSWi6pD?=
 =?us-ascii?Q?/Oox43EBZ7vY4Zog08CkxW1Hjrh3u/GlLfpUVPsqtD3Qjc8AMzOxwPxajbsd?=
 =?us-ascii?Q?t1gNubxD2owSFOHuCMhrhCjimfn1uFS+F/WPbbF4EvZtdlI+Rt/yX+6q6KCp?=
 =?us-ascii?Q?xwlrcIvI9MUWa6d3Q1QkuJeJTtZU4QS9Nxtk6Mt0KoauKYSXxAfeLPhjwAxX?=
 =?us-ascii?Q?Z2OMVqPnkyPU8pAiuqVSKkQvtg7sRbO6FH9KvkdWD+AKrIFvbJbaW2/ph6+Q?=
 =?us-ascii?Q?dtirknkizcMj45Yce2UzyDgZn1EeRoPjFHGTl35s91IaGaV8k1B8af0zW+Mm?=
 =?us-ascii?Q?hc7rQpl7Y+5vZU6kAsKJH7JlzSiq1FWK61tWEJhzEodcNy1Ev6U4OULlKcld?=
 =?us-ascii?Q?N5OQ8dFFTqx1u2hC9uVrTG13+5PIabWOuYvq0GM3Jc0kbopHUUzjvDqi8QH9?=
 =?us-ascii?Q?fj20OQawbjZ1NOpj4BUtKbiMk5IaVj6fep6nxmi6h7r9hNIDOZlRrAbF3X2h?=
 =?us-ascii?Q?MoAnED2vhvNVQ8G/CubhobvDuEc76jl66Z+TxdxsT11BopVnfeh3O+ilI4VH?=
 =?us-ascii?Q?ch+23abpZt4Pqy1QZRSN9nu7SnIQUZq2NO+AvmgNA8YO8RRAf8UujxmTcv6m?=
 =?us-ascii?Q?UNywL+/txt8F809uzOkHDg6nCay61/p4UUm/X0ZOzdKmRD7+tfAvzyrYB4kv?=
 =?us-ascii?Q?w/l00b012IueeIJOpg+oHYRJnM+0Pwy49YJcGb8yWw8P6b1xpHAMal02nsAR?=
 =?us-ascii?Q?Zv+7pBMo2QaGEgCCLtM5VsBKw2mnHymXCpzYeBmC1wfqtgrbpgSXD+S7Sl4t?=
 =?us-ascii?Q?vyV7LWUepqTad93yCw4ct9JwXz5wUtULhTby24JcNX4idhhc+ZrG+tzVM3P5?=
 =?us-ascii?Q?4GFwp/8x+t3qWyeFCHu7WDUY2je3JyFA9x1+c4cdD/2zIqiCpEAnn70622nO?=
 =?us-ascii?Q?6LnF7vEd1q8lfYNmJepzjGqx5brKCrsLqEBsuDBsXKlTnvvHK4/KDhFV0Ac8?=
 =?us-ascii?Q?pAg/XQhpCDhsk1hPM/d2HO/HQv9fvRzxZBxEaImU96n3buCww0W1+wJUZEeo?=
 =?us-ascii?Q?5ckYYTa+uYx1WrDQqp6cZOjjSIB8+jYZXHdJLcklgJNPcVAtkjT2e/UZxNfy?=
 =?us-ascii?Q?a7ycQegdLAEGsSI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nikGPMuiK16gnOqQZXxYy0+Dm6crZ40Tn4T7ne0BCZqyZPobgQRqr6BrOEOo?=
 =?us-ascii?Q?9LnUic3HuuAHg9rustxkqFar50NMaJ7gBr/OnhBu2KLPklKOIW4hzMFdeNIP?=
 =?us-ascii?Q?pDYqCvf60tpP5bpivx8El3/+Etpyzxm6rp/uDtWpQTgnk5AqAb22DeSEv5nh?=
 =?us-ascii?Q?zOBksQE72X8BUsVbka/fP+UnLRLwt0R6m6n30HTEjukIR9gqdVcTPSp2Bdn/?=
 =?us-ascii?Q?nTY2XNCyio5pczyS42mOVBHq5RcHYKSPGX7i7wPleH6XxeiVVLqUIRVPTQg4?=
 =?us-ascii?Q?ugXn/pH5dVOEiGOHmilu9LjHg9DJ/UIN2pvojcJPgxoxU2h0AsfSjQAjtbP8?=
 =?us-ascii?Q?WGJxfvUThUnBm0PrXlYU8mWvu4/NsntBrYWVFKwhavCvpJLi+CJAwvRZYshC?=
 =?us-ascii?Q?Wk4oeUWNUSj3f0gc6yMtpbQYgw87w+yIdY9XeQIq/GuIu+lgJeOyrOj1umBF?=
 =?us-ascii?Q?mJUggi5ka4RJHJGoDIdQmwnuccmIe1XOx7nJrA2RZBDdbWZATnnXbQS9Ujdk?=
 =?us-ascii?Q?f+9WER8mOOppktvtSCVgXTsmGNk3k6GjoINH1UMNGDNwp2d2WJPj7fXnyL/7?=
 =?us-ascii?Q?n8/Kxb5Sdh9Khq/t7ShtnDzAfxuZX/s4femTtXPgiJXex7LwI3yL86+P1Uu9?=
 =?us-ascii?Q?L/XWuYWmxiVH5IgoRRZvHNQXsgWqN4Ha+3vuGn5EOpaoOsnIX0ZybPZ8I3eB?=
 =?us-ascii?Q?v0JSu3aYOukwwCezGkJ5KRD0ZXOW69KoX5tlbahn0CHsp3vHslpE43WENWNU?=
 =?us-ascii?Q?cxKW67k6KeDz7JED3sUOVEmvQQODZr5653Inf/KMuY7dKeb9M3CshPR2KXXF?=
 =?us-ascii?Q?tpJpgHQO3lit71VrQunffdXlBxRBtWm87E2JDyLgcyqnhOq/KsW281TfxKuf?=
 =?us-ascii?Q?6dCoQ5qUGK+YyZF/LjtQNKk4aVIXZWht9T2VcNE5nVqqUdGVllfiq6JWX3XK?=
 =?us-ascii?Q?eRZ3SdDioJxaWz+3g5ZMbOp/VpbNL19i7qhPHV9KOuDWLEsD9ABY46Cdu0GC?=
 =?us-ascii?Q?5OwJSdXHmi8wg5qONMTub6F7XOWsv0E8w0Pn4tIUfKffRAwsh8y2y6KMuwF2?=
 =?us-ascii?Q?yK4lcnpKnrt3ra9mlAOZ35tAMqadoBv5SpCtun64horxfP1bpy1HMjjeDrtF?=
 =?us-ascii?Q?ZkXsL2AQicqsH3sg+j1lvni6icqznyzd8blWZXLJ7iDoEvW3vcfGFmCO0OVx?=
 =?us-ascii?Q?EHukH6GdbbtXl+wngikFUoxdGKK/XLMhUwdFSgPOO1HBkdIJk/3rmaybcrzy?=
 =?us-ascii?Q?4T4SPWAm0ys0/wwi220Ftkp0FyCPnztzA20bP2sMXKRsR2875ntRkMHYXuwt?=
 =?us-ascii?Q?jZJFbFPnazFUDm4xtU2aX3rqqo6Paop1gJXKks4e3fVy3U+Eb6dLSjYtCQqP?=
 =?us-ascii?Q?LVT5byX0T7WKvllhYJ5QTcWJW5358m8SvMUcx4pby9wXOiQGBixk6tF5nvIm?=
 =?us-ascii?Q?thV3J2w+Tl9PRTqA4vdYdloiwdABiiV9/iC9z1pKTBfDcf/d+bXL3R5L8Rnh?=
 =?us-ascii?Q?+8fA3LZl0bT2skpmQ0swqevT00KEO1u58E833nQsF1pRJD1++EmAv+St1u/N?=
 =?us-ascii?Q?lXlx0PVe1zlrj48IF/nZ1xiuyGUIq564HlmddCfk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1ed2a2-2dd1-432f-a767-08dd93704c08
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:08.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsX+Ne4jN7dlZ9GbGykOaPc0Wcmyh1tUXZ4iHS9O03wbuX+p3eiZWr2xJ4hPtY6rSpLiqGrp1pdjW0h43o/i9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

Add micfil and mqs device nodes

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 3661ea48d7d2..77297dde5c95 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs1 {
+		compatible = "fsl,imx943-aonmix-mqs";
+		status = "disabled";
+	};
+
+	mqs2: mqs2 {
+		compatible = "fsl,imx943-wakeupmix-mqs";
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -1045,6 +1055,26 @@ sai1: sai@443b0000 {
 				status = "disabled";
 			};
 
+			micfil: micfil@44520000 {
+				compatible = "fsl,imx943-micfil";
+				reg = <0x44520000 0x10000>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
+					 <&scmi_clk IMX94_CLK_PDM>,
+					 <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+					 <&scmi_clk IMX94_CLK_AUDIOPLL2>,
+					 <&dummy>;
+				clock-names = "ipg_clk", "ipg_clk_app",
+					      "pll8k", "pll11k", "clkext3";
+				dmas = <&edma1 6 0 5>;
+				dma-names = "rx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
 			adc1: adc@44530000 {
 				compatible = "nxp,imx94-adc", "nxp,imx93-adc";
 				reg = <0x44530000 0x10000>;
-- 
2.34.1

