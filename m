Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B419A288;
	Mon, 14 Apr 2025 03:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744602618; cv=fail; b=JuE4o7DhBF3gcs9KRMv4CmlpWW39Gp+vYJrQKBer2dzpsDyl6dYZpcI6EUUcGgrXs+REjFm2qDDhXUdHjs/JdrTFtiygZ2cPtxoMWF2fZP76OWuYRTO9hPKQB++R3m5m7M/kj0O2a5xKsdq2Ckv0n+xLH992ZV+8MV7y2/1rF7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744602618; c=relaxed/simple;
	bh=ifzvTBfTb4/9hVr8tLYxSA56cO3Rlw58m31lTEpg79A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lMyIxXYc/X2XWfSfZrtGMUNCic8MkB5Jw06pyUMMAE0KAFDtz3uqXhsUM5LMOA1/zYXpc6qFLA2CAdb/ddNK2zWTgNNd1oWRFK7BYGddfqUh5tLNEAM8w7pAFBeB9itbKpgm3XLgfQMgF3cAZvT/zMj6agMVI1MTC9UM1XqvFYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cBmuAvtp; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cBmuAvtp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxhO7+pT+ork5PQgAmX2T7Y/DRagT6yoBvcVdShIsP0sB8Cp3ZsuBYzQBOihx4eQLp0OwZvIMGYDazrAii6adC+V11tECSSZwI/2A9Mm1y6SEKD+uzUSbq8EO7MMf53/ML82r3rdjakyNSeL1d0B+5s0zeWNc+zS+khxbcuumEIJZKIypZNhGWyWR1WB9xvu6dU0RiX3RDEd9OlpxKVdYt6atfWnoPg6rmPRC02pkzq8a0O1Gc2L0PaxIIAKMl9jz5fGiNtESXDTtOKwsbw5wQ1U6CF0KNazDQIh1fdMcbrjn2gPQe7x3Bvr2cjbysMQvEIj4fabF72cOACEUGiT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckA8owsJOfD07LtTlOhM6GT0bpfWRk4pEoqtNw8MbAw=;
 b=rmrNgF4KoRBmbuYB5Uj8ttAPgKSU4x7gjp7T5jOMQoH+gymibZiIxbbbhmj3/+9Ja9U3GBaJPfI1Lgsd19hjVIxOCIlnR+IDZd7OImHgdqkMUDvM6bkTrQuwEIQv/Tc4oG1L+UmwGFyG/7t2w5bbA2sNGkb8vsH1xZYgdViavN5SDKIMlieUxtzE98vVq93U/V3zPo0S8teAkDVhsn3CAp7wK9d1kwiJMU5mVK5QiM4zqnhVUwQ62yKbRhMZLX4O7Rrr507DyQkr8kKJx1TRf0KO9jb+fhxCzr4tDcWCi+e9GAgG0UG9rJYmFXAzCUp3+yWH+ZtVK5Nbg5PcCQANpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckA8owsJOfD07LtTlOhM6GT0bpfWRk4pEoqtNw8MbAw=;
 b=cBmuAvtp8/xdemr7Lb+QhJ2z3DnatKG9BanGJkl7Iw5G7ZnX7LCIF2eNUJICLcD2wHcoGRmTkq8UED2qILsPUMoY7PpiuaJvamsPjnF4a+1NT5LW0CNDmXdS/kOQFa2Z2yzip7zSI9ZGVyWOVNxENHrWpTcgQglrFPepvtBW9sbPIHg7jnFNOkuL736D0q7MJvXkcVhM/Kj71j+82ljjeh3ve0A1OQQ1aVNqhD38BQsU8f2H5w7Di9Qee9+YzFN+jCDh38TNPvjGeKrY/MpAoBUL51FMAaUnLN8JHrwKyKEAg+lYb3fAerrMSRvCT5+USpa1M68s2ajnp5ee2YWEIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:13 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	tglx@linutronix.de,
	vkoul@kernel.org,
	kishon@kernel.org,
	Frank.Li@nxp.com,
	lumag@kernel.org,
	aisheng.dong@nxp.com,
	agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com,
	francesco@dolcini.it,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v9 06/19] dt-bindings: display: imx: Add i.MX8qxp Display Controller command sequencer
Date: Mon, 14 Apr 2025 11:50:15 +0800
Message-Id: <20250414035028.1561475-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: ace2de80-d75e-401e-823e-08dd7b07760f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1JyhSjuQLruB4zkH4ffa/6DUTsvuPqdj2av3O+1bhG2m0Egl+0N2hH3LsO04?=
 =?us-ascii?Q?Vs0IS6XBxenXfyw39mh/HlJAgyqvLu9zPS0mrOhfRsFRiVunt4b7NyorY9Px?=
 =?us-ascii?Q?VsJhR8s1V+cdes5MWgwA2MvUCxNFerSJmdQfkb3Mcpe57opkjhAhP54GsQnQ?=
 =?us-ascii?Q?AP9lhs+vpd69TgcT4QcIni77OYJUMgQ3aYnTT4A1Ys3b0+cQvjkNRmBkl3Yq?=
 =?us-ascii?Q?bGjC8Bvb/gPzjJabQfwvdrNzaXgxwkUQQ51OhyXPQ1w8Fv4FTZjpmaQuQJyR?=
 =?us-ascii?Q?du3K0Vwtv9nFO74BW6+N/dts2/FR6udwKkp0L3fA3mrUD5UiGeLW3bjQyGBg?=
 =?us-ascii?Q?EGeObe+HiCq+ZW3ZzpBE2ul5YT1Rg13rvfC9Y5VVwzwFXBRbTy9z/HWsNCNl?=
 =?us-ascii?Q?/bnKawi1ahvD3OZ9yD3JAfDPK/UrKJumTmQr/t+82uqssLRoovtM/H1uM3+p?=
 =?us-ascii?Q?m4z/cyG0xsP+q6WfzdGJIvtlcjl5Ovbt74kqSF+mqBo2F2HU7lBk/ik5yH8g?=
 =?us-ascii?Q?utLNjGaZwvXEj0oBzOLvzECzCVZte8sdKFFUlqKGkTLxRMmPP0HIGVuUJ8hw?=
 =?us-ascii?Q?/V8gT377cZ9OI3Ws4AKBr51Q/AC1vfg4xHa6AFA76TQHMKvJZjUlFkTZA/Kr?=
 =?us-ascii?Q?XkH30DJK99z+L57xIE4ndYSVXs8dQRTZkDjWomF2leJ1C9lwSc8mv6mIEh2g?=
 =?us-ascii?Q?IS7ydVKkf2Zvcey2T/vRt+jjVjqg1iBKMpX6IHpYjd5cNieTVDuejyG2+Aqm?=
 =?us-ascii?Q?EIyE6vaN4/mpIls7Ifvd+Gh4Vz7A6H46VF8fCqQjKd0BzdiCRGB1MO5IGblR?=
 =?us-ascii?Q?z8DokXbDse6KPIKmVP/eORKNy0AS6TU46cmI4V987BhmBnw9e8NzrkQxh8bU?=
 =?us-ascii?Q?qJ+NVjVi9PqF2G0y+TL2PlbEIVAmqWjSbiNo2tqLj5yXxjrACSkfQqvRLVUu?=
 =?us-ascii?Q?11YoGL5wb3TOUAWvhNs/EwrZg1YdoOWH7ksMlhe9v0bQB/Bk6xoW5Hn3PJCi?=
 =?us-ascii?Q?BKAB9Lg/Rl38zE4ws05vjzYkEIWiY4Uzm7ViiE/qBN/q/K1M2Pnnd1wKngCp?=
 =?us-ascii?Q?1shr0QEooHZTVD/3H21q5mSz22Rz0qM8dnWNwgQmmhcHVhP4NhhLR/fWgJz1?=
 =?us-ascii?Q?33cHViRrp7qd+zwNly0Z/na1WUj9+NHKO+U81j6Hz8LJhP8fjPkeZGG/tSXB?=
 =?us-ascii?Q?PVbzlp4imBJqmE/yyM/93uFPiDO4+TB9ubsfwBzVlbtStohiwIIc48z6q+LL?=
 =?us-ascii?Q?MGzUTzl/b5R8qiWPfEyHIbG936S2NgNrYZIjKlpwz6fX8JylWMD2tCTnzc9C?=
 =?us-ascii?Q?gfpJmPk82ilKX3H2Oq1FmrqC0yAVeQiuMK87lpgoY1awYQy9IRqxOoSZOfLf?=
 =?us-ascii?Q?dW5qMlAlhWJc4q9InSuy7q9te/8crxp0fr7hV36SNhuPCg/NiEhBIclDnyfM?=
 =?us-ascii?Q?B75BW6zVbis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oIczm3PBlID3/xshqy2JzAHulj1J/LHhKkJJa1xFd6WjeTsM4NECfMoTt/qN?=
 =?us-ascii?Q?0Wq8IQz3vd2MSxzFPviCWatk3KClAl2XZJfHdH4zChC3Zc1ElV0ScljIs/xq?=
 =?us-ascii?Q?uFw1k4LGa9teMMg+kTeky/O4PJVkmH4gk4/uthykZ/SGz7uuxMOc8LFbMB0a?=
 =?us-ascii?Q?A07gHUE26EwVX41dFAgKQtP3n1ZrdWwggppxBi4xkOcT6w8JjgxPvJOMhn2i?=
 =?us-ascii?Q?4/OoQwX4oKJaf0mjfvsJRmW93/b99UwPpu5GB3kIQp4qWdyuaV7rUunbzlRx?=
 =?us-ascii?Q?Vt73sQevdwtY1gsS0q5RjTc0g7n+QlnEbwzpJNaIGoA7FXzSyx5ti7YCNlbi?=
 =?us-ascii?Q?dKuC8MCADtoZ5aJYSG7oxjhfmI1iPNeRBVRXORNAAdkGx94s7fLjpqvJJCK+?=
 =?us-ascii?Q?vunHTKKT0wmzz3AA4uZgjXg4X3MN4amSLKXbPXn1Wbqa6tOs0Els+LP3pwI8?=
 =?us-ascii?Q?I5o5a8S/hY7HU1DbkitQQx524SJrrQTz2byjb5GBcBeyzIPDCHF0OJ07Fs9H?=
 =?us-ascii?Q?FIOLixTtruz9FJVb0UsNeYMkpxafYE/RdQ0hxaE8sj+1OTe7ZkXR/aZVjN2O?=
 =?us-ascii?Q?JI1zrk+Oo5YmDGkSNCY1Mg0Jj6zNhIorZyCTJ0Q85ZlwlVBKRMoYjyQcpPOb?=
 =?us-ascii?Q?Xroz4XOUVQT9g8Bk/SMsBiFjjwlYNUU4KbdxKcPKpmssXclsY7xaJcU48cB3?=
 =?us-ascii?Q?IUaTyeX2QbLuDkGSgJAa+lw9ranxpXOwi0eGgclpzZKx3EwVgpEreYl5CClz?=
 =?us-ascii?Q?PFCxX65bPr+nqwko0jUzLiXfMy3Ryjvzje05uodnNnGu7kJMR0RCPup+vQAY?=
 =?us-ascii?Q?Jk2hcq9Xq/KEMzK2vHjHgBcp2FHl1pMizc7NC8nAkGG5ro6VwyKbfVylpzCh?=
 =?us-ascii?Q?LVX1M88uNT/EwuV8wkNj2F+dDz+uWw+vvza/gk04BrckqcxYv+Ilc/OIntuP?=
 =?us-ascii?Q?dGbkOTAmHdguE62Ui+8KtxfQ+6LQ3ZXHbsSWcEhQeXaKSglst62knAbnVEup?=
 =?us-ascii?Q?Z0FSxIqDtx7jGdMrRaPeR8hFPSGdt2Gd0Yv57V3aVQCyRN6Mt9SB/Z0owfXf?=
 =?us-ascii?Q?t74t4v78JnT9BNrQF9D3WOOkqwl19Uyniz2upCiLbiNxeRM1GIABV44xYj2W?=
 =?us-ascii?Q?nS7XZUwsUX/kK3b2AfEOCTjje+JTIdGKfidqPRQNyKoudlGsFuLYp5XOXJY6?=
 =?us-ascii?Q?a9AlW5lxqs/kK3BhzMoKGrOghmG2tjab3d/KXbTFkhRY87UP1exWOaGGZpl3?=
 =?us-ascii?Q?6lbY7XUdxx2czn1p0NYo00fKh+mc2ksIKnqa4vTcTf+KReXgpO4Ep8MHbIvO?=
 =?us-ascii?Q?JH863zqx+ZtE+k9VAPfMqxH1ogQORv2TcW37UbEJFxmtlAbkGoYKNuPe4YPq?=
 =?us-ascii?Q?B6dPkyhYGydQxNpDAk9dlyDqlO9VlKmnmQ5Ix0ttp22GLkIq91miS90yXbm+?=
 =?us-ascii?Q?tN+Ksmi58TA+U6+lP74SGeoCo6umc+LVtUf5Zxvl5tckCEj5uWulxdzsthaI?=
 =?us-ascii?Q?QwAj+qabPyeD51Rl84q9i4kJGCHmAm2Q2iDsdfD38pk+foeJtQbU2zvlg7st?=
 =?us-ascii?Q?JYYk0BrS6iujYKES1KVIyegbJOD0NbZct/nK9gq6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace2de80-d75e-401e-823e-08dd7b07760f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:13.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bkm0eJvEuUF1ZrBYxc6kYaI8xzToVNPEuuS3qllI9U23b+VnlnR7gTG85fojKC4Vdm2L8NmjO5swnFufBKSZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

i.MX8qxp Display Controller contains a command sequencer is designed to
autonomously process command lists.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v9:
* Add Rob's R-b tag.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* Replace "fsl,iram" property with standard "sram" property. (Rob)

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
new file mode 100644
index 000000000000..27118f4c0d28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Command Sequencer
+
+description: |
+  The Command Sequencer is designed to autonomously process command lists.
+  By that it can load setups into the DC configuration and synchronize to
+  hardware events.  This releases a system's CPU from workload, because it
+  does not need to wait for certain events.  Also it simplifies SW architecture,
+  because no interrupt handlers are required.  Setups are read via AXI bus,
+  while write access to configuration registers occurs directly via an internal
+  bus.  This saves bandwidth for the AXI interconnect and improves the system
+  architecture in terms of safety aspects.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-command-sequencer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: error
+      - const: sw0
+      - const: sw1
+      - const: sw2
+      - const: sw3
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the mmio-sram device node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    command-sequencer@56180400 {
+        compatible = "fsl,imx8qxp-dc-command-sequencer";
+        reg = <0x56180400 0x1a4>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <36>, <37>, <38>, <39>, <40>;
+        interrupt-names = "error", "sw0", "sw1", "sw2", "sw3";
+    };
-- 
2.34.1

