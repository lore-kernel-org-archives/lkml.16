Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29441481C4;
	Fri, 16 May 2025 05:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747372756; cv=fail; b=VaaYxmZmTIAkvsWldgFEBD3YDYvD2oFZEFHXOdNM0zMzWcVda60iSyekBv16A4xBh4lQ5d9kRZoN9YV76G46OhACitWUDkmZlapusRxXELB/snAKX3OZg56q1y1RJiBTUPqpOPXf0qpCmE2sE+8W8MIzeE1uK4LhHhwRQs0LDH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747372756; c=relaxed/simple;
	bh=iTqgE7agFxADE9oRvyyHIPJfSy3ItV81DyHvMl32Py4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E4DtUj8dE3YFTJmpi0hXSucFjKISuDBKft12LIzF7EOnMI/EEU9Pk+3tunqwrun3x9F+odkbQ8iYsuzL++ens1nCNHqvR4Y3XfnIqEMqp3pdOBkmARLSwMhDfc47gvncBtNpi6uv9Qi5F5WiXosMPtd/Sg83Z8A8xAaKRVvI5p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R1BFhWHm; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R1BFhWHm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8WhZIxQyc1wCVk3G2UUotN99BEZrfBi7VwkkY29grpD8Exsq+vvF/AvJDDrInZeBzsf15v5au5MT05WoRGsPPODG7147s3nBypLJmm1XCUWNr8bo7sEpo793EpBUYzXR3k51QRC0KpycUL1rPpKPOOCtVfW5ZIxgUhtW9w7jclpE6q4lmdbZCIF9IIaWubyhnbYd/kdE+cWSpLbQWEI1gjYFe3BG3wok2NmY5S0hAaLPGC4x25w9MlsbK9XC3cfznzXNW5cn5yQcnxMh0HpB2C2mCcGmmb0VVBhGLGCWCyZH1tQ2EC/hhixjaB/xj2NxxqTVlZz1t3q9nBDXENblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZkohHQi3d6tLT99KITFG1i0qOYsoJrwOCUZZB175Vk=;
 b=t2wXcmAoqBA1g1CiSxYn+aMoQbuvbq4eca7Xlb2lGbjHBv76ImhVN5Qlygdjp3xYfwKmfaV5Ff1OCHwBq+U+WmbD+oyiZn/74asFWAQ3dkwbUqXNLHlbjz/oMt6CmcqgtSwwLEu+w+tR1wrga9UAdLSDQbQ+ygaqMU3Nw2D/iqWjENoQ0YZBDPcez0JmbRhRUCrPyFhy6wgBJ5JX6a/KXt/hJhLFnkIpbM0R/awu0qTQZGcHsADZEByNh+F5BjAKZibVVdzAWDxwtlqbOlP/HCzZtqUn//vQZI2TRfZt1uLUlX/KISb9j2EUtAKkJDZ6ObvBLoc5akmcGHJMDFOiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZkohHQi3d6tLT99KITFG1i0qOYsoJrwOCUZZB175Vk=;
 b=R1BFhWHmavK7KksYdpSDb9TxZm4Xzv8rSEBwrF8N4iZR3G4wOyJivCFOkxY3TDDCti17DC+tPmjE89EoDMLI/fP8PxEvIYsn3KtTm9/+/b/iWUbl0/Vo8Y0aANnyvV70wIHoOiMD/LidMRZSiHh95RR+iq43LYjJaWfrbTefC74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12014.jpnprd01.prod.outlook.com
 (2603:1096:400:388::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 05:19:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 05:19:10 +0000
Message-ID: <87v7q1rv3m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()
In-Reply-To: <20250516050549.407133-1-wenst@chromium.org>
References: <20250516050549.407133-1-wenst@chromium.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 05:19:09 +0000
X-ClientProxiedBy: TYCP301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12014:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f4f9c7-1fcd-4092-f60b-08dd94393040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GXhOyou5CEjGXkZcYQDkJBLvJrWLegVWOumuYyE9oFDdhw3wl7M2Li+k6U4j?=
 =?us-ascii?Q?Vdo3JoRq7Mj5ZNm1Ijo9cCvPuUU58RWYRCaARGI8CEolKa2/3CLSNwtFkBfK?=
 =?us-ascii?Q?V9HGUcVqko+nUSB4t0f28k25NWX3FpLcM4sOXZAHXWq+FYg2Jj/TxQPqcBe8?=
 =?us-ascii?Q?VGzZD+jfvxRHuGoIScWelbvM/DdYwdJXiS5U+MSyCQWvT8FGNtxqxIKypfPv?=
 =?us-ascii?Q?2Qr+IgHvTZYz0JqMi9+ZNzjLCh3k2ml4ySpnI1HnhvQ5kxpS6m1aDER8jEr7?=
 =?us-ascii?Q?PoiwX17IjHKArc1KcXbOiZhnHwl3LfQxRkeqro/D6zSLCipMsdO/rLeMFNv7?=
 =?us-ascii?Q?/a9axihf5MKfYnGQMWMMtl1WvShC0y5V59K/xfw0l/sLZVuYxpl2IGygEEkw?=
 =?us-ascii?Q?EvlLnBkT1DYEKaYn0pOwvFve+COQ1lDgZQJMTJkqnLyWJ9NgSc+UFi7lPveF?=
 =?us-ascii?Q?IvmQkPQqM46OURNoSxRXuXubyNRCLEDIkfa6UR1FG4ak1rUjdpERucM+w8XN?=
 =?us-ascii?Q?skv/Z5OuhH2AJloyAo8Ih9sAvbkDBh/aB7D42RUdP+MnFZsdlV5z0NZd9IQY?=
 =?us-ascii?Q?COoNW7CB9rvd9U5JEgtwzqZj2l4G484l2b7PlFfli2v1h4OHHORWFA9D6+TG?=
 =?us-ascii?Q?M1E1cgMTg8AIKkqf31YXC+kgGluyWL+W8ObVKu17nOz2gZAf5wN7Z6J0lH9n?=
 =?us-ascii?Q?G+cQunvyYAet/kCOq+O/69OYBgpZGcgiouQhp/M/cm50bmGEWZa6nBvVBlDp?=
 =?us-ascii?Q?SthOfXUUjQCQiBo8XEDZYtLXwgJVIzoC7rVwxVGycsbvp9ORB6mFg6V4VLeY?=
 =?us-ascii?Q?4R61+04FOg+UFSZMvfWqI6ft7BEMcNf2T9+Rm4kRtgH18mkeFs0wRPaxlPOx?=
 =?us-ascii?Q?khuzlkdBR5Mp5zIhDc4NeKes7NmT92CR4HTwOnIL7/Ba01hfhixcWW0+5R/D?=
 =?us-ascii?Q?tRQkugzSJAff4QhR+HxNEFRwVava9DycQZXxEvSAq6m37RWK7Z0tnDbFoJGc?=
 =?us-ascii?Q?hG5JMzVoCe+BoyXtgD80CX6oayEekHlMsmC549k9zj3OePHcEdl8GohB6Qpq?=
 =?us-ascii?Q?HHsTMQRqZ7Kx9tfG2l2g2VY9rvUhTZndJoUtJMdkW5Svn+r9/z/mUsLkO9kg?=
 =?us-ascii?Q?b2uVj3tLoQhk4Wi1zl+K8Rn0hmEuvVzztaj6u4wRHhCVrgWmhjdCvt/VJiM0?=
 =?us-ascii?Q?Ahsp6yDOPbwvVFU2NH9A/70wuJkmzJXdX2tObxlTvweZIxIlsZX8d54dN0SS?=
 =?us-ascii?Q?hqfX59MUNRtUQB0tcu544x9SkeClYWA0l9XYj4SvdcTquwOlhHy0xFlMSprf?=
 =?us-ascii?Q?5snkc0UVl8S2WAOWjCb3m7tUDiCv3Iz7McY30mU3n3/599x/VyFMx5JT7K03?=
 =?us-ascii?Q?2pqC6T9pykyT4KgG6qWqdXzhNDWPgg/ClqqQaUKfUny2tf8ArWcJZtJX3iMd?=
 =?us-ascii?Q?wWSqr4Sk6/MPs9dSzvOeQcJP8O0yU36Xtbw1dqQkCSALxnJtv+BLlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0CeyVlf1eJWlanbLjsUkulM6S96E5VSQM1Z61pXwLZHqOWhRffKknA6BuceS?=
 =?us-ascii?Q?HH7ZVR5SxtNgLqfvTwxfA9tEqU3pw/1myhdmgLfQqEVUFxWfFDAQWJDQQPu6?=
 =?us-ascii?Q?W3Pb5ozkONR+GjgAymf3kjGNIilRPjZc/XnyE1C7mia5sGS8J2nKXRC0Z9W+?=
 =?us-ascii?Q?aJMaMInbPWpov/MQxudf5h+/6hNe8E4OSQTnJjLJc/ihzM5OoUZ4LRc3kXfG?=
 =?us-ascii?Q?p+zDrmJAPRdgpDvi9J5Fco+m3OBzBoO82+u1jdCCEpwUQPpLLBUCAeifGGMd?=
 =?us-ascii?Q?PgFW3dORMolDCuYgfHWKzS0oQAuAaWg/qBofSzXIcpuiJcQiYLFcqzlvVOcU?=
 =?us-ascii?Q?CJlg8c9G6J8x+YVdGgrhUuiGY/jGkQgDbFP0zemTgSKU3p6LeLJMJvm+DNFQ?=
 =?us-ascii?Q?8MSdWOHVYkL/SYlSW+v+KN1UESvet7RHDMcKq4ysw3jFBy8GTQmjyduonqIG?=
 =?us-ascii?Q?uQlNdB//CPc7/mNLY25sgTX7ZyEcr5Zv92pgYwHZgipP1EdT93wMwaN14RQS?=
 =?us-ascii?Q?hB6Xiz/YjF4JdhAi+RUFArLVILypfePKygP+X8UomjkyyHylo49BQc5SFCkz?=
 =?us-ascii?Q?fpDRCLlKRLGY28lqJL5Ltg5eAnVktApTV9xljl80ILEYRrQRlKf0EKqrvt6c?=
 =?us-ascii?Q?4qLTVQLZfsHvMXmd25BAiY8FzfrOh1BRYOzoaM07bIFMcyoVIARcA9pfb4+7?=
 =?us-ascii?Q?q5HhpsfIGxuDew55mFdwasWhRYLyVRv3LJsfrxVTYQ8rOiaPlNUtF4/dhjA3?=
 =?us-ascii?Q?snE+82dRw7SxTDAwTI/1CP3VsVDEkgCUve0fNip85OvCSnsmNMsK0lB9u0C9?=
 =?us-ascii?Q?+IngilvQLiqd2N45OnVr4ID58tx34zEt2gex4F/EnEyf31QbiNK6+nE4lxMi?=
 =?us-ascii?Q?xhYcLp0IDY3QwC59BU0CKDEFL2HTbkpsZt6pyvegeyG1vZV6ta2fuPuvE18J?=
 =?us-ascii?Q?pjmC0B8vwL5fdH2jtlps/Q6JguV8ebSPH3eTjRTL5LQamvd/6c8xW0GEpJEi?=
 =?us-ascii?Q?jrfa7lQNtMIOPZUbNxClxj7pebbNDg34+U65RVQ3lrG214MX7ngOvxK1OxwK?=
 =?us-ascii?Q?n7LBxeLA0P4jMjq561qpTagRGiFSfh+U61+jGD94qnX4at59ZG5/FScT/25U?=
 =?us-ascii?Q?AG66n69SJB3EmQw7Jyg0O1XKtY4JTBOkDJlIdoojjf3M4TJAVmFU6ROcoT+C?=
 =?us-ascii?Q?QwRPnY0ljsIKvHu16Ewqpc1QenaAPX978O1D9/sNm78VoaPs6QaCFoQ0MyNv?=
 =?us-ascii?Q?Kd/Y21ivLWT4ezCbtdg55oDKOfS7z6PwPnT3plVq0WcsoKkyzeyZpVYDlR/D?=
 =?us-ascii?Q?ECy6oL8SEVsv7ArDAwnrl7DmWe2h9/lleZQGwPIMxrXJVNF9Zk6i0MaPvsXH?=
 =?us-ascii?Q?f0ynbnlsY9adscLi9fxRoXkTORZzyDwsmDfBAEueAPEX7htB0Q0dJ7ARWbLt?=
 =?us-ascii?Q?AWf17Zk/VSV+ptHr/MdoMHHd6UaGGRZebZ/IodVVh6zCyb1PokXoTFtiSYhD?=
 =?us-ascii?Q?47/XlN5CwHVRdZt+zw5ZlF56lzMeHOqaKAKeSab/MGbjxuD40vdHB3uIHZFj?=
 =?us-ascii?Q?ZWtz7bn/rXzXGf7kps8JWNMtVNsHrLYSprI9OZizJ6/m6F5+A1wLFS4kghe6?=
 =?us-ascii?Q?oKo3LnLMZJHxE1im6vUOCdI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f4f9c7-1fcd-4092-f60b-08dd94393040
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 05:19:10.1789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Anqui/sYeMieGH8JW35THWC2FPYi0P5ZQ87yw2uX16WwZsdMS0zN7wXcEk51x6vzVhivxY2gC0Jg9Be1j0Gbedfavgbv2wtdjLbOS0JVvbnUcSpxT9bnJzvbbTVHplly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12014


Hi Chen-Yu

> In the recently added snd_soc_dlc_is_dummy(), the helper uses the .name
> and .dai_name fields without checking their validity.
> 
> For .name, this field is NULL if the component is matched by .of_node
> instead. In fact, only one of these fields may be set. This caused a
> NULL pointer dereference on MediaTek MT8195 and MT8188 platforms with
> the subsequent conversion to snd_soc_dlc_is_dummy() in their machine
> drivers. The codecs are all matches through the device tree, so their
> .name fields are empty.
> 
> For .dai_name, there are cases where this field is empty, such as for
> the following component definitions:
> 
> 	#define COMP_EMPTY()                    { }
> 	#define COMP_PLATFORM(_name)            { .name = _name }
> 	#define COMP_AUX(_name)                 { .name = _name }
> 	#define COMP_CODEC_CONF(_name)          { .name = _name }
> 
> Or the single link CPU DAI case in the simple audio card family, as
> covered by simple_util_canonicalize_cpu(), in which the .dai_name
> field is explicitly cleared.
> 
> To fix this, check the validity of the fields before using them in
> string comparison.
> 
> Fixes: 3e021f3b8115 ("ASoC: soc-utils: add snd_soc_dlc_is_dummy()")
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Yes, indeed

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
