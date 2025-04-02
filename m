Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2072.outbound.protection.outlook.com [40.107.249.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E5175D48;
	Wed,  2 Apr 2025 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621863; cv=fail; b=jWJpr0pR71rvqd+XURjBPsZakoP2hDxva2FRb4j06B90fRdFYwROH8QvM7qb6suaBkQd2K5LbULRzspp3rE4SzuJkTrvCZttz4RfgClczKMudUDJUsiiy0jPHX0Xcp4pHSiWdKmWumnVQfjtoZx2Wsx/hO0RlbNPtys7zYlBIOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621863; c=relaxed/simple;
	bh=5370hhlqPZRyaMkx36+s7gSDn9Lxvq/nhXMHdtDZdis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iV2JibSLj2mDKCpemcEwy4y6LLXGafcJ5UQzJfHALsIvLpqMMpdmsHv9CzZEMSpEn7paYgF9VUNLh6UiAc/oslrFx+Ugye1XcWv3T+pEClmkN2gRTtWfbHdcSdd+v1ehHkJag9iMQwNHwE1zn387XpbhhZ9b7zoGsN7oW58IuxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V8jZ2/dU reason="signature verification failed"; arc=fail smtp.client-ip=40.107.249.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V8jZ2/dU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLhPPGXbyIyEX3UH0eIST8Crvw0HyXXdlLeVJH2BHW3vyLKCwu1tsR445oGDNrZkrGqJtENy4i/yFIkLe4ZYPXVsEc2UK7gZLwmVoJ/dgUh87cY/s7UQdxhQ31y6f6921yJjvjVaez+JkfA8Vlbd9cKzqoJwv20RxV0b+Sk+IG/geXRm8mfUfECqRbtF58oPDW4Upvfv5Xm0t0ZJOfqg9jfFaveBt5c+T+vRDAwNjfyuSfxOyIBmge4QuvNCHTIr6ZMBwYmH6SCUmuWr21qlkur3GkX/oCuOCz+hZ2t8dm6TfW7SHZmVObIYPaT1NM8n9oIfg10ggN0tfnf0jtKkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn23d7zkbab2h3WpBeuDMSxvwfH/N8//Ovz0KR80r1w=;
 b=y0r1By7w/rUMNuHqSs5uJzKWYP8O1z7GnAvPaKZFwhYpOVSeH7RwQuGiyGPtjCIiPoVLKkSD76Cwn9BlE0sCUxeUAgXCTf3p0Yy23vdcf+xacwoRxfsSpjX8COGioPKdVIkpnaBFy0x5gfsE3nIV6Am2CZCiZtV+twdw840+8Oq+dfEkL9Y6gPkg4ELv0gDNsurxJBC4oqkb6JjVuzLaYp1Lsfx3jtNKTGDjBJdCbM6WJqboguglu2VgZT8SmmELUNvXOUNKWRXGfM/mzBhqOH7ltW2YpdG4cDI3+e1PUYh6UPUT3dGTuiuC9FD+I/csllhForwN/6DS9FtDIcd8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn23d7zkbab2h3WpBeuDMSxvwfH/N8//Ovz0KR80r1w=;
 b=V8jZ2/dUAdGQPI7GkgWIskqXoaZy6eqXgApzT74HE6RrPZ5liFZA8oGEXu5bxu45r2OlsXAUIREnyKgamqBRRQs2ckmrIYTIPZ+FSON45eTkSzTmkR7NhzlUjxES2YLAAiiowXZu8LgdFOyHNQlA9CbnMKG/3y5dLVEkJ+h4Hoh82micihOWIJdaJQupnhM2V/mL+GorQYouZIhjFsiRM6ER6kBDDU30iGSFRat+ctNJTeTmSLrfBviM5HNHbHB9ejiRy8P9mPXdUrXgdaCbu2olBI8Xcij+C/jpfciXo86nZI1/a0OfUVXCI84hUkgFwiJ5AnZwFZY9+IwpUu1WWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 19:24:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 19:24:07 +0000
Date: Wed, 2 Apr 2025 15:24:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/9] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Message-ID: <Z+2O0MeWOz/MeKOS@lizhi-Precision-Tower-5810>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-5-9f898838a864@gocontroll.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402-initial_display-v4-5-9f898838a864@gocontroll.com>
X-ClientProxiedBy: PH8PR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d476c3-fd31-4860-2e8a-08dd721bf02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?0dw3uWCf6venDyZH3TSc+bQH0Q0gz+i8J9snkF2LX6UZyvYAqxjbuZED6h?=
 =?iso-8859-1?Q?o6H+VKdKNjSsRhWyLBobBYJPzm1YDD6VJHWCFq2CgeBO3lyVKV2x8h51PA?=
 =?iso-8859-1?Q?p3SnQXnwGAUMjuz4wrU0N5Hw2CSRVYHGakqhpoDpm6fE+AV9PgoEE+f2Wc?=
 =?iso-8859-1?Q?dN880WMKSBXVXsVeiagcPUDqkJXBEIyvrh/aUMlXfu9GLbFKt+s9UoaNyl?=
 =?iso-8859-1?Q?v9i51SCTEGMMnPoQz2rzrF1Ouy60MIznC1PbJ17gzgu7iRnD9lKmfA4TFL?=
 =?iso-8859-1?Q?HpkBXlJZwiuJQGHLPMysSW8wOb0KCN+Xd2Ezr6sCDnYmoK+j7Lyql0m3xJ?=
 =?iso-8859-1?Q?e1Vi6Cs+ufpexGfkmIfIUOs+nb74kk8b7U5ce+PMSglUIt8sy9r6lSCDiF?=
 =?iso-8859-1?Q?FtAZkPZyfRLoNvABPP36X4Xs3LlarfaOZwNpq7piNWqSg8MUepCNHiP94w?=
 =?iso-8859-1?Q?tFbzZ6T02xGrK20Uon1UfWLnPOyNd0/FYjbKRcK6XnwQlanVC/1Jlol66m?=
 =?iso-8859-1?Q?OfFNBwON97YYVIkajyiZME36xKRVKvvzbboOsGZPzq1pPQeOx15/9po76B?=
 =?iso-8859-1?Q?vNUMjkMaYD5hy3OlnSDiWQOgKn6xgHzLNGlOrInFwbhsq/f/SwNclOvjHb?=
 =?iso-8859-1?Q?HoDqKHmKAWefuiiHh+qUSbVQx9dRDITiW63tDJFzuhkWbhm1z0KoaKGYuy?=
 =?iso-8859-1?Q?FyUeLp+r4UhyfvhwssWC8XcuPYI9/6vYowK9fsXMlpE/yNT2FdR4xDoect?=
 =?iso-8859-1?Q?tjv555zCkKBJtj7IYFY2v0j+e+wxxJSxM59V/oim3NaAhN01NMvLeYi45o?=
 =?iso-8859-1?Q?UmHe5fGk+pYIsdwQ1OSFU0mHbSZSd77QBBF4YpaSKvtjk7XajtjJ7e9GCk?=
 =?iso-8859-1?Q?TaAOpCJFBP3L8lWfxm7Su7XWtICAyMycgAnnhHbnO7LolLj3nLw/Y58nJR?=
 =?iso-8859-1?Q?1XSIBCdIZgplqfxab92dchbJa6TW3CzB11wEV5djcQAxMVk1Q0yXjECqne?=
 =?iso-8859-1?Q?zc5cU8p939eCWPceCGyY5ZPPX3Z7VXljmSVCY1dMp67s4IAHKKy5vK1eYN?=
 =?iso-8859-1?Q?7ubD4D4wePJ7agOuD0RER9W/Mh0S5tA1oyxwQoYL+UvLXWU0B06MFFCA5g?=
 =?iso-8859-1?Q?vAI5I9AaqraK0H5yjw28oPvYiRLQJfvwe5eLxMas56gIGUCnYht3a+bWv/?=
 =?iso-8859-1?Q?ru2nVTxUYBu2K4cnxcNxCGijynxUxQzXOmXCV24SVo5FAMmacAAPztO9Jo?=
 =?iso-8859-1?Q?fbMChVCDeNy5vlToviwLckqv6hXYhe+yMoCcV52eU7rDLEJhXHsk8NhU2K?=
 =?iso-8859-1?Q?ZlwVoO1JOmcKjQ7FCrHZKO6cQHM65uNTspahZPVwJguNCEoyY7t2XoGOvu?=
 =?iso-8859-1?Q?ITM1e+3PSUax+CAfZGpFPJMiYWcGjkEywWVfxMNOsN8qNDwR+99GYXS4Pf?=
 =?iso-8859-1?Q?PHhu/bGXMs6M6HAU5RH8mKqMkzWRB3TbZEYkHKE3CTstaIfLRcCKMDBekM?=
 =?iso-8859-1?Q?xQnUlsYFt4K05zwz437bSz6OQiot++2sKrkGkS4gtTkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?l2aiJz2vSkWXdehqVkW+S3rd90Zbaz+dFdem2mfItVybGCnj2qyOrzw9y+?=
 =?iso-8859-1?Q?X1X8r3yVXKI7LJF+at8K+dklLyJwo21ksMl1KJ3aMlPoLyoBp6kdQETDDK?=
 =?iso-8859-1?Q?7odFxHHTdEF6zOVtW9ljxPpKIfer5jSAZpIj+YdYjdudUhc3abn1sJO7p2?=
 =?iso-8859-1?Q?0JvBW3wPCqZiY209gr25nkzDWK/LvTh8cJBUkweV/hRN2E5gjnmEp9Y49r?=
 =?iso-8859-1?Q?EwqhxN36mzbaSCJd5IfCNSdVUM3+tQqMqQRlz3ZxBGODBTc9DFmzT2+uhv?=
 =?iso-8859-1?Q?t4CPd1Q1ho+zu9FUVqu14A1qsYNQKGn245w8DASwpMlslLI0OaGXEyvpf7?=
 =?iso-8859-1?Q?Ikami/V08mhEt+Fw2r5QNwmZUMY3zDup+nFmOT7SQI62mvLteI3Yug85su?=
 =?iso-8859-1?Q?gBO203TZshIDnn61Jx3KzfYw1My3XFsjvPkwvwkYen9WafeJRmAK7PVC12?=
 =?iso-8859-1?Q?nVj3d2u5CqJ+Z0Hl9gBhnoFVG3zP3yjWPoYpQVdINLnaOtQTRoUo7OSOEW?=
 =?iso-8859-1?Q?a8DNvtMGKxEwqKMrjRmj5JOQHxC23WiPBN8L1stQWrsXQqgE4CNEvjWVo0?=
 =?iso-8859-1?Q?ylSfa/sVYwYGLdXhgRo/ATlYM3fPNWgFPLEbVedYw5JV23xr86K4owCOSp?=
 =?iso-8859-1?Q?ifTdcYg48t1WEmjOHLR6QXPuJDsEP/46jYig4x/duaIFFJjrMG0EQ0Wgv+?=
 =?iso-8859-1?Q?TwbsbRvB15SMdmQaafLNDL8EgLHP8T1+HEYYH8O0kxvwIldVT8ZpDp8TdG?=
 =?iso-8859-1?Q?xLDlWgYHVHNDHJzt6ne6k42x6OPZmO/TEno57WkvMjBKnNLR70zGirNaka?=
 =?iso-8859-1?Q?13Qrq3DR7miKSjw8oNBV1XTO/yHM4Nh3jfA2VDYAC48eXOmd0QWwEOz6Nz?=
 =?iso-8859-1?Q?N8QPtIgP4nInD55VhsAeX8di4DQRujlz+3VcmVZ9vHjrrRrtSWNkZL+PsC?=
 =?iso-8859-1?Q?ejvUYwXvW7nZwJ76hRlcb/7JW6Cvm/VDUrChAetfTIKgYfsL/7VVOt4Zz8?=
 =?iso-8859-1?Q?S19AxsPH1XJBgeddYZUgRUGvp4JljHfdkopNj0uXzPlmOhV3yxqk/UuJYH?=
 =?iso-8859-1?Q?oQgbLbmlsFC3nGUVHBNH5h3uFStDw2a1IDVpxy/TI2FqmVLeg71rE9ZCDP?=
 =?iso-8859-1?Q?TqIuVUI67Qc3TTsUVRbDC/7gqjtiTHgAMPK2WW+qn30XAnBOaiw/EYV0Es?=
 =?iso-8859-1?Q?Vl9Z91g/u3daru67FJkznwatHsvMFEY0bf6JkqE1BmNcoXIGEpWt4EsJvT?=
 =?iso-8859-1?Q?kGqnrr412+KTmtbl5aSIvXuwjQu/wpjsaC/5/ZTVeV/AaTz+6qR40VzI59?=
 =?iso-8859-1?Q?1kYQJfIwyZwnWmwfzs/heYzJ9AQb2BnujpOEO8vh7I5o/kP0GzP+VEaLEu?=
 =?iso-8859-1?Q?KS3Ropceu5oDlbZX01RLjKc11p2dMBK8vVX1tpUvT2aRJia32mGk88swx+?=
 =?iso-8859-1?Q?VwVJV363+NObXFLYe24JzZv2CClzRgyjFozhtvzw9qTF+fZDI8z7qVh00m?=
 =?iso-8859-1?Q?OF9yyKPh+zwzojwI2prCSjcdR31kYOLQ/X3N01tEkbI49i9yZIKGcn/xOp?=
 =?iso-8859-1?Q?vhNoKFPDqgyHGF91QDiwFyEz80vE3Jc+VmcJlyg1VK3RdTNW+GuJba3sn8?=
 =?iso-8859-1?Q?KJ1hz/ZIXJxuE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d476c3-fd31-4860-2e8a-08dd721bf02b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:24:07.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVhs82KuVNSmMRvxRABv+6MhBrjkoL/A6zWxaCEO2nFqyi1UpnYRhdZdFDhfreyddnOKEHlyCGQVI+jWyEHmeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

On Wed, Apr 02, 2025 at 09:07:08AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
> 2 GB or ram and 8 GB of eMMC storage on board.
>
> Add it to enable boards based on this Module
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
>  1 file changed, 548 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..9c69228a2cd28ce767fa4054d10b19a196668ea2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> @@ -0,0 +1,548 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2020 Lothar Waﬂmann <LW@KARO-electronics.de>
> + * 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	/* PHY regulator */
> +	regulator-3v3-etn {
> +		compatible = "regulator-fixed";
> +		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
> +		pinctrl-names = "default";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3v3-etn";
> +		vin-supply = <&reg_vdd_3v3>;
> +		enable-active-high;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&eqos {
> +	assigned-clocks = <&clk IMX8MP_CLK_ENET_AXI>,
> +			  <&clk IMX8MP_CLK_ENET_QOS_TIMER>,
> +			  <&clk IMX8MP_CLK_ENET_QOS>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
> +				 <&clk IMX8MP_SYS_PLL2_100M>,
> +				 <&clk IMX8MP_SYS_PLL2_50M>;
> +	assigned-clock-rates = <0>, <100000000>, <50000000>;

clock rate 0 is quite strange, do you means 266000000?

> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rmii";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-0 = <&pinctrl_ethphy_rst_b>;
> +		pinctrl-names = "default";
> +		reset-delay-us = <25000>;
> +		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			reg = <0>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
> +			pinctrl-0 = <&pinctrl_ethphy_int_b>;
> +			pinctrl-names = "default";
> +			smsc,disable-energy-detect;
> +		};
> +	};
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "SODIMM_152",
> +		"SODIMM_42",

Please align to "SODIMM_152"

Frank
> +		"PMIC_WDOG_B SODIMM_153",
> +		"PMIC_IRQ_B",
> +		"SODIMM_154",
> +		"SODIMM_155",
> +		"SODIMM_156",
> +		"SODIMM_157",
> +		"SODIMM_158",
> +		"SODIMM_159",
> +		"SODIMM_161",
> +		"SODIMM_162",
> +		"SODIMM_34",
> +		"SODIMM_36",
> +		"SODIMM_27",
> +		"SODIMM_28",
> +		"ENET_MDC",
> +		"ENET_MDIO",
> +		"",
> +		"ENET_XTAL1/CLKIN",
> +		"ENET_TXD1",
> +		"ENET_TXD0",
> +		"ENET_TXEN",
> +		"ENET_POWER",
> +		"ENET_COL/CRS_DV",
> +		"ENET_RXER",
> +		"ENET_RXD0",
> +		"ENET_RXD1",
> +		"",
> +		"",
> +		"",
> +		"";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"SODIMM_51",
> +		"SODIMM_57",
> +		"SODIMM_56",
> +		"SODIMM_52",
> +		"SODIMM_53",
> +		"SODIMM_54",
> +		"SODIMM_55",
> +		"SODIMM_15",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "",
> +		"",
> +		"EMMC_DS",
> +		"EMMC_DAT5",
> +		"EMMC_DAT6",
> +		"EMMC_DAT7",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"EMMC_DAT0",
> +		"EMMC_DAT1",
> +		"EMMC_DAT2",
> +		"EMMC_DAT3",
> +		"",
> +		"EMMC_DAT4",
> +		"",
> +		"EMMC_CLK",
> +		"EMMC_CMD",
> +		"SODIMM_75",
> +		"SODIMM_145",
> +		"SODIMM_163",
> +		"SODIMM_164",
> +		"SODIMM_165",
> +		"SODIMM_143",
> +		"SODIMM_144",
> +		"SODIMM_72",
> +		"SODIMM_73",
> +		"SODIMM_74",
> +		"SODIMM_93",
> +		"",
> +		"";
> +};
> +
> +&gpio4 {
> +	gpio-line-names = "SODIMM_98",
> +		"SODIMM_99",
> +		"SODIMM_100",
> +		"SODIMM_101",
> +		"SODIMM_45",
> +		"SODIMM_43",
> +		"SODIMM_105",
> +		"SODIMM_106",
> +		"SODIMM_107",
> +		"SODIMM_108",
> +		"SODIMM_104",
> +		"SODIMM_103",
> +		"SODIMM_115",
> +		"SODIMM_114",
> +		"SODIMM_113",
> +		"SODIMM_112",
> +		"SODIMM_109",
> +		"SODIMM_110",
> +		"SODIMM_95",
> +		"SODIMM_96",
> +		"SODIMM_97",
> +		"ENET_nINT",
> +		"ENET_nRST",
> +		"SODIMM_84",
> +		"SODIMM_87",
> +		"SODIMM_86",
> +		"SODIMM_85",
> +		"SODIMM_83",
> +		"",
> +		"SODIMM_66",
> +		"SODIMM_65",
> +		"";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "",
> +		"",
> +		"",
> +		"SODIMM_76",
> +		"SODIMM_81",
> +		"SODIMM_146",
> +		"SODIMM_48",
> +		"SODIMM_46",
> +		"SODIMM_47",
> +		"SODIMM_44",
> +		"SODIMM_49",
> +		"",
> +		"SODIMM_70",
> +		"SODIMM_69",
> +		"PMIC_SCL",
> +		"PMIC_SDA",
> +		"SODIMM_41",
> +		"SODIMM_40",
> +		"SODIMM_148",
> +		"SODIMM_149",
> +		"SODIMM_150",
> +		"SODIMM_151",
> +		"SODIMM_60",
> +		"SODIMM_59",
> +		"SODIMM_64",
> +		"SODIMM_63",
> +		"SODIMM_62",
> +		"SODIMM_61",
> +		"SODIMM_68",
> +		"SODIMM_67",
> +		"",
> +		"";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9450c";
> +		reg = <0x25>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		pinctrl-names = "default";
> +
> +		regulators {
> +			reg_vdd_soc: BUCK1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "vdd-soc";
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			reg_vdd_arm: BUCK2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <950000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "vdd-core";
> +				regulator-ramp-delay = <3125>;
> +				nxp,dvs-run-voltage = <950000>;
> +				nxp,dvs-standby-voltage = <850000>;
> +			};
> +
> +			reg_vdd_3v3: BUCK4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-name = "3v3";
> +			};
> +
> +			reg_nvcc_nand: BUCK5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "nvcc-nand";
> +			};
> +
> +			reg_nvcc_dram: BUCK6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-min-microvolt = <1100000>;
> +				regulator-name = "nvcc-dram";
> +			};
> +
> +			reg_snvs_1v8: LDO1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "snvs-1v8";
> +			};
> +
> +			ldo2_reg: LDO2 {
> +				regulator-always-on;
> +				regulator-max-microvolt = <1150000>;
> +				regulator-min-microvolt = <800000>;
> +				regulator-name = "LDO2";
> +			};
> +
> +			reg_vdda_1v8: LDO3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "vdda-1v8";
> +			};
> +
> +			ldo4_reg: LDO4 {
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <800000>;
> +				regulator-name = "LDO4";
> +			};
> +
> +			ldo5_reg: LDO5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "LDO5";
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK
> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC
> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO
> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqos-sleep-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22
> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_ethphy_int_b: ethphy-int-bgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21
> +			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_ethphy_rst_b: ethphy-rst-bgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
> +			MX8MP_I2C_DEFAULT
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
> +			MX8MP_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
> +			MX8MP_I2C_DEFAULT
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
> +			MX8MP_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
> +			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_reg_3v3_etn: reg-3v3-etngrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
> +			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
> +			MX8MP_USDHC_DATA_DEFAULT
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
> +			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +};
> +
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
> +	assigned-clock-rates = <200000000>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	vmmc-supply = <&reg_vdd_3v3>;
> +	voltage-ranges = <3300 3300>;
> +	vqmmc-supply = <&reg_nvcc_nand>;
> +	status = "okay";
> +};
>
> --
> 2.49.0
>
>
