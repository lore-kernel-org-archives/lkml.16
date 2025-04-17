Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96641251799;
	Thu, 17 Apr 2025 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902942; cv=fail; b=jp+OJOdEwridWeG3F+WmrUeJ/JujaXqkGBjZWBS9PVNUq90H6uE7imZFmt33IBamlWSv5MoYImwEc/+0FaWG0dlck6iMBFuDm1EMp2ggyA8vHgwoNg7eu25V7rxqcllDCD0Mccb62pAz33uhPWPplpNJbvcri9MO0d/lghfmH8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902942; c=relaxed/simple;
	bh=HUQiJ6tDkp1F9DZCQZi76FQd9KlWvV8ineLsSy9Eskw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ag4Po9zg75NUEhnUAD2hv2xuQOx7i0YVz+2j9GLX0u2zBALZoRZ7WNH7XooT1pa5V1lviy4DhGjEM3XOikxdE8AhXDme6xzXpXhKm6U4yADfYQWOVGBIUzjws4fjQC5g+W8sJ3Iyq3B1uWpDxxhSPscfWu8qABHI2Bwdf1REqkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a5HHppKG; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a5HHppKG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLBA2ND9AdXJorinTbRR3pZ7gmerAW2qogsXN82yRTmmAICc9ROnlB9xDzDaNH7j97EtJdjKAWiHrONdR2a8lryJkvCLH5Fyt+NfUSGgsECWgLsvFZcXCE5CzRxburBb4dzjLDZuPAlGy85BPRpbUIJbT14HPo2kHtwzGopvQo9ywDAmQ49pz1hBve6dNfSX6J06FyPD98rPcaZMuFBnZRK88/t8mpuij47vUIo74qkoirs66xMKW2I9cyHWHglm3RVXICuGU1/by5/lRH7V4tHRqvxUoWEYgojOPK2PyHgSiZ4DAt3F9u29Xmf/KWM8EKQKyofg1lJVOw0UU3pN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOQIVhT4WrEhXIOXESesYvS+vBfdKX1dUCNY0HVA8e0=;
 b=pKoIEbnAH3OSqXHbXLZFZpzoYg4CyMrKns6jFI0uptjZuEPz9GsVBzi+O4g6ofon320H0YU0rjnKi3Ts7RQJmYDv8dW/B2/5X2/N8cd/fxQMAoXSIJjiXcqs5eJe7B5mOTVajMLg50HwNWKMC/gw9GnmOWjk/bnYiSt0ymHeFHW238IE3UKVRD3rsgtzWrgffk4tCAQqUr6y48vauZup2atr2aPDtXig6Cwc1pXgMoa5P6H33EQG+Dw/7PW/x869h7Fxr/+ixyX6hhYRL6K7Sa22AvwjkrEuS0HNri4wcll12u0MG2FN0Gq3pQ2gXUxolEXdXHDeKD4BrEFWCioAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOQIVhT4WrEhXIOXESesYvS+vBfdKX1dUCNY0HVA8e0=;
 b=a5HHppKGo/fNar8phi/Atdm83TeQr5+0fgCUqD+GoINXgzz2C5x0ei8LP1QD1KzogmCnoinvIW7+uZ9T4TDxLJj5p/d5cURcB3Pd8xw4MJnh5TN0szGfmKVFcjQyuU/3yAqqkd1HyNeKPwgXN/OXtNHNlhgnpJszWg6KFaUAM2ARlAfH7FnQ4QiJI73sF/L/0WushXBc1NRQv/mFYCoKXKYeR1m7uvX5+QI4wE+YnRv/fyW0OD3cyX59F6nUGy0mlxUIUi2gHGAr8lwCKA24txY1odOgd22YxIfM2xix2HSR+KLW4YlxmjhuklhPCNXYYNb/ML/aqlWanFWJ+zX74Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 15:15:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 15:15:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: fsl: convert fsl,vf610-mscm-ir.txt to yaml format
Date: Thu, 17 Apr 2025 11:15:22 -0400
Message-Id: <20250417151526.3570272-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a156a26-aa54-4c60-dbbd-08dd7dc2b594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T1Qb4ev88VxZCVHxKX606d+z85xTRBna7v4RWNzJ6ahuS7Y5qaZCYFS59UNa?=
 =?us-ascii?Q?Lxj+C9VGZfKRafLjmi+STpQBsXXWExc4gGJIEBe+CQwaCfcxxocoEI/WDHce?=
 =?us-ascii?Q?cNbAW1A5fJ+I85nVVvU+HFJkyZKsnh2vCHQM4k13B1RxEAKbSwmmHU+kXh4E?=
 =?us-ascii?Q?oszG6siyNLeHhjpgafZ8i9ypAjw7FKUedFdWSrckOIw9eu8KD1XlL/fRmG4x?=
 =?us-ascii?Q?iMPDRoZUIvpUC4iJJXJwXUi4/bNwQPcJRdRFZPk9gyNmglmDgjsmDjhIhBHm?=
 =?us-ascii?Q?GavrYMVFKQQumffeR6VsYB2JFyKSmEkCDiPTyyyBtjm2eg26k2OFjBr8zJ99?=
 =?us-ascii?Q?J+No1Dthq87QLZlRbBWrT4AcCqeAfrlTC1f2EGvc8xeFoVFD3C2SGX2sTlFc?=
 =?us-ascii?Q?F9ITzv2CvJzPRKCwSfeOvSzIUciBXivWoSVdFn2+r9UCqGleQ+xuSDwTm0Nj?=
 =?us-ascii?Q?lhZKs6DWZjz0JvAo85EQGgCJXTIQH+7hnxFc3d0iWrnfLfz3PJ5a1EFGvHyx?=
 =?us-ascii?Q?OwhLlIJIMtEa8CgJyy5FkeHlNOKa1tl0xgE8uPWPe0rJAodc1GBFPpEj7msA?=
 =?us-ascii?Q?vGkZ/wMTV00HMKkTBqmJqL8wNeDcIWsUOMtHQaHVJJ4wbfPO9HGCsEfmefEc?=
 =?us-ascii?Q?1QRAJdr9YSQmqw0UKVco4QsEdTa1Sr8YD6g3kQykAzgap8bwBey0FICN69ng?=
 =?us-ascii?Q?9XzohQQVwuWPbleLEtQxOfP+W8rD8XaXY29yVANaYJO2f+F1F0zDrFGJj2K6?=
 =?us-ascii?Q?ntAvyxYVdYPvbf/tvYg3JhlsmBIkQMcXDm8kbYsXMxE7CmHv0nZrwaIGfbcG?=
 =?us-ascii?Q?69mBezPJS2mpIi3Lo/+PGUjbI5UMddK2pM6V0Zzmttogwumz1d6CYyN+vhOc?=
 =?us-ascii?Q?IXetK4RWOu2nR7QEOdKHNNiDmLpse4gGn+FnBX+QXbto3TbIs6Ymw01+dilq?=
 =?us-ascii?Q?wzJq9LrUyEWhqGHqWWCsgDswpPge0Ols6Cp9XcxwgodydlCWmqP1REDitGzH?=
 =?us-ascii?Q?UIagvVJalEftfYmJrV3Z7jfPvJTNrIKixAK52ZefhAlgnJo6OYREQNfWV9UG?=
 =?us-ascii?Q?ZPo4OnAZV/7ZfcVuKTSEksMOYkLZ9p5Lqy0vCzXcX8Tz46LPR4k6tfBYVL10?=
 =?us-ascii?Q?8HFg9z+eIWPm1mT34Yq6Ko1KRDgzeM1AHg64eOiXUEfivNF5UG0nIG1uczSq?=
 =?us-ascii?Q?SRzKtjhoW9YJ63V6LcavzbXqw3GHZUNfp0+dWrxp3Gv+14Sa6y5ZnY0J+x73?=
 =?us-ascii?Q?Jf5aSk0A6+lIRGMgxNM4W3UDE2dAgw3TfXH2G2CAm67vvQohSVk7F6qfBi08?=
 =?us-ascii?Q?NtVUb6xrqFBpwiWI+uOww5LTtXIPGTuRIa6Rth1PQq699URyhBCvnJ02wM9R?=
 =?us-ascii?Q?qDhkKVdl9S7W6vDYvY3R29imSrOSIQAS8ztWLDZa/7ZGErg6hDRmKmKJHLg3?=
 =?us-ascii?Q?n7P3oHgT4m0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XvfYO2qJksJx6vEoPNi4PJmEyCSLOppECyV/rV6hamPaZgUPRAn0tl1zU8Ag?=
 =?us-ascii?Q?VNBRJ9zazWUXGxtJvZUN7SWwdoGQB3DQNOIR6s5B8cwhSgavy2CEq3vs/tW/?=
 =?us-ascii?Q?Z4X2//KmiH2YQZCXzM0FCwf8/w0glJBb/U2cTIrXHI+CeqbaUj9lHdYIlweO?=
 =?us-ascii?Q?BuPU2De6EUfgt4BgvhXUTHOY8o334x1zS8l4JL7CxHBgCLW/zsUizQdRqvCC?=
 =?us-ascii?Q?EmAjS/tYibMLYaWEiMMZfrxHAE8B67YtBa1N68zsuXiq8+osCQ934CGBagew?=
 =?us-ascii?Q?4VDIZgWN16VWMoKWAw7MyT31P6xaD3WkNAbTOtynzndRVr881cBqzN4I4bmW?=
 =?us-ascii?Q?OoF/a9yiYwKGvWzH7D5aR/omRcPrB35Dw1xGvpABjLS8qZ5HQ6jmAdgTxJk2?=
 =?us-ascii?Q?1vCkGOqj0RWEt8Dbq55Yl1bEoo9dIlUuU2xnR1Fa2/X7djSJng81R69xwe0Q?=
 =?us-ascii?Q?MaDkPMBNl31XbPw6DJ0P2ZYrzD1Qj11dPdCMTmpny1MWmYd+6doScjARJUNx?=
 =?us-ascii?Q?IcJG7XibzZmBiUULC1LqN37yM/2+xQzjBiPODLnyRhGOGvlF/ahDUesHVGL3?=
 =?us-ascii?Q?1szDtvePGAWt9D0Tq4n975AK84wZyuPMHBhI+8o0H1+q90gfGS6QzINpInbx?=
 =?us-ascii?Q?VQA0ABhxC4XBZ37g3/enzdMbd92BwXA9XXuURyTTN1o+hKNTTP5pkiuhVR5S?=
 =?us-ascii?Q?eyfdPHprWScJsfvJ3SVQMgUjjrGdC9CGJed7YttPOcif5tU/etdo/1WImdLA?=
 =?us-ascii?Q?yEDlZe1jkzfeUsGzk8njL9M3GOrLyGYGzSAcNNZuqN6tLbvJNwR6LUfg4qYA?=
 =?us-ascii?Q?Ckl6aZqIRsLT83BDP7oXbZhSYSoUIqNgPF8TtVXwyUxq9siJswE9RodTBDsb?=
 =?us-ascii?Q?e4qsUxPo6JjEFbsaDFcKtPSXhcLDHAOqV0VvsQX9UygfZTwBVcLvBZJNocwc?=
 =?us-ascii?Q?a60FDhtWarHBaNuo0SaLKsCqhuOYjwmm7wJRmfopLFAYdMHgTCuZrlhFH0jN?=
 =?us-ascii?Q?4eqxBBZ4Gxf+rh494InQm+RjNVql2OlRiXZS55oUdhn1rN6YY1PP8x7CC22i?=
 =?us-ascii?Q?+0XZ8WvhV2VjllS7sq59IG8c99Xe/8EA588o5RX/Zx4YxPCfuaAUza+vpuOQ?=
 =?us-ascii?Q?joemVslY7FDSHbQleslr6xqPL67iT54f3VDYO1d6aQHeeq5KEoc5FYWYvr1b?=
 =?us-ascii?Q?zXExdrXrmthi8lBBtDr65OZrsRYGC7CXNDwvXtc3QCZCH4R757rReDDY7GTe?=
 =?us-ascii?Q?DgF/ihmO2bgtRjsOF8RG+IHy6ix8dhpHlBenr2MJ0jzDcayin0QCkFEgWCvM?=
 =?us-ascii?Q?rYE88FUUFMJM5e2r85574ElOlCxZa4XUFc1bNjWKt2H3r46JllNTseDtpECO?=
 =?us-ascii?Q?9RHIsmlvDatiqQp81oPhQl9OFKCfNvJcV2tJwTNSfoawgSJX6rs4CZPQg1u0?=
 =?us-ascii?Q?d+9GK4EAkE+qJUOtnLmH3R2RBNVwksS0zSab9bvc8UQGEYw3FRNU7EKtiHMR?=
 =?us-ascii?Q?iH+ZPF5BaMxtBDmb1EM8bQB69YfIzaUF9vsaNwcrlxu8aEIOkybDQT9Siw1P?=
 =?us-ascii?Q?7S+mqNO+Mkhh5FapWCrxAd26EoXsT1EBWvaTsERq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a156a26-aa54-4c60-dbbd-08dd7dc2b594
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:15:38.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzJexGuumYweXVCkTYlHj662QjoxFS6UPvtsK87v39GoYCFmYet170pU4wYLZ7pIQp+CAsuSZPsScPfdNMVCOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

Convert fsl,vf610-mscm-ir.txt to yaml format.

Additional changes:
- remove label at example dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../arm/freescale/fsl,vf610-mscm-ir.txt       | 30 ---------
 .../arm/freescale/fsl,vf610-mscm-ir.yaml      | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.yaml

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
deleted file mode 100644
index 6dd6f399236d5..0000000000000
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Freescale Vybrid Miscellaneous System Control - Interrupt Router
-
-The MSCM IP contains multiple sub modules, this binding describes the second
-block of registers which control the interrupt router. The interrupt router
-allows to configure the recipient of each peripheral interrupt. Furthermore
-it controls the directed processor interrupts. The module is available in all
-Vybrid SoC's but is only really useful in dual core configurations (VF6xx
-which comes with a Cortex-A5/Cortex-M4 combination).
-
-Required properties:
-- compatible:		"fsl,vf610-mscm-ir"
-- reg:			the register range of the MSCM Interrupt Router
-- fsl,cpucfg:		The handle to the MSCM CPU configuration node, required
-			to get the current CPU ID
-- interrupt-controller:	Identifies the node as an interrupt controller
-- #interrupt-cells:	Two cells, interrupt number and cells.
-			The hardware interrupt number according to interrupt
-			assignment of the interrupt router is required.
-			Flags get passed only when using GIC as parent. Flags
-			encoding as documented by the GIC bindings.
-
-Example:
-	mscm_ir: interrupt-controller@40001800 {
-		compatible = "fsl,vf610-mscm-ir";
-		reg = <0x40001800 0x400>;
-		fsl,cpucfg = <&mscm_cpucfg>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&intc>;
-	}
diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.yaml
new file mode 100644
index 0000000000000..72736f6f5c24a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Vybrid Miscellaneous System Control - Interrupt Router
+
+description:
+  The MSCM IP contains multiple sub modules, this binding describes the second
+  block of registers which control the interrupt router. The interrupt router
+  allows to configure the recipient of each peripheral interrupt. Furthermore
+  it controls the directed processor interrupts. The module is available in all
+  Vybrid SoC's but is only really useful in dual core configurations (VF6xx
+  which comes with a Cortex-A5/Cortex-M4 combination).
+
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,vf610-mscm-ir
+
+  reg:
+    maxItems: 1
+
+  fsl,cpucfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The handle to the MSCM CPU configuration node, required
+      to get the current CPU ID
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      Two cells, interrupt number and cells.
+      The hardware interrupt number according to interrupt
+      assignment of the interrupt router is required.
+      Flags get passed only when using GIC as parent. Flags
+      encoding as documented by the GIC bindings.
+
+required:
+  - compatible
+  - reg
+  - fsl,cpucfg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@40001800 {
+        compatible = "fsl,vf610-mscm-ir";
+        reg = <0x40001800 0x400>;
+        fsl,cpucfg = <&mscm_cpucfg>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&intc>;
+    };
-- 
2.34.1

