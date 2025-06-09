Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012046.outbound.protection.outlook.com [52.101.71.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AB19E83C;
	Mon,  9 Jun 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481804; cv=fail; b=fiFG8MS9KSwgOADLk40Vg4Xp2qxgyN9IQYgLX0NWlWkg6lg/WLXMeV0pc9ID7lwSykDYrXnfg8vGbqkeg/jFJLACkY32lgP5w/WTCoB9ptSfARFmEtm+YDAIzAz2t3KJuX6ialNy7klbjvQZWV8o6NoW2iH4HX0C49JaKYNbjXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481804; c=relaxed/simple;
	bh=55NA3kiYZm7B5WQEYjaWUdGQM7nYyWUXCBgUhfcGhxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aaiUT9W/4W0deM+imGrJYJIEEZtToZvMU3/qNc6OrncK2la/wU8iVk4zyw8n+VBBnhxacJl2y5DKL6oA2d/3LvUdRRltVTgwTgDjPVQwbmzwrZWYJ2hs98nrqUkC87u3j5seJo4wR1HIhxO7ft+YD5yi4PY8Rmkd5IsPcZhRk2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bMOKnHcr; arc=fail smtp.client-ip=52.101.71.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bMOKnHcr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLcZSvWRVUMWpiomAzGHWkwHNLxVz0QIVNHn9lGwGdNfpQk84pCDzh76k/YeGSpCpw6obUoRzEUQfegUn2wVm4r3qw0LQ/IGTeOKCju0Zug2ZhKYYEtE8W+Oq22lyVefUdn1+P4pXqTG94VHT5i1DXY1pVUKtOJEL4tqFuF/F3VxHDUdeIVqXClLcccY2gKDuLPhtMfm4KUOFSbRhS8EEZaPm4zCFrEXJPWLXTkFgwysCcFxCLmuuSTFWv04iJ+rOiVPza8A/vAKSkRqUKVHfzUxbt5TFAW3FORbAlMZVyUHsv5bPwgz+nxyW37SNVCIDlXARI7NnCKRTUr9D4Rtrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPjl4m9ix7ugEOqKOPD1ZG7axXK3GyZbUmIzTTxUrlM=;
 b=otECT3iJHdD0rRu1JYx6RsyuGCS0NkbWzReIqpRk2uYqldttJL62+J7yUYpi+jnut25XuP33CLhCuIU2vmioWL5OVHmYN+yY4W3S7WRuANDdeH9y/1a9sGvj3VhibJS5MQbei5HQdKPrQNEhr7Szwx411zois53HX39ln0TDQTo5ZMa98+KEV2/apzGA3y2V/D7sMmhQgdGPoQJ6yFiRo7kEo+DMWuRyR5nJL836l+1foLrUWrxGC4cejYxvh6eDgsQfvPlqv/jdudKQpSsgcOu8iAOzg7F0UFC74lnHDoRYSdlQ7niPVT8UtGeuw1WsOquH2PNB9L3PWXicR+5m6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPjl4m9ix7ugEOqKOPD1ZG7axXK3GyZbUmIzTTxUrlM=;
 b=bMOKnHcrV+DjwL7TBddVnbYUWU8IRDamc0MRyYGyV3Ub3dli/t7MVwTXw+2lncONt5xDEx5GeMH7iB3Ap0NctooVvtjHkdCmnl/X/6IDJXL837w0f4+J/fHIrxi79SrQk3NRxjeCvFDZmHRlu6uMpcRTVNB/xcPt8rlMstw3NLkWk4fFo2btZnmrN04PG5Z6vutDeAD2B3Xt0/OHtJt5VfRl5Zwu5ppva93KzuX6u4STxHlGR3MZE0320wFgS9cg4JBTKtYVzGMHXfqza0M+yVnyE1euCi6ggIIzFl/uTfOGp/sHwWpNabUgsYM7pIJ2pgDd2n/W36W+z+ytbpupRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10830.eurprd04.prod.outlook.com (2603:10a6:800:260::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 15:09:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:09:58 +0000
Date: Mon, 9 Jun 2025 11:09:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andrew@lunn.ch, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
Message-ID: <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf90600-a999-4cde-c4dd-08dda767b330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lUpv58wxQTnIc6QpkqQ4tsrzlLiTt+GVz/HY1toK0msTRZGWzRQO10ViL9zy?=
 =?us-ascii?Q?zlhgD+z3Trl8LKSz+1EXNx0yVpqEIGl5kOvATBAVuTBLQ/ghMo+h6yRU4IXm?=
 =?us-ascii?Q?wtU2TjEoESSTZlYcRgwRlai47AsoZ59kVpsVdMuG0A3s+pMtq5UkoNBquCWU?=
 =?us-ascii?Q?U/T1FyLsP9gJo5WSoNjqwSe00AoV2BRkbNUenWI5W3GkhExoMf4IDYxwKbbZ?=
 =?us-ascii?Q?efU9ltAjTUYZ5UzFF7YwvQbZgz4RNhwKsMF4/gaHD92wrhYZiVqp/+Yhrfxu?=
 =?us-ascii?Q?5UaiL5DFrCnjztfxyWlevNZRV3mrBSGg09N+YEgNhxdJTB3+OgIW3X7CaVZu?=
 =?us-ascii?Q?Gw0uKj5XKG5q/igDfL+lQ33iLSC/nJeGB+O8bmgf6zEb272P5m0GrP3wgY1t?=
 =?us-ascii?Q?ZGphYkPU23R/vlIAUq42ydxPGOxmW9tSO0WBdL/Bb++YwAJSuAtfvdfSaRYI?=
 =?us-ascii?Q?wwJy6mO0+uZCoV+pmmkunkG+u71FAD0qNTn/Y70iURK0Ar9dcdRnD/FF6/q5?=
 =?us-ascii?Q?w5Sdkjsgs2Vf80WoyLFyfFxD45Jl+sOGLoMAfkaztkcLFT/4vIql+6jAuX9T?=
 =?us-ascii?Q?y964aCc/IEi08fiJU3en2VYJIDlVWHVXLH+I0b1Em1/mY6ZUuqlOUQ2PhCFn?=
 =?us-ascii?Q?vJBpMMHXnMFlsw/Q32wK4LR7xMHDPOroTt1Pls0I2S0IrZ3HBBihEYUFWw7s?=
 =?us-ascii?Q?iFcPhxNj55ZL2Ofi9TA1oRjRhTLCkquAi+rnlgT2mmYOQMhWT1oppmbaSAZQ?=
 =?us-ascii?Q?9L5CzLTr5JqU2UWQyqgPSjk/xtT0W5fVtvgPHEJ5dzxg9RY8szscQEF/yttq?=
 =?us-ascii?Q?5+F1k6ty366OM/K8p32ZtCkI0aypjToC9QER2qPt7mj7qtSJBimDQZMrXVs8?=
 =?us-ascii?Q?wy1MfdqkC4HAyjeNjMr026yEsGE4jfKVMvluxwP92KUs73K6jbTuSZhnZMR/?=
 =?us-ascii?Q?LIR8hFLmYfhSU+voHd6BkTf5UdmS9HaR2fM9fpYrmWgb0JAV/Hi+A8vX8ClR?=
 =?us-ascii?Q?5GPnkGj1zxQr1Q9O2QPa1ylM/eopBGWftgL4D9TtGEZH9Ofy0+hU/NyHs6jb?=
 =?us-ascii?Q?5sPwrIlljWtYOfV57JS9wHTZPlQl8vhGzXgI9qAAl08J0siiks78ok748a0+?=
 =?us-ascii?Q?i22BG7GY3wvITdElTUIhIpdu0qbq2+iTQV8wYuVOVFeHsR8+VS5CXmD9t79+?=
 =?us-ascii?Q?N9GgOr8dpul1XfME07MhNoAfd0W11buw4pWZ0jF7K8iJEeDnQ+dLt/W1Cghh?=
 =?us-ascii?Q?wkUNpoh4qzQ3h9MEJ2ReyMgX8PmoCW/8TwWU3Oeazcq5pVVEZIt+6rb4r7mE?=
 =?us-ascii?Q?4oRAa9RLebnTJ2yvKYTB+JBpV1FluIZDovI2EYZzXZjgtUNLgHRB+hcBhB73?=
 =?us-ascii?Q?6pyfVRpZK6rwEwDnej+SK2cNwzXGCYteseplHOjsQ26UtcoReYNs5VKj8EEh?=
 =?us-ascii?Q?SPYyxK/lDlhL7EwaUNgS/4fJHqbXdTmXX1aMA/N+93p4Tis3+qU1EA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQCIy5SVzwDomdsc5brRczjGeBIlJKiW93jv6fla65+jZnGDQN1gAYoCd08G?=
 =?us-ascii?Q?kIwHkUjluaKqqUkT5ryBxWzVRpg+GtOPqLObrdOcNGwimQOKguTMwP+jr+zG?=
 =?us-ascii?Q?Urbe6JzwD3cyyzmiIeiCCI1Pb1Jun0yFSF+dw3ZgbVOUePbAyKQiD3jNn+ki?=
 =?us-ascii?Q?ll/y4/C18qv97QoWVjEU5NBzFzLJuzryp45g2C9na2/KDB6kURnccVwYWoE2?=
 =?us-ascii?Q?EncyUfgCP4cziyYd43rh+ThfYBz/nZnB+SWL92DusFNadFg/S3UKrAR45a5b?=
 =?us-ascii?Q?6eFyNAmW/Et6yKvgTBuAwj9JskAmXe8l67/Nycyt8nM2RqrwMnCwfkzzicgS?=
 =?us-ascii?Q?nRr8VdY7wJj5iIAiPWMARa/RgeanUiY3aRij2Jcb4Dkx0bshS6Sv5C6rgzSv?=
 =?us-ascii?Q?50eH6pH95nvQUz4f5LerzLRBM01wWJR8O7VRc624cOGd2+NrvzVzFQfTz8CD?=
 =?us-ascii?Q?yEBMp4ABtlfHb2mj4eWZUZTPUR/5543mLqgRwPZqQhWYQqB4KXZl/g0CoctR?=
 =?us-ascii?Q?uA84MSm/xVHDqg9jlQwGlf5tvWhnOLGSruurP2X11o/DSUD0v36CdjrS4qAS?=
 =?us-ascii?Q?WGAmkAuyMloL/NILi8j46x/CfZAkbdTaVzL66iHxXMrV7iWQTYqCMehMz5Oj?=
 =?us-ascii?Q?1qFzfqyToBXF5E4dDPOl0sPAI059D+0qvqKCW0Zv9o8vIJ7hhiM4pi9N2/Da?=
 =?us-ascii?Q?mGW+iL6Jsi9MMbuci2oZG8QpauVN/N2tnxP0ed8X4DeJwDIFv55gj4YCY3AN?=
 =?us-ascii?Q?B7OC+6sQtcJK9/ZQfV14DqSKgyVHL2EMTN58BhFZhHwd2r8pdyJmanbUQFNo?=
 =?us-ascii?Q?ZBVQwYYVeYQkdfYqY8f6pIxLiKSQIhItU2rNnJyZFWGfL8wb9A+d0FUWovll?=
 =?us-ascii?Q?zHvwBBDpaw8mh4MzcUsfkDrVSqHlYux0no6W49e/79NlJg8EUREW62JW40Oy?=
 =?us-ascii?Q?CeatIJUmNCiWmtXVjx/K3hgE0svqEaNLAFT77TyEzS1QArpBcxS0jSc7JhZW?=
 =?us-ascii?Q?Nz+1rLAFd1FgRLZgHzzY5Z4VnKDSZCash17BU5XsLV5DLU+57Yxv/UmiI+qw?=
 =?us-ascii?Q?FNs64c8PcWgSQZGDL9+E0IdZ5EIWTal9DFirhTA43sp4MVEGTY250ycyQl/2?=
 =?us-ascii?Q?veX8QQWL/k5R66aZRTntudJyopEMkkZ9ViYI4zUugJ+FLKFmD1FTEH5G3P8Y?=
 =?us-ascii?Q?6AHfnvQqqZdIdZ274HHBPnJUla62DY0472h59cFbzYA2wfR7x5VY5TB20jTx?=
 =?us-ascii?Q?FGXd2fG1s6rZZv4jbhr/vnuHMQVeI4sLB3LZpV830GSerh1cQ1Rb4gD9Jp99?=
 =?us-ascii?Q?zqnMlZVvngGWfSHOJDp4XabYoKkS7li74CTqaFI8PRpgR2v6o2L4QBgkmoPE?=
 =?us-ascii?Q?xrjX8naNaRKxa/YNxlOCkOkDUEIPHa/XU3xfoi08ZqzEZPfYP10yQolqI/Lh?=
 =?us-ascii?Q?JWztyKuu2CT3jQRtGFlHb+VHVnmsAEPZTde86ukco4UOvqB4ziGskstOUCob?=
 =?us-ascii?Q?1sJPw5/JGVuvAGjAxxBpL9d6kI/vLhqzaghv1Lp34HNrPxnFWVdm+6mAHVSJ?=
 =?us-ascii?Q?8Uhr0AHbWlQYWtbzasMLPySII4afuUx7UXRAmQO0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf90600-a999-4cde-c4dd-08dda767b330
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:09:58.7304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32+H8H+zSOj8TmikURREEXy/xhaKeXRnJKY+6idBLWBZJali+aN7f0xW+pLI8ZXmTiwdx9GakJBWXZ9DJla/ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10830

On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> MDIO bus at address 4.
>
> This patch adds:
> - EQOS controller configuration with RGMII interface.
> - Proper reset timings.
> - PHY power supply regulators.
> - RGMII pinmux configuration for all data, control and clock signals.
> - LED configuration for link status indication via the LED subsystem
>   under /sys/class/leds/, leveraging the support implemented in the.
>   mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
>   Two LEDs are defined to match the LED configuration on the Variscite
>   VAR-SOM Carrier Boards:
>     * LED@0: Yellow, netdev trigger.
>     * LED@1: Green, netdev trigger.
>
> The RGMII TX/RX delays are implemented in SOM via PCB passive
> delays, so no software delay configuration is required.
>
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> ---
>  .../boot/dts/freescale/imx8mp-var-som.dtsi    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> index b59da91fdd04..3be59692849f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> @@ -55,6 +55,24 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
>  		states = <3300000 0x0 1800000 0x1>;
>  		vin-supply = <&ldo5>;
>  	};
> +
> +	reg_phy_supply: regulator-phy-supply {
> +		compatible = "regulator-fixed";
> +		regulator-name = "phy-supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-enable-ramp-delay = <20000>;
> +		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_phy_vddio: regulator-phy-vddio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vddio-1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
>  };
>
>  &A53_0 {
> @@ -73,6 +91,54 @@ &A53_3 {
>  	cpu-supply = <&buck2>;
>  };
>
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@4 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +			at803x,eee-disabled;
> +			eee-broken-1000t;

are you sure eee broken? recently we found it wrong copy from fec.


> +			reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <100000>;
> +			vddio-supply = <&reg_phy_vddio>;

extra empty line here.

Frank
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &i2c1 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
> @@ -239,6 +305,27 @@ &wdog1 {
>
>  &iomuxc {
>
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10				0x150
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL				0x400001c2
>
> base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
> prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
> --
> 2.43.0
>
