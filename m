Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A421E5B94;
	Thu, 10 Apr 2025 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298725; cv=fail; b=qddyrD5e3LKlw1q/X3oit5H9khLs4amBK5R7/Qw4ADZP7U+zWCfDwVPrJ1vlSWaDkkh0aDamr3hPxVlcN+4zaPVMgN/m+70ClsJKIx6I+ahpw2PnHI3hklf/Ohww3u/TWgXNMC8SLj86LiIag7NSYDbY7+FbDazfwCzRXDVhoq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298725; c=relaxed/simple;
	bh=JXh9DZxbnqnOTGXYKVKojs/Tm/ZvDVFBX6l+6RgHnQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=epduZ0VUbv7oy8XArI8nS98RSu7BPCAi/BLNwxreFF/tu6HDZXPDyn12W2dKpaL1E9Qfei/V7wsjhUyI6eqIIpg2Mntls15Mp/ZBJeT1VGOkksy7y6k1QO53Smv82ESONAB9ovBCxVSJFKeWnv3voflrfN+XK5OV9otgxfEhDWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PgF1MGSu; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PgF1MGSu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWSbNv0EhRDVgAiQvDMHHQbkglpW6fSjwWBVlG3HAXTBeap35AE27e6fBYm35oyj1uQDfyMyFTUk7syWqKJhWjKiSdIeqrxLsw4mf3SCNYMmufP3BobUhENcvYT842+Q0tFNEldNvSETf0uPYWZDX8l7YlyRKAP192LvRZY470RSFJUoqbpxFi+1ZowVdRaJ0qXi95xkPu2aSzwOK3uJCBMF0GbuxmR+l77q/tViXXwkzOuzZC4GVyA/3VnqoyEXmNhjqMcDFuUhnZawLB/73uzZ3gDcMZYrzbhZmpwIv0/7mUrK+0kyujS0VgyDhRXlewV7f5aDW79SrJpj8x3kbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbHLvla6shmoJEapAnyRiGCK6otPVpD6UE1K4+VgP7A=;
 b=HCX6ZW1LmbGIy4CCBgAAealoJCgBLEK26iepavoj2BitsAeNuWAFHXB6Vq7LBz3/+7D74647IVzFrcgbTAZtbm6e6tMuIFWk9z5g4+JWdWHn0GEKKiTm5P1G6lOBzTFIx4hUviSnU4RDGEmUU4ZS+g6QtF6ZpCrbekokZtkG2XSDgEPHGTu5u2U1rFCzZ0q8u+lWHAXKU7TIHm4PYyNqdtTq2vi3GLoTrA9t8+uu18iiCOX4ndnG5u5ya2rAyfcDOooFVp6gruVed5QI8IS32VHA9jUTyu5CU7mpd58r1+R+lv6bmo1kcXn3TyJcM5wFm91gjwP+XukjHJgNnZGdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbHLvla6shmoJEapAnyRiGCK6otPVpD6UE1K4+VgP7A=;
 b=PgF1MGSu0a9PDoBTvYtR89fSkW3ijwnM18QPLxiWZUkKh8hudFtnauPdnlHq3BpU5wbfpHMhjBrImIKUCBJM6h9HGtiiCbwGEEOnrtMCQQpUyrUQP3iwSmib2LfRvFbbZNmEhjJsKJbdk6Zj5FomOeHCVY3HeYzylBrjYl/c+DWJ2yNJnvzFOz6YbHQNP0UHXN5Uhcf03hSs87YCqtW/GIKmtV8afwYJlIB949vndS9DjKTtOSjuJKA3kgMjWfRvjUmZvIvNuC0Q0YyZV9ElMa6Oi4YMKt5q3pXsxH1rbSfnFqvQLxe5rHTBy9qsd0WhtEKcBSSbgCxvLkD9dMmVgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 15:25:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:25:20 +0000
Date: Thu, 10 Apr 2025 11:25:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 11/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 USB support
Message-ID: <Z/fi2W9UdFkwKpSa@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-12-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-12-primoz.fiser@norik.com>
X-ClientProxiedBy: PH7P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: e94dbb3b-fbec-44da-8031-08dd7843e7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wRS34p6vaQmSUORxttSLoonx6trREEkh5Uu3YeiNoJohK8EXiugQ1C/o4N1v?=
 =?us-ascii?Q?vgfaPlASmqV6CoVktIYPAD1wQDLqspBv9gbS5qXTRmZiWP9SYkPpyjLeyOKo?=
 =?us-ascii?Q?wNdMW/i1U/X1Dz/rzFUyfYe7OPwLcqY+DqRZA6bIIWEyodtpU9HDrjEnNSns?=
 =?us-ascii?Q?lSHMK1uiWLCD8GC+4edjtc8J4NtdT0MJAM534CDsULlUFyzvgVHldIGaBDgw?=
 =?us-ascii?Q?BnYiy4dfT2NmkLmyWSNKkdg0jwF3OvCDL+Ir6dUwNaVS0+EaLeEV7Ek+jHas?=
 =?us-ascii?Q?U5avCtoeEJTN6+pAq4HatypSHLmKa12aBY6zrY3ek2eRgRP7akEMRgxVfQxp?=
 =?us-ascii?Q?TcGx98FuBsj41fnwP5NxwKy3B6i2iMqUnz0C6Bg1LF4BdbcdfI0w85m7GLdH?=
 =?us-ascii?Q?LPxJTBabQzLRt44y0KgPJ9BNCfpjD6n1N7V1vJOR0ee+uW3syR5u1ajfZ6k+?=
 =?us-ascii?Q?Q8oDZpT0NHFhs2ul9yfFi8xLUDk/Qsi/e9RCyUzjIkKscCa/tzsTxrjPeUAs?=
 =?us-ascii?Q?RJNbXOpPRuOpG1xsO7U7Mm71cl+KMoT9hSaCGPPp1qxe4E/Nq9gULE3T3Cjw?=
 =?us-ascii?Q?+n/qaY/NfL/u6HKDya0Dqa5qrqscX2PFYv1wAjqKSjcu+z53ZMfnrYisftTF?=
 =?us-ascii?Q?hTDJLts/eb9ntPKH7wBb9ZmWRrPITaiudyWT6hcjxHfRHhPRpj8EzGvLa0uh?=
 =?us-ascii?Q?7Cx9HglvOd6OfofSupxn0LOjntrF93P2iy3cwsgbxkHSxf6nOlIqyQw7i3II?=
 =?us-ascii?Q?5WyRlWSwf3woQyaTxna7kUVcwvYpjrpazyLP92prAypRLGteCCjlXtjS17tj?=
 =?us-ascii?Q?2REWIjCCDXYzC+2tDmFNDrvyBoY/EHy2gSBS0dORhqOM5Vq5jDyeo1lKhg1U?=
 =?us-ascii?Q?w8IQxEUdqK2oM1iD6O3ObJXlomQoxEbk5hLSVh5QpOvikTUrvEJgB3HVGiIB?=
 =?us-ascii?Q?Qb09c8PjqVNvMiaT3DfP3lHHbA1fcKPwH63bPXAEOY4CQnY3JtCopWsMQe0Y?=
 =?us-ascii?Q?txEc+12hSHM3GcxVTQRPBQ6j5WfEgXLI26hAFDMgRIzNBFpA9onPXpFTIE/b?=
 =?us-ascii?Q?9s5A4z+s0w0VHmDbal0octbFKBB7+Cd23TGSLY7op7dAUea83TYXIz8n9tGX?=
 =?us-ascii?Q?fDvh1ceCCFVVw7/7MWe4TfqMQpCypiGGsKDBu9G+ysxVSiTaVuMu3MS29bzP?=
 =?us-ascii?Q?BOcOhkSjMmgIIKpkuARcjfkME6N4wj9DYLqsxBHsIOj3iX/uhiORk6IduP2W?=
 =?us-ascii?Q?pnQHkVpRmgmkcih5g1CPaj3j7JfJNOetQt/yd+7wecKrQ01Qk2goEwhUpyHL?=
 =?us-ascii?Q?NU3JxSomKzcEqptL3NdqDhrFfELBQyHVeq9UkKHzFOG2QFf3Av5nGLGKx3/e?=
 =?us-ascii?Q?1c4U43t4KflYvFXYVUhHmFVAiD6okMwrVyie3p6HDJKE9Zn5/LHCrsOCJ5X/?=
 =?us-ascii?Q?Br7SwNC2+5LuZ2CO5kRfjbmxL8bQCxRI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ne/wZBUeYH599V52Z0Gnekh2SskAKuBilkLHnjqVXuV0wsaIrbKdreNLxxST?=
 =?us-ascii?Q?+DFBal95BMYP5Ngzp0wgxUKvvZb9u9TqMeCkz3rkJ52DoDlaRZpe8SkJ/zHU?=
 =?us-ascii?Q?lTXUVsZxQ2MQ+euGiMC/YwwLcXt69zR/+2dwdP8F8jwJ3t9XksaElr6y0cb9?=
 =?us-ascii?Q?WbbzuxsCTKxA01ZDNNWRBY3bTSKaGE52XWOdK6AE35qXciDbcPwBdhzLF/Ui?=
 =?us-ascii?Q?ADHQ7UG9ljgSd677GfEvGmfB2qVb9p3YNjZDHeD3YqdV10B6fBCFMzZrDGyb?=
 =?us-ascii?Q?PpJ0mEiz5zWwWgqF34xQyHQOkYUab/AEGjnXfiitf08Y/vsyyeUpIgXG6gDi?=
 =?us-ascii?Q?mlPUeErAXUQjKLEt3NiLgHj+d/ztJDo7c/CZe3dIvIl/gX/W4AWVKjCgHuE4?=
 =?us-ascii?Q?zfzdpY5HZe2EYfMW26YrtbIyWScfiPPkaqwjVPd0BtZ2mbZNFp0+1jR/JmBa?=
 =?us-ascii?Q?zHg5krt4QfYx3Rf7LN0QKEAzFygW9vFkyi2THWC127W2Tget+z8gjOTeXz/t?=
 =?us-ascii?Q?5dDCJsb4zCHJF3VCYUg7rviYETiSSDkrFudKR6+YNp/l4+5neMOgMucSsypz?=
 =?us-ascii?Q?/A/xPQEfD9tzCtAT1DHp+SVXbK9adeCtDgHHlL+HizRzfqG5MB94tYUo0MyV?=
 =?us-ascii?Q?Jry6tPVY3JNvHd/AycQK9Ear69IgJAMKblpN7HXOL1NLal63hpvgi5thRAnh?=
 =?us-ascii?Q?i1sBRUOdwOAUyFhztICAVWJbfrbh14sGQy+P+bK3g290Z+gg50Pp7upA0CMz?=
 =?us-ascii?Q?+QeV2kToT/cWL8iYx+vkfx7OM+i+8hQXk6nUWLCX1qkQnk39ZPDVPIkoOniC?=
 =?us-ascii?Q?OhQADxn2G5Z9hlV03rqJx8se40Fog0Qw+Ghfqc1jnc+OnR8rq7v5YHfPe5+Z?=
 =?us-ascii?Q?kWFKu+fzqNk1W+mUyVY5nsmvZ2BS5EG8QKVVS2UI1NntEIKtAVS8hyMlwWKq?=
 =?us-ascii?Q?GQW/6Qf2+lYMqKTkqWO/Jdz6wDMUvpqBNsRTM34KB9jLJRf3aA0pfM/n97UV?=
 =?us-ascii?Q?EvOKmJBrw8iovsknFJO529Fg3Wk6vck7c2Ifl52irnC3nW+YW1xKq751hNSK?=
 =?us-ascii?Q?17v9D0bqkm8lNXbNydAiOii4PvSl8UXvpDlgLTSUdd9L2lKuQSl/7JkYerTP?=
 =?us-ascii?Q?p9gWJXmG0KW2qJxYRa15y5Gq02N5Zyfu/Tn6XQNmhu61OwIGFTwMV7FhNblX?=
 =?us-ascii?Q?Xt6hZb+q0oGICjIHFW5buRZkkTwaREOgOJdqOI8NopF/MUozkZsRVBqbQkoV?=
 =?us-ascii?Q?7/NyFKKzZELsD/ddLjz2SJIP24Hr9Rrdmljzp971kUQx8QKyLG/zK1+DsniE?=
 =?us-ascii?Q?NKyr+w13S89SJEDLUe0oiJowmORc1TZpoiVD2wGLJhfthEejUxd/q9o4ms5Q?=
 =?us-ascii?Q?ObvXQvoqyzkOXhd/8R0LqS5vxyK9NwyQtAJt0I68FDBJr6lMp2qnsLEijrwr?=
 =?us-ascii?Q?f4pTQazhgG8HQs4tPiYF8OFDT+vBC++z/lyP8E78i50BKcBVoHxAV5Yik75F?=
 =?us-ascii?Q?j2K+jtg0SZGHz+90Xqj2lA5ZtN8OooMOqJ6eaE1qJuXhkGZJKI4+v3wWl3xq?=
 =?us-ascii?Q?3moHbLYdm9EwoPXKxXKHZOJ0foaw9EhcgoXTVscg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94dbb3b-fbec-44da-8031-08dd7843e7de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:25:20.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr7L3Q4bilCmwAbKEKDW19d6G9Xm/sbrU9dKll7ZYTvv4ZLLQ4WcDOPjRal6j1xLoJxjTmrvWpWcnrOacRdQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

On Thu, Apr 10, 2025 at 11:02:49AM +0200, Primoz Fiser wrote:
> Add support for both USB controllers. Set first controller in OTG mode
> (USB micro-AB connector X8) and the second one in host mode (USB type A
> connector X7) by default. Note, the second controller is not OTG capable
> due to HW design choice.

I think note is reduntant. USB type A connector means host only.

Frank
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 027a34dbaf04..faad3c3e627c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -82,6 +82,19 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +/* USB  */
> +&usbotg1 {
> +	disable-over-current;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
>  /* SD-Card */
>  &usdhc2 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> --
> 2.34.1
>
