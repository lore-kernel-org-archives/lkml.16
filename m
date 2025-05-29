Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BC1DF25A;
	Thu, 29 May 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748549138; cv=fail; b=Kymst04hJLnQldJ67hJhIjItUozX2yfEx2kfVEfxSCHAWBH+cDeTS3CaTD5q06/sHirgI1ak9FkbKadGKs7jNvORrQYf8gmRJ80qcCB4c25t2ARQ3/4sWwbIJHiFmHbkDqUwb2EjRGiNgfnPQwnYa5ewNvh2cjbvQxU15AueaVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748549138; c=relaxed/simple;
	bh=pAY4X0j3fJ+shPWjf1b5iE52p+Gsjm0yKhdtn8k05KM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WxSxbrnGAwXnHrX1UG5HjTyuBAkHE5p9aF2M/2OlrefAeA5aLRS1Zmj4X7ytxtq5l04zfa4zb0X6ScVUMVzsBlPitci7njp1nX8UjNyyw7Px/rJMTvUWjJIjItbrQ+1Xn75H5nYKj6+mRQSthO2t6rQjzrNPPo9bStgI0Kp6sbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Aj0rD4O8; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Aj0rD4O8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnLUmPzr1eS1RfWOByDn45OE4yu5RphfdOeFahzrxycAnzIVH0aZMrz5ROcAuPgnstDAwxH5nEhcYMCzDyMuqvNTuWK1x30KjbEHiIAUA2hxBvBhpZ7uRGiAlhoAVfj2XuofSlQSda1EfNITsNmvz0IoOXamde60hD5q+sMWW/yUEZzTOW+yg2RHK+47NefLOLcaJ7zp2PzMKdBj2ap0n2X9/6bPqzAialp51bzt3NV1HeAamUcmMU0yuxTbcQMgvzi80YfplhbQ6AhXbSkGwp1HQLpq3cdaIFz282uI/32anMRIhrq5gTgvydrDeHISrT/dOH82APGQxkN5RO9qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3xDA0kfSm/+iZ9hOP9vxllNJG1P2xqKCejb/w0GlmY=;
 b=vMStkywRk9zjldwW98fs0bOtZQjqhftxM6ftls+C0vmszBPFQaNp2m7Ip0iC18f8O1tSR7pOl0dywBS9/UmIUlqCvYXbHwz8Pleyrt2oDcwYHFXewQW+p7UsEfIaZAIVyBkillvbWSO7SytCDipowNw41rlauKo4zCtPBFGPKLns/Uhkj0SLM1YyLww40tr8O6FPkriyoXqvq6wqMakwjvRkGTfAo2cwHIFeq1CT+GIlW3rw0S6LANKB/Q3+bcnNZpUWX/zh59d9LPtxjpB/F31wOfSWRHUrd75LsVll/Srfv5xMGu3yjMMl7O7d6lNSpK2zfetjjp2ctPciZITbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3xDA0kfSm/+iZ9hOP9vxllNJG1P2xqKCejb/w0GlmY=;
 b=Aj0rD4O8qEfg9STdKZG0VP5PckYCxOlTVtxSZWzr4SWTLt0IQY3rl2dlC5bLw0429w8Fjv0g2hMtlBJ28GLehWWlYO2o4ks1l1hSY4aHJ3KXJKf3Aoc9uqsXRDbUJ+4jFstfVeT6NDLEm1i0j7e7Fg3zehzu3z2sOnySTt0qeuHavByYF9fFfmZ/87B5u4dtJZut4lbDPukRjqYx0FNIulggMUS3BXhAqKfpGmqcwWJXLrq6cHhinEM9QRfgGXZG6X6VyEkkzNdj0O907MIqsVUVUlxO9Hj4avTpQ/pgFwFc7VlOdfFbuGoxbzkpzwBIf/CPfZT7AmT+L8YvtP9clA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 29 May
 2025 20:05:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 20:05:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:MXSFB DRM DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: lcdif: add lcd panel related property for imx28
Date: Thu, 29 May 2025 16:05:19 -0400
Message-Id: <20250529200520.798117-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e369ba-fabf-4cdb-7689-08dd9eec2b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8giOCDd7PEOTAxHSSYZEI7bpg8IGekvQnuZzV964ceiSy98XM4FYZwF2ND6F?=
 =?us-ascii?Q?jq7EGCSzSRGEAxCmNVQgsoGNyifoMMUq3Xh57vwcIz4fqNELDODmTg4ruBiy?=
 =?us-ascii?Q?gaR7sgMij9mbN0NjOx9G6fC308Q/Ag82WEDXAU22AfL8GVrLpZY/f2NTxJZQ?=
 =?us-ascii?Q?hzezgDj23I8+zrGq9IJDNsqwD/6OkhFHF2TQOTqa2iYxES481M0MoHuRg7e5?=
 =?us-ascii?Q?TJS2K4yP5yjeAe+XrmNcTQ1QB6rPM5GAPIF8/+MiW8i3bQORablUQqiHAXZp?=
 =?us-ascii?Q?s5PYgnbk7iwjHN5eS6rwpE2EjNwISgNPgogeXW/2vp63wiJeC2Ov3oGTPL6s?=
 =?us-ascii?Q?zaN7oZMWfgY80ldx9TniI1hgXukdFArdaVeToR8z3OlNwnKjJTzQ3nTiyCBt?=
 =?us-ascii?Q?aI7Ljs4G09iUnQlU0XfDJS9CPTgbP0f0pyXJLhGf84tAmwThSCcZhrv4O/dK?=
 =?us-ascii?Q?tjhl6aPdbC8BcbXBfpFOoPBizb30aJtcpi9aZ+kEI/7iqSVDMz4i0lGdjegK?=
 =?us-ascii?Q?4xuiM6h+pJEwTIpO5aqjawYrA+R7b7e++bM+yr96xpKiDij/p/xmKaAe+jcG?=
 =?us-ascii?Q?1OAt5AaInX3PvyEaBERYeSOqSBIHALN5BWI2Gg38LEO5xUQE9x0W0FDvKx87?=
 =?us-ascii?Q?Sumn8VlxTRv7gJj7bH/gBM5XQkVn7Wd5jiHrhvY0oaMeLZctA6EWLIL16hop?=
 =?us-ascii?Q?gE58TPVhGnE04mgqNiZujINEGelCM0oPDGych2nXr6ov7LzpFDOpoYztoeb9?=
 =?us-ascii?Q?R/lOGRvBgq+giF5ck6Rs3/BcRV1BrQr48x8/3Wq7aSFc2xbOJJ78/44CQpQM?=
 =?us-ascii?Q?9XInPRrNJlPsQb4DtbAQ2LwA4pXCokQYZ/4U8pQuCUz5QRHL2ni3kJk/78hY?=
 =?us-ascii?Q?HoASfuKe2pd+rY2iDPCQM4wv9NytKngsbZ1UQvoSSlpKFaOXyfi+OcsxMmso?=
 =?us-ascii?Q?YDHNVteXEZaFAsNHN50R7/VZhBj8O+SvsdR7cONZKK+3OngqpN+LtgP7AzZ9?=
 =?us-ascii?Q?w6gQuBKheGykDLDWCbFWgVuw2EBkh7VngtBKRIhfbRFRfMXrulgCHBt1DvTC?=
 =?us-ascii?Q?BIY3GikgnnXbJuHMrKMTn1Q5/NXDvxP41NLRYqoO56NFshLqM28WQopBa7FX?=
 =?us-ascii?Q?cpe4ZnkljSxPHN7BbCEAYSqeCQyrg3wSLK7mb7DygFmRCm8T+FXxfOgVpypN?=
 =?us-ascii?Q?bIRp6a5XPhBA39yZXXcqgmdjUittqdJOIzdmAv1EskGiQARXMvGNj9svDuus?=
 =?us-ascii?Q?TvayfijPRtlZXmW4FAh5+seWVWy2cRMFkZijQA+wen4psTEsBujofQIzmuZQ?=
 =?us-ascii?Q?sCOoeanAflP/tzQz2zBS+i2Ia5POztz389OKMJzWdDPI9Zk/Q5t9NpVJdWmu?=
 =?us-ascii?Q?6egUPfhhElgVJXKd/bwTCLgHDLZ4KpCP7yt4B6h6vlvPDXAgByasBNm6+shP?=
 =?us-ascii?Q?vGLkG759UQJ+j5icOcNMWVINc0CcyQzI89WKy/ZHgrzJdG2Fg8zQEX0pXDVa?=
 =?us-ascii?Q?UGMWbo0eyGBJR3I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VUeq3Kq/8MdnfTYcWbMCI+ppXzOcyGyZYSZRXa80IHNrT3nx08RwvLV16Yww?=
 =?us-ascii?Q?DRJivYN8VIPOVq+l/XsiKhozUy0Ykc4SwtdyWUzofet18hksBlozJDwHUbce?=
 =?us-ascii?Q?OBq9i2mTo45qGwB1HwDIBV39zVc+6w8IbSqnb+9K+iu/SleVfbkSu9pw0a2y?=
 =?us-ascii?Q?8LI2aQiBaJilLjqiMgc/ZNOJKIQKycVrFHfX9g3x6hjpBzDw2taGn9XbRJCH?=
 =?us-ascii?Q?vN84t+lx+3yjpISMgyuKB0A9y75+uGasr3jSHQIZzy6Iynblp9kB5nort8ZP?=
 =?us-ascii?Q?xw18M3+lOJlPnR9exHWya2tjBg1WxfTlK5eqkd2DhzPNs7OTN2dCpD51Tlpe?=
 =?us-ascii?Q?qGn9TBdZWYuilm0S5Xm3u16YQCSOto1Ku5d8iJCP1F/LZMYNOfoZ8xuaITWj?=
 =?us-ascii?Q?cMYNScbj6IUTNqUL0yarcdoumlJIRx6ghIfZeP3kX32MOwyIMfIvXwC8APi4?=
 =?us-ascii?Q?KbzLns69C5xWeymahhjv9j4UYzD8kxkCg3FjYbSnwznDjJu0ZzexQprjoZEb?=
 =?us-ascii?Q?HzRLj/onSiOZ9cNq1mevgQtZeZuSissChvUO9FeXpEwAwx6Xi+HxIv4M2PiI?=
 =?us-ascii?Q?MeVc9hZHbAZ/mtl9ykjHm3QIeYT5KnpGqd/pghy+h5tvOPa0IqWxxKjvaYoe?=
 =?us-ascii?Q?E3C4VRpu7+KUYJxNUnFtISgc4BpQijXvJpDJDg1Ivj59DITkFZN4AF4JCjbN?=
 =?us-ascii?Q?GH8TfsWAAaRcKmMx7VUZHwVUtLDeCn7iZyEps2cAOENtb2TdSj/LzfK8VMWO?=
 =?us-ascii?Q?27zhAce9JNRqBWMnlykGW/hQTnvf3DV3/4DUrhDCc6utxqHdBaRGOy32247+?=
 =?us-ascii?Q?Hw+Y4MHOp0yi+oFUL6euEnm0W+2RgYpH1OhIBTWbk3IsmGgvtpKG65gaPQ7L?=
 =?us-ascii?Q?t95BmWzdNd5z2YX+0THpVHmtdWbxiqr1ipZTy4xTcNK+7IsGVRhIGyLWjRfA?=
 =?us-ascii?Q?H9ibbEnWT2jALOqBBobY2Lrx5MOPdHR/495kkO6axzuUx98lLB3w0uisrHlr?=
 =?us-ascii?Q?IgAGb3tkAosDGRvobxEUkC6AQDuovOmRZge2IHeUryWLB4RsBmP1ikkZh5wM?=
 =?us-ascii?Q?ECygeIZujCaa+aKx2qScyh7iGobGmMTMN1v1rk8NMEVtXsGs4Q/Z5iUPpV/3?=
 =?us-ascii?Q?REKOZoawnZJzNxmYmFlZH9LqGfO89gxoaV9nnwURyB74v2HyZATjksWw0K+p?=
 =?us-ascii?Q?F/+9qVsoQLa7qfPFIV+35MjE314+c44umEaYWK4IeZ+kJYfz8L4bBMTkymf4?=
 =?us-ascii?Q?OKPdnnV/0CdFpVTxx/7toKbsotMJ0CDoU89F1+aOD71c3x06Yc78UQqq8hcp?=
 =?us-ascii?Q?Lo7LIjOOcZpw7hi1BYxHh6IR4e/Ygt7hjVW1ZrMlbVRMzT15aaUB3exe+Nim?=
 =?us-ascii?Q?dcxBQcUdEANKLCBpMqm6QcAmiXLSZnmNfkLCjSy8ykoq0M/7zhExwfOFvA5F?=
 =?us-ascii?Q?RhWnITfsxeKqBZgJjYcLdqz+PWh6FuqZAdPbEt3ChM60rMP9sCMxUI4je/Sx?=
 =?us-ascii?Q?tMEZFrFOonOQsIQRUizYDUQ3BNlbODgBve1o/1PPMvPAU90qY437scRD1hf8?=
 =?us-ascii?Q?aCdulHoVP1cSmzOrK68B723wbj2yuY0/efAAdSkd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e369ba-fabf-4cdb-7689-08dd9eec2b66
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:05:33.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OO/3w/t350WGZOmNXbjDv+hydw0WBWlH+B4P/Z0l7Wk4pnRfwzI/AWXS2xLhAVlAumHITwBRsK08sL/ikT/BJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075

Allow lcd panel related property for imx28 and keep the same restriction
for other platform. It is legancy platform and set these property to
deprecated.

Fix below CHECK_DTB warnings:
arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: lcdif@80030000 (fsl,imx28-lcdif): 'display', 'display0' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/display/fsl,lcdif.yaml           | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32d..2dd0411ec6516 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -71,12 +71,23 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
 
+  display:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to display panel
+    deprecated: true
+
+  display0:
+    $ref: panel/panel-common.yaml#
+    deprecated: true
+
+  lcd-supply:
+    deprecated: true
+
 required:
   - compatible
   - reg
   - clocks
   - interrupts
-  - port
 
 additionalProperties: false
 
@@ -175,6 +186,12 @@ allOf:
       properties:
         dmas: false
         dma-names: false
+        display: false
+        display0: false
+        lcd-supply: false
+
+      required:
+        - port
 
 examples:
   - |
-- 
2.34.1

