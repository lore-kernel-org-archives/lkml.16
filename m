Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86F2036F3;
	Thu, 10 Apr 2025 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298878; cv=fail; b=RZj1NK09M6g6XAWjr6fQNHOlxZfXVOBzJT4DDOzEUQkcCHDbkDc1zha+M1gIQ+t2Bvv2rbsTEx1UnF1Xyt1gTi0Ct8FylOgTM7vWEsso8ZkV1VVtEgzsb0V5cSZlxNLRNIZvulfCPFdGsmHPz0RghjexQbVjDY7c9c95dr6a5P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298878; c=relaxed/simple;
	bh=uiFhcG4B+Y/i0H7Uu+uA+H9zcQFeUdHaaAUYNFY8OJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mFT2cofypfX1sgVJPjJs31pl5COw3eoi2ehidyvxnDnnwk3dg00VxuYxGZ46geUyC+e7/95DfIF1pfOV1Tn1mnGDaChmL8lebgxVSS25beWMaQcnEz7TgQcsNo6TLz8Q59xk4pDh3hkZF5VSZcM+HRXOBNlegqIUWZ1w9ASTX+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gbkzcd/N; arc=fail smtp.client-ip=40.107.20.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gbkzcd/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/Wd8p7d8/Tz18Zm8y2s0m50perVL8MjWFHHDa0N8I5zHX09K0Kc2EBEigccmD6MGkl5/C0+zXmu0Iwk+Qkzf6iVgKZKeWVU3xesLSPclMIDip3LIhB7e3mJ04fSlRE2SGBJK+KOXAghVvXCFo7l7MtJCfEmGwfcOke8dbq/pkQA9POhlvILjqKPGXaAN6sDT8YawasUsvpp6LqlbVLTqPzEqWJQbB+NJg3iCgyH6oVaoRiCyfnuEOJOGXXzZz/yvk1zGunNHLp84b/6ct91+M7Di6zqFTj0o63OFwqMbyYgSMom0uhpLKg+HDQYdYlwK08kxaSeQkmZwMBqiqagcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClV1wHKP7g2fRMEyct9tOi/MJi2VRzLj8v61ch0CrMA=;
 b=dubHjuXMPA5odD/aXWxXhuAEeqJCQo+iEnnoDswJ8ZB0IKNDiXg2dnRSMxPFSIR1vlIXyWpZ8gGvljT96SMKdERXwXKII/+IzsyhzQgEvptbY97nicelWk0hIcaXznHYNw8CAyFaNOktiprZaQcqh4P4/XteIV4hrwD6J7/RLDJw0A92yCVSAzBitA2+5NUNyVSlQsNftBypGZHVhO0Px7OPc0dvyi/DdP9qHhUZj7UBshNIVvwKM9r9sUJpdi9gtRJBdT1zz1N/jwJjJiShZylKv8z4creZRB1tSfPyDAukAckMDaNhP6a6o2I0q7O3y7Fmwz9XPevbOmwL10rN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClV1wHKP7g2fRMEyct9tOi/MJi2VRzLj8v61ch0CrMA=;
 b=Gbkzcd/NiAgpQlxmoeJeu690bu0WEk+T/Ue2v2Lq9LIc9Y7iXNYQcRO2/I+ZHmqsVioYDyRlUlYY6X6FYZyMpij8mLMEDzVdqT67WRrweWLYtd9wMsU8/Lq41EVswggTM+970PGdymvLfZgrrTm6VUHnnjEqXVi15ShA9Uu4+o1tQztbUA/NOqIsMgDB9dvTUFT94e8UQaUQiqfcNIuYvSSzRG2T1FEV5YrE1lfp202Ld1hhIHsr0Qy/i3F31powifGXtDjDIxrEFuHBuirbUauZ3/aBo+qT0/iYIHFQG2Y05R24BuVJkLZITAIBhStqpG4XhIP0lHH59N1y4hf9Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 15:27:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:27:52 +0000
Date: Thu, 10 Apr 2025 11:27:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 12/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 I2S audio
Message-ID: <Z/fjcJghq5Rt+wdZ@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-13-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-13-primoz.fiser@norik.com>
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 212ec5a0-7cb9-42f3-87b8-08dd7844425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TLOVdAVPjTZ+pwJ7Dn6Ka7mom1Sd/v6985EL+0VszFGVaeGYCsyghqGFBasu?=
 =?us-ascii?Q?iyfZlM57qImp3Aozkt04clHrIqQ0+wDgAFGON4EttJXi6YHepdP5b9eO6M90?=
 =?us-ascii?Q?XJaWAldJERbEHK/CwErNbGCZAB0fVKgSlUjW8EDv6nEF0VM/DVtDfHPftGrO?=
 =?us-ascii?Q?MJsZMJu6uLdvV1x0UFXUbyA5cElzOU0ohGRDuIe1h1BeqV5e0gUogK/lUIpg?=
 =?us-ascii?Q?vlxq8hUIuSJLJ6k40MdM6Tvo+Q+mGNudEUEywC26ac5G6I7QL2kAg+9ak6l4?=
 =?us-ascii?Q?vIn3rpsXycUybXjPZctAWEhAjgGKxMaTn5dUaUvhTWf4hqzF8HApRILLMT29?=
 =?us-ascii?Q?bSIU2dfzrJz6uif1pA9Q8cASFHZj/GUJ2jSrImdLqTf9hgulmNzdcz1lm2gk?=
 =?us-ascii?Q?tqazXzyv4V0XjptNB7yqwz4qq77hH1QTHgTtZyOtXNAlqlCIGpTl5kEw5166?=
 =?us-ascii?Q?sQNeZExSONYjjYiyJRLDv0YU3srR/rQd67D2VEPolOFUNROazHAaWRxK/U+E?=
 =?us-ascii?Q?UNCSjOy54QNGaidx65fH99OYjbcMXrT1P9PZyYJeJKmM4LDKGMkhCldmJuPX?=
 =?us-ascii?Q?im2R5Bj0M0YJo1o2ZgQ4ENOPfpTgpb0DPsYbZ+Q3WdS0ijKu0iQc/dSY4Yyx?=
 =?us-ascii?Q?dOdZelbhGzDi/zWOmv2EBfBYDhBRIcMu6s8QJltrTP/aiiOn07VBliZSpip2?=
 =?us-ascii?Q?Nl2HWfixtfnweFR307ur9Lw2darcKqNwZ3WjCyJqrPZDSDyy5alGw73FOkOw?=
 =?us-ascii?Q?jfF5yCmHZoVt7+oGus2E3jDW+OQGLvcXPEml+1u2UwQwjfyhACHo6gOScvun?=
 =?us-ascii?Q?iYGaMlO6bEOzl9SH6xlxPkj77268tF5WGX0u0SRemw1C2zHbZiwKgZ8O4rwM?=
 =?us-ascii?Q?QCKYS9mdq4Lpv3ZEEwGF83TzBEbNUQ13j7FAMWT+kBFWfRFh3j/nA7CkJM5q?=
 =?us-ascii?Q?GipfyI5zTciBhJ3xFk2AYzsVeldAjJ5gpQEjoiKEno03F1xuHEKi+UGY72Px?=
 =?us-ascii?Q?XTOv/AXLUnpqeMSzAyUcbWOyt1DSyvu1lK77qreGtbN4ex5zFKvT9U6NfCu2?=
 =?us-ascii?Q?4Dz3iK8fbL8KdfOH06uoJgOrxAr2tyx4J1Mi8IaGGaZTP7LJOY9l+yX5I0r3?=
 =?us-ascii?Q?JzA0hQhFh2pnyVdDNCPQerVJEx1sEpEwbwY+6Sh09ytzqTcXw0n0XmHjXfRp?=
 =?us-ascii?Q?YrFt2rCW1GfAksTrhWsz771XH/KEmn9qhrMeFCrjjVZ4xlaSArVV3VAEtuiK?=
 =?us-ascii?Q?8JUFa1QOR7KK2LtL5c+knJbOBFaiCqR33mqbsXzkv9iIRCDtaiuKTfsCR9mV?=
 =?us-ascii?Q?/iEh4TztYSZZAqwVZhi0D/MqpQvlbGKchKYI0WQxmX2kB+7Y+YbSHLzNuJk/?=
 =?us-ascii?Q?0vs/FmupILcR7blKkKfbLtS/QNlbL6h9iQpeFieIRpc0UPvYizUTD2B6+oUL?=
 =?us-ascii?Q?kcYHNe/xDY3voSzF7P4YksPeH0+QTK2KsZFXfCyO60KLZ3HPZPRetg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QFXir5ht0A6EMx9Uh4kpDg+RXy2PcQCjqyuJwjkWWUNpA3q0O/t4SDZIkDvV?=
 =?us-ascii?Q?fIDOkuZg14O2Rbp4NZ1QOgCMdcLMw1AAa9L2INuTFKKOaZkhjGeC/On+A3MI?=
 =?us-ascii?Q?z5o+jOvSCnESqchHxt32WEDUtEIQPPbRE0qZHCA0p4IMEr6DUAyytYGdH0YU?=
 =?us-ascii?Q?wl2xxgp+3UQPG6GFQzsDnNycuw2kgvD3y1xT2pbwnQi02hwUV96yEYmE/GSs?=
 =?us-ascii?Q?3FeDSCskq7JLrhpW+ZCBy6iJE7ewPfd/WPPTwsgGZc2D2Ly6s3Zxy+aPq0BK?=
 =?us-ascii?Q?H+3Wk2l98NZ9TWeMQGAp/D4h7R4YHitjwvFiO0mI9qIF8XV1cWtbTKA6cF5w?=
 =?us-ascii?Q?9GQTNjo6iGh6jcSNR+4AV7oLtS/i+NQ3Fn5rEuDAItnwrwyOK8qTgEgJBEda?=
 =?us-ascii?Q?QSYHTyY9Am6nMiicoe4ZrWiZvZXUpcVy1cQcUlQXUCpekrB6cReiFg5oQ2y2?=
 =?us-ascii?Q?w7Uejsgcd9xibzFl8bT8lFNeSkwdf3g2dMSChW4HHTmkIr4qokgB/yMGSTQD?=
 =?us-ascii?Q?egHgm28GIzTS/JO6fvmrwVUmEFo32pbikUrGEI8ghZ25SDoUIGnoXMMqcI0V?=
 =?us-ascii?Q?E2TuCiW2kfE2JAK1j1CuE18uI7F/9M4oF/2+YOMtU4OKHA1t7Y3IYWMTKbGM?=
 =?us-ascii?Q?PAxjVUcSUQJszz8J3JXySxXge1WvlqBnEz8GCwfWs/jTNUoQQdk4JrGcyxSl?=
 =?us-ascii?Q?iEcPVwjkVYsMosYFa1JdtMxFF0oJExPcO7ooKtcvESnYVkvK5bgR1/nOtQui?=
 =?us-ascii?Q?1WtTh2FJ67lAT9g9W1furTcHtGE9Uov2T61uHNBHQBIBWNE/H1LBMsJ9bdJJ?=
 =?us-ascii?Q?hxfFTDQtbL3G99Mykx7tnqBs9djM3zWRX032dTo6Yks5yyuyjF7UjAe2ocC/?=
 =?us-ascii?Q?bWkovYXiOc9sHP6UdrwseTfzL7Xe1SeZXJAvAmQimVvkr9JC95oxmfSOZbM7?=
 =?us-ascii?Q?h8qpQq+Y1ReiR3ujIegCqCJu4fWWim254Q1dD8/5KG+Q1We3qkoetc6dPTmy?=
 =?us-ascii?Q?bLL/qCkCxKR2J8Y5D1DtngHvy50DGQHTWa3PJGdsCfXvlvJxLEbUzWCi8FSZ?=
 =?us-ascii?Q?Au5/urS1Lvc7lLsX30yzjNXLLuQaT2nMf3cZ+lNALOiuXWU0FI7i5wJb1fmI?=
 =?us-ascii?Q?NhZYuBN/Bn4F3NE5ZFNKu0ldG6EnBKQKXYHvJZfLX2ywRzJZIXeE4+Ke+Q7x?=
 =?us-ascii?Q?Q1WgVrkckfnRIltBi+eRkLt+VVATZ3cxtOq/3Qo5iNOjL7hdFwDTUL5fkspw?=
 =?us-ascii?Q?DJeCZXUX6+/c7pr+vnPZzZ47Wlu+0rw0VB6dSOaC4gLWuNI9LJhrSWl+KQyA?=
 =?us-ascii?Q?eDcqKyh9o72oz7F4VtWa5ltSO/KGJy2Y2XrAKeNBPK6i7mF3hb5s0tVCP+kh?=
 =?us-ascii?Q?EM8SIulj96Vke6feHuLc1Wj89rkpVULYhsNJWwjmsyQT1o5diXfeB6wTspWK?=
 =?us-ascii?Q?wvDmUmapFLZPK6t61TH6bQf/rI9y+imT4UKrx17PnyyN7YuZVzzhtXP6nf7Z?=
 =?us-ascii?Q?rE8msOxSpQ4kje9ur/MVbtKkopxOz36OgAu+tBz+naus/hFYk7ZFD1M6/YEH?=
 =?us-ascii?Q?UIEyVxe16zsUGi/VIWt6t0+gzm3QEeFpvZc0XPkN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212ec5a0-7cb9-42f3-87b8-08dd7844425d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:27:52.5010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oJmoA2gamAZBwqD/+jPkgth7FhzbDxIIYaQfhBF/tcXJHG5rwpAF6z1oB+bLZFKQT8TJtDXb+TcBPezGk03/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758

On Thu, Apr 10, 2025 at 11:02:50AM +0200, Primoz Fiser wrote:
> Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
> TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
> provided from the SAI's internal audio PLL (19.2 MHz).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../dts/freescale/imx93-phyboard-segin.dts    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index faad3c3e627c..08574b146400 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -37,6 +37,20 @@ reg_flexcan1_en: regulator-flexcan1-en {
>  		regulator-name = "CAN1_EN";
>  	};
>
> +	reg_sound_1v8: regulator-sound-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "VCC1V8_AUDIO";
> +	};
> +
> +	reg_sound_3v3: regulator-sound-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VCC3V3_ANALOG";
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		enable-active-high;
> @@ -47,6 +61,34 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		regulator-max-microvolt = <3300000>;
>  		regulator-name = "VCC_SD";
>  	};
> +
> +	sound: sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "phyBOARD-Segin-TLV320AIC3007";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&dailink_master>;
> +		simple-audio-card,frame-master = <&dailink_master>;
> +		simple-audio-card,widgets =
> +			"Line", "Line In",
> +			"Line", "Line Out",
> +			"Speaker", "Speaker";
> +		simple-audio-card,routing =
> +			"Line Out", "LLOUT",
> +			"Line Out", "RLOUT",
> +			"Speaker", "SPOP",
> +			"Speaker", "SPOM",
> +			"LINE1L", "Line In",
> +			"LINE1R", "Line In";
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&sai1>;
> +		};
> +
> +		dailink_master: simple-audio-card,codec {
> +			sound-dai = <&audio_codec>;
> +			clocks = <&clk IMX93_CLK_SAI1>;
> +		};
> +	};
>  };
>
>  /* CAN */
> @@ -64,6 +106,18 @@ &lpi2c2 {
>  	pinctrl-0 = <&pinctrl_lpi2c2>;
>  	status = "okay";
>
> +	/* Codec */
> +	audio_codec: audio-codec@18 {
> +		compatible = "ti,tlv320aic3007";
> +		reg = <0x18>;
> +		#sound-dai-cells = <0>;
> +

needn't empty line here.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +		AVDD-supply = <&reg_sound_3v3>;
> +		IOVDD-supply = <&reg_sound_3v3>;
> +		DRVDD-supply = <&reg_sound_3v3>;
> +		DVDD-supply = <&reg_sound_1v8>;
> +	};
> +
>  	/* RTC */
>  	i2c_rtc: rtc@68 {
>  		compatible = "microcrystal,rv4162";
> @@ -82,6 +136,17 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +/* Audio */
> +&sai1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <19200000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  /* USB  */
>  &usbotg1 {
>  	disable-over-current;
> @@ -150,6 +215,16 @@ MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
>  		>;
>  	};
>
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX93_PAD_UART2_RXD__SAI1_MCLK		0x1202
> +			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x1202
> +			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x1202
> +			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x1402
> +			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_cd: usdhc2cdgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> --
> 2.34.1
>
