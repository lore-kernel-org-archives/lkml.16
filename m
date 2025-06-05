Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4768527CCE7;
	Thu,  5 Jun 2025 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157160; cv=fail; b=dym+YH41g5as8luozElkISdhwdZ3tii5fr52TU1xwOHIjAYFR75H+zCOS4YJTdDaLsBxnaQl+ZkiEzmeOBC1piqMoElkx1KuAWP/zZXj7Qg/54Ydz+ptWuns8LgSWSXHN+51XKfINEt6IyqIKVqtmbkTxCfKpDbNYfb5wMhGJYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157160; c=relaxed/simple;
	bh=S3B5qF8n+h1SzbyyEKod0r4/WjL2hHyWSyGn4O95+fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KfiqGqmjfWw6QQGeSYoaaVrH3kgZ6eAUK3FAwXIr0+ll3o8g9oHpa6p6dCuvhSfzoje80RhngdGJ5lGLLBczQUinqwo8fcN6k0iXKLJa1TMj87ZQjffBl0uiKGzx/yyfzjDbP8sbHj0UoMJQSk+eFuPNZhT2wj0PwEx4v2B52pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UOYSThdC; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UOYSThdC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTbQIZzqgkvVsMQaKfmfhl/yY2wrDFekD9AuAE0s7EeHsLymbRogeiggb+T4CSbyOMqSuludXlGJuAdkn4LobW0H3+22E/EIcATpg6IqMrspYl7TdBibCXaGF2bvcimJzKro03zE5DVj0PDMalIsGfYvKJYO0XDGcjGBzI9rwa9VnjGKPs2LouOWcfV/DAThGEiFChBeVeefWPOAnof+zSDwJEL06GaN1VPGAq0FT1phQGeSFVZclurusSQqsnnZHt7KQ+Is8Uh1HNqs3P5wBZuo9pTgsp1vh+TNaOJHmub067VZId9ptN/8lvd7HxhnA3TMlaAfaYYd4gZ1v+Adaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF1/t9qzUjBsTnNXLsgBaLd9k9qlTtB5K80FRU++BQs=;
 b=KQCUeGoOBGw0PIAx8cUbI4KFKIwyCJwggWlA23aBiM0XBbnHW6wL+hG+qXYvzKktTVperEGzB1O84NNbbQ0dOvRt/j3zbA6YxzchdxTx7Ym+mZT9DrqfPhgCkR6ZSyb7qjqDzrDzcavW3LfJtlXUYIud2DbmLrSXSyPkkuI0IiLfm5rvD3GKbOWt9rJRYSmyqY2R4JMHqa5lZcl7WGnKkrlGc6TeRvVAzdsy0jS9hfOabBb1gPeKUX0B0L6sJ+JfkTT/geSmGnLuyd1qkVO3QalGAMHT0f+iIQpQ5sDDTrs0/ATpVM0n304XG02Tv7W7cNVGf7OxhcMDxffTUToe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JF1/t9qzUjBsTnNXLsgBaLd9k9qlTtB5K80FRU++BQs=;
 b=UOYSThdCd642UOKfR6m9MQolzveK1ZR+XxrtkYwQTKAxH/0P4cjdlgtOB4jmw3s1+sCcMUjb/yCSPSXrbrQOa4bTtBzfOlaN5RZX7T/JAIei2R2h4ARINOc9ozRIjOcENgq5GLS81yb5klX8Tkz+T66YggglBlQW0Ik9A2NUa3d9nokenYPA9HE2+8Fl6sO6cxeL7YbFnELc4JMSYKBzYKji/QvcgkRGTgmu4nbuNDHwNtaQZZrNgz8s8pyoGzz/wGMwffVfKJ/MxxXhiw4sbmY9dWHraAy5Pj+xpO1C24iYBcW35eItTCb3b8zuwbkFlYY3Umx0EOgrXL8Lores6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 20:59:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 20:59:12 +0000
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
Subject: [PATCH 3/6] arm64: dts: imx93: add usdhc3 and lpuart5
Date: Thu,  5 Jun 2025 16:58:50 -0400
Message-Id: <20250605205853.1334131-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605205853.1334131-1-Frank.Li@nxp.com>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A3.namprd05.prod.outlook.com
 (2603:10b6:518:1::57) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ad8468-375c-44a6-049b-08dda473d311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c+vPRftLRtP/Vj9bmmyxFJn/irJxdaoEG7RGBnTZ5bOiVM9v3Q9A4iEQF56i?=
 =?us-ascii?Q?rR0P/vN2q0sUrh41WXB0FfhaOSUjFrcLVsmaNyBb+HFf+AZj7/kLsn+lXbm3?=
 =?us-ascii?Q?F5I4IiDjemHqZfbru3WwdnEsvSorbJk/X+jcR38oumwflgkQrOe74QYuDVsD?=
 =?us-ascii?Q?chZ4ViBm1JWEsqPvNsaCVPiI0hDCXbtSDtEr5ejFIrGaj1K7ZBVVHH/E/zdo?=
 =?us-ascii?Q?jnu7T74iEDrLMwspVzJ1XFo1q0kWIvCYFxbr5OohrzmzuKvHVUiNWPGFtKR/?=
 =?us-ascii?Q?AqQc9ZAqVqLk7Hm/MJAgu7XhaWMllaPjuLnmaemdWQNVFcyUEMvkdrtFst9P?=
 =?us-ascii?Q?smNW8YuIKR/dVZjqeNfUdVbXFFQgD9HkFqxlNsp2s8Wvtww84hcFcNhm/si9?=
 =?us-ascii?Q?DESLBQ1VMOWbvh4HiewDVxgnhlt256bP5nzsMq3cEl4ZRrk8aait8EKvIBoB?=
 =?us-ascii?Q?m1SVPamo+VSNeUYVQVxHnSOQv4eNFBPG/R8uaoXdLgUn4ScAmmuWc/UNspSh?=
 =?us-ascii?Q?72m83iRJsJfBHuZ2T8El5lP3e7VZ2/2T3a6o/F5s4cqn1M8hGCI/igLvrx86?=
 =?us-ascii?Q?lHdSm+ZsUbUI0MnBfGzZ3T0M6Xz/IXDKy7tUHxs2cy86/93ZYQONSgcC8oA/?=
 =?us-ascii?Q?sBMTzu4zPPMTE4MNdDOzLMvyUFVZn/JEX9RYgGMoJncZHT93Gf7emOgjHjgQ?=
 =?us-ascii?Q?ZcfkAOxtmre4/XEdWwWAr9YKcAB+xol1RgAlYKdo2b4BIqY1gO0b5wsqoagr?=
 =?us-ascii?Q?rstWARhZpfBWZPIPsOG50Y7ngd4JlqmtC+ipDzcbd6yoj+L9NRfWTIMwDNO1?=
 =?us-ascii?Q?MzlMe7kMktyzhiCRPcPyr9EM9s5Wt4TE9GceGt3eVGYnxrc397tSgbs8hQjW?=
 =?us-ascii?Q?MKk5cgJJhnHCTegs4nv6aLf62L1yg/n2ZpGtgJ2oF3GF+XlX+gzTSeVgLwDi?=
 =?us-ascii?Q?2uQ48NS7bczNHcW0bRS5aeTabPEzIh46sWZFgbnSe2NCJEBjjG1hOvf25N5l?=
 =?us-ascii?Q?5twmbUCu5jnZzKpPgGuboHko5hWRs1Lky2seS9P8jsvZOrd07Cu4mMUNKaQS?=
 =?us-ascii?Q?EyLcvgvorZug0U5d7jL0ziAM5LbFgxRA0vcMEHKS0uo4p2BceuNZBHmJov14?=
 =?us-ascii?Q?5Goc9tWncq8VdMPH1VhBf50tWJhrhRgI37N1nYgXpYxaXgYBklwmoKDdSh+b?=
 =?us-ascii?Q?uRAlq+QMpICaCt7He7hOlXSRgCgN821yGsRde4wjQEGF1afajdN1RoLRmUwm?=
 =?us-ascii?Q?RlDQD2uQEqJvUs2f3jNUeGBrXPl5MthNrBkS/EgIPUA6NJjHK6YEAEWgFYX0?=
 =?us-ascii?Q?cMvLqRdcRvDiH7Pbv3U5HPf5KMdPrMBfvXe0jDG1wTCF1d7E0M1TYYunPL+M?=
 =?us-ascii?Q?2VkPWGF7pfk6Y2as0isdC2bcDQ2KGMEOViQmavn4p+k38FTN0ku5KsYLuDBd?=
 =?us-ascii?Q?50Z/SJUYm1KpTY9hNgwoNSconktWWCQD4cqukrA1fj8lNSXpNkXt4qPmtvu1?=
 =?us-ascii?Q?Nc0Evh6UoPfbXoU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GSifTMr4KQzzHcHQfcqGJivEQBM7JV/3hL/61rXMagwD9hONYTL4/MizbXoE?=
 =?us-ascii?Q?VgF3JOMpacFasMPXsKeLtIbO/oGVuGRrFaScVhTDZhayFtR9FS2IU8q27WVi?=
 =?us-ascii?Q?qdbrQRmY50ZrXwTZWKT7Vv/fIdp4mki9Bj6bjJcIKhtnbuEAeYxgA7VHkqr6?=
 =?us-ascii?Q?eoYYK6EPh4flzD5QjyNDkRseRVJ3genHznOBKP06G1kbzMG60E7jk/gpwIme?=
 =?us-ascii?Q?dx2uEry+emSk6iewcj2ifcRFW9ZzFBdWQUWkxPq2q+IWdMe5kKupwoL3eWsB?=
 =?us-ascii?Q?hz5lblP7xwLKpswEHB2UF9lLpbzcxp6rP0tW6UGip/s2lo5rzQadsr3dx2vx?=
 =?us-ascii?Q?debYjmgzoYXYjr2NvXpk7X4E+lDsNsuR/eiQaUOcx8iSGyGm+dU8ektvG7pB?=
 =?us-ascii?Q?dJTjTi91QkruCh8jajLvSbeM9HwUcQfOLfXe/IyKGAzdIw8vKD8OCLyqklIP?=
 =?us-ascii?Q?E+KuaPxsJb8X7SS/2Nb+YT2MsVlSySd/vvrVfR/jzRYse0/qq6rsRjF/yZI3?=
 =?us-ascii?Q?0gte2zU9y4CP8JB/jHQnFWUOlewAGU0+I016wI+UkrYlGVtzuOwTG2TMZ3t8?=
 =?us-ascii?Q?ZwoHZ7Bverh3NJ87ZwY3mvp+uW3Hm/9iGfR+SjhNh+v6QOO0NVL/p3jvLa1c?=
 =?us-ascii?Q?pEl9D5uGn38lrncllCyGPzkd3zaJVqEm2YJWjGY+Z8nMLQuesO9OsSPnuydm?=
 =?us-ascii?Q?dDHMaupdEtcYtymla7q+KLCniwp0bJjbaIi3coQiMCE9PpRydKhx3/i4uNrR?=
 =?us-ascii?Q?WIX8uqKJR+MY+bdjcfmAFoQo2WO98zjg20M7X4igmrAULkN1f1Pjm6CbeKB7?=
 =?us-ascii?Q?BjodYdRWonAdBehDjvn4rCUbk1p7gy1TVhsDIFZUrOk7GBzefrgmEPu1LiDS?=
 =?us-ascii?Q?GGLNRajq7rI7yLwj7Z+KKm66Vc91A/jhLfBwtpNZO5A0D5UkvZXqloEGIZDA?=
 =?us-ascii?Q?CN862ITfR55GKuLsAXu25y067w2vE79jhJLJJZrjnsZJM3S2nWLIrxO5Ar3O?=
 =?us-ascii?Q?TeaqYMjPK7SysRXYZuw1KWFvNu2ENcvuO8D8+Am8j6n5s07BB3Fz+6HMVo83?=
 =?us-ascii?Q?g3NcjfB4FO2QI4T+YCmr6arTfLGAvwDo6z7hQbqe5eLNtrihbcHNTdssjK0e?=
 =?us-ascii?Q?g8VELQGijKcxDBHDQ7aqZZlcXqZ672JabVJQWYg83CHbV9k3VXJaO+J0B802?=
 =?us-ascii?Q?YEn00RegRkpVX40kqiv4xyOIzU13zV4CFn+1h1qtQa5jDb+8vM9LzP+jhW4C?=
 =?us-ascii?Q?7rVOST+vPLC7qBhq3/i0inkdtt2HphggupX9w/uyU3xCXGrOCoZMsVYhsSoe?=
 =?us-ascii?Q?xvOB4V0tuyq506N6V5yqVI9dnCfosqy3p7xtXJWRXNdtUfn9A98B5nt6qy62?=
 =?us-ascii?Q?drrTyCI5sudT6K+tnR7/KeUnsSotQwjfGFWfoJT5Q1i0m7yLuI6yZtinFVEY?=
 =?us-ascii?Q?b5vylsIOUxyV5WFVfcM6S1PHuxi+C7VgjI9cMxBKOAXLTYhzOVu2BoHDvIAQ?=
 =?us-ascii?Q?aDEKqBXqWug0ibsBCngkoN6LL+Q1ObQuF97s4QvIJqO5W6TmblukrXjja/PZ?=
 =?us-ascii?Q?WkMG470GKC26X9f8/6xhQLYW+GM5ETzzJb6/ZTuH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ad8468-375c-44a6-049b-08dda473d311
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:59:12.8724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8efh9Daw+onGiE2KWPkEXQHOfuNZVoKuuupZubfPkE1NE81lBhXGmIc4pyoErq5PTaC8wRVHkpdK2vhJDanqPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697

Add usdhc3 and lpuart5 for imx93-9x9-qsb, imx93-11x11-evk and
imx93-14x14-evk, which connect to onboard wifi/bt module.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 103 ++++++++++++++++++
 .../boot/dts/freescale/imx93-14x14-evk.dts    |  99 +++++++++++++++++
 .../boot/dts/freescale/imx93-9x9-qsb.dts      |  92 ++++++++++++++++
 3 files changed, 294 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index a6ebeb642eb65..295eb8d90f03f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -95,6 +95,15 @@ reg_can2_standby: regulator-can2-standby {
 		gpio = <&adp5585 6 GPIO_ACTIVE_LOW>;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -107,6 +116,28 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
+
 	backlight_lvds: backlight-lvds {
 		compatible = "pwm-backlight";
 		pwms = <&adp5585 0 100000 0>;
@@ -492,6 +523,10 @@ &lpuart5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart5>;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &micfil {
@@ -593,6 +628,21 @@ &usdhc2 {
 	no-mmc;
 };
 
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -934,6 +984,59 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index f556b6569a68e..c5d86b54ad33b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -99,6 +99,15 @@ reg_can2_en: regulator-can2-en {
 		enable-active-high;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -111,6 +120,23 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		off-on-delay-us = <12000>;
 	};
 
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
 	reg_vdd_12v: regulator-vdd-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "reg_vdd_12v";
@@ -126,6 +152,11 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &adc1 {
@@ -366,6 +397,21 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -552,6 +598,59 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26	  0x31e
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index cceca130c5b4e..f6f8d105b737e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -82,6 +82,15 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_rpi_3v3: regulator-rpi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_RPI_3V3";
@@ -103,6 +112,23 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		off-on-delay-us = <12000>;
 	};
 
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
@@ -151,6 +177,11 @@ sound-wm8962 {
 			"IN3R", "AMIC",
 			"IN1R", "AMIC";
 	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &adc1 {
@@ -384,6 +415,17 @@ &lpuart1 { /* console */
 	status = "okay";
 };
 
+&lpuart5 {
+	/* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &micfil {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pdm>;
@@ -462,6 +504,20 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -654,6 +710,42 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
-- 
2.34.1

