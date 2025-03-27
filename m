Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80172F3B;
	Thu, 27 Mar 2025 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092321; cv=fail; b=hBORXXVkyyFniOdZOyPzdEguyEFbjZ7oKhWbEB4MT5zuaeg2toeXTXBqq1XuNFjUB6gDae8pmLASDVnU1ZiWNMhTS1CPRz66beHXxnwg6xEICu348UCDjcwKbpu+Y6P90mmGNmQG7yHF7/IZk0TVEMBkrmxm1POcsyXhqWHbq4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092321; c=relaxed/simple;
	bh=6RAqpKNTnftRSWzc1y9kRB5d8osdKjwQIw6MG/uT4Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VbBdF5t7NwS2AxUxJBT6AV+4FE+z0o89QtPv+8WPQZDVVmqXtjTdEri32CmxyjCl58jE2JqYUqxdfyuH7oxtHlTj0elF/YwoNF8qUb2VIGI6kV7k6/AMt4MWIOGKV2TJP/mNHSh9TiUQCJPNLhSgaOMkZw6jTnJSnq2kr30lSG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jdMnDeCY reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jdMnDeCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU/llVL3GAtGW23lXlCEUmmygdIMIQWYdTLlN/AixXB3WBNMOXZnjkz8Pv07egdpzdRhrLq+73+UHmGVHQ8MtXl8dbPC6gqN7carJbCA4RIttOtPegKeV8p+jhmnHHrnrwQ1MOeHxeYCz/OnXl5Q/yT6RPItS37jLLkP1eqLDzc4i4BB+wyvAONE7+0UXbcb5mPP1NHJb1nug1mNAWKOhYmEpc96U3pC//JORHgGQQzj6oEwOHtNwEN2Oqv3a+0QHf6s+1ea1dMXDdIssx25ZUUaUH2V2gJ4Kp6Khn6gcij2Rt9OlCdtI9JP1V1Tc5+pga9tI2v3oGuJlbza9GnbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrFSbFdqZEElrox7esfDitjp5uQABOwyLCrF8o+walw=;
 b=MrrIEDuVTB9gawXU0d2zuEuFF13fPsbd/sLA588hK11tA2z+lIm7hj8IdiiBz60u4wy67wiKkRbxvjKA9R4xraOsKLGo+fx5fpQ9ZMnsu2FVsI7miJAUXoZLVBzy4t+98DE/hfvog3PayO2q0wlJbLkrzEpFy4m/nE66FWIyM07MYEhsUArmhXp5lzWsSnrwlPmhgcXZER7s7/IqtGatiqHQAAdyKjbw1IQGg5iW3lngqz66Sd3ZED9AGUfLavAR5tLDeblPNu9y1c3+c0bccXAw4aTH6wLCp6q7YAv4rRiQOygSwBzG8AGr/xPIzzVwB3rOhApPGFIxqFj2UaqaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrFSbFdqZEElrox7esfDitjp5uQABOwyLCrF8o+walw=;
 b=jdMnDeCYJlYGshHMj9X2xuqD34Q3QH8GL0pI61ZSl57aP5fiI4iQVMY86ds4uoE2WPVZQPhJ6Qa1zZ+TAtHb8g1w+S9OVhg2brpP968WzFyqxS9DvfGoci7ceivu7zdEKozEIPIYBOymDR34oPW7VELm28fPOotq1R+WawRWq3Ud5D0Cnp9GJ9r0mWUTBCpInvhl0a9Ye7dF/K5OMAHUfR+5zwNVzv48Bm5p6aozS4SXEWkz/Z/Sx29YyLDEZE04oTJMS5dgA3W3ERTu54XVS/dg34hahtqx30Zhbt1hyYxYK4Dphsl4VXWZ4tN7aD6eDLyBvnrhwWI9SgDzL8TOkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7054.eurprd04.prod.outlook.com (2603:10a6:800:12d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:18:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 16:18:35 +0000
Date: Thu, 27 Mar 2025 12:18:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Message-ID: <Z+V6VAZLqIPuEsmk@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-5-4e89ea1676ab@gocontroll.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327-initial_display-v3-5-4e89ea1676ab@gocontroll.com>
X-ClientProxiedBy: PH7P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: fa58a790-e7d7-4e39-44a2-08dd6d4b0669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?oYhKxSNPGE9DYFVB6R0EUZO8vaz5+MURCtm/CiH+1I0E2NbW3EitPrsZqI?=
 =?iso-8859-1?Q?ruYfovGabkWMrVfbQF/VXlxVhQ5WF1HurmLKgrrbR4GF243h3BSkLX9Ex/?=
 =?iso-8859-1?Q?hxohQLjxzWF6VtrpAHX5SJH0DGGLa4esxRtDu2G/mxnyIZo7/U0DLDlQd2?=
 =?iso-8859-1?Q?zoEm5eDxGYGUlIpnze1JXm06JEMaaTd7CZxTfzjzGUMblHrn55STncy2R8?=
 =?iso-8859-1?Q?jkHdFAOdZZahWh7nHWZNwJ3o5lkDK5mPIGh7aK7pIcmDOiCp0hQBl8ze0r?=
 =?iso-8859-1?Q?S2RuRUKTJQnIirl/7IKyO1b85RlG/UhY8dM84dssIWJTQ6szUPeF4LOakp?=
 =?iso-8859-1?Q?Y6+3+1iuyEoB3NXC401bW6nrMrK5xzNasD7tJweKN8SS0q4OMEvuxuRqno?=
 =?iso-8859-1?Q?w30u2skVDXuMVgw7BawjnrDm8l71DUdHomO+h0waUJ7TaNM0tfxNtkRSuR?=
 =?iso-8859-1?Q?13pSExcQeE9tCPil1JHOOYJQM4wOw9U2OJ/OfVq0wjYfhZpJwzQlZ0iMbw?=
 =?iso-8859-1?Q?HLEJakYMssPsnPG9vfoxxN8NA4jiFOoR+kQBeVne1yUNm/RSrGx75rLR3P?=
 =?iso-8859-1?Q?7EzkQnSdVf4NR9MjbTNeGK0I1EyuKfDvqDa+VwfWORLPaX6RpO/hv3eI6u?=
 =?iso-8859-1?Q?Oiy5gkpNyseq8zZwmPY8EZ6i0+cCntsdSqsOT6i728KDJBjOUcgAu8lvWr?=
 =?iso-8859-1?Q?IDC16ioktySwSUEkOh+fy6zlz3Qaw9k+TnqfLJ/efVB+/28Cula3lJXGWw?=
 =?iso-8859-1?Q?4TYhzsVNdWQOQTjfe8th/E98bqBWZCbihbblSRR1tP605uTCaky+8nfcLI?=
 =?iso-8859-1?Q?hkQyDVvgbBVb0GUVdqT9JVdg0PfFuSHwtaNWaewQNLlIJJmTi8lFKR3jlg?=
 =?iso-8859-1?Q?TuPSJ7GraVxBiKaa4ZdpvT6lfHCIZNKg2MkQ0oRN0kbQspjnxz560NkuqW?=
 =?iso-8859-1?Q?zmywQ1K5QKkvUaRsN8tBIN31mxIm6NWC6kZxj6Rob7mLOjTKeOnuWBMKSL?=
 =?iso-8859-1?Q?lju+TsY8pe99MjwDGUqcSi6C7XAJe1jIkbU7pF0bTINMShQR2nEPfZd2VN?=
 =?iso-8859-1?Q?3GKiwda1KwkUV44I2nLa7a2pHl3v2zmsqUckFqqZGipeAIiOuC4E7h9T2e?=
 =?iso-8859-1?Q?aZhNRW7iElrZIMtRW5hLhmGaMuDSxgVoTem+zqeJBtN2aZdQd3tTrqfTXj?=
 =?iso-8859-1?Q?5WVqjpT27YcdqRcwsk/pi4kbo7zZ+M0jedUglTGPvZylaSa4TKC2aJncet?=
 =?iso-8859-1?Q?hqIJeFqLBMLBmGYq4bW0Ps/qHXLx45ua66DnGrvBC3Yatu6LpLk3zXaqEj?=
 =?iso-8859-1?Q?ukBxFAwRNWD7oIzA6ELnHm7UKRPIGGMTje/mIHizZyEMbhtHgCnhRmTdhO?=
 =?iso-8859-1?Q?bZCPbarZszyJkoV25KqD6TCeBbTYVudRptCncit1OAvWG30TdmDijCSVes?=
 =?iso-8859-1?Q?GLpMggjHqMPcd9E9wthox9z8RYMGuDkcxwb7kbXgLSlIgMkDij/DuBQYP/?=
 =?iso-8859-1?Q?zv0sfUeZIc2OlMFHpzUztf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?dQSA1OB866JqGuFkP4fbZwdJQiMip9M6saUTKYcJngXLPsVuuB5iPTl8EY?=
 =?iso-8859-1?Q?uHzXM3i0jPUnunSWt9zScS78OP6lfgEoSp4XD4s5405KJFUWM6zAu0ChsK?=
 =?iso-8859-1?Q?kYmzcUdyGqIsuNGiMfKxzkt8cPUp5Znd8edO6moaB/tj0KvgXqxI82wrzj?=
 =?iso-8859-1?Q?R3//dLA5u71O2V2KeQTIULjcsTXqP0OvzRpmObIgc51cF81SCUWUlPfZGV?=
 =?iso-8859-1?Q?A0CcUYmyRhokwKKaPA8ts7jMG/Wke/5IVMpLxGl4gDUwl/vVndjL7+gECi?=
 =?iso-8859-1?Q?5GOVV+w7e/s1xF/XncfjC4WA/zgGOu5apLCv00fpJXSIu9O8ac5Z5hbk5B?=
 =?iso-8859-1?Q?1Un8u5BKpbq3CbXxkIdH0C3tlPmSFAGkKQWWx5zsZegR2sCpCpRBNHPmvW?=
 =?iso-8859-1?Q?5SZorpzKxN9jhW14iHqyS+kwb/W9IVT9H9PnxQyRhwwZ5EtmC/iJ+a6GsD?=
 =?iso-8859-1?Q?GzeVwisbG50UrRGG1i1XiBjs3jPhoIYe4+mbbOsoX2/5KW8SiuYyLP+o80?=
 =?iso-8859-1?Q?w2oQISzVwnEFYpKUmW6xBsDo6t2Ke8g4DAogkoryGDmeqhRJTScKW7YofU?=
 =?iso-8859-1?Q?vvIQNjld5yqBs56X63ukQKwiyiMG2HRREY0IfbKNuJGRVXUzi5zr/XmGT1?=
 =?iso-8859-1?Q?/rDoNkDdCEp5L+YFH2kHO09UbONivIW1jHmeo+ivSrIhlASKnEGjzkBvkl?=
 =?iso-8859-1?Q?3Ietk5Lh8GkMg9I725nNjzNjspkkKcC7vMzUtvFO4y1YnO4ECfFcbVq/I8?=
 =?iso-8859-1?Q?CGpgpjKQ0OLuGqcAaOJfXL0i9cSlkaCcmwtdMofvbJqW3DDJ1gScs7CwQd?=
 =?iso-8859-1?Q?jRfBknHXF/HXy1fYNF6PEvDQCJ32Ub2jEp6rw/t23vy+aR2UHUNk37UMjG?=
 =?iso-8859-1?Q?txuni6wfsB6DHUpaXSwwYvfJgKhYnEpCw7+pkGcmXfU4DGBed24elY7Fz+?=
 =?iso-8859-1?Q?bmw39nGDwzBG1hEZjmDupphdh0wyCKt8v08UVnXFU+/LVIBaIC9PDZgzQu?=
 =?iso-8859-1?Q?tb2qdvN5pcmlqPj5VMIBd/cVggpTdUz8OTeqIX3G7t+r6jPuK2ckrnOhpZ?=
 =?iso-8859-1?Q?imeec5ey+6ptrsnKjsWl3uy78wx5Sh0/ErAcghCZO8YJUpxngWaEQO3lIf?=
 =?iso-8859-1?Q?EwGfaPrejkGVb125rf0Mz2g27/IyO814mCr4xCXrd6oeNuG+iFEtKMiOJu?=
 =?iso-8859-1?Q?56x+EVkAnalH1h+SflVnjGG6RGjZ38VHvVVfZRmI9HpLc3FTo782U+aEXI?=
 =?iso-8859-1?Q?nbElXxqsG3kJXPULRhuI1jZIEDu2I7pbZQ1hfgOJiwMu+KjcTztg+jiTUv?=
 =?iso-8859-1?Q?0/aIp3cxzumdngY5BwrG/1PY35VTxMTay3sHOcgpfMWRbfowjhcx9DUHK1?=
 =?iso-8859-1?Q?WX7dNkkRFW3rby9/7zbuvqS9nwoauURs5tJxvIaSvYjBHLCk8cmlfHlP9d?=
 =?iso-8859-1?Q?HXMjxfPnDqIY5HEJhs92Skv4o1XP6NLoRmFPtRqPtnrp4hQwfdkjq5KdSG?=
 =?iso-8859-1?Q?TR8U2jGH8jZ93jqH8apTFZn5Z284gUnlFGM7CsMusWmXhnvPxuCVAYYYSS?=
 =?iso-8859-1?Q?FwBrznfW8knThrFusWk0eeVXNaRKLrBztbqzHc0T8/4EtebwiYClrPEFKp?=
 =?iso-8859-1?Q?mZ8YMWfXrmO2vcpSjLzM1skJ2dNi9TCf6O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa58a790-e7d7-4e39-44a2-08dd6d4b0669
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:18:35.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJJU7v717Py4Y/d4qomuKszXwJhY34+uR/O9dsyEHYyN77u4ubZTD17edjBFJi0/l0W2x0Ul82VCrL+xuEDDWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7054

On Thu, Mar 27, 2025 at 04:52:40PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
> 2 GB or ram and 8 GB of eMMC storage on board.
>
> Add it to enable boards based on this Module
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 549 +++++++++++++++++++++
>  1 file changed, 549 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..9c4304e909b96afeb62962198da377319eda8506
> --- /dev/null

New dts files, suggest run https://github.com/lznuaa/dt-format to make
nodes and property ordered.

> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> @@ -0,0 +1,549 @@
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
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
> +		regulator-name = "3v3-etn";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_vdd_3v3>;
> +		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +		regulator-boot-on;
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
> +
> +&eqos {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	assigned-clocks = <&clk IMX8MP_CLK_ENET_AXI>,
> +			  <&clk IMX8MP_CLK_ENET_QOS_TIMER>,
> +			  <&clk IMX8MP_CLK_ENET_QOS>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
> +				 <&clk IMX8MP_SYS_PLL2_100M>,
> +				 <&clk IMX8MP_SYS_PLL2_50M>;
> +	assigned-clock-rates = <0>, <100000000>, <50000000>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";

"compatible" should be first property.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ethphy_rst_b>;
> +		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <25000>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_ethphy_int_b>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
> +			smsc,disable-energy-detect;
> +		};
> +	};
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "SODIMM_152",
> +		"SODIMM_42",
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
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	clock-frequency = <400000>;
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		reg = <0x25>;
> +		compatible = "nxp,pca9450c";

Compatible is first,  reg is second.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +
> +		regulators {
> +			reg_vdd_soc: BUCK1 {
> +				regulator-name = "vdd-soc";
> +				regulator-min-microvolt = <805000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			reg_vdd_arm: BUCK2 {
> +				regulator-name = "vdd-core";
> +				regulator-min-microvolt = <805000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +				nxp,dvs-run-voltage = <950000>;
> +				nxp,dvs-standby-voltage = <850000>;
> +			};
> +
> +			reg_vdd_3v3: BUCK4 {
> +				regulator-name = "3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			reg_nvcc_nand: BUCK5 {
> +				regulator-name = "nvcc-nand";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			reg_nvcc_dram: BUCK6 {
> +				regulator-name = "nvcc-dram";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			reg_snvs_1v8: LDO1 {
> +				regulator-name = "snvs-1v8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo2_reg: LDO2 {
> +				regulator-name = "LDO2";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1150000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vdda_1v8: LDO3 {
> +				regulator-name = "vdda-1v8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4_reg: LDO4 {
> +				regulator-name = "LDO4";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +
> +			ldo5_reg: LDO5 {
> +				regulator-name = "LDO5";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&usdhc3 { /* eMMC */
> +	max-frequency = <200000000>;
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
> +	assigned-clock-rates = <200000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	bus-width = <8>;
> +	vmmc-supply = <&reg_vdd_3v3>;
> +	vqmmc-supply = <&reg_nvcc_nand>;
> +	voltage-ranges = <3300 3300>;
> +	non-removable;
> +	status = "okay";
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
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
> +			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
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
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)


It is much better than hex value

The most are the same.  Can you define helper macro to reduce copy long OR

for example

#define USDHC_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)

so pinctrl_usdhc3_100mhz
		fsl,pins = <... (MX8MP_DSE_X2 | USDHC_DEFAULT);

usdhc3-200mhzgrp
		fsl,pins = <... (MX8MP_DSE_X6 | USDHC_DEFAULT);

Frank

> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
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
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
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
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +};
>
> --
> 2.49.0
>
>
