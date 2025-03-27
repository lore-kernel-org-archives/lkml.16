Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012026.outbound.protection.outlook.com [52.101.71.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F098176ADE;
	Thu, 27 Mar 2025 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092788; cv=fail; b=i1yU1zaUd1cSbzzEvSJlh/F+WLfVmx/XI76CMxoOCArZHx83L5OD/6n+zxouyYOcdEz2wGuyc4VvyKZhYPIdGW9yIDBvNevCl2Pux2FdT+BiKBGeswj2sQPaFeqvfyEGrgQ9zE2O8s7xmFVZhRZaXFht7X88YU5OviOoe3/cvVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092788; c=relaxed/simple;
	bh=VukGWC0H1D2h4DiBxlUWIJgQlp9eM93hV3SMAgiC858=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tBir4cw10RGgF+qD8Sct0x8NPeJC7n+R2FdJYiVn9udf3PmPBjuivHtkvREa02kLxlBVzTbp/bSdYaJwzKsj+e/X8ZKEebCbcKG+f6h/VgTyRrbTClJcz4zsCJimO2Snup+oAJOacYK6uhoW/vbmBp6PH78AxgySNtRrXSMbMWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g8Prc3oU; arc=fail smtp.client-ip=52.101.71.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g8Prc3oU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wObpj++2ofr3jKNr8Ed9rfqUT28aWB9/DBdImlHwTpVSAy+tQR3ac7ZYV3ujeb64OpmX0rde3M5OFPBhpoK4lncGzFB2xS7QMmZ/YsfixWcbN7h/uTifLYcqzpk59RyE9t8GdWiiJmNMY17HhinOBcUE34SiG/4n6ztEI4SGEqBwfYaJ0iX7JTrPOlgq15cnG30Mw30inelRKknxzGaBgNSxe/su4+d16I7XMo+i7gh3ZMJPpxF0sYtx5k/A0OYekiE3C4nJ/pgBdpy0UzI7AVXdkkv+zykJm5aHWCXkAGvTt7FFRmEQ2Z8tDZQtcQ0wACX+vhmOGLZe6xz1WDLysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXLTCh7x0d6EIG7vvZZKBfstmTsTIjMlIIQOf5eg4kM=;
 b=sudmjJhqgvNoVhT6WxR+ujrOQrrT7vEgZe4/eEH4daLFrqiS139cjjdsS8HYs1yn68o3SuKhJJ+x4XQpeIltIWTelPNHUkFumKTROC9gLVeAfUH+W6f5hjrZKqR5d3/MtLLJspKJgNRnWGyd2h8KMVClVvrSQ57+iopMA93YmwNRUrOQIPoMi/mNzKiZbk6b2QajRD3ym7SdC7GOTUYvKQW4zteL9aYuxkbaRe4XXhzaaEIeLbxL9+QfQHSwZs659ufgpYbgQUIPmBEi/NZ8SYISCO43uD/A6HbmhyHMAyg+Ra7CDI3elOSneDpcY2pj43BGcjyrp0BtSrrIA7JilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXLTCh7x0d6EIG7vvZZKBfstmTsTIjMlIIQOf5eg4kM=;
 b=g8Prc3oU32MpN9ybWOoYrxQHiEkYhv3ALnwNDr2pDNJXNIEfATM6ES2C4bfuy6FpuUfMeFEfwcwUZI9oKZWQxzOshxcQHGcvIvnDSUTr1Q89TpzfBBf3l5CPqN52eB2/QX53UVsDGIKbMKPpXCKVijvcAi1mlWkluREyGvF7GuSvokEGCxm7N+dDo9iDs9Tk5J+EDSOjWt8zpZ32rbVddxCbenZy+iZ3YVkpHIyvpeJO8ARxR1g+GEEmgiLhoMKQf5RA86+Gs7VOhOtC52RSRN44PzWkAMkEQ8vRATEf7/KESgxrHS+dB3dXBf5REvAiSYG/GuGp3sN8TX84yDNPrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10327.eurprd04.prod.outlook.com (2603:10a6:150:1e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:26:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 16:26:23 +0000
Date: Thu, 27 Mar 2025 12:26:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/8] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboardy
Message-ID: <Z+V8KLTp2o4hU22C@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-6-4e89ea1676ab@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-initial_display-v3-6-4e89ea1676ab@gocontroll.com>
X-ClientProxiedBy: PH8PR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10327:EE_
X-MS-Office365-Filtering-Correlation-Id: ba911186-b2b3-4a95-6ab7-08dd6d4c1d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?brCdVSD4Fu3XtoDlHt3eTEjqFxLwjoEjkWmjnZ6njSJ6zyjLz3jnRmowhTTd?=
 =?us-ascii?Q?mM7Hb/dnONL5BobdJQomXKgg5abEB194pq4ZTjj0EdwGHc9tQfR7CcmQpTHu?=
 =?us-ascii?Q?MJSg4KW/l/l2IgDFUn0KAZyMuMA9NVA0KelJU+CM+6pw5oSMT7YByvI87M1i?=
 =?us-ascii?Q?bEIVXiSPKaytVqlgOtZwiO6SNbjoJAU7N2yQTRPg/+Rwd58bzSoeIgInUtFQ?=
 =?us-ascii?Q?Xx+WpuFuTdJsEeKfDCfp0z5dUmkFb49ZO+cK78rcAvYEk64Y0I6K1BAPRD6f?=
 =?us-ascii?Q?syBIb9BeCMGknWn5nfhhkydF5V9bEH/83YN9N2byUGYPG1HAdECp8GjrcO2F?=
 =?us-ascii?Q?vS/szBSNEnuljlTbVnN9BaclC8WHMRVUgsa6dybotV0j/HIB4MEJjy5+HjIi?=
 =?us-ascii?Q?+KqzKYNF5WDH6nwKdT4pxZKnZdocJY+tF3/c+xUYB/y/7+OUw7rWdNRAOf3E?=
 =?us-ascii?Q?6ag53UGvZ9vZNlyiq0NtIk5fBikY/c749i/cNIjJ1qh7DRAXbqimwaJgeDsQ?=
 =?us-ascii?Q?11UYkRALZk6KsEFGIGua947ZRollC60wVk0o2OwF6XtZJ8v8ewD2nxYozrrx?=
 =?us-ascii?Q?tLdTnrnwJcCqIVflafIyEARPEhLDMUh2etxua+nz+GZSchiV/o98rEgLafdM?=
 =?us-ascii?Q?D+09PFvRm0DtKwseWLPPO077xmwOC187VFR2UlFvrfN2iqvMv1GPFbzETpFU?=
 =?us-ascii?Q?mQ4j6DCK0t2xrYUoogFD+MiR4yCzHvkAHKSG/a+jnUrbBc6bCVP8kq9+v2PE?=
 =?us-ascii?Q?D7ODrj87XhRnKp8aPqvLJNFx+Q8wiCPrVI6p36E/PZnP6cqbkBhd8EacGX76?=
 =?us-ascii?Q?tXN29Pc2NxizRyfRTXnFR8g+Rgs1oi+kxCF5hmbCB2vIAeiHHundMke+LW2V?=
 =?us-ascii?Q?d5s/1U7ApO4CL3h8O6whrN4w0AwF2RrZQv6/xLFqxLm5rTsz7Tu0EpVl7kZW?=
 =?us-ascii?Q?1s40YP2EHCNemKjNQAvkycbntPYsjT56WcGTBQjMbvLRm9Oq1eg7h6EbIotC?=
 =?us-ascii?Q?z+1G0pB5qDR4Hz2QSmfIX59+NL3rX+d8YtlWaLsIyKUlek4IyXELShdbjlwO?=
 =?us-ascii?Q?jbEU7oDX/Zd4ZfaE5OB0kDjBvj3YDLxjyPfgzhXn28yuOhoiLUQ0p/9HFYSS?=
 =?us-ascii?Q?7cNsobiI6fUsibUiSO8V3WSFL52pyIBtSM+zA4uwZ+lS4cKIViFAqI2MRJ+w?=
 =?us-ascii?Q?JQqGf5OY/uagL3dM1T8GK1C6m7L0ZOvj7zZRDCWMsUuG+Rak/Buv9HZsuYG8?=
 =?us-ascii?Q?tQ/4gRgFsc0SDewA5yh3OT7++SrOiKJ5iiNbZtLT3bixNhcVKmF2Rl6j8BdE?=
 =?us-ascii?Q?L+00/+r1afxQm27MRXlUDJQTz52IrOm8VqiNuIho4fMXkD/1hexlQli3gXQg?=
 =?us-ascii?Q?eo7y9eUmuX+5k4o1/AXu7NoAMrit2RpUe4AU0m0zloiZECBFaTkczjyaV6w/?=
 =?us-ascii?Q?3PaIhYM/iK47v4M43cebwqtRCSSrkE159mvO7j1B6j6vzZ1Yo9Elqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xv0IyZxlom+76XqKB17N2/riMBbffMrMpuutbejuMoXDLnQ9C99GFe7jG+Ra?=
 =?us-ascii?Q?N60aZ8r7ADwtoyfttzv7l15/yN5AyDX6Zng2Op7MNZnPUkZQEwRj8xofLoJL?=
 =?us-ascii?Q?NcpMiyPSugqkzKvtoN+1NTopww8K4Yq8Y50v3WOw2fXZ04vZeWcTAQhxeLF8?=
 =?us-ascii?Q?ihyQmrbd1Ex85tp8rIM5wVk0QjNQIOmu1HtXauu/XuzvnoJXCWWbYiq70m9t?=
 =?us-ascii?Q?jKYVt+5IvJzQVVfSKmUjiOKkgxSz804plFX27zxgAFMYhy1RnHN9IIViqZKT?=
 =?us-ascii?Q?JlnePMwDgamPoAmDnJsWpYC7+s2snUx1MiLRoY4bYVTY1I3x8WHTjWYQTqxL?=
 =?us-ascii?Q?Y+FJniVE4JIz2jb7kpTZep8EzrbKwKR3cK+md+lCdgpJqMpYN3oMOZAuc+u0?=
 =?us-ascii?Q?MiW0GBCdlu6iM/4X1Uxr+eovIpg9xlQiuwBKUlh1+tHtPczIbbTbRAKItfhN?=
 =?us-ascii?Q?/i8UiSXt3RbokQQWH2NeVLiUmg5R6hzibd8f1g8L35iD/JjyaZH/w93zUhks?=
 =?us-ascii?Q?3LJXF4x6NKD78Xrzo3ypk8C6fZ3M3tSh5hAaln/oxgaQrREhkZje6oGt/Qiz?=
 =?us-ascii?Q?mEtFin3IaXEwiOwvqvN1w3JCRSKBnD9bb/fh8IJoGQMRq5FOHtj3s/x5L2P+?=
 =?us-ascii?Q?3psjC2HczJsNs3zRyJuNcrW+ZP/qcYVjWRgqGZdBSTqj1+Jmni4rlXDoCbh0?=
 =?us-ascii?Q?c9WyeLJyhRxZcTMs+gUwePcVJdSyXzxz86Tx6k83GgrmgvH8+y+pJ+yjY88G?=
 =?us-ascii?Q?mP9PFXKxOeqkBpKk4haVk9IjNOH9bPr1uACnPo+yXjdgSf77aqeivf8zh8+9?=
 =?us-ascii?Q?/AAn4uIHy3guxcRfc/f23A2qkLCyPHE6Y8J1wqXx9jTmm6VliZ9dU52+EU+6?=
 =?us-ascii?Q?uaoVv7vvX9iGE0L+stTWYYcPBJLEH+MeenQheBdf0j6jWsN4VfjqjrMupLeg?=
 =?us-ascii?Q?gIGSmQu1YfoKVTVLO9gdsAMlzxxcH3vefW0pKjG5pZqXaYyYbyUGSP8KRepm?=
 =?us-ascii?Q?fg/5hm5kyvzQl3ccJ9Pa80IbXkL5KsTI+DS5j8JulwKPOjTg7faRQcJLGdel?=
 =?us-ascii?Q?kN79rubPvr+pIrD3G/f++xSFsKVEJonfjcQT+DhmfHup7PxlMgzq5RApj+Vo?=
 =?us-ascii?Q?kCZlgekVpozhrLOXoxDphxBqyAH7n7ZhFHHn5vIGQVGAptOhbb4ebCeVfNTU?=
 =?us-ascii?Q?17/+u11hR6Hq0h3eXjgCMbMB66CXjzbgkNmy9JzxTRRBrK8URfKmO0zlws6X?=
 =?us-ascii?Q?xgCiOJs0I2FcTgvVuxRhxCR1is4hL8jYILngQrpjOerkiOvmyI4ObCjInpiT?=
 =?us-ascii?Q?l/1kR5IHNLwlbOXsBzTwMl63M2618fRX/NVbbzSKRSmDr/JAw6lWnwGRGXnw?=
 =?us-ascii?Q?wpZ9V48fvL9bM3nyx4tXuh/929Ds1XKWtzAeNPS2kt/1nmy8ht5zf+Pyfl2O?=
 =?us-ascii?Q?Hg2wrrE0rgZqe6y8WYzHx/I8d0jHojwp2a+WqRhQNw1XhWX7D/S4fdyf/lTx?=
 =?us-ascii?Q?u6s2V4US8Tr0PW23N1yHgAe6duL++fhhQUjuS772CReMQzR3Zh+MpTd6tkcO?=
 =?us-ascii?Q?WQsmheB12AUk/H7cuw/fA3JGsYR9DmEbev3RlHXH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba911186-b2b3-4a95-6ab7-08dd6d4c1d1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:26:23.3387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdHOJg2sIywbrO0gQkwaLP5YBuzCxUK8mC3MgR+7iQRHvTJrV9SlnH7jLWouxovnPVAZopRpsmio2WIqNg2HXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10327

On Thu, Mar 27, 2025 at 04:52:41PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Moduline Display platform is a part of the wider GOcontroll Moduline
> ecosystem. These are embedded controllers that focus on modularity with
> their swappable IO modules.
>
> The base Moduline Display board includes a board-to-board connector with
> various busses to enable adding new display types required by the
> application. It includes 2 Moduline IO module slots, a simple mono
> codec/amplifier, a four channel adc, 2 CAN busses, an RTC and optional
> wifi/bluetooth.
>
> busses to the display adapter include:
> - 4 lane LVDS
> - 4 lane MIPI-DSI
> - 4 lane MIPI-CSI
> - HDMI 2.0a
> - USB 2.0
> - I2S
> - I2C
> - SPI
>
> Also a couple of GPIO and PWM pins for controlling various ICs on the
> display adapter board.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../imx8mp-tx8p-ml81-moduline-display-106.dtsi     | 535 +++++++++++++++++++++
>  1 file changed, 535 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3ab389c9744f5189d5a8a802aa4c4ebb9f7b12b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtsi
> @@ -0,0 +1,535 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include "imx8mp-tx8p-ml81.dtsi"
> +
> +/ {
> +	chassis-type = "embedded";
> +	compatible = "gocontroll,moduline-display", "fsl,imx8mp";
> +	hardware =  "Moduline Display V1.06";
> +
> +	aliases {
> +		ethernet0 = &eqos;
> +		mmc0 = &usdhc3;
> +		mmc1 = &usdhc2;
> +		spi0 = &ecspi2; /* spidev number compatibility */
> +		spi1 = &ecspi1; /* spidev number compatibility */
> +		can0 = &flexcan1;
> +		can1 = &flexcan2;
> +		rtc0 = &rtc_pcf; /* i2c rtc is the main rtc */
> +		rtc1 = &snvs_rtc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	external-sensor-supply {
> +		compatible = "regulator-output";
> +		vout-supply = <&reg_5v0_sensor>;
> +	};
> +
> +	reg_can1_stby: regulator-can1-stby {
> +		compatible = "regulator-fixed";
> +		regulator-name = "can1-stby";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flexcan1_reg>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 3 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_can2_stby: regulator-can2-stby {
> +		compatible = "regulator-fixed";
> +		regulator-name = "can2-stby";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flexcan2_reg>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_1v8_per: regulator-1v8-per {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8-per";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_1v8>;
> +		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		power-supply = <&reg_3v3_per>;
> +	};
> +
> +	reg_3v3_per: regulator-3v3-per {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3-per";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		power-supply = <&reg_6v4>;
> +	};
> +
> +	reg_5v0_sensor: regulator-5v0-sensor {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5v0-supply-external-sensor";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_5v0_sensor>;
> +		gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		power-supply = <&reg_6v4>;
> +	};
> +
> +	reg_6v4: regulator-6v4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "6v4";
> +		regulator-min-microvolt = <6400000>;
> +		regulator-max-microvolt = <6400000>;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "tas2505-audio";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,widgets =
> +		"Speaker", "Speaker External";
> +		simple-audio-card,routing =
> +		"Speaker", "DAC";

fix indentation.

> +
> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai6>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&tas2505>;
> +		};
> +	};
> +
> +	wifi_powerseq: wifi-powerseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_wl_reg>;
> +		post-power-on-delay-ms = <100>;
> +		power-off-delay-us = <500000>;
> +		reset-gpios = <&gpio2 19 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&ecspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	cs-gpios = <
> +	&gpio2 12 GPIO_ACTIVE_LOW
> +	&gpio1 11 GPIO_ACTIVE_LOW
> +	&gpio1 10 GPIO_ACTIVE_LOW
> +	>;

fix indentation.

> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		reset-gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
> +		sync-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&reg_3v3_per>;
> +		vddp-supply = <&reg_5v0>;
> +		vddhpp-supply = <&reg_6v4>;
> +		i2c-bus = <&i2c2>;
> +		slot-number = <1>;
> +		spi-max-frequency = <54000000>;
> +

Needn't space line here.

> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +		sync-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&reg_3v3_per>;
> +		vddp-supply = <&reg_5v0>;
> +		vddhpp-supply = <&reg_6v4>;
> +		i2c-bus = <&i2c2>;
> +		slot-number = <2>;
> +		spi-max-frequency = <54000000>;
> +	};
> +
> +	adc@2 {
> +		compatible = "microchip,mcp3004";
> +		reg = <2>;
> +		spi-max-frequency = <2300000>;
> +		vref-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	xceiver-supply = <&reg_can1_stby>;
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	xceiver-supply = <&reg_can2_stby>;
> +	status = "okay";
> +};
> +
> +/* I2C2 bus to modules */
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_gpio>;
> +	sda-gpios = <&gpio5 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	scl-gpios = <&gpio5 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	tas2505: tas2505@18 {

Please use common node name.

Frank
> +		compatible = "ti,tas2505";
> +		reg = <0x18>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_tas_reset>;
> +		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +
> +		dv-supply = <&reg_1v8_per>;
> +		iov-supply = <&reg_vdd_3v3>;
> +		av-supply = <&reg_1v8_per>;
> +
> +		clocks = <&clk IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>;
> +		clock-names = "mclk";
> +		aic32x4-gpio-func= <
> +			0xff
> +			0xff
> +			0xff
> +			0xff
> +			0xff
> +		>;
> +	};
> +
> +	rtc_pcf: rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <7000>;
> +
> +		clock {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};
> +};
> +
> +/* tas2505 */
> +&sai6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai6>;
> +	status = "okay";
> +	assigned-clocks = <&clk IMX8MP_CLK_SAI6>;
> +	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,sai-mclk-direction-output;
> +};
> +
> +/* debug/external */
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	/* muRata 1YN/1DX */
> +	bluetooth {
> +		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> +		max-speed = <921600>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_bt>;
> +		device-wakeup-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-names = "host-wakeup";
> +		vddio-supply = <&reg_3v3_per>;
> +		vbat-supply = <&reg_3v3_per>;
> +	};
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usdhc2 {
> +	max-frequency = <50000000>;
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <50000000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	mmc-pwrseq = <&wifi_powerseq>;
> +	vmmc-supply = <&reg_3v3_per>;
> +
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	non-removable;
> +	sd-uhs-sdr25;
> +
> +	status = "okay";
> +
> +	/* muRata 1YN/1DX */
> +	wifi@1 {
> +		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		brcm,board-type = "GOcontroll,moduline";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_wl_int>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "host-wake";
> +	};
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_reg_1v8: reg-1v8-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_MCLK__GPIO3_IO25 /* COM pin 144 */
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_reg_5v0_sensor: reg-5v0-sensorgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD7__GPIO4_IO09 /* COM pin 108 */
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_tas_reset: tasresetgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24 /* COM pin 143 */
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_bt: btgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14 /* COM pin 27 */
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12 /* COM pin 34 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15 /* COM pin 28 */
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +		MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI /* COM pin 46 */
> +		MX8MP_DSE_X4
> +		MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO /* COM pin 47 */
> +		(MX8MP_DSE_X4 | MX8MP_HYS_SCHMITT)
> +		MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK /* COM pin 48 */
> +		MX8MP_DSE_X4
> +		MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12 /* COM pin 51 */
> +		MX8MP_DSE_X1
> +		MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11 /* COM pin 162 */
> +		MX8MP_DSE_X1
> +		MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10 /* COM pin 161 */
> +		MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			 MX8MP_IOMUXC_SPDIF_RX__CAN1_RX /* COM pin 81 */
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			 MX8MP_IOMUXC_SPDIF_TX__CAN1_TX /* COM pin 76 */
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_flexcan1_reg: flexcan1reggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03 /* COM pin 101 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			 MX8MP_IOMUXC_UART3_TXD__CAN2_RX /* COM pin 61 */
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			 MX8MP_IOMUXC_UART3_RXD__CAN2_TX /* COM pin 62 */
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_flexcan2_reg: flexcan2reggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09 /* COM pin 44 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL /* COM pin 41 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA /* COM pin 40 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16 /* COM pin 41 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17 /* COM pin 40 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +		>;
> +	};
> +
> +	pinctrl_i2c4: i2c4grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_MISO__I2C4_SCL /* COM pin 70 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_ECSPI2_SS0__I2C4_SDA /* COM pin 69 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +		>;
> +	};
> +
> +	pinctrl_i2c4_gpio: i2c4-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_MISO__GPIO5_IO12 /* COM pin 70 */
> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13 /* COM pin 69 */
> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +		>;
> +	};
> +
> +	pinctrl_sai6: sai6grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI6_TX_SYNC /* COM pin 95 */
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_RXD4__AUDIOMIX_SAI6_TX_BCLK /* COM pin 105 */
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI6_TX_DATA00 /* COM pin 110 */
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_SAI6_MCLK /* COM pin 96 */
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_RXD5__AUDIOMIX_SAI6_RX_DATA00 /* COM pin 106 */
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX /* COM pin 60 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX /* COM pin 59 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX /* COM pin 64 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX /* COM pin 63 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SAI3_RXD__UART2_DCE_RTS /* COM pin 65 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SAI3_RXC__UART2_DCE_CTS /* COM pin 66 */
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: pinctrlusdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK /* COM pin 57 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD /* COM pin 56 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0 /* COM pin 52 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1 /* COM pin 53 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2 /* COM pin 54 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3 /* COM pin 55 */
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B /* COM pin 153 */
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_wl_int: wlintgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13 /* COM pin 36 */
> +			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_wl_reg: wlreggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19 /* COM pin 15 */
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +};
>
> --
> 2.49.0
>
>
