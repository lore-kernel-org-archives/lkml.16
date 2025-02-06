Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C66D2417EF;
	Thu,  6 Feb 2025 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884658; cv=fail; b=l4m5qP9tXZECa2i1V+pklFjkKBgqHTcpwnCYAxG4NT556TAIIYTJSrTPt/EGbvFHJ9vU3+fpi/dMSuAw39ZPSMUmRuONjwwDrwyzcHtQEho4N84CRjvd+lWe3ik9wZwCn/rZI/mzLMVjLeinilDBMF7eRqt82d+co4YYdZeWVRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884658; c=relaxed/simple;
	bh=vZTTXT2U+12pgKelODpBrlEONNiLoURjWi4y9IHyrxk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NzaVuj+MI96I7x3aUc6iLJEsWEvRhyFysro+HuRjP2wlNe8Vwhwz8Qd7GVtzAjizpFfhYFpr2CLi2LQzED+LnvnX15fpEzORLXTXJULfAnfIWb6ri81lUvB1yNagMeWqQPcFsJIltMYd+jX+Iw7YXEEfJS9B1iI27xDVlu6utTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cy0b+ATZ; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cy0b+ATZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQINpaKOsjIdPYzoBsIxop3RwkVOBIV0t7oSjrYeyqQQTgomXCLP91Jgp2F2IZd4+wHz5pt0zK7CCCkb07N46rvX8lHyNNezMuN1WhaYgSjsaCOQGpKgOuVxaXkdBZ72EklYELKSZvy+F1GUXd05ddEoIyK51K6gWnmSvvLTIeULT2Xxqyk1EaQ5zS0P787xytNhnSFNjMDW4gMOUhtHGfEQLOqlbYO6ynsga97lgYI6rNqS8fcTtF1kngRzwtQrTnxgpOCKO7Li+UiUZy7ohloCf9c9ASgYa52JANf7NUkPxy4rNvIMcudAe2h6K6+Ro0i1ErkfX56xFlN9vf3mTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFqttdw7Ym2+iqTF0keUos5ySf2BNW5nGTpT8lMnNEA=;
 b=npCPO/9XhO2sSsNn3nRP9r358Rm2gxlxt/g4Tw0m9VIoR/u+vJUArBZD1GqEIFrmnMpRNC73bmTkCfvO86Tv3rU09SmHT88fZfwydRrApPaYQ9obR/Au7WV/tD9OYPMKEK46dzkGD0FYG4uYJ/n/DDf3D9kQeG0MEAR2L749rRFLEcQEp/6KliVRZc9VcZs9R9Gt20SJxnGYJzwbTIG4sKz2gi7h7og3gCTCAaVnjKoFg5HaMv7Tb6YJLq8cF+mQcmHXeP0jsI/XOwI02arnspURwoANgpCn0byQy4tyadF7/2XY3tsc4kql40eiR8pTJfRzVp5tVWNJDlqxccmVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFqttdw7Ym2+iqTF0keUos5ySf2BNW5nGTpT8lMnNEA=;
 b=Cy0b+ATZXC+7US7wGI+tM9IfO/dmPuCIX2VNepVIce9/DzoZAnMOmI7cYDKPcVogSD592Q8EOQKKa037Kqa72sGr8YoFCgkBLFmqmmCiWFGtXgmHSWwJpqx55oIuBUloOTNHpB0QgvqqEOv1N5+C2ZQPTwcCZE/s8bzWjklQKWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13990.jpnprd01.prod.outlook.com
 (2603:1096:405:19e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Thu, 6 Feb
 2025 23:30:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Thu, 6 Feb 2025
 23:30:51 +0000
Message-ID: <87wme2irbo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: always find dlc using result of graph_get_dai_id()
In-Reply-To: <20250206161831.2519-1-laurentiumihalcea111@gmail.com>
References: <20250206161831.2519-1-laurentiumihalcea111@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Feb 2025 23:30:51 +0000
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13990:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c543541-2be1-4347-ecb3-08dd47064b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nDrvtfJbJrV5AaWJHpdK16o8uJC4pvWnYtZnWNllKO6IfMMo+RdFNqKBamTi?=
 =?us-ascii?Q?afc1MSavFoAQ+53YbK2RJi4YFWJGiw6ONw60Ph8GeGZUWhOEVsL1g8OQms6D?=
 =?us-ascii?Q?yIFBieLJn/vnVKAxX3RGIREGTMsyoMXN+7c3cC4CmNNrimI/zOpuPrBUKU+7?=
 =?us-ascii?Q?ieb6Zhf6Ur70ch1zQplN+pSe5h2Hzp8e7VcVSCRcTHcRDZe3KDfnfl9jUlqk?=
 =?us-ascii?Q?mBqdhr3PP/xDM0hOHWEvrxdAxAVV/FSHZv/G0N1CJL+06l2RWomewYwK14R1?=
 =?us-ascii?Q?ZlKhjwuZ+KiJAwcV3rD446hUA9SFqGYkvxCS7ctDfDm0XBCbd5qfcb+ubfkD?=
 =?us-ascii?Q?0FyuMMZHXaIZHlEACvpEcV7qahMAVsBjtypGyied1gSn0C57SWO1R9Ezixz7?=
 =?us-ascii?Q?n/CeIDWKCRDFzu4U/6eJM46qmO5a7WtYuocd1JyK/dPRNNJxxYlWucBQveww?=
 =?us-ascii?Q?pmQMC2fDMbIl1x7tqqY/+r8on0Evv5+H8LweptafHfo3L4wyyAjaCdvHbiXl?=
 =?us-ascii?Q?BZWjEFpaBPuPZC2KHn7/mwq9UNguh9fhj9ZcLsCyAFgFZmDRHShcSNtNsoFA?=
 =?us-ascii?Q?JKdqRwH5Ju/nnI2SI1C07kV5Le6hKH/FCsaJ3TcPJYE7BzWzQvt4gsxVjHTg?=
 =?us-ascii?Q?uLAPvp2g7Te5SleZVJZ/HITSjQrIFrjNxt2WjCtJcN1trGbx4CgZLK5gxDNQ?=
 =?us-ascii?Q?RE3t56LZ9Vj5wsw6mQDqFiFkh05994epNRab3fgBzhF/Wy00MRCct+WNPOwn?=
 =?us-ascii?Q?wbiG+eYfl0kA1knzwzT1KzALyYJZl9LJIgUcOEN9jssXDiMfJAR55rTH1/fG?=
 =?us-ascii?Q?1/SNAZ5+p4PzG4+CBsmmt1+LZUQAUJySL698lKQ89mrqjRlaewwdInfNmj2/?=
 =?us-ascii?Q?fsaAWrBZ3dIn3WPS0kacXXCHVJXx+WAGm2XlcPBu/sQp2YfV7/1vcR5zSVwc?=
 =?us-ascii?Q?BIeFJJG3fitIEimlK6y5AfJETDrTvI6XRHNg58tOcpO19flRoPBJ5pLPTHhr?=
 =?us-ascii?Q?EUUj+1SizxXLDojakore+4/8/xFFeQFYpRMjTPuy/q5NRJO+nVVmncstiTDx?=
 =?us-ascii?Q?nYbCY73Wmxo6/QQaEdTsRRQkRDkCCQCagZlRdjPa6B8YC25SEDCspHcBiu/M?=
 =?us-ascii?Q?SPpKO3b1mM5jfPvG3cqPOwWhdwNtZbJMrrSwcQGhIFRUChloK9wdTMMrviGk?=
 =?us-ascii?Q?korWCWuCeEnmfTuaXltBdiqYnaV/TcD1E1dKjPZe4XNDZXjubUVRivFr1mSK?=
 =?us-ascii?Q?q4GsE/NUdwAWbucCHruu0MEI1Rg0/s1PWhDa/4azsAabXGPG7nhgtyPtdHHR?=
 =?us-ascii?Q?wP85a7O1q8eVpJCIQLytYKXDfzRv/ovn/WPtefhOjPZS655yTotr9gFT38cl?=
 =?us-ascii?Q?+Vwc6xgLV9hteuSWwhPOsV0sBkfY5xx+sOmWGKH/5AhjcC1XuCriFMdoA2oC?=
 =?us-ascii?Q?kJXc+MZDrqVwtw/r9fOpDddV/2bAhLvr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gfOOVXnIpuA6gIAsIbcanLspmR1p9jwvW3nHaxcEQsCSzq6dftjjsXxJCciy?=
 =?us-ascii?Q?10KnZELzzCW1+4nwe8HfCzaWBoV11m8jsTX8DwICTJzqZ5sC3hexZuiJyfbT?=
 =?us-ascii?Q?IK/FcVasqo//sCmRHT5nIl+yQXXZvg2+q4rtKm0V6UsgoNq+tzCteKhc0hm/?=
 =?us-ascii?Q?TogMGCW59gaMSAU8PaEl+69/ceuKCbd5/urMSlglhFAR0tFavIEZioIyCAa/?=
 =?us-ascii?Q?vFEDBrdH0TgnsVsjY7ND+eHSIyS2eYIwBQ2XB6t2N7CpojJ4CUIlzrHfB3FM?=
 =?us-ascii?Q?GG/eFjHmVMpKk41Iw3LlGm7OD/edxoZ8jHMuA5dcJi6WHn4dGGVkCObd3AjH?=
 =?us-ascii?Q?IMWhi4xuJAgCXL18H7wrsa1eZSLuGiMrWxsNVefNZTtGxZb0XgCWE/sxW1jA?=
 =?us-ascii?Q?5OUUnSivMST37ZVbSFeIxVuzcWZhzq2UopKmr/rJ5lKvDn1ZqPYrRRZ7v4ZM?=
 =?us-ascii?Q?J+gr2U4eBTwAPJxDmrCQj6JwUUZhioxvmj1Ay84tynhOvBWcpVVEmbXqYP8Z?=
 =?us-ascii?Q?ONLGSGWlXpcZjY24ZHX2S7kbvJig/wY95FRY/9Q0pCeGqPWZV41inWjEMcH+?=
 =?us-ascii?Q?VmOP3fneOklDoRy9iPxWfbxeR6gpHWG9y5jOguUrqfHlvOZVp00QjYuO7Wg8?=
 =?us-ascii?Q?sRipQx8ho27a6J6mCcQ0lVZhsBKWMTGV7One6rnUO38A+Ewh/3L/83ZoM/xS?=
 =?us-ascii?Q?FGGK3YP+hQ/UkBB9NZ8O5JqEH5QoOeBeNvXfFKP99lojRE4SOXHY9Trlz9LI?=
 =?us-ascii?Q?MQXjk4T7svHaSFxVhBhha/q0OYzpwxhHmpZwTdWNBTrDz6PzjREJ7gd0cuRp?=
 =?us-ascii?Q?BLvsywgsxdG00U4aicOYlbEtjwtKxLcbGsyFcotIYVkO5R5ft7vlpLi6DvqA?=
 =?us-ascii?Q?fAjQGEOLScZlltd+ycPtNNv5gW1mnmaaq8vBI4p4R3y+tvwzIE9BagWuMNDc?=
 =?us-ascii?Q?sMuTvuG/EeZySFB823qbHIijHK54oOdxNbRfdWxZD7BvYrCkie7LI30W4fYu?=
 =?us-ascii?Q?or8JAm9U/edOpPl9VaBbsJsa3vP7LFaDkwvXvuqMgNtXaHHekJnCPvkd8VeX?=
 =?us-ascii?Q?Qhgg3/5ciE0pi6LzWJg3BJ6QfZZoLOKJNEVTlWI4kXBa2NaAqbhCpEtzatJF?=
 =?us-ascii?Q?cPnvgpdBgifMqBMtywBJx8Wz8U67PUNVa2G+BXQZ0Q9KB/N8IyAXpFtAAnap?=
 =?us-ascii?Q?g7/+dWfNwsDdBkudsMoaIL+Wtn+ciJ67FwzMJvebQMfwxIgXYGGxRmqHcVyb?=
 =?us-ascii?Q?TkKdl2SmAukSKBodlUGMqf07qJ699znnQEKNAfGS6Zm8riJnAaBQOQlq/K/w?=
 =?us-ascii?Q?xvvQvG+bp8uE9h5OYM0npAxh4TviKP9ebrFNOirp/iLb2NntwWU0UnYAbyL7?=
 =?us-ascii?Q?+ZE8njThEt9MXzjQm6SkcQ4OI+8rAEzZSbpn3ZO4TNfQiVf9CmALgMIaL51Z?=
 =?us-ascii?Q?kIvSVcRV4QBtVWsGwuuyqZiR+pTumRyled1MOswrdhhGP9bt8h9F8WTEgxof?=
 =?us-ascii?Q?XPwD5MpX243Crh0Kv+psvlzsk/1zzZiLR36rN3VKeOdGoNXXDoEXUg6PkLme?=
 =?us-ascii?Q?eZcf2KKVAkhBpwii4sPjZhm9EiABVZRGuIRaYLKLyeBJjeely+l8w8IE2FZW?=
 =?us-ascii?Q?sb5T0LhAtkBn7kW2rkTZjZI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c543541-2be1-4347-ecb3-08dd47064b74
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 23:30:51.9244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2VK+0ym+6N/ysjzXmW21xnppFlq7xm25zsuOzcNRWKe/bu39k8FkByyoPwjAQxPlt8uizKnwjZPeR7Eag0zbNURoNNxRDulqbDU+6vMqxpYHvn6fxT9dE0YVW2ol/bV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13990


Hi Laurentiu

Thank you for the patch


> If the number of ports is 1, the DAI name will be the one corresponding
> to dai_drv[0]. If ARRAY_SIZE(dai_drv) > 1, this means users are forced
> to specify all ports corresponding to the DAIs. For instance:
> 
> 	(it is assumed that ARRAY_SIZE(dai_drv) is 2)
> 
> 	[snippet taken from DTS]
> 	dai: my_dai@cafecafe {
> 		/* some more properties go here */
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 				endpoint {
> 					/* specify remote here */
> 				};
> 			};
> 
> 			port@1 {
> 				reg = <1>;
> 				endpoint {
> 					/* specify remote here */
> 				};
> 			};
> 		};
> 	};
> 	[/snippet taken from DTS]
> 
> This is problematic when users don't want to connect all ports. In the
> above example, we're forced to specify all ports even if we want to
> "connect" only port@1, for instance, to a remote endpoint.
> 
> Generally speaking, assuming that ARRAY_SIZE(dai_drv) is N, and we want to
> connect a single port: i, we'd need to specify at least two ports in the
> DTS so that "of_graph_get_endpoint_count(node) > 1" is evaluated to true
> and the ID resulting from "graph_get_dai_id()" is taken into account.

?? I think this is not a issue ?


> Fix this by always using 1 as the number of arguments passed to
> snd_soc_get_dlc(). This way, snd_soc_get_dlc() will use the ID computed
> by graph_get_dai_id(), which takes the value of the 'reg' property into
> account if specified.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  sound/soc/generic/simple-card-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index dd414634b4ac..a592617e1b0e 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -1103,7 +1103,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
>  	/* Get dai->name */
>  	args.np		= node;
>  	args.args[0]	= graph_get_dai_id(ep);
> -	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
> +	args.args_count = 1;
>  
>  	/*
>  	 * FIXME

It breaks existing many drivers / connections.

And I'm not 100% understand the situation.
Can I confirm ? your HW has N ports/DAIs, but want to use 2nd
port/DAI only for example. It is OK so far.
But you want to indicate only 1 port (= 2nd port) on DT,
and, your driver registers N DAI drivers anyway ?

If my assumption was correct, why you don't indicate N ports in DT ?
You need to do is not hack to utils, but update your driver to match
DT count and register driver count ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto
