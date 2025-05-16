Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6069216602;
	Fri, 16 May 2025 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747359373; cv=fail; b=ObSXvIw7zlJ4IgJpEqjPaAZBdgSUW1zUzHeJB0bWm65eDQeQEfwXKW/FqI4Z7AI4bSXdVo5XueTHz0eWl3kiP/Qr++LQTqReiRKD0sA+yGH8NEHs4GWr1wniCPkf2s4jB4UKkhcoQkfUwcFbonSzqzZMdVcF8EP70wYjpJzn4qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747359373; c=relaxed/simple;
	bh=mxIt9xaWKGLK4zA5eHGMbwfWoT+DrbhybmDww04Es1E=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=psTqcIZDvs75L/HMGb9GYjT7esI7z8GSErUDW+hOFL2YL9nQTCF6MLfVm9wx0uXnKuhC2PfxdIjx7ri3F1RTev/H7jpvEE9GHjhBGkbnLUAzf8GyJQJ/7Jnh8Y2NtN6nsWlHfoKq455p9DKpE7uaa1799i06SqegqPRdhu+2JBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CLdwLTZ7; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CLdwLTZ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbCt8hgE8UewP9oGbhDHvi2GvTKTCTvrskL7WX59XEDZMXVC+6rsTEdMXk7Bc/m+U+o2Swh/sCEord8aJRnJ0nJ7A6Wk/A68G1aX22R3PGUThyWL0Bt5k6/3FYZIgZMvZ2KMjSMq6J9gnZ2Cz6fHorjbYmz5XqeuEQ9nIEW8LHqLUduJ42MuO8NbugmQaujghZdxLv9M/FddtEzgJzj2BGPDMLd61J/p5kGLRKeSivjHqRaGCV2CrbqnEyZ6VP6iPOmCDJrehQ6/3tSMncWZ45rpT++WWgunDq/h6Z2Xm5slR47/vscGj9HcJFArhIpmD5ZRC9lTwqGvR7P6vCx0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/7uiHgwFr1ysMWQ3LZf/ia2M5IYcDr7C4GkTkXFpvQ=;
 b=kPK60HwjcvI+JC6aVBHgGWjm7y74AWLBiiPFFgQMqg6RIWgb26y1LMeSE61l5uS67NWpiQlfve4rW47GGuOs7y2rrV23AbVYci0BjUvWwtSPbstRS0N02O1QTij8eIl4/krQ7bQXjGL1wmn2y0tY7/zNDmSO9Eohr3XtWMqB2jyKy6A6/QfBiPf+IehIJz35IKLCZeqlS55Gb5TEV5hmMQfeutNRH5NLLgYYNYLVP9GLTPXE8SqHcYd8Bk4wEwOhLuUPIwlatgVRTx9L3I1K7i2O2/3DNAR0O/uAugx/v6duyPZ3FCNwHNjLy3EN51LydDgjxc6pU4EonbSYbT/JMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/7uiHgwFr1ysMWQ3LZf/ia2M5IYcDr7C4GkTkXFpvQ=;
 b=CLdwLTZ7NK2XW2Y9/cW7rYm+eeg3mFBOKQGa53QGy7SX3TXRvDjVMW8iPKh0wzJmsDATA5Q6XduXi9VB6E3wMIec+QR8tIYVTY+wk2TSGjiQXzBfdMVc5NtS4E12vGBuzVk2zonCdhwozdhBfjm1Yw0ZFZ8nczp2MemSo0KuH38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSOPR01MB12411.jpnprd01.prod.outlook.com
 (2603:1096:604:2dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 01:36:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 01:36:04 +0000
Message-ID: <874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly disabled links
In-Reply-To: <20250515153128.147457-3-laurentiumihalcea111@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
	<20250515153128.147457-3-laurentiumihalcea111@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 01:36:04 +0000
X-ClientProxiedBy: TYAPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSOPR01MB12411:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d85d4e-a7fb-4753-39ab-08dd941a05bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fo00+Ac5Ia5OjexH43mkwnCvmEickV2kv2myZ/wZSuzI3pAmf29d/IJNaDws?=
 =?us-ascii?Q?MrCDUcmG50Tg/wKRa+HTzo32sAF9ke6/D0Y+s5HoFBLYWcDmdtP6g7AAubfQ?=
 =?us-ascii?Q?W9uGJFuEd4yugT7SBCj+a14ikDOukcBjq9kCCJGHuG9N1HNv841tFRx8Abie?=
 =?us-ascii?Q?dg4rBynxYqdoSb5l9lPg5MirpBsaqyR1PuyuP755s9dTUcCz5sFMGso9I+QO?=
 =?us-ascii?Q?jX9UV8M5hxifmU5Gs/946/c0SOEwiBBfhvgKMnCqB2ogZg9IXNAeoCBRZaDj?=
 =?us-ascii?Q?aw4VGhAIGWgqVwBfn7Np3fQZX2evsnTdCcCK+Itbcfv2Gn85bVgXlQDdHnq2?=
 =?us-ascii?Q?+oh1KrJDz2cmM3D2HpsqCAlYsoVOGgOK6PBqpp4en7aEE8Vak2II0oPdztu2?=
 =?us-ascii?Q?sItuJdAA1FW+TeL4IGjPz5ZbeJbuE8LNGjot0jNFgR6xo7HWjvxHkMD/Sar6?=
 =?us-ascii?Q?l8fYYycfDWCmM7sSoqb6AivKoyu1AyohzbA6eHhkNnU5G7wnyg2t2kSI/eaN?=
 =?us-ascii?Q?jSTXgczspDU4tRXqZABZi4Igky1EVfy+HHAKlWRZLnXpwEw15WhNF24nBmob?=
 =?us-ascii?Q?BioFmAssSLKvNSHx19UY4/0sSCY7AI3HJJv/cLcikE5qK28zYMDn2NS8m88E?=
 =?us-ascii?Q?Tq5KUynokVWeLvD8M589did/83QcYrtFS2iShxlBfXDi2O4oNWVN6Won8ZRo?=
 =?us-ascii?Q?iFQjtCc7H80H7MJepef44YMH4UDrLpbBArso/6kP3tJXwpPHMzMc0QCqF0mo?=
 =?us-ascii?Q?wOUOwX+EM++bDo9OPWCPgz047pH77W6IynXQUv0iQOx0Xjsl5pMkT9R2tlh1?=
 =?us-ascii?Q?vDlTn6LzHEriDEcWf7m5lGTXgV+ijvRD5j2rygvrWoq7tE7MXCfmTJGlYzdf?=
 =?us-ascii?Q?7yIbvTMBMto0bBh5Ga7WhTvx4atoK5NI2oSReE9US51VO2GDhCi1x4FDZwTn?=
 =?us-ascii?Q?rHTn2xGCyYrw9C5RYt2g3TdnIAqIDSz+06ZPg6Xqqg1+MH1n3buwFRypeR6C?=
 =?us-ascii?Q?PAEZ14vYpvp2t2TBtwesunm8vCJ6HrI+CNl5yPzhFWV+UcGhfGmuRjdfWJCj?=
 =?us-ascii?Q?O20nwKSLi3eHAbh5K9SDXEWb6XV+z0YnkqOdxt9vITO70ObNJVa2GtYx6iyO?=
 =?us-ascii?Q?My864MscJAl4Lk/5t6LTKJAmld6DN7e1TY9/WOARf1XFJ328RBgLkjBfpHAZ?=
 =?us-ascii?Q?iPzMNGC1aehmqzVT0EncBK0nWJaCRVXhgmxjA879J9CS2S99gssVUfL8F0Wu?=
 =?us-ascii?Q?0kkWu2tzGg+JK+qF7N2VKCOLvFE3KmqKrRXy7lQe+C9M3tb355zzgv7PpOFC?=
 =?us-ascii?Q?0K898oC7J3T3KriAHz03TeWT6eZgpoEVBDk08ZlU6WULlLMwrg/wSDTeHX8y?=
 =?us-ascii?Q?bS0uq0aIfEZ7lG/FBGtNUaEwnPKBF609gd+fzettlmV07JvqDwpuLB8HHBxV?=
 =?us-ascii?Q?/9HV6B4vwn9hb2voOuq4UoHsFxfvdXVePBqAwhjGEa0xdhUTlOzeLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RE8A4AAbUTTHAOJ8MuE2TcCOCSoAr/Uy86YTEHidQ50/94l6u0cBvP9h+r3N?=
 =?us-ascii?Q?NJeWCTGsQu6RJ5KOdTAJDOZ9oQDNlHLhLlFo94dczHaisrcd3yK3yZK46o0w?=
 =?us-ascii?Q?0r/a21gJs8V4i5Qg2r70cbe0Aoi313qhctk6CAP+LTobOk0hxBfuFb4Lok7y?=
 =?us-ascii?Q?tkADAQWgabeA+bC6KPa+f/ZOFdRUT3/sr759aY6VpUAESJ6p98/W1d87FiWI?=
 =?us-ascii?Q?fFsTHfJh31whbAPzUzJGvnAKatFUd9UownH9+CMxx0T0sG2TkmjI9/qDYHKh?=
 =?us-ascii?Q?LQhMGGK8hflMxOoU6cxzRh7Vv7JcaYel4Q7O2ifcQ492WSpGPZmdm8oe2Udm?=
 =?us-ascii?Q?NNledMYarueePASKnF2kj7FximESMCuvGtMwQ6bhDub1o3u8kCwmNARErnNJ?=
 =?us-ascii?Q?srHowUza+dpZSVOmGPaxhgHH2k/dW5RDvn3xH7Y2j1eflv4Ce5nn+H8AXg6+?=
 =?us-ascii?Q?H1Ifv9zfq2MKEOB+X7VSSfvVm2taMptfZQ1LrzmMTz1lzFVg8ON3ceXS99mf?=
 =?us-ascii?Q?Yms04DqgJzrk5Jj85ATKXmEm/ggOWhnyRkvl6U9SYFNTQmA87J6g8uVMjpzR?=
 =?us-ascii?Q?VkJDF9M2AS+mH1VLZGyhuLa6X6k0zF2fT4RmpNEbC77C/A3aLk0n1kcp4xmJ?=
 =?us-ascii?Q?U2csijMW9LftUBTKqeGbeeC1Mni51EgQPw4G3oIUwIp/E/Tq+JPn+ueFtOOY?=
 =?us-ascii?Q?2eWh5MTNx4+cB7V0J/gm62VAgiO3U0xC1g3xNqYtsYxg3w5cuzq/LUvhfyVc?=
 =?us-ascii?Q?UN7Ij7JYjxNq+Cp0SGF/oPyziQFngSSdJz9Vd5mHf/95xom1n3e9zpOvNBRf?=
 =?us-ascii?Q?pmcIqpZpXYI69fQrHVM94BoT9UkHrbzlx6nOLcUPv9DElAiuZv4Ga7hhc7Gw?=
 =?us-ascii?Q?dmEodCaaMU3K5EIPbIngYwPed2p8tv+9oLFhF4DRmz8zt2iU+Co3GzkIxnsb?=
 =?us-ascii?Q?T15hOZzwwy1AyUUjeEqJtLmeH3bBTlEzz0Imn/xtNrzhLorXpiiM8rLn93Jp?=
 =?us-ascii?Q?PIE0uhCFXNuZ9VPQD3IAptYZrnewlGi6+iFVZ9uElkZ7EdAObglpW5ROc6c1?=
 =?us-ascii?Q?xk4LTIb+f7of9HEp5IVUhBI8Y0ermBJCrch6d2IOu7FAYZTDYrcvv9CoAHsQ?=
 =?us-ascii?Q?zFChXCgERAIpr2oSYu/t5ll2SmCoDYc+wXhNdf05SNDAcTVuN18Lugd+dvH2?=
 =?us-ascii?Q?S5SCUaVAQis460Rv4raoF8j8d3vds+QnC7EXrRlUxo1+Mwnlk36Wd6a+PbGA?=
 =?us-ascii?Q?EivuK5HF48SINY/Rg7EJU5+963v1TF80fbx7bAOrnpB6c6nK+n6xHYWPLDVm?=
 =?us-ascii?Q?a7dCF210rNzOETpTXAkVv05mIH6BOWzAfbyc4ZSUGq3koWCdwmG/oXXLlx8e?=
 =?us-ascii?Q?NXhJr48hkW7hpjStOfQjxwMRQX0J5eZItTpGDSkGz5b0CuRfjBJP4QKgmfYA?=
 =?us-ascii?Q?9vtaS7UaGoCOBDzf3FsbTW4+BBWNc74Cu3bVqAHOlsp6Ar9p+Oh+JTvaE3AI?=
 =?us-ascii?Q?E48YS9ESm/U67Rz/aNapmN4gZgnBbNm/jTRssNFTp+vLZHNDXE2/D2utg3WX?=
 =?us-ascii?Q?/20phlO+Y0Mi4x2VZHinkP57TT+iRc1w4m/U9YGidYKtt9uMPTXm+LuwxM6v?=
 =?us-ascii?Q?sUdU2x7/HoeO6YdCNAwX1lI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d85d4e-a7fb-4753-39ab-08dd941a05bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 01:36:04.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yW86tejk/yqhk2b7kBPZMPdi9TgMzVSSrqHMKUjaVMRHBut0cRp9FqgUxuVxNgwfZWOF2Vmyxn0lj3TeHxg4VPThEkm2y89iTPdek8lWrDcgEZiAmYLjXgYY3aI2VMdV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12411


Hi Laurentiu

Thank you for the patch

> An explicitly disabled link is a DAI link in which one of its device
> endpoints (e.g: codec or CPU) has been disabled in the DTS via the
> "status" property. Formally speaking:
> 
> 	OF_LINK_IS_DISABLED(lnk) = OF_NODE_IS_DISABLED(dev0) ||
> 	                           OF_NODE_IS_DISABLED(dev1);
> 
> where dev0 and dev1 are the two devices (CPU/codec) that make up the
> link.
> 
> If at least one link was explicitly disabled that means DAPM routes
> passed through the OF property "routing" can fail as some widgets might
> not exist. Consider the following example:
> 
> 	CODEC A has widgets A0, A1.
> 	CODEC B has widgets B0, B1.
> 
> 	my-card {
> 		compatible = "audio-graph-card2":
> 		label = "my-label";
> 		links = <&cpu0_port>, <&cpu1_port>;
> 		routing = "A0", "A1",
> 		          "B0", "B1";
> 	};
> 
> 	CODEC A's DT node was disabled.
> 	CODEC B's DT node is enabled.
> 	CPU0's DT node is enabled.
> 	CPU1's DT node is enabled.
> 
> If CODEC A's DT node is disabled via the 'status = "disabled"' property
> that means the A0 -> A1 route cannot be created. This doesn't affect the
> B0 -> B1 route though as CODEC B was never disabled in the DT.
> 
> This is why, if any explicitly disabled link is discovered, the
> "disable_of_route_checks" flag is turned on.
> 
> If all links were explicitly disabled the sound card creation will fail.
> Otherwise, if there's at least one link which wasn't explicitly disabled
> then the sound card creation will succeed.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

I think I could understand your situation, but the solution (= this patch) is
too much complicated for me. Indeed it might detect disabled device, but some
board might want to detect it as error, unlike your case.

You want to add "disable_of_route_checks" flag to the card, right ?
How about to add new property, like "force detect xxx", or
"DAI might not be detected", etc, etc, etc...

If we can have such property, it will be more simple code.

	if (it_has_flag("force_detect_xxx")) {
		dev_info(dev, "xxx");
		card->disable_of_route_checks = 1;
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
