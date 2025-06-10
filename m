Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012008.outbound.protection.outlook.com [52.101.71.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E50248195;
	Tue, 10 Jun 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568721; cv=fail; b=WHhHuFyEC1j2+tarXIxq52Z9GHMMeG6sceEU90Y6nStbTZlm2tm9FHSAnVTemuiEmaG2ol/YADBvhnj15/jeO4NY1n7ozsZTdFvdybDwPeSDlSy5itSgDfUnZNzNS5DR3MHUwt4B+zQfWFmt0ts1gWR9PD/2DCT2IRD4ZOTR584=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568721; c=relaxed/simple;
	bh=Z4gBH4jDC97ZK3tF/jx4bLw/RptZSpgYDpwASeRoI04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F6lsi5VbOM+JHngxIYH4A7OMrdT5BhMBPzU5WFhCBesAT2nSODNrXeDThxYZfiwjoMap0GKO+7EVh4Zj08Wkb5GZWSUp+N8Hdoywob85JBH3RQ+BUFVjcngJFAOr7aZK8lxgxrh7DYzhG3+aNDhLTx4a7xnc3eBt+fVAu3/w0BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bDdh916P; arc=fail smtp.client-ip=52.101.71.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bDdh916P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJxKm8lgPi2bVveZ3Sbs6HUJr11Vm6FV3I4q7Jj0/MY80bVdcAegflKrwcmmZIJDDfLxNvFh+EhD0ic286oUjwUYDfcUtt69QAPZ/ikl+cXNC57uBwUV1ZypLH/uMQiUTN1mOWL8X8piWAL+SQZ1ryP4vMPSjxxSoD5J320bFS/4bT65xsA1yPrS4NJnmqbJWlPcIdIry4GMzYI1C6LNEVj+x7KpjZOxspg+A3Hafbs1wOXkrzWG2ifQe3tOaERAIKzt2YFm2NNPdi+2m01Pjy3kjc/DkKROEJccKg/b5JWfbqZ6miTItCuqjmW+6qEEC3v7972mrU1INdbNtOKvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XB8fJJNVmKMWBJRPiN1W1ag3zItj73WusxHoEX005U=;
 b=S/wqWrWrT2MGp41hEPorP+qk8RAm/KroEowx0FCmCeMXYaOT3OjjTkypCi2NQSFT5XoiXSCOzaFdETfS76wEyFSWMkacYeorxT1PxLV8KpgR7TzPqMeK4zDLVt2KAN08FwDnvAK1m6fqwqAyiRYlkoIIL1GRwrBVg3fJybRjFF4iCXHyimk17Y0YVinXFOsC9Vux5Xl41uZNnY00wVLOuZtZbMZmGZRfRl8iAhyUxvToQlu0AH0DfW7QoB5MfMDv6ISC7upY5HKck/bS6LWGmjCNIkkHBhgR1u1ovZqc6syABH+HYJFq100wmuZwtVJj1dSDc1tUjBTqPfpTl1ZcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XB8fJJNVmKMWBJRPiN1W1ag3zItj73WusxHoEX005U=;
 b=bDdh916PexmUg46b9HAabYM44Hjxm61jGb3Tr+9MUx5GKEZ7aVdwArg7J4KRbuS2MoFgigZL/oFkOszWKHSXVSMRWIR2jx0sN+W7qbCye/imXca+bnO8VZTK7In9K/aLUZ2J8rDo7KARK1vtwPEzvJyZe1+542MAkVugy4AwJVa/bX+hFY1TH9mqVV8uJDS+QzAZi0aQCeIKYO2wKp8a+IhBhU7ROitjKtOWqVkLvtXKaVy8tr7ASC+sAXXUcAnZ6nb8UJ4WNpu3NM4/S9f/9eutWty4qD00eByExpT1mcAFMEDrNy6GqQmSLkjD89E1tGeF4LfMG8GLrCAR+ojEBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Tue, 10 Jun
 2025 15:18:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:18:36 +0000
Date: Tue, 10 Jun 2025 11:18:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 02/10] ARM: dts: imx6ul: support Engicam
 MicroGEA-MX6UL SoM
Message-ID: <aEhMw7GtgvM1wq+w@lizhi-Precision-Tower-5810>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
 <20250610100139.2476555-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610100139.2476555-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BY5PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:a03:167::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 48815738-1d97-4715-ad03-08dda83211f0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dlBqlNYCE5/4W+WdxDXiuOf3TnszH05to1OLDMNTJd4PnpZY+OHlC8dC9idK?=
 =?us-ascii?Q?1NXw18TxvYjqCLHvRX32O2FtL3L/FY+b66aXVG3pM2ztCRtDHOYm7h/q9QmZ?=
 =?us-ascii?Q?fK5Iy/U9n3wF6dSbqaG/vdvcOAncILrW1vgcOcMRlDLOBVClcMEr0LeFbhOj?=
 =?us-ascii?Q?cT2jcbuNetXuxhXaUKfOup8DlH7vNijlD5+FSE8eJgLq0yL9k3nvVa+oClhV?=
 =?us-ascii?Q?Qx/7OkUqJIDRAv6I+4v+6tOckcN7TYi2ofFsORe5sSm5hgwwLoAUly2kMNhR?=
 =?us-ascii?Q?bcvmAEx/5FdquFhyutstEQ4WMUnDdX/Rw5sAM8bSWcb4A8TKcAbo2Idi1WTa?=
 =?us-ascii?Q?hSwCiIPHHFwDhemI2IXF/lF3bo7kMqIbOWr5cBcJzYAfr/9z5immzCZ8ixq5?=
 =?us-ascii?Q?wYEr7k78i9WAXBGbezhAVoPzIVNMf016vOITaUogrNf17JL62lBUtpC32pQo?=
 =?us-ascii?Q?K8nsm6w8UiYrM6xczpokZa6Cqv2ojXifsXFE1JuZWcfCIyBSSkUZCplKxMA2?=
 =?us-ascii?Q?9GIhr8QEDjcYgW8ihZtt/Rw+FVfdQpsQwIUZhBQXrzLRu0L33WGlA/VOFdrv?=
 =?us-ascii?Q?0aKNV4A+bHO2M/Rx7UxK1u2xcLs0E+srr6IUo+nJA0fCPPjZB6skADTBxz7s?=
 =?us-ascii?Q?kGwtWzyXnuDgt1hYCNVNW6/0pYO7Tl7kpliOTRCiYeDzkTO+hEolFqAZkR7R?=
 =?us-ascii?Q?xi6sijcgynes2dH3qR3onP041GYx8mu8MA/nCF5dFGjWKtmQ/mlTGA3JvBv5?=
 =?us-ascii?Q?mfY5UK3OHgBmf9BKNt48o4tw+LbyuGjxdG7i6NU25sasOS5t/rEZBFzqgzEm?=
 =?us-ascii?Q?sQOr8Fsd+k1cGs/HFYypx4ioszC3k1/OCf9IEB6eQf9t17S6kBYETZzWLNbl?=
 =?us-ascii?Q?asIu9gEO7rC5OKx5bSoKdM4M2FnDl5F8SON1bH2lt1Mo/Sft6AjlepwPXHi4?=
 =?us-ascii?Q?9NWn7AZpOwh9scSuoSV0R/Nj8aNAiU05yK8TCN8A+erGkxN+FT6E/mNWLyeY?=
 =?us-ascii?Q?IfWR5McIvmryTtdzUrhr5lcJJ2qcHprREIWtyKVi46dC7xMpiQMCXchIPjOA?=
 =?us-ascii?Q?DJijZJgVN5mvj7FF+dG+E0xSwBWhOhBbzL6yivPoFXeGys+Ww5wWGfyvP6rL?=
 =?us-ascii?Q?nDKiBXIhQ232D3JpeOObIiAerPWcdTMQHmT6nz9BTmvdcVP00ORUnp/76rUh?=
 =?us-ascii?Q?BdS+tpQTiRbsUBUMMSZmqLgnEGgK7KApM8VmpagJmuH0RI/Oj8baz/4+pMTs?=
 =?us-ascii?Q?c+WkbnGSOcIMecs8T4FSizDoDJp75Q8sdYeVf8sHPcg+sYGPSy/bux29mJgR?=
 =?us-ascii?Q?ScIscjMDocNaXD05OeRQzEzMhbfQh5q/t9BQYVBvYzSYlsaA3uGc4XB7GyQh?=
 =?us-ascii?Q?dz5ZWp58wsHitNpbKIE1idOfV+JTb5FLCwRQvm6LEr6FCyn77+iuHSTI11Tl?=
 =?us-ascii?Q?Sncn50KxJWZcTAqHvXZjGX3ty5FCHhQ/Gc9gOiAE2irOwBY3UDHD0w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2V3mfAHMd+Qtt18M1t8EKQ6/Wam08gY31SP6WUYOyBY1+lmK6zy3r5pHUoIy?=
 =?us-ascii?Q?MpVZyjFzWjog5K081VllckbRvooCYkhrcygKPFdp4mOWXmAO+XJCayFxtyr8?=
 =?us-ascii?Q?jIQU8l9woomXD2V2uDtCDvWD36fHSjLi+t4mSaoAPH1VnXHnUTaeFte4Ub1A?=
 =?us-ascii?Q?jTDcx2MPB29xHMf41QdqkkpWPqO6+JO/zJm0AnbgWEBvp9H3Xb/ED6ZP0CiK?=
 =?us-ascii?Q?1BWe214amcCFi6hHg5pEra3nLIqjS9UjZ7g8put3naFw4JFxR9X+xNNGz2wC?=
 =?us-ascii?Q?JJUsR/Nz8KsMJCDapBFXDiMofJ6YLwOb6hO9C+4s+ccVniwruw66194X9bSC?=
 =?us-ascii?Q?zOeTwptC2AOXRVEz0CSGS0ZckxvWuA2h27ctH0FQVw25fXyZDftGf+zYolCy?=
 =?us-ascii?Q?mWmhee2LEKcXijGA/9Mr9QOWWq+lgDjBXeCFAsSr2lFhrbXUg/9hYb27z012?=
 =?us-ascii?Q?t7nGbORrbkM++4GSGsgNldFH/PqcePJdP5zu+F7z9zcx1zDx0+ucyu8fH6PF?=
 =?us-ascii?Q?4kAKJO18tD5nIACues0VJihda0lj0j4+dovFegw8/SK5VzFaV9jyidH4/vM9?=
 =?us-ascii?Q?ay2Za1peKYn/TlPisYbORkJia0As635bm1GQOcMcjGRlsVGtElHrFMRTQCww?=
 =?us-ascii?Q?EYQYF6bIYv2EylIqZvKjJaZvol+tqyGvmbmQqqKWIsWnm0GYgplRhdsXrW2r?=
 =?us-ascii?Q?hhzXo8fYW9GbADwf3a/fhNc4s+oNa+l84zeYbf5afIdq1mpkrz8C4aAIoBu+?=
 =?us-ascii?Q?Rha7cr/lSvLtCj26J28izqxOPKdTlMb7x6Ndlx4Dydh5ouBQofwkwrjkXhWZ?=
 =?us-ascii?Q?WwHg9/KSZ2cmuijl96IbSpd+QIStouEo2gjr1uWR8HVLNinDMcRxqPw6jxhP?=
 =?us-ascii?Q?G4dosBjPjZtTU+mzg/RhBG9+IBKDX/ipK/1YA6CwFLgEmmRMx+K1zSbpPd26?=
 =?us-ascii?Q?i//+/DSF03FYdS9pcRy/5QKHN5utG/MDEgfHGFrpuMGyhT6uKgIAOfqFB5MU?=
 =?us-ascii?Q?2KYTNHKOkX4ZK48+XjVBk0j43h1nd9MZqjZRQjPGhk2F5EgjnJ71ZpTJ6rH0?=
 =?us-ascii?Q?MbwVPihJoIPjeUqBoKzF90sCMvZrux9OYSPrrDFmNDHyMJyg1yqYaqOxlPOp?=
 =?us-ascii?Q?vp1BZyiKUiS5XkhxgBdEIzWJ91wkpHZsnjA24xeuvQ+5QPQQj0P3c7GwlhsK?=
 =?us-ascii?Q?BPYyAstwVoln5sXoy/84yXMRwf3LSoUsVgdSuGKRoKFcLrG9FfIw+KgkrDXG?=
 =?us-ascii?Q?zcVUcU5gZACdkHAL9EoEahVS12QT7tK3VFFB1FNDSRYY98O9YWwH4bTdufV3?=
 =?us-ascii?Q?49ZTFXMHpayl/XcuJBBiv6Bmgfh0BEudcr2dPO9dQnjP5leMIaclvFZX/nkj?=
 =?us-ascii?Q?fn0/DCY9/48cgHKBZ/r3pKvYDytK7an3IRhhFvbzoVYLsTlMOcpaN8QThA/N?=
 =?us-ascii?Q?DCazBZx1otbF0cVjYEoERkYudMEzzMlV/+1fkWbY3SBLOK35pBBoOnZsLo8R?=
 =?us-ascii?Q?wsrM/XVRHW7RGoGHuQiA4jkX5BBLik2gaK6TndI0678do1i7uunnZ/0Gqlr4?=
 =?us-ascii?Q?8/R6uUJerwt55abTfh9/Jo6NJvci0JTzFmqacxC5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48815738-1d97-4715-ad03-08dda83211f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:18:36.1154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZdiK7NThzS2PO3IuB+j5jYZoTTGflOi1j3w7tCLtio3TowdX/GrbIKBs1XjWidhCGnMr9Zwy7i4rPzS/I9MaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452

On Tue, Jun 10, 2025 at 12:00:15PM +0200, Dario Binacchi wrote:
> Support Engicam MicroGEA-MX6UL SoM with:
>
>  - 256 Mbytes NAND Flash
>  - 512 Mbytes DRAM DDR2
>  - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
>
> Changes in v3:
> - Drop an extra blank line from the iomuxc node.
>
> Changes in v2:
> - Change local-mac-address to 00 00 00 00 00 00. The actual value will
>   be set by the bootloader. The previous one was assigned to Freescale
>   Semiconductor.
>
>  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> new file mode 100644
> index 000000000000..43518bf07602
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + * Copyright (C) 2025 Engicam srl
> + */
> +
> +/dts-v1/;
> +
> + #include "imx6ull.dtsi"
> +
> +/ {
> +	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy0>;
> +	local-mac-address = [00 00 00 00 00 00];
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <4000>;
> +			reset-deassert-us = <4000>;
> +		};
> +	};
> +};
> +
> +/* NAND */
> +&gpmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-ecc-mode = "hw";
> +	nand-ecc-strength = <0>;
> +	nand-ecc-step-size = <0>;
> +	nand-on-flash-bbt;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_enet1: enet1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
> +			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> +			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_gpmi_nand: gpminandgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
> +			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
> +			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
> +			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
> +			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
> +			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
> +			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
> +			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
> +			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
> +			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
> +			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
> +			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
> +			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
> +			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
> +			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
> +		>;
> +	};
> +};
> +
> +&iomuxc_snvs {
> +	pinctrl_phy_reset: phy-resetgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
> +		>;
> +	};
> +};
> --
> 2.43.0
>
