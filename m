Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB126A1C4;
	Tue,  1 Jul 2025 21:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405139; cv=fail; b=LMMIVbvoILAH0dK0zuTT3ecT9XOSdgI1wN4GrFFW9TkWK0nH7YKB052mLT1ndAin1YqfMlx7uZVmG3Am4JXCgFlVb5G2aWAySkM6HI0xnaAeC4LOlTCdrnCaTTCJhjR9KtGZLcDMexXNxbcfLTMP9XuGE7VBLdRYiyqlDamPA2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405139; c=relaxed/simple;
	bh=/w9cS9G3HaT0Hd41TCLkfaThalGKugHnJJO/UEbO/cg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=C26KZQZU1YaccGLLbaUd72qlSUhcvVRNSRpeKRfesUwu3d6kheWgZNLJ3Ic/kNT8nVFKU5gLF20E2J1VqXPQYhxS5LJNp1arCpNj+xFEBp15Ed2B2NK56l93vaZFHSTSaBQvkBkr1Zbf42gbhgSOApw7hOPdlguH0GUcPGnnpeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q+lXMZUv; arc=fail smtp.client-ip=52.101.84.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q+lXMZUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6PwMLBTSHoPguCfdTCQLUzod843ZYPVvDvzfsKkga1s0Lk4B5b5TzK64LM3gcf15tUmM7OgvVlJmoZyCOyqK0wV5iPjyMdzB4Czv0QQ1SfF7NuQzHX6HkFReQiaFW6xEp9kUs/IiEmJFe3rAie2hvRBTDSaRpgInec0/sJxgy/A3paJneFWi75InzQAG4QDuIxj4+IMXIMsJ3vMs42WNoxLAjK4BBLOQCIvkN+CYZQPgtnWO1eouREAL0MoSjYWHf2u/Ab6njHTdvaLVOIw0KRE6S0vnROX2+Nlm3Z86OgjRPg2ENK4Gxbk925DzUtGscblVCmQ/FIajog0sbEVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBNSCyDdxP89LVPJuO46lXb4PuCkty6F+/SZqukX/fw=;
 b=CTfgeU3yzz1uGS1wsA45V4Ab2rJ1RZbUjW/ps4DcCOBg9wohD1vELbNwlxRTVbG07gky9AL5TSBC8EofINc3+fqiXfFDzAcX6l7HCuo4DZMkVbCFEMFIlF5xLPdJ24eKoMdiE/MeL8awq6jG0jCP6p2XHMP/5M1QfuZgbI3SULELpzT1jWfkQB+aPyCXl2AAL6Bt8aNbhFNDYj32KwacH+Hd6sHIBM2mnBsr9pyHbwNH2DKsATPLaQsCUSb6/QcX35JV3qL8HdBSYGfBkek7UR3VfohoxrCNMrSzSmZYYi5NXjlte3keQ93nG8oJkUU8O9SaMTBxwA7HRa0cuK/eyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBNSCyDdxP89LVPJuO46lXb4PuCkty6F+/SZqukX/fw=;
 b=Q+lXMZUv0xWBOlrrIprcV1tTwOlK3brXSn+09dJ1xLMa4TJ4v71bDK4oy2gbFJUnWMSEI6iN3RaF1opOp2yHXyOFFDdIYLVo4UVy8fvWHl/infv8CxhN2GdSi7oZXpXTKP0mznCHrGBKcML+h0bwgkWMEyOaUZMnxyH1cRzUC2ARhLCfs8eOLcEzXVhK2yCVPbmsj4K9sK+ltREpseTMOvOHH3Ya5CbyCQ6dwW/1HR/RV3O1pZen6yCLjJWTWcAWKPJ6zu+NYgCJviYWHTiL87LomgR+Jfs9irMMpD6Sc+cZ2S05XnnLBcinSdPvgDwuRMdPuKhapldYOG9DQgKLag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 21:25:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 21:25:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-mlc.txt to yaml format
Date: Tue,  1 Jul 2025 17:25:24 -0400
Message-Id: <20250701212525.3106709-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bf6587-5a8f-433f-6d8c-08ddb8e5d13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fxVSqgRMRHC/LrYyxDHdWecdiEQ6PaSi4qGOaGhLMxWxiLXUTgZc+NpjyVYu?=
 =?us-ascii?Q?+MGvHFbxEntE+20+sd4Eh2gxk8lTFBCnSPAqukokGSAoFMaE3pCXnIJbdulS?=
 =?us-ascii?Q?6SDbw9lwppX6UZRe/tNU9TubE+qPZIyrvXhrlLL/ODwpy2wIChpHM1wz8m46?=
 =?us-ascii?Q?epwT+u6CVPQ5uhbdlCSPTfuLQ7TJbEfQkn/Ddl/YeEnrfpMXrG+orqwxy7t3?=
 =?us-ascii?Q?SBuf9gUKCL5qAimOwDO0lgDNjprKvYKVIei7COdVVSS/KOjo9DmJMNpb0Shc?=
 =?us-ascii?Q?SPGQHYKD44h/D06GNq/lBGNGwzw+GRnV50UJhRIth9vEGHBBy5Re/OgHvzzC?=
 =?us-ascii?Q?50+EKgJ8iAAI0IV9d00zp0CKwks4rUw//9w5wC55n0D43GQQHEP3pS5/lej4?=
 =?us-ascii?Q?6SgJ1eM+yvNYDAez6E+16Xam+BIVxTUYTwTzm+RVRlPA6gWRMqVUjC9Tr780?=
 =?us-ascii?Q?Ue30oJos2eCR2JcIG8rZ6hpFu90ZjxLFz5+0ixmWyhSKXImORc52N6e5aW6w?=
 =?us-ascii?Q?Xu8fyLPRnjIJKBgdviIY72ab6O6lHa8eycoR+TeMM4iZ4Ds96oEcgRVUnPiE?=
 =?us-ascii?Q?x0uTtvNwoccIn64xxcalxSxjsvzZLhpwBcEhU4qzh2XPAdFpb0sNlUD6Z/jN?=
 =?us-ascii?Q?yfSuzPuA/LaSOQvzaayPKHKQ2k+mUXcwizFtwYj/xZzaeRzwwC2Y4pNpXTli?=
 =?us-ascii?Q?EYmxL8rQvL46QIntNB4KozGgsCSxU52hS8C00+6I9OVU1ts+v7d0xM5dMbmw?=
 =?us-ascii?Q?lorJ7+gA0WcLWdFxipjfb1HXdPLpNf6tMsRKnbTBu9ihLPjSSHq7WPK9iKZc?=
 =?us-ascii?Q?fBBuk8JtBsuPOzuPU/CytLnFn5//HmVR8Su9bdoGhhjiHHiwjP5wokAbMjTq?=
 =?us-ascii?Q?V2ASWO/zFUrSVAJRPOnqDIGoFMxwrOPJtfyR9w8qN3b20wPkSV3Rv7KWkc0e?=
 =?us-ascii?Q?9PAxJCEglLpxvfxINiTep01QqZK2poO5Dg0k2R7NqeSEqZicekixamSVWNZ5?=
 =?us-ascii?Q?tmXuBde/PKI3YB4Ua3tefHpDVhug9l/7HdXMYe7+7D1m21KOIHJkkx+ZLYbX?=
 =?us-ascii?Q?fM6PZnLWJYpHTcUEQuvXQhQwY72OXEXIh2BuDgODFmQTYQmGsya9kH0kSHgl?=
 =?us-ascii?Q?h/l/5ANmLc86v9RnsNSGkhrCRPaGW699+ysWojbL+CrI1zUc6CCplBh8fPTi?=
 =?us-ascii?Q?hyE7wHgHfMnQR/c54fEFzOmkIfJjpYhvzvmuxW1Uuy/WvJ3nDnu8Gg2ChZ8C?=
 =?us-ascii?Q?/Kn6nE+WB1B+cfZAbNXd5V7kEitsk9vWEOsBU9b1uXX7bGW+eQRnaTYsMQ8S?=
 =?us-ascii?Q?psDLkM5c6uWZyL/NU5b1jwOb/sxyE436NprUcvUyM7ypa2t00uTchEjwYIIf?=
 =?us-ascii?Q?b+Gkh4sGWKC1EzZPQqLFoawTGBOPljDrXkgR40l+5yig+onxpjm6lxhUnZGE?=
 =?us-ascii?Q?P+MSIxxikHBT/PG2EWZbZnP5pahqgfBN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jjOe8AWUO2zQ+6ZloCxUX0TL+Mwc+RrvEo6ET7Lw4FaXWdfYqu6Q8iROOapu?=
 =?us-ascii?Q?QQtDLDADb5SmC4Eza1Y/TZNd0HBH2YdVDVlDQTAUykQE86OiXeGRDwyR/R8W?=
 =?us-ascii?Q?2M+kXEckM84+H5SwsrW6tOTUavRMalCYv3ynrqTtLqiTORBDCjzM5+D6yTdN?=
 =?us-ascii?Q?N0K0v/NdaCpHABcFFOZHZxUTGY401DXHibZKkqjR/tRm2E8roPXRMRfnwPJv?=
 =?us-ascii?Q?NWJERgesOfv8rTKPZwEy3eXOn101ig98Ll2eF00rYrSvixdsE5MQyHey73/i?=
 =?us-ascii?Q?g6Y/nNeUltENzwx7+GGYc0j+efve1JE4oT+KEdG4mJ1hBy5Fz8PG2yfZevGw?=
 =?us-ascii?Q?dAPVZ6O3wIfYiIPUVQl6J+0sbHk07aR0gD3BhwrB8xts6/27XDZemcscm6FK?=
 =?us-ascii?Q?pRL1/YX+5Z5bOLMgT7F3f41UePVJsSxdMM4gyeouN9IrS88PSxC67BTXZ+7z?=
 =?us-ascii?Q?UcRdyN2cfDQc6bqIi5CcB0UbngvlhMVQhYk3EeaO4oaNSqfv2fM/daoenaDj?=
 =?us-ascii?Q?HjTImbp+jp5gkfkkbqIwPYdleIIxuwElbJ6iDV434Wzs0CjcJwFLdaHgW8w0?=
 =?us-ascii?Q?xpMBYDQy1SHg+A/DYc4W0nVX6xw/0xti40Ys/KoYLjgzhUr3uYYP1xH95qWR?=
 =?us-ascii?Q?AnbFFdzX5W6HqXDHNbyX582gf9YdfVPrklpMFKxrxgso2qJE4S4vKcf5griU?=
 =?us-ascii?Q?tAN3xX72UzFcRcIXx9jBvFRtqjp31SfpBrnHZdRn/PR+ElA5shBkv2GlD8Gj?=
 =?us-ascii?Q?/limwXqvkwbG2/GXCjL0+ptJ61MsqzlkKmq/Bp5ad2EgGxVkc+nfF95c25J/?=
 =?us-ascii?Q?ZwRph4CXTfxQ6e8n86Xllvx5Ow0R5ixT2rT5uOOJyF7bBC0nMc4gwHi8rzJk?=
 =?us-ascii?Q?aguRHBn0IsEBWHA5jMYeT4m+oNgOEsqdb10IicKVO22t2lwIukn5YAbsaxiE?=
 =?us-ascii?Q?6EmbmqFYDrXAqKi+vK+dZ1PhPM5Obd8W5N9ZgeAqJdED1GRFCYpn5oqgxU0G?=
 =?us-ascii?Q?YlY60FRzX44EsyO/gw1SsbPC5MIxIorohCyzpMStSx9OyAk4Blu893IIoqZS?=
 =?us-ascii?Q?swqthvWsuDy9/85vKhcQGrfia7Xv/XM93AbIUaUKcXgOhWvuNQTco9RzV15J?=
 =?us-ascii?Q?v1xw34h11hVRHupRcec4Q8ynX7qSbKDII9jd1yPOCnYj1ibrTt68pNxVNpRs?=
 =?us-ascii?Q?VSt/Nnzhv1WSzWsWBHp+0pNrIFaH8npe7y4GRbjwxY0JgG5dSLR9tFaKTc42?=
 =?us-ascii?Q?DbTP/uTLHjsmu47UuQ/mbyaxtrnxLafjZaKf6Xd9jXs1AfGNhSvkCm9suHTV?=
 =?us-ascii?Q?g6xmiNwEyUEAx8zLaLylapqU6j+kwyB91u/3rdllCRZ9aZt96qIukCs6DWOz?=
 =?us-ascii?Q?bceB6tslWRkGAOuIxo35wljdQGR/eh+WwwIFIRfQAyTcaLV8WjSzARA72qj+?=
 =?us-ascii?Q?4yuSOt0Z3nO/aNu3deFXPQzx42WPqZag3y65xGqCZjsHrlCehDo1BiRSuLYR?=
 =?us-ascii?Q?16Pnmmyfsz/5fJZWX05sgw/uE6IurfQtOmCXUD8tGyitvZeKBUNE0qO7bSRp?=
 =?us-ascii?Q?6VCSJll9otOSqNoLyzf53qCwVzIwoR9El2AWdSLQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bf6587-5a8f-433f-6d8c-08ddb8e5d13d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:25:35.6511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbjel5yRTfrudU2l/M6vCKxKDy4g5qjxiB+WPdDN3NodkjhuwR6Fxa1iQ8yXmR5+uTxlF8uKMotx4zfWIjv4cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895

Convert lpc32xx-mlc.txt to yaml format.

Additional changes:
- replace _ with - in property names.
- add missed clocks to align lpc32xx.dtsi.
- allow partitions subnode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove nand-controller.yaml.
- add clocks
- update examples to align lpc32xx.dtsi
- add partitions although no mlc users under upstream tree. It should be
similar with slc case.
---
 .../devicetree/bindings/mtd/lpc32xx-mlc.txt   | 50 -----------
 .../bindings/mtd/nxp,lpc3220-mlc.yaml         | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
deleted file mode 100644
index 64c06aa05ac71..0000000000000
--- a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-NXP LPC32xx SoC NAND MLC controller
-
-Required properties:
-- compatible: "nxp,lpc3220-mlc"
-- reg: Address and size of the controller
-- interrupts: The NAND interrupt specification
-- gpios: GPIO specification for NAND write protect
-
-The following required properties are very controller specific. See the LPC32xx
-User Manual 7.5.14 MLC NAND Timing Register (the values here are specified in
-Hz, to make them independent of actual clock speed and to provide for good
-accuracy:)
-- nxp,tcea_delay: TCEA_DELAY
-- nxp,busy_delay: BUSY_DELAY
-- nxp,nand_ta: NAND_TA
-- nxp,rd_high: RD_HIGH
-- nxp,rd_low: RD_LOW
-- nxp,wr_high: WR_HIGH
-- nxp,wr_low: WR_LOW
-
-Optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
-
-Example:
-
-	mlc: flash@200a8000 {
-		compatible = "nxp,lpc3220-mlc";
-		reg = <0x200A8000 0x11000>;
-		interrupts = <11 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		nxp,tcea-delay = <333333333>;
-		nxp,busy-delay = <10000000>;
-		nxp,nand-ta = <18181818>;
-		nxp,rd-high = <31250000>;
-		nxp,rd-low = <45454545>;
-		nxp,wr-high = <40000000>;
-		nxp,wr-low = <83333333>;
-		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
-
-		mtd0@00000000 {
-			label = "boot";
-			reg = <0x00000000 0x00064000>;
-			read-only;
-		};
-
-		...
-
-	};
diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
new file mode 100644
index 0000000000000..a3ff32a4e94be
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-mlc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC NAND MLC controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-mlc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpios:
+    maxItems: 1
+    description: GPIO specification for NAND write protect
+
+  partitions:
+    type: object
+    $ref: partitions/partitions.yaml
+    unevaluatedProperties: false
+
+  nxp,tcea-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TCEA_DELAY in Hz
+
+  nxp,busy-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: BUSY_DELAY in Hz
+
+  nxp,nand-ta:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NAND_TA in Hz
+
+  nxp,rd-high:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RD_HIGH in Hz
+
+  nxp,rd-low:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RD_LOW in Hz
+
+  nxp,wr-high:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: WR_HIGH in Hz
+
+  nxp,wr-low:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: WR_LOW in Hz
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    nand-controller@200a8000 {
+        compatible = "nxp,lpc3220-mlc";
+        reg = <0x200A8000 0x11000>;
+        interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LPC32XX_CLK_MLC>;
+        nxp,tcea-delay = <333333333>;
+        nxp,busy-delay = <10000000>;
+        nxp,nand-ta = <18181818>;
+        nxp,rd-high = <31250000>;
+        nxp,rd-low = <45454545>;
+        nxp,wr-high = <40000000>;
+        nxp,wr-low = <83333333>;
+        gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
+    };
-- 
2.34.1

