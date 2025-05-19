Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9814B1E72;
	Mon, 19 May 2025 01:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617323; cv=fail; b=cUk0KSWB9bn8hNp0uaS1lVYrGQQKQkB2SQ7wwWpsAUNulRQlwVBz+6O3RzVwkT6U1u7nycu6zYdGSJW/oAgtqgbLr4WFLT1CcELpEjcM5Shp2gLzOjQf9bpGU2inJa1pPAiDlvjTvoK3Lko6Syg6aUI0dN1bszxK+FgfRCIlZlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617323; c=relaxed/simple;
	bh=2H4NVw5Sv3wrYiGnABeJ+l1NY+KoHacfkrUPskkjRzM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gOHhuBthFAvJzdt0a53bcoGUDsoIIMMtIAriIUTMNUKoUDooA4+xfJGYzj/OtmfGzPxKMN05J6FNALJd0P44IFMTgRuC9/Ki3wC2H5PFRyOyXmqs9j3z9lsA2YJoYCKA/Q+pGsHtBZkLwvzwdgcZbrDXTpborL3UhvMDUKXBsvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W4txh5lE; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W4txh5lE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/z79WQtAQyt3GJslGxYXLD3wGJPKmCkFovXqYxsqIwvRQhesEmNezegwqpI1iSbVqrA0/xOo4iq74/sYR2SZkcPUrdNT6C665AtAj3JNtj03yLHkn5n+3X2/ENF0t+OemC44NsP1vW7yFAoBs1IurZtj8iuEZQ505WfOflK8gBWScUCPkItzIPRXP1H5tgLfWMJ4N7M+vC1CMhVgNRmhMMxCb8Ylc8S1nIejfKKDf2XJbKBQe5uuqmfQipjfXUJvLsPb1O4slp9gyvxFLN3vDwL0LwqKtnKezMlOf1cw85D/BIvOt9i2w63sLskSiNx7XREaDG0B4JvwLG9faJC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDWhJzQm4dFuEVHAbo4fHIyx67bEc4hu2IXM/0nbTw8=;
 b=mia+9h3PQS2zsfhgEQ3NGvGmp+WhCzodDZu0VBl/INP0nqQv+pFrFDkQ9JaHeFHZH3Ls3vYjEGhiyLeWS3PPr/8ISo84l+fD1TENHb3fV4l6iCUD45PH0e9OXD8xovg6JX3ZyKkv+OzaKtKKfh7NSFrwDgHop39N4e7guETxbCwYCcw84mi/UwYWJhX9pLmLry01pkdkhMCqhQwbj6joQhAETCKBN8N69+Bci8YEECojoAnOEtJb22lEm9+oQimPdNlgQH+mjNMF7KuSuMMZICOi6xI6OZ5jFZEa5xU4LqqMVo2oi9InSNBWKrvfuiAE07/rdnFJoFo+d6qO/rcxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDWhJzQm4dFuEVHAbo4fHIyx67bEc4hu2IXM/0nbTw8=;
 b=W4txh5lExJTYj9j5Ji8bj5kygkZhycW24RuN0HmDLGuDo1FnYlljunP/+Fg4iE/5WPit8hB4Fv9K8bk3zzEPD/L9QIOeVhbZIlk7rpAKAQ8DUxd4DmtN/J8qSY7ToKJCgVha+V4jZnY49ULiluXv7oovN2ahYqxnOrSMy6sSRiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11875.jpnprd01.prod.outlook.com
 (2603:1096:400:40c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 01:15:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 01:15:16 +0000
Message-ID: <871psls8nw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly disabled links
In-Reply-To: <0aa11ef6-4166-41d8-98bc-6c7687d10b11@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
	<20250515153128.147457-3-laurentiumihalcea111@gmail.com>
	<874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
	<0aa11ef6-4166-41d8-98bc-6c7687d10b11@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 19 May 2025 01:15:16 +0000
X-ClientProxiedBy: TYAPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11875:EE_
X-MS-Office365-Filtering-Correlation-Id: a0569c77-68ba-49ef-f4cc-08dd96729d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rMzKewBZRIpXDl+F1uQtmu/3AAhT5PeQPaxjiItgc1vU6be4ZrwC4S9UQ7m5?=
 =?us-ascii?Q?72IClrSoHzwlexFgI2XDDHu6cbaES9lgdwIKVCALsdgIqTUaGkkPes+K1e7S?=
 =?us-ascii?Q?YfVPdWB9enenuHoK8S4xmliXPmmTXupMOYrKgbWyLsiHJAgyb2MzMozSTxy2?=
 =?us-ascii?Q?dmCTbxqdw1J/pgNyX8EPnoXsjnFJO2RrHm3+wXzMGCiGZoS8IuwrFR3bQl5s?=
 =?us-ascii?Q?XTtyR0pWRXVLyQH1K9Bxh0K5FI28DDODxet0F/k02d/U3ylS4UqodSOSUITb?=
 =?us-ascii?Q?mRqcQgEjTen9knXcBgKNLN2WXDmFgWN2son7T9q5fKUx2jDle7IGBUgWonz+?=
 =?us-ascii?Q?LmGP2FzDy1I9daydKCOtDUJUkzPZk2qc8y8fscJV3aWrRObJHJvH5NqYey9D?=
 =?us-ascii?Q?0XUftvt3m/F9I+JESBfPrJ/IJjMTcft4Qt1mHkOC8IEueNJ4bUqzGF+vzt4e?=
 =?us-ascii?Q?R+qxn3TAoiIxvDZaqjIA6zmkW763QTeHHdG2OacdGNSbmlr9IVAATd2yh0To?=
 =?us-ascii?Q?QxB/fUBkgAyF5JHoW5fUuPB/qYy9AUX9KxMlGnf1kXFefPhmf3k3p9/ZeMPw?=
 =?us-ascii?Q?Q93DXPspHskyQ0t0jBiwPBXsaTdDy36cza1gHEW9ixnWCwar5uf0G2hL9mo4?=
 =?us-ascii?Q?TAHfze8MEQ+EnEbYY15mK927g6LkcBkcCYvacQPateLemw1pV/fkCD1UKUCp?=
 =?us-ascii?Q?V8WADGdJpiKNw6E7WbE5mD+YerKz6AdycBIzts0ihXi2XmlNqJE+ejkM3/n5?=
 =?us-ascii?Q?qrhOa/Nsadp1jVg12nmYUYKcnbfOH8dw2MbkRoORFKeIdwHE9rWz07tyA+1X?=
 =?us-ascii?Q?dqlSWK/wPiwzALPqFKNHa/B/dKKbyQPa8JLYtSXMU9jPW2gPRizbSxviFaa/?=
 =?us-ascii?Q?p5byjF0Av+/jQwamNjW0QQhZg9luXUPnHmSwOiqEOxPrDKbm2b5X4YK24H5h?=
 =?us-ascii?Q?P/RzAH8Kyg9LzmoRFXs9Nsdjw34SRgopOaf3B62pt6uUSQKHoLw/qIWPs0xJ?=
 =?us-ascii?Q?j6WVKwF3Hg6Lyq914TJNb7T/EvPjeH0k82EUyHO0bwZfstXNgE+hVAGKaM74?=
 =?us-ascii?Q?IlWDg47XRldWBABzAz4OvslIuFN4FDJ0uGlSPET8zANJddMV3O/hMrEABzNo?=
 =?us-ascii?Q?/wxGPHGcky3p16QOTeuWhCozCU3LVIIBDpwm4JYWwhs6CLnJfbaynP8x4QtW?=
 =?us-ascii?Q?r6G87xuwKchT4fbu3VhXsWtCMo+EFfQ2texrcejyi5Am1BZVXvoPnfpIrDES?=
 =?us-ascii?Q?Eugu1HvJBvbp6uFZhkbN2M7xqG0T+j1rwbsMIQsbVvJZR08YVMyclGCny1PP?=
 =?us-ascii?Q?1uhSGddB1XU5pYHxIY7SeGgK7DI7hgccLGmC+ZzlQVBGpMrNH9TZaKwqatNq?=
 =?us-ascii?Q?zFmvVGLjUfcYRIA96lIqmyUms7Amzgt4LJfVzJfvCC6bVAeVgZwbJrfL0l+/?=
 =?us-ascii?Q?A2w4VZYujHqnIxzhkeLuH/MQRysAFumEJfPuOxL1qF3JIR9cOYuUtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wk4VGCCP3kAX5ewuxcGfEc3aHFnEp3CWjIvK0tncbhZGM68IZeAOeeiyK9dO?=
 =?us-ascii?Q?9bRcK7LRy6+DlSXCXUkrk6Q74OgWdUsImEN7XJYlP4AzQ8KrbXMAX6IfKQ5T?=
 =?us-ascii?Q?HYFzyM2SfmzvbnE9g52xhvRoZzmt/wlcJ2Yo2Bwb7qhDWyfVC/RGJVFEF5JQ?=
 =?us-ascii?Q?ppRMgsRUq1tQdbx2lcpvUd4ibFjHPubDO8V9ba2PdTM6ocbI2eL0ydwlUrNU?=
 =?us-ascii?Q?YfUW6oCuSWeY52SiFdV+N76G0hChaEEtZT6n7up3JXFCw7vEvea6CP5ur5Hi?=
 =?us-ascii?Q?aarFB78t/wPf44cO/ucM+LryFis9hOcTs7MW5QpY1vvCm6Asgh8tGEvC+YPa?=
 =?us-ascii?Q?XemfCkcG5YHHEEUjMqDTY3OVOgmXVyoomC4LpLJyhJX9YGuVlONOR7wax1uK?=
 =?us-ascii?Q?TAZyQ15ugrrWAJQ4LJy+tAjV31YTk3S7kW4SGkGVCxIZo/4OWR7OqSn5tYOn?=
 =?us-ascii?Q?viC7a3OyBVXLrDYzjol2TF0C01jvgdAr8fV2pPlukkLToUJcUtNWb23Y/QZO?=
 =?us-ascii?Q?J4GHcM4lPOmmWwWG7AtRgditJmkXlrkMg4FJNA3FwPTUNKJxuKtCNyssoZXh?=
 =?us-ascii?Q?K64HQotYh5Jnge0TnNUdRKdKBdl1ofABHP2L5ZNdVYqjQIx7eDdxI1OKPw1/?=
 =?us-ascii?Q?HR0bocL7sIvXgULUKg1rekrFOd/NTvldry4NtwXp5hCua0a2r+D861eOn9Qu?=
 =?us-ascii?Q?1Ik9ic5BvOn9Zu3wqodmdlDsQmm4wPyqwdY6mPIUejkI0MUAgV2Ukb375dB1?=
 =?us-ascii?Q?L+bjLXv7Zk9JkRmIE9lrUu/K6I+UxNzFyKhw0vCXhdJyu96lju3QhRYu4U6q?=
 =?us-ascii?Q?1j+Io3b5PgeGv2hZCjjUGhSkM7HqwpgaCWQkn1UWVvZsDZ2tkGNzguV5RWjn?=
 =?us-ascii?Q?fQVg58cLG3YmDeSrlarsRBZJcZtrKljTYa1RbE8yFbUHuWxh3VbipzMZmw8E?=
 =?us-ascii?Q?caLleTJ8nx3kuncdrb3609/aXRDIqAXl06BznOvO0DZgmbfpQWxuHCqWYgKr?=
 =?us-ascii?Q?wYMf4HSzvpED0xDvQIcBLdxKpS8Ii9sO427D8fCUuVncP+OUt72yiyWOEiw7?=
 =?us-ascii?Q?v2vhmiWyAoOXuuP15tKmVfZvgx7ou47iNzKckG95gY8eo3EzN2qHNARUDbbf?=
 =?us-ascii?Q?mlh12IqlwI4Qhe/3/2/BYxlqTk+yLvQMSqxzyVY7p10IpZDdbcja3I0IvH4J?=
 =?us-ascii?Q?usXAOjqMV1THEkjyG9BvKvhNBm4w5RGko8rkKgu07IaKWIy833DDXfMaIBk7?=
 =?us-ascii?Q?9mtUnAA+aTOqx1Q4dRmd+25lrDy5StxGqWCO/qYfr5lovl+1YUETNMLmvxBw?=
 =?us-ascii?Q?eXxIJOqhJrUHcNVO+uhfiaDlO+4tDwMEm6M60HZHG6UKVXQimdit60jEb2KT?=
 =?us-ascii?Q?x2OhYzNXmc3Jbgik4/4C8b4x2XxBEvw8i+JZAk+tt/0kdpdjGM5tbclbW0fZ?=
 =?us-ascii?Q?L1kpGifArY7/zEmlT1Rqspm7UUr3M3TRVjcwEtOb/fIGPPd8fkv2Krh/BTkK?=
 =?us-ascii?Q?wo3RZiL9X8/pL9tTz/N9PmujT3L0ENmMjt8KyB1QKxVerSVAJ1EyEYKdZxHh?=
 =?us-ascii?Q?j4vQ0nqPfLehkI8JkdGzcyAjJX8aL0mP44GhVEc0jch9jNy84fCOW5CMf+OX?=
 =?us-ascii?Q?gqfXZL7Guw1OA8jFihTE5hc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0569c77-68ba-49ef-f4cc-08dd96729d1c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 01:15:16.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEYO4q9icFbRh2BfRNN6XcN7QdTWct1iMEKXiykus4C2iQ1SlVNoYMFngxnho4M6rMUej5jV+/04NKC+vVQE57vXQrfQpxdb7qh6jwKqg1aMPUHyQgN6sr9ZzS4Hxzbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11875


Hi Mihalcea

Thank you for clarify details.

> [snippet from base.dts]
> 
> 	my_card: card {
> 		compatible = "audio-graph-card2";
> 		links = <&l2>; /* here, we're only allowed to specify links that exist */
> 		routing = "Headphones", "C20",
> 			  "Headphones", "C21",
> 			  "Line", "C01";
> 	};
(snip)
> &my_card {
> 	/* here we're forced to also specify l2 even if this is already done
>          * in base.dts. This is because DT overlays don't support appending to
> 	 * properties.
>          */
> 	remote-endpoint = <&l0>, <&l1>, <&l2>;
> };

This is very nit pickking, but I need to confirm.
You want to indicate here is this ?

	&my_card {
-		remote-endpoint = <&l0>, <&l1>, <&l2>;
+		links = <&l0>, <&l1>, <&l2>;
	};

> &l0_ep {
> 	remote-endpoint = <&c1_ep>;
> };
> 
> &l1_ep {
> 	remote-endpoint = <&c2_ep>;
> };
> 
> c0: codec@0 {
> 	port { c0_ep: endpoint { remote-endpoint = <&l0_ep>; } };
> };
> 
> c1: codec@1 {
> 	port { c1_ep: endpoint { remote-endpoint = <&l1_ep>; } };
> };

This is also nit pickking, but I think above is wrong.
I guess you want to indicate is...

	&l0_ep {
-		remote-endpoint = <&c1_ep>;
+		remote-endpoint = <&c0_ep>;
	};

	&l1_ep {
-		remote-endpoint = <&c2_ep>;
+		remote-endpoint = <&c1_ep>;
	};


Your are indicating very confusable naming, so I want to understand
correctly as much as possible.

> >> 	CODEC A has widgets A0, A1.
> >> 	CODEC B has widgets B0, B1.
> >>
> >> 	my-card {
> >> 		compatible = "audio-graph-card2":
> >> 		label = "my-label";
> >> 		links = <&cpu0_port>, <&cpu1_port>;
> >> 		routing = "A0", "A1",
> >> 		          "B0", "B1";
> >> 	};
> >>
> >> 	CODEC A's DT node was disabled.
> >> 	CODEC B's DT node is enabled.
> >> 	CPU0's DT node is enabled.
> >> 	CPU1's DT node is enabled.
(snip)
> Assume that we also have BASE1 that is compatible with PLUGIN but
> C0 and C1 are connected to BASE1's D0 and D5. Since there's no D1-C1
> connection that means you'll have to create another DT overlay. Thus,
> the scalability of plugin.dtso decreases.
> 
> Now, for our particular case, we have BASE0 and BASE1 with the following
> DAIs and CODECS (these are physically present on the base boards):
> 
> BASE0 has DAIs D0, D1 and CODEC C0
> BASE1 has DAIs D0, D1 and CODEC C1
> 
> Both of these boards are compatible with plugin PLUGIN that has codec C2.
> The possible DAI links are:
> 
> For BASE0:
> 
> D0 <----> C0
> D1 <----> C2 (only possible with PLUGIN connected)
> 
> For BASE1:
> 
> D0 <----> C1
> D1 <----> C2 (only possible with PLUGIN connected)
> 
> Since the D1 <---> C2 connection is valid for both BASE0-PLUGIN and
> BASE1-PLUGIN combinations I think we can make do without the support
> for explicitly disabled links. But I don't think this is ideal because:

Let's avoid BASE3 case here to avoid _if_ story.
You are now indicating too many complex/cofusable situations with wrong
setting samples (D0/D1/D2..., C0/C1/C2. BASEx has no D1-C1..., etc, etc...)

I noticed that why you need to add disabled Codec routing on BASE DT ?
It is the reason why you can't detect BASE only sound card, right ?

	---- 8< ---- 8< ---- 8< ---- 8< ---- 8< ----
[snippet from base.dts]

	my_card: card {
		compatible = "audio-graph-card2";
		links = <&l2>; /* here, we're only allowed to specify links that exist */
		routing = "Headphones", "C20",
			  "Headphones", "C21",
=>			  "Line", "C01";
	};

	---- 8< ---- 8< ---- 8< ---- 8< ---- 8< ----

If my understanding was correct, your system can be indicated like below
(It is not same as your D0/D1/D2 sample, but I think same things, and
 not confusable sample)

	BASE			  PLUGIN
	+-----------------+
	| CPU0 <-> Codec0 |     +--------+
	| CPU1		  | <-> | Codec1 |
	| CPU2		  | <-> | Codec2 |
	+-----------------+     +--------+

How it works by below ?

BASE
	/*
	 * detect CPU0-Codec0 connection only
	 * Codec1/2 are disabled, but not related to BASE
	 */
	my_card: card {
		links = <&cpu0>;
		routing = "Headphone0", "Codec0"; /* for CPU0-Codec0 */
	};

PLUGIN
	/* detect all
	 * CPU0-Codec0 connection
	 * CPU1-Codec1 connection
	 * CPU2-Codec2 connection, and its routings */
	&my_card {
		links = <&cpu0>, <&cpu1>, <&cpu2>;
		routing = "Headphone0", "Codec0", /* for CPU0-Codec0 */
			  "Headphone1", "Codec1", /* for CPU1-Codec1 */
			  "Headphone2", "Codec2"; /* for CPU2-Codec2 */
	};


And/Or your situation is similar as mine (I should have noticed
about this sooner).

	d70be079c3cf34bd91e1c8f7b4bc760356c9150c
	("arm64: dts: renesas: ulcb/kf: Use multi Component sound")

	547b02f74e4ac1e7d295a6266d5bc93a647cd4ac
	("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")

	45655ec69cb954d7fa594054bec33d6d5b99f8d5
	("ASoC: soc-core.c: enable multi Component")

My board is handling above sample as 2 cards, by using "multi Component"

	BASE			  PLUGIN
	+-----------------+			^
	| CPU0 <-> Codec0 |			| Card1
	|		  |			v
	|		  |     +--------+	^
	| CPU1		  | <-> | Codec1 |	| Card2
	| CPU2		  | <-> | Codec2 |	|
	+-----------------+     +--------+	v


Thank you for your help !!

Best regards
---
Kuninori Morimoto
