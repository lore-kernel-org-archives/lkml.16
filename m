Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692625A2A0;
	Mon, 21 Apr 2025 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215493; cv=fail; b=dxGJNUUhah47jqVGNBM+6csIHn0ex5WeDO89VbC/5wcktdS4OElgauwp6vXJDY4F+umbBGoDFVK6xKq8Qm42zzJ4V7qLRpFKBgFWWPoID17xOs7FE1xQUejqDY/Iu5RTcZfcDKBVKrVEQpJfDjEVKudZ+JSHVNDbS8mqYnL1ajs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215493; c=relaxed/simple;
	bh=z5rcTDfUnVdT1yGMGByN6HGG0SiqSMUOgDkAtcrhfhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WzY/7lCUX61mJWr5G4HGkYjLxD90VT9FMiLmO/4zYYf2EAkwC3kXAwOZ+VViZe4ALyJdItcl6IEMkXVEmsuFQyfvfHnAi2H9yE6ok8z8O9g3j4nvmuHMfiTl5SgbLBSd5xQ2+qtHutMNGEGFnTC8JqKs4NmgEdx5wMG2d4QI2G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WgdKI2oU; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WgdKI2oU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlcYhLaEuKfy97y0qqY1XQ9Q2QdO2HVrqCBfN546Egb+6RarcBLunHBJtL4+KnyPggN10IB3cGh126mdQHPr2oGM3HpSi9YwuLJYA+uyhm3iN9QLA6b4utcc2SjNXqQpCTSN0Lky9vC7SqqmmogWkNmfvEokFbdimUvS/Aeu3h1l4NRB8mzryoFKryOF3cqYXeBtua+U7D9Cm+02hkzRGfJQqCfFQjHxl9L6cuyJq99jMNlg9UluGnvkghByC7Gsi0M0DHlkA97mzC7pQU68XlE9O6rCzkrOfQEK2cuXX2O0HPw/k8uIRt5f6np2XD+QG6sN4ECRJphG5/VtQ4E+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vrh2lodKE538QJM+IdJGJWRRN0ed3q4enRNvdoAAN8=;
 b=UwqKMDikj6EGT7YPktZEMWkhdteYIp+oqYjEtZSi8Hzdv23hg9zZBOcB6cUo+JlPvDlSurK8OwdFETr/POrQ8ycQxKYCYKf1BZ6xS2DYzsXQRI54iSJE8hm0yxIRAkFuipR54GUZ7Lrz2MMKYS8+hx2/LPvj5a5d9ZFc0gdBinqkPsfiKdM92/y1FDrEBid8L1DcWIxrbKE8xfYJEGQIdYBT2Jaj4Umyn190FNtfwcZ9BuJDJhtNu23CAEoekevnZIEJErYbduSwGRzS8pnNU5XVccKlnNIds5aidnxgZAFzA3nELdgeF1ycLUNqUryBg14nlOs7x7i7Xag1wadHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Vrh2lodKE538QJM+IdJGJWRRN0ed3q4enRNvdoAAN8=;
 b=WgdKI2oULSygjj8plgq5mZw8UfiFDX4HjsRfhNcEeF7eqh1TPzBhq1RbeZ7qKVnQWPXhQtU6P4Mf5j4mg/h/t5o3IUXDdms9xqTAjcuaI/s0eedEum2V+vgqgXuqRkqBGPc9zUV1zIQNDkqxZjlShbblBROSH3qomly+KlHmDIoHxESmmU1hKQqZXDp+FpOdspesS7tYUt3U9MPSvXVdIVwXM6C5WkjVFn72ewMXNkehtyUPitcPza1IeBJFjlNRUL+W19PHHDPf75T+lgasdh8XmOhNJUIZj3XMAzVYwasZWYCZrvwFVhwuRxa+SHaI8Vk83kHtO2tOFm1cfNqW8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7646.eurprd04.prod.outlook.com
 (2603:10a6:102:f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:04:49 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 06:04:49 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: imx95: correct i3c node in imx95
Date: Mon, 21 Apr 2025 14:15:44 +0800
Message-Id: <20250421061544.2471379-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061544.2471379-1-carlos.song@nxp.com>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To VI2PR04MB11147.eurprd04.prod.outlook.com (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0eb4a9-b218-49c5-2bcc-08dd809a6c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Df3r8SEt0rgwuLEOd7YgbdxQspk1FmFJSIuC2LyNj32TI6foAueIJUh5xJC9?=
 =?us-ascii?Q?6EzuymTAGdLAud2jkOXHnKIKGIhJc+RfzSRNKjrtMauOKY4DirS3UdfZp4gq?=
 =?us-ascii?Q?36DzYHxPXEDdQbd8fF4FSj5YXMh19kQzFpCelyUra7hd5H3I6dHtAC0+5BzR?=
 =?us-ascii?Q?IgBl2OcoqY3x6eN0OQKuEXADfbfok9GDDXWGBK8Xsx6oRHoqRuyydfty9kNV?=
 =?us-ascii?Q?7wdYUUht2bpLucM2r1kwAxNDkBHLeF60pazY7/YkIsy9xYeoqfEowU4hiIVn?=
 =?us-ascii?Q?rZnoAzUa2hFLI2Nrw5vADNLumne7roUgRgFjPnN/SgWSDWgLhvgixRAIDuK8?=
 =?us-ascii?Q?b79B19uCF5T19jOOXDFOCGKnaCjmbvLgvf544lnX7Y9Mv5I5AJy+mRc89Znz?=
 =?us-ascii?Q?YQC1i/ibB9taLaFwXXpqBbfKa/ggB599UKIxNwPZGEu3quLlsp39M76S6Q7z?=
 =?us-ascii?Q?nyOc9E86/NZkWzgizSDEIKs3HYF9vB9XhMiHZGmnsezQgC8JZnYIw8ekmrTy?=
 =?us-ascii?Q?PdmxW5VqQ8KD4e4WrCVcYD5K7eYt6w0WWT5z6uca3dSmUrJYadhp9IW1B0T+?=
 =?us-ascii?Q?xheK3gDRMqVf40UC/WlOVD4EqNgJcdyJNF/gG5miFF+/rmmCya+Ktks9m94f?=
 =?us-ascii?Q?hv2boipHjKJBKoWE73y0oHQEoXIb5gpDbdJhKCVpSRzgLNq9xFK72F3KBk7k?=
 =?us-ascii?Q?JM0xSSalVlyNb7QZz7TLdcxHVlGDt6N12EcoYyx6yd8k6kYtUEfmEmuf8mXA?=
 =?us-ascii?Q?pPKaAJo3R/GigBm0IyYQmPKpDjKFDkwuOP558yFIodpSaYrWW/vaSe864aXo?=
 =?us-ascii?Q?iNqkG0kJYhRY3RYyXwvpTXPtf0CfWWuwSGlVI52/2wnw1QNG98VauB0lZK51?=
 =?us-ascii?Q?ir1mMIc5IBj1R5yg5v0VOMDUPweX91OzTLnBgsUASV+eM0iMJ96LOeU6YKOE?=
 =?us-ascii?Q?AsrFnu8QJK/EufzXubzU+NFB3BD0eteYpzPixxk8/Xq3xTRf1CJmt3trZNAd?=
 =?us-ascii?Q?SDsXpxShTcbDk8/DUr71emDMgvXwOcWTeBfsup4xNDN3WHO2PVJIUn0xI9MW?=
 =?us-ascii?Q?jjOZoni7M6nRk5opGPgUU/fdc6DEoVLI9o7FMgkNWI5s7RZzAAp2szYbwFqX?=
 =?us-ascii?Q?M60fKt1qJUSfKzJQYh9lXbDFUQN01iybG9V+bhNYmy5IJsO4Vr8deU74wuhb?=
 =?us-ascii?Q?EqB7CrB0KiQbZPa+O5XSWI8N1aIDOJ/IMtqlHlam3jOeP41EagwhbsQ/eE/i?=
 =?us-ascii?Q?dsBxIl34Qn10uP5gS8gZ4vwD0KD0mtm7k9Fh7rzTEGOMiE/r4a6d32VYcHK5?=
 =?us-ascii?Q?1013XF+VYE6rUq+F8LDXOd9nWxm6diSqueH2SfFUc4ue/fVuZe99kIQyE64b?=
 =?us-ascii?Q?OUroMP35STkGylSB7dpXh6LrjOiKJLQVskPBHPGI3E+bYCNv/P7WkTlCOIIe?=
 =?us-ascii?Q?muEN/pmzTrrlVBT0gwv7jiyeve8DLbUxldNZLDEUF837PzYlfGONY6iVYQHb?=
 =?us-ascii?Q?yFqGFTNT34jeMC4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3zMJ0INOzFJ9X8LA9Oxhu360ujt3N76PwqgTH1M9k0oQQNCfYRnLiKuaxyky?=
 =?us-ascii?Q?ML0aSJ7NzyRN/XF/RZH8yxMA2VHNTRJQlCbdPcgiC4zRM7j/cGaTg4Kyt5Su?=
 =?us-ascii?Q?0nWum06otUyi+6km2aAm5AVVo58XO9zYZ0+HoEAtPyG731NX3gdyKtfPH07X?=
 =?us-ascii?Q?ZdoxiQHiGsFq5Sao7mUTawDv94483/xO5zs7EVSAhJAW54PyR+3/JAHu3gdX?=
 =?us-ascii?Q?HG7j4q4k+xp9MVezyMrUORTiVy1hDrzEtCHkinFJ4afRv3PYOEpSdg62TYVy?=
 =?us-ascii?Q?U3E2Zc2OMHWPpKJkS4n5WH7Rq1RJLAeLp67rvlp2uIFTLL/QGiB8ncSj2bBr?=
 =?us-ascii?Q?ouH3oCxDonYkfPJORjkl0nNyWtpQdOyAu2fyM1bVFMTRnQ7a7noL40MvskVF?=
 =?us-ascii?Q?xe5LhP+DawrXHh1eQjTDblm5QZi3CwK9pJRildeKYBB1yebXT5lrNShitE8A?=
 =?us-ascii?Q?Xbpu/yreYz3H/ii8tyyfLy+YtGxY34FKGTKu8abAqtIrT5YYyo88/BYUPGY6?=
 =?us-ascii?Q?JR8j8a3RjL3/IFHPzudEiHLrbUjPyPh0gV+wNynb5gpmzHbF5yo+GNtLx6dq?=
 =?us-ascii?Q?+f/jmA0wao67RKv9e46K4kYF7Hra2oD3anECabay6ShVS8xH8nw+mrlYaTKt?=
 =?us-ascii?Q?vQpzPwvEIhIGlGOCyPMm9u6HFfMOKZlHjmB1bZO+F7gwxIUYlkgZlkiJVeda?=
 =?us-ascii?Q?fXnbqwAFnucaOITM/bvCglqHKgvG2tOlJ3r2LMPPmY166GI4R6n1LZQV816w?=
 =?us-ascii?Q?rTeF3hkWHytZpRr9BeZp+ctFnAZOo9aeJt5jl6HiQITQlmoHCIdhUwC8OO7s?=
 =?us-ascii?Q?usak5HAdjCjD+128AOEp6Fyv4QG8gfBZzmnoDigRBiSxbjPJATk4SCq6oyrF?=
 =?us-ascii?Q?1nrTQ9x5farhob5OIYhCHA/nzDGtL6xeKUlspmBMRm/2ONqE4hiuRxe4V0Fs?=
 =?us-ascii?Q?qeTiL3S083GQPW+8A8EgEDqRwIgcKF4F6LiytTAQ30bcz1Dp3COthBV9x4ge?=
 =?us-ascii?Q?9HQoRnulf91kvDva9pHVDwBggg1xvKbyTKXqXxNKZWEEWUwBQDkZOq+2LmcT?=
 =?us-ascii?Q?oHu17I6uX/UzxS0XohJk+ms827Mo+rhtJf1HWnZaO2H8SQCSAynqMCtxw2ru?=
 =?us-ascii?Q?3DRYfswT+6GTtzZVsqO7MGt1Y1KvpWvGVaeeyud5yOQ6jL7u/yx5NWIykrat?=
 =?us-ascii?Q?CsuNzRG7vOSFN33R/WVd7isCRoMJE1FX58nii43hlgy25VidD2/AYiNQn5jx?=
 =?us-ascii?Q?VGq4OSVxlJTOxI9WeF/RSU5493qZsaXF++R2n/cnnDkUP5I5wKKK/NHZXnxU?=
 =?us-ascii?Q?AhRUw91Oc00cP3O9M4HNEiq0Xl4c3z59d0q+7ujmU3OkmbGlvPUKWQHmtZZJ?=
 =?us-ascii?Q?aqB3sMZs9Ki4gtQ9Mru+HS8LJSnvkJ2w0r8zsPnClmb7RX1y0LLde9ITDU1/?=
 =?us-ascii?Q?VngNj5NzhBp4rA9ftsRKAS0VtSsSJZkRDe+FdPAOlnfe1EdyyfVRh3uY0uhQ?=
 =?us-ascii?Q?1Bv1eUcG6eElCa0UsfwDzc7gmwgc0v8wb7N1fdMQJ3Y0ty6PIX0A7WCpVmMo?=
 =?us-ascii?Q?brg6qIR871+Hwgj31uIGbC48QAjYKF7CenU2WiDs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0eb4a9-b218-49c5-2bcc-08dd809a6c68
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:04:49.1365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMktD+zSH2AqXhM0QGbJM1uauXy+0agPnFGLtXcvxNoANH7VdMt/XB//V58TbRBvQoSGXJs0ARhKKzbmKmBQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

From: Carlos Song <carlos.song@nxp.com>

I.MX95 I3C only need two clocks. Add "nxp,imx95-i3c" compatible string for
all I3Cs. And correct I3C2 pclk in wakeup domain to IMX95_CLK_BUSWAKEUP.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 9bb26b466a06..fe28c0c46eb6 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -681,15 +681,14 @@ tpm6: pwm@42510000 {
 			};
 
 			i3c2: i3c@42520000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x42520000 0x10000>;
 				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
-				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C2>,
+				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
 					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
@@ -1266,15 +1265,14 @@ tpm2: pwm@44320000 {
 			};
 
 			i3c1: i3c@44330000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x44330000 0x10000>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C1>,
 					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
-- 
2.34.1

