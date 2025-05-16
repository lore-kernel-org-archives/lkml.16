Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF828F5E;
	Fri, 16 May 2025 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747358566; cv=fail; b=eb75KpY4ncHcbTbzVsCzAhOdfjMqOiVJ//ZpXAH1o6Ih7O2vI3AEG0x+7jh04tZyJC8LFbX8z7QW5w+wm4xDAzUkKYdbWBW8nuRA9MD8vh89MorvORCk8L17nheZ5dFbx3j/KyrOfYplnJSVgvI55Zui56wZQPPrIP9x1tiGlac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747358566; c=relaxed/simple;
	bh=wl46bi0+6gz0+f/lxE/c8g8o8J8CKui/3EfgINBeHB0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KehiP63Is6TgDt3XpKqG4CIfgz2qZjGTK2cSjyoJUuKvNPMj/u4j6rsJ60nVJjHq6NIaKvHeHDuWof8Eych93D1yaAnP1/D/dywdtCgHMDC9HFKcqLER/jQT7Pas2POgrKlgYoqH8WWQM0bHfTpHduEEHj180dG55DH3a65c2GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bdAqMak3; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bdAqMak3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbOsEydH3mIEtEJ7fFkfUXbZ03FvH+WhMcaXc5QAoEbuT95XUwbLfxemsTFmr7/BsdTmP8YUNO9XNwJyK6YA47OAwLq9RKnx/8D6itdY/wZBSKHfKZ+s+S3Ok7it+mrCHIuAak4ySmI5hlAj2SucFEH1FeHDv6zWNE0mNLjh57CrD2mj3zKQWK6AQbDOGoqZV17bWPS+11cGdP6K+R62gwZuOgDPujWQcU8l3B06wMz5JK5smu2PBzIGGrOA4I7+0Yiqt1ZWZ7cp2XPOZno4dTHejGK8qwURSbIyFqTosWsr7ZDD7Q39qPkntx3o3bZLd0fgFSHD1WhSRP2uoEf8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkuWpul57mWPU5nycfunTkXy3PyDi0y/VLCniy6/56g=;
 b=BVtjoSzq9RhPDVlEj2KB/HvtpRcyevmxa4Iu0EJukeYunuoVW/ASDkjTCJxpWcsBb+rFPhpY5luz2bTrxDve8VqWRjbsYXsKaxfGt1mh8Xd9FElBoHxSWDpIUye+eUlSP3oiO4ZN+AYdCcaw0OoZHydxIKImdPFWYAuJvcqupXLj/snbUkc66pNQN0t/zLwtwShJYgc01vEgHUra6fIUer9HECihF/lp3GgBmv6BVjdDeVJL8/ikPdn2Fu6O9hyO2L8DlSj70I8HS/21RL4sh5l734q/HxM0XATdVMSfBL2D430zFidbo0CZT7zTm3zXRSPlnP5ljamI2qalN/YWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkuWpul57mWPU5nycfunTkXy3PyDi0y/VLCniy6/56g=;
 b=bdAqMak3dgu9aEOkxTANPjT9AdCL3n1qaTDCfWNPrBgtokLQEtKPjYblsVwE62Y8fYfwfOUnEtaaBSX7pw4qCHOCuKcVlQBW56wbeh8MqIZgwkE3JCUj+ODCOIAdmli97rsmWHaaHXDJl8WXXaemvMz0Q4AuTvNTJictK8B8mjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10239.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 01:22:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 01:22:41 +0000
Message-ID: <875xi1tkm7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] ASoC: re-introduce disable_route_checks flag for OF routes
In-Reply-To: <20250515153128.147457-2-laurentiumihalcea111@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
	<20250515153128.147457-2-laurentiumihalcea111@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 01:22:40 +0000
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10239:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b2f908-d09e-4d70-1ea5-08dd941826e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X3b0DbK6E1+TmB+fiGUbfMTLAtNoNF1F4C/8tH29jDp7SM5ZxNvXcfFiZZ0F?=
 =?us-ascii?Q?wb1y/wFPAU0VPNyHqmj+uMI3BLpVkAQd6lXrGq624llb3h3DHFL4UHTqeeC7?=
 =?us-ascii?Q?Py5xmk4qQ5b3uX2LXYPUiuGjSkVBb07tZDgXtFfCIco0szt6aCWLzIdoJG+8?=
 =?us-ascii?Q?nXWbjHdAcQEgeeGXElw0DuwF1EtdlwAmMyYEd5ewrgcRQpxiyDt52QUysAS0?=
 =?us-ascii?Q?Cxy2OamtlrmE1FWc2jb71BBwp/S8qRskp7kMNcQjNkXyJk7V6xv4msiBVsfJ?=
 =?us-ascii?Q?cehon1bvs+PutE71rKM/xRfOtAZHAzzz0bU3M5NyxLwz8v59gFvKonM7N9dv?=
 =?us-ascii?Q?lYGKYvIeKocZutqWAFe1FyatsgBmX0CSlk1h07CC+ONjdf4NPfHtwSHaNLxl?=
 =?us-ascii?Q?vKnTso8VlONcc8GBaD1KllGn+JDecQ7pJws6sDb1to5LSbIgKlRMt8+Bke0B?=
 =?us-ascii?Q?gdybZnPHz7bSPDPU+xjgax6k4J6Tm1MwqjZktl5Ykgwbli3xzgSl4jGrfhw4?=
 =?us-ascii?Q?7Ddv68XnQSkW0xlljae5V+L2ksNKr3sKVKZszw6SSh3/nFFm63LZ095PQh4M?=
 =?us-ascii?Q?1j5fxBCLn+qIq78m9mEoJQEXUxCWpBEOR3mltFobCig3OiZ47QtlVkcGxhq3?=
 =?us-ascii?Q?3oFnJsRt46zZDSWsY1SQR1ffShW7wEQaFT/vHRPDZ4uOEYj4syA6LcwAXgQA?=
 =?us-ascii?Q?TDu66B5XWlZCf8XNpfVhjeHZXrJ2SU80vUdU4gpmItmvXog4Fk6FWpqtZAjs?=
 =?us-ascii?Q?HHQ+gIEzSct7a9rTv3Z4IQg92R/X4Oa2QZml+KfbadbUk3In00aUwRYDfZo2?=
 =?us-ascii?Q?8RsdZyQwZQgAtw0XPNkkFbWRe4wLaAd4Bioil0IS3qpEAfJyWiQmuVsqM6dh?=
 =?us-ascii?Q?5kx2Bc98HSDu4ZPMcVvrjDfw7Hjo6leOw/gFbhCYbJBFbxcEyK4z8dBPSGr+?=
 =?us-ascii?Q?58hUp4sYUGgAIes9MkPNuPl9u2lGk2a4nI/AJRrNpfAkkXHW1ODY+0RicLm/?=
 =?us-ascii?Q?OkhqOJQWbMR0QC1dhCo8plHxJ+BvSf/B5JepTX7nW5I+hDSjkZ1VIdcruCM1?=
 =?us-ascii?Q?4xvrvXVvLunOOS2lLu8vPL2/MKoCWYbXFHdnCNNsf/Ti1ac9mgcjeKCL2UwR?=
 =?us-ascii?Q?rjDQjPYcbVDiGeOD1ypMIZTYUwIcl6DWJRRZ+N7uf3a6Mcc3CZ4jBz8FKWUh?=
 =?us-ascii?Q?IJH00hJNecsV+xYs4Jam95GcSBQ8ePImgWwNBmDTmdXrnWOrDamoGKga3/Sk?=
 =?us-ascii?Q?wEyRk2b8SwRsMZbqcAJjZMN+zna70BnBDS/+5XU2tE8iKFioMK0ZMCosMCJY?=
 =?us-ascii?Q?ZCj7bxPprM2C3kKScpRsfYKmQWB/Wfe8aFxlxK+1VXRgRc6mMChF3pPXmEYr?=
 =?us-ascii?Q?Ul7HhpxuWCbWfJFFe4eK6q6iGfxH7Ssr38ovRRWByzIw+WwWmy1+3SikanLK?=
 =?us-ascii?Q?Lto0RB/p/boVs5VEO05RLBw0K/uMGf/c7q7lIpOyMuSqrdmEvKdVCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cmWuqJpVzmUOdmqqWRifWyoltdjiWfJtL199SuM6ZHeCZ2lje6ascSjozfeo?=
 =?us-ascii?Q?As6PsYwzDb7GuzrqhMatgk0cWhE3JbNE5mHqimNfXmy7Wzxo8ecwBzm+VPFi?=
 =?us-ascii?Q?HQrU7SmfzTdh0SJaexhXHl+pzFePODSdlzTKqsb8EfNFYZ09c3OVRNuDpwip?=
 =?us-ascii?Q?/qX1/8LVRjNgrAOj7KCWB7LfglEV4+fehjHtDFA/QKuNfC8aMZTYtocFZ8hN?=
 =?us-ascii?Q?4nRlDd/508Wr+3Bvogu6TlzgTZscLCfFE9gM+JQFZdPWEIJXRHLbSn1hkcvy?=
 =?us-ascii?Q?C1scAxZqOIOMCtNnMVHcD7Z80R9vQeE5C2RqoW5TzgJ+wV7TAxRjOsWif3AH?=
 =?us-ascii?Q?az6V0oa3po29AWCj/QKYZF5EHKitNEuv2OzIR0hwRPUU2UpTBgKFLGlkfPoX?=
 =?us-ascii?Q?6D5OUVVOtxAo1X8yQZ+SXn5GOL8Lf8X1UdiuAywiGZZFoUWOElWUBT4nwZmq?=
 =?us-ascii?Q?Dd1hpCDZwsYAUTrlN3WCJWRYrWPGqvvq/OmfQ7GDOv6jzwtJarAMI/Lnw9KE?=
 =?us-ascii?Q?Khulhn1zZosMd4adu9o7xTsj3NwwC0GSZXwhowVZMSWtKEB6Z1Il8R2hMzgs?=
 =?us-ascii?Q?W/R6qUp/bSxeAfO6fUmvPtg2cfUN1wyBb7nX0ck9cdz1d6TDi6Rnf8JpFb0Q?=
 =?us-ascii?Q?c4dVFEXMm2TSpTnIeSOvlSmpxpf5WiGquMS+E4qo/UR4gFG9g6l+PFYaILM9?=
 =?us-ascii?Q?Lj4nm15vQ9WAEdbei0YjBR3Q4CNPRtZTXXR+K98A3f7Dn/GDdAWw3k6s2JvK?=
 =?us-ascii?Q?qIYE5E+4JTl6x/JOWS9wsj10bR0w6fzLe7GLWhyuOnIt3WnKWZkKxb0cUJZM?=
 =?us-ascii?Q?uqfYpX+GtNeq3RVH0Ar90ihU2fq1uU3AQL0Ke4aQWj4S/miYKkgM+Ry4Pdyt?=
 =?us-ascii?Q?D6OJiZmWcb5pEE/2BpT87ueTTcEJITPWGdmpJ3aK5MqzpYfBhQGl43rQNkZ8?=
 =?us-ascii?Q?D/uabYO2LtsAU9I3aIdwDISjmTr/AbQJLWy0FOGJUuxplS3gHSqN/hAy4qp8?=
 =?us-ascii?Q?yIZs+YrNrWSt7ywOSXsmarg7jxsJyaPil4Pn1j4MUo2flZ0E7VrQxR7RRZvt?=
 =?us-ascii?Q?QqxfJxmeVeW3ug3RRmye4WJofzxVyjhmbY7DP5+Xdzi3a0TM0dugtezrA7qP?=
 =?us-ascii?Q?6PHAQsJcI+JydgyjD54Hso1g3yvtnqBDp03s4OYDjnzmmM615pmMyqSkKLwa?=
 =?us-ascii?Q?seW5y+U7nrEfXQ16YwYEB+QXFPrER3U83tKOqDmj532BUFjTHvzvW0TKwIn1?=
 =?us-ascii?Q?Puj83D90/a8tOkat9DdIe3Gy0dS1Vw8N076YZgEjnTjMYI5NxiBRjM2YlikO?=
 =?us-ascii?Q?qgQlJY6TO93cpXmgne4CvhA4tAx5SKbCUVK0UJBWZzGHErVaTmG7h0wMEFOX?=
 =?us-ascii?Q?GdcW9tCCuTLVUh0yrL/Ql5li9NOmqrvAeIjVCut7kE9sAWCmg7NrJoHZD1Q+?=
 =?us-ascii?Q?YA7VnrguHkZt/ooO2L5Txu6RMTLXpnGOU1F/4VeHXP1HXQkc1Bn/ESCtVzUV?=
 =?us-ascii?Q?Jw+0dUBHzqs8yfjJ0xzljIJluimLHRecDIilO7HBBogBmTNkJS3J2O2wbL1c?=
 =?us-ascii?Q?YrXzIyDNLzj1/du9qOaGqYMtyoyQUZ31rw3IVPW8ak2A/C/kS0srYwVjmhF3?=
 =?us-ascii?Q?sWtRc06CQOoej1JRjfBh1Y8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2f908-d09e-4d70-1ea5-08dd941826e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 01:22:41.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byB/R/Nk51TQ1yrvh9eDHGBfYJFRC1RvY0tGNrEZrU1c7Y91pJ9kVxHQkdzZOxTL20pkdzHZgiPOnU8+/A7BaSEVEAnI3IKghN6UJ03hR7SUcszdZGY6pukQmUn1wlNv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10239


Hi Laurentiu

Thank you for the patch

> The "disable_route_checks" flag was previously removed via commit
> dd2395162c07 ("ASoC: remove disable_route_checks") as it wasn't being
> used anywhere.
> 
> Re-introduce an OF-specific variant of the flag: "disable_of_route_checks"
> as this will be used by audio-graph-card2.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  include/sound/soc.h  |  1 +
>  sound/soc/soc-core.c | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 1fffef311c41..e76da038557d 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1077,6 +1077,7 @@ struct snd_soc_card {
>  	unsigned int instantiated:1;
>  	unsigned int topology_shortname_created:1;
>  	unsigned int fully_routed:1;
> +	unsigned int disable_of_route_checks:1;
>  	unsigned int probed:1;
>  	unsigned int component_chaining:1;
>  	struct device *devres_dev;
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 67bebc339148..b14a52d6f550 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2245,8 +2245,16 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  
>  	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
>  				      card->num_of_dapm_routes);
> -	if (ret < 0)
> -		goto probe_end;
> +	if (ret < 0) {
> +		if (card->disable_of_route_checks) {
> +			ret = 0;
> +			dev_info(card->dev,
> +				 "%s: disable_of_route_checks set, ignoring errors on add_routes\n",
> +				 __func__);
> +		} else {
> +			goto probe_end;
> +		}
> +	}

commit dd2395162c07 removed flag from 3 parts (core x2 / topology), but
this patch get back only one of them.

I think this flag check should be implemented in snd_soc_dapm_add_route()
itself instead of each caller, but what do you think ?

And maybe we want to use more easy-to-understand naming, like
"ignore route check", etc ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
