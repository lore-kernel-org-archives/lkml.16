Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6A9191F7F;
	Fri, 23 May 2025 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028074; cv=fail; b=fBRGpEjqE8mMjNTqr0Bd7fgs4mSnXR56QEPghBQLeTZKNYGA1mMZ3AFaHEoKuRPFQDwlRZW2AaM9G8lURWgcfCsHUhaDviUN3P/Hzu4YewFeyayMgl7HTiwuAtu9ti1zsxneW+8SBLR6LjjNsUG5YxDuCClWdE3Q7FbtKTX4lUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028074; c=relaxed/simple;
	bh=MV8KKI8Gu+N6gZxX6LEFQvAUKlIVuAzS3cpq5C81ZDc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pbYjPvr9O9/tGZ/ltwBbmHRbVpGSVSFspnnvrZTiNdUaXkZDXdhE8dFNCH2IYOe+LDsRsO7B7LMFqwYuT0Yq5NqSYO9OkpmIXv4yfQWzubgenl1RQ2+w6prbMQT776XOQIAA4SWWNPoVXyFRwW9AuZ/733h7QpVsBxRRgbgCcIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LK0fDcDC; arc=fail smtp.client-ip=40.107.104.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LK0fDcDC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gftfDixN7kdPx+812vlnN2tpGNwrnUYd3VVl2VHDtQBc5MM0FCG4qGqLY/J2Q6/c0CAGisbhBnbJEXgCHUOi6iHmqmB7COwyxuZM/GUzLQ5/Z10xD+ZRammQMUh86iFtsmrMdt+0l69zyEKyd4lvtypaNqbIXzhzvSrqy4YUYBhqCvhaU+3qs7R6AVMQHHnKnk0HMZEiYXa5x6MPNjxAmzSSONjrUiq1OUo+eZJKl5L5pOb10LbDammRn0FXqRPr/KlyaOm5D1pb6P0YoIsjBWeNxJQEhx1t/c/n0Hsr00DxmMHqwvkcp3UDj7KkxHn4G4bjapq1pdEGVPoSx8zBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP8Bh+jidrhGgSTqwbsQnKA6YzX2v5tMHEYLOOjYXmo=;
 b=hF+gZmsQItML9zVJLtOweSs6kVwS07uzk4KDNpDvnmNGlU1pEbVinBKu4Vb87YsoJxASXbhPqsBEo/XaipKjTkAULsmTzZ0BGWjROTERx1YTpXFM55lZ+waWXOx5Ojm3nf7hKCtwu2qgvyT/vuHtrQtaR0z0c941jyRnb4ZirnV46im9SnOA+2dmRlGiTsjDLpLFmh1OjOkBbdPG7aidq272m7ggD0+zlXBYG2BdhIisY84TTsYJPH3kYs5rGXXyp3w/AXrG3xm6HCQRphw+Pa6FuQWzWoSs/xd7uP/ETqeHjLVdZI0bAWxBTW2taoA/arqM0aqi7izDfOXogOk5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP8Bh+jidrhGgSTqwbsQnKA6YzX2v5tMHEYLOOjYXmo=;
 b=LK0fDcDCh/xnxCDe9mAbwVCSkEQfuEQ1Mq42KhmkBYPdT1YqklvQrh8/bvvEMht1JhGaP3FaFnSXW10I5MK5EhsY5rteA8akxKaP+40Eizv1wGrVtVK+XJapOoLM2R5dfYcYlzJxm1/YGAgiZW2dtgRuUj4Ok0Z5tOoCMzaGhidqRpmPrkxy8VCL+eOBJJiKMbFdW1UE1EI1Phg0jKbIUIQTm92G3PEFlSBcPD9JaNdkPi/h2EoQmu80FoL0AFR9bYdnexd7lwl3H2/K1Q2Io6r3NPAMlpBRauU7JPH4dha8SM7VfqNEqsZHWN9dizDdMAcwXWHHTosDfQQFSwaBLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7336.eurprd04.prod.outlook.com (2603:10a6:10:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 23 May
 2025 19:21:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:21:09 +0000
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
Subject: [PATCH 1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt to yaml format
Date: Fri, 23 May 2025 15:20:54 -0400
Message-Id: <20250523192055.563711-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:a03:167::41) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a277382-ee54-484f-6378-08dd9a2ef8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gyzFxHSgnmIKqIK1m0fC4AlBDVH7fapBJo0CcfqX2a4O7KMX1FJW1R0Ijwf5?=
 =?us-ascii?Q?XnQcFqFD7x1R0nXX8RnxrLyisA/WGeAGi4uSWlSjktq2AGcMcGvHH5BrTtO/?=
 =?us-ascii?Q?gOg9QyXXtrZLozUmvYdmLBWCrceL4JIHr+UtbLlxGZXbrtPzyHV6gVLh3UPy?=
 =?us-ascii?Q?v51bb06o1/2ew3JyKPy+vx6hA7Mei3ae05V2yo6B89aAb+V1EWzfM7C1KzOK?=
 =?us-ascii?Q?PuMd3LUytTGspmTxuGLhuR23jcPsRHhbtky0hYAIowBzvudzqNLe+AX0svyL?=
 =?us-ascii?Q?fjjdFEkgMzeo1if0cYYsjLJ2AX8hXUKbbbzDZ/Iz1VrDupET71ZAacijZHPj?=
 =?us-ascii?Q?zyv3M23QuwI3vHKRas1b36Hliuhv9vvnuLwE/naMNIuGphr5ee7jEW6yesPU?=
 =?us-ascii?Q?YiRSmmqObR3LMPqy2kYZsUv/GKVU8ePuZgaoNGILa/DpSfANlk7IwRWpk4aZ?=
 =?us-ascii?Q?kWFc4Da49NULPuaCAy7ZXOuRmTq2RygHqDaY63cpwLkqILUWdDFfmI9Rfo5e?=
 =?us-ascii?Q?6gmQjdhqOHkLTsDIJT7naNwc5Y2U0+AOac91Zv8+a+T86i/wEChHSH1P3mI3?=
 =?us-ascii?Q?xsRZgC/hnsUSt+yiqNmoOIuJt629c/ADpg2vTSwTR+i5OyG6rBwn7Ksrmqs/?=
 =?us-ascii?Q?QbRg3gk7OsxjpkGr9VYatRRt/YSVUYH+qDznvVMNJtSB9w2NTyqNH2MMXwcZ?=
 =?us-ascii?Q?VZoSCzUcjS6vQhlXJZdnjjqnpV7i5tk/6URqq6NTIz7bU1aPzuYAy0S6ycl+?=
 =?us-ascii?Q?LilrBe/NR3WoMOTE4ZglEzMMiE8KskIBlgb2LWTjUpeie4dLyO+6t4bQz5GT?=
 =?us-ascii?Q?J359SSBuh+FK7vZI5epmTNyHVBpQraMl+3mYQ30/p5RyeaMnvQzfswt+GC3V?=
 =?us-ascii?Q?3+7UL4YPCjmSXBwyI+8pjzz2MXZviQP2YfCsN+6cVSWboqjUHLz0dmWOrNjj?=
 =?us-ascii?Q?tQ0o3fedkMARWNFNt4Kh+rqapm6CMqJZb2amINdUPbDpjggA8xqv7e9sf0fS?=
 =?us-ascii?Q?T4z113U0ckP+9mGkuvszssac0Mp7SF/tLglckSvPakdGKAI1+0lJqRyQSlaN?=
 =?us-ascii?Q?aI9GKGPQ58RufAu0JtGKOC6pmfPh8KeTMYvN4KfzO8KrfB61/vnqfgdVYxmr?=
 =?us-ascii?Q?b2QCFTgvulEIt9bm9aodPNgW/UenjISJQVL4yPIYbmkGC5TrvgUK9LG4TOwA?=
 =?us-ascii?Q?kV+nZKExpM2i5bhc2gplSfjocVvW57GWa6ZKqaMcBXQDzjfAD15Dlcm4h23R?=
 =?us-ascii?Q?804sUK5vA640WKQXsk+9SFMlAXnmtKA3Ttlyrq4k5yVX3but8HtpG5rC/tj2?=
 =?us-ascii?Q?Prh2GAjU2x6gbb6qm5M5plg8vDRy5Bd5cSqMCqvb8PVyrdcW5H4iJRR4Todh?=
 =?us-ascii?Q?2+DltCY52Ka48ostqrul6PcBY1r3+Q3/CMv+r8YG5oNJho5aaKmLMk9yytuY?=
 =?us-ascii?Q?j+k3zUdDcrFVgmtV0+koJwx+6CeYgPEQdlKmpk50jRu24JnLhQfSvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mO/4q06a1YDeDcYfecIDXSHVzmmpCDkSnMC4QxTB23jcGCcgMUOf7S0mW8Gx?=
 =?us-ascii?Q?TUYvd7EFB3GEC7FuSj5KEzuTCtghluSF3HOm2MYtsOzH1INvDtDPB8d8Suol?=
 =?us-ascii?Q?DcwRMA7OFLWFZGFrikxGylLIS1KyASLoWtY1D2tmGZrUWoOJ0qYo7iAzhIte?=
 =?us-ascii?Q?Qt51Sc4iAfp6tdso0GO+bJGHoKjYDI4Hq55vcpBPyHxtf7g3Xrm+YjoxoOrM?=
 =?us-ascii?Q?kzfd7YJLGdjUUcGrK5bxoXyVMtKxK+chix61rCKPJ6WdXOAtGaeK9QziI/f4?=
 =?us-ascii?Q?OmvboLy3XP32nW6YJ66F0fy2QlAFplyMx+Th03md1YeyGghJg3hZTALWWyaX?=
 =?us-ascii?Q?umMmHKwjaBovrqdTqA+KTdMlSnfByGilGStih5kxyXRAV2QWqXU3B2y5wACL?=
 =?us-ascii?Q?HuGQPirZn0dT5SnQvMe0kGP1GgXie1KTgmMP3uVyakxDy8aiPeRBN5fWhWcD?=
 =?us-ascii?Q?CO/xoCpqiPuaELpQ6WndFJJRHxXCEcI0P9TJqO2nzWejJumex67IRv7c3cFI?=
 =?us-ascii?Q?72D0TjkUyDlQr0hJsYemEeyqj0figfjlV3H0CulOzDs4SDhIaaIEb8LgXhrz?=
 =?us-ascii?Q?tuOpIWhB3gCK01XkhaXU84sLE1Gddw45cpbORbiyzwR7ZOoXL0CI+sXZgf9e?=
 =?us-ascii?Q?pVx0RVr5nuATNRGYbpgfNr3YASZMOkPicq48gj2eMSDyqVxykYRAXHuv+wgi?=
 =?us-ascii?Q?cdZICOuY0Rhl8h0psDyUUEKn+QN76nEOk5mX9Y3mQ763hpXAD50E2QpZlhU2?=
 =?us-ascii?Q?vwDlrf4qSM+DtIQVbMwVE2fXfOZnyGmfmjoya4bZPdG5OV4vrCN9nwAnWXoo?=
 =?us-ascii?Q?AmFNyaptglrEHZ1l9jp13QY9qBstEPGUa6YH3fu/74XKkCxe8EaitJaT0t0L?=
 =?us-ascii?Q?2ldeQVHeJ1HUb78nObG/4l7nvWXdnbAg9QkrR9Fu+/Aa0NEW5shF8Q/c9ouP?=
 =?us-ascii?Q?FQJ7xyvVfPM1Q0blEz8MRZobm0i7aN9HZaiXSd1x9dudwx10U5vdmVIZxAR7?=
 =?us-ascii?Q?4FYCXF4F51f9cYp4d7W1jZ12OtMQFxJ7ZFERLjZzA0V77pSOSqPsec4tyYwx?=
 =?us-ascii?Q?zv6x2AN6wmq/NOr1zkC+k44ZMPUrglktslZfz2qqJBjm8fwV6VJ75638oO7a?=
 =?us-ascii?Q?bhAjqolcOCtCcpH67Ew5/y5H9IT5BM/z27KGdoM29iMpQK7kv4JsWFLqROQ1?=
 =?us-ascii?Q?ALpO1t/1TBy8H6ZH3zMIplQ1usHwLOiTUeF73PMjKqOoX5rcaMlilqS0Pa5k?=
 =?us-ascii?Q?icqyaUe3BpVM+myDv4GCex2BYkEjLunOwpkxsQi+Vdrp6EFV1czi2KvPWHXh?=
 =?us-ascii?Q?QH2IwkDLyI2tpo77yCKqW/wYk8VfYXRAy2GX3A2VsdQTlRypmkyZya7KZEC8?=
 =?us-ascii?Q?7V2agqQ5hWfclwBi7NWz67ZQ9kxg8id90yoBRffWjhQ66kf8PKVFPNNAtrMx?=
 =?us-ascii?Q?x4IqwtgM9YKKbNHZpkidLl3PHtyEdrUYuE9j404qxBqeLfL+/emPm4wiHzn9?=
 =?us-ascii?Q?mS1RkEtcXFVBbV8fcfnza/w//hyK0g7/AliadBL/vUKljpeP5II1MaKHVKu1?=
 =?us-ascii?Q?6KN0rlZRIsLVpvysVhxIVICtoBT9Sse66mfQFQE4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a277382-ee54-484f-6378-08dd9a2ef8fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:21:09.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y49Lu42e/FLqz1yggiVlYMmqiLXE6NleuX7jX0hJi/oVy7MoG574W9OXcDzELF3SNliZERYjdmooZcIrHzh+HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7336

Convert mxs-audio-sgtl5000.txt to yaml format.

Additional changes:
- Add compatible string:
    bluegiga,apx4devkit-sgtl5000
    denx,m28evk-sgtl5000
    fsl,imx28-mbmx28lc-sgtl500
- Remove audio-routing from required list.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../sound/fsl,mxs-audio-sgtl5000.yaml         | 78 +++++++++++++++++++
 .../bindings/sound/mxs-audio-sgtl5000.txt     | 42 ----------
 2 files changed, 78 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml b/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
new file mode 100644
index 0000000000000..9fe815d6c233d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
@@ -0,0 +1,78 @@
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
+          - fsl,imx28-evk-sgtl5000
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
+  - audio-routing
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

