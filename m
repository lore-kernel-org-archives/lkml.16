Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF712356CF;
	Tue, 15 Apr 2025 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743195; cv=fail; b=BP9ZZgF0Oo72vuLloiiG/6EYbkQHRs2lOypLP37u3kzzhr1H7EB41lI47dimC4rSvJYqKq1RuKp3mhBatv6Epa5tLKAYm0cQIEy7L1xRokFceZlA2Qxhzssa0h+sVXWgrF0CB6tu2rLuqCYjCXYoDSWDYN2lswRvCUMn+1zrhqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743195; c=relaxed/simple;
	bh=2t6ZEi6274HiNl1rKZDaqx23jF7j6wRZaFQ/NDKMQ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NClTM1kp3y3b2MB9d8JFvD4KT+wFk/fs1wFJbJGsR8TVmdRgviNdeUd70Ga80fxI6Uk+IQijXcFrGAeaQ6kdFUQTXMECTiqkbwwGsg3lf59Hvz06vhb9k19tsd9kRHIQFD73o3m7m/96rJNYdWxEqmSLbaBSqtC+FXqIW4gk2ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dGGQceie reason="signature verification failed"; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dGGQceie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1oEtE6jvjtLI4KcTGMenBH2LVK7gYLkHqhNBeeDeFofvOZXRgBlibbZMkZKAVP+81BSOwSMUBgSjxOxwO0KUcc5YVYyRRQo0p+W1OJ2og8r+KCSl0dQiK/CjQtvVqZDRizTk+TC69UMAsh6QE0o29cWHPuCQmnk6PvCoA2YEl6dB/FTOay3ClMEgV3cEbT8Rl1Ux49WnyUhKmVINSuGYXaC/vScJWQpLvAXlcF5Mw8+AtqDfb3ZEwaJgEqUhwB108omS8wWZiHbaGJ6sKwf6ZkIvzghewTPxjz/226crfiJ4del2QiFi+YIMCcpEmiudfXnYfGluTMUM8OFWZEQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndwCOkCgNXQ4ChgdsdvrUPbuw1z9LUInAt3h2zu3sSk=;
 b=SWM2v02k/eE/qjfNPotJ5lGYw9w+wJ6s9Dx9pnm5tAFRlSYUHu/XNb3OKp2QwdTKAP4CtJqr9psBGtQ9PxorBWeAttQdLBJQC7rythibywxPaF0oLxZWJSvU04OfkyNJmpJ0n73w0NUTnWb7y8H7dB0CkTad9zBtmyVnXKZEdCnszUsBGba/3gWFZPflWim1teZ56QRaIyNt3KqlQiraxDkdCsci60qhmG+SZDyH08/FPzaIOcmGeKaqDF/re+oFYh2P5ds656bt7Fi85JhNQUhJvXX0YFhaFxhu2nGloji1n3ZM2Z2Wjm84T9nUxQE8fpF9bCOBvRF3nzLJmWlYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndwCOkCgNXQ4ChgdsdvrUPbuw1z9LUInAt3h2zu3sSk=;
 b=dGGQceieKAdZUF7sC10yv2WD4PrWQkicaE11apLE1dPv7vRiyOQN2AhI1GrDvVSf2QHjtgFDmV73eMi1jJ84Dm+fGSLqLq+asNQBb0aEonw7DKFbSLl/9PR6ESkB6xh4CL8lqXJ4h/ekPhfJWShQGB/nsdIAO1utUzCt5UTv4Uni+a/C8Wd6Lgj8RqvCt0LdpL0nEAerzLzl20Xdyzfmbx5HTQCZj8CS2BrhO2PH3jPIde0y3oJko7uSXDe5jwgquzzjXBB9gZxRY3nhRBGwALKaJfEg1bTMlvQcmJPvgKycL4Db0JtWGyTQ8XS6v3rsI2de+yoqltVSe+xUkaBcVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10976.eurprd04.prod.outlook.com (2603:10a6:800:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 15 Apr
 2025 18:53:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:53:09 +0000
Date: Tue, 15 Apr 2025 14:53:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
Message-ID: <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-5-f309f8d71499@gocontroll.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-initial_display-v5-5-f309f8d71499@gocontroll.com>
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10976:EE_
X-MS-Office365-Filtering-Correlation-Id: fea2cc33-d742-4ed6-4c01-08dd7c4ec372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?qLF2Q27yRrpYzSUKGH3Nf8iqdQnXE6rpBGRbCEAQr0iZmjrBJsiFFh4zJP?=
 =?iso-8859-1?Q?F5fVktEPe+1UKO2goaOY8O0Qt+nfoSmwoGiyyQAq2fIWsuH48zK5G1vdDf?=
 =?iso-8859-1?Q?nH0yt7Rjjc6two6X+WqLrtoND+6aPGo/ng3m2iwShsHl0EM7RBaX/gm1k0?=
 =?iso-8859-1?Q?rPJhauiiCzccvQXl0H1XPEfqjIBLpSs9zfkeDLhPrhagpd44b7rZDba9Jc?=
 =?iso-8859-1?Q?UCE3+dDvIzKnYd4RvKuFFFTGZvBjz/Zgq9oKSJHo1D2sGBDELwGsMAp7m1?=
 =?iso-8859-1?Q?7hpOJpywvGwvFFUTsmaVqwrXRzQFIFUnsrgjP2Rh+jUm8DCsh6MHAzV1f1?=
 =?iso-8859-1?Q?oWSPgFE8YNdXHbcc7fHkeHw7c2WE3gULYcVCyPcqkPGQLPzCV9I6ARO3vg?=
 =?iso-8859-1?Q?j8gO+JDg/DiJ7zejDkHVAMGyfZuwBid61lRfTzopA/F9caDxz5FVgpQcwq?=
 =?iso-8859-1?Q?eIyucORM4GJ++m5iOrsYRz1ruAF1QGpARelyoX1vF3KAedU/ZA4jLXTHfC?=
 =?iso-8859-1?Q?E4YJ9D0o19EzRfUzNwJC6P3MgIO2RbeJEyWq9SUJdQ2yMqS07G5bFnJFVC?=
 =?iso-8859-1?Q?5hNyyf8WdogbQHliZtz6DOW/hcjQioOsLg8Ed8MtW6hnaUaTfkpFDjakBW?=
 =?iso-8859-1?Q?54gqdSau9SlJnJLNM4XKPDmGxW/D5tkbAOq8OcyRmDnj2g/t4d1xUVaQzl?=
 =?iso-8859-1?Q?D8x4KzXpt05wZ+DElovu7bZ3zxEBdIMcUi9+5SoF+u8auhVPr6yHO3GHLo?=
 =?iso-8859-1?Q?CTtFxALw6nFzwP0Q9FF9e3e7GYS6eANwTycS7t/8AYcYx9zWgFlYkDS9+0?=
 =?iso-8859-1?Q?m6gmqoKFMwoKjheIfLHo966rvNedNLtpu2/3UrF+98aTMH9fMnQUi1odKE?=
 =?iso-8859-1?Q?SSaCxnlydcM0aLfUPNjXSzI3YlysEkK1/K+GDEtZlmD6gbTRvTZ27YpnLq?=
 =?iso-8859-1?Q?aDNvI007yDwo38I0tbRtUj15ZvZvxKtTPwNupxVUpd08RN1VXBSZ1nPH6J?=
 =?iso-8859-1?Q?Vq4OJ9bk0IebJk9lxIH0BdF/RRTIhtfpiipPTxJKc6wLFv1Y88qPoot52O?=
 =?iso-8859-1?Q?gj8Ca4ySGWF57XI/bQndVG/oS/saDV0BalCBlnMvHUfnRTJZgSrwbnoITA?=
 =?iso-8859-1?Q?y1XCvxWIOZaZFfBIAt1S/NTW2ZWGhz8VFHGp8GHneTIBtOLrOqeNmhNVKQ?=
 =?iso-8859-1?Q?t65hnqkQGjKsoHDZbbDvep3tcHJaqgB/Hf6PnVHb8OcuIELzhgboDdQUjv?=
 =?iso-8859-1?Q?YWQ7m7agRz6YBKFSSEbzTS+usOeLNJsZKsxF9ARlOqbB/T7KbMbd+OootA?=
 =?iso-8859-1?Q?dJ0mAKIJZs60XQHwzFzkAwJntcd7a8CtYnLX8Py0NCUuZllGeEH4C+gC8z?=
 =?iso-8859-1?Q?tqTkI06iEJIws6eQ0GYuykJosWSgl1H3Ow1IneL5h1+eqCh6SPXpp2SSrR?=
 =?iso-8859-1?Q?6CFAl9W99YXsDiXiRFYZLJ5115NK923a3vp9zsy+ymdEmvH71SEFica5c9?=
 =?iso-8859-1?Q?6J2E8rOmxSJXcKToXdL2pILMj1iqZZ/mHI7gDSiPUzQA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bgn+mLhg8Innv+BebH+tGp/qbgOr8kPYIKGO/R5CF6zjmlG06zLAN+WSRb?=
 =?iso-8859-1?Q?VkHWsSGzHAGTqBNjJpTs3Ug080jLapbSITdlnsjJ5rl5dC58crqALIJ8Ws?=
 =?iso-8859-1?Q?MQZekSUcZSt3dJPDEco1tZn4V/rVvcQ4fyd9F67kOeJEE/elSmwG7bsjIG?=
 =?iso-8859-1?Q?jgvJDAjAjSz3eA1/tmxIMxcCuipDhL+B9CLRuPDjkS44E7X3OShxJt14Pg?=
 =?iso-8859-1?Q?9QUpA6v/bWchwrlxkaZkH+PI82dmnXilFW+b7wi71hvksjUkODn/ss2oF9?=
 =?iso-8859-1?Q?vbjo2zOOoTaNMUkiByU6QKDrgSgO9Sa2szbmsxfDsrYfvlHPwgouHrdG5Q?=
 =?iso-8859-1?Q?RAqOY+bW5g/3IZ79oeU4XmXxHIzexYMAHcE1bKRD6lIhsQurshJIblYmMs?=
 =?iso-8859-1?Q?Fj7lgqwYgHlEjgRT/efJpFv4dO/kK0uY6K4EXBpgGpjP8NKHGyvCGjAbXv?=
 =?iso-8859-1?Q?T/22p1O5GK3ewnryr29bo4FZwWI+oIrjaCRKz11KvrLuI9O0N7s4M815QT?=
 =?iso-8859-1?Q?rYsxBj7h8k1RdgesyiQXh7yPPVgJSKkxtDaeN8IYjapYtiGghCE6fG3sYd?=
 =?iso-8859-1?Q?akpC9tl5UUxOBDto53EneI6YPhPHN3VO+eauEFBmTrdcNAEeSlnjGgGHp3?=
 =?iso-8859-1?Q?Sr3EAYZVFMn3AKqtbU0DQfxiSE9Td/6yYT5J3jt06/mP5U3kIntL1pQRu9?=
 =?iso-8859-1?Q?U9jRuwh4X4pC94Ynst7dx1O3TnOsJLH6Xwq93u/4PaGA0PyQ/EiubQ89mV?=
 =?iso-8859-1?Q?6DTZ4fSmK4oxREWxtViNWu3A1dq3oOMlbuPv85ut/3+9O/p9HolGkqPWWH?=
 =?iso-8859-1?Q?g/8rQ+PyFJC/WoVX/oSnfbzRkOd7PejBxB/x7ZuBZSROuKQq9YjotU1yk+?=
 =?iso-8859-1?Q?Ja6dXCLjQ4geGCbILUhJVFUbQORjs9/IvbIXm4km7u5WGIXabvJqfDYTtG?=
 =?iso-8859-1?Q?EUVwIvTCSQM0UUs9NANnVBdO4mTdqp6Ju5hh6OrbgH/8eZgvsLGeCqcQyo?=
 =?iso-8859-1?Q?6oZdhBJTO7DAyXBnsJ5RuhL4urtMx2ryDoRAIVSRhywka1F7SfWvjh77cP?=
 =?iso-8859-1?Q?72tn4ZDc11LKInL8lejIk7YT+g6lSM9jzLJS1VX2Gw+QpLNSj87J/e37Cd?=
 =?iso-8859-1?Q?CWrpWnfnTQz8Ty4Y/qNPQy9fr+4xvj8sN3f1ZHTlA7w8z7HLnKqG+njkEt?=
 =?iso-8859-1?Q?LacfXVqUNySGpKoDW5dz1ss2+OD3yaCzKrT3xBBmFbXLkGzg1n8Y1CVGkZ?=
 =?iso-8859-1?Q?JZfiJBsl4AZwGanpvA4xLjLcFn3kmQ28OZ0LolXy0Mb6+Ocuj9JUthhA7I?=
 =?iso-8859-1?Q?SDPVzQKy8SuD/kCBMoLCiHJDnd4cvXH3uZP698Z4/Q5posmCP1bZvUVKqx?=
 =?iso-8859-1?Q?/Asyxj7STg53TqXmPLrnuEF6kyIa9SJ0ZMBRpyXX8/Nj4tdhposVAY4MAu?=
 =?iso-8859-1?Q?98/Vpc79zDZ6TvuMPUPPx8x3Gpi/EzUMrihCkmBw/0ABsdPGCBIGg9ZASM?=
 =?iso-8859-1?Q?b4Nfjl0scjfc3f1LXO0h7FHILTIg9kr1/BJ0qsRndUvekoIKdlS4CGDsQm?=
 =?iso-8859-1?Q?wm1HFmrDo03U6EGV5Gw1ibxkcIlKOOwImYX3X0aOFHB7xopVrHHkfjs+ES?=
 =?iso-8859-1?Q?WgVZol4lCqq69KyXzt5rkYpNsGbOOGFmWE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea2cc33-d742-4ed6-4c01-08dd7c4ec372
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:53:09.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKk5iN8DiBhN0wU77+TBixilc1fLPiAQc93kzj9iCtBk8/ijbhcdiJ/6Iw7AXPVcAiKwf62C9NHcqOrvltpSVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10976

On Tue, Apr 15, 2025 at 08:54:28AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
> 2 GB or ram and 8 GB of eMMC storage on board.

"or" ram?  I think it should be "2GB ram"

Frank

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
> index 0000000000000000000000000000000000000000..4c9d010cfd40009a7cc0816a3043434b1ca2c982
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
> +	assigned-clock-rates = <266000000>, <100000000>, <50000000>;
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
> +					  "SODIMM_42",
> +					  "PMIC_WDOG_B SODIMM_153",
> +					  "PMIC_IRQ_B",
> +					  "SODIMM_154",
> +					  "SODIMM_155",
> +					  "SODIMM_156",
> +					  "SODIMM_157",
> +					  "SODIMM_158",
> +					  "SODIMM_159",
> +					  "SODIMM_161",
> +					  "SODIMM_162",
> +					  "SODIMM_34",
> +					  "SODIMM_36",
> +					  "SODIMM_27",
> +					  "SODIMM_28",
> +					  "ENET_MDC",
> +					  "ENET_MDIO",
> +					  "",
> +					  "ENET_XTAL1/CLKIN",
> +					  "ENET_TXD1",
> +					  "ENET_TXD0",
> +					  "ENET_TXEN",
> +					  "ENET_POWER",
> +					  "ENET_COL/CRS_DV",
> +					  "ENET_RXER",
> +					  "ENET_RXD0",
> +					  "ENET_RXD1",
> +					  "",
> +					  "",
> +					  "",
> +					  "";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "SODIMM_51",
> +					  "SODIMM_57",
> +					  "SODIMM_56",
> +					  "SODIMM_52",
> +					  "SODIMM_53",
> +					  "SODIMM_54",
> +					  "SODIMM_55",
> +					  "SODIMM_15",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "",
> +					  "",
> +					  "EMMC_DS",
> +					  "EMMC_DAT5",
> +					  "EMMC_DAT6",
> +					  "EMMC_DAT7",
> +					  "",
> +					  "",
> +					  "",
> +					  "",
> +					  "EMMC_DAT0",
> +					  "EMMC_DAT1",
> +					  "EMMC_DAT2",
> +					  "EMMC_DAT3",
> +					  "",
> +					  "EMMC_DAT4",
> +					  "",
> +					  "EMMC_CLK",
> +					  "EMMC_CMD",
> +					  "SODIMM_75",
> +					  "SODIMM_145",
> +					  "SODIMM_163",
> +					  "SODIMM_164",
> +					  "SODIMM_165",
> +					  "SODIMM_143",
> +					  "SODIMM_144",
> +					  "SODIMM_72",
> +					  "SODIMM_73",
> +					  "SODIMM_74",
> +					  "SODIMM_93",
> +					  "",
> +					  "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names = "SODIMM_98",
> +					  "SODIMM_99",
> +					  "SODIMM_100",
> +					  "SODIMM_101",
> +					  "SODIMM_45",
> +					  "SODIMM_43",
> +					  "SODIMM_105",
> +					  "SODIMM_106",
> +					  "SODIMM_107",
> +					  "SODIMM_108",
> +					  "SODIMM_104",
> +					  "SODIMM_103",
> +					  "SODIMM_115",
> +					  "SODIMM_114",
> +					  "SODIMM_113",
> +					  "SODIMM_112",
> +					  "SODIMM_109",
> +					  "SODIMM_110",
> +					  "SODIMM_95",
> +					  "SODIMM_96",
> +					  "SODIMM_97",
> +					  "ENET_nINT",
> +					  "ENET_nRST",
> +					  "SODIMM_84",
> +					  "SODIMM_87",
> +					  "SODIMM_86",
> +					  "SODIMM_85",
> +					  "SODIMM_83",
> +					  "",
> +					  "SODIMM_66",
> +					  "SODIMM_65",
> +					  "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "",
> +					  "",
> +					  "",
> +					  "SODIMM_76",
> +					  "SODIMM_81",
> +					  "SODIMM_146",
> +					  "SODIMM_48",
> +					  "SODIMM_46",
> +					  "SODIMM_47",
> +					  "SODIMM_44",
> +					  "SODIMM_49",
> +					  "",
> +					  "SODIMM_70",
> +					  "SODIMM_69",
> +					  "PMIC_SCL",
> +					  "PMIC_SDA",
> +					  "SODIMM_41",
> +					  "SODIMM_40",
> +					  "SODIMM_148",
> +					  "SODIMM_149",
> +					  "SODIMM_150",
> +					  "SODIMM_151",
> +					  "SODIMM_60",
> +					  "SODIMM_59",
> +					  "SODIMM_64",
> +					  "SODIMM_63",
> +					  "SODIMM_62",
> +					  "SODIMM_61",
> +					  "SODIMM_68",
> +					  "SODIMM_67",
> +					  "",
> +					  "";
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
