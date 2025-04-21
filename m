Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64777255E4D;
	Mon, 21 Apr 2025 06:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215479; cv=fail; b=Avljt8E0IEpbCAofMdBoBOPjfkrK9xh2RMWqMCuh0cGWpLSlfKGCRlMBbstT7IenzlhBQKM4OH2DWOcOWbr7EfrkzG9hyttH9sG0byKmi40Nx+pzRd/24iqf0QxGBn0ckBF1fpX+7nhrnOzjrAA1ZWprlonxtmqZo+HgIpFidnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215479; c=relaxed/simple;
	bh=/IPDGU2djp6gkxvhP4RWgzYrDrh+P/8FAfIXnszWAq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ge5dY9JXHwOC6Nc8ciw4vqG9IRLNNndo/RI0zrJ59L+8vRdbaL5KRC2/E0BwLNXD3+OnsPzBT/xbmmC6NqWgaD0+wpXYJnCH6CEDIiQCtVa1DyCGMga8kNLcQB1jpnGS3gq+iqH6UAbMOPv77jHRsOuZEkCScRkGPW7mlRQzZ2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KTtyd83e; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KTtyd83e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRvsrt3yUx+nUk1PRoKoMcV0CDcKoNGhiHnsSZ92UvpK2lnoZswH0JQ3UYrhV1XwLrUy+95wg+ATEPyyzLbLWA2yK2IE85x3eZr1rbw/GUp0gjhIsgmsseNYxPWdwyDANGc8WemQWuiTCuAI5p9PWM7N/xi3PBfr7QVPDRLNnBiOzDkREgi7fAb+2CFACwVuQizp/hKC63gdltXYamXZw2fPxYSbDxV8hJzEb0PCtKIb1FpfCkAPgZZx8q7xSm/jcSBWgGaDSymXadBegxMkGuTWDXtizNydHbTr/UpMr8GdaaLmINj9qIHp3EGSPa2vOigrYM6CyuwPZMZ9wPnprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q55LxG4AE8q+du2EdrnKCjiMLktTPXhwF7AxzFHw/M=;
 b=E+Shyv1jhrupDD8wki4ho9XMhpj0xWwzak4E6Eogx5+THG0SfRneIx/frh3lltTWLLnGUsHzj0Myl9f+lkBRSwevad1NQdF+remlFSanack1Hc/pZLzD04i8f6iXLTxNKu4DqcSGLd63fkgB3J0guafaSWP8oHndsdW6oODBzA6H4ktEFcP/VAUJ55NpF7hFnVkbB2lDxFV1MRCPeLCKhHF07qWNpqyFiQS+bvV3LvPLjlb/HC6EccL3pJCfxGolmmIgEeoItregZY9xYlMMbkl5IM1TBiXLHzxyOhdIW5hYnCBvpTvGqgOK7bsMSMrhlmR4wFbPVNKx2G18tdHmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q55LxG4AE8q+du2EdrnKCjiMLktTPXhwF7AxzFHw/M=;
 b=KTtyd83e/9+wT+VykeXWAapXwTUqSW5F5VURvVMATffGd/DjjUQiPnh76uV7/mTdJ+dnrmODm/jnueHxz0EDLQjHcfCSSB5/VgkcaWGg0xqgj8ptvtgbpW0WIEt7oFRS4x4JAVW17FIHpaQ3d4j0gq/AAcuzLgGmNGwETf5nbpuzcySWxQGS7Yw1IuhyByVFbHuDtCt1sTJbrOgi4hZDXjBxcvEEaAA2Zq78S79GJr/TTi5qtCqAPe2FmVrcc3N2B822vj259nJXITY0f0KTfgapx4DQ6ujAREXJhmEQApqrNKbb+ZzUlhBrGaKwKi+a19O7BLgxP65QmsmuYhmXlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7646.eurprd04.prod.outlook.com
 (2603:10a6:102:f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:04:34 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 06:04:34 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
Date: Mon, 21 Apr 2025 14:15:42 +0800
Message-Id: <20250421061544.2471379-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061544.2471379-1-carlos.song@nxp.com>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To VI2PR04MB11147.eurprd04.prod.outlook.com (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 012aa5cd-e75f-4d90-129e-08dd809a63d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PMvBMpqJgP9Y5QeEZLSqwgIZMzqwVOWSbDeAeGlY0q5GtmsWnHcD10nfcH+b?=
 =?us-ascii?Q?k8ekCUP4UXn0LpUEeVdyC+DdNBk3th8+GW/R1JN9HTxXw0Wey0le2/HITD/S?=
 =?us-ascii?Q?m0sOZiQtgnSm6jQHxjk49BEgyQFB4OTBUAVr4rXvsUaBEdnWosHZ7LLc3+Ux?=
 =?us-ascii?Q?2OtFMMygcYTM1cE0JYgje3UnCr88ljZBZH0W/mym6NRBe9U6p44/8ZNaPclY?=
 =?us-ascii?Q?uACtGr8Mmn5GZyoCbneowTUKeS2ovNWeQ2YwM/HletCKfIYwN7xc+BGLiaR/?=
 =?us-ascii?Q?u8HUy7OvbaHRt4KYa6m9RyZqAe5271QoI6q3zzqEwSVe4bC3jFWYd+/IAE7f?=
 =?us-ascii?Q?qPoyxjx83U0fpUrmaWDeTHQE7kB9JFFI8VOhe6g8uYvhS8vYZAhVAXBzpwEA?=
 =?us-ascii?Q?XoHbDcFi1Gr7SvT6oDmhOyMBQ3Mc50BxmT0Zs1fsOuIolrUQHxyVUM1NTtva?=
 =?us-ascii?Q?kp1kO+o9z9J5RCjSUtBonylEwfSbbuH+DyCum2l/D4iC6MbAMD7r32yHjMru?=
 =?us-ascii?Q?2NE8os1sUtQPJyRgn3CEXKJwUqSCFA3r+NXMD0XkoZSJ+wvT42EGfRveeWyD?=
 =?us-ascii?Q?it/WWLAzczZ7SxWtTDgQ8GnmBqqaCJmNErwKZJnSCBhMbiZCMKZU3BUvfHtQ?=
 =?us-ascii?Q?ZT+Wdk+Wp7WuN6n4/xgG8C0S3LULJ60hCLjkleicrICYdUO/31t/tz8ZI5yw?=
 =?us-ascii?Q?KiZSw54ZNOpAJy4wt5jCu8qBJJy8f+9mJvJ/X2JuWbzQkzEpNx9dJwM8mqvp?=
 =?us-ascii?Q?BbvkxZb63nnoe1neH6yKUi60VgA8fXxrIup015eqfS74EExa8tdkcN/qbW3c?=
 =?us-ascii?Q?P7dsu2nTlMIfZoVkIPJdQSAmixj97tHlniUbR66EnZ4AQcTrAfSjmzQrYVbh?=
 =?us-ascii?Q?EcGuVj0DPxomCnPMIe5nMtGorniAyrrj3c+MBzuJXSNi3XxfIY18Oi39KtxH?=
 =?us-ascii?Q?GZF3/yXTTg7jNKtpgEKnwrc6ZkqE+YW9Whw43HeC68vVnC+1WFRKqlxdylZV?=
 =?us-ascii?Q?oIk9DKtvxncKz3WC+eu9iJXDmW1Df05lOYBr7zXfBzWoqxp0lkLKiKrNoQlH?=
 =?us-ascii?Q?KqYs8sUlTq6YQ1I963pWCico5v0C0zClLqkH+qdg6RTVP8JUjsFspVrREc0f?=
 =?us-ascii?Q?7Gdt6mhSe1NkPOJY6an9adJxMCLTi/BiS4yxKOISWkAPh3bUp3cxgjwegQLb?=
 =?us-ascii?Q?zjYdI4sNDdnORF2/zkdD8/zLOPeAlOqzxFN1WRmx251YnXEYiZdklzwoBsAs?=
 =?us-ascii?Q?tNobi49zRP2FRyxK+soJqk+ECmAE0H3JJC2yCggtGs0ThTKR7PBHdfEPyN6z?=
 =?us-ascii?Q?C1HxmXd/wgdHitK8WutmY5eCHuGoOwujRlXp28EPZhxQxf+3DU3XdH/FMbt0?=
 =?us-ascii?Q?LrVWlQ11uJin7o0aZEtfplDquLBzs2ZaJ5gNKaIpyHI8h0kLvSeaPwF/5lKQ?=
 =?us-ascii?Q?gN87EFpPyZVEHgM4z7LXSEGYYcpb7/PkumQEDXs1m+s01SzSaHP8BwccwiDo?=
 =?us-ascii?Q?7Cv7SORA2aHQkzY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TZdymeX+YUqRhSELPki/ElbyQa3gSa/InBaDbG9lHfOllyAqGoUCCThDrQfI?=
 =?us-ascii?Q?nQM02tiW2iKh8Nh/mYZX3LgNOoq9swrw5iMMs931TlVK/c5l7yEYVGh448e9?=
 =?us-ascii?Q?yg14YdtuSMchXkyBlPsZImm04FfP2bo5fpyRZ7zTh0e4k82XnB8h+2zaqLlj?=
 =?us-ascii?Q?9nHQ/JcrcWrHhcYEzYT7Ev4xh1ciXfDA3yaxNXpq7te3WcNO3/M5zJ7yRciN?=
 =?us-ascii?Q?m7oGxF5NROWTAix5gEVpt1qdgHiPj09FdCkQP4WzDcQSmw2IILc8bwH6VCWU?=
 =?us-ascii?Q?iBlv+nze/vSA/eiyeHtZcQcux1G+8l/Ygx9l9ti2G6QBBzv2umUZ1qjq6tOq?=
 =?us-ascii?Q?fW6voKBc9gB+b8vvtU7Z4r+E6YnqYZIfsWr4k1qhobzmZfXwktikb2yDOzFl?=
 =?us-ascii?Q?U2I8NiaeGgn5HI7J8vG/VLI9CXEc+pau2yG3Ftm13trnVG7m9aOi7HcEcK1q?=
 =?us-ascii?Q?bk/ryv50Lv/w3zBjk7Mgpls5vY/TMsOa4YNpxmRfPYr2z/VJxkzUjk7nVGm1?=
 =?us-ascii?Q?71BS27juUbWV5M3Diz1yd5en/hVFwvGJ3J51eQ6saF6UINOBa6JXEwP7ULpF?=
 =?us-ascii?Q?S5/SnI0y3EoHBJKHDh5UG2Pu6B20302XJiXOs/7bY1+2oEjpdSlrAXFhwihg?=
 =?us-ascii?Q?eAOSpkRDe29yGRxiivZ86FrApn13ZDmgROPmm6T1/9V0eM+Wnehz0bPukxjW?=
 =?us-ascii?Q?Tvb5TmJWHr/wvsCpL70c8eELaiVIREaTSIGoTiy9ONFkwrnWepnhpeuL3yNs?=
 =?us-ascii?Q?7nHMi2S5V0v45dfdMGE3m8Nu5+2mklS+egGA2WICanjbKVkalHDWh3DIz0Ay?=
 =?us-ascii?Q?Jksgl4d5fIyfOXAO8sRfUjYX97KX1IPC76aaYiPLgHfqzTsqx8jDXK2KKKF/?=
 =?us-ascii?Q?bhvJMyVgrLJAttOd+cv4BKO9TjFhPnOY5iXxE9SdNWl6u55P3XAfNoeja82K?=
 =?us-ascii?Q?5zl2rmYU0Peq9cmZlhiRKy8r5ByLUPJFM2485CCqX/aSIo5g5jj8yEjb21mO?=
 =?us-ascii?Q?QT0X37j882FGKyycTKpEN7BItVNfNIRlVL+jZ6YvXq4eF9mg5P18fd4evL3M?=
 =?us-ascii?Q?n8xoHtZL4M45ncGCNCazba/ohPnf0VeQcfaHs2LmnNXnpB7md6TPg7nxhZOK?=
 =?us-ascii?Q?4ewFmtshXVGm3FXE8t0s/R35cYoJRKeCImQcU59M9hAedh8OD9mrz+8XKj5p?=
 =?us-ascii?Q?gDLJUuYEtjJSJKgITc8gXW0jgVqfs0CWFCEiFJrtGkWcIBhM/FuD+q6fjqE7?=
 =?us-ascii?Q?PQynj0tF+YiipoUVQ+xnjiR3lkkMV+zIFawlLpzz4MVX5TBQ9bXQyzr8ZLXc?=
 =?us-ascii?Q?29wfGWNhJqopRBqDRHFNAST5AgiiPSwz4jhqy88UVT7pfUw7jI6VHEGIr/4l?=
 =?us-ascii?Q?x+0rRuuDXL8Lpgh/zu0PfzxnkBPS1BpsimBBDyGQMrYA7pZK4JOS7d2S91rL?=
 =?us-ascii?Q?Ilt01ID6+9qIOs41QpiCYApI1hP0PtJU3VMxKdHo1ImIYUsnhgA3B/yaeLsT?=
 =?us-ascii?Q?a6elnrO0G0vncfAEdFA7p93leWf+WeFIj0Ft6rosAdbhf8rmT+PQCKn34WVp?=
 =?us-ascii?Q?TnYE2xxAGoFsyir4rpLb7I/MG2PcZB8/E4A/ZMer?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012aa5cd-e75f-4d90-129e-08dd809a63d9
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:04:34.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1XTLddp3zT15io9Kqe6wL5/4iZDARXk+MucJ+J0s+8prPpspAXyiwlAv0Nm54QbKJj25PxO6WQgGc4Vq3jApA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

From: Carlos Song <carlos.song@nxp.com>

Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".

Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
three clocks. So add restrictions for clock and clock-names properties
for different Socs.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 4fbdcdac0aee..9255d35e2854 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -9,14 +9,17 @@ title: Silvaco I3C master
 maintainers:
   - Conor Culhane <conor.culhane@silvaco.com>
 
-allOf:
-  - $ref: i3c.yaml#
-
 properties:
   compatible:
-    enum:
-      - nuvoton,npcm845-i3c
-      - silvaco,i3c-master-v1
+    oneOf:
+      - enum:
+        - nuvoton,npcm845-i3c
+        - silvaco,i3c-master-v1
+      - items:
+        - enum:
+            - nxp,imx94-i3c
+            - nxp,imx95-i3c
+        - const: silvaco,i3c-master-v1
 
   reg:
     maxItems: 1
@@ -25,12 +28,14 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: system clock
       - description: bus clock
       - description: other (slower) events clock
 
   clock-names:
+    minItems: 2
     items:
       - const: pclk
       - const: fast_clk
@@ -46,6 +51,34 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: i3c.yaml#
+  # Legacy Socs need three clocks
+  - if:
+      properties:
+        compatible:
+          const: silvaco,i3c-master-v1
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+  # imx94 and imx95 Soc need two clocks
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,imx94-i3c
+              - nxp,imx95-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

