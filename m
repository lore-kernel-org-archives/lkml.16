Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763E2AEE9;
	Mon, 19 May 2025 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680897; cv=fail; b=NEyssix5zuB1ebHh8MUHk4Fc0RYqRucm9Y3JR60TTunfvXexZjpaG9jzzjpv/46v1M3ptmAK34Hb99WlwqhdsJlrPesfkjlN5nTrC2BKgE0jnlJT/mpKwowhTAfIegAvoXZgKi+X7RHeVYv0Svgh/4ekSBgTzmGuTeG68K1GJ3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680897; c=relaxed/simple;
	bh=yO03IkfUbW3vKMjgbUGgdp907xnzeXsHZl1Q20Z+NnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NlZ4ozlOD+/AoPL+Ii3iFFNbFNR/ZKA1YrgOgN0p5ShNkTboFjxjwxUuEZZQ1em3oP/4yYELR7pf1mi6T8VYx2y24sJRAi8OCT53Z3U4C1EvnCMh1ZsKkMBbGZf+0qYJAgC9+7cuwriks46uvAC9sX9yRhcj/KjWtYtRgei33AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nQxI4kWc; arc=fail smtp.client-ip=40.107.20.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nQxI4kWc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHNBUAyELliKvpNBc4swNEb6609BFgluTMutJqb4u26Qd5Yri1E4k9RCZFWPoecT07tU3JUbZB9tTAOBV2XTPMJc46GXy9jN/es1WcQNRFS39LZuZpTqGuqHEZ4CLum1ck2hwgtv+YCbgX3hPeHwRj5wZQn+cTmw0iAcHN4mb3qj0dBVWSYMscbuNekJ7kVAjOZPj/MMLCeYVXTceXy5HuRizb8w0xzCZSexWGhJ2hKAP2jhKttd9aD7P1S0AHIyhYw2kB8v5ATTQSbMkxpHtbRWxJadX51JlBfkKhn+oZphVSfAUGnQHShljQ9Dt1cUmeM+yZEubSUYI8hrTBJjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdnbzqsD8YGG1giBGVGtIz3FOxq8PdBxwbSIDrWMZeE=;
 b=ATERsz3p27+/qfho1COJrgdzDXEKE70AjwARlIA8f5HOP4DEekjjWKoiS5ULwHlkQcN2AQ/uDgScPNIIBNAr1DzQ+IJDrmOkuzPf0GHbuxDtqKIvrzw/u6wp6RrRsgwn1z2m26uhOcMz1XZ9dAhDKb4ZmX4TANe6W0okltKmjsrz99XZStXWhjTRiI92RKh/KvVYwbrc8JvwXTMKiFsXUPTE5/ElpuAzbBLGm6tDUkXQ41i4s793CcFMmsWyWhU0sEMQtyMcjVs23062GnrDgrReSr+wFw7kDi9I0QtluarGXeUHeaP4Zem4C1W+O0aN4hkz4gQzvQsnV6IWOHNR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdnbzqsD8YGG1giBGVGtIz3FOxq8PdBxwbSIDrWMZeE=;
 b=nQxI4kWced/yIemiZA5AIa285PK9UgihGzAZXAGFGWVQAdobg/ptIBZWj2LFj8WRuUpLW2SQ1mol8bWpZ5iya2OuEilVGb/zbsIhnN73bCTI6dYvh9MTbXF87w3FoNBFM7PlBAtmAHnYixYJ53ik7lXSfozyBUxE7IDg2cxFitBiWIIS2e+7QaYb9adBjVWg5ZixrDU7ZW7JVEmNQFExTX6MldXwbOVLHpcQh2yAyZAkpLC+GzLTCuzM5D0SPgZ3PCUQBlmc6Zn7+D0/nFFFWH1vEux+D4C+upMGkMtH779+3QA4Y5EupSPwj2s8VSxgetoFeW0oB/p/fbZlUQw+Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7158.eurprd04.prod.outlook.com (2603:10a6:20b:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 18:54:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:54:53 +0000
Date: Mon, 19 May 2025 14:54:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH 5/6] arm64: dts: imx943-evk: add bt-sco sound card support
Message-ID: <aCt+dFnqjBBsBjK2@lizhi-Precision-Tower-5810>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-6-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515051900.2353627-6-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d93f87-0409-4504-6271-08dd9706a3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a3hR2KtwPPtlHUB9yri+DCxnMe0U3xSFQ/20cZ1iaSY7JvtSQHsafc6wtcb8?=
 =?us-ascii?Q?2Sgq6HcOfN2ef/w3T4sR2ThxewkmQr6LF8AfqYv5NDob7ooFmPXMj9VYdLjZ?=
 =?us-ascii?Q?HTr56JLc707VZtW61ryIbzx0IjijBc0er9cGzCID0dD79JR10SUoeNQs7Hkb?=
 =?us-ascii?Q?EoGFvt2rFVAGmArGBze+4LFm0zgwHJXsFLQJxBM4InpX8FlhEV2wdtgPl5bX?=
 =?us-ascii?Q?/6GGKdN1dtXu6vtcas/elPtEqushtSpb8Hw2icY9khvj+0fqwqeJLHhhIK+d?=
 =?us-ascii?Q?Y2OQb+jBGfydU4Cs3Ww8JU7ujM/9MMOYot6P2MrOZd2F8aLEPGofBs7OGBgH?=
 =?us-ascii?Q?YEQRYATGuA6Wd1RK7FhYcGp2+XEvmmVKYj9Ue17m8KFsYQPkdF4OKm5XJup6?=
 =?us-ascii?Q?N8jUTeI0dTFYEnG25qM+qyI0B+KSc1SC/C+MzhMVrv8KIbVa6T0rApSRKUt4?=
 =?us-ascii?Q?EH2dvgeMJ0WSTr1c9K31C1rjxNCDHdebovtqsOOFexbpX9KhXw520Rj1sY8/?=
 =?us-ascii?Q?+AMUXeAx2KQdV+d3z/DgozwdawnJMrk1XadUT8nuT7SnB61CfehBjFBWN4er?=
 =?us-ascii?Q?Jsuk9Fp83xsZFT/syTFxvvAwsy//t6y7XZECKhp61OlO5BbPbc4JPgemwmX/?=
 =?us-ascii?Q?m/R7X9LVbktv/VHr2rUVeGWPwCqCI57+z62vzyYfj8+hip9WDdZQllX3cw2o?=
 =?us-ascii?Q?+Tce1lJoPzuw2OeN99rSfMXCLD1Jgz8/r2ce5ZUDw9YAWW8CTH35kJCREdcC?=
 =?us-ascii?Q?h5Q6pzESfz3fv0H8pYgLU+CwZBc19IR1X18fj3CBmCsEfzaVRfnGRpsnsjfH?=
 =?us-ascii?Q?xzJHZOOkvPJpGmCgpl7CDmwkdWppwKzwXpvyGUMe8reB04xN4qJyq5QNlRiX?=
 =?us-ascii?Q?BkkieUOl/kLbGrw4MJksLcOo3rnMOehGe3LF4LCbBNNOQ/gQ6mzzGhc0eRKu?=
 =?us-ascii?Q?ikNi3JCyjS3r8syVHc0ThPNjyK2/mwt98whYt3qn4Dir+9apHQH/R1CcshAW?=
 =?us-ascii?Q?SBg1nrGOu/DUd8t32Ta+VUTHoxZb0utxb5WVP2lCJB8lyQTApVkTnBIQ2rRt?=
 =?us-ascii?Q?IOq2I9f0r1cUQ69iDdUKkaMv6TnZMAWF+H3B9lfG85rCz11C+gX9k2Y7h08Z?=
 =?us-ascii?Q?mxmpWLRSLtHSuLS2+CdfPs3E3eTu89nMmCOCTlzBSjOHmVZ9TzT7Af5/L4tY?=
 =?us-ascii?Q?cnmmDVo2gcfJuHGaQ9ulZPXvkb0vsRAvymDH95U9i9gn3A/u8b/1bO3fhPFm?=
 =?us-ascii?Q?FTJR6V8CyaqjePe+ndGObxEGNcQPPZP/hCi2dNen/TNEiefBRUHmWCmNqw/i?=
 =?us-ascii?Q?DnfGSKAxlhBLcGjxwaCKtUcmKhUuIV35iaSj5NZFI7TRLcVeaLJlBKzv61sT?=
 =?us-ascii?Q?nKQXA258wTi+JnzBP9uCiAwvaE5v80wOiEzwsCpug5OV+2eBfgg1hk5lRGgn?=
 =?us-ascii?Q?+DaLasbijnHDKIO/7Ef58sTIBh2GD8G7T7h2AAPHTiB2W498LdJffg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H4T4d0KLsXG7+8HmVKZve2Y+sqxuX1qe8k3Reb2p+knP3KgFWh4KzpGCV4jg?=
 =?us-ascii?Q?XLwfmUavoiRLAOsBzgQvogntOm9fSnqjEepVmaKd34u9dlw3mGuC2e6vroq1?=
 =?us-ascii?Q?3C+C7gAMzzYuJZrGodIwlGwkuOZyzADB8s5IvJv2r2YzkNl5vUUMxe1DEoDG?=
 =?us-ascii?Q?qONVnw1kg/w9bPYM6DsF9WXt+XkYvf6+mizk6erPWqpTobRnxIYTunc17n9O?=
 =?us-ascii?Q?5KTZZm26yMH1NzuWuzJBMYhU+gefSHe7mipYHKpgIxRnH0g1Q89L9kU2nNYW?=
 =?us-ascii?Q?y+KogJKCC7D2k+mZZeVClWBkE3+4Xxk1NzMLDSGR9WUvLPUn8pWpIoBhWldg?=
 =?us-ascii?Q?ULewM6tC3QkJwisirvMQKBM3OdA2B43YMD/oyftEDE3Ona4GS7OxE2qTXbRt?=
 =?us-ascii?Q?gRn5Ff8Ubwwz2XLBair6ZoO9Yzx5cL6swOCebvpqSRcjGQAQXgg05ka20Dlz?=
 =?us-ascii?Q?Kmvz/RpEFTsw5HQaxXyIpu2oxzAXeo7F1wZqrGf8vh/v/Ig0UJF7a9596sJ6?=
 =?us-ascii?Q?WxWB41nchFqVuk2plZFcWe16nzAK8vLRZvQZUKXwCUoAQcQdjf14/ri1g1DO?=
 =?us-ascii?Q?IdM7GW1MP2Nz2oE1NsigqGE8QzN1I3olpmvMTrQSO8SYkn0myR7pNevIwTUY?=
 =?us-ascii?Q?1Syoh5MZsBP3DYVKOC552ZQ+o247DxLX/R2n/ewhxlx6N6Dt5HT4khFVrytX?=
 =?us-ascii?Q?fUbB/6uY+Zo2hALQtF+J29YXpFIu/tYTqY0aHL13lVT3OwKJhzhd64lPYdA2?=
 =?us-ascii?Q?lngxjbIy6AivkDPyohyVhyGiH7PAVVoCCetaDx+gYbmRLjooqBRMgNnBpS5Q?=
 =?us-ascii?Q?PKEyWpp2559LN74zsbVqKgeWxURbusEZ5vu02M1NBzJ3x5D9mioyxG7yGc1w?=
 =?us-ascii?Q?NEArHOGQa9F3i7p9FQaVkskV/VDY9a50RKQy4+3eUHQR71tVUwN4PH+5fuoE?=
 =?us-ascii?Q?lMV4vb5ihogy8qhcEfSiQpgZU3uUildzN3cWtcKLLE8LO3EqI7HmLC7fo53I?=
 =?us-ascii?Q?thJEXSbid0KQX/jRVRasEXQB8DGVoFm1LnUJu+qMZzf6NvRpIwxxALICSGyO?=
 =?us-ascii?Q?p0NmVpI7X48ywEjj+Y8DYpx7+spT4gGNPKzLByKihAj1tvbX8aBQlinUaPAz?=
 =?us-ascii?Q?iXZZAWRE2tK4l2F2dsCuCvEtRd5339cFAIOBAA7twbPnSb9bRDtvi4FXgEOm?=
 =?us-ascii?Q?JXODN07EGTazwFgc/zWK/TdxBtcKA7uOkS/HQcdE4LrKVGhvU5XPz5lUgK9i?=
 =?us-ascii?Q?pBOx1kzbgOR7ClAI0SFtStA1TQNdFZQP2rNZzPWOqdFw0uKFyV+MOQ1LJQSh?=
 =?us-ascii?Q?4oHdxXAlpgD3oAXN/OkTideYGc8e9ez1AiP/3ydWDGGlFG+8FBNbHhLryDfD?=
 =?us-ascii?Q?G7XXgt2fD1l6M0Xp8qYLn5B7Kw7Gua2ckQspxa10IacFOm+R8PcgH7ZtIIpw?=
 =?us-ascii?Q?aFlKo2mLLyOuA+lH3tQ4cK3tqHeoJyhjsg1OyPbe45B7PjJ9zL3UIf8TeymH?=
 =?us-ascii?Q?kwpQkZj61RV1szdY4joNn1eGxEbnW6+tE1P1tNeKWUwRCKse45M5s1LlyGwp?=
 =?us-ascii?Q?LsoAabrQn/kh/HxTLj5Of8OeAb7GcTuJnx2RxxVz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d93f87-0409-4504-6271-08dd9706a3f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:54:53.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neAYcRi41FE4dN+zrHYbB/tQEOOLDtZH1L2skyF7C1RAEN0THgSmyyJILQropR59IWFqDqmgGC7iLq+SPL/wOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7158

On Thu, May 15, 2025 at 01:18:59PM +0800, Shengjiu Wang wrote:
> Add bt-sco sound card, which is used by BT HFP case.
> It supports wb profile as default.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 56 ++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index da08aaa95904..85cec644dd92 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -20,6 +20,11 @@ aliases {
>  		serial0 = &lpuart1;
>  	};
>
> +	bt_sco_codec: bt-sco-codec {
> +		compatible = "linux,bt-sco";
> +		#sound-dai-cells = <1>;
> +	};
> +
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
> @@ -59,6 +64,25 @@ linux,cma {
>  		};
>  	};
>
> +	sound-bt-sco {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,bitclock-master = <&btcpu>;
> +		simple-audio-card,format = "dsp_a";
> +		simple-audio-card,frame-master = <&btcpu>;
> +		simple-audio-card,name = "bt-sco-audio";
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&bt_sco_codec 1>;
> +		};
> +
> +		btcpu: simple-audio-card,cpu {
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +			sound-dai = <&sai3>;
> +		};
> +	};
> +
>  	sound-wm8962 {
>  		compatible = "fsl,imx-audio-wm8962";
>  		audio-codec = <&wm8962>;
> @@ -290,6 +314,12 @@ pcal6416_i2c6_u44: gpio@20 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
>
> +				sai3-sel-hog {
> +					gpios = <11 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-high;
> +				};
> +
>  				/* eMMC IOMUX selection */
>  				sd1-sel-hog {
>  					gpios = <0 GPIO_ACTIVE_HIGH>;
> @@ -331,6 +361,23 @@ &sai1 {
>  	status = "okay";
>  };
>
> +&sai3 {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX94_CLK_SAI3>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	pinctrl-names = "default";
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &scmi_iomuxc {
>
>  	pinctrl_ioexpander_int2: ioexpanderint2grp {
> @@ -376,6 +423,15 @@ IMX94_PAD_I2C2_SDA__SAI1_MCLK		0x31e
>  		>;
>  	};
>
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO42__SAI3_TX_BCLK	0x31e
> +			IMX94_PAD_GPIO_IO56__SAI3_TX_SYNC	0x31e
> +			IMX94_PAD_GPIO_IO46__SAI3_RX_DATA0	0x31e
> +			IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> --
> 2.34.1
>
