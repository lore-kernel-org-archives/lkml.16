Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B741E9B3F;
	Thu, 30 Jan 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255364; cv=fail; b=XQ/QQlvXReXX4+/RSRhBOtpiYmI5lv8i+uI6pXwEWVdbmonA5w/AoJaOMWaLjT64uptTz+ubkKzwv5sILz9Ncd1Rqs770C1ecrDeP7vK/hylMsQRZhMkJJ/fHUOExmr29W/SKPuINypWFaSOpXdAIo0ksfDvBvFVz/MvXq8s1WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255364; c=relaxed/simple;
	bh=kb5EQtviz7FAzJBqYN1N2fOPs9qvS2s8u+fK7coyLzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p+smrxO79BFS8KtNFiK0cYI6O3IQnCJHBNWjxgqUoULKoCYA4JpH1OhmNJVqM6TwGhDkHeliY256CcIGW9Puons9CuS2j5i0gMAaxuPE2grmqsXdcq15wKATcNx16x/RSbXLpZkDSStIBdIBf+OzIU7rAuNdJIV3sw/9JW7wLiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ctb1waNF; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ctb1waNF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1AVqw9OS5wT7L5VwTWIkstCtgrF9vhwMOfSgtm5Tp9YS8hU88cB9dBYGXcftbGVg4/qlzaZHQWNxJ0foK9Bu3jixfmWyaCU9fyfH0LoJUtD98cCjbWfwXmo5r9hl6OCs79g5MHq7VGPhOIhFNEnw1ZEw3OipinftKO1IZ3B/tuqUdXrb1Q+Af66pU45yZCrcmS8ZVfMq8zspVMiMPfTj1vVEMg9slxZiXK6S0RisVK2GyI0ruP8KA44ZWBKT+v6zkR/Lv0Htf4pykfdDR8xt7Opiq5IkpeyPhRVjKsoInmZpl3MHnwsXleSmskwN/pDE9dCKw0XvbiFOPWySeP+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXU4immAkphPsumcuvChRPI1VMI7LP5wSIzBwXG4rdc=;
 b=npVxL5BP23WtjZmHO+TRsMxiuZCJas9wpzBCLkiJoC1a1reLxEDlb7xZVbwHSuXLae8xLvC18ZSEk9VXfkTsQ241kI0330wEupjW4pzsPmSl3zM296un3zNfip+Ll8pz2zvFqzlKOXhcJ1XxPQNCfYtcWDDW+j6/L+TAbFcQ3uNVezG3kjvjt2pyaMxKJpXmW9ecw/kIPKa8KJ13bunB6IWzModRVPiM8eLwiPf3q2F8Q0ohfE3P4b8hdirLKUxTB1UuRwaakbyilqYym7sdLvtSHrMtiKaRRs6wIKEzyUF8N+uP728NSGVwEV3ImlSLCnT19D5OgoCgIQ58/txLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXU4immAkphPsumcuvChRPI1VMI7LP5wSIzBwXG4rdc=;
 b=ctb1waNFXKOphZ/r0XioF8zYHTEDAuks7RUZKXR3TJuT6PeHPD7luIBzM0LtHDefq4wpkaaiu+FeEqB8tndPusbTAg2R6mxnDzd+hOD4/RjFf06YYfK2x4aZTkemblZgKapvxYLGkzfOL9BLNorNuVU5vep63AxNK+BAaXTKvz3fmPy178oJaXcEsO0OlScJSrEmBxKNAKt1/Sb4MSe3XljlDOCYhtY9MHN0+tjZZC8DFv1Cj5us3Q4wN5DLCSW1xbzkxBimltYLaez3Ju7M4W0UunOFjEtHc9/KU9UVCd9pkPhoxF+yTxemvbFbCN/3pcqtE4OIT7irwE+ajb6aTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 16:42:40 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:42:40 +0000
Date: Thu, 30 Jan 2025 11:42:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for
 i.MX8M Nano
Message-ID: <Z5ur+NF9UlXJSWtL@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <20250130130101.1040824-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130130101.1040824-4-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0a5fd8-31d9-459f-1620-08dd414d1c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wcV5V2bv5lKOSUS1ez0pI5s1RYQn2wXZ50K01hh+8oyqSQvPaao449otgjHN?=
 =?us-ascii?Q?/tkUGfX8isetKxkrXCSOXmF9WZiKTgj7FzB8USaz/9Eazz/fMDz/8AuDmX7X?=
 =?us-ascii?Q?IvZUzqcyknY7ftiWRuA8Akq6KCaG15ZOX4+2jbuoxSHZ860PHpSg6X45+Z7E?=
 =?us-ascii?Q?mnC6RFEEhMICWPfnvxpPrMP3pM+iKJ1Xiw91ljwO3bU+RKbPpcIEH2P3ppSd?=
 =?us-ascii?Q?3gwBolt/4qYh0eEygNBLh1JW+NJkPd76k+lUKm4SVet80EdtW0rTE33RNvKA?=
 =?us-ascii?Q?2mDTacH9qR4DmEVdgQmC79L//jCIT5Td/4I+DTjuZYBQhAkVFwS4epVJAZM/?=
 =?us-ascii?Q?gXpR2jAgPcZ8pgRNyM2QGyKFWyMw4AGgs8DMIYtau9XqlUqg+8rfRnKH0Yrr?=
 =?us-ascii?Q?yndxodfCcUrZFQvncGZkztUmRIFwpM/R0BtEEmqtcfGOKa+TPrYaUIbaPMpu?=
 =?us-ascii?Q?sn5CSfI5UWAyucsTW2SmDgpfNMnUuqWxCxkSwfZ3mRN2zexk1BZRDdy0vpdi?=
 =?us-ascii?Q?DY0r0t9i728AI+hEBTWVOlMKn6UKON7vSvoLdBPt2yaCU6xSd3okshEWg3Ia?=
 =?us-ascii?Q?gcLMvVPB0UD2R3IPIsR79CTsXKuP4aQJ+3N9VcLp465s5KSQ4Fssbg1EP2m9?=
 =?us-ascii?Q?s7ro8IwURCaI80b+Eg+2Dp1OBXKJ1fJ+NK9OmxJZt1eRPyhTvYAb2etxJEPz?=
 =?us-ascii?Q?05m50+ey64HT4DaXfax2HJuqEGmpOm92/Kdt4TXpDqD3N9AjAXmO/HitHKZW?=
 =?us-ascii?Q?VyqRiuGzkMEX3ElZFtY9iHTejO1Yn6XgKxDIfdkQhRPnl4f1eNIbIEMw10Er?=
 =?us-ascii?Q?s1DUIQXAJOrlB2ktcqa2rQ8Zox1jPApAeoggMpYL8+mjVAef0IgEn/gZeXhM?=
 =?us-ascii?Q?WJWXNIOfPc8gOKcL2eToNCMAiMB9H3wW4IdpjDw8DvzBdX3iejA7pEqR1wou?=
 =?us-ascii?Q?KIuRexr1UrNK01P4vWgnd48gz24QUXkKXSfuoLciNvctD1bD/aRjyYbX/tgj?=
 =?us-ascii?Q?G1StWBMhAr/ZFJSy0dPnxoRHZUlQ4PriCfNviVbb9fsjmqq4iFoZv+u0OtGm?=
 =?us-ascii?Q?y6cLqtvnGHDJDQUmKB4TNbL0h3e4EF0dPw6vRMMpjFr5VEyDVEk4l3eQC7Vz?=
 =?us-ascii?Q?K5E/9fW4LQxBRo10wcef5r5aHPqwYHe7hONAtFr+KqgUuxCSv93SXLCh0kfN?=
 =?us-ascii?Q?IPV0Dw6jA/pLVlGPN2kYjWYYwS6xQpIk1clj+cl4062Zu+WMUadQrMeaud2Q?=
 =?us-ascii?Q?HfH5fQwqs2CwFglv7AbjcqNDIc0hF93r4eEIMLDBE5US4yvBYiUByaG2rpIU?=
 =?us-ascii?Q?umVde9MKkCLBVGVBY8BdkXI0Wx/yk5yTLiK05BQNpL177eR2JChnopTfuteP?=
 =?us-ascii?Q?AdFtj1VaI6PZoSWAMSQf4omqZcJ0vbk48ZjVB6DpGLTWZ0KDNfcqQQaIqDci?=
 =?us-ascii?Q?E7wkhHadxgVTnNBX910aq0ycXIPL82MM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E8T+GHyS2Q4/DTQXDzAbtNS3lLYPM0X0llzKE2+7qwcD9jo+SVXF2I/8imlj?=
 =?us-ascii?Q?e9GVx+BgpSBIKJg5zTtkEw8soS6ktv5oPwj3xP5Ksx8yhQogBVvWakTxY+EE?=
 =?us-ascii?Q?u8iV0sh0VV9UVlfqFrTZ/TRMox+UIfkrDiL92yhAqGB90z1XaD3lxQ1Er8hj?=
 =?us-ascii?Q?PaoggplnT735cRQqgig2Zx6grRs9Piemu5StBMDrAE7QYnyV5VdBqlwDCa5Y?=
 =?us-ascii?Q?Z0lO60jT2tjLORR5cgAY7xzJA97pkWjBuHVgEOLEtIzCMTIOnpQlzZ72Qa0O?=
 =?us-ascii?Q?zq5HrwZZHek5rzMKXB4nUPjViHJJ5xzCqEaRh4CMW8HUMuuoXVej/uY1QFPP?=
 =?us-ascii?Q?+10omzIetCyfR7xwEKOKCEFkdNkPw9CpKYxBN/PPezrmA51/sjNCuKtjTD9J?=
 =?us-ascii?Q?oKmN5stM09aqP0mLG5FAvh2YiBnw8dLHnHjLlJJTRMbMb6H4Lql/ip3hIr6o?=
 =?us-ascii?Q?CutGGeQNcR5Nxjbt7HsiAndOajFn3+HwuaE4Exg+5EmGOj1RHFqn9X1eqQfW?=
 =?us-ascii?Q?rEyrjjabYBkSDnWO6V1ihQKYD8qGPgxTp3CgY1WE0HwZTuHGg+1FZeCiO4ZO?=
 =?us-ascii?Q?KY4K6jZy/WGhsWx4wonawu5oT9RBSGbwmLLUQTGuuaWc9uT7bCRhnD3qY9yc?=
 =?us-ascii?Q?fVEf6CQIY8r24U1oUnmQo7cAxR6WBlfdEOgiGcWe0p4iXHdCS0gYS5iDVTIN?=
 =?us-ascii?Q?3ub9iLEQ9f+dgmhQhKuaqYOm4kECYn+v1xoMoGPMN9KTZifqjbSrKDG90Ljf?=
 =?us-ascii?Q?JivZfsNNnq9drRuoxcxtjcw0KGF7IihJ7FUyZ896+5+Y9gCNt0++aFQjpO18?=
 =?us-ascii?Q?n1swMm/FWZJ/vD2h4n+yRn3AZOvzI9vvcInLoY0XIJJnXqVYFj8ymkLtykHY?=
 =?us-ascii?Q?+pWn2e0nLJvsKhecgA5uNBO2pr6+91QUAGorMm0JwE/6Q8/45O8LLyo0KKhx?=
 =?us-ascii?Q?4nFbxqGr2IY+9cr+qJ6lTN6ftPkNQY+CpwckNNglZw3B57bDkXl4zVXh/6ua?=
 =?us-ascii?Q?TWz6vI/SB2EdV4rLDVvowjzNhkqMbkwRPFy3pS1VWvUFgIOCd2TmGzeULT8z?=
 =?us-ascii?Q?jp9uRyr36ZyOGW0EG/8rCnT+pWthsdBl4R2KXEKgqAdlu3CcgHxGGu0BR3Zh?=
 =?us-ascii?Q?i5pLTgPtKDpYWpREyXip7Y1J54GcMn/BfLIFU8oO5kUqI/x5njA9m6kv2dcy?=
 =?us-ascii?Q?7Sc7Dq8KA/XyAp1BkWiQqHXIvqhuhbV5MQRPJs08Gz8jeQq6P8AsPcNLIQsE?=
 =?us-ascii?Q?MiQy/ULdEVqkqtIxlkeib9Vvwz42CTvybOyZ7zwjnsO4vttSZzt09A/IuB62?=
 =?us-ascii?Q?eBwiQHvPjg+73A1kzxFBGglZIgGZfpTZYvKMhrCiQYQ3Ty2K1zLW9/Yv/zgB?=
 =?us-ascii?Q?lpG6pt5qxG9wCZqEcErA+F0Y+n7mjRM62lCTkmp7P+3jwgZRKqdp6GzFncol?=
 =?us-ascii?Q?mF5IKLZTuaclnxI9vWZiNA3UQnB5+9yCm9U+gGWK/J0umN3NXY2Ks89GIxKz?=
 =?us-ascii?Q?nuezIM2NlUVHyNDu283MVAcmt1Dqg2KIk3ksDrOYAkPkJoi82BmJZDQZU9FE?=
 =?us-ascii?Q?j5DQtN0CtplG6MX/q8c382aCjSG91SGAn4HdvMt7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0a5fd8-31d9-459f-1620-08dd414d1c34
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:42:39.9695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oK8Wt4HlaWtZdTLqRO3Kb89uDbdp44fAprbeBr1/IdFLIqZjWAk/e/R4agAYA6DqDIIRRaU/reOI4HfiEZzK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502

On Thu, Jan 30, 2025 at 02:01:00PM +0100, Alexander Stein wrote:
> i.MX8M OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce disable_fuse for a list of possible fused peripherals.
>  - Iterate all nodes to check accessing permission. If not
>    allowed to be accessed, detach the node
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/nvmem/Kconfig     |   3 ++
>  drivers/nvmem/imx-ocotp.c | 105 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b93..ba5c928cab520 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-imx-ocotp.
>
> +	  If built as modules, any other driver relying on this working
> +	  as access controller also needs to be a module as well.
> +
>  config NVMEM_IMX_OCOTP_ELE
>  	tristate "i.MX On-Chip OTP Controller support"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index c5086a16450ac..e3ea026a37d0d 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -23,6 +23,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <dt-bindings/nvmem/fsl,imx8mn-ocotp.h>
>
>  #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
>  					       * OTP Bank0 Word0
> @@ -91,11 +92,20 @@ struct ocotp_ctrl_reg {
>  	u32 bm_rel_shadows;
>  };
>
> +#define OCOTP_MAX_NUM_GATE_WORDS 4
> +
> +struct disable_fuse {
> +	u32 fuse_addr;
> +	u32 mask;
> +};
> +
>  struct ocotp_params {
>  	unsigned int nregs;
>  	unsigned int bank_address_words;
>  	void (*set_timing)(struct ocotp_priv *priv);
>  	struct ocotp_ctrl_reg ctrl;
> +	u32 num_disables;
> +	struct disable_fuse *disables;
>  };
>
>  static int imx_ocotp_wait_for_busy(struct ocotp_priv *priv, u32 flags)
> @@ -552,11 +562,25 @@ static const struct ocotp_params imx8mm_params = {
>  	.ctrl = IMX_OCOTP_BM_CTRL_DEFAULT,
>  };
>
> +struct disable_fuse imx8mn_disable_fuse[] = {
> +		[IMX8MN_OCOTP_M7_DISABLE]	= { .fuse_addr = 20, .mask = BIT(8) },
> +		[IMX8MN_OCOTP_M7_MPU_DISABLE]	= { .fuse_addr = 20, .mask = BIT(9) },
> +		[IMX8MN_OCOTP_M7_FPU_DISABLE]	= { .fuse_addr = 20, .mask = BIT(10) },
> +		[IMX8MN_OCOTP_USB_OTG1_DISABLE]	= { .fuse_addr = 20, .mask = BIT(11) },
> +		[IMX8MN_OCOTP_GPU3D_DISABLE]	= { .fuse_addr = 20, .mask = BIT(24) },
> +		[IMX8MN_OCOTP_MIPI_DSI_DISABLE]	= { .fuse_addr = 20, .mask = BIT(28) },
> +		[IMX8MN_OCOTP_ENET_DISABLE]	= { .fuse_addr = 20, .mask = BIT(29) },
> +		[IMX8MN_OCOTP_MIPI_CSI_DISABLE]	= { .fuse_addr = 20, .mask = BIT(30) },
> +		[IMX8MN_OCOTP_ASRC_DISABLE]	= { .fuse_addr = 20, .mask = BIT(31) },
> +};

Can we direct define IMX8MN_OCOTP_M7_DISABLE as BIT(8), so avoid this
map data?

> +
>  static const struct ocotp_params imx8mn_params = {
>  	.nregs = 256,
>  	.bank_address_words = 0,
>  	.set_timing = imx_ocotp_set_imx6_timing,
>  	.ctrl = IMX_OCOTP_BM_CTRL_DEFAULT,
> +	.num_disables = ARRAY_SIZE(imx8mn_disable_fuse),
> +	.disables = imx8mn_disable_fuse,
>  };
>
>  static const struct ocotp_params imx8mp_params = {
> @@ -589,6 +613,81 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  	cell->read_post_process = imx_ocotp_cell_pp;
>  }
>
> +static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 id)
> +{
> +	u32 addr, mask, ret, val;
> +
> +	if (id >= priv->params->num_disables) {
> +		dev_err(priv->dev, "Index %d too large\n", id);
> +		return -EACCES;
> +	}
> +
> +	addr = priv->params->disables[id].fuse_addr;
> +	mask = priv->params->disables[id].mask;
> +
> +	ret = imx_ocotp_read(priv, addr, &val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(priv->dev, "id:%d addr:%#x mask:0x%08x\n", id, addr, mask);
> +	/* true means disabled */
> +	if (val & mask)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct device_node *parent)
> +{
> +	struct device *dev = priv->dev;
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_args args;
> +		u32 id, idx = 0;
> +
> +		while (!of_parse_phandle_with_args(child, "access-controllers",
> +						   "#access-controller-cells",
> +						   idx++, &args)) {
> +			of_node_put(args.np);
> +			if (args.np != dev->of_node)
> +				continue;
> +
> +			/* Only support one cell */
> +			if (args.args_count != 1) {
> +				dev_err(dev, "wrong args count\n");
> +				continue;
> +			}
> +
> +			id = args.args[0];
> +
> +			dev_dbg(dev, "Checking node: %pOF disable ID: %d\n", child, id);
> +
> +			if (imx_ocotp_check_access(priv, id)) {
> +				of_detach_node(child);
> +				dev_info(dev, "%pOF: disabled by fuse, device driver will not be probed\n",
> +					 child);
> +			}
> +		}
> +
> +		imx_ocotp_grant_access(priv, child);
> +	}
> +
> +	return 0;
> +}

Can we have one method to share above code logic to avoid copy-paste to
every ocotp driver? Anyway, we can improve that later.

Reviewed-by: Frank Li <Frank.Li@nxp.com>


> +
> +static int imx_ocotp_access_control(struct ocotp_priv *priv)
> +{
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +
> +	if (!priv->params->disables)
> +		return 0;
> +
> +	if (WARN_ON(!root))
> +		return -EINVAL;
> +
> +	return imx_ocotp_grant_access(priv, root);
> +}
> +
>  static int imx_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -622,9 +721,13 @@ static int imx_ocotp_probe(struct platform_device *pdev)
>  	imx_ocotp_clr_err_if_set(priv);
>  	clk_disable_unprepare(priv->clk);
>
> +	platform_set_drvdata(pdev, priv);
> +
>  	nvmem = devm_nvmem_register(dev, &imx_ocotp_nvmem_config);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
>
> -	return PTR_ERR_OR_ZERO(nvmem);
> +	return imx_ocotp_access_control(priv);
>  }
>
>  static struct platform_driver imx_ocotp_driver = {
> --
> 2.34.1
>
