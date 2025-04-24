Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012000.outbound.protection.outlook.com [52.101.71.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB0F510;
	Thu, 24 Apr 2025 04:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745470516; cv=fail; b=ZOhAy847Ul6UziYmO+xRst9JDrVM/kn6n8VTKsTET1g7b5Ib+9O7KjmzSFbYOnkcWnVfq5BiIfGPNfW5cSJ3hlLxs1TE76kmVtvlamlEp8Qlo8DHUSRmQQEySuGqra9kkpF7u9SkUF+zG2VwSyh6Bq1e6r2iZw2WFEv6QIaSK+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745470516; c=relaxed/simple;
	bh=mNiyeKphsVWbEel8rQpSfINi25jQznxsAwvFGfexoCU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XgHTkYsifV68mgb2XmaX8P96CcWDtlGwCj1r8Ppt2HeB+/WuvVuItOFK5j3r3U424srcTYmFj25Ev3uyo0qSwa6h+DClqyXCErcZ4UzkKdWTeNLIZfGpf2MwQyBLINZ2p3Qqy+i6EFPklsMCBWBfo9tq8N4gD3U7KPa/kCGAmRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gDMR6fTj; arc=fail smtp.client-ip=52.101.71.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gDMR6fTj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUPB8iUlpRG6qaG81ezzLj5l9qZLgqw6iQosid7aaK/wpFg9dx4SE8dQdomLFGYJwYKKlMVhl6W3SJukRZ6i/6MlrIJf5Nw2a7N+xzYhXQIWMSFqMQPjVpUCQdm9umFoB/x6JsXd5hGF4O8IGQPGN0wOL22LzCxXWDExEjs1J91ioQytazWtkXGsqEOfWRtlZYH74ShgEu/wP8aCA/a3GaDvIFbbspbS2u0T66P/PniUD47f3UR9bUFLQMBW/bxb4zAZZwugLQn9C5Vw4P9PRxiVtwzA634ShjJl4P6Zqgv8FP4shpH3YPgJEyI1eG/yUDtP1+QO7uP4pLONDyu5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQudHJP7t72S3+jEvwc6vXFDbWD7W1EJyMFmTyiew6E=;
 b=YDmBTNz5n4L/t7bchIufew6waa0rlKPLpMPtWX5bVXPh3sH0IivhFdkytSc90cpdNbuaRSKJGKwhsQKxiP6lvajOAjbfyVyBmXHMyTdQZLoyb7U8kMXcpcTQNGxHo+3kX80PVUoKO4NAEzmlkR0nOFJuBx+FwhxdErXgqzKlGXUfXJWAp//0YmmG36B17uz++KOz0DVinjCNWHC2arMe8H72PoalZn23B4TDfXOUlwdn5Y8bnGIQNucOYRpDyYd30pMsGrY5/1/MRFbz5FiAaWgVZ4zaXs2SJ6A1TRj63vv0L3kGnKkWTdT/YnCbMJyA15H6eOc+yp79HqsZPIeJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQudHJP7t72S3+jEvwc6vXFDbWD7W1EJyMFmTyiew6E=;
 b=gDMR6fTjEGRL3zsMW31Lw1Lp4ERE/kwzkcje5j39dYGXQFjHz1IwN1uDNSRs1Fr0rlKC2VjcYUbRAn+M/xyguL4qD2zWwbHgilfQKVYhSf3HwQVBI4/C/TwEOKBMM6r41xvqdw0M9RXQZBiHzmOJvR/1RPG012V67eyjAFA76hn8+LvxmWUub46nDxSEEjcvJ2mbcHXRy7YrhW2RQ27I5cZso65zRb+B2iCBXQvHD3fSumnWMRQPDL/DpH5ZKgUKJSjuEhFK8mCy308Qkb6RTXVFFNP+GPCH9NpCRw/S9O4Nm+7tDhrt/d4RLg87wTD/Ar/rWzPU9odirqM9L8ljWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Thu, 24 Apr
 2025 04:55:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 04:55:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: nvmem: convert vf610-ocotp.txt to yaml format
Date: Thu, 24 Apr 2025 00:54:47 -0400
Message-Id: <20250424045448.3876201-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0093.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f433a9-0e4e-4762-8f79-08dd82ec31dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gXuU0Pra9f9LE4QnzWdWXPPtHu7Xs7M29UG3oLpPuuvGWxeT/bouJpT0G0JL?=
 =?us-ascii?Q?rkUR3bjv+cYWhiF92Gy3wec4qdmtfZcRmtEJhkoVMRYdmMqQXvcEksTpdVZ2?=
 =?us-ascii?Q?G8wQWSLz6JR+IdFJAYCCZeDIumIoo9Jdad92eG5jrVvgrN/yVz8MxyVyHDh/?=
 =?us-ascii?Q?4Y2fQB6UY9KJJfEIakg7jFcE2CcJZ9u3GDUdTWs7x4yMF6j03OfYEyZuoUjj?=
 =?us-ascii?Q?Q5Yh1ozy8GQJy/YpWoFYbmQFFQd9+ykplJNTmlg1GAFddSjo8KioDfi6v360?=
 =?us-ascii?Q?ie7rjUbG7FAe+63Uw3LZIN9b1IIU0BFTrGRqJCCsz7GbIoS++fp5pDhCDInV?=
 =?us-ascii?Q?V2bv6VTq/IXqdAQ8rg81/yVUudzGEkH6whzhpxuYYBsNPmLACe0JV6f9UOmt?=
 =?us-ascii?Q?2yHeAVIjboM+9xx2dQhGP5O7P86el+VMND8J12+kILP1l/ulK9Abr9KlYy9o?=
 =?us-ascii?Q?A1CvD9h+icsY+5XexsS58m7f9MkHRirkNCGZC+843nT+uisq3xCAMH8UF7K3?=
 =?us-ascii?Q?y0Of+nHl2bwWSvLYpzbAcifuL/aRdWotYEm1V/hLrAiP9xhRsCPb0GKmpwni?=
 =?us-ascii?Q?ouEbZr4KvSl/HNgg6aiu+OyoY0F8i3gipfyqVcwxOx/Vr/n0Em9Toq3VlNOr?=
 =?us-ascii?Q?ABMB4y6bGdoieFydSdfuRrmDZfouSDvEE9ldRTy/06hVqxMoeHzWOqsPazpY?=
 =?us-ascii?Q?B9esxmigljNAqc7/GGMEZeqOZuAsbdRZzTIri990LkpSGypZOFdpe1I7p5Gx?=
 =?us-ascii?Q?vr83QrnW/3gWxUNobLeXrsFaaS/lIUT+e2pxn3+GbeBemH4TRrVWO1Wqt7No?=
 =?us-ascii?Q?zEMpd7zlG/ldrT7Xf9CT7o3DUowp/rGTTjsHjm7RqdudZrF1gmLAgBsPgmbV?=
 =?us-ascii?Q?E6bMjH9eBK/qdYbNZqjEjL8UPziN7qjFUvUj2mUTivshQU45B8WCSjog7x0R?=
 =?us-ascii?Q?y6M47ZX+y5IeuG4SHHZaarX0zZTA/D1nyC6nM4TeNExR8hQFibCswCpZAhzD?=
 =?us-ascii?Q?gzk+ENzGAKeYT6zhvJrL8YB++40VWjXmcIAqMSstwV3VGHps94RdFN8wLoJe?=
 =?us-ascii?Q?Td84Qg7YCBcsVpNI2BHjNIqPivHJWOZAqEZxcEfpN2Rwm4lI++LOajUbE7aE?=
 =?us-ascii?Q?kaon8sffq/sFjj6Sq4Q1PMvN52myRAKCxjAXD8NnfEZWKzVQ1TeU08AOgb8U?=
 =?us-ascii?Q?vfJUjdfabC9CuvfLItkqIICKwuszjjJfiS842u0rFzvJtoBSthdp3pdn8POi?=
 =?us-ascii?Q?Ae1eiddi23yPlMkqYEmM8B1T2R5ihO43zN/W8wqfRBrOLKZ6qOopNjbohOoh?=
 =?us-ascii?Q?/NO+6cTk4db9j64rLgi78VP5DPsBkTPrK5ytgaL/V2EsBHnV1M30FyiI/9UL?=
 =?us-ascii?Q?UKVXNL4qBVdYGkOghCxOaiITw4pBLudwW7Gi4A66vaFErMUu6VyNiUIi66au?=
 =?us-ascii?Q?PzUNkgGhpco=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hc2qcFTftK1HnMzm/zQihIpselxud1El/Q9efKOsRR1/HF6pi9UFm//SR7hi?=
 =?us-ascii?Q?tz5tfUDjV4FQJGDfF+Os9VQ5YoazqekKuMho+2cvwhk6h8PG1jPMdse1E+ya?=
 =?us-ascii?Q?xyRk0mLFHCY3o5c7jSTGP4S9II9EkbNEe7+ICLDFyKfOMjYReZRqtHYoPFm9?=
 =?us-ascii?Q?4SBD1I/O7Z4wC7Wyl+SuQerknpEbt/GzJN6VsSkYvtE7R/itsS9049VdUBln?=
 =?us-ascii?Q?8myJK3KiaWSO8AKdgLubdQCUHuL/qq4JOcx1ig6lZPawk3rK6llJ5iR0A6iY?=
 =?us-ascii?Q?zsEH1sOYM1bjJxViutdPyWaq7jArmu5QF7Mluz+2hZC0VWYZ2gBNy971MJDJ?=
 =?us-ascii?Q?ZfWi1bUVG6MpKU/18KaH011rVQwk0iNUrcpCxiqjoplHg+p4paRhb0XLA98X?=
 =?us-ascii?Q?nJ4UJ83aBU833DA2K3nlMVjd1eW9rpez+ktl/Y5hEQA7duNmNW923zD6uwRY?=
 =?us-ascii?Q?E2vaMtDiLMo4Nz0ymfDkMrHMt42YPoDfPZdY7nzGAiU+ug5X+hhY5ksR8HT6?=
 =?us-ascii?Q?UmhlQOSbjnrClv4YxqXrv8c1k5OFMOUjKCsCb7T1CbVw35s9XB/7iGVAlnJZ?=
 =?us-ascii?Q?l26UmQSA2BqbxOqtcKomV3S337G8FYtyFj2j1g3RKi1ET0kSF34SAV4108qu?=
 =?us-ascii?Q?9Zvq3V1dxjXlYaThfoE/SQmayap8tZtjOOJ5Z7muQp6YT4rNm5qxHLDVQ5E9?=
 =?us-ascii?Q?tyTBBr6toDLUswDF2ZM5pBDUQOf/zrzsizb/jgLf2kTHLVNjXePfxHVXVGZq?=
 =?us-ascii?Q?yXCnaAIc5r+8aR1Z9RfayaBT6Dl+TktRNaoj/WULrJDFqzeFypjEwP4L3NKZ?=
 =?us-ascii?Q?lPQCMPQGpo5y7qnCmvANUb3dtZyjuCPGK9NE/zrVqZFQTt4evn0oLYZlcGme?=
 =?us-ascii?Q?rht7GKz006YiN9bj9M7qKXspOJ4z2OztQfdG9umkp0DquNrOh7BJVxhEMf2K?=
 =?us-ascii?Q?XyviRUrxDcCXm2EQQjvSQzJmcxdZoDcCShxXv/Y/knJhaAew5w5Xa3Bp11N6?=
 =?us-ascii?Q?Kn2m0+RzWwWgWpvgqC7mZ/RaXTBgsG/B+OHMgAOJdsNZQ6i0RdaU+ke/gmtV?=
 =?us-ascii?Q?0d/+NY2YBz3MoyY9fkYUZk8MnD8/H2fcctzthhug80XT7jzn82s8h7r86lss?=
 =?us-ascii?Q?folOuQ8L/GIvUu8defAsY9tTP/LGcqM5xTD3KI7qjg3gdcs5/vLjlgHXztzB?=
 =?us-ascii?Q?Xs9ozJU/DmPqzXY361r5/VDch2fnWKbq1ifx27Qjms+rzl/xXn+ur8AcF9PE?=
 =?us-ascii?Q?cJkMMSSEukL5hwefjrz5fgcfX1kczIUDMR/Sg1LdivOQxnsLLNOX3R9jh1ZZ?=
 =?us-ascii?Q?HvOtMvVgiFvr2BczwOs9whcVEbfoO5MJEs5785cqvKZjjIUdtcEqRRwxwHqY?=
 =?us-ascii?Q?uAd4H+DPw5xaEnhiSx9hh1ayoNQrUAVHteUgrwpUUMiEkzPzymGjIzakJQnf?=
 =?us-ascii?Q?d6xMeYbwLt/iL5tP+J6iUyBe5yLNyFLnjj3jonlIl+3fgHxy0oPbG9IyYzEY?=
 =?us-ascii?Q?jcN/y2LFGxlvwIcg2gI/EYFy3h9P29XpjppRy/DEbzDZf677Cf1lCoTN4uQq?=
 =?us-ascii?Q?orsuymqKfpcOUHin/fLYSNW8KlNeAaVFzgILhIio?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f433a9-0e4e-4762-8f79-08dd82ec31dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 04:55:11.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oWwKHjk0qdAUFPR2MABRoGxx27mpj+R8vcUq2bAmwPWHKt113gT1dgEa5u/Yw4Dk+FhQTCH/xOLrOUPpuP5TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

Convert vf610-ocotp.txt to yaml format.

Additional changes:
- Remove label in examples.
- Add include file in examples.
- Move reg just after compatible in examples.
- Add ref: nvmem.yaml and nvmem-deprecated-cells.yaml
- Remove #address-cells and #size-cells from required list to match existed
dts file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/nvmem/fsl,vf610-ocotp.yaml       | 52 +++++++++++++++++++
 .../devicetree/bindings/nvmem/vf610-ocotp.txt | 19 -------
 2 files changed, 52 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml
new file mode 100644
index 0000000000000..c37069f4f27f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/fsl,vf610-ocotp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: On-Chip OTP Memory for Freescale Vybrid
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,vf610-ocotp
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: ipg clock we associate with the OCOTP peripheral
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/vf610-clock.h>
+
+    ocotp@400a5000 {
+        compatible = "fsl,vf610-ocotp", "syscon";
+        reg = <0x400a5000 0xcf0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clks VF610_CLK_OCOTP>;
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt b/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
deleted file mode 100644
index 72ba628f6d0b0..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-On-Chip OTP Memory for Freescale Vybrid
-
-Required Properties:
-  compatible:
-  - "fsl,vf610-ocotp", "syscon" for VF5xx/VF6xx
-  #address-cells : Should be 1
-  #size-cells : Should be 1
-  reg : Address and length of OTP controller and fuse map registers
-  clocks : ipg clock we associate with the OCOTP peripheral
-
-Example for Vybrid VF5xx/VF6xx:
-
-	ocotp: ocotp@400a5000 {
-		compatible = "fsl,vf610-ocotp", "syscon";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0x400a5000 0xCF0>;
-		clocks = <&clks VF610_CLK_OCOTP>;
-	};
-- 
2.34.1

