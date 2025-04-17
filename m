Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012019.outbound.protection.outlook.com [52.101.71.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD022475C7;
	Thu, 17 Apr 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902386; cv=fail; b=LguzXQjefsfW3/YHT0CTXuHb9NdbBD0TYtUg31VwxEyKWs/4tvwZhptQdiP7K2R2dt/WPKCONUuhvraB3Kbvdf1wL4N7bpXg9dMr6zUb/mAmPupNFn39sC11Bl1/WxYMYpU7f0mZ4SdhuoD7mTcH46dnAXrn2PgHEWg1k/2/Cgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902386; c=relaxed/simple;
	bh=3G/tN8ColP12vYMvimTsQ4xoYLKhDsxhUBRCV7z0NXc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mfH0cjH6PgHzYKmbEZ1sxO7FfP+yo/9h7q/eIkitqDgMeZSXPvCdoy8h4lH74nhX/JhUtvXmD75iOO3ua98zi5434D52SnbiIYSUZuMVSpx/htI19g6ZkAtRz+YUspcEuR4bzrWniWCyzzXxowFWEyWqHzzRzUzzNT4tes/ouV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c9xtZnby; arc=fail smtp.client-ip=52.101.71.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c9xtZnby"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRb8Hnf9yQFX3U0EJl8825X0f8cYRxJgLBlABSmmXB6iP92ji5LJ3b5NWx4D2u3quLoJGTnHyecE11XOCWQ29TJACKYVPlUSJbzPX4hKP23aBDL4RS9hsD76Q72MNQTYYAzp4bHsbtPwgFErqgdL/1JkAWG5LRZdYvkmPcCMTy5b93EgbVHFIAr99GBaNvaqcJvMH2pk7cW3LHzMHNw0nSWaGJSg6mvT/oDkxUOo6zp7UmzFcQOzt1c8t+30JZE4zMflqoqiC95H+MYY3Ya0kMZlGBg9pyp9TdTTr5TeimlvGBFCQf+H6YrWUMgG0vEHcjUGwSEwKOalSw9K6953vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk3lo6Cqhw4w7rUgd9MfqlcCEj8ZPrfcKCOTBWZACYE=;
 b=emQn9b5U3q9esKP+9r0H6M9dTwkpj3vuGdKwRNsSW8cR9LI0DCK4oOeHYxgc7PBkCKbC8z0RDtR9tJzJWbdNlBktL2NT3OyBKm7rSSi3ba+AIP3YuzUXYiAUmY2ldd2a1+EUtg7ofiQfLdo/8EbvYFY+TEuhNzQHZNPxxycdh77+cgWFlXNsvRtGbKrqWiGK756x4kIBDY0zbMxmFywAq4DdVP1UwfgqM+XClwyTedJzjebG62yndC4UERrQlQ5YcJa0fEKEoX/vNOmpflCino48JmtrA2O+PoagRKwn3KOaeaGVdSa3BncvrNKgghLsVBTtKzRAnawyBukVTV81VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk3lo6Cqhw4w7rUgd9MfqlcCEj8ZPrfcKCOTBWZACYE=;
 b=c9xtZnby8Ywn0IM7zuLIN5dGSw8pcpBmyNxFdNIePf+btJgNAFye+ziWhFIUQkiJe7oRPXGVqW0bRy/lnAUVCAXrSe+Z8NKRpWcpdZH09e/dzTSaka2nUVZxZ3FRUkuJdx7lkLpwmz6vuzMiz6q8FindJOUWQwm108Iljug1cjXY+kAsvuYXGiaTM8y5fxdzX5yfJFHpSZ6I02ZbpLYw016nnRBvFObsDqUNiZTc3Jvv/xjwMmfZngxi4YjwXglVsK/srKRBgiMIutzhDhFJUXQfBwyL+atsACaPWzQ0pQa++rN3FSGDys/hFqJTluBojp2w+ANNadQAb195Ke7tsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7245.eurprd04.prod.outlook.com (2603:10a6:800:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 15:06:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 15:06:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: fsl: convert m4if.txt and tigerp.txt to yaml format
Date: Thu, 17 Apr 2025 11:06:04 -0400
Message-Id: <20250417150608.3569512-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 029dff3d-cb50-4994-d29f-08dd7dc1698f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vouHIzWUSL0U2csOjTOWBYYA4peIQKV7FLZDKnzhSVOyvXKXqyUSkzmNBi2r?=
 =?us-ascii?Q?tSU3AroXPnX5dcfQXYj94AWkv1pH0gbMeqbJsarsVrY+idEW7Xusm6YlndUg?=
 =?us-ascii?Q?epXXiN7mYrVnxVUfzwB8wpQ3rIr7vvNRiGqEOGawmRTLFzlRhQ4ABFlygk02?=
 =?us-ascii?Q?SsF5ULz4ps598WYGU1hQcdET1Q3aUvkJUEddY4rfhI8I8tp26AEexXv8xUxd?=
 =?us-ascii?Q?XPhYCPme5ZbK1wijNzZ2061BgZGRscsUobQssZPmYkNXrlRphgeC7qSp1epR?=
 =?us-ascii?Q?gDavSkbaK1iOREfGstPiX+Xo+hnUkrEKip3/SxSVjMLks9u9jBWISTJ5zI07?=
 =?us-ascii?Q?RXgqJFltG2I6g7kh+6hMHfne0nwfIf8cpDQ6Sh40A5lg7P1oDzNBv8b5AjG9?=
 =?us-ascii?Q?24+qjgFM7ErbPFZD8K1wSSGz2VEK46HWy5MPinzIVfCGxaVnV6D+OmG1cMmy?=
 =?us-ascii?Q?HxLqL0A8qlyCkvxbVTbSZ183mR2mu9niHtMgDwgExezYFX1e1vbCdXq2Z6Mw?=
 =?us-ascii?Q?Qwx7ozruFLquUULf5/ouWQ4nuEgKRhg++usAYGgWTJ1TUYTaMex6oRR/KyNY?=
 =?us-ascii?Q?R75jLPBqfNxIrrxvyrOgUGynChLqqZTWqlvAlc20TzEYtI7k6RcFouTKw2mA?=
 =?us-ascii?Q?8sPIWsQdUNYR6LbFXS50Lnpoh4ZFjbMzps9zYdm5h2J60Rhz/cti/KFQ2+Rd?=
 =?us-ascii?Q?Z8qIspW1VOR9ifj6k8gK/xxq85Kfx0kV+xb/feOVrKwWg4W8l1AwepgAavBz?=
 =?us-ascii?Q?v7Xgvev15h0JevlxFTp5cx0tHVT7YMJh2cINbTa8BUQvtkwYgF4/TNgOcI9Q?=
 =?us-ascii?Q?yWTcTwi+kRoSUdJ/ztfwgolvZ6DqXutDygJDLOYHrB59cV6LSkq2oK6XM3aS?=
 =?us-ascii?Q?58gEz9SMD8xbjht2ou3BIb0ZQWfe1CvcKTLPtTBWl3W9ah/UaV2VjaFUSXNb?=
 =?us-ascii?Q?q5j/g/GVdGgGgoMUAYeZ5jr8zbjUthEnT2YaLfLmK3E+CqIA4gPA5bvspmJe?=
 =?us-ascii?Q?tqeiEmR23ihrPhLibuh5igxb2GBUdqZDSojNLpDw/PLZgZt8nwIhkmfwhkHf?=
 =?us-ascii?Q?OW3r643DrurNKNriNWRNgj2x6Ds6HA/4fIggbZmHDC4E0aeKsbi/AHb/1ows?=
 =?us-ascii?Q?6CPH7x4UfY/f3QwVX5wWiP/o9OfWdI1V7sM6HqbHBHiAq8kQSbt8gNIrg47f?=
 =?us-ascii?Q?PMhpV8pb3ZZsK1KmMdAMSHLW18lwa3fseq8qdX453JiFziCCwxAFmZeTy6yT?=
 =?us-ascii?Q?ZWFJaNRizAu2LPdo045FI545gcpGjo8riSZc3+C+0mlZxKxXBCCZsFhB/6+r?=
 =?us-ascii?Q?2/gbKmzHAIZ+cC2pis9dXZfdx7uT/Gmuj41f4Dn3/Q70OgFtP3tg+lf5kqDQ?=
 =?us-ascii?Q?UeGr6GrhwkSjUntuum8LW3GHZZYh+iibxaBFaVrwXdrEo4Q9Br2vEP/VogN/?=
 =?us-ascii?Q?PAgK6h5oIhPP+OFfJGKr/X0QkW0VZmjC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jRRwI3CEhIswyk5wARpYaNM0IB/QB64qAlJQrsraO7Qz2KBujsIArpshutmj?=
 =?us-ascii?Q?xwd61AmGLq6MX1KGWmcCHErVDZWePUJ2sqBwvzgP+vuGVf7cLM2zuQmGs8aX?=
 =?us-ascii?Q?dj1jXwl7IS0Xz345XJnIAIsnGeU6NV5sEVN1sutQPunJaf2lx6iH+/WZzz9R?=
 =?us-ascii?Q?Z2jxWbnpTMZLaB+X+GaYHiONSlKdUyayupPI43vnvq0p8Scmz5KcyKuR8Sxu?=
 =?us-ascii?Q?RQv9Qd19ZaTibl5UfnHnrV1LRIcUggQIJWfWBDH1PS7I/n6anPQ8EaZfZC1C?=
 =?us-ascii?Q?sUCd51D0GN3mJbtQ3ZlxeJvE3ZJ9t3SyEfEGHWFR9c/AUmBUtQNKhK5NqCCh?=
 =?us-ascii?Q?6LRuP2NjzXN12pBHefMHPIFx1hNxg9O+ZjRpG8x6FgW2SZktGXS0dDv38YkN?=
 =?us-ascii?Q?YfLGB6gC5EM4CoX2jAg0M8PHGmrYrV/g7CZseg/rl6V/9cRvETTr5hR6wVo6?=
 =?us-ascii?Q?n+NQu9PJoqzLf7PIF4JKswdbEv0GLAaOKI7KDE5KUzeSF0PbRniknBOjrfrU?=
 =?us-ascii?Q?2I2hn5g5yPbrCyQ6we9Wq2ADBg5fo+1h+EtEBSzBgM1tHUo2P9V4sgqTlbB7?=
 =?us-ascii?Q?BGlLyAyPHj27Hy0sQflAlb0xvlbe4mcqxp8hkEVFdQpFOMf0QZ/WkR8I0+6H?=
 =?us-ascii?Q?+JMm6YmGL8Svp2P+u1YKB3C1/zE31nuVWcuz7lU16FjydAvt4pailzG67u10?=
 =?us-ascii?Q?m8Rm82RHgkqq1IKBMQJIwKba0F1fxn5UaDlEMWpBNSXn69lEHMpULn0GM0OX?=
 =?us-ascii?Q?CGvF8m40LIWguAgEj6Abxj+IGKwirZa8cdQ1RJLVHQWyovi5TdBYwhFfFOsL?=
 =?us-ascii?Q?Fkq8dDaLPWE5tXTzZUE61/GaLhPTlXCZ9kZTtcvKRPtxmfIABw/M/jHdeyes?=
 =?us-ascii?Q?/D8+qdtvVTb6HbG+yDX/1ju3YEQ61sIneN5bLTLYFtWnCVHbIgIXOurz2IyH?=
 =?us-ascii?Q?iSbkI2iVJS4fjp+pWegI6fjxq5A2XFvF3xqTSBWqLOG/WlieFdYGEIaC8tYw?=
 =?us-ascii?Q?npBMKuP6akm2Vv9QQOuyEzYIqIgl51bPm7/kygmoPjJRTlfICB1m9r/UW4HE?=
 =?us-ascii?Q?UAmQ7BmZO3K60uV3ILSyg7FkvNbELr/GZgEJsfXxIuAkX6DfPr/kyL/ush+D?=
 =?us-ascii?Q?SEuI96bFRGTmqZpsqG9yPZb203Brhy9F8Xo6fXRJ1lwf1Ij646qPpQ+2yUmi?=
 =?us-ascii?Q?69qzdyeWlaWRWtWDNnnIiUN9oiRHSxw55N5mMEz8dqz1FSvvhoLq6WV9rYkX?=
 =?us-ascii?Q?ceRIW6LWdq2ZSsYJeiaTqOW8W3R+10qbdlBV42jHO4y3ljEWPvPzT6xcJpwX?=
 =?us-ascii?Q?dC1BfPcbUbFGiLJCiaxPqoq1FJFjNB9k1IT2+CMNqEWq5i03mRiXFnVFoAzz?=
 =?us-ascii?Q?fbTeSx7KM10HEdzgOojDU213yNCJzGenxno9iLyg8wj5O0cnYenkSutIeLVs?=
 =?us-ascii?Q?1a1c18GVZn3EI6s03tlIZaiCe+0W1BuNi8Kmi9vfc1ylwNBuVGVkKYtcWBMw?=
 =?us-ascii?Q?iuaWzaQlJfXHQCUsnZq7bNs6LpnVG50NSh9XNPxYiJbeOidM5i2G3D7As5oW?=
 =?us-ascii?Q?/XuuDrSpQ8cAdpyaJ/hF+JrpgIs7sA7Y9oeF69/n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029dff3d-cb50-4994-d29f-08dd7dc1698f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:06:21.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wgpOL7xaP4YQQ9urvz32co42fVMhRJuP5QvkfhGdtGgxrHsTmlxwmq8X512VaCWpsCOEiWvpMbYBEa91/VcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7245

Convert m4if.txt and tigerp.txt to yaml format. These just use reg to
indicate memory region.

Additional changes:
- Add compatible string fsl,imx51-aipstz.
- Add fsl,imx53-tigerp and fail back to fsl,imx51-tigerp
- Add compatible string fsl,imx7d-pcie-phy, which is not real phy and just
indicate a memory region.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../arm/freescale/fsl,imx51-m4if.yaml         | 41 +++++++++++++++++++
 .../bindings/arm/freescale/m4if.txt           | 12 ------
 .../bindings/arm/freescale/tigerp.txt         | 12 ------
 3 files changed, 41 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/m4if.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/tigerp.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
new file mode 100644
index 0000000000000..1f515bea39599
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/freescale/fsl,imx51-m4if.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Multi Master Multi Memory Interface (M4IF) and Tigerp module
+
+description: collect the imx devices, which only have compatible and reg property
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx51-m4if
+          - fsl,imx51-tigerp
+          - fsl,imx51-aipstz
+          - fsl,imx53-aipstz
+          - fsl,imx7d-pcie-phy
+      - items:
+          - const: fsl,imx53-tigerp
+          - const: fsl,imx51-tigerp
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    m4if@83fd8000 {
+        compatible = "fsl,imx51-m4if";
+        reg = <0x83fd8000 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/freescale/m4if.txt b/Documentation/devicetree/bindings/arm/freescale/m4if.txt
deleted file mode 100644
index 93bd7b867a536..0000000000000
--- a/Documentation/devicetree/bindings/arm/freescale/m4if.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-* Freescale Multi Master Multi Memory Interface (M4IF) module
-
-Required properties:
-- compatible : Should be "fsl,imx51-m4if"
-- reg : Address and length of the register set for the device
-
-Example:
-
-m4if: m4if@83fd8000 {
-	compatible = "fsl,imx51-m4if";
-	reg = <0x83fd8000 0x1000>;
-};
diff --git a/Documentation/devicetree/bindings/arm/freescale/tigerp.txt b/Documentation/devicetree/bindings/arm/freescale/tigerp.txt
deleted file mode 100644
index 19e2aad63d6ef..0000000000000
--- a/Documentation/devicetree/bindings/arm/freescale/tigerp.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-* Freescale Tigerp platform module
-
-Required properties:
-- compatible : Should be "fsl,imx51-tigerp"
-- reg : Address and length of the register set for the device
-
-Example:
-
-tigerp: tigerp@83fa0000 {
-	compatible = "fsl,imx51-tigerp";
-	reg = <0x83fa0000 0x28>;
-};
-- 
2.34.1

