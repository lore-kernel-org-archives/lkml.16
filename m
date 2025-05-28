Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6E828B412;
	Wed, 28 May 2025 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451494; cv=fail; b=eik1mqr4SNFACaMEoEW9DOUr91hevKg8lZ87jonAUPW+cD/v7c+bUuhABPjiyTk2GZ54X5SCMX1NargUQqzZO73Ji2OKN6hP4SpUYLU0omUXqfU5RMQKn4ktujSwcVzspO9HfFE/k2w1Dj0G5icZMx9Yxq8OVMCEPDHo47FkUS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451494; c=relaxed/simple;
	bh=ozOzZY6urZundEvZG4zLf+Lpb0ip7fvQeREuna5HTQU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JfZmGRWZLt2WK3m2qzS4X5MLQ5iK1cHtHZGixbuRbq+0x0+lxusJdSboZtzE+uT9/kDDp6VwHaZ9teH2yfuYT63bE7+WQ+V6IgeSQzr+VObgLWmo3QHvBwKGtDXz6bLOxf+hl/FkwGlhSmZfHbHM3rBlkrYRRMkZlmz9QkGR1ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ldlis5DB; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ldlis5DB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LETDBSKx5+aS/ov3i785RXH4bgoZ55xttLtZFtJ7uOFAUY0Wba0nX1nO4raqS4uuqnnbiu1o/FB3CoCLa+uqesYTwJDJK0lJJtuB01ivI10BXb7HxDbtMNBDcuv7D0JE/CpPyR2If9yA3L0PbX1mBO/naZRf29+OZjjrOtw+P9ADv9/hWhhgIKCHDtPTEC3/65ryIXLWlQU+oZ+w7HpmUQ61FmqdBlmgC5YIyos+kyleI96vAvxUtVX3EXyW2wzKLHNvY3vRQN2buO4fm7OsPY4qwBhdFNbU+8TmplVpmx9Y+cnFxvIaJbEtJuFtJrR5DWr325kWqh5WyI3iPsQ/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjuWdef5oVzDmwgaKRtYhv2671eT5+5kVduoecCF15k=;
 b=CVpn6IEMP+/8TB75ZhqP2VkeQ0EG7TtqmPGYKo6AuI9XRPFfPrftp2GNh/DIZx6/QYfZ/5H/szmKcwtg5ppBEJ4Gi3nNYxCHUIIShuBjpcDQdmvLAXEkjlWzr+9KOS2lqsRpKzD9hcH/PH0Z1jJY3F8XVQbI/meRw7a6kHSvt+U9BqYHN6B+mDTiTlBiG8p6vrKycNJNOvKJ6Ta9ESHFCTclq5Da4IjvMHEKBmQKcKY9mXrCT84rpW8enKa8i/nZ8rx5XcpbAXWbvlzayoHObtvInmTTCBVrUX459J13J57qUkWH8lCFaMvsHCDXSeKkuZe/0D+HwXBdGmFalVOo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjuWdef5oVzDmwgaKRtYhv2671eT5+5kVduoecCF15k=;
 b=ldlis5DBESqPjx3wiGp5uylTZ2glgp06tOe5H3lspEgzn8CX34BjhJrQLNO7qTWp9cz+hA0u+0Hr7DOqr+hUBfuXHsCTrCbM8/2iQHXAdNIcuDdR5vNguWObqE2yilC/WbvGtgMPKwQFzTHvonDG355qP1HSUgwJNXGjtW7ffMIAbZzKeHjvuUns4dXyPwEQ47zDaI75R/ZntWzStQP9RAXX30Bpru+TXjqdGtLf9yjG0z1V0gliTvEbc0cPWkEBe2RNUQzLxow0uLgVjh1bxrcCDpzb79UXOUQVpqrXk94V/XHp8D/BGjoTjuDcuXbWAkCoqc7LuJHMNjiTovF/Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6925.eurprd04.prod.outlook.com (2603:10a6:803:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 16:58:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 16:58:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt to yaml format
Date: Wed, 28 May 2025 12:57:54 -0400
Message-Id: <20250528165755.692264-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:74::44) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: c0aa5a42-714e-43a7-da7f-08dd9e08d2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+hbf3H+Gw+OCIp1Ygqo+jePT6dJokU7gEMRxY7FLT7Ex4fzZcMDAqZ2OSqdp?=
 =?us-ascii?Q?GHTdgRJyetwUMBdwIFW58jhdQ1cjVkdLDMOzrOuQ/RM+hQj/c1WR/7IzTvKi?=
 =?us-ascii?Q?IqjbjcahlbhcJQ4DqBUCKtQVka6U9UN9Rgot70iXWJNq0IlKcWfNt/5rXK/k?=
 =?us-ascii?Q?NQ0+1UuDNl7TwNmI80Af0V5lmHDz9GLfZU+QBHiVH/ySiS62PkjW9Wkvtflb?=
 =?us-ascii?Q?yGCrZybL4ScMfUKrXd5V6OX0Z+wXRNrTpHo4c42Xt2y84lCWdyMl0juVnk6q?=
 =?us-ascii?Q?xc1li4mfghW283RxdQ2ZHvcqqS4FH5gm4mtjzI5WTpnDG89lTgu4TvCGmNGU?=
 =?us-ascii?Q?ebYPOi86SN8Mcrb+BChv/FdcBnF/uIBCTVLcQZ0zb04y5Wpk4MfUza0/aQIo?=
 =?us-ascii?Q?rgVungpmRZD9rQKaDyOvOJbJDwJaZZFM9cKDKwMZ4YL+cg1EsHiIPtxxbDfI?=
 =?us-ascii?Q?42kFKMSN7IiaVSwj6BdT5iTaJtZtFTys/fxiPfNEuNYgdTjo+Rjb1lngMv+H?=
 =?us-ascii?Q?vBwV2kW9cxBu3Vgn/vV7ibx3nhb9wXPTnD1l8Psls3CpVZF5emSMyWYP/KgD?=
 =?us-ascii?Q?58q/qVB3AZFHVexJdGyW8d5G6A/CgBmyMKdfTFyv0g9Po3jUibp1QVgBoZVN?=
 =?us-ascii?Q?RMFhxDQUfCahIdteqSCT46zHPnRTNqJzHTlfaMTJ7BN+qLeOBQeSBYCElHBw?=
 =?us-ascii?Q?J//Bx4s1JHrGOcqOQrqdTuII0JWySfQ63F3jzt9jPGwozpNDlPKYnPzqf6v/?=
 =?us-ascii?Q?Q9lQPg3oQ4y/T7PBitCp7f2H7pG61AcBOeeDOdFaj3uVqShKPSPJ9FYudKV2?=
 =?us-ascii?Q?ypYzfbbMS4acG3zkv0QRSZMv8bqvXv+8PL3DjQjYK5KqRuolvZs2OqR5DZ//?=
 =?us-ascii?Q?upJ/fRhd3qnYM37yXDu37n0+JR0CDiug0klrgdqppt16fuUQIjJwqMAIiO7z?=
 =?us-ascii?Q?uSf9S/RJ+GD0qbQ8GT32xG7GmB8PCQSvWNW/+Z7S0KYebE3r7YkSFaVA/e3c?=
 =?us-ascii?Q?kVJcs715qe/qFuKNnNhlDWsvGxXk/PTBKpzDkOPNGL+Ayt8t3NRPyMng0iMP?=
 =?us-ascii?Q?K5aUjXd1kE6IuA2mPBb0M7BD2QTzMiPOsG8HklvXlG4vT2yvYwd8eWpZUAK5?=
 =?us-ascii?Q?19jCpRrBMiqyxogjh+gruFO+aNUhk4DU+F8O+Ou7ntmWNeZyodCc3VqHx3wb?=
 =?us-ascii?Q?PFzovKW30U/BXsv20LrQn1pvW20zedChnGC1ZaPweIEiW5T9R4Fnk8L9yJBw?=
 =?us-ascii?Q?Q+X/MP3MFrhOrZO0vY2LPispZwwTPyMaxQy5kepx+MdwIkQZaHnLe2FfbtMa?=
 =?us-ascii?Q?oYzpfOF8vM7nGYLHDMxPeklbZqzlfKCpcGJVH9ImxEP4rcb/wqyKJk3znwJG?=
 =?us-ascii?Q?rISy3u2g7C8kVpbDr6abH2AkgkLOOHLlYl1iFgeybd5HI8Z61E83x0HBUI7o?=
 =?us-ascii?Q?hAC37WX+fcnMieG9y7b8NIie1yK5wx4V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vzo/uoW2cIhHhuYoybLRF3MWb2mTmm7JkUDwdiMfY83XnXr5jf6DHUuZDvTB?=
 =?us-ascii?Q?XI7YtbXPTTVOPhQv8w3mh3XXx58QXlZa5jvZpzuc3eBiSnUjD5fbiAgaFm7Z?=
 =?us-ascii?Q?v3ybS5u2g8J1C+lfo9tzgoy+UymXZKZlRDhQt2q6XIoUrAZA6E4zriYyrANP?=
 =?us-ascii?Q?6aJ4Y3fecl+OyM52GK+zz9Qum90bdM1nc9mBBeCIqih5fA6QcMUCX+hDWkJN?=
 =?us-ascii?Q?et3dKzAysemgnlajlIi+Bun14YB26z85nO4LtNmAzYR/r9ON9UvqhA2zTy5k?=
 =?us-ascii?Q?yQCaC0/+axzxE8v2uQkJblelnSyfqxYcsae+l7fY2Xg3D2K9ZyQ7ORywU0vU?=
 =?us-ascii?Q?JF7b09tHa8J8ONmRi6vvByo4gDR/1XgoGxqFnD0S/JeKMuKKfBiTDpOFFLqT?=
 =?us-ascii?Q?B/TJBJh4lGJXjYr6t0af+ncJA3l75SvhnT7RMiG2wVLMv/3Zxk9l91BcGGfl?=
 =?us-ascii?Q?6x7VtsnDEQSLKinpd1HOmJ/S6YsXf3TZu/jBIUBT3YHcM3gxqD5eL1oyGjUt?=
 =?us-ascii?Q?PmNpC1e9zR3nZm3lIKuED6FXE6yL4xNUzlUu5bdtqElElTyj3GC4xj72Dc6U?=
 =?us-ascii?Q?muVrFUza9PBbx0c5R7UuH/sh6Ov9fOEvKM5KGOU3715J1bu5PZcMCGQN/mwZ?=
 =?us-ascii?Q?pbeGwbeOB8fQjH7abr0j1FcpJWgfbGAcVWTA6EtBhpCNbr5vAoqS3k1k0Nko?=
 =?us-ascii?Q?UImUSGNX4HZ9Wx8j7cEO2+77CfkEyhMKAVAUaaDtlmqsvF5YvhlOmO2TzEN4?=
 =?us-ascii?Q?Zr2n9m5h797bIhhZGcTIpqoqjfZamjaYpaW2yZRb4rNYqJyUOk2cLwABNUI1?=
 =?us-ascii?Q?nuW7eVWyEBmTPKF8HQo236lKB6jxvI7kW4savwPStkZWWDmpBy1cgxgkmqjY?=
 =?us-ascii?Q?l/p8iMoOyUrPW+qKGmWSSe/7okLdZ8Yw0FUw6v/tn22bGFw1wK+HiDn3Ge5T?=
 =?us-ascii?Q?zR5y2flMNt/SQlEX3tPcagvQEhKFmeMhxK/EmkW8Pv1f47O0eda3pMvbAm+J?=
 =?us-ascii?Q?m2ZXjZ7f+7Lm5oAd0Xd091GO2Cr38zYQnw5LTKQWNLpVMROiouNQzDD7bnL+?=
 =?us-ascii?Q?no634x/FV4Ci3G6I+iRwecVpqxM5tySrkuJcBPjNlYwUAyVrWYkIqW4XOKGs?=
 =?us-ascii?Q?XmE6rQHnKFX/xLuVze922HQFbgvmG2UwDpU/b2/PNMJYZtwha2Xmq+LFU3ol?=
 =?us-ascii?Q?/h8QCWYUvyPfZpB8tJXmQfSsRVIUHH3h5cXTrjvdz/+QFE82sqZSwtFVZTcQ?=
 =?us-ascii?Q?WPAiuPgTKSAd1FT9xnNuZyB7a58ws0xH9SxWVRlsoIftcPfZDjB7RH9peD2h?=
 =?us-ascii?Q?Lodeg8r/k6YWAj+7zCSOdEpumxFRzw0iYc6D/iDmWrJDq4l2bvlbAvPDkpbW?=
 =?us-ascii?Q?phbKHHBLmTRMbkYZjl7skKLhgnpNybXmx2AgHmUgLMjBwg8cCgh5ZQ9BcG9y?=
 =?us-ascii?Q?rNqK++ZWmJEoy6s+F/QAXAsITZahXuYAU9FO2aUuPs4nzE2kQw/x62VXxeJn?=
 =?us-ascii?Q?PiC9x7PTmRiVmA5J7fh7ToFYQGsdsWuaXMu0k9LvgDl5S9OhE4KS92zgypeE?=
 =?us-ascii?Q?WHVanehpp55R7tw+YTM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0aa5a42-714e-43a7-da7f-08dd9e08d2d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:58:09.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IszjMK+vmwx+I/UMGwQxAgPf5eZ2tey43trzmmfj+ZJcniKsxSCYNTqQfB1+LSdIYsF4+yzJE8utX72gGKU2Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6925

Convert mxs-audio-sgtl5000.txt to yaml format.

Additional changes:
- Add compatible string:
    bluegiga,apx4devkit-sgtl5000
    denx,m28evk-sgtl5000
    fsl,imx28-mbmx28lc-sgtl500
- Remove audio-routing from required list.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add missed commit change (all decleared in Additional changes of commit
message).
---
 .../sound/fsl,mxs-audio-sgtl5000.yaml         | 81 +++++++++++++++++++
 .../bindings/sound/mxs-audio-sgtl5000.txt     | 42 ----------
 2 files changed, 81 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml b/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
new file mode 100644
index 0000000000000..d12774b42a112
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,mxs-audio-sgtl5000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS audio complex with SGTL5000 codec
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - bluegiga,apx4devkit-sgtl5000
+          - denx,m28evk-sgtl5000
+          - fsl,imx28-evk-sgtl5000
+          - fsl,imx28-mbmx28lc-sgtl5000
+          - fsl,imx28-tx28-sgtl5000
+      - const: fsl,mxs-audio-sgtl5000
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex
+
+  saif-controllers:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The phandle list of the MXS SAIF controller
+
+  audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the SGTL5000 audio codec
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the
+      connection's sink, the second being the connection's
+      source. Valid names could be power supplies, SGTL5000
+      pins, and the jacks on the board:
+
+      Power supplies:
+        * Mic Bias
+
+      SGTL5000 pins:
+        * MIC_IN
+        * LINE_IN
+        * HP_OUT
+        * LINE_OUT
+
+      Board connectors:
+        * Mic Jack
+        * Line In Jack
+        * Headphone Jack
+        * Line Out Jack
+        * Ext Spk
+
+required:
+  - compatible
+  - saif-controllers
+  - audio-codec
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "fsl,imx28-evk-sgtl5000", "fsl,mxs-audio-sgtl5000";
+        model = "imx28-evk-sgtl5000";
+        saif-controllers = <&saif0 &saif1>;
+        audio-codec = <&sgtl5000>;
+        audio-routing =
+            "MIC_IN", "Mic Jack",
+            "Mic Jack", "Mic Bias",
+            "Headphone Jack", "HP_OUT";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt b/Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
deleted file mode 100644
index 4eb980bd02874..0000000000000
--- a/Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Freescale MXS audio complex with SGTL5000 codec
-
-Required properties:
-- compatible		: "fsl,mxs-audio-sgtl5000"
-- model			: The user-visible name of this sound complex
-- saif-controllers	: The phandle list of the MXS SAIF controller
-- audio-codec		: The phandle of the SGTL5000 audio codec
-- audio-routing		: A list of the connections between audio components.
-			  Each entry is a pair of strings, the first being the
-			  connection's sink, the second being the connection's
-			  source. Valid names could be power supplies, SGTL5000
-			  pins, and the jacks on the board:
-
-			  Power supplies:
-			   * Mic Bias
-
-			  SGTL5000 pins:
-			   * MIC_IN
-			   * LINE_IN
-			   * HP_OUT
-			   * LINE_OUT
-
-			  Board connectors:
-			   * Mic Jack
-			   * Line In Jack
-			   * Headphone Jack
-			   * Line Out Jack
-			   * Ext Spk
-
-Example:
-
-sound {
-	compatible = "fsl,imx28-evk-sgtl5000",
-		     "fsl,mxs-audio-sgtl5000";
-	model = "imx28-evk-sgtl5000";
-	saif-controllers = <&saif0 &saif1>;
-	audio-codec = <&sgtl5000>;
-	audio-routing =
-		"MIC_IN", "Mic Jack",
-		"Mic Jack", "Mic Bias",
-		"Headphone Jack", "HP_OUT";
-};
-- 
2.34.1

