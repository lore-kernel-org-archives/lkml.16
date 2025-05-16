Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4621B9CD;
	Fri, 16 May 2025 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747360760; cv=fail; b=m967aVCKiwwPxtj0bdXQbwGx00NU+pNl3w+rtJbT5ur2BxWqraL1y2P+sMQJOumTvXwaYlwMwLqC6RAqB7GNZiiuBGgyA8mm2cfqFqPu5ZqChy+NeLqyYKclMdD5Qzf7CM8SDNO8EHxqn2wq/43JI5rcdbATLkVZFx/kqaca3m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747360760; c=relaxed/simple;
	bh=le/rm25COcF19I5seUqLKPxI3wU92rmALBqLhJ/EgoM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qIWVOtval7nUZyNhO8ANtgB0lw2KY5REK8jKy857BBXCa+fc3SZVFEuwC8+Qx1UfOjmFa/5KRcrPbs2NfdZhHPasacgUeZGnpBD2IiI1HkxjvM+SO8j17cp2uyBvf8pYiTRIPLrj8Mjk2RK+nQB+5u6gyT2x4d3WTpqRceAC/b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pdp8BDw3; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pdp8BDw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSVUWV91nzfudQ2TpafnuDlIG8FKcr4bAza0GC3coghNMMJWVmae5daKo9r+fDWdMU+NQ0gPq9ntHxU5u7u4wGrh5NOhMD4x+DJDX+S8AkmkD5Tl8WwpduSL4IBLz0rwiLwNU+qvc6X09X3OThrcle/5YeNDrRymJBfWwaeHnNf+pB/BUHu9P8AKZwaQpx/JmlWZf1khirCtPSKI3ThVjBmBz88fj6t7DocW+SPhiyYLm9z1hVP56dnPikbwx5HbpN5Kqu1GWUTqFMRlw5hCYMI+Wl6At94TeE+Ej/IuxBX9EIJ3xQnTQKbx4/lv8Bywn5Xek7/YNd5AxhFaokw/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahNkfriIAhTSCNFTYqL0NuklmVwEpNj8sv+kwJhKFEc=;
 b=UNhB958/3YmhsRfIfUsFdWQppjs9Ez4TFoU5x31kigLpjltoNLqn4EAXWioxOYegdKUa8fcumNxov06oUe56UnNCvJgIg+NtEGjJZbb4/cKd3cO+iCbG+dgsP4GTv6CiG2RypEwbBe4T46Gung5lPNvhn7SKk8uKYq+gD8GJaWzmfP1xJlgmdQxf0f73fhFQRZRaQA5pY/FP1YVUz4aHqaXSS7K/eYZ4TBF+bmCaccxHGZytIN8oIi/7cID2fqftPmWiBN7Bywge8G+vaHe5vF8VNBZMnyHtNZSFbGCUOv/7s7w2G2fpC7pHfNHXS8Ej+w3xr8tWRZBZ/cA6FJd/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahNkfriIAhTSCNFTYqL0NuklmVwEpNj8sv+kwJhKFEc=;
 b=Pdp8BDw3y1c+CJT21sms8sUHOoF7clbGRMoPubmhrsgabUXmQ9OHiIl8oKIbL2MAwFnhQk2m5Wmffig7ZTDZP0DxgDyiGzMAl2lwYk7Ct+6WRHorz/0QYZG6XQPFk+fDRG0sLrTyw7vFuzBBpnaoRaIqXH3hJgZDlNWhYGv7xMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10401.jpnprd01.prod.outlook.com
 (2603:1096:400:252::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 01:59:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 01:59:13 +0000
Date: Fri, 16 May 2025 10:59:12 +0900
Message-ID: <8734d5tixb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] ASoC: generic: add more sample DTSIs for audio-graph-card2
In-Reply-To: <20250515153128.147457-4-laurentiumihalcea111@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
	<20250515153128.147457-4-laurentiumihalcea111@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10401:EE_
X-MS-Office365-Filtering-Correlation-Id: 2902af71-5f09-4f4c-03ee-08dd941d41cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l+CCmt9MYVxC2R7yNt0Fc1qtAWtgay9U0+pQPn95BAyACraEcj/QuDiKYp8f?=
 =?us-ascii?Q?RPcvTLoABEqOF9ODrB79jY3izTTmea6l5teOvLE/V2y6o203IgSDh67kamR0?=
 =?us-ascii?Q?a13KRgzpML5QSKihEsYnzbdaft6dbfjLSqd4Vj/xnFhQ/t1uJgKPJ1D7ADv8?=
 =?us-ascii?Q?+zg5BWch58XN5vYtwtb8rIXVZbDO7V+YdFg93Vy7d8LcEyo88BdUOznTgapf?=
 =?us-ascii?Q?lnN1hweNvQ9o7lZhLBoJVhoDg8mpwXE5Qp20c0PC73bm5bUwl5gwoUwd1FSe?=
 =?us-ascii?Q?OEhO6RdMBm4W1E9IN+tAjIt3e42Pkug5S5MbO4YGJD/GHGDP9EYKfnJ5XsEM?=
 =?us-ascii?Q?/t7TCqGqlStxLSmak0cTdbyCG77z7DjUMMnXqE0HZ/paptNOsWsUkWxDbowU?=
 =?us-ascii?Q?zxX6NkmRCkOD5vOyhXmzsMWyD5E2/hoRC6JgKVThDidVK0l04grvMPX7wQaX?=
 =?us-ascii?Q?BmlZXvRmh4pKKbmSTVeSm5plen6jsJ11EBef91cQlSnZcUukO0RE6QaJ5Uv3?=
 =?us-ascii?Q?w4pRE2c9eCG6fvnD67dTMvb5o+6pQvQ/c2I3mEjYZib5ptEJF+mNlEXR1mab?=
 =?us-ascii?Q?pn3RITbzugBLRK3LLp/vWOxg40QrYJdTtsqVSyZmDUwC3K1R08qj+zmr7F22?=
 =?us-ascii?Q?1NMikK1S/RZM9j3+8nr6fMm13ALEzGAVQzK+I2KMD+DlfwJIXFcXfKrgDop2?=
 =?us-ascii?Q?tvJ7oiUbpoDR+ryiIk/xhG0HxoLtSiVdzy4j1fNUk8mHmq0NnQYoI747vrPc?=
 =?us-ascii?Q?R1E5FxrCMpWwnXrPfHE3QHHhaEd40NCDckyJERN4eXab82XCvoTq3wOG6Fta?=
 =?us-ascii?Q?t988jathorztzMVII4xmOY3S1hOjmElYRlqOXmQnoOwHSaOtmFBblql81geY?=
 =?us-ascii?Q?cWm1ldrJlYp8qsNE7KAEqbvzXm51aSClKOZk0o2Lax3YFu85zz8BB5pjsmOW?=
 =?us-ascii?Q?yAO3jOT0q/I5zbyX/+YGCKK2Pmo67UrNJL2ajd99GkrA+5zeeDEx4hgW/HJ0?=
 =?us-ascii?Q?oin6AvVUo/aZOrekmG15vgaCcj8zn6kINZ2XnPo82m+GS99nelGw7Errn2Wu?=
 =?us-ascii?Q?euu3O8dT0IYi9FusHZKNqmDzAKR0s/rK7sJoDn5Ky6p4mAUdDHAGWdQtJPvS?=
 =?us-ascii?Q?8NByEdnmh7FqrbEzCaVnN++z0PE69Ve+2U5sVP/SPAHA1lnvzqCV+99L8hdh?=
 =?us-ascii?Q?IQBmP1akLbAnnNZ0AvgFRAwG6Fm5KnXcsNg6hy3C4bUvgIP5ULkVugza92jo?=
 =?us-ascii?Q?+Vy04DlGdIEbIyy9l5oEODF+dkaztlKVQ/6GhfuoDI3eQtQ2S9YTrcCJdGrq?=
 =?us-ascii?Q?Wsd00QSDNJd9a2Qq2JdvYpSbfkZmB8arkTFO8QkiR2ckVGeV0YrQeQI2VvLk?=
 =?us-ascii?Q?BsOuF9P5LZh4+D3qbLAKTD+bhrGA/50gYSAJUGPQEYp7PJGI5CfCr/WEj4n1?=
 =?us-ascii?Q?gwzlSyU3jTMnsl0z2C927ceGYWWbr4nEQKXM5oq8OP4eqDiuNJTyoQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pZ1HED+WrAGpAi5di9MYpTysAjlCvW52UbJXDG5CU23W9P47cP6hcLNcK1Xt?=
 =?us-ascii?Q?VJByIO9WTQxXddjj95Z1Ql7NdKXyCpWlbGUrCt0ngJOt3mhsJUei5Zyx088e?=
 =?us-ascii?Q?gRKwFaOqq66VJ2gJoGRUCDlfFdkV4Q4icjIN7qocAdypg5sxWCR9yXjZ+Kuf?=
 =?us-ascii?Q?qsyBSpjESsgkMGHYGiRoq44PyNozF3sRpqF/OlxHfwPuKUFFd+w8R9ZV7rJr?=
 =?us-ascii?Q?BGygNIy5bm7rxKMd9uRLsru4aRgJKyK9VBEqSzn6GESajyRubfNlJVa8I/Q6?=
 =?us-ascii?Q?/g6jCBliwYCe0Ks8xTM6cDm1bRflLffSxobS5wD7KBeNdF0vu9nnAElgoyPq?=
 =?us-ascii?Q?mk3dBM3uG7uamDwEe/tpPg1moZhijizp0HCa1Kt73mESzF8mwamw+Pt3JSxK?=
 =?us-ascii?Q?qMlG3EtY8eNi83iFXmYTta0CDMPoQc99MfSJowsKhS4mHbrFk3JHB5jXrrGm?=
 =?us-ascii?Q?Ojj+BWpGyb8sY46CWlzrFmh6NFcTjAPxV5e7bMtut8pQwkm/mtAx1zm8nE0I?=
 =?us-ascii?Q?SkdlrhxDOHj3T2E23uICYzDtjGEIwx/DXsAsqmKbbb7ohtz7+UQo6fr51xN2?=
 =?us-ascii?Q?YJSNxnryjAwZR5jR9DP5hnoqghBksE2t2DUhKJqPZGajXIds7ygkkoErP2aF?=
 =?us-ascii?Q?whZNLGAvOnnRmF2Mqr3UkSVvGN1v5CtZL8mwLYwCl3GwfDZfIBfNXQS7ri20?=
 =?us-ascii?Q?C02Uo74yYMMN062xUf76J30kf0vSrYT5n12Llj37jFg75ymmF6woSqNXgqys?=
 =?us-ascii?Q?Z+OJekujEO28ZfNNF6n64yoEh41cOcOOH28ykk9z1lVv/WXGQoMV97MKfaj4?=
 =?us-ascii?Q?UHXEBlSZmAFE6OzmmSdHOpoTP2bj+Pit/k6A0vK76mjcGwqchGnyqZqyxMcl?=
 =?us-ascii?Q?H6epESoSAC2quc97go0TJK9uXm6ZI0Udb9sN7SfdGRc6/RgZ0fmktBIsxv8L?=
 =?us-ascii?Q?w6sATtmCQ2YOmwPRP4t35+dt9eVciveIg+AEIYRpZ6lMkJ581iLjdjVk8BdW?=
 =?us-ascii?Q?zw8IgS3bYcMHMDhQ70F0sXPXAmqKobOZcPqE5M42W0blvtYzY7PiyhlD8kQl?=
 =?us-ascii?Q?49bzUKlfp8/4hHKidVbR6qFVs01WOWcfCzK+LEcJYs9qyAx/cXdon6VSFg8Y?=
 =?us-ascii?Q?6u+Gka4NZF4AvbTlAfQQSHPWvrzC45dIbtZW1lLcfiiXHqtFr/dQS7tY9QJs?=
 =?us-ascii?Q?7SQO61mu5ccm5dxbIWJHNW8rNcD6Vd02o6K2ZiGlH1XbL+2CFHQo0QU4AXfp?=
 =?us-ascii?Q?+orXkrOlKRE8wwbHdkOzMdj+h3HiIbhmc1FoOyxXm3Mc7fJsDWGK9frg8pSk?=
 =?us-ascii?Q?DEtNqmnLoWhXttHP84PnnfOUSqicn267jpe/g0QiHxUxVD1yHekdGjdjvdf1?=
 =?us-ascii?Q?H7F0I0wgPZcpnFjuwsTiRJHyOpSPjpVI+PEWTXAKrQGcjA5gSL43uHWLalR+?=
 =?us-ascii?Q?4C37NgLrws55RDLoYss1YjALR7g5vZbAHzHFfx3UgHGDA6kAhqvGWDEWhCt9?=
 =?us-ascii?Q?boPAMWeBcHYqMR+djptLX+9edUGvaGpIDR27OPfJk6EBuCsMFz2Ie+3ZDqjY?=
 =?us-ascii?Q?LaZAcjCtI8ONCAv1h9/GLAtzFdlOCjBzJC57yhRouV2AO6fDS8zLTuvLJzPA?=
 =?us-ascii?Q?boFulMCfYNAeNSfkX/olUdk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2902af71-5f09-4f4c-03ee-08dd941d41cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 01:59:13.7002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QESLRtSOL8h1XE45g0s0waV/Kzqm7vlMjG/TSqsugCxTPLhWQuP7HTFApvK2TFYxNHK6Z2xoKXLDXjVAaKVmnqcPZWNsTnlVJgwPM3+E0psJI9+eTcnSs+0rNcp2Xgnx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10401


Hi Laurentiu

Thank you for caring sample dtsi

> Add some more audio-graph-card2 sample DTSIs meant to aid in testing
> the driver's capability to parse explicitly disabled links. To conclude
> that the feature works correctly, all audio-graph-card2 samples need to
> work as expected. This includes the custom ones:
> 
> 	1) audio-graph-card2-custom-sample1.dtsi
> 	2) audio-graph-card2-custom-sample2.dtsi
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../generic/audio-graph-card2-sample1.dtsi    | 278 ++++++
>  .../generic/audio-graph-card2-sample2.dtsi    | 878 ++++++++++++++++++
>  .../generic/audio-graph-card2-sample3.dtsi    | 486 ++++++++++

This is not a "audio graph card2 sample", but a "disable_of_route_checks"
sample, I think.

I wonder can we re-use existing sample dtsi, like below ??

	/*
	 * Sample of disable_of_route_checks
	 */
	#include "..../audio-graph-card2-custom-sample1.dtsi"
	
	&audio-graph-card2-custom-sample-1 {
		force_detect_xxx;
	};

	&test_codec_1 {
		status = "disabled";
	};


Indeed current existing sample is using single Codec or CPU which have
many DAIs. So can't enable/disable each detail DAIs, like your patch did.
If it was not good for you, may be we can separate ?

	test_codec_1 {
		...
-		port@X { ... };
-		port@Y { ... };
	}

	test_codec_2 {
		...
+		port@X { ... };
+		port@Y { ... };
	}

&test_codec_2 {
	status = "disabled";
};


Thank you for your help !!

Best regards
---
Kuninori Morimoto
