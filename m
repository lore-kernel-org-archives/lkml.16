Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA8191F7F;
	Fri, 23 May 2025 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028033; cv=fail; b=KFtfis2ZGp23LBi3jjNiQg7Ebw98tBFRTfDBjqjwvffsXXRRipm5dmg+1Jo9TWXy1l+GztMwRZ9VHLsYgfS2FQcTMRt5KF5ZBYNcFKWG6q+hs9oKsHFMJWNgUaxsaVpLPx5oPhcLeB6CHDzGD3aX5QBb8CenbeyXTSDzKReEX2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028033; c=relaxed/simple;
	bh=xQIPJSdgQcxfPYAYJJTsCquiI/H+2JgwjsAGQBW8/8c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=quKpSqDKPh7lQobmQq+DfIoxdsMnHRhObAK5b+kZUAGGAftVvLVpsNt4OCt4Y4xHhbbL7dx+/j4gGUEQnbDjZ3jA0qSaDmKL8PyQdafJGVv8scuwevdPXDWelzF9fGpmOuq2klZSdjg/4NhMbeYQw81P84P3wJsjigjWSsXNS+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NsudtinY; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NsudtinY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X62zt2ZlUP5M0+ZRWNIgheO7aG9Ngqs6SmlLdOz/YjHdldz+vBUvkvQg/71brD9Q9omlGDojLiBQs9T5DDvxbRNlv/7zp5iedgNOQ/ESWuWYIOiKrYBMHYZsEKxn2kGmukM7fTi83ka3D3H7MuzaTeveJTlqhbnTakmBt/3IhspbcX3hHzMzaLKRfZEFiZ0z7I+U2T/WWn3a+xbrJP8JjToSKT2u8MCDlBFjrRCETj85MbD2dVCuEuKLYUWEF8+bOeRxke5YdpsqPmABx4+XFsTIErqs2a+zJ8g2FQmQRuwaS/4V6fxnZAZHk6DysFTM2Z+dpZmWUR62JM5cd37PBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxYblMxXmwf/dZ2yxtmGYpRw013BCYRx4/4r33fwr5w=;
 b=kSilF74efD+Mp+F4BhkYzzSWj7y/ANS7Tg/VAPnXr6dtTeS4LHoifcyIzIWPkqFT4Yjldnr7JaoZq9mkTYhDzpmbDgA94xT5vqwGL1LwJ5WoYYiY64vhx+hQoAMJnIXEImbOz9f5XEZ1ycdALRL9BzfVoiNpFcmTe6dbQA6IkIR4ghv1HJF3X2Owl/nONj0VbZX1XlkhQGZ3VcokrjHCxFpDEkllK7shDneKUtqjuGL/58+nXrXq0TOLq6IT28312VnBKLUJ0m6HXU0Izb/SGUMZfnpH1Z9uvtY+BEButvcXelDXV1E9zPoSMtZHSv1zQcCOiz+hja2l8JIY0apfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxYblMxXmwf/dZ2yxtmGYpRw013BCYRx4/4r33fwr5w=;
 b=NsudtinYskjjdPHmZl92Jk9QDaZs1J7h5sntdLxRHDtlZIPYMfurSJXQRhgZFjwAoojPH/Zjs2+UIAOQz2SotPF9JLGmNANMjlOQSil6lwUsbbAxBnRLVQvlpUkREmlwGHy5UvZ/VLGtzridDtME50ccb7/0H9no9Mccz77PpJhTC8LuB3H6kZQ8r8/I1v6PLGi2NZgVX4n/tONJy1xr9rF6ElP+3TeDfhwK8twR2TzDrRcrhFe47wdQN/3P2hGnJ8cFks1JPFGARk7d9Dvi1EBQjnTC+HduEUqWMNRZMFxXV2OlwmOZht9b/e/CejUrb/kFsoNfmTjlp4gU/Lo/Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:20:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:20:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: interrupt-controller: Add fsl,icoll.yaml
Date: Fri, 23 May 2025 15:20:15 -0400
Message-Id: <20250523192016.563540-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 670b13f5-b79d-4c7e-6523-08dd9a2ee0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OSPC6gFTomueRy1SNaUbzSaZHy4GHk+kI6MAq2cLFgEfNJDQqhb7SxYjyZkB?=
 =?us-ascii?Q?/DfmxTKTYoeCTC7Odn+hPCGBSsQdDb3tEkc8EaBW9zpAlEsyASJiK2uuAvIF?=
 =?us-ascii?Q?u/gxCaXXbqU0NkcvUh1TlUidKe26uKDSQwk2tDxKRbGM7bCKABxj3nNeT8dg?=
 =?us-ascii?Q?QD/bXm7MNCFcv2pJxOB0abSA6Lx9TDwy/VjAejFoSF31xvxPpr1E59diCYDW?=
 =?us-ascii?Q?sgFo3oQ6o6ar76GKfGePqKulfA0+0HJSIX0IfNxpl9yfujYA/kVNMikUMLsT?=
 =?us-ascii?Q?rIetfY6fxPQctgojCDdS71XSen9J7jWMIM7c4x1edZ1jSRx1qxSC1P9IVQ7i?=
 =?us-ascii?Q?4lKfsLCqZrGIkVgurUbwsb3sjYCya1Y/WldK2leeButhKTJM8q9fDwnzzXKG?=
 =?us-ascii?Q?QoFBFTlKEuzOT/9Wy2Ey97w2L+XEsAMxc9kOKpirtlEB3w1q+Q1+Tk6A+DWY?=
 =?us-ascii?Q?DHsDOtoqIXbEG1YuAKB7+K1v2t/93H66qsxfbs1Rw+yIUo4kCSYNrwogKjeF?=
 =?us-ascii?Q?wLKtE5mveuhV6oJMQ6xb8HwFq+kP+/+UAFH4RBOmJhEQ/2rmwiSr0rRceX8O?=
 =?us-ascii?Q?uyX3eyVFTgJX0x4UpF5Rzsc7pQDA7qk5t2Wz6eF0uFbmeYGJbyVP5yvTagQ9?=
 =?us-ascii?Q?QFpbIsSFOFwsSedTqHwJXBLEiRvg2klhMdaBnwC36dkRKbUjAsX0eBLP+aVd?=
 =?us-ascii?Q?ZpTvCm6OnizGTLVed6wYWyddFT5ZQdGmvhYBYezdqX+ON21AlofiQVe52erI?=
 =?us-ascii?Q?DqJ2FBnmpx7G9YKX3S7GKtGKg5e5qNfM96S1pFR0cSmrJjREflEb1JYDAF3r?=
 =?us-ascii?Q?hbvr30PC3qr1nJKdRX+ITdclgWdQvAGcFIO0mZKcEPd9JIL1Jy5aOARhFf8Q?=
 =?us-ascii?Q?HkBOCCTPw+iAq5vP005amiVzEO5pO14URhhcZKBQWBOHkhf7GTsH8U2R2rd8?=
 =?us-ascii?Q?baRr2VORzhShwiqugEtfkhtezmRcmsUdlLN189LtjpWcwoFW4hH+XRdfB//7?=
 =?us-ascii?Q?7TvL3D6BuQnOpMyFYY5IVvgUmA2dMY6kBlVfM5nvP+lb6jx0iBsBaz/t97kP?=
 =?us-ascii?Q?J4TAZWTOZyZbxjHUdMv/gHYM7qHA2kSb1ek/Ae07xJGpxjLSBHHUzgFvbX3O?=
 =?us-ascii?Q?dxayPOB8dbKEwQiB5FhU6LGrlMmzl1e5cY9XRELynff2oqy7FRm0DMiBcNvz?=
 =?us-ascii?Q?THGrwtiY+vOdNpcLsYzv6FdR+ORF/6pGNi+HnZN0fK8wT734CWwFjbiI/rTl?=
 =?us-ascii?Q?PLCjh0R6/NHCGg3SUW5NsE4pRU7qYSZjXemUu6Yk909aq/VuUebqOvQBeTSq?=
 =?us-ascii?Q?fQqN2BeT9mahiSwOc/OS8QbvXmt8RAjtlPbb+h2yAKSoRtGaJCWuDjwWSuTq?=
 =?us-ascii?Q?4AsewMnB5WgIUkLpV5+cRaU8fxiZ6r+yhV/vKQdSzfYIJcLHthCiCo2wTD2T?=
 =?us-ascii?Q?1e9xO+8dxPNeMHGfmARrGmv8i+C9913v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hHKsUi4vfJm4xh0bfn5IyYrLCgxUPUKvicWv67mD+n0R6+qitU60E2xSisHH?=
 =?us-ascii?Q?vZSNU3D+tf67MqxMoVoCpnptzz0cppUGc7zbgmRKqH5TfTk3SwP61ZmQn0xx?=
 =?us-ascii?Q?i9uzxrueQQVIKFq1N4+eaNR5tbQUi5ePpLYllfXu2oGMN/9VpO8MKLogBzu/?=
 =?us-ascii?Q?0fSFzxbSqys72dKlHDGQwCA5vqN5CRRrTcY0DMQUfEfbXIsDkZriKvPhWZKy?=
 =?us-ascii?Q?EgwqR5rMEdsVOq9IrTFGj5ZORLPQXqP7kH/EUSi1J6kSdrINJc4TtAdrwpwQ?=
 =?us-ascii?Q?9x5m52GywfhX0m//58s9OnvwJwbb1tQ+D6NgqovvhXthWTYGaiAMqp3jcpQB?=
 =?us-ascii?Q?mFu/mBffLUFwqIY1htbeb1g3LH8Lj2aZreg2BX60stY8NyC5pUKUGchHs4dx?=
 =?us-ascii?Q?KD4KWXRsOupxvHi+O+u0ZzPTqi7Lk2jsla8rsTn3awkDVqzx5HY9desAzI1w?=
 =?us-ascii?Q?tKcb6ueMyr354mD6Oc1j9xqxu5DVUV+PAerLDbewQU0q8jsDkOQrUBDGlxWY?=
 =?us-ascii?Q?t7TI41QngPk1sQVAiR04ZocKRQZlBb0LBXYrom8TRQdpfkIzBIEYDDmGiwzr?=
 =?us-ascii?Q?nH+rWMrsd5iGWvKZoNeWEyPhRnWmDLNpk5XYs/W366f4/6BWZ2PfZCsavgzg?=
 =?us-ascii?Q?ULwLcPRei8wFirlvn9/KXHNMqtuqggFQ6ZOB4i5ElgbAr+g6L5LM29MnoKWq?=
 =?us-ascii?Q?8ZV6VyVEq+SyURvmAZkpIehuljZH260a9f8CfSWt/ym83lBaz9jJLAdPqffb?=
 =?us-ascii?Q?+vHkOa7siHoKSPdBg5hyvg+Q7ZM8P9irsQaqQIqSLskifoCU8ecbHdYUfNFq?=
 =?us-ascii?Q?Cd2wvYG0uumLEs0ULGlInVLq65etk5cEBEr9gCHLKDDKPMnGWwOAHCkISSAX?=
 =?us-ascii?Q?t8RwGUMInx22P0DXZEw3Olx/bhmB9he1zdAX6GVU8ZRFVDIlPaZFV6XL2lSr?=
 =?us-ascii?Q?UKdAI7VoH/lHZIm0V06utb+vHTrkaGjFmOy/yXIieGTFAWuxHyn1I0gpaU+S?=
 =?us-ascii?Q?Af5BJQWpmvbM8BRNs1U5o3Xa3B1ibSmR9u/81Rjt7NWaLZkGSOeuZnO05WGW?=
 =?us-ascii?Q?GYNfLrWcaiODV4NZFmZR0VxYhYYn+i8IGxEo7IG1Rh5zQe0V6/QPOfCyFqGx?=
 =?us-ascii?Q?fRDymJHkb+hon91vSm1Mv+LpvqMHi/kvlWhmI1NmNMwyEgHWBxOHtTeh9ph1?=
 =?us-ascii?Q?1UjV6Xf+SpzYPii4Q2suJ3GIIwdLPRYPmh7Q4GHabisygpeMshaWxl3sWUmW?=
 =?us-ascii?Q?O6W1qNL3OnlVwxsZRWJpjZiO+zygsT3jTU4uS/pVVquibL6Zhp+4HcE+HMN5?=
 =?us-ascii?Q?OVHZWPCJg98L7awpducqcMPtPDLq+4J1lil9/RRHKygJr1lE0n8AuzSmt7Rs?=
 =?us-ascii?Q?EnFcvzX9jMWCQQeiNzAo+WcwIQ2LeNm0u08euGwSCOa7ZUPWhXQ96J3TqNhp?=
 =?us-ascii?Q?z+eZ7uNHUQ3khGti3L3k21vPEBoEIswLXW5EwSSOSGVQEmMNGtJvLAqliHk/?=
 =?us-ascii?Q?kUXgzZUgPFHHSHcTzD4e58Qlh/8CfToYWtKED/nG5PlRzhKlD+o3gXMumA6Q?=
 =?us-ascii?Q?PshtRhZB5+ZygKUDkNQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670b13f5-b79d-4c7e-6523-08dd9a2ee0ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:20:28.8442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+/2KZ8XHR7LtmNA/WmqGPapu1pbZv81il1ze6ZGuZcjbN8aL3/JbNUd3ehLSaqu2EIgzyRcu2w5IvnJersH5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

Add fsl,icoll.yaml for i.MX23 and i.MX28.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../interrupt-controller/fsl,icoll.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml
new file mode 100644
index 0000000000000..7b09fd7d588f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,icoll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS icoll Interrupt controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx23-icoll
+              - fsl,imx28-icoll
+          - const: fsl,icoll
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@80000000 {
+        compatible = "fsl,imx28-icoll", "fsl,icoll";
+        reg = <0x80000000 0x2000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+
-- 
2.34.1

