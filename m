Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6FC2F2;
	Tue, 15 Apr 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732163; cv=fail; b=bqbI+W+bY2fXVLNG9tr5gIHdqUTPr5s+308kyeOyq3x3MchLnaIu1svvMyNi12tqABqshgtFEbLwd9/T8Lm3EBQOpegp/yri6H7FZkvk6eoCn4RypZ0s2ZqHEZFK6hWnT878zsNRsAKyeNCKn3otOlyifDuhz1hBwfQ5QAGJ7X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732163; c=relaxed/simple;
	bh=KDFp3xF3OVftmpJsFZeJDMZYxgZ6U+8UlhhPA+L0+bA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BWg4fXugReEKaOYDEEp41BkCCSIQe78oS8IK0nWVzdYDG1WfXGK4uMq0Wr+taaGfwjxFYjTroL1mFjUgOevURURBof3J0JdW+5cykXV8NeJGJbgLEZeniGeL+oxEqspQRKVMy0RzAHoj/hQqHQzTgc8mVkwP/YBXayP4pOwmrL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hQkwtl1j; arc=fail smtp.client-ip=40.107.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hQkwtl1j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpwKSTleP8OqUU+duHcTX/9iZYJWR+6t8JfJrTcB0PW0zISx3L/ngLFAbZhva6JNUz4f6MllJ4977YpN+NOR+GJRydLoePPAwDWg05Cyx2t6I7M6un9xFF+fjr3FzZo+QxeBgv1opbac4PGqUyrFSYVfNmwHvE/IBQwv3rnl+IYITDBWenam44t0rCZOV6CXn83/hTEBxsD1pytPyxODCQeLi1/1EXGX+z9DJWF1BVAtvjsygtLFvLjQw7HqFf6WKJr5l5f+Zx9oPdDUXW4GWP4C+rOLLU3S80O2Kt9YXcClGY/R9jvPTN1vP1Qlkkhct06uWwJIddMJ85qkavSDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOib8Yg5arhhjBlq0DPplC8uYkK7g+mdmKw7dQ6lFVo=;
 b=HKnt+KQbrDn7Xkpz5l6zRAUfMVNrtJNcBnjhZr+zxVdKJxK0ge8yqMgSWVnjCJ1+dwXd3U+6pKOzNNlTLKFeqeXacsfi852ULRffx7tJ3dFW9Hdc0BSFlKrRxAoRefQ+BSLv+zajaaI8kUa1wNzYfYl10zsULI+XTecrKGVtaxCybd9C4wk0MY9OpLOWJycQmvLC/qPNc6lJ1E6SLJbh2i+W3SSizrWaaosbx2sZDgzTjEfQZR586P3XWFlHYmgzIzAk6uUrb4eg8wu8cIVoJFV+g8SBLTZ1jE4aAg49LhNPbJ0gL3bkpDwTLSkxW1zKf49DpcqhhkGiNatS64BC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOib8Yg5arhhjBlq0DPplC8uYkK7g+mdmKw7dQ6lFVo=;
 b=hQkwtl1jSVH7OdplUSCQFFq/Ni4rnVXRkqpTYenfpdt8V+ePSDxgIrgRv67UYH8xT6T0HQZnUauKCXlnI2HMcAIlch7LRNITr2sQw1NZCixLfsx/I2DN1CBi8+ya59RP8NQmoeccLwkvXVNaSgYWBjDScTbQkC6s9za4uQa0kATlFEnumZnjVxj//wtNiUxv3IuQVtdDJfL9nVvyqBYhk/qF3B7aU60uCnAl3vy+gSlrNInk+QzUGvpqH3awJjmCmRrprYzKSG4CeeIFPj9mSlmTOQNvfsqxw4RelOn+KI31UPZ5KEhhBSpYNL7V3Osq6Y7iPgdLQ+jP5qQyMgSXEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9323.eurprd04.prod.outlook.com (2603:10a6:10:356::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 15:49:15 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:49:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: interrupt-controller: Add missed fsl tzic controller
Date: Tue, 15 Apr 2025 11:48:58 -0400
Message-Id: <20250415154859.3381515-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: b563a7fc-9801-4605-b31b-08dd7c351319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Twt2tqaq6HbnPRlTSySsroN88AhJ1aID7W4pavj8kaIBSgAwRh+ath21Oi5u?=
 =?us-ascii?Q?9+hBao699L0U89/uq1rkf9nc+ABK/ZdeFf2w5MESHSb3nWy9T1jopugmKLLj?=
 =?us-ascii?Q?aZf+6+mKApmJENCJPIsAR7ZTRH96kBc8XhBtTMkYX0RopG9RpAo01IDwU186?=
 =?us-ascii?Q?COlVuCASki7CSY1ZMXBjp2WvKjr9nV8ZIvjlL5TYmKGl2iyZY9YZ5wZeC+zI?=
 =?us-ascii?Q?TGI+iWLoNCgQE+XXDvMRCrJ+LmOLnJtnrbB9SI/GO834NR2JcqTagzFIGEht?=
 =?us-ascii?Q?xBch0GQDjr92gUJu2XOlu2j69Rk5g3nCL2ULY3aDPg+vKbfT3x+yhFMqyQEQ?=
 =?us-ascii?Q?Ky5YdqvsD1zHZsMli25FCTXy7tlYbDl2LljDjO84ccIASwfwhuBLyfS7tg3m?=
 =?us-ascii?Q?DM2xtWsSFNAEdHxyUvdzQ+Of0Y18vpwfWS5S+5tMvDc7d2ey6xYxde0zrH7y?=
 =?us-ascii?Q?SkOcA9CtN/941m4R6NikxyrmzMmjwVTHxZU+qsxu1td+tJHxKee0l8eb5yB5?=
 =?us-ascii?Q?5UOYe8jzcLnYNPy+QUxJkO9r1HFuyodJfUJh9jqbTOU/8wn0ztFv4538x6w0?=
 =?us-ascii?Q?wwpZAzhHZZZ7aEwXkSUFVucxPQoTIm5/PF5RJqaoKVLIJ2b8kEbgKtDlUzmi?=
 =?us-ascii?Q?o+gxtBYSJLJvxrftArSzFX4mfRWR+VxgFaBcOlIcu73tzAiNGR4KUMF4B7v2?=
 =?us-ascii?Q?tS32ya74qbUiCZZNi/mofNjkFwbuoZwt4Xs+4eHkRRDwWhMSFQcmVeaBCcb9?=
 =?us-ascii?Q?qudFrmYG4Qi/AmH2DpHO85ZHmioagWmR7iAjRjoQHXdTGH6J7aUGvyFJZJLv?=
 =?us-ascii?Q?69nrgMHeOyZKVI9ZMBwDD9Lkh255UwQeT9r5RhuspeZiB23zKhCN64RLAxRj?=
 =?us-ascii?Q?By2bXB8LmZddgyw2JxbxpBzZkjgditnHi1igiemffcF4zdBdGdntFSMpsiUr?=
 =?us-ascii?Q?cB4fD8BHyTuX3Q+ju7LLb7KeO9njvuz9TIJBsVZkkwC5OIinYBmmxCX9aHyM?=
 =?us-ascii?Q?QJvEu25dVD0I6qcOHGQW3+SSlLhJ8AfInxrxstvTHnoiIO1UaZVZZfFG7qfL?=
 =?us-ascii?Q?4s0mYug23Jr1jLPq95n8uvjZeG74GNztbdr/Z647zsf0K0zLgvHr90gle+Fh?=
 =?us-ascii?Q?crJkAJhr11DzFFvZNzl8yXKCiRmIKj7xhnZVL6Ly4HnFCDP7AwD3o6bYjQm8?=
 =?us-ascii?Q?IUg/sotSoxNc0JsHDV9xb9ThvwSCNbJ8xIk1B7ZO2wEnGOzwCtCdx4MJ0oUw?=
 =?us-ascii?Q?4pXziduMSn7HFkJo2C3I135M8fJXOiWkiYeFU8fR471pPLsEmhMebTrjV+Iu?=
 =?us-ascii?Q?VLV1qNEsI6WuW+K3GzPai+bFP2aB1BD91tY6xctWqDnbBfMxtpoxS1jfri10?=
 =?us-ascii?Q?N0Jux4kA/hlqbPgkJePWkh4m41Le2SrQgpd7Uiaik+hxFkTvXaxJ+Rcp92vn?=
 =?us-ascii?Q?NW5TPTEZHH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dFcOrcORboVpnyBO+cHpVuWFD+y1CRISr2wQyJEp0ZBuF+P93qpdE39UPBNx?=
 =?us-ascii?Q?u0DThcHgesiqxfpEf26k4V94Guk0waruO9nOwGKDt7dPhIQ96YMmN+skWmzn?=
 =?us-ascii?Q?DTEnwMS6lP98narM2Q+sR19q5dI6g/gKwimD5ljmr+t8Rb3VFu34bMGpXQlx?=
 =?us-ascii?Q?Ld4SWdhpKQsb1Fn82E2RpyuwJ6jR2wxYsKWAg30MOH6Pybgy6Hwv9Z/aQcLi?=
 =?us-ascii?Q?tafYeefnx/RkLvL3I3C4JUmHPg131aEvZulc3YZB3mDpPz4LmixVzF1skRz2?=
 =?us-ascii?Q?/BYVXDh5lzoSrZKdok16h+yPhhfWkJoXMf4Z4b7r95Sf8hvp8QNh9FaMSTBn?=
 =?us-ascii?Q?i1rZUfrJxOEcWNZeJkX7cBskZuJenYdOiUaR/ksaAMmjEUmMp49R+SfuNPQJ?=
 =?us-ascii?Q?pAnt6/AkbT4XsopVm04vs//rny72lgAY+kyt8Z7IV7KSE8f/YF6U5xHaOrIW?=
 =?us-ascii?Q?togqFEW9YWSmrKGO7K1dHOXmPBYyARNd/ysXWkglNJuB83o0hLvbnPbbaNk0?=
 =?us-ascii?Q?v1LGCXCT8l4JpaK/nA4sA8PlLIufBa5Mbo2vjbSQk+EKNG06S16mNcQYkK+8?=
 =?us-ascii?Q?ijP0Gj5jFnJ5tcRf0dyTJUnqwk0qD2/v4YSfrwliHcnXUFiuFZQr8RwoHiAv?=
 =?us-ascii?Q?MZ3lGEiBL22m4riZWcr1J6NzrYJHaEFtVUp5H6O25Zkd9Vimtv+XH/GmHomN?=
 =?us-ascii?Q?2JL7y/ioWJjq5++B0EhIA0i+pSs6bshvpqQJCWvgzPsuRfsCBdpzGrFuhKsK?=
 =?us-ascii?Q?od1Wy2tc2ylnKc9RaqhoV955OIoLmxYMYDY3JOmBNWhk5mNlvPnawgARRLyo?=
 =?us-ascii?Q?w0E82IcXRDKhrfdc6mmAu552L0CVx7Suz4T1sevN3z4aeAxN5RMb92Xp9ZrS?=
 =?us-ascii?Q?67/4T3cp/Mx9Dg/kNZ3NTYhKIIS1taHfrYVJnUePelNpp+uSZ3gFKnKNaLJF?=
 =?us-ascii?Q?IiQQ3BXKUPdImOegSev3l6TEEVUPlJ6xKkJogcektgFn3rq7q++sMXEBKN7v?=
 =?us-ascii?Q?zqevDKQ2cD8Dl1KS3qCzOkA+ly/wAN6ZHMDLGdpx4LFrUunD7NLM+5em9qET?=
 =?us-ascii?Q?ik1178lB/1DfRPGrVKkOrasTl3LB3LtCLt8fuMHN8UYU5UPub1rZokeGkIFT?=
 =?us-ascii?Q?vWJA3TwcFvN0KVGBgGXULOKgqjIt5u6Lyq487+sYhBKy/It5D+RngRV9u2FJ?=
 =?us-ascii?Q?2F8f4PRak2Buyjn0jrHHIV1+QdrAfmR1mqW6QGpx7KVePSsctUFX5pUwsdDy?=
 =?us-ascii?Q?aAUZY+7FgZCEl8Fr0kUpu30Gf1sw3U/f/4QmO+CiSWyIWGkTgc/vgDjwm5s+?=
 =?us-ascii?Q?Asona6JyZaQPX25V//uXtuGNypcdWJ18inZ5vxol2RrC6709dCntzWz0Vc1R?=
 =?us-ascii?Q?/XJqQcM66tBQr53Hs5fMyIarfKsO+tb7cvHEsuAgsY8PiAfOirOdmNnvJPVU?=
 =?us-ascii?Q?nxvuhffdpaflbNPZwFr/3i4bwfddrGUL4moSSuqW35pn7jKSPPcJIBrH/htn?=
 =?us-ascii?Q?cob1gDx0mfc/kgwmk8CLenyec4owHGFgKItUP8jwMQ96y83V9o98zV9ALIXb?=
 =?us-ascii?Q?vSQXz+cxXKITpFGepE8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b563a7fc-9801-4605-b31b-08dd7c351319
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:49:15.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CimLDqczdS3EyQqrUSVGAFlywuBzqjkOEcdsUYTNmMFnISxzGP87dgKV9f/bxpPjAyjIIBDxX/Z+qncNfCUQ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9323

Add missed fsl tzic interrupt controller binding doc.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../interrupt-controller/fsl,tzic.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
new file mode 100644
index 0000000000000..5f2c8761a31de
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,tzic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale tzic Interrupt controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx51-tzic
+              - fsl,imx53-tzic
+          - const: fsl,tzic
+      - items:
+          - const: fsl,imx50-tzic
+          - const: fsl,imx53-tzic
+          - const: fsl,tzic
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
+    tz-interrupt-controller@fffc000 {
+        compatible = "fsl,imx53-tzic", "fsl,tzic";
+        reg = <0x0fffc000 0x4000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.34.1

