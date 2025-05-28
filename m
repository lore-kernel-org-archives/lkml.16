Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC60E1C3BF7;
	Wed, 28 May 2025 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397643; cv=fail; b=W3bKe89BygxOjQY5rHdNYodEJcD06T99QUN7XMMSDtZQUHLvY2siMdbxUjRXprPKhc58qui18WhH6jTIRtd2LdTgtWKYflhB09gduOAHloh3r7O+bQX9UATT+Y8NxCtecxIQlCjcx6O1u5XbdAY7rJFYsBSv+39Z3bPd/GXsvBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397643; c=relaxed/simple;
	bh=p28RDQG+f/L47WY37tQJiBQat7g6nfxLREz6I0KtnWw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Afx0j59hrYahAC/TSg9evZa5tPoVUbCEkTP7OM5PJxu4MkVypRY9t42zwnYCAQvwr0YBETsb79xEKqwMq7+uzAJcvyyJscNKHlNOyKBKNHe48p9gipg6xJuHevKlaVLnfRzHwpSeG5hcNZiETfhhdJFcFgATcqwQ3aui6APHb+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KZPie0uL; arc=fail smtp.client-ip=52.101.70.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KZPie0uL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPmmAoHeoT+GngjhT5JFP+CN0O6HwTnJQnOo+eYm1W7hU0Lz6ueBD5gMhbt3SAD9w2DI3xk9X+hPed9pQWa80CrD3bbpl9UYvee3nFqHYJ8WIgI5rUOXqzHoYD1MApGXwpdG5Ypf/dDrzR1PfR4+OZS2QQ08UZN1Mh6axL3IzYg3wwasCWH50p3Xhnd5HoLgEtjLTRxtJ68uuVoVP/iPzLDyPKjcaU97URzJRVJ+JSIS+e3Y3BxuYt3iz/YtxFNj7Nxr6Zv5Xn9C8H2NNGt3/3sE4Sp/k19bq2BN/5kCT5slDwcyG8qpP3wM0tMfi8ghnhJG99kEEf9dTVa+I/6DHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PITmyXDH9lX5ynn490iKglvXRwM2LfBrZiDy+jx8vMQ=;
 b=OD8zgsZdhexSpOoZTpQMgSqQwxX07fZMuaN6AYH/32BJCW9oM0MxnTH3Wse+2Lhiir1IoFVvH1nnfG7HmTzdAvno7R/zgLFONTbSemhZVU00u3uexInE+nwCTvAkT6FuD5o9rLCZ3HkL0FgKa+/0Vd/+HqIvfbCTPCSNdkgA5Mh3yEfcIt3TZ9h89/XfQa8dMcbeQZC8/dndnXgSU9CyRn44S1TlavfAoswjHosNTrtxcLDsMWaRCFEkEpDRKXR8KELeUF/tCunKlcNx2Xk7Zg2MDwFH8H7Rlb8zylxihhlpieIIk0qZAPBCnwLjsS3QzGA/cnVrY8g/c+wEYl6C+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PITmyXDH9lX5ynn490iKglvXRwM2LfBrZiDy+jx8vMQ=;
 b=KZPie0uL1nybmfUB4UTT6lQ+rGtZuP7eaxgQsRTIVuPTl7Exb+XdKtyPBj7/0uqiskdn07M7z1g93uqzVwgGA48PfV5V+5797ThFwn+T6lh1VFTYe/WIDfLLIOE6q66x5lR0L5dUmYF4bYqVhIREVSthoPYhxoZ/wDD6V5jACNm7lYlLrXEmVdhxhPpmX7j0b49d1ITyfn2HsEOGj98S6nJuPhySLUppHawDcgV0TJSjNCRJToBrLL2/DB/s5UUFUYLbAnga+lBsAVKEYSDAGtajXXyzDfV3O6cEjP/fKScXzZCOqlfBm/dGAOtGRs65M8q/zGoqDowXhBe4AFFu4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:00:39 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:00:39 +0000
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
Subject: [PATCH v2 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
Date: Wed, 28 May 2025 09:58:32 +0800
Message-Id: <20250528015837.488376-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: bdce8c72-f364-43a2-e5d6-08dd9d8b715e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ffWARsMu17Yu9rKFAldH9T5Zz3OhIm7a+JBw4PbcIrQEl2dTjvxyn64LlDUe?=
 =?us-ascii?Q?xLtum4+7iOL9uDIKCjI7fLPGe0W222Vzdscm3nWOLn4XL4x/7xpyHAZoj2ap?=
 =?us-ascii?Q?PN+RIQZ0OzMTPDGMVVtVisjtyvnG0I89V9mLhtbtMbCJwcDcdnZxYTZ05v8u?=
 =?us-ascii?Q?hSEoyIyYgxJNgv2EeBHbtrvIXuQrMeAwedgsFfZL1TPd9OHDCNr+1hqSDwvJ?=
 =?us-ascii?Q?Ya7w0IhKVMPL+tE+ePZs5E32JSKUVL0Ekw8nRntX3sxRKoGwV5DQ0QEoEAGS?=
 =?us-ascii?Q?xJVjw2COVPrm0YdJkUPJ2efi7b4Hhnlf99ZVNnX2TmuT6nbRSu91MR1GqJF/?=
 =?us-ascii?Q?oBX6FXubtMk9gR2GLF0XTz04IlSTEUSzLrxI0oY4OGlk6YDRSiWUxt6q1pGv?=
 =?us-ascii?Q?YF8pbPCGyyrzjP/2SCsDtL/ZbweF04BEydOtKsy1tQ6zmrOSlrAxsm+CPFGo?=
 =?us-ascii?Q?KsY8WoZ9iFOdlhEUiEt2Tg8W0v9QlaQRnRXS436HuQwIixMVCVglIyUcKvXx?=
 =?us-ascii?Q?Ioj7sei61bHTxIKfXvStGHy039rWCLBRaLdI74e6g0eflXQ7ESRCr7ROjBlp?=
 =?us-ascii?Q?OJiuPezM9jRH7zOQzxndIVWbeB9Pa6bdy1XDZ4SW3FJ3yMgjk1bSpf9PEpRZ?=
 =?us-ascii?Q?OnT35tyzFqW82ysRktI+I4d6yUMV3HZSwv9VCQv5C0RYRQS/JpNxcvv3nagA?=
 =?us-ascii?Q?26gqPntTI7g5dItRK75w1oXzIK2YQ/8KKJA+7pF7uvNuq0SE4ne8jjA3kemS?=
 =?us-ascii?Q?xxVJI4fwl739EcGHaFTBgh5By5SA4oVe/2RjaaUSqlUzaI7MEkRfrFsYBU/R?=
 =?us-ascii?Q?5Pcj/7S8bFIGCpTtaAkK/LUlf9zOyb+i3M4uZhvjsFoGRk2UYtrNeJfRLaKy?=
 =?us-ascii?Q?Kye0EnBKYANLqBFlzPUBrk3J5NJmrNQunoMOtE30xteHlLrbJqHUJrHTdY6Q?=
 =?us-ascii?Q?k0Tw4CIfFZPupTyAx578HyeFG3ZVSkh9QI4uqVUwi1BRIsYweIwwxvcIr5U2?=
 =?us-ascii?Q?7to8Gt5HORuCHcQ9lHhWTQP/ELOwEOjHU1d27YRaYwzL3qX/jqvKoY2cyItZ?=
 =?us-ascii?Q?1e+17oHEoCO/M8YZ4EQLABnOUAYgBT3Wh2bt82JlehGoy/mMsoCsrd/2U8tM?=
 =?us-ascii?Q?eBbUi/ZPQOc+dtuOZRBCCgITuWLWiLa/K6RKvJpuUchQlwLBXhUq7KLPer8r?=
 =?us-ascii?Q?ozr9yrD8I1tnlf7ewwcc0bFvjp2z8k7saRvRoOpRascBkBtI4zEqngvQlD1j?=
 =?us-ascii?Q?1P6lqOCNVs9ExwiLa+K73uZV0r0dUXKT6ODhWlSWBJ2rmhTZC1iiJQGnMwSn?=
 =?us-ascii?Q?+kfHzeF+CSzn9PiRNiPLgLPGXVFLbxqnlixwDqS7Pm+z97tlmCLyqBZj/Y3S?=
 =?us-ascii?Q?eus9AJUkTNHuik9cX64wZ5zezdcScDX2CtAWatTaGe19wLpLc9c8Ey9VXWwy?=
 =?us-ascii?Q?RThuTUh3GkRiGYroh19SqNX8T2bXGh6iOsG2lDq1Ef9WrIhR+1gAnM32iCK6?=
 =?us-ascii?Q?mRv0tz3R6lc6I2k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A+n3Abrg1i7mCvBLxpRRcsHKKGkkFlTwIhcARtMaDJwrIcK8wi1bcO92/iEx?=
 =?us-ascii?Q?oj1uvj7+cM0UzLsHHk5DDUXX5ELKTT2pACzWVuzoxrxMs6KU7XXYgbIDIIci?=
 =?us-ascii?Q?cf+lucoVDJ2ZGL6taO6RzTyxGrvtGA8SbN62DFhrjsTXBA56buReBmN6jIVN?=
 =?us-ascii?Q?3kDsUrUTPs9okgcucQISlncPMu8dVrjy95kAb44hDoUZxnyjPxcMnB2N9mY4?=
 =?us-ascii?Q?XOOVes87QOzhaMiVSwIj+3Y4pEP1WkuJu1AxODLOUmQlrheHlxobtueW7Iqm?=
 =?us-ascii?Q?sYONzpiZaDfdbPc+4X4jBSDJr5ykaDQRYB6pCZ1TiKcsu5SMyd/wP8UqM/s1?=
 =?us-ascii?Q?wUkWDMGGnMMPEazO60Hg46wulCPsZyevRN9RefyTVWFTUkPzMUkzE552W0X9?=
 =?us-ascii?Q?zEMwrnQKdHRb00dvn/Em95pc94+JSUsUjO/A5GULFsIQIKHrX1haNHmEfzVF?=
 =?us-ascii?Q?B81t0SFApdE/bvoM+wFOkA7FyicxzfBMODTYGsTNs+xLGrOYMSUglX9QjB2/?=
 =?us-ascii?Q?JbRD/smiL+VVuaI+MDq8PCxnZkpbv+14QOwUbRytDVDVFOmrp64lLAzNehjX?=
 =?us-ascii?Q?X2z5vPvQki9tmZ1QF8SAleqwJEiDDHGtXbMY8qr1v/swRTYh6tFxDFLRMTX6?=
 =?us-ascii?Q?vlY8yREdLccOhhLawN7jSgy+gecw7synJ5kjizabfu3KldPJctmvA5QsbdH6?=
 =?us-ascii?Q?Gbsae9QR4T5QzmUa0ye9st5M+FVmJzizbztv0Ln6R/BAVqcbytjSJ+qZELY0?=
 =?us-ascii?Q?usU9OuKm42vGCP+hcZEgYxh8CPwnbP3RJYTfcIGi1MlsvYH5lVoZc98KpoIb?=
 =?us-ascii?Q?I2I7pMlimx+pKcu94Vu9r2YTPQt+gL5EDqecY/fzJEWYvQvqjmTCf2+jHHsf?=
 =?us-ascii?Q?yppQz+ZR5Ubx+lNoW7cjq+nlUoZEZTfz4Q2r7B22Wz7mV4OO1lRyh42l4SPF?=
 =?us-ascii?Q?ApbbGwrxHfPBL48lKTTyX/yPjVFF6wjzRVUx+eKLj0fhAOf/ICgEVkErfgMW?=
 =?us-ascii?Q?7A/yLDny5pyToYMQrPKKLTIZfWHLC9F1Db9uxj1swc7zw8Aec2Ngtwahu2A+?=
 =?us-ascii?Q?Z/UDmGs7+aNdJZpCjX3C7N4LYnfCTwzJwuWZF+etCJquJPkhuGBAzt8mW6jr?=
 =?us-ascii?Q?R5FBk3xtwxPokkTvn5LFpQJiWlY9v5+78HK7+EyV6WA+JhcdE2Q2oUTsTnQ7?=
 =?us-ascii?Q?SfpYy/RYwrYcMr0kR1/uTU3lFhxmJvPtPEW2cjZwD4DltOxad+cF4YIhBK1/?=
 =?us-ascii?Q?sngtSUx3qZG2Uw4enJu3G8Vf2gv7EIbn3HsI08rVBlgUrqtfzt0bjWLgbeFe?=
 =?us-ascii?Q?RLu8PtC/EI+x0iabMlf561iDLCv7rHRxfHeLyJUzzoHCmA87DocRCvy9z7U+?=
 =?us-ascii?Q?toJhTnluu7bvqFpysQBzVmghSOYzgNmppwgVB9IhqrF6Uu02UnwL4CsRdrTW?=
 =?us-ascii?Q?ESUHRvGnD+ohRyxhVe4gCSCkzbvmezdA7aLWmyHcw/2vH5UJL6A0dR4W+Quj?=
 =?us-ascii?Q?Tr1H2/A39tRaICr1FVR/ax6mY5PUjfC0zDTnw8/2Uq7F3DSo6/Z7Y7ozi75o?=
 =?us-ascii?Q?9APBypkghIfxOEpRuqCzYiP9PJ2SgsjHTjctD5Wl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdce8c72-f364-43a2-e5d6-08dd9d8b715e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:00:39.3104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gE1BtostKsJ2KoprS1znWDVo3JNCcaqmAGjOYkgSitCsiFPaW51l+KNqGOIMOr7z0ybA+W1uMnhB6HuK4jYQ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

Add micfil and mqs device nodes

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 3661ea48d7d2..66ce94705ba9 100644
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
+				dmas = <&edma1 6 0 (FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX)>;
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

