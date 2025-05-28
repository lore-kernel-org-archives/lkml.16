Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9A28CF5D;
	Wed, 28 May 2025 16:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451249; cv=fail; b=r/WuLsL1FlbkujrUo+q66wze6+n2Ooz6fydtQg5lPx3+CFgSgiQQRGnaXz+aiXTqut3NlIu5ZEhF7yGLuFT9VLY63GassNPE54MVAtLgdllHM12LMcCV24ZRRZrVVh4AYCBGiRjgxSSNl8SPXZZ87wzM29906iJEZuAvuaov9qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451249; c=relaxed/simple;
	bh=9dq44V3jexx/ROrVyBTbo+Vk9UIv52z3tYubsYgRtVg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SUdvs3qFBntKTNW/Ayo8Ii0nPJdZFkrVhumq+UIh8rlA6FOCPvKDooJaJetK5xpxXyiu8jKnkWb4KYX88+4Byfs5nsKdJHbBn75HMLZ+pIPM18j4efvq8SNFxylnGdnFPvwskZKFvqd5rA0hRY5jTvz21kVW5vjRXpYu0OE31F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F0aidZfZ; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F0aidZfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d98Bo5HorWG7Z/kviIbFx+OqhMWcjJkruYVMpdPvVdOAP01t4HI4dmFFR7cHtljT35bhMjoC1i4B2c74Syugxq0cYxwT6PRCkJp4VDBm1Dt5WvKw0DRYXlTCtQC3dnv6UuhWlcgs3JU+z+PrzXeSVQ+H/LufNmzX5PsySsp2bCjGAL0jR8eTesVU5barsomAZeSc5Pj75sxvl+yULTvoP4H1XgwNCTCOQC9FuiFFCkeaVDk/bnAOUIyVhwv3tYoeBikq5Bbh8q/LDezBmAaY6tKmWdhFfafMf3G51DFBm69IFvIzFmIwhnJJioQk8FtZVpGmmuM/gezV2QTLlX8kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5jxRVhVgT+JU6fEKLUnYA9V55vlaWRPJkUb+rvbWRo=;
 b=EPiY4WOyWOvixb8+0BJJWavAJf+ddaSkXzjZSH2lEjmbaUTiVyuB+lKQGENf1iAJeeBz0yTWSJfN5Z3ZegCVHFOWLUaJLldET00HudnxXancU2XOe1d/Vcfkyhv1ZWPpWyRgafVX/yIndDSSLoV8OH8g1lKzPyvyz/qCNl/7V01BWFZ0INkNoL0ET3eH3VwSSnyowchIhWRUL3fxZsUCkUTTPTusu4mwJq7mxYalVBcGhSYuK3ocA1U3fEHKvr/MjEzeHtK3yJxxhx4GDD9mlkUWlCb5qFxVO+U/gRF/h/qaUXWkD9mQXPSPOzt5tnMyake3c5AQM/FOsx4BKvU5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5jxRVhVgT+JU6fEKLUnYA9V55vlaWRPJkUb+rvbWRo=;
 b=F0aidZfZEPMPIzZsQSE8bA5GsT5mWVFzrMmUQfYXE6cWIXDJ4SmXBC4VzmBkvEOzdZft8N0T5cvDDAz4UdEOm8MIr/LQcqKqKSPvIEUXN0e6eN1aJocJIIXLB0q09BirLH/IwABvjjwaOzP7TUPY9/SIyJFzJ7PQuXeyPp32lSnH4esple3CdRvkMgU++iFtlMM3eANFHp9c08weY17hqIlUCeWvNxIeQpsRQZ1tGgLRF7Rc2QAO0AwJYMI3dXwFXwHAFn+VSi5HIQKseiBBBGsI10b4mnSxerghkq/G1bW8U2y8WC63cnGaBxAMuf+VEJGhr5NyZd9U1BZl8FZcfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9265.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 16:54:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 16:54:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: timer: Add fsl,timrot.yaml
Date: Wed, 28 May 2025 12:53:50 -0400
Message-Id: <20250528165351.691848-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 465a6cc8-6eef-4af4-6736-08dd9e084002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R7p5wh5/xMDGvwu48bz4446YFg1wZYCDIofEFXMLWHxz+Jin/eSkfJI56/Xw?=
 =?us-ascii?Q?KRlsAyvZul7v42bW7pTG7SlQuMfu0Euz2jbhnZii3I5KBSmnoFsncmvmYAgM?=
 =?us-ascii?Q?agPXaQSOEpyuyM/wMky0k0PBWCvyZbo+wLtW0ua9JRIBw0c2Th8+nas9JPhV?=
 =?us-ascii?Q?1lVMwYdjd0ex3zeXZR3q4jjC5Z9U/MVbslnwRngRNCPZHmv2NlHXwfxAM0OH?=
 =?us-ascii?Q?yeYZgbOXZBAiR2lr5hgD99i2XqGZQqNwwaOhI73vR9QiFRb3OVL1r9EOTRKr?=
 =?us-ascii?Q?jc43/IGWnzLN+j9CKY9LYhZ2nL/eVmhPQ7+qNZr8g96ZkFUeTpbFPE9RmBgC?=
 =?us-ascii?Q?iNriNMw8O0dMuygybLFNndWMgLJf8w8Q+C+0HL+a1k4zSfKTfE7ZdZ5hB40n?=
 =?us-ascii?Q?XQh64tM2+09dKDEZ3D0xn4vy9HqfZYR3IPE3LJ/AB9bkR34OtZlPMZfZan2D?=
 =?us-ascii?Q?lcPrLHMlMXwxGi+2sSPyFIVLoZS/I52QHi4RJIzth238sQcJC8bOqsEb/EcQ?=
 =?us-ascii?Q?kjHuBu4q674Kl7w2o7f5xOO0SNfE1bga6TOX2NXi6RcMClN7q4KFd+9UDp1d?=
 =?us-ascii?Q?jndjouzSTAPePd8WZESxBH1AEFhXNXIYXbAkJjMo4YHvNndymbTeTm7qvVHX?=
 =?us-ascii?Q?PdB+ydTeCs85v+lGJoe6RL1nx968yK4v0oh6nb4HJHXKoyeFN9KNV6JF0uuV?=
 =?us-ascii?Q?aM7xqA6pA6x/MXj38JSWOTlr5fW1r2H5hNopTvh6cgLgfk2uOyEn+zXp+tYN?=
 =?us-ascii?Q?EMwUbqGZ+lmoBp181EQg0CT5vjRWUQe3Kow0gs8Y1crHn96Fcxx7aVOKKSeO?=
 =?us-ascii?Q?AKcjNdmB9tCvTuvOGWL6Zz0xxLURIbxDZeVJqg/ANpDIJY6k1l9gr3T3xoXn?=
 =?us-ascii?Q?tGBE4051z9ywMV/ulJVbZ3i2yLrQ62pqTuvt8kP/2BXxQnb4ODELvljxhJGn?=
 =?us-ascii?Q?lQTXVwIXeRhV7HfTzatZAT62gESEBhyFqhu+9TmFsMZo//QOTyGE5v9ZzSOL?=
 =?us-ascii?Q?u1YbG24zslRpP2qdXpRDGTqW0TKXrsjpMpl91QtZ/9CHIdrsQSUz9LmgcGSe?=
 =?us-ascii?Q?wiUew+Op1nlNZkcuKdj554v3Ira7yl2Tt8HZzeA1r+qh2L5PaCFFiFGBmFOC?=
 =?us-ascii?Q?4y4lPwkpZEUCJqff1lzY8fnmaZqq9zWClR407jY17vko9xaxJE+fh9uAEmri?=
 =?us-ascii?Q?XvoAiRIQR0xvDzdeLlNijPKYObm16jBEPebeQsxKMNCkwlrgyhoxOqkeNzAj?=
 =?us-ascii?Q?ywzjIF2KDyj25+4LC0+v5WuoLDf59t/m0kCrrO9BNxyZ0sALExarW4ikugQ3?=
 =?us-ascii?Q?kWwB1l4XlgrhyjRzTdCAfJbsjJ0CclsihdFRoEby9leMCNG99FjmJrLpPW9a?=
 =?us-ascii?Q?8acEtXw3pGF6ISopc5kY9FHfkQ6hahdNeN6sK8DTtUisxXi0q3ttX26QVDP3?=
 =?us-ascii?Q?V2hZ/NRnDmFTMh5JqiEdfn/kbbpt6rbF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GYzX7BYBbKg6hpEgwKa9zpGv3YLabe7JBmNFzVDAabrgpwzVXA6Krx2PcLg+?=
 =?us-ascii?Q?3ifgcDmeAAIHR4kQhwqfBuuK15aTQjgx/3NiAbcXovXyqIUu5tdU4iWwxQbr?=
 =?us-ascii?Q?Mo0IDkVd9q9nCCnfjOTz+p7c0Ah2hXbLIpUqEJsBzj7nIVL6BTTWHMWKkvzm?=
 =?us-ascii?Q?YzoFxsKXL05vpzDVQfCJXlzOM5E1BF60oJ0yGDmKI79EIMgGCDN/Q51m9Zh4?=
 =?us-ascii?Q?gZ3YKOqUIayVRHkT2mANqBwXnVOTg/7wCmqlczba4YuaSQT/+y7PJtdRj5m/?=
 =?us-ascii?Q?j11EJKwxUS71z9AKyboeaBsNyMH+CypSyx5iKVuZn0SALc0HUV4UVQy5rCjb?=
 =?us-ascii?Q?G0c2xMMFJVH58QaxYQqA/PIaBiBl8OvERwUAILKW+RU/HhOf369edTOiz9jo?=
 =?us-ascii?Q?M9TZiEd90BTRGKURj9er8mOEJk9Gax0ZVnC1tkjVsNnAZ7tabmN8736Dhm5v?=
 =?us-ascii?Q?4NmJqoVF3XAs0yLVVoySGkzLKpOJMcw/c8FaXK7+tDzMCAKv3M4o5X7WnF3M?=
 =?us-ascii?Q?X8QLU0aVxodz8qkE6oXRSjUftkIXDjbtmWRZsLqcto3u7Isj9aW0mPuWE1hL?=
 =?us-ascii?Q?9ZWlK9u6qoCC7lwpXocHJjQs4yfR5z6rcbicAEdZjaJr4oRdYhIPxE4d843D?=
 =?us-ascii?Q?c/el+h5JWbACIHPEM+oPh6IcNDSB/vzd3EuvU3+/VXACW8f+gTSMSroswcSO?=
 =?us-ascii?Q?nP2QwguvN4MGVrlqu//j7DfERyqjY2rZ82+iUZU6jmK+9ftvezDcTnORqQaR?=
 =?us-ascii?Q?Qi7wlIghvDvUhkAVVBymR0o2txZEnqL6bnpL5DLE2EO+LXeLGjSdU9pNlPql?=
 =?us-ascii?Q?nULPMQX0mnj8fVGPHGi7rQrWGq1JteWiXt/NSwwrNTSzCGdK9nnbyYjzvPCD?=
 =?us-ascii?Q?PsvrvDPxkfg/R/0X62EQMD22ViCMc4nsdqORHbvRC00aVUNQUBRPFJVDdVxY?=
 =?us-ascii?Q?7OEDhauwA6kI5hf3j7gqLxcX5lQmic6dRLVIMBX32yzMV284vq1gYNv0j0B5?=
 =?us-ascii?Q?895ILRqmuAU14zjsVDSmDEZP3Oe6wOb1BqRhwDD815z5/nUGiubNIYwy+jkm?=
 =?us-ascii?Q?gFWk/TE3r5jpJEuq3uUxLQWtcrwEMx/86PNOK1pXCwdF+a3AAwOI06JeM69e?=
 =?us-ascii?Q?GmnijRZBWO8QWqjFZI3YY0wYbWIGak+tvKhtD5IDby7SRjo+Hbe8IszgRt5i?=
 =?us-ascii?Q?EcCqpDalAD1+zojSRQV/2oh/MJxX5VkMaoGfTrNdl4VhAbe3rZiS7ywq6B7G?=
 =?us-ascii?Q?LFNUK+Jjf7F9ASG1S18kKvpRdikUpgv2Qz9NGg+A646MAYplaYj2Fhx8ap5C?=
 =?us-ascii?Q?71MiKqYOpZThlutdxHR+q8XpFqNsG+npbwt/XOdNtLeEhWiwNaHBowLt3yHT?=
 =?us-ascii?Q?i6E/TsP9MKYkkSPe5BiNIjK/aBTvLMi5AsyMLmZ+tA7xNn1nm6pM9bJYVdDL?=
 =?us-ascii?Q?JEx2YMn/V5t6FGGJmTe19T+64MBb1yNLZZwWbv89hf2ODk6P/yF5YwEt56jN?=
 =?us-ascii?Q?mECpXhKZyhy/QCRnzVZ7bXgm9POb1SfQUv4XOdkoCVIuczoIGNKzrxMcmPBD?=
 =?us-ascii?Q?oHEEW2b5eDmyPoq3TJo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465a6cc8-6eef-4af4-6736-08dd9e084002
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:54:02.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5fdjdvyzndAa1O2EDlbChaokTlVgqqSZsH8iJv9k8YsIhVtWubinqp8RuBXqyqqVtwfam20VUd+B4SjpxLpbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9265

Add fsl,timrot.yaml for i.MX23/i.MX28 timer.

Also add a generic fallback compatible string "fsl,timrot" for legacy
devices, which have existed for over 15 years.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- Use items for interrupts
- update commit message to said for legancy devices.
---
 .../devicetree/bindings/timer/fsl,timrot.yaml | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,timrot.yaml

diff --git a/Documentation/devicetree/bindings/timer/fsl,timrot.yaml b/Documentation/devicetree/bindings/timer/fsl,timrot.yaml
new file mode 100644
index 0000000000000..7c8effa37e494
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,timrot.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/fsl,timrot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Timer
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx23-timrot
+          - fsl,imx28-timrot
+      - const: fsl,timrot
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: irq for timer0
+      - description: irq for timer1
+      - description: irq for timer2
+      - description: irq for timer3
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer: timer@80068000 {
+        compatible = "fsl,imx28-timrot", "fsl,timrot";
+        reg = <0x80068000 0x2000>;
+        interrupts = <48>, <49>, <50>, <51>;
+        clocks = <&clks 26>;
+    };
+
-- 
2.34.1

