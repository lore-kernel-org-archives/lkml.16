Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F227FD43;
	Wed, 18 Jun 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237933; cv=fail; b=PZTwwr6m201jBqja2zY87wnD4Dlo6iXhoOUYbzSmg9/8d2Yi+NbslUPrtlR2cAsQEq45Rpy7LxVQ52apVA7yDNAdSPMHgcq7wcEwU/1q0chOKiZdZnVTbsVrhZA0+6aCZvWuuOkjLiGRn964EyQC21YA1WjJ8Sn+yTd8N+7e3uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237933; c=relaxed/simple;
	bh=83qGkjSlSn4Cwb9kVY4bAlm5U9kdxrLOdIE+hpxqdLI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bsdWY9TPh78etFVTV1hOrb1tAbEjmFZ06c6h8ZkAge1V6K1vfO1hdX3YM2vvQMRBN6aXP+pKcDWHwiczklKSpr6JNdNYgbPbiP+CoEhAOv976mMExDKHg/KEoiEiBym/A2JBEwTy3t/HIIAcMHy7g97HwOo/KDEKYZb2MQ63hD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dO+r4yi/; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dO+r4yi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgKdTIAvzwbrQjskOADtPcUQo4P2AMksEMkne5NyWnPmPIbtWcwMDpjhzjPxAUsYU2akFS728UtqbRK9+qBilXszAE72LDO47eJlLqm3EyUtAj6Fmdoh2sHq8DgwNnRXFUnzwmhwlJLbGPBYST6gYNYU/00sqaQ9oG+xR8WfO/wAr8Zp2dkODwM1TjHUIdyqkamZTf33z/6OkICQG2ZiBHcp4qIltfwSmwMLlVRgbmdR6AV7K9flZ4xS5KNipq2I+0nWcaeQbZo41LC0Zj+OF9fVC5IiPFLbO2cXJJxGdWlLh1f9Hp6UpY6BTq2FGvX6mxi03vwTPfe8tQ7i96iPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4NPzEVXAs+j4RFky9SLozpA4erZYjVdDyBfPjx+ITk=;
 b=WkBtdSJJBJsFn3MXddJNb03Ouhr91OdAKg4EJMGt4nhRAsg0frTDevLzTOzU4ieMbHSH2KnovSiHApL6AolHXOD4PvuFOCKtBIiQWKlEi/ARo6YRrfidCClkS0QczQ7KPeiui7WBkIgslJRYDByMx4H1eFZQKjrlCgf5n575v1Hl6ciIL68R83bJxsiNbZjkm5KfzLjnNEUETnY9FHgjbZLMvDnkjxTGYNFBORWCcCcUaV831UFwHZ3upA4X2KRsYjp6tQotW9r5vUIHX7gbGzGpIRP4hWXeIUyWuQfwIg1pvU1afwP5mbwBOSO/VGDgD+1yeS5po7bfkILFVGqApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4NPzEVXAs+j4RFky9SLozpA4erZYjVdDyBfPjx+ITk=;
 b=dO+r4yi/BQ5/AtzLt0YwNfwAe1qfpOgKgh1MjK5aq0ZLDP47kayYGt6+Znii9wkf/za7QaUK+EOLWcn+rcKU5VZ/iz9bPDc67FP9c9HrrEn15Dp/bEEO6ZBPxubKTCiHX6f3+UVbGL48IVVGqGzyGhsZ+8pF2GNYcCtReA70k87wJs1pgwxVNurtSiQl31T9MibEjHUMhB5cOfaN0R+PvpXcD+fNQPj75X57AgB+1SH1ymvOt7jV438I5hFnyhOW7fhpA236sV/F13oUbvCugec9FeP8NY3Uu+dMkvDkPK4STyfkbg5PzKXlD6maLIHrvQXen1NhNvfeL3t0noH10A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9881.eurprd04.prod.outlook.com (2603:10a6:800:1e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 09:12:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 09:12:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lee@kernel.org,
	victor.liu@nxp.com,
	gregkh@linuxfoundation.org
Subject: [PATCH] dt-bindings: mfd: fsl,imx8qxp-csr: Remove binding documentation
Date: Wed, 18 Jun 2025 17:13:14 +0800
Message-Id: <20250618091314.2754169-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: 019c6199-662c-47da-c720-08ddae4832b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OQfPjq9D8jV4XufwOwL4ttd0j961Zdh+69va8oC/WL/Yt+g42HpXoiUDTTbz?=
 =?us-ascii?Q?jJHoK1D2Z+TjTRYt+5UDBuMVnEXymBDWhvKolueZw0IHaKGgIevQr5dAkCL4?=
 =?us-ascii?Q?dAtE1iA9uEm+72mRWmbzHjicfA+XrvTDihAcBFuHsm1LwtPU8x0LcPKC+wVF?=
 =?us-ascii?Q?J4XnDGwxmnWRLo+WeVvjpWoyPhRKLjEiDPqKSkD7dOuztYxqnsSverRKn9oV?=
 =?us-ascii?Q?Uoggom2INPrJ6bMLaHDzfhEqn+6jxEC63G7gw8MoGxwx2L/DpmSQBa3u+eyk?=
 =?us-ascii?Q?nRJfd/vDUO9IW/Cp/Zq8oF43kIA0Z18fZ/gwub+2FANImNgEybWkSeirJDtS?=
 =?us-ascii?Q?BtfQX03B0c9v+2YB9bCWrn26jbLZ79qH9S/mEwBgabPaKQw17J9CjYu5QVnt?=
 =?us-ascii?Q?BBeT1Meort9OB+RS6BSwEPS0es6M2chTx+qxn8epsI1fUxroNQ0XNCVklPOa?=
 =?us-ascii?Q?9k265wa+B2qNYtf4cagkcJdomY2xxqmMxR8aPYjr8bu2gvwmkpA/TFD8uWhb?=
 =?us-ascii?Q?k7ramAlT/gEz7nbgiuph/fSN2VGRGQs3t0OZIKPgFSLWGewBsSJ4mj+WeaqX?=
 =?us-ascii?Q?dAFyWN6HS5FVJH05nFYGqOagQ0kR3oRblBE8MN/62ZI/XFatnJuqKGMyceF6?=
 =?us-ascii?Q?9f9JLeIfo0LKjz1ohQQk+UvtSliE2BDzwbPEQUIJQKPLiwhQIr3MKmvwJl7q?=
 =?us-ascii?Q?0M+a8cQG74UJa1picBa4Zgah4S2yiLyeGL897VerjM1iQdfrAFZmcwgq+acd?=
 =?us-ascii?Q?3apaPhfgWZ8d3d8906BQ6iWTf2xeNnwIwP8UdmeOSUkK39f4zG0h/Hop6aWN?=
 =?us-ascii?Q?0KtwegfOAcgsdu5qXM3vUXureFciEoa7btIdcywrkJdce9Y66HwFmMSRzrab?=
 =?us-ascii?Q?JneE8YyCRuJQglHktq5FLGET2SOBEi0RejF/9rG1/MAkitMLDKxuLN9GYTMR?=
 =?us-ascii?Q?qjtvYlQSVdLzT3tsEWzKN/NHIKFQKcFh8rb2zT0BBuFC3jNM55d0193qIPK3?=
 =?us-ascii?Q?H7L/zJ/inYQYr2pBsz551Yy78e7Fu/cLh5hHRneFR+NE1icbMpA0xu9fSuAQ?=
 =?us-ascii?Q?nmhO85MLHmgej0UNwjlqg4V1bxts8LNSuLeRWW/8re0zM6+Vpgztfu2NT7cZ?=
 =?us-ascii?Q?U+3fc5YZFEv58Sek7vmtPz3G7XfB8yDuVor7LjQ+HqUAITQ5Z2UL8pXXqNAb?=
 =?us-ascii?Q?oUAB0XL+S68JN+Ytj5F1KQKBCGb/U+1s+AWO/nOqv+hrYx8Kt2HyCwb0Zhsj?=
 =?us-ascii?Q?4GlJdmOYlYqMxpbTq0YvWIxuDYgTnZZJNW6koj3aCF8lOFULqsWwSfDRApFL?=
 =?us-ascii?Q?QrZphzKFKRGzJ52L1rbFdk/a9bic966TjoLyxmW+HHu36h1nq8zESXcerLH7?=
 =?us-ascii?Q?UcK78dSAiVBC6UtluqsR8uLtyC2lMI4u4e6h/7zqPifY9YewOGU0OdDhtDNv?=
 =?us-ascii?Q?HZ08Jfg7DLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2pGn+dOYuOv+fl7BY2mS9edBliDe9lvSTOvDJpmbLgS0mtxAvBqiJlpcy0ba?=
 =?us-ascii?Q?jqI65jU9w+PzJWA2+Qp+TvpWXKRmtGF7TQuXWNvNGZzXUxENfJmA5x2WZaw0?=
 =?us-ascii?Q?Z1yOkNmlHRTcwDAUbD/dNKNIFHwVcXCfRlMXG7LHW/5PgYuTFHQ05WMo1OuM?=
 =?us-ascii?Q?ZP+hvjMJJT7rZCsmGxI6y/fKK5Z2nhl813tdEJxP1YMyvc8jEigGGMV8OS9e?=
 =?us-ascii?Q?YPg0X9A33TKy92K1T04yD9m0WN8P7rNMUyYNCOuXvh6KyKPLtgw2KR0lU/ba?=
 =?us-ascii?Q?aSSBOO1kPt1/kSGbnK7dp/JQDRfvtMVmZpsWdQAKdLrUrH8ixHjINM16U6NB?=
 =?us-ascii?Q?POqxy3LTgMAaeFF9dKDyfa2aRp+kyZ4Bet8Bf3W3IUb5d62lNFEpa9MgqapY?=
 =?us-ascii?Q?SWb2knU6Zf6moB3vobyizrnmbxCPi/8dGYM7HnGgroJvzp3BSXbWMMoc3TJm?=
 =?us-ascii?Q?dJPdxwtBiYENaTz4qW8r0NcyKgG4ildCky1rlVmh7XVVhZWN106zBeMwVm3S?=
 =?us-ascii?Q?DU1/Nz8HPn4LbQarui/aOTxyfmjbyfjBPP2QZatk1AdMFEE5YUfnDz0aQVE9?=
 =?us-ascii?Q?hHnMhf6EV5bsqJbwl1TSh8DNTARZscJQwyXByX4oDGONp9OAkR/XU88PYUgq?=
 =?us-ascii?Q?HE8FO4DubUd4r9RrfD+STgfgPty0WC/7G783yZL5ZQY66Eza558UxpM4p4LI?=
 =?us-ascii?Q?nM9iPvSMHSfFHXpRvrN/R4He/Q/FzhxVzBOCWJzalFgDxj723uUpOW0gtNGx?=
 =?us-ascii?Q?0UrMoap3771Py7RP5WKD1W/NrgApRPs6jDBa14BWPY+SZJG62APKUGeyNIwb?=
 =?us-ascii?Q?MyMgZSrMfJqxW8usW3XCqkUfdqBedAn4g3G9W05X7YZAWEzDpkPAZx1hKWON?=
 =?us-ascii?Q?NOildN+Ul7uZE4XmQKF72ImcUrtGmFsgjGlNgm6n/pylbpjXp8EgyXaj0wrE?=
 =?us-ascii?Q?Ke9eXieRxgcx1FSjmIqmD6OOdUWymqI5JFR4jt3QcqpxO9I8P+R8C9tbUMZT?=
 =?us-ascii?Q?sEpHTSRUnoQiu0r0HvyrUXX1YUKv/IsGqwmecMSmFOTikQhWr8JGy6cnsQgj?=
 =?us-ascii?Q?zCBGA6jKSCXzE2z4NJK7NoI0YOLPcwxvLyHgk5wLVLxuMPzA8uXd7GItHqG8?=
 =?us-ascii?Q?1OD55uxoEj1f3cBKI0BzUwSKfZiR9FJKK2YO99HyS6ev/INqMEMQdZuu5gWL?=
 =?us-ascii?Q?ZVcze12O/5w9i2jyZf3T/aCGjcPJP7qINa7jbAXLJV3dSRGaWiiQzlEdQLlT?=
 =?us-ascii?Q?W5GU4To1Qm5kR25PPJ8ak2ivH3JAB7glduEShqf73MfKivwP+ailSRaRUgVZ?=
 =?us-ascii?Q?VdfHy++zVuUosuuniJ/ILhBZ09YtyMU+Gw/iCMpjg4oih8zH6+74PP5yJ9TQ?=
 =?us-ascii?Q?BolC/tGYIHyVubsbP4MOA7Y1U4as0nPdy+6n9vpamumyC4Rdqu77QcNPV2/4?=
 =?us-ascii?Q?y2Nc0rrvPLpLBgEADF4vmaqkpN6J8bpvIcNS+pVJW1EoGp7YSA348w7NzKyC?=
 =?us-ascii?Q?9BW+LyIVVAAVyP7NlpUG1OqLP37yaWjToS0KLh3rZnwNbpXTOrVWuMDiL2AU?=
 =?us-ascii?Q?GtGAhRUvye55h6O9YyNWBUtKZxNlUUebzpBhWhmX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019c6199-662c-47da-c720-08ddae4832b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:12:07.2406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaxavODT/DKhcYuEydX86CrG+xbWwg5HuW1HGdgyknoo7x0waBDsf+vrvRACqDfWjTdcQrAQvFetTXNBk/Ymlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9881

commit b0a5cde57cf1 ("dt-bindings: mfd: Explain lack of child dependency
in simple-mfd") pointed out that it's a mistake for a child device of
a simple MFD device to depend on the simple MFD device's clock resources.
fsl,imx8qxp-csr.yaml happens to make that mistake.  To fix that, remove
fsl,imx8qxp-csr.yaml and use "simple-pm-bus" and "syscon" as compatible
strings in the examples of fsl,imx8qxp-pixel-link-msi-bus.yaml.

Fixes: 9b2c55b5403f ("dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module binding")
Fixes: c08645ea215c ("dt-bindings: bus: Add Freescale i.MX8qxp pixel link MSI bus binding")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bus/fsl,imx8qxp-pixel-link-msi-bus.yaml   |   7 +-
 .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ------------------
 2 files changed, 5 insertions(+), 194 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
index 7e1ffc551046..4adbb7afa889 100644
--- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
@@ -103,11 +103,14 @@ examples:
         clock-names = "msi", "ahb";
         power-domains = <&pd IMX_SC_R_DC_0>;
 
-        syscon@56221000 {
-            compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+        bus@56221000 {
+            compatible = "simple-pm-bus", "syscon";
             reg = <0x56221000 0x1000>;
             clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
             clock-names = "ipg";
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
 
             pxl2dpi {
                 compatible = "fsl,imx8qxp-pxl2dpi";
diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
deleted file mode 100644
index 20067002cc4a..000000000000
--- a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
+++ /dev/null
@@ -1,192 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale i.MX8qm/qxp Control and Status Registers Module
-
-maintainers:
-  - Liu Ying <victor.liu@nxp.com>
-
-description: |
-  As a system controller, the Freescale i.MX8qm/qxp Control and Status
-  Registers(CSR) module represents a set of miscellaneous registers of a
-  specific subsystem.  It may provide control and/or status report interfaces
-  to a mix of standalone hardware devices within that subsystem.  One typical
-  use-case is for some other nodes to acquire a reference to the syscon node
-  by phandle, and the other typical use-case is that the operating system
-  should consider all subnodes of the CSR module as separate child devices.
-
-properties:
-  $nodename:
-    pattern: "^syscon@[0-9a-f]+$"
-
-  compatible:
-    items:
-      - enum:
-          - fsl,imx8qxp-mipi-lvds-csr
-          - fsl,imx8qm-lvds-csr
-      - const: syscon
-      - const: simple-mfd
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    const: ipg
-
-patternProperties:
-  "^(ldb|phy|pxl2dpi)$":
-    type: object
-    description: The possible child devices of the CSR module.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: fsl,imx8qxp-mipi-lvds-csr
-    then:
-      required:
-        - pxl2dpi
-        - ldb
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: fsl,imx8qm-lvds-csr
-    then:
-      required:
-        - phy
-        - ldb
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/imx8-lpcg.h>
-    #include <dt-bindings/firmware/imx/rsrc.h>
-    mipi_lvds_0_csr: syscon@56221000 {
-        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
-        reg = <0x56221000 0x1000>;
-        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
-        clock-names = "ipg";
-
-        mipi_lvds_0_pxl2dpi: pxl2dpi {
-            compatible = "fsl,imx8qxp-pxl2dpi";
-            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
-            power-domains = <&pd IMX_SC_R_MIPI_0>;
-
-            ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                port@0 {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    reg = <0>;
-
-                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
-                        reg = <0>;
-                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
-                    };
-
-                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
-                        reg = <1>;
-                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
-                    };
-                };
-
-                port@1 {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    reg = <1>;
-
-                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
-                        reg = <0>;
-                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
-                    };
-
-                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
-                        reg = <1>;
-                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
-                    };
-                };
-            };
-        };
-
-        mipi_lvds_0_ldb: ldb {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            compatible = "fsl,imx8qxp-ldb";
-            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
-                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
-            clock-names = "pixel", "bypass";
-            power-domains = <&pd IMX_SC_R_LVDS_0>;
-
-            channel@0 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                reg = <0>;
-                phys = <&mipi_lvds_0_phy>;
-                phy-names = "lvds_phy";
-
-                port@0 {
-                    reg = <0>;
-
-                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
-                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
-                    };
-                };
-
-                port@1 {
-                    reg = <1>;
-
-                    /* ... */
-                };
-            };
-
-            channel@1 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                reg = <1>;
-                phys = <&mipi_lvds_0_phy>;
-                phy-names = "lvds_phy";
-
-                port@0 {
-                    reg = <0>;
-
-                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
-                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
-                    };
-                };
-
-                port@1 {
-                    reg = <1>;
-
-                    /* ... */
-                };
-            };
-        };
-    };
-
-    mipi_lvds_0_phy: phy@56228300 {
-        compatible = "fsl,imx8qxp-mipi-dphy";
-        reg = <0x56228300 0x100>;
-        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
-        clock-names = "phy_ref";
-        #phy-cells = <0>;
-        fsl,syscon = <&mipi_lvds_0_csr>;
-        power-domains = <&pd IMX_SC_R_MIPI_0>;
-    };
-- 
2.34.1

