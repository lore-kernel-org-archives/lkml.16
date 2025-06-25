Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A7C8EB;
	Wed, 25 Jun 2025 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750887857; cv=fail; b=qHfaf5BLXtS6RYdOzkQl6m86yCuNyeyAJwKPvUKG/kIRr6rhij/qY2qNijV7ch9JSWffLAj1h9HVdiVPAFommMid2995KU9sOBuReURAoagaSUvLu6wTXow+poiZTyMVOYhivXyk6dFB3OuCc/p5X4v/2YXrHV0YNhMczslAK14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750887857; c=relaxed/simple;
	bh=q64pCPNIOahdpwnZJmWnkemYgzoWaD7PNsZgWF5iK3U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ekn2XcYOAaJk/iucTAhM3O+E7vzkauv905j44j4+BszZcDeQj/78zjR90H04ioiuwI9sQvl3FMUglLbFJWqfZ5rPtIR3UuVD9OCx+gAOmWIMOX787TNpwZKmD5Q84ZtHDnPvWXPwefyE+qlEhKRySn3EJW7GwE+tbi3PYwbCxSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B2+fY6Om; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B2+fY6Om"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/6TMVpsagrHZVQZvb2ZoGaHwohBLxgAUFGtOAe0HpbcTGtPpBPqkGlug2Ue9oNff8qd4zrS8oNIU7NDrsr8rLXHTZ60xumasoXOOAe2v3KYgqaNrWm4Ms3dThdpIvL1izPqyCMg5/cxMkrWa8i3NqabtrIOodp/bqa+AmJVqrV1qCCelJ8A//rIHe9stlmQPfZX709mjxDOPwQg/Q1m6lwKyGS88rQLO/GhdKKftv5IhillWn13yFfB+6sB2k4b+H3LzPAT1XPznlmifYhSwq1dPNHtJAIO/Atdp367tGhIyjmAQMHHetTf18fh1hSsJfq1QXOizj8FcQEqjS0v3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6wsomwJ5NTsYk9/o+KKJiesxsfM5ueBFBv6OEB7Xkk=;
 b=DTxVPMXYsV15UTzgCEM8zO/c+RMjr34xORy93R86ymeFwHZDmHWyc+T6565VhWmFlJscorGk39IEvfLM3tfhHHu0/SNfCMag5L1L4LTprb+yPln1Nf709TZmYXpyK21DyJ499jjAKBkj3jXKsDT2c/746SnYIFgyT15C6Ru+zuPLT6RWvJtYpttvD+IztAvA4n70p8LrQ2URvGIkYJgTAgillLMFNwVKCnDeRJDFQlTF0bFuEtdbabManMiYBe2v0LXnofOzIbuDaPhlBSiqRCkVjZjNWkOGxfJgU7dj+PxcN6D8ZKrFdUr8ppJPlAA1mgefjK7TC7D27mTIQvF64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6wsomwJ5NTsYk9/o+KKJiesxsfM5ueBFBv6OEB7Xkk=;
 b=B2+fY6OmgbVcLcihZmgqIciPiwqljbfAGvH4HIIWdPjh7N48arlXDTvEJu7liNzViNmiSjUZriRN2hF3onDWl3Q6GfVsYDk2u51Pf/amYmlesorivFVWw4jbJqER74NdW5FlhMk+UXPrfv8GVQw/UnotwWIzxw29fKk9TArNVTU/I69+mZHoWjSSsAxa0z4lvysLKD7Loq+78lXG2gyHSXBYb6kVenyCoOaINXZea9nq8Rl9dlZgVjqpV9IxfkFyOuJMCyaFIhnqfAbiRoFefVM0yrCOGIJEaTYzvlIDlXfzgnW6NL6iPbzKGdmSL15tP55XPc/D3W9F+PchYa9rJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB11220.eurprd04.prod.outlook.com (2603:10a6:800:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 25 Jun
 2025 21:44:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 21:44:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml format
Date: Wed, 25 Jun 2025 17:43:53 -0400
Message-Id: <20250625214357.2620682-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b85720-f3b9-49e0-f8f8-08ddb4316bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ifrEAPQOH1mG+GNdn8/TcjU2KqkWZS4Atv3uPSAWbBWZ8g46Ib7LrqcAzrBA?=
 =?us-ascii?Q?PfCT+V3wSZBhFoOEMwwbUB5WUtIN9l/KSnbcQ+caFonAbtJzacg5XQ3iHiti?=
 =?us-ascii?Q?MZjsHDppd0qiJ1iD8O2OWEB6YDn15dVTZWeGFETesratH0jMqw8HcECB4VH7?=
 =?us-ascii?Q?WO/fAbchguG6boKT4jIYXZP+brPE/SB8OQKg409BDmz+CQxynCbkM4CQ5n7E?=
 =?us-ascii?Q?92A3xtJe1qRf2tXNwrk0ASilWZci16LDOhDN2hyefuVPWAwanDCX3v45TGmp?=
 =?us-ascii?Q?rts6vl26rZ7HxjKhJ9dvY8nBj/27u5cjnAnxy29a05MOLzg3XaheWxVO4Wz+?=
 =?us-ascii?Q?AIn0puSUsO0KlR7fdjgWVNFY8ezrZbevQGMJtHBR0YTI8s0koVY8JeZClqjt?=
 =?us-ascii?Q?wh36cx5oqEDW2CmmJYHtvYCMKQk3LdOv0hJbKFvYIr4S2frKUMF8C1IK0Y3t?=
 =?us-ascii?Q?XpPecoonF2rutPm0sfg6VV5DRwWdf9yy9ZEvNuo8aLXbcH9fJIrrTmP7mMu/?=
 =?us-ascii?Q?LWC4nn+0Unm025YXiTE/wfsEoXDHrc1otWoEaSYhC/awouPlAYaNjs7Yfu6W?=
 =?us-ascii?Q?4Gs4JSV944Fp6HcOJa3MlOIk4anDc2ujPzy97IU57JFrq90a38gPPrXLOshb?=
 =?us-ascii?Q?M9MD1Y/BUuA4pi/ENbO35ecuMQbL9B+rkEFuEWSdLzl9MEKXl6FdW6qWEBqe?=
 =?us-ascii?Q?D99mbH1ygjgMMHIWsBjd/FOxyX87yvF2X2iuBGPD/EgavYrnwbJy2DgZAlRC?=
 =?us-ascii?Q?bzgBoenLAwNru6qLFOyOzZWjlPWHSGj5LaRpcbSQs2QExqZTFDac1d46ZwYU?=
 =?us-ascii?Q?CCdYvYRK9ly0kvSu4Obpw58THqKqebdQlbi02Qr5mTbPQdTX3XcnHneRr66t?=
 =?us-ascii?Q?kMrrkNhk4zW599NV88WXPlcHIMkfKwUA8hA2pmDB8gC47FjgpqLHcPdRlirp?=
 =?us-ascii?Q?1cCDTz+XkpS/l1AePVk8Ne6L0k45HMFrJZXTAPFKSD0e+Hlbsc36pIteZEIL?=
 =?us-ascii?Q?LEcZRxvdbm0oJfgqHHAHnBrSBoktAUjAGDuoCtUjEKj2tEb7aWstN4bAjdPM?=
 =?us-ascii?Q?F6eBVcOroU49+DN5CQ5MHaBZJUi1d5ZdWL+7ky0jkXv3HQsEeswRtYcGjdxI?=
 =?us-ascii?Q?AQEk+wsYIbD9ou/RgVW+1Y5PYIqMa3iVft/TVg/hnuwmJF4fFASWZWZ3I9l5?=
 =?us-ascii?Q?fj/1J1U9uvu4IuE0g/HAWWCwu+NtQ50A5Nind/szwmQN5HvmMp0vP+dir4GM?=
 =?us-ascii?Q?n/a7T2FtmOfYtqIRPcb0JnldokW70ktg7Q1S8GF/jCYC6d2fLcVX7PTpg3Z8?=
 =?us-ascii?Q?kDvD0ABTYMXuYkkrcN80uRoiBxKGtS+w+uNg8rQ+Av7Q3Dsg1/J4D/u6diyp?=
 =?us-ascii?Q?RIkaEDIZVhbbe3ZCY0UxyrCLqg5j1iBcwaID2UfZI/q21cE9Xv6SvmKPx7oc?=
 =?us-ascii?Q?gsWaksk6dqL/N23fXi39hwFwaB4LTQD6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s01rG2qxkssS6CGJ2d1Qz3iXWU9hTwriKVrG6eR3vbOwkO3M7gzQZBEyHSlI?=
 =?us-ascii?Q?PLQqchCHLFhGjsB+PeS3olwbh0fJGArzesPetMQK2bQWE2fsaIiz7nm/4IpO?=
 =?us-ascii?Q?X7glwFKx54Inm83Kd6m1ZOCxKnSTAwQ7F97zd/ZCDuc9NNQcgvv4BxrWozr2?=
 =?us-ascii?Q?nst39rqWMzE69cfm+7iEeiA8m3qZbfRHtCtU6x+jjmWljhFks3+uUVaYKpc+?=
 =?us-ascii?Q?DjAwUa9Z9kD39NLQl0h+HtSnHc2hv8etyTQ/2zof2iMu6sTtHxFObypJLTiH?=
 =?us-ascii?Q?lGrRReewjtByk3DXnVUQC41iSeo8DGFvTlaa6+xT9Mp9JtUoYJCw6F8E6+eI?=
 =?us-ascii?Q?9HPvzzukZXbKziLFYLENC+8LQOH8VjArUhVAJOes6N6diKIb8k/GtoF8A2pr?=
 =?us-ascii?Q?qIZR2v5hBiF3MQeAgvJ/pJj9ofwJWitZasErSHmchZH2FzEYdB02w53lmcE8?=
 =?us-ascii?Q?Y4oUMxH/Fgq+hZaQOckRBTtN+nI4RJM3FKRvLtLvHW5CJJ3W6OMpUWATdp1E?=
 =?us-ascii?Q?AuHcZD9vYyoSi5iBm/2AZ+3PG3rsAl1pWXkPF7S7AHTzzULVU4KBbChcZpJq?=
 =?us-ascii?Q?saEmrg8fQ9dgyk0bRixp1ZNZk7q18OdbmhO8dr3jOiuu63Pl00djjUWbTkKx?=
 =?us-ascii?Q?Gg5TLd/gnVomfytH/4nN1zhFaTtTc/JKrNEwjDx/4K7m6vg8CZTHy0yW+sDi?=
 =?us-ascii?Q?+ke6reK18Ta2fS3+7ZL20hoKkxputrl68pVYgmcrni5YSZ1cD5n/6ioa2cQa?=
 =?us-ascii?Q?CpLwPcbX6aXBpMWUPRUM/YKL4Fjsg0khnIm9L52KMc5Su1JRkxbvOuCs1wrZ?=
 =?us-ascii?Q?tKPeQsfnhxeB+bzxsP2xhNuzfQAv3BuHoQ/ul0Ns88HZnIE+kDDFPgb97U7X?=
 =?us-ascii?Q?z1uS4c+/yEhS5XgTcCxMnwOOeMoQwA2BCW79IryIHxq8HnXoSEwCJgypzHG/?=
 =?us-ascii?Q?sC63An54O/eC+2dO7jiaK2ZSGiYRMX/FLZQlpj6MVYOCag9+ebXzO1FV6WgP?=
 =?us-ascii?Q?blnjfdK+THUN5weo9ej8UpEZMX+ZnfOybe4HuTHguB0s7dac2w7INIYrkN/c?=
 =?us-ascii?Q?TDhJuljJjOwcPgtcwWYAjGRg6yxnIr+/HEZW9Vsjby1+UscwLsvq6zqviKUX?=
 =?us-ascii?Q?bedHMIZKqt1r8TUNn5/Yt4SKhOrhlC2EDxiSVHsnLwxoBoPha6Ia4EK7KC75?=
 =?us-ascii?Q?arsF6MOauw72eW/y5jvPcEXNTucZolurciqEF+zpezuq03mO+eyaFSvWT4br?=
 =?us-ascii?Q?tHPcfRCqWSBgVGylN0IK3r5Hj3cItG5Et/8O4PUPYHwDXYQrDjC81rY/TLfZ?=
 =?us-ascii?Q?BLEPmkdG2LKHnJb2BqjNUy3pTDHs8iF3+QOpKCWAYs49+JXS4oU7Yx34LiE4?=
 =?us-ascii?Q?RNFU3pgj9/BkA88dmo3MsmGWughNicDCnWDyrDCKpT45h7CPwvBfL9THftkr?=
 =?us-ascii?Q?QaqrUpuaEi908OKiztc2ZdNMezShNhntehdXTTlDzFwVYrPDSNGDMksPHp5z?=
 =?us-ascii?Q?dGN9OZap5JyCg4JgNecEvpkR/cuHPWZjQfESNsRt90mgD3E2KqFPggyxugqs?=
 =?us-ascii?Q?zpOuyzJg0R+LJL6HymE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b85720-f3b9-49e0-f8f8-08ddb4316bc7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 21:44:11.4458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQds+8g55cC2futYSGjCEybgSRl99tQ44lpHalFytPRwBNXPF+P4diuup2D9/ZF3PHpaSDcuymWtL2OCFimAVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11220

Convert lpc32xx-udc.txt to yaml format.

Additional changes:
- add clocks and put it into required list to match existed lp32xx.dtsi.
- remove usb-transceiver@2c at examples.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- update commit message by add "additional changes"
- add clocks to required list
---
 .../devicetree/bindings/usb/lpc32xx-udc.txt   | 28 ----------
 .../bindings/usb/nxp,lpc3220-udc.yaml         | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml

diff --git a/Documentation/devicetree/bindings/usb/lpc32xx-udc.txt b/Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
deleted file mode 100644
index 29f12a533f666..0000000000000
--- a/Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* NXP LPC32xx SoC USB Device Controller (UDC)
-
-Required properties:
-- compatible: Must be "nxp,lpc3220-udc"
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The USB interrupts:
-              * USB Device Low Priority Interrupt
-              * USB Device High Priority Interrupt
-              * USB Device DMA Interrupt
-              * External USB Transceiver Interrupt (OTG ATX)
-- transceiver: phandle of the associated ISP1301 device - this is necessary for
-               the UDC controller for connecting to the USB physical layer
-
-Example:
-
-	isp1301: usb-transceiver@2c {
-		compatible = "nxp,isp1301";
-		reg = <0x2c>;
-	};
-
-	usbd@31020000 {
-		compatible = "nxp,lpc3220-udc";
-		reg = <0x31020000 0x300>;
-		interrupt-parent = <&mic>;
-		interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
-		transceiver = <&isp1301>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml b/Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml
new file mode 100644
index 0000000000000..e580575274f60
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nxp,lpc3220-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC USB Device Controller (UDC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: USB Device Low Priority Interrupt
+      - description: USB Device High Priority Interrupt
+      - description: USB Device DMA Interrupt
+      - description: External USB Transceiver Interrupt (OTG ATX)
+
+  clocks:
+    maxItems: 1
+
+  transceiver:
+    description:
+      phandle of the associated ISP1301 device - this is necessary for
+      the UDC controller for connecting to the USB physical layer
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - transceiver
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    usbd@31020000 {
+        compatible = "nxp,lpc3220-udc";
+        reg = <0x31020000 0x300>;
+        interrupt-parent = <&mic>;
+        interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
+        clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
+        transceiver = <&isp1301>;
+    };
-- 
2.34.1

