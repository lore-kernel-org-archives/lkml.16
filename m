Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6CF2376FF;
	Mon,  2 Jun 2025 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873405; cv=fail; b=lhp952us3SnoV+xq+CTyfEbvPdu7uHAXFlR7Qs4/h1/PuAGPTE0tHcAZWcVznFwDxlom1OcZOc8BF5mBHaEImAKhH38G5VHhHtdFflQW4ENKIBdStzut+y5tTqgbCmtxEtA8qQAkLwxkizNCEya9xUIkczqrc2cWskkgWW6qWiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873405; c=relaxed/simple;
	bh=qiDy+dYgp34L6hG5LpObQqvrhwD6fepaQsO3FzyZza8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MxfgVUw0T2I5uXpNBDqK6mLo0AGhHn5/1JSOYzA0sLbw1tADcBAsvtV0gJMuhCO/O1t960V4/wvQf8RzEJPSAS/RdyrJD2xM92/k5o2zPmedjoZSFGselPYKmu9yklgm7grOUUFn29huE9YiPk8q2xJESPsT3CHstCFK3/QZk3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VBsT4GLK; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VBsT4GLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pgr1/72LfVuWaDCg2M4a7IurwZxsUZ6yiuow+SYB81WGaZuNY9n1oEbE7umDwMzcBKY5KwwTFV7Lim0C/O/Qom7jhHUMG3E5yXXxTAsp/pAtZG7P6kKSYBXOP5fAP3e+0NY3I2KEOUKPJKbxieaQBJUfabjMdaR69aIczTQzANnngfcXeNfpV+LmA6Rd6uU5ctlgma2WVyIawCxoPvWo/kFya5B5ydYK/8WQzgYEqU2OgxDtVI6lryWRSP/A/7+Nzdlqn+KynnxOEHVUd2irrN5neKzXQVSxdpX6iqbOsp4Z9JLFO31CmCm6zjLS5fW28Z/UoMcn34enDOtKTMxC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW2gZrk/6cvMaQMCa/chQEXaKtBK5fH+ldv7x6PwQQ0=;
 b=GwBKmf+sg72kl+hWFtlK58/zAVvs8T4U+N4UDfstmgWmQqTV56Q9lksMi3MCYeUeyhLxGhxPD9r45blePoAf/fuYj0JNWY+jLf0FvZzZINJ/KccIq6HMIqvCNK+PRTL6T2bstn3clLpEKi7ARh/dPNnp5DiC+Oet033/IQEyYFx5VRS9gjqNSocRWnzXWrMrFAfdBGEq6bsONXZMi9Uq7YU8e5vu4QPBmoGmDO1wIUPFgtceuhIsEOI9tmubwyn2U017EfLFXiXj1Z6pDGBkz6DPSQDvLqTzZG+QmhzCiyPrSbkHfjnhVJU+CvREKmiTs+FjieYjKZuD1P0OdqrvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW2gZrk/6cvMaQMCa/chQEXaKtBK5fH+ldv7x6PwQQ0=;
 b=VBsT4GLKqga6ZiiZDlnytWcSxpLoox2YpvxvMFW2GXFumMm63peLIJNPfU+3W8NhEKLj2IfJJIsh3w16scA2yDGnGruSFYKjFsVgOpPl4oGkuuqQLa80dfPetc+Tud9n5NViUdFgbHwnw7FXGZF/yCo2UdVMPj/OlKWXbo6PhCfchoFRKEwj6TYKRlYaKz+oEevTYkEOrg+KlOtfTOynIZbwcjwtRQD6WHDV1Pe3EeWFKvuo59UlG6CPRLk7JSj6rzR3prnpWedlIcvLG6zdNcf0vrfAEjZcSBEXh0X0cWIiM5fW8FGBqTHFqamZycrY+n9BGCAklOXu2hRoUH8vlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:10:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:10:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mtd: convert nxp-spifi.txt to yaml format
Date: Mon,  2 Jun 2025 10:09:45 -0400
Message-Id: <20250602140946.941159-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: d365d06b-de0b-4644-05b4-08dda1df290a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pJRokxTCGEq2Rfp18XGvael9RLTMxneOo36/ekIBVw70hxmja1eNesyjf4Mr?=
 =?us-ascii?Q?Ko/XUz5MfCI1b9+q+thv7P/XumBSU3y6Ext3/EX95cTAlavo7K5F2aVZRDkg?=
 =?us-ascii?Q?1n7ac82S3t8rrLPFJQa6Sefb5DLpQbeJr94QV7li1aYF1o6xOrDYTD4a+EvQ?=
 =?us-ascii?Q?3+pw8h8ih9YHzKZpS1DEwuynCtMmxz+tzy2peuvGw3tthLIklm6DODkkCgNa?=
 =?us-ascii?Q?0ysyzdouv5qLQwstK2WmSbIHrgYX+4mVi2VBjdm0WKATNOqBqQSsjJTapSPu?=
 =?us-ascii?Q?mdlOVtrv8VlGQVhvPRxKMi/qHbFNT58Ifb3NgcdXziFJow4MtHMvrlC7wHfC?=
 =?us-ascii?Q?LyZcX0nXxzaP/j+lwyXAJ8a7sjuki10zFRZLcTXP07xNfbunS0kOHbE5pUn3?=
 =?us-ascii?Q?qVH+w0Xx1Wuie66K/Km7hA1gYa6jVhC5YtsMp1swaJvfvkkFCC8+cexQ80AB?=
 =?us-ascii?Q?FxhZBglTtncrzqg9W8Yyg4KKET5MWV+aTVwfXXKcBXxOBo22hfP7NRGMhTIx?=
 =?us-ascii?Q?J8Xiy8XNNv7CWc9fy/OQQAMPwwv6NCdrJneKvL7s0527pQPMICjFUcFwTA9Y?=
 =?us-ascii?Q?+yuqD9ewyIR7vp73vh0HWYhQLSYrvyCy8HHnIVyUNIQBjFeHCGxaia2Fmk3J?=
 =?us-ascii?Q?oys15h5WO0E7hhht2HPuqr64+lsho12JJRI4EqFbC67+NVskyDPHCQzpLnlx?=
 =?us-ascii?Q?fPnKOL1UgZ5Cu5cHLaQ9ZGzuQwk4ll+ogV9EsU47qPOM5MkDqLK0yF617GZm?=
 =?us-ascii?Q?xIcDqVsJWHu7yqnbgptPmCJXayNEfTZ/XWBmeBjFrCMYLTmKZ1GYBjcH3nOt?=
 =?us-ascii?Q?i5CGZ3+9HwgaJqLGN0YIcjgSjLxSiYeYxX/QA3hjvXliXkiluCX+9WCNlSWd?=
 =?us-ascii?Q?vbKufoCUfPPHm6WHM1cy1lU2MYNX9XOo38wBYpW0ldaOnj5U9TTBbTKrBs2c?=
 =?us-ascii?Q?xzUoXdM7HxD/H+NlMaU9Ra5WTbdklwIGB7bz9vKRUlRveU8qtruEHSdormcW?=
 =?us-ascii?Q?fCBnGRecZb8fAKap7Pfl4bt6yo8WAis+EXNtjUJ9McghvFfsrIT+zoWJI9HK?=
 =?us-ascii?Q?dDBU2C/REifUD0ab2OFzbx1yxrs1i+KugsWHqRTODzpNxe9fnn1OrWiHgCBA?=
 =?us-ascii?Q?NaW/JI8RzrMAKOmv+4ivdQp73q5+APqWUZebSCMlKMyfrP9T9sCkrZtde5yP?=
 =?us-ascii?Q?CZbk2ZPy14NiNldOR1Kfzz0l5ma/ON2kf0OefnOnvqXVvpf8h1TWA6cuUVLR?=
 =?us-ascii?Q?+O37I1hVDfh5HEZrb8s8nzWQuvD89GFYaMtEkB4FzzNN3zgEZUuF5Wmrz88S?=
 =?us-ascii?Q?u+QQBCDQpwwKT4R2cVKXczkueK281yLxc0J72ELEz8tQPuaiQIu3pUDoWnMw?=
 =?us-ascii?Q?qlB1Rin/WuRUb14bVlQRDZXoqeZmcl+fj4qQKys+Bay4Eh8bvCVMQ7dHAYr8?=
 =?us-ascii?Q?MUnt36tWrgwjTUqqaDZaOGvosOV90CMh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7d2N66ZxxARAKTNTj5db7iraKhywLiZAnsJbWX8S1dSn7Zm/bz+Y0KWdtGZs?=
 =?us-ascii?Q?oqUO1uzMAi8vvLGKuac78RJpuiVyspznah5XbYA45o+ra3fH1ktzDo2BHPRX?=
 =?us-ascii?Q?ood6VyjVIzE/tWXv9BM7cE6/Cz7juxoy/Tdmr5rTdu240UlHJm1S12LletU1?=
 =?us-ascii?Q?sGHAvTZcqYapgeaBwf8Z0xe/TvzZa+A8z8N9HUjrXuf/l5GoPlUkZmo1wc/u?=
 =?us-ascii?Q?cB7YHTe7t6S6+GddllrCY8TYCkKM+YM+GqGgfqVX0qBuLEwjBaP9IefMmR0F?=
 =?us-ascii?Q?hVWJvo6luGuJXL92zzQCIE/DSjwW/0fsNkFp3esw7vJI9wXq8Fe8/J2qtM30?=
 =?us-ascii?Q?j3Ee4kOh6xTtA7c4XF6kOLLyR1fdbqebYHhiGzaG/yW7FsHXlQC5nRoFBA2C?=
 =?us-ascii?Q?hfR9R5OE1CaGgM2rw3n0DpWbMGksdIcJWCS6VBn9nSrOLogVqv5ZLzGiuHWg?=
 =?us-ascii?Q?KUwxN+nvWOoyiGcuTW/QnBSoUysUYBhkeJRF2aLfI/QsXZzvTvJCxmkbr8QK?=
 =?us-ascii?Q?B4SVtv/5yqx8WaEupNJIKyhfEkFTYzSbfo2ITULYYj5wFUDVJvsccWBStkH2?=
 =?us-ascii?Q?4Wi1vaThXW5ZciFaWs4HSvZRTK8Oz5NqakNTocmfinKcs7jUEdQVDCkOs0di?=
 =?us-ascii?Q?XHQ9u7c+o6WlowyIJ8jsc/cwMcPWrsKxp6wW30NTbM3NH2TBd48l603aU3Oy?=
 =?us-ascii?Q?brI+aUir1r3ngzmZj48rpnMhXA/AYU2vLj5dagIrc3GoQiTG9V50wA7vYAfM?=
 =?us-ascii?Q?H1IaS7dn50YzqAPAVD5QRpy+qIM8CBmsrfUvrjoaBVrH6Ct673OKPcc5LA3D?=
 =?us-ascii?Q?sKyR/SkbpcdLkvWz5GzWfmD4SBNPl3QbvxvwB7aJXCCdaLxeGda9mRucdm5E?=
 =?us-ascii?Q?Zo4jnsYRSUbmNfCsAyBDXwqnVQ5s7n69fuFSRCx+IxQ8L/KQT5biakyxGzKG?=
 =?us-ascii?Q?6LqFeYNycnFxz5nN/QulQqJDurDnnZhOF9l2eG9IQAnrkdmonTBafC4q34MA?=
 =?us-ascii?Q?xMK9D5kpA3Z0n3yfKnOvF0H0U3bpPyjGt6SKT1sJ846dTEKUwbaZqc5DiuxZ?=
 =?us-ascii?Q?QQiDboMXTGI2D0LpycLJC+GRCCIl8muySWvCTVHIEno+hKclnj76wv5i3lIH?=
 =?us-ascii?Q?pb4fmy/if/ViOWl8Y40sO8NFZrjY+UD90ewpRB27vO62wX5TxvfxlpO+x587?=
 =?us-ascii?Q?u7cJwf2hnVwhIo6GxvoSk1R1MIeVf4Bx3ROv/wJinXtXp5Xy+uTEHQKWTIXV?=
 =?us-ascii?Q?rIJpHWyN79CUI+qbW6BSjqcgqhiD0lPWi4qULC3b75DyFX8EaaYS2OBCl+jZ?=
 =?us-ascii?Q?UCcQcmG6Cn2pULK82ivnWIuPaGLP8pE9oKN0MefHrKYBMOkUUphmb09l8tsJ?=
 =?us-ascii?Q?F/VTCy0W6IMmc1ZSCZj5LQLZWYpg+1pVM+NCLe4Tx+8zMnCiLau//dPNeWLy?=
 =?us-ascii?Q?NSejCBRko7cHWQOfzGdteL8YGyX1yew60Ewxo5+XVC//Uu/8NHX72H5d1J8P?=
 =?us-ascii?Q?k/MVaNygZlkAlikeZe4gis1Qz8kiqHCzt21SooKAoQFIAMkaU3SijTnoPw3f?=
 =?us-ascii?Q?sBt2z/tBnycHGCu7Td6nnwt/7C3AgjTyVES0lRGl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d365d06b-de0b-4644-05b4-08dda1df290a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:59.9568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imEztRbSth3hSkkcjMVUGzRyrQ+W9kaMqI2dRP4ADeta19Xj6gdNOnBd+2VnPQ05XsSEiPBE3aXGuK/mSdzXEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846

Convert nxp-spifi.txt to yaml format.

Additional changes:
- ref /schemas/spi/spi-controller.yaml.
- remove label in example.
- change node name to spi in example.
- remove child node in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/mtd/nxp,lpc1773-spifi.yaml       | 74 +++++++++++++++++++
 .../devicetree/bindings/mtd/nxp-spifi.txt     | 58 ---------------
 2 files changed, 74 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc1773-spifi.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nxp-spifi.txt

diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc1773-spifi.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc1773-spifi.yaml
new file mode 100644
index 0000000000000..d6efb9417b7a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nxp,lpc1773-spifi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nxp,lpc1773-spifi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP SPI Flash Interface (SPIFI)
+
+description:
+  NXP SPIFI is a specialized SPI interface for serial Flash devices.
+  It supports one Flash device with 1-, 2- and 4-bits width in SPI
+  mode 0 or 3. The controller operates in either command or memory
+  mode. In memory mode the Flash is accessible from the CPU as
+  normal memory.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1773-spifi
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: spifi
+      - const: flash
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: spifi
+      - const: reg
+
+  resets:
+    maxItems: 1
+
+  spi-cpol:
+    enum: [0, 3]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    spi@40003000 {
+        compatible = "nxp,lpc1773-spifi";
+        reg = <0x40003000 0x1000>, <0x14000000 0x4000000>;
+        reg-names = "spifi", "flash";
+        interrupts = <30>;
+        clocks = <&ccu1 CLK_SPIFI>, <&ccu1 CLK_CPU_SPIFI>;
+        clock-names = "spifi", "reg";
+        resets = <&rgu 53>;
+    };
+
diff --git a/Documentation/devicetree/bindings/mtd/nxp-spifi.txt b/Documentation/devicetree/bindings/mtd/nxp-spifi.txt
deleted file mode 100644
index f8b6b250654e5..0000000000000
--- a/Documentation/devicetree/bindings/mtd/nxp-spifi.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* NXP SPI Flash Interface (SPIFI)
-
-NXP SPIFI is a specialized SPI interface for serial Flash devices.
-It supports one Flash device with 1-, 2- and 4-bits width in SPI
-mode 0 or 3. The controller operates in either command or memory
-mode. In memory mode the Flash is accessible from the CPU as
-normal memory.
-
-Required properties:
-  - compatible : Should be "nxp,lpc1773-spifi"
-  - reg : the first contains the register location and length,
-          the second contains the memory mapping address and length
-  - reg-names: Should contain the reg names "spifi" and "flash"
-  - interrupts : Should contain the interrupt for the device
-  - clocks : The clocks needed by the SPIFI controller
-  - clock-names : Should contain the clock names "spifi" and "reg"
-
-Optional properties:
- - resets : phandle + reset specifier
-
-The SPI Flash must be a child of the SPIFI node and must have a
-compatible property as specified in bindings/mtd/jedec,spi-nor.txt
-
-Optionally it can also contain the following properties.
- - spi-cpol : Controller only supports mode 0 and 3 so either
-              both spi-cpol and spi-cpha should be present or
-              none of them
- - spi-cpha : See above
- - spi-rx-bus-width : Used to select how many pins that are used
-                      for input on the controller
-
-See bindings/spi/spi-bus.txt for more information.
-
-Example:
-spifi: spifi@40003000 {
-	compatible = "nxp,lpc1773-spifi";
-	reg = <0x40003000 0x1000>, <0x14000000 0x4000000>;
-	reg-names = "spifi", "flash";
-	interrupts = <30>;
-	clocks = <&ccu1 CLK_SPIFI>, <&ccu1 CLK_CPU_SPIFI>;
-	clock-names = "spifi", "reg";
-	resets = <&rgu 53>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		spi-cpol;
-		spi-cpha;
-		spi-rx-bus-width = <4>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		partition@0 {
-			label = "data";
-			reg = <0 0x200000>;
-		};
-	};
-};
-
-- 
2.34.1

