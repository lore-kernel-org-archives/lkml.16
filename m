Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C488188012;
	Fri,  7 Feb 2025 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958472; cv=fail; b=Nz144n3EtVqp6daVbdkWCA9jNS5dOxaFvxH5nA/PVesb/5JwuKgmURrKXk6ZgyOXi8sQIcyZKEZ80iatP1MMGhGVbHTh/cBl5uBdQGeYnWadlMw/SV27nHqL4lqztDC92H1pPVPAjPMTXrUtMrXu6tGQ7n5eDZ9BUtLe9EULTus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958472; c=relaxed/simple;
	bh=akENQDdLyfDzYewe2BFp1dr6g9oI5/ithbnIeGIfSIk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CqDcxwmL06Wdb0EX1fvcmT2Am0SvzRWBhMJDGrXKxjFidj45DBOjoa1r2ij6OiyynvlGNM/kLgAqPWfBFWDm0ZmZFAK8GpTnww1aAPcywkDw5cILA6ihhkoPCsBTvyOoCPXrxhPQhm1d7vc7vEcqv22VEoR/RlZJVnp41idpFeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LstRp49O; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LstRp49O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnr6vloaQ2qNCsnrF7JevVbjMnOVGtIW66PYAOE5bLQ+9dOCJIA4uy+jtzBf0Jw2pXTu/gyo9Zs56XBQ66AljyNSyLSHq539fWsOTdlQ4algyKQcB7zH95PfuBM8DPRLQ44xfNfnnYOZz/GvKzu4SltdWmRXDGNmZvfBBsWAJeR3s3Fe6I3ynXX9XAMwTjOWFnBIboZFoo6JZDVeoQqigpeFO70Y5VBrfU5r1Po3ua2kdBUeknVmzWxnTuu3f81QUFDgTmsUGRWPf89/5LROGhN/9REE1FNcNrTWoUto0nqpz6ROlgD8CdvbaN0b+zfpAEnujzckplbYZiv93yp4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNZwe/ys3ZIPrHEqVqbzpUlmd1VbE1ney6LbzSlaLXQ=;
 b=eQ1Y+iTkpTXqZo4zXJKnqwSx5eS6DZqRIzR02V6NvbekZu5qDNPhKrtkxOfVlbAPD6ViWb1caK+1KpubPFHCv/LgDiwQ1sbcLt7HbmwNEZEiGv+/ymzca38P1iJ0BRdR8N5gUauYXpnvhQDL5eiF9iOXhIjYtsLRBSiPe7ZoHuTkuDslbxemmASq4E6vbDBc8zBmZB6LJhmLDziP7fpczugbXlGmARUzFxrpTpuGjLPSw6ZdZ9t3kPdESWboKrOVaahWH9kk+KsVwTcYHwe/lIPdgDAuSrwnZ2tiavshVGAvagG05nBqHETpz2AdTD2yY8BV8bj31sZVUDEAQy1jXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNZwe/ys3ZIPrHEqVqbzpUlmd1VbE1ney6LbzSlaLXQ=;
 b=LstRp49OW3k9gZpvc6SI8i69atsHEtUZ2jYwAKQ0tO7MViBxRl5a8ZcquO9I2i/fxKKzsQBYibNUvETBwMA1gXqrggkPTQ9UKSP4vZXZK7ZregH6Zygnc8h6e6kuM141szDDGYvZ8TMz92kajvRanSA7MTKBodB6Mi8o+8ETluvWkZ884efXx3UsNlf8f2+V6jyYjodul3Ud2c+F/rikIXMIMRKK9ngA8Daj4Nqkv9Y7a0eiwLO6SfHRAuMmhCp2rCzsAZZ7n0KOVxUypBHTFur8jGCdJE9Dbaq2ID1k+f9r5Mbt19bnFuAGFNpEQMCk/+Z+JDMY9kosIyRlkhaoAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 20:01:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 20:01:06 +0000
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
Subject: [PATCH resend v2 1/1] arm64: dts: imx8qm-mek: add audio-codec cs42888 and related nodes
Date: Fri,  7 Feb 2025 15:00:53 -0500
Message-Id: <20250207200054.2201819-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 691a762d-bbaf-403d-7fd4-08dd47b2284e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOGjSfWoilUYBK3MB4K+AnAkYgHBRP0VOscmcbm1kNzy52pQA7iaTzoSEyYm?=
 =?us-ascii?Q?U7TmZgUpkFGTupRm+EtY0nJFKwJhuAX6xzpsKNz3oOI2b7z+McdZMiELITpn?=
 =?us-ascii?Q?q+HU/zN+f4Tjxbdl1V7Yz+9dEM5FnI8bpSLhcYIsBF4snIhgfuYKGUur0YwE?=
 =?us-ascii?Q?4Z/ZEfxAF8CmDycuumtSJVRKb8CRZZduq/s3usmbuvXQFUnMJYIILMtb/Gaz?=
 =?us-ascii?Q?/sicnrG/zi+lDelXZfGI83jfj4dy+EulO1YGvGXfM5s6vlGusx+PkFrK8fW0?=
 =?us-ascii?Q?FXa9kgtsp1LNUX0YP73EJqRkRv2ClEOKl5/E4FxH4ExGEgKjDhlyIs2zqBWO?=
 =?us-ascii?Q?SFpNA/4y06JJDZvbxQgJHQgqEzo2pIApycnSs96+9KxbfdPaed0gkoEwgh9q?=
 =?us-ascii?Q?YY8QIkn0u4HWU0jc7kZxFJQA9THLIm3FyfGss/iRQP3a1T1pE0DcsTbk84fC?=
 =?us-ascii?Q?aAyeNlDqRcUWatiefRqYhmzjWbwKcyytEcg7mobFmF/pCTQwagIgWBs0/7ei?=
 =?us-ascii?Q?yHwNQKOhzwYGV+8TVVjpyubIoo3epueC6BZRcV2kDhpltmCcKdB0y/6jfz+X?=
 =?us-ascii?Q?TJHHgx7uQG6bvDc5aCwB//TOAk6QPNTBfPBT70AQQSQPZ5XQ2lo/1cWeQUFt?=
 =?us-ascii?Q?50UVw8a86xwxbadKMecmyAfaf5ycCTN3NdlZKGHBqb99S5Kn4DgwHOL+EO6w?=
 =?us-ascii?Q?037SaD/9l4W/i7kiVEcVREth+HKWbwxvKj+8C3BIU6DdLHme+MEmp90mF0Wj?=
 =?us-ascii?Q?eCDbEDzUmWStCOhgnTiY0hK6V46D+1ggUAE8e8o72DGA1J3Y56xehSLUFtL7?=
 =?us-ascii?Q?j50G4w6k7AsQFvwnH1rc2DNXVtc7lio8n0qr0PafIv/cAI8SdchjHjXP524R?=
 =?us-ascii?Q?8bqSdzjYP+3SFVmXwUmuOopadmmj6kx7sPhfs1Nx5nlwzoRHyIPdXk28WhFl?=
 =?us-ascii?Q?3pk+MqjgU6OwP7hZ4pnsK8bowqMqBPMGKv9C7DOhjMGm7vFNoS2A5MYb1cjL?=
 =?us-ascii?Q?FLigsc3vCxCZRRv5vT8lzY3BifVulgro5H2zGM1/pdJKw6sgqMqnmNa2kYlf?=
 =?us-ascii?Q?AWCg/PuA5q7T/q0xaZemO0Is23xy2XipfxOZ/qpd39221skQXtk9kw90Jyyg?=
 =?us-ascii?Q?N5S10+tOc+K7bhBemSDJl8okZfVlbn87UVF56s8WDm2hC9uaJ0ljde59xFGG?=
 =?us-ascii?Q?avmos6JrPW+GwRVRU4eOUv/iQPcMT+FcK6pVQHrpO+tCK+mTSnQB0gDr1T5I?=
 =?us-ascii?Q?B12CWsIcL19PN4GCgUKZu3OsPoWMdxPoIQalvDmKz3mSkSMsIZnBM34qungy?=
 =?us-ascii?Q?nZltE2Q3vT9F0RifUai9ra4NxCjtuICFRbEvhRK4MHrb8/6OhPnGqAhJ7Cfj?=
 =?us-ascii?Q?2yclBAN+zpXaX8DSXuwa2kUC1nD//nQ6cXjrJplbDwYMpnj7F0AUR9x1YCJA?=
 =?us-ascii?Q?HcxhWjX53lYAUReo6wnJEqXvQKukQTts0wa07mIXpsRtrLxzOLYvYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PGjfKTWPi9H30MEY1sNECkP3JiLXiQI5uhi03Sw/hxvhLs8oBQMocRHDsXYG?=
 =?us-ascii?Q?iUN1SMqgxu+8IVbGkMhC5nTOsI81a7VTeu8BHzP6Y64d/ifPrNeEkNUOS2eQ?=
 =?us-ascii?Q?CX+1bgoXvWoYzZpi93k+xlsSgh5PMnL2TjuIjNJXzsqpnrgu8DWuzIIq93xw?=
 =?us-ascii?Q?5pxRdJEarOyrOvpBBJQxjB1JzxsZXZigfkXRFu7W14N9DKK24le/DkFY7Hew?=
 =?us-ascii?Q?+Qw8yyoW2IaX3KcXjw+GTwFOKoS4It658u8ZvJFW++d+PR98HxQUk8RGnHk2?=
 =?us-ascii?Q?A6w4TBIVfXuYIl+yU+JwNp0nMogyu0Aq1RHCoKf6gjaLotiJC5cLvq2ggcmx?=
 =?us-ascii?Q?dqtZ1rgRBzB7eo8jtNNsmiTQu0DUexjIx9sLHiPKAViQNz52xD5T1qEl7M06?=
 =?us-ascii?Q?mYjOKHm0bWHaDk9Gfm8XTeGyvChnMvJVPjl9ihKUi4+jOqwFrQyq1ypgWTxz?=
 =?us-ascii?Q?SjicSYCNiGJdpCC26HZMx5ZNEVp8hbo4fFHofg5F039uYehjis15LFZ2Z1/n?=
 =?us-ascii?Q?peXZYwOLlL5FX25JlCl01QdXQHxbWEZXve4RzAQrGfothKDlEXgRd2Ty+Nip?=
 =?us-ascii?Q?C9o0hf7YVOJYCZuGEmpHTCje3wEp0WPObCGMyAs+U3tMLwGhknTyETeUAYq4?=
 =?us-ascii?Q?YIEktrx0rRdjJLR01ldFw6tfHZhDfKi6F/rHTqSsE3TW6mGOUtQBasy5iIKD?=
 =?us-ascii?Q?GSw8e0WcQxboh1elpGJxlVC9OGf7NVNp8GyclvZKQkvhRFUMKd/M9+xBlMWb?=
 =?us-ascii?Q?bXWthFR4c3er5CcVJoCCfi5cbfbFembamuEnTK6l4kyUph9SQKilFS0UKjs3?=
 =?us-ascii?Q?wVZgtJqi9U44yKVVRsTM1ycjhJrwHM7wm+v+8hNTGxY6Jr5Ekk6pBfq+VPUG?=
 =?us-ascii?Q?NH3X+aIyycWjO0daQKDXMWCPbHYxFE2AyEFRSfM9zPwHyTTnszXkhmQpip5w?=
 =?us-ascii?Q?PJnPAHwogpvWmg5x6A+1F/1jcq/30cOOiZYNSloCMDbKXJIH1OSK+PkYtUIs?=
 =?us-ascii?Q?K/jz3RMEhmJd+FUWF2IIkgUnOKuWgR1ETpvF9HGw2bkwarOlKxg3qfEUAC9D?=
 =?us-ascii?Q?kKuOVJ3SmuJzzvhwlZd6rN1BV5fTlxy9ahTpdMdTkuBGvQNDdH24oTYX4KW+?=
 =?us-ascii?Q?2RVvn333nr7CzkiPFtmZ3OZaSb9xToXjQ1HXyrOSyUF7aJyFAhkYqPE7fKbY?=
 =?us-ascii?Q?tgfmWAaX0x/rt6c/FDUVvQ1YFxNHGvW4dgClHar+nqGs7oi8iRMYOub2D52w?=
 =?us-ascii?Q?2GcZ1/QoJu3qOct3swsjE7TS3KLXwKeP5pvpA41cfqrFeKTowu+RyRgR1qp9?=
 =?us-ascii?Q?wzJWp/fF04vQta55yFH0sgdhganNyxPQ85ht9eWFlCbGhZOBYGyffVLO+P3Q?=
 =?us-ascii?Q?Ld7WfIgk+Ja9NCP3tdG2MEcr8ZDbMAawfxE6W4rqpx7EL22Og5VP/bDoy2R7?=
 =?us-ascii?Q?dclLyVWXzpKCedmLLF8LxD+XVLpZnHG9YpZp39nKJo/nAQZNIP4bg1TzzkD7?=
 =?us-ascii?Q?Z0zldsu234MnuQC42ItyA1ZEvb/uDKoBRFh3Ly/uysiSFe+MdOnL2M65F/Xx?=
 =?us-ascii?Q?zzFPqQRHSuYhmAiC9lqq1/qrIps+6gcSaYrGrsyo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691a762d-bbaf-403d-7fd4-08dd47b2284e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:01:06.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcGUtLUWbHydstzc1qzfhgGCKiSJqdCEt1XEWd9OHis4rCbmsfvng2IlbRPinrR2mVI0LyXMzrG/g5MQ4TTqpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8382

Add audio-codec cs42888, enable esai0 and asrc0.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- remove unnecessary status=okay
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 50fd3370f7dce..5096ca8d7d1c9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -155,6 +155,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
 		enable-active-high;
 	};
 
+	reg_audio: regulator-audio {
+		compatible = "regulator-fixed";
+		regulator-name = "cs42888_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_fec2_supply: regulator-fec2-nvcc {
 		compatible = "regulator-fixed";
 		regulator-name = "fec2_nvcc";
@@ -244,6 +251,26 @@ simple-audio-card,codec {
 		};
 	};
 
+	sound-cs42888 {
+		compatible = "fsl,imx-audio-cs42888";
+		model = "imx-cs42888";
+		audio-cpu = <&esai0>;
+		audio-codec = <&cs42888>;
+		audio-asrc = <&asrc0>;
+		audio-routing = "Line Out Jack", "AOUT1L",
+				"Line Out Jack", "AOUT1R",
+				"Line Out Jack", "AOUT2L",
+				"Line Out Jack", "AOUT2R",
+				"Line Out Jack", "AOUT3L",
+				"Line Out Jack", "AOUT3R",
+				"Line Out Jack", "AOUT4L",
+				"Line Out Jack", "AOUT4R",
+				"AIN1L", "Line In Jack",
+				"AIN1R", "Line In Jack",
+				"AIN2L", "Line In Jack",
+				"AIN2R", "Line In Jack";
+	};
+
 	sound-wm8960 {
 		compatible = "fsl,imx-audio-wm8960";
 		model = "wm8960-audio";
@@ -322,12 +349,44 @@ pca6416: gpio@20 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	cs42888: audio-codec@48 {
+		compatible = "cirrus,cs42888";
+		reg = <0x48>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "mclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cs42888_reset>;
+		VA-supply = <&reg_audio>;
+		VD-supply = <&reg_audio>;
+		VLS-supply = <&reg_audio>;
+		VLC-supply = <&reg_audio>;
+		reset-gpios = <&lsio_gpio4 25 GPIO_ACTIVE_LOW>;
+		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
+	};
 };
 
 &cm41_intmux {
 	status = "okay";
 };
 
+&esai0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_esai0>;
+	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&esai0_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <49152000>, <12288000>, <49152000>;
+	status = "okay";
+};
+
 &hsio_phy {
 	fsl,hsio-cfg = "pciea-pcieb-sata";
 	fsl,refclk-pad-mode = "input";
@@ -718,6 +777,12 @@ IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x0600004c
 		>;
 	};
 
+	pinctrl_cs42888_reset: cs42888_resetgrp {
+		fsl,pins = <
+			IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
+		>;
+	};
+
 	pinctrl_i2c0: i2c0grp {
 		fsl,pins = <
 			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
@@ -752,6 +817,21 @@ IMX8QM_M41_I2C0_SCL_M41_I2C0_SCL			0x0600004c
 		>;
 	};
 
+	pinctrl_esai0: esai0grp {
+		fsl,pins = <
+			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
+			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
+			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
+			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
+			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
+			IMX8QM_ESAI0_TX1_AUD_ESAI0_TX1				0xc6000040
+			IMX8QM_ESAI0_TX2_RX3_AUD_ESAI0_TX2_RX3			0xc6000040
+			IMX8QM_ESAI0_TX3_RX2_AUD_ESAI0_TX3_RX2			0xc6000040
+			IMX8QM_ESAI0_TX4_RX1_AUD_ESAI0_TX4_RX1			0xc6000040
+			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
+		>;
+	};
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000020
-- 
2.34.1

