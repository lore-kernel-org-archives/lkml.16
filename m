Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4A21C184;
	Mon,  9 Jun 2025 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487987; cv=fail; b=Jc3/CMmIgYbdU4RKE6+n81/673eAUn9Z4F/EMzigMam/TdbRduewXJRWfnmMI8xjjwFfM6cVzg/Mi9Gf6MbhaqmUZ2G6KnFqMO0XpEzosihZObdVNdVNa5Bal5xp45jDOmWE7ecAcP9U0M8c3pb4SKjYbM1iEB6LuFeZbxmHH8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487987; c=relaxed/simple;
	bh=Q72GCcSGeJawayD7ywhE7tsOuEniihedMZ+SB5nv1Ec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YrJU9WdAUlIjQnDD2kMudTAP8OMsGpOPPwkFShYqq/WfGofCb87ygihbNzbbK8OuZMT/zZrWltfush/DoBmVi9fcFDAMAzJl3XGHZJCeJRSCYu2x2WplSn4rvEY8uKy5QuIDG3Qa8Pof7Rd8pgxHstRiDSTdJGGeNMQjkYtbw1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P6GgUDzo; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P6GgUDzo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDdw3WhveCDS7PhBhEMiCsnelied9W1LWQi5drX6M4s0L1uz8iuPsqvr7TEC0zbAw6trWoL9O+JJI1AC0katOLOw4feMgXTPgis53GDemAjkfX/bYcOLu7dVVeX4AVjy2qTu3qturNuHnTx13W0cvUxU2BMPf1iAr37tmKPgVJ0pGkvy/ieEZBsBG7g9r+kogy1bFH3Gg8suzixJKWmf1zbs3WWJkLSbuC6EdteT+Q3ozPVWkt0VI/LJ41cBifaXUSHxWsVEdBr+Cdga72jpmo7ikdPYCD6Jz/7KcUewBIxGt9I4rNqoYBNC/34u6INVEIvH3bIneqNSoLfpMZv8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXseK03M/LYZlZkOLMR+ey5fzkE+RRkuqE348GhZ+zQ=;
 b=jzko59zkgMeYSeVTlAUPmiv9Fbwn71rrDeKtt+Va8GG8g9y6ecJz1npogqxh0SruaxuYKsLNlcbIeupp62xH0jT1izHVGC4QCZA85AUtL8G0mk1H2VQz73vdMJypMw3gcioldwzupfb9oTLqE65Bce+FDtbmfRwH+EW5cM4E+eZT0RA/EZ1GjA+Yij9if6+OsvHM8PIE6yvKmNhHHRj+/J+o6oxt0HjKYxha8xUxa1wD9M05iTu/wW7D1SQbkeJsQqzCLsIrVqJ2GSPkd2P6yJFlrYXX4QxkGMEipUu1lWLf736dxdZt7LU4PV2em27ceI0i42WsqO/LK8uahwfL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXseK03M/LYZlZkOLMR+ey5fzkE+RRkuqE348GhZ+zQ=;
 b=P6GgUDzokNegViqN1LmBA1qVwyEcXZr0dqmXweLPwBULsTqzLLo8X0/3QPZZcNEK0yl0wsUDxeAn/HO5NcA6rZ+bPzQ5omXygJoE/UHLGeRwVT/WBd23J1XtE7puqwQIjFlDfDNku+3TIVtbNCLaa53WiIxuUE6aJ9nw7Iv02duOfwogrnfhjb1l5cFeo7VIfg/eDZCAKRMaexikkp2gTZgSXg0MhzyVW0SmgwwcXLS9tcBqgWZHzUzj2yCSMrew8CeucJhQmgw6tXwci4O8Q34LJrpFlqlcAqBO5AXKqf+/PfSefNY3D2Vnav6Ad3lzMR5vSnPmbjGZFNybIY7kdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:53:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:53:01 +0000
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
Subject: [PATCH v2 3/6] arm64: dts: imx93-qsb/evk: add usdhc3 and lpuart5
Date: Mon,  9 Jun 2025 12:52:34 -0400
Message-Id: <20250609165237.1617560-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ab3884-6967-4dfc-53d4-08dda7761896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ccWiMhXl5PgolLulJ9Ic4h584iF9pYGbb5isw9R0a0gmtxjcc9RGELDIG6c?=
 =?us-ascii?Q?tNKWFHXlIxyDYxVIOvUJGBcLh2VuuKanEZ6wBZdwTKv7kjUWlGMDTfKj5PVN?=
 =?us-ascii?Q?vDub5Jri7SsCPgw0hyLcFeaIHGy/DB6zO7UURZ3lWtf8pg+q2jNVh4mAhFWo?=
 =?us-ascii?Q?DI1EucbJPPi7HOcmxqIi6LqfCU41pyiFXWmINuOTdPtw6c6+YoSUc9vBj5Ja?=
 =?us-ascii?Q?uqiW+b6bFeM6Xgci21IZG1+8mqajbBIgkPhAybGoOH6bpxYmYxtMIhtEQcRs?=
 =?us-ascii?Q?o9+qYkiyAko1BAk98UMSfHVAwLODS4Zj+orv0bdEmbJ6kGhzobUdA8JPgX+n?=
 =?us-ascii?Q?uvJ+qwkT8iiLFPz0fHE0vFkjBI5ZwPJYMdjzegTcEpnKD+Mzn2sm4/U+Lk1T?=
 =?us-ascii?Q?y4qcz1FRLzRm/iVq0C+Iug01KvoEP3/3D/UJndYEuUuBudSY5T1P/Q+LzHor?=
 =?us-ascii?Q?cY/wEzdQAbCLFNaYj4TmL7a89t58JOzdyJ9q10DSvELDK2O220CHGnwKeklE?=
 =?us-ascii?Q?qUsTOtluQApvlpdhrWenRXz5kWfiWCG4R3KZveEFT6DkmkUzPuWrjl7F6h5U?=
 =?us-ascii?Q?gcUsa0tiTptghzNCjfCsif+TClri7eJEntFIbkAoIz+Nba+yBCWDVGTOkqMP?=
 =?us-ascii?Q?fgWaNGdXJENmBSupIIPNlCZy7zaOcr7b5jspijPa4LEfT9brbNRx37eo9yEq?=
 =?us-ascii?Q?Xjto+9yfrtWif9wTFf7mfImh/Y3JwfOjgLrOMrL8KQIrEeB7OJYf9sotSY9e?=
 =?us-ascii?Q?iZtA2TbkS36zo74E8YOoZnvkiJXeh+qWwzDhNJf0gdiZMOPBxsTq48fBw+LS?=
 =?us-ascii?Q?nDcGM/8VpE69h7mUMKardNAdVlrs//3fEs/IbfHORS3ZeijDhZtUa0HQZTf0?=
 =?us-ascii?Q?6SKhQFxD3VxwxXFfeadeZzWecXYvvdSJ5ZxLt9x6EwnpWe5hBQoaDZRNKts1?=
 =?us-ascii?Q?wOFaLPx5tOMSdf/7JFOo+vhoRLYS34A987Zc2OG171RCM8yG9rsqORlXhM3Z?=
 =?us-ascii?Q?lyZfd02aLM5iUfo+nDJ5kk7yKU+iOPlhoDPyRQ1+jIvypTaNPJ5sBgy+oJY6?=
 =?us-ascii?Q?sZzg1fpNwHOQafl/h0rV4PKj1yA42iKUnYH3mSpzTMqIxbAssoSbtgeEIryu?=
 =?us-ascii?Q?LdwPbp2B6R1TSnPmqYJNz50uuMsdxLOP2xBjSapvQSM8DG7PvzF6PRidvMmW?=
 =?us-ascii?Q?Jwg2kPOsNf6DvEaeNQP/A0L34WzPU7FUEzbrA3qkZuUwX+h+G1ZBGLZa/H2k?=
 =?us-ascii?Q?bX30oV6FOX2QKpfRyOSnxxEO6AIyu63nKwx8NzHb9A/lvEVKcl5NjgfNbbtf?=
 =?us-ascii?Q?t1G5871jf4xAZxnFQApazG1CL0Z6fwTjr+h+vnNhm7HRGkbJh383j8UmSlCh?=
 =?us-ascii?Q?dSRmglovLSayNjVkcwjtu8AVufXx781CCiGYroiAJXXg6mQfyoWb9xto6y1p?=
 =?us-ascii?Q?+lVRcJ6Q3A0vOb1/4bwrzLVOcT9eoiX7J2Vovs/ygPzrKkkykwR3zdzwx07N?=
 =?us-ascii?Q?/qhEBYQj19B0bBs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9/E2HVu4RUnf3GsiVYjXnP8LwKms+i678gL7nt4lnNZXWKibLU6iFffv+AQ5?=
 =?us-ascii?Q?IIajNggtgv5zVSkwTuJyoxhbmUIMLvULT3h+e9DQX11CrgUeNStz6VCMfl5n?=
 =?us-ascii?Q?WrBjUI7Dm2AXnnqwnSR75py7duCmuyAjerdAGgFJbBZjEGNqnV3iujaP5g0e?=
 =?us-ascii?Q?93IsdhYmpY9QheU5D/A7a5mJW3rAhDZLTN6LKhGBW4cmW9TypFzJWXn4nRWj?=
 =?us-ascii?Q?DEFswhSSOSwHaEKFTQPT21vxCx5d7iFRzGUFyCzZs3qBK9o8AQg0drr01sqC?=
 =?us-ascii?Q?O3DSP+0RGCvSJb1kKgvdhuXB3U/oTpQUp5G/oRcQ2qENBG/v/gEYFb2G47ic?=
 =?us-ascii?Q?/0caOv+Gln2lJV7k41SGgV1dumjOJkmVg720V80SsBaZaWGbC4k4iBgmLDyg?=
 =?us-ascii?Q?yGkZO2BG7nVf7lMfX5BlBhrkb9XDSvvwX0sDQXSRQ0P6DB945GhHrgFA5xOA?=
 =?us-ascii?Q?ue3BWJ97QmwdLbdCXFSh3sbpWJxxeCPGJA5nBRhHsi3pFu8uZpcSXJemrv0k?=
 =?us-ascii?Q?pnmK81W1fw4WtRQ6aFddar5G9oQu+aonKSVaPHZ378EgBq8FyihGZho+ZLoZ?=
 =?us-ascii?Q?EPNWoJ68jdyPrrLqpsDCVXLb6EGZ5gJZPiQGnHH3LvzQM+0Z6JGXqxZWDcUO?=
 =?us-ascii?Q?VnXLdgAZyE6Up2QtVi7zj4yJndOEzpXkMza0yGWhA9everZVI82FV9xLfwBi?=
 =?us-ascii?Q?SrH2FV6xEOFZqb+ZgxdH6UPFqhCJJUno+XEIyUZjFhYU6RX9dVbG36X6ORoa?=
 =?us-ascii?Q?fN0617gb36NIBHjUnkTX5ZNA9GmePy04Ub90kvvNlzWQc1w1wS/SChdqUbFl?=
 =?us-ascii?Q?vlE23t0Cc5T6GtOpO0JRaYaTl24haQf870fHgDXVCUYBkZ1MrhyEA4PXqhB1?=
 =?us-ascii?Q?z3xjvuEb6t4jJ8Rucpwvw7AWw3vTdOKgWnESVV7xoKD+PJLXDvBvTKCPzTdK?=
 =?us-ascii?Q?2hhbNgCX2z/mJHXmzNlcymhjCo0B9BmO/uIc0xXond39gAInv2SqvZl0eXhC?=
 =?us-ascii?Q?llWaU6EQUSfDHS25XoX2s4i85tbGGSq1ilosQ3O44rWl/MXdoU0CHlRvyFqS?=
 =?us-ascii?Q?fNghZWa++l1KN/Jy5FAE+i06IeiUnDYDs4RUYIUOWD+7efpJ4nENFC1Q1SDO?=
 =?us-ascii?Q?aMzTOF4fvGZzDzYe74kJMuXJja9zAhsbFSiZM5z2EjEFr7ZEufnobZN1ZGUi?=
 =?us-ascii?Q?8MLtPgClDLxiz2nYxTX4QPm1tXy2sU9BggzYfn1KtOADRIEDbPZX6zgYAM0z?=
 =?us-ascii?Q?+1Qg/dugAaT0SbR+nAkkjcaxwWR0ggakkoefqBFgcOX3HmjmlS/6TgNWPTwD?=
 =?us-ascii?Q?rQtGJBKJjIkqJhpar5h7DoTJPE23rPwi7BgBcMoJf7+Uo8kmCR9MwG+QQ+YQ?=
 =?us-ascii?Q?ogOmjwIiX6thauKagO1OigIxr09LQTIR7BZKfaK8+GTp+xTtZW0YmUIy3HnW?=
 =?us-ascii?Q?t+fXescSZ4Enr9pR+4F06m8MbSM5m8X+7iXC/zZesGWh2P1nfBIRe6IHoQOc?=
 =?us-ascii?Q?ji+ub8dKX9d4k6+82FY4uqFbrhNdqOHQtEuKlpFmIwUds19UY0zFCjZHVhKw?=
 =?us-ascii?Q?i1VQ1jqNuTzgxryo7NZNGn2iswz9BIshJ2wxSDlh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ab3884-6967-4dfc-53d4-08dda7761896
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:53:01.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtRk+foyJ68KxxRaxcOCTVg8eZjmkgoM+uYHFGwhbJSzlWbrBlJi3lIdj2unp2E9Ne+ZF9PSZvjJLaEw5qaSLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Add usdhc3 and lpuart5 for imx93-9x9-qsb, imx93-11x11-evk and
imx93-14x14-evk, which connect to onboard wifi/bt module.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add peng fan review tag
- change titile to imx93-qsb/evk
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

