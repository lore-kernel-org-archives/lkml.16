Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F5B24EF6E;
	Thu, 22 May 2025 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947450; cv=fail; b=L4yBRFYRWpLWoY1EnH3JVPbjctTZjCjoezC5J9Odc4uMWsMERCly5jOOUVRvINhNeJ6I3GQy7Nr7HMFNAsBuSAiVXBHkVq81MvgWwNCUXfgVHJszRdPCW+U7a/rdBsAxh10KKpkgN5jjzzBFA5ue3CjyIiHK1vA6TI820teEYXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947450; c=relaxed/simple;
	bh=1ved66JkEXMp1v7+iQXqwxEvzaxaV38Q6KkAD84F63k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZzWvfPgOpFXGytckC52AVIQ26KEDtym95LlVUei5MdDqgVwQWc3BVNpcE3O1e/Q9O5n5OmdgvOwplv30xPYQ9oWNFij0oOgaTQK38jkRq0SlPSXRnxzvzzVLllvAbsqPuTNCKSzxNl8slBkfCJ+q7NuHNmEdHRiRRpU5bXx9yRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SSWhHnkO; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SSWhHnkO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQSGB9dx5EUIQanGwsepT0+HaAVIXe4Ji5OaMxiSCVgu1V1kj42POKPtHiwXdU6ma/ewMfk9lv1WzXOxCVllbXnO2wPDUILVf4GZ5/G9BWOjdQXi63JaOerx6YW4RiOtHHa343dURzHPmirziSdv7JPJumsD0upoJRlk/07f7HzKomTB7MlboUQ6eN+fJQVjIjBPrzz52HpIYUX6VcgLflXvrbYQinyQL/4zPkIOyU8ux50kBr0bNj51BfPQ5LYD+p60oT40/OL5SJBP5OKJ2YTpFG+kuoVrHGKjXNUP81nIMsVwKetg6LbusAJcWMRd5+HPoVtrZ/757vY1yqtqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69lc+IToyxYXQKppDcURAKQ0jqogtYcLRZyFwzKMUl0=;
 b=FUzOHKfWc6HVt67dIEw0qou8D6yNrcWmRXhYNWdNOmaXZutIWJhiwTA0Y3kTCIcEsQ+S9LmN99TY+V17zUhhQcdL2SUDDkcV6xFYJFJbB+eA3JR+FSmDscdy9wMKr6mxbkxh4+MOXNZMsCnmqZdsCZ+4Si0/ARBiMVTGd4XbM6xvVZtehyETJIsXkEPwlo7wztOrv4vduIJl94SvUWMEGGwjTLhCjw52G3l348FDp8hCGxM43zbAirGDQQwsGbb6vhkV98i1D9KGjrAuXMjq6kmnWHfahbIvVkYGEMdaqeXoiKY1NzEfCqyxLZ3BWYbT7jSQNZbNqTzyhAQGoowAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69lc+IToyxYXQKppDcURAKQ0jqogtYcLRZyFwzKMUl0=;
 b=SSWhHnkO/7Ky1L8KuDh+l9br0maXGEtgfoZO9oz0NQo6LBViq0BzZB5Y/VmB54McsEzagTymjKNPI9ynTvlPeptled2r4Jn231BmwQB5B2E8PEEL6vMu5Z0LSDG7r1LY1hE2mns1gMn47XRMrQarmNQ2JWL+kJ0QyfFTac6jbt4u4mt602O4VIVbJaXrOhyJjXUjf88hKyz7iut/arHSrLvSOXXpLuFwcfzGpQ4uP0t/0Un/UBxIQ73fcMTHg+HWr/nUDxVRFnAx2KcJLZQ8+weKu23lJ9UNTpfMSSeohgE3dXxDk87q/bNlMMF43DpfUnEeTghMFq9emnnIbQqaPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9963.eurprd04.prod.outlook.com (2603:10a6:10:4ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 20:57:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:57:24 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: timer: Add fsl,vf610-pit.yaml
Date: Thu, 22 May 2025 16:57:09 -0400
Message-Id: <20250522205710.502779-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: 88689a11-7704-42d5-e47c-08dd997340cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sCoYo5PBskqhsu8IvNVlNBn9HREGjThjj7q9oHWzqaQMtMuTegBIEgQr2Mem?=
 =?us-ascii?Q?xhkrbGJCMh4rxbyYwehHLXA17EXSbg3rsqT4WRZkSx5iipqRnEHDs5ypf5vM?=
 =?us-ascii?Q?d7oc+i/f/3/bv6DIIi+bs5V0kFrdOQ/W6rE87aPRTchKqgxCKZV9tykIPEeU?=
 =?us-ascii?Q?Q2G8DLcechI9MbnQsUFA1q2SJ76l+JYDBIAc+DbnLJO+49te4xvJoc/3dWIw?=
 =?us-ascii?Q?Md9nJq8bHpQxSwtlTFWV03PECT3onmaWsWcL9EnmfNGuXFH8a6A1uCzcQS9K?=
 =?us-ascii?Q?2TGNtbvnRCX3weFXXXqX5ZTHGDkyGtIheXY53UecZTvHjSG6FLNakPbA5uWs?=
 =?us-ascii?Q?vSbM1JTv0HOkIRWm89bbKNF/y3iDjbZaQjaMHlsZXMIO4PaJLfHYra2LNJMh?=
 =?us-ascii?Q?k334uei6ZayL33MGUUfLBL2qt72cyVTH0YEcP7BI6sqdaXh3Bm+tUXGN5yl8?=
 =?us-ascii?Q?gdXiqLLnufKeqj8DUdovRIXbGgme2Tda+PBjDFcSETxxIFOGMyEmUzLLkh+U?=
 =?us-ascii?Q?ArI6dlNMKSBhEWN90BOkgbn7W5jOu3Kumen3Sw7HH6D+7womMpGdUK+X/rQ3?=
 =?us-ascii?Q?/AnvjrWfVumSpUof0d7tAcHwITcBqNLplJfh9yHcMOiNCLs9qAbVmPjk2SK/?=
 =?us-ascii?Q?Lr/mlgeIxP/kw5sDnmkIVXpI20EQKeVoURNPKk52iMcjBoMniwgWilNYpI8x?=
 =?us-ascii?Q?R0Wc4KNuyR/mqD6DKctmCxJugqfYdq0kMcEkJKFNRDDx3Kc7QzJjP4mlugpQ?=
 =?us-ascii?Q?dGdct1MQt/VuYlmABYzVdCPIEvX2n3CWdAnoKjy9dlGgc6AO9oXgVNElgH5h?=
 =?us-ascii?Q?DIjnPKdqHxOICdSNwr+yaciNAQvSyv73uwWQD6MIbFWx1zzg8GliX/HodJhg?=
 =?us-ascii?Q?pZrrl2xXvV/NDICnDjvRsSeu/GVRcYE//QS6wl0tOpbDc5xxL4lirgcNnQ5L?=
 =?us-ascii?Q?DWqUrHUuLE/RXzPUhdQNezWtB6I4PWxMap6G/JuTYmoMOh2D9URzahO16gr9?=
 =?us-ascii?Q?Sc2JBwN+6Tuq0kMTwzQayQ3LFM+EriV0Nc0F5SuQklda5bSxJtSyyhTekCHg?=
 =?us-ascii?Q?x68k8VMshAvVhf4vDD0hgqwROOZ79JjO3TXjUMpEg4Et/O0rzWB+YCIJ8KLN?=
 =?us-ascii?Q?PvmRnA8nY7p9DpWQWxnR/1RWlqh9OTK99Hxq/FH11mGrBFjSOCe3zJeuM6v7?=
 =?us-ascii?Q?2wY66OwJan8xWfJ756NG0ilxYgC4ilNFpxiVc1LqXp8fvh28rGLkLjSkchAd?=
 =?us-ascii?Q?/KqRvi8Udp8Tv4/x8Tnn4pEp8ASL0l6hEA/qunyL+27uFcD90UL8n2yRopQZ?=
 =?us-ascii?Q?FtaAlq+CP98IaJQds05QYX+doNFrwyvEiwimidIPR9uBKzxQPSV8V5Ttp/Bb?=
 =?us-ascii?Q?lpYTL27Izg3RNi10UceXaoyM1wKihhcNUzeVN35K6uM3J27e7vzqXDiordtl?=
 =?us-ascii?Q?KPM+mQ1QPBvzQnJrSjRcHWrbfgMPgVoP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+4JWA8hfXMpO1Eec0cdcOYMoaZ8XYdAuAB15r9w4P26QQ/IDDS81ekZnkL3m?=
 =?us-ascii?Q?HakwvqAtHFxLU1isRuq4evUW58K4ZDHgHl+Bg32zfdZRoMwRf3gdqIMIIbkf?=
 =?us-ascii?Q?92EbwruDHLCI2XNNVb9auXDJQ1eC9wj8F/mUvIB+HgpR6n9Qzf12vqbdj36K?=
 =?us-ascii?Q?bEtXIMqpJvUnMc4svRF4uZ9ZdUFP/ET54sWHmdK+zX9V0nSExMhg3q8udvD0?=
 =?us-ascii?Q?iLm5yO+9EjyFc9eXHY7i2PgYMKiAf/eCtWPCrMij6+pEwcpEK8auYh5vD+BX?=
 =?us-ascii?Q?HIVtvaOPycKBiUx4WzLUYZQjJhbJpqUlcHxclAYcQKNbQiIWSXmUFwGFyHK4?=
 =?us-ascii?Q?UprBalUDSWqhnhIF8PIpkkwncDzhaH1vmSd5jWU+EFa/m1/bPKFJHYMEqoOX?=
 =?us-ascii?Q?I6l7oxDCahYLa+0O7+lIkt0Kc99+g4kFDV/TV3uEjZF+hrH98wNqPjJbIsMW?=
 =?us-ascii?Q?Fq2nPPmNnVZ/aWkO4npopKDxYWpb7qLxxFGtlMAHRluXSw0+nEnK76ea1w5B?=
 =?us-ascii?Q?noQGwW78PLDpRhg+qpwkCAW2F5rqfAnNdmklA1ZIyAKJe/Desfkp2C2SrvEZ?=
 =?us-ascii?Q?my5LUt17R7PEDYxsJQYY2/yuikeGGFHasfRpodOZjHpoeMZdlMVfcGpLmvfO?=
 =?us-ascii?Q?liImqvuz4iztvG6GzwuBSUhNW2fj2w6FnNcPDZtGZATyoPF2jsjjOWIfMvpd?=
 =?us-ascii?Q?ZQ4bixiR6DpysHyIY2WOKoEPLf24Zb44f5wqJK5YiXdj0Ovku/LWh7PD4HYw?=
 =?us-ascii?Q?A8UGvlUVkqjVxx1VKZUcOp83refa7SqjvmjAXToNR7OZIScWFVWbxcBPfIA7?=
 =?us-ascii?Q?I439a+7Z9HjRUgXwXTXcZ/VJrfujh+Q+/67tPXmH4MU9U+DWcJy9IqGpY9eI?=
 =?us-ascii?Q?0klnN3xMDvwjUy43lAURWAoMAkSYpMqNiNptFRJ0VmjuLurp+s03IajTzeY/?=
 =?us-ascii?Q?ZjXtzZpzGT6JTLAdevUk1RLBjN5XzNAqKXlURyRZF64c0g1GliG7qQq1bPE4?=
 =?us-ascii?Q?HCC3V+lf2Lg6ZjbGkBm3DJAarNg9BhMfa5wal9VfGyBXBPECmPs6OszZ3pwF?=
 =?us-ascii?Q?TJFZGaC7olVgcOCtpdTdzn3vP6riAFW4/61JMKxzRjf/rH4tOXXyAcYb7TH6?=
 =?us-ascii?Q?chczVIn3HILq8G0/GcrvY0TjFPNINoHaDaCAebK4xauc0VqwJIZnBinU75Dk?=
 =?us-ascii?Q?1RXrSzXM/t4h7dnH+hZTqUd2BuEzBDHvjygp8KKkd7N8rBWU4R5JVeC3oFUu?=
 =?us-ascii?Q?cG5JEdgaQ+HxnBq2N4PiPSmjSQc0tBnw+PJIWi8hc5yFc4aqFBQgHPbdGlnD?=
 =?us-ascii?Q?IrXHsskZ+TPaA8Yx/w0vGTYBIbqKnxPsbPTJrxz7oIbyRZvBxIX1Q3E1+/Xg?=
 =?us-ascii?Q?O1Pojn1YcanXlGZBqNdXtG3+On6JS6C2q3ITw0629QFru2MlLZKNua6+5IEL?=
 =?us-ascii?Q?j9s0bafSEcpB68famn/A6AnLOh6MgMajjbc/+XNXmP4vm8OmjtOPE5cMWDpd?=
 =?us-ascii?Q?If5ICeMixjMQvVVXt0EtiXj06FPhBc2QJLpBUX1BAMpRkHPBNBcVLocNx85p?=
 =?us-ascii?Q?zKGobPtj+8zCghonLk/weoNd5D0JlmyiOPv26YZ/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88689a11-7704-42d5-e47c-08dd997340cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:57:24.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: an9AUSHDnO3Om5jyr5YdkBK6/hB8aFM2YajajSo7Ya3qJhc67BL/2uvUZYy/dYdlsPGpOjrNEEUyqDXzDq/NsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9963

Add binding doc fsl,vf610-pit.yaml to fix below CHECK_DTB warnings:

arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb:
  /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/timer/fsl,vf610-pit.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml

diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
new file mode 100644
index 0000000000000..bee2c35bd0e29
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/fsl,vf610-pit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Periodic Interrupt Timer (PIT)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The PIT module is an array of timers that can be used to raise interrupts
+  and trigger DMA channels.
+
+properties:
+  compatible:
+    enum:
+      - fsl,vf610-pit
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pit
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/vf610-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timer@40037000 {
+        compatible = "fsl,vf610-pit";
+        reg = <0x40037000 0x1000>;
+        interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks VF610_CLK_PIT>;
+        clock-names = "pit";
+    };
-- 
2.34.1

