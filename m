Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012009.outbound.protection.outlook.com [52.101.71.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427E28851F;
	Mon, 16 Jun 2025 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097603; cv=fail; b=pP7yTv+QcjCp+9lJOJcULrEWpExeeToiLPvsgalQtrHTgUmEYecV13QbGa0jZdkjACWRHGFUTZVG9y5l6rMSklavKTeDzBP0SSZQbnZUVhYnVIRxM6nWHq8bn+GeX2euhYj/Y4MMHs/7YQ/VwBMA/jAq0c4y3x9Mo0sE8Qq72Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097603; c=relaxed/simple;
	bh=0XZj6IQMMvBuk+o3ti1epmuuoUGmsMceLkqfTiB6YNE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FkjWjYxZXZyhF6zHURP181qSA8OxgcduzwAZfPM5k01g/8gQSWQPYhtRcek58gFx8Yji5gjAnyDWE5NEckyFBqC6+IDe6Tom2Jjwfaiv0oeBVfhDpuN2bN0KyQYWGboc9p+s/iNgL8Ewa4+ErOOX3xLgZ1/b/FOANqBGm17eBXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FK834nQr; arc=fail smtp.client-ip=52.101.71.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FK834nQr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtqrDjBqe1TmLBxQUpPqk4SPrYetxothks/EgiV1jdsSTKbLkQf0+5DaVwwkv979+CR/jenucuYhO8b7xFhh4HHds2P8rlTA7szyAKyZWRZbYmUNKys8vHs1rh48a+9ImKeuFuN9sxgZv+Y1kk9f2Z/laCsGs+urEPgXmb6tNV+h6xaYvHSnBPvimn0PPo35UETOoJinmSzf8iD0V5rlsKbIJzC3J4+w4qtV89LhLwLg9+nh3XdmGuHUCTJfOpBBCzv48FMDST+R1ioZFmULStG8cmETnzS+NrgUsRsnTZ+guukqJngHJhJShwKW3kQzgeIvgYw2gz+gEd8VMrxR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrDFUB2k1yAr9RhRJshGknPs1DnLF6cfcKLPNPTQpek=;
 b=Dt+BYw4TuFDLyhcgPjBE4R/Qtul5TdrUABq6MFKhKlR3Td9K8CzjYyhDAbRPgV7DpMPdl1krHvUwdmSwMeK7tNWzZ3LUezQR0tEzWFG4N+jNjWa5W4/wkLXmCArvc90Nt5QBFjcCmGZ/HIF4wlP4NOBnV3S5a7jiygRtspucIUpHto34a+s1DCYsQ+H9pIQLq9u346zH1A8g4L3RL82eqpLTe1P1PPB/5kSc6k9ZiHPnynxd6OXxGEyJd6PrzzaYsxPmwY/NhhbQvvuXmUBhXFaaoOgXS52tijINRC1bo2d0+LnKRVz93iBHtIiJJxCJrGpS2ZmO0/yTlCV+zOEobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrDFUB2k1yAr9RhRJshGknPs1DnLF6cfcKLPNPTQpek=;
 b=FK834nQrz5DjWwZF9G1tRmUYplb+EnWSVasXcJmNNpso5/yREaCmuQIQYFsDieVRCPEFGGkOGdYRDNu9JkWOtLIRGmutJDBp3tlLqT08ovICJzKFAeHbuJAfRwmPYCA3Dhf2OTT+HlfKrgxSFpJ/4XMQi1mHGmTI0sQwc8n+NJswUtB5uaHehYBvi01mteuLnT6pIjK9UMFYRGFN1Og7M1ISF00nVZqbiMH2I9sNbSvoe1dfi9cT4jjzwQ3MIcLTs0YslQliAljt2SLUpqkaV5NrQys3+YY3WClJEGimCrFNDpVX9AeeZk+DVkzNe5gkRW/8GB1ntlC/19tuzsTW7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9691.eurprd04.prod.outlook.com (2603:10a6:20b:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 18:13:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 18:13:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [resend v2 1/1] arm64: dtsi: imx93: add edma error interrupt support
Date: Mon, 16 Jun 2025 14:12:59 -0400
Message-Id: <20250616181259.1989295-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b5d5cc-1499-4919-0961-08ddad017737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G7O5MUpRBLU3+7erl3t7bdwnGdWs/sAHhLcnFaVeIeJ19T9wfD1xINE6be2/?=
 =?us-ascii?Q?a2M4Ms6oE6geDmTDMl5rfZnNuhLd5RNm7lLkbAVQNI5t9DHLDzMGgQ0iu+d5?=
 =?us-ascii?Q?Qum2VcuqAyM/RQp2fOE8frOd4cONsiPKPOYN48vigav8dauQTe11TTtsraAT?=
 =?us-ascii?Q?TvsOp4A3KygKWLWH57S2xdDXuvQFBDJScOxBy9hTuPaxt1ONR/6q8fQNixLp?=
 =?us-ascii?Q?0vJBZ/xdTkR7F/m1XdV+SvFpn6gm2dWzqP3u82a2oTfCmZ57zczRhu0JDfjr?=
 =?us-ascii?Q?5UgKWYpKxiZApD+O4haAMzRsX6zL+mNBp1FCHMs5MAUY6e4QfyjDE262qzwq?=
 =?us-ascii?Q?jGfwnxFVy5fGHyA63N9wLAnUQJ+kExfjkfIV0rugMqclErdGTCdL/7gEtgi3?=
 =?us-ascii?Q?BkXsZDP8IBkxH1TBc7i5IOfAoY0HojBmVa1Y3qXWUzwJAlDdpnAFIc1zJwAc?=
 =?us-ascii?Q?GulegPDVbM3dAMbmPsInjqTAUUXujE/Z+DrJO+5MkTV7crxZw7ol3UMEngPU?=
 =?us-ascii?Q?Xf1IQD9gQMHY1XbT/TyyCtJNdvZeCOOAJldF+OVqi1lwmBkzBHmB3uMy+CXa?=
 =?us-ascii?Q?L7zD3jd6f7kIYOzeN/KAKqqkzEP3gdR+oeouVV5yIhQ4+vUuYyCrhoi8qd6G?=
 =?us-ascii?Q?3vTidOZ96enrRx4IRLUaJC6cKUhrx57FCkz4kF8UFSnAvCacNHUJAaeGa5NL?=
 =?us-ascii?Q?g99C39BJ3tyCMoAP49Wv/f0Nm8GdA8zzJIO/QyRpMLpZmrNuRj9jGU0Bvy+8?=
 =?us-ascii?Q?h1BRzW2a7+afy2v5EtGqCHgZOzbbarzgU/rEfXg5UTpiYEzIlgtZIg5cBiJ9?=
 =?us-ascii?Q?NA1XbFZLfBIV6SfK6EacVibsHQbNgx0OWtibTjmanPGAXduxR8s3rf7/u3d4?=
 =?us-ascii?Q?sahd9lL+RB3OES0shtXcWedhvdCMALfNrZOlOq4RxqEZxOyqYQhoZSNtjxyF?=
 =?us-ascii?Q?wiIXncQ1iTxoo58QUcex4629buzQBmC3xhlbtqDB//h2a3z0xL7xJssj0ngA?=
 =?us-ascii?Q?g06mqL2HYR2IdeHro1Dp1/TAVkKxdtZAvG3o8vENfi66wa9oaFyoyOwVYwst?=
 =?us-ascii?Q?G19eDHx4WRnRnv8+V9JRlLiHZ+WFMFlxAFU78AUtqfAZ/VQAocPcqE4vzSa7?=
 =?us-ascii?Q?OoRs5NV8mBb1I+p+4Ka67f5CT1RRdsk5Q86/+XJaf1iu9psmK934Gb8493Lo?=
 =?us-ascii?Q?6dtEwU9xcpjDWNr7MUcetWy2vFIF07uhpsT0sYkdDbPqNFRSinpzdsoBnQ2C?=
 =?us-ascii?Q?ZQ030EfSRza8jq3i8R4KWBFLME4T6lU8qhOmaCJSXafwz07AxZ58k/w2U/BH?=
 =?us-ascii?Q?yjUfa2pWqlBRtaXY1y86UvHK15b+8D6+We300a7oFo/XPmdfC78bnZeNTfkU?=
 =?us-ascii?Q?g8b39IttE+GMtsYdrf1603J8hO99GWmTkFRZWFYeA9/B9dEjvVipktfWkHhQ?=
 =?us-ascii?Q?V8ZmGhubqD63hrnU1v2GebyZVJZw7H6eW0eifIQ58No8bnRzfqFcmnoW/ldK?=
 =?us-ascii?Q?92cd6MucVy15tCGWW0OJ3z9LNe4m/2utmO/i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ONqsDLM/HnogFrsy7XYfZsgHES9RgX8ahBxuQYuvggnwt+9/0WiM5br/HzS?=
 =?us-ascii?Q?mkiyfLGKevlT+52E7zCQlw6yb4kumvwNjqnroCP7UFg9iBzYngmNvOjnjrJr?=
 =?us-ascii?Q?vLZKnV1zLgEaKnM1op/RU3TjVNNZOw+9KDQkfefFCKD2skTPZqFWQD2SIwH/?=
 =?us-ascii?Q?AB/4QlhN8RQi89aGuk68IsoS9jV8sOZIFViWBGFJkkVdQOzPfXm4fylbiGwq?=
 =?us-ascii?Q?q+SLUTDMvUr5hB5wmKcWDkcL83XfBMrB2cDAYLh9+WuVLUccmVgrSQZHatl8?=
 =?us-ascii?Q?uGVxuGWfW/ksZLwnXDl4i9Al8jjtLzIK2pvZj+ero1lKsZ4kWFczu4cbVqdA?=
 =?us-ascii?Q?geCGPJXmw5pBg5MOpd316K/30j4xU+X+yHWyi3K6OQvwun1BS1PXJO2A4NcM?=
 =?us-ascii?Q?iT7UWqeZVdqMbDzC49+Z1nqGx9oAFVs8lVnjzofvrL0JcQpy8PH0FCcgzBua?=
 =?us-ascii?Q?ZiGQFSjn5N4f+I2v6dW/eg6bpbCBjau7PM3TwU2g/9Kokrp3EevFzYLQEwBU?=
 =?us-ascii?Q?vwPxlPrnxDavAy26bK90SHPIRBqS3dXcaj+SBfuCFatfw8+Y4igEzeYctiG0?=
 =?us-ascii?Q?NVtg88kY4lm3GL0prCx0/kVkzd+3ym9zdogLb0a5VW3fhSUFXAY+YmFstQdv?=
 =?us-ascii?Q?jfFVCu8a5MsjKXMbaxmAourgJSRorEMfOi3Oo0zOLhfAzyWJgnc+fhFDUe56?=
 =?us-ascii?Q?E05CEQrBzjTkDYK7RDK/94F2Ps07dRvjmrcFXMWjT94K4wIPvKzt6k6lyfJX?=
 =?us-ascii?Q?3Smvls//DrSL9qa6m1d/aIm8F9yuVLrao0jJKnUl7Ck+epNIvjnSiUikYgLT?=
 =?us-ascii?Q?NPapr+AH21YCadqAr6FdGQQAgZ7AXZAdFbBYAmg0bCYib5ruuTAkbyoBwe8G?=
 =?us-ascii?Q?8NoUcoxcEOhddIjn/zEYSA6kqxvZ4ERMjHlHYQF3eZQ1FILutVop6zi8+OQR?=
 =?us-ascii?Q?7uzw6W8uJYIrV1MehNyuT3xJcbgsIw+n0yOpjwVx2BiqBeen/eSmLXwwuu6Z?=
 =?us-ascii?Q?bT5Ew9ep9SrMFdh4GvUiQpKuEJM1fR+nT5gvKvCaqMqiCLV6zP4In8WJATNZ?=
 =?us-ascii?Q?JVDOjfMtjz3k+O0efe4lm8hsZCXJt0WNpxG35ApOKTroWc/1hmaGKWwB/f23?=
 =?us-ascii?Q?CnjMpYjlG9I0+3C3hqKGRuceRGMmFBzsD7GDSUWVC72/EdztZb3uF+ajBTPd?=
 =?us-ascii?Q?eya5t9tDY0IT1TPn87uqDFy35HUWg0bfy4PaOmv6+cuC0Ows9SlhVQcacrT8?=
 =?us-ascii?Q?FQUU45guFYrC0fI36DQsIlOq9d+/evPYKRkF8q5IXfXNbbt1rMceylz+0SHr?=
 =?us-ascii?Q?BcFqdtJuw7etu1Qy/ZTnFGXXvtj0BSi5mk9xpffairz0b0wsvJn6yz3IDZCA?=
 =?us-ascii?Q?ubr0ZjjA+d7PD7eSgouEdtHUYIi8anLn/JN5JpqlYOZGJWKFXqweAmmFdRfU?=
 =?us-ascii?Q?6FY9bO8MUKEpriE/bYkKsRlf+ek02QgbeoxRcng5bjnqlmm+7fNfvnhUpqcM?=
 =?us-ascii?Q?8Dir7gJorxvVvQBMIX4rluIhFIXhB1p9PqWMSBYJ4G5NvAgHDbcHZLN+zbqj?=
 =?us-ascii?Q?2qY8XjPzrctWjSfwLXnWrq3Y7Jhhy4YKODF3ygfk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b5d5cc-1499-4919-0961-08ddad017737
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:13:16.5926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUwkk2Z2c2jfj74om1jYYWi+uoDwkpPDOHs/1WGsSvQ1DSuo5Uqaf1uTW2r0M1/8ZJ4NFBxEKWNaaOnHq5EFSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9691

From: Joy Zou <joy.zou@nxp.com>

Add edma error irq for imx93.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
previous thread:
https://lore.kernel.org/imx/20250407-edma_err-v2-0-9d7e5b77fcc4@nxp.com/
- binding doc already in v6.16-rc1
- no change at v2
- add Alberto review tags
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d3..9f6ac3c8f9455 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -297,7 +297,8 @@ edma1: dma-controller@44000000 {
 					     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>, // 27: TMP2 CH1/CH3
 					     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, // 28: TMP2 Overflow
 					     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>, // 29: PDM
-					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>; // 30: ADC1
+					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, // 30: ADC1
+					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;  // err
 				clocks = <&clk IMX93_CLK_EDMA1_GATE>;
 				clock-names = "dma";
 			};
@@ -667,7 +668,8 @@ edma2: dma-controller@42000000 {
 					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX93_CLK_EDMA2_GATE>;
 				clock-names = "dma";
 			};
-- 
2.34.1

