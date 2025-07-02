Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AD91F4621;
	Wed,  2 Jul 2025 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751437722; cv=fail; b=ZwvhSIyvCqzoj3093JDN5e0bfWB4T2oQXbXyri+sZEfmRQ1YF1dO88pJCU70vwqzvmppstK6KXRHsS8YsgYP2V3+LdFM9SeX3b2vItk8M+cmcuJvd+yvMUkuC4CM5SUf8bB8+bjlQsVy7WEustuTOZe7kwEkRQZqa0+uU5uNQvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751437722; c=relaxed/simple;
	bh=9fjh3WE89ARNZ75nNfozqt3EgiWVfsVMVlyMSON+tmw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DREmc+c9BmYrkl6pw+dE5gOYExUa4xiO2R/u2LyU5Zs6NAo82V8rKWAxYi91WQ3Bjfw9hawWWIqBglELnKbemKnZkcEKGEhktWMWa/QeS59PJjwZYxZpXn9LjRvbmJEPf3bVOSebTCOV/cFIUtvxi7tWLwavKMF3rpobauJg7VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PnWU7U68; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PnWU7U68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daf9g/Ibd69quo5mjpvjusByoszCUwbyM6dmyHBZ1JXIclpOz3oyezeljiBoBq0Out8axy1wF6O2Csmi7sDImChysJ7lb2IBHbdkcgBx1H8RhFn+h4Z2lJYsgYddpUoVMIu1VQczp5OgvVo4w/ozGHFnZk3AzOOeri+mqw6s89xaqukdSNJ60FjGzqjH+OBwTjZiafXqZQ13c3XeYpbyaakQPOeLBf97IrTySi15ogsJ7NZl4kZa6TddREYkoJlMTAFZ2WJ9A9rAFAscdOvurXgAicEFA591+1r2xt2VOsEm8i9F3GqXxTRVeru6b9lRaqdb7zK60VXGyY15UKEqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q29n4IaIpqkiIaaQ/hVgvU8MP5hjA+pg8mE/5RximZI=;
 b=LL6K8YX5mOp/2DPieg5dJADap1Nyf7r0ZuXTrB9RCm2Xw17BmGlN32gRROyfTu2mVucQxW+c1VaQvU6pZhm7VgHH02Ec//5pLRz7vjJYc3OTnjJ/gcj23Tk60G5BRURNdaH+2blAedwcRYRSA+aIsEiUe7NbzpetnlvyPsO1DH4tv0sqLahiZf/z9cv7Xda11bpGJGtNAOHq8CKZ4+F+LCmMD0cuQTD+IvrwmMfDdIoilNgyOA7jYd6az9oB3aXDxMr3eEAuxMyp60FWNOq67e741Z9t9yryyelTF6RJVkwxjJqs6R23ZebmabGAtC/STsdP90kNr0VJrl1j+z7/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q29n4IaIpqkiIaaQ/hVgvU8MP5hjA+pg8mE/5RximZI=;
 b=PnWU7U68cG/M9tFc1vEv53q/cozQpriBhGieMqK9T/nZXGUGYFcFL1j5lsuJ8+14e6uZ5WUx2rjhxjA+aFSGHDmjuzDEhlFDkAOzfhB7hy5RyEXBC+KkN354cEdlc8TYMZloE2tX5jUYZ4/43/f5K0m9gXBMef+fPZncRnp8UdIOvdtpPiVDZd6A9GfegBXnx+xPMV8hEd8hJGBNhwu8j78IjWOP0lZmRjgj6sUkPINTTNaEgEPBLCJl4lIuYOF0a9JlPTfmHfayD4OeGTL5UqWEECmCvW31iHEuYD1cOuj2GzM/TfPXN+XLMiDpxigHL1tScuFYh6MzGJ7j01vzuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 06:28:35 +0000
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37]) by DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37%3]) with mapi id 15.20.8880.024; Wed, 2 Jul 2025
 06:28:29 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	haibo.chen@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH V2] arm64: dts: imx94: add missing clock related properties to flexcan1
Date: Wed,  2 Jul 2025 14:27:24 +0800
Message-Id: <20250702062724.2459200-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To DB9PR04MB8429.eurprd04.prod.outlook.com
 (2603:10a6:10:242::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8429:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 4305e8d4-a3cc-4d98-f514-08ddb931a864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MAlz0qZFnGNRCFcm68mNREdn3zGHQJYpYuyiRN2YdgPRzfeS+OloIPNrVdHH?=
 =?us-ascii?Q?B5vrbA10XsSaFjlzXdntCH+w/K8gSJS4cn62RoecppOStrBGQW9Igm0xUEQV?=
 =?us-ascii?Q?T4Ej1JHM+Oz/yTSbf04bRNyz7DRvt5AZJui4+peLqh31uORofYF0KUMNtowx?=
 =?us-ascii?Q?9XlmZhl8ahrG/lyerBh4CxOcvGWaMcq0XUB+bowEuBbmPm4SdwWjYmlMYDV9?=
 =?us-ascii?Q?CKK6AD9j/2CrKPnaTOoD3vqAUVPxMS4Uy3HXNaath8THVJSo8G/xH76ilWX7?=
 =?us-ascii?Q?TL8RswrarIK9pvyIahzI6u4lDi4l6mKVjke/pxj/I7LrV94guhZGPwHj6CPz?=
 =?us-ascii?Q?sJSF0Srle6R8ZEkLZrYe5bT7WFoqYt9FLdsMNQRJwOSHW6UIUCvshiUjQUjH?=
 =?us-ascii?Q?F64Sd/i2fJFDW9/XciHwJVF0divZbXoVBOm1KPWfjrBCORAhaY7bFDF2cSdI?=
 =?us-ascii?Q?WI3PS4a2MM3KyxWo+mFWbihXk0qmDNukHl8GemnoADtAJLE0/i/ThFVFqsoY?=
 =?us-ascii?Q?IP8a37OIlM/V/SZVs5Iz+uPI3EQogT+ySMfbbGYiezhu1D3fxsexitneoBim?=
 =?us-ascii?Q?bmz85i/2wSW20cwGVcxoIJ6ulEEsDOphvbcbdBqZz9McBrHNveeqIPItOLqt?=
 =?us-ascii?Q?x1Ir9eSEAFPe/doHdmUrpcYTWq72Qb4iuqiMB8m0SjlfGre+DBQHJuc82Nxv?=
 =?us-ascii?Q?4NIRZ9AdKcgv6WStPx5+Ld0LCJoMiyV4yZyvWEaBQVlbvDa6FbQ4w6MM0pkc?=
 =?us-ascii?Q?pg4CFpcPqg2pAotA7VGhDm9Y/QiiI+3eoHZA5+25SVcyYZYqgExh7yluhJS3?=
 =?us-ascii?Q?B69oXdIREOdnGvHewbPJPIdpgrIaNzxXF5vrnJB2z+BBopjViuQUraKTIWWy?=
 =?us-ascii?Q?QtvutEDtmIPJap1pzDTr0kbY5m1MB6AdZ06V7x72hP3H7WhlVI9na1NIpotP?=
 =?us-ascii?Q?MlKa7HRcmQGIldPrNFDs9lLYrv5yX3UcO+eiO1mH2qWUPyL2vWHG6HOXsq1U?=
 =?us-ascii?Q?PiAO59Bnq9iWJfi0EnoDRYM54Fr8pbcU5lO3fO5vLNxzWaOQPGM6ztU8CX/t?=
 =?us-ascii?Q?duFGvYKs7P9z1LkwhmYXJlvZVeKG2KOVb9hq/HpgtEyjUmEzED3IwXxM5PRk?=
 =?us-ascii?Q?cnfwzBTfpp7K1aGLyBGkWixw+NcCTlDBfoOeSaRiiNG0g1yX9iGgwPziZ+Up?=
 =?us-ascii?Q?Ed5S7+F9uPNbXb68a0BdQJKMQUEaauCMLNAvUUaLvmn4rnt7EVGyMj1wcLXw?=
 =?us-ascii?Q?4hyGW5V1CBi214umHiNZPDyfAN4mhcHd4tfFFSixM8w4jQWqxvY/1fHKmkpv?=
 =?us-ascii?Q?FawC69f4vMceU4pUaiIFjZj5fLqz/dYZkxUpidSLaLKM1wS7kP/ykFyIQFvn?=
 =?us-ascii?Q?XlAAKw1BvhpFriiPU6It0EIrr0ZvcbYYxGDNkna/7ckyP9icivlHtmMQVfUW?=
 =?us-ascii?Q?XreoTp6Rfma79UUUZF20xSZzgDpNiqHltfjmQnenYIs5PltXTFwkeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wObCb1B8XfUm0gx5mHC4AeVRpWIvhxksPeYsj49pPNhgwxqCDeBC9COEEhQc?=
 =?us-ascii?Q?LuKvZlOcbiwFq0Jms1JngXzdJPm5M8uhqUu4Q847Q2HIk2aPqPaNSm4Gu0UI?=
 =?us-ascii?Q?ThQGfDHwXL4vUbyf68ke1zSLG8VJ7eZnyXjLsmBy9l3E+dtjN0DUED8p1bXT?=
 =?us-ascii?Q?0haHl+2F09/bsYBS98+5Co+C+o+/07/ZdHihsDKGTMmvQ3ii4Mr5zXBQ8ulG?=
 =?us-ascii?Q?QtZaMaTAsyrIt/nXx2rfapjWJXq+UkesNysyuZEt00P2MFidkVoy2WGkUWbr?=
 =?us-ascii?Q?9BJ8VGOXpaSgDoOQWtEiYRgB3rB2rzU+6vovOzt+J8M44HtvDDhCrE1hn/GA?=
 =?us-ascii?Q?cSiQ1I5fjKcVrI1yNg4juCC69ZS+Hgnlzd2esQFG0fSdKd/NRbmoUhMNFS3j?=
 =?us-ascii?Q?Ji3ukhX9yUcWIEkLb2n9kLYtToGoaIE8bD3NteTvKGUpofRh6yIWhPw+yXK0?=
 =?us-ascii?Q?9SGOYkPmw2f3EfoQvLXJDsLPsL6oOGTbNzGVTXRmdoMGv56vadEvh+hVICvZ?=
 =?us-ascii?Q?P3rJ4lGO4wbVz5cmCUQeYHIFNlc6mXBsrIZb7xVrMoTzvKlEVTAm0grXdAR2?=
 =?us-ascii?Q?15UFpMhiDuG4gN1wFePEnn5uWjZDI3cZVEDqZBLRi5biBkfgf7qqJAyCr3BT?=
 =?us-ascii?Q?xcPscknxMnqVBw+7/wzeqOnJTfKaZA0vw+H5/92NWbQVTasZCogJLDRBOh/i?=
 =?us-ascii?Q?H8LixnSypQ/n7bOXv01ni6C4E7R43yGGi51eGuXxLC/6X+DT1sajKNmpthvk?=
 =?us-ascii?Q?NYt84ft6a6R9k62sju46uqsa+NZyccp3P2e/W/AHA9F9BKtUrA30vQ0OFdhG?=
 =?us-ascii?Q?ukv2J8FTbQdPSU6m/j5tfbilIX65J7mSU56jpSF7aV/6+/i2rWkxgshrhArk?=
 =?us-ascii?Q?ef0mHm6QhH9JWobJ5BYoaZv04II1sw7wc+V7Xvgcs8lak0OKcaeYcgo57CHe?=
 =?us-ascii?Q?DJA/ceaFRJrTB8DTWOsZ2fwl3mqokYBuOLwnX39st3QoxqrFM94otb+hz18/?=
 =?us-ascii?Q?1Y85NQeRiP8++NvJZ6+NAa3qi6uZQmctCebAMxA3j9Y1WwFEyR9eQnEF9H69?=
 =?us-ascii?Q?JKFqBLFzxS91Bz++BlsHkoOwuysEoMV//hyuho1NgxRBeTQXftOwpA7rT6MN?=
 =?us-ascii?Q?7kLLsW7YNx1BEEtZZcD5ltWDmPY0kLVBb/ITqtmhl0tQXHRMpCigG83JpeNs?=
 =?us-ascii?Q?1DrerADTl4bRX2FQczHmt4k8JW7Q/N0ekXI4Oa6y3RAlefIf43NpS379fYHM?=
 =?us-ascii?Q?s6TLFfPftLno+wbBYxyKBnl36+V5YBpS0EEgg0FiuQqOJLOxFgjlSZ+FoMEd?=
 =?us-ascii?Q?9ErwvuS0KDatrQc47xxhNinqFk6H+X1W3/UdRUHhVjfkXTxTKDUzTD5h1cw6?=
 =?us-ascii?Q?IGBUAGQ+lEXk1Dajswyk/uTnZryuXfQCdBuxzv5R/yxcMYxHu+gqjWsqbBVH?=
 =?us-ascii?Q?Iz0zP3jh2+bQd21Fi1Q9CgSMs0zqFRnYK1ry6ciydxmDGVbMNQmu3OtJA1ha?=
 =?us-ascii?Q?0JoTVQ5N8ISfpJ40xjI6MsedJDY6K8YdHSyyHIBF7+UQ4ILDuuw1UYezaH3n?=
 =?us-ascii?Q?62v77cYmd15QkrwagXP0Ti7o9N2xjFy3iuR08pSQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4305e8d4-a3cc-4d98-f514-08ddb931a864
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 06:28:28.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiTZlRe0E/VbZmqCtzHQMXjCzSEDx71BShFeDlFIya7gXdt5eZoVOjUWPXHklAxX78MeTxMBcYQXSjQFg/y6kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105

Add missing clocks and clock-names properties for flexcan1 in
imx94.dtsi to align with other FlexCAN instances.

Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
changes in V2:
1. Improve the commit message as Frank suggested.
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index b47e5db209f4..44dee2cbd42d 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1045,6 +1045,13 @@ flexcan1: can@443a0000 {
 				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
 				reg = <0x443a0000 0x10000>;
 				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
+					 <&scmi_clk IMX94_CLK_CAN1>;
+				clock-names = "ipg", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_CAN1>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+				assigned-clock-rates = <80000000>;
+				fsl,clk-source = /bits/ 8 <0>;
 				status = "disabled";
 			};
 
-- 
2.34.1

