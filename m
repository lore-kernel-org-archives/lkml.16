Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F990139D;
	Thu, 22 May 2025 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747876800; cv=fail; b=JhnfYWAl7yS6+h8JzkX5ISFm/LrVHGOkViQo8sqC3d6euZCOf5vI4GPphCJlWle0kKy4mlr9mTY96x2+SAk5EXvbgiFlqoNGC0cO3Nad+WvIcm7/xHYtc1RZT/QJmtEiIx07WsIfmoirEA0qwJeF6Ix7D07ZRaIs9ZFWAecB54w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747876800; c=relaxed/simple;
	bh=heu1SFJXPA8KpD4bFwd05Qy2h2py0NgBI0TffPT/sv8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BlO/Lzl+sQiwIXkEu/Esyb9d5q0hNTOh8suCXFyIvSC9paxV2Jzgm4UbiGlxoOTz2a8XCyHDJ/LdoDWj9v1mbPepD7ClFDcY9vz2en64VIzCGFR0m4LeqPDIUJcCvqwJp2Pcgpycs9NDn3+/VcHPPE0vpwgUVpFJh+/vPi2ey1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IvMy0yZU; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IvMy0yZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX4QjGiPj4JBZoopBBEOQ7W+lqcGt7s0z/M1EMYxxE/DmP66MKm3Y5bsGF+jbS4ll1KQxmby50Bht6JFaHeYHNSiTHZuKnc58723Do+IVLrOX+xtLiIg7kE2Lon6dEQkj2Z/kaThCyUxTieVarM61+MHt9PKuf1p8cvJrQbP11UUTrAJNOXHKmc2V3xDCrIKYtIoJyRfLZrchLy2dysq/cTn525K7pg+z2G6S3owIXqLyXGZN1Awjf8/18dszpBSoeOEvygPgSWvAE33pXyKfBNFPjsq6dmg72olxn4HXfMT7GlZZTh8TX9RKjFaA8IpPRO4P/CEQqxRC1HQqNX/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTfbdHWPHf+MMaBvC7wg24TAwTLeVepHhHvAG2Zt8Og=;
 b=DUZVRGdVojjWbxfOyGM8ZIoSQBjBB052PTPDC0JdNMEzaHo0qYZKG06e7V+Sfm3tk/uEZEvz9QJgayqSMyLzIF1N2PviYJyplMg6A1dT6dUoyP+9kNebCzGqO9WDMKGgZi4ge5tZJJtMgFF/i3eylLz0pmn9t88d3kO7S70ngliHjoarKZsniMMm9Wx4ckHwa2pQLP+wef2s0tMIRLys36gjhWUYgTWRXqdppB7kDu+qV0Zue/osOvce7f9xo/QdRvxqvQ2YerNIChdjqneU3unTYL1+8RdrCrASl4YyToYHMTf68XpI+862zbQKH507jfk43P4bvyZTvjRTaFki4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTfbdHWPHf+MMaBvC7wg24TAwTLeVepHhHvAG2Zt8Og=;
 b=IvMy0yZUviApf9zkQMtqE3d/iSajYrJWvhLXyDidy6y0f9k/wyiDmgbCBcNchBevWMLn+aefekGTM8Rn9Ltv5ajTYOAQlmUMuhlbGAnr/Y80YYeO+tUPEWijZ/TPkBipy1cft/kuWUs1esMXs/GdUhX/S9hkdWaj10KqvyxYARQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7018.jpnprd01.prod.outlook.com
 (2603:1096:604:13a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 01:19:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 01:19:55 +0000
Message-ID: <87a575o30l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly disabled links
In-Reply-To: <fc2cbb54-58aa-4362-9b84-20df510b9038@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
	<20250515153128.147457-3-laurentiumihalcea111@gmail.com>
	<874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
	<0aa11ef6-4166-41d8-98bc-6c7687d10b11@gmail.com>
	<871psls8nw.wl-kuninori.morimoto.gx@renesas.com>
	<e6d88cbc-accb-4423-80e4-3972766047f4@gmail.com>
	<87o6vonmjw.wl-kuninori.morimoto.gx@renesas.com>
	<fc2cbb54-58aa-4362-9b84-20df510b9038@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 22 May 2025 01:19:55 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: 794ccd0b-289e-4651-fe69-08dd98cec28b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M74t7snH/SDawREzLiMy2eWMqtqWstUGIv/XAqIP0XQitU9Su8friSjakfr0?=
 =?us-ascii?Q?a5pSu5q27ZgOQHsVkBJajDd0Vb/+yFKBI1oA8Uj+usy2w4fs4z0wJn5BSXQc?=
 =?us-ascii?Q?DGtQV6dhrkN/RV/lGjZavF8A1nF/6siAWnndb06cfwrptzgdIRJSK+hWB75Y?=
 =?us-ascii?Q?/aWShMpPNFe/O+1S7e4NrVo/zjBMG+F8HwtFPD5y8GsTR+hvYrgU21NyOgF1?=
 =?us-ascii?Q?bVV10ZnUHb7Bgbn/iBUqtrmG1Tt7C+ooSBJBgStqv21JjY5PliNZDLXRc/yB?=
 =?us-ascii?Q?2lAaai7LRA+DthKrr3k88TQJ+37Qw9Ey8I/1bDgW7xOh/yuvVBgFMz5XUvRf?=
 =?us-ascii?Q?c/XH/gV8slxPbDQs+u7UcfO/ENIZ/kvTL5i6lmWU7Ks1v4NrqgAoboyYqAOC?=
 =?us-ascii?Q?BglmKF34GNi2ulQWQXASciiYA76qkhILJtikG8Uay4NlvoXKinHdDC8WZwVv?=
 =?us-ascii?Q?gmHFNRY532UV62DKpjtQ4JvSrXZZOhpyofSYWpK9KohHVQtXqx2WOevIffuc?=
 =?us-ascii?Q?E9CabUPuu3TuC3n8ZXcDnyZvVbh643kJ+8ehPbCm0fdzcVYsP4f7tgVM7MyY?=
 =?us-ascii?Q?G3ACthRmtkooETTc4uUETkZL6h+UWYtDgqowFcB7+gXGVF4fXUfHWA1JHUAz?=
 =?us-ascii?Q?35x69X3K9+OaH3ntI4npUlRzP7tg3KFg3/rUrkW5FVMO2xln1LVd4HosAnry?=
 =?us-ascii?Q?pX8mBlFyll7dClQHVXxlBtBQNzkct+uWrzRmFLdjPFwYA9v/4kSmRyKCZvff?=
 =?us-ascii?Q?h+dzmtWPXGf7LWI08hbkl7bLlpBDMleu/w+emvAMdw1BjFqKnhHIwu0usytP?=
 =?us-ascii?Q?K+bAOAU09prXdtyy3tCyAvnTSze1Iv/wr97FQRcg4gEZQxFYo8noDu9ytZMF?=
 =?us-ascii?Q?BxDNKg9yxc1aMeYmAbNIr6Rk9c6ffxOmnKZd7bnzf5IUlIk4B+/ygYcjtAsY?=
 =?us-ascii?Q?YspswCDJyFpRpbo5O8VSotw/AtYSkwQmbAT/ccIkWn/+i5WdWRisKovl/Af2?=
 =?us-ascii?Q?CJFYgll8LfqVEQGYlsSDqOx3hnu1t156LQLZ66AwRVz5iNDsKjh9ykSKhg8N?=
 =?us-ascii?Q?gEs2sQzI41q3S5FsOOR/prXYEaaksjk1ahbyjKARTQLIH5r/Q9WhpeBeER9b?=
 =?us-ascii?Q?liTT8n85WhY9UEIFxdi0qBKlWCswDkOh3YS3gNaqOegwQL4p0EKj3yuPQxj8?=
 =?us-ascii?Q?y3qSVvfvju5tJenES8KGxYBWdOuhEyBzZLMAx+Yq88C1SkUKAZ1/yFmnV9kJ?=
 =?us-ascii?Q?lm50HDGtFBPxlu2pSUPDakbit56iixAG45nlwuyWegc1kaK2fwNoB2wY09qt?=
 =?us-ascii?Q?79D02Xv1kEsB90zrbt7OOV1VcsdIZLgnHYWk+TOYMXGD9YejVIBe4MM5iNqC?=
 =?us-ascii?Q?ggdfsWIkdN2e7TDVRcyxYLxjPTuUF38B3xtlBPj2uLWLtVZmAkOoptPUjIjc?=
 =?us-ascii?Q?g/lehk/y3eBcQdywuHgTqgWClNgnwRNvHzuAHRKW5HCsk7bJhMABgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7wEcHA/qc/GTW/46WlOFqC4OtvNuD0hBVjaLBIWTLkwt/YHdpfUdnNJk5OzS?=
 =?us-ascii?Q?GLIFcJIQ4tGSbCm8s+fUsjSnSXFmTizH/3FqtmMFCPN0aGETsaWvxJHT1Ibi?=
 =?us-ascii?Q?ORv4BEei1imdmUUvYIamNbGmTUIo8fzMy8YR7CqbhOf9Il6iSJZU5+dD0PtG?=
 =?us-ascii?Q?ZuADBU5aWfRmvSFiFtb396+CgEsHp4hh3gJJNA+pVKfJMHKjzACjxisBeRUF?=
 =?us-ascii?Q?ErJpY3wnJe7CEbmXziPSqz3keolMeB25g+15GXVFVohEyqemjUq4Y03Bk0Cs?=
 =?us-ascii?Q?oDJBO14BfNKmmIEHVBZoKuF18ucs1mQGcCWNii55+7zm9lTV0NqCw0fQHSce?=
 =?us-ascii?Q?EDPOYJefGak7YAjuqxiv80LJO5geUC2+zwDRD38Us5zWT8cvykdr+W5/e20l?=
 =?us-ascii?Q?+c0T8XJYeli+XXRZZlUt9/1gdvqk0ZvuVpxC3Yu8y2rVINJR+iw2MWinLQJr?=
 =?us-ascii?Q?5wKqermZw8zE/Hif4ZXsmPqsPmoqJtFJFRVoe0qL9bMCPD+3RQzGzRq3yeZQ?=
 =?us-ascii?Q?bDlws6d9KR3iIF74JwGt5vk2lop+jEup2N2ub3xC5kjZd4BDY/GClOrEa/XZ?=
 =?us-ascii?Q?bBra4bkESzDTCw3U183qeF8VAZVxgfaeB9vvvRR45wq9h+4ceuiw92yp/Bdc?=
 =?us-ascii?Q?ZqKxzEQN1/SoWbz87lRKobo/qQVPFBWCV6IYKXKYxJGS2LKW/AYn+l4VE/Ll?=
 =?us-ascii?Q?vT7VjCUjh80FK2Fs1XC4rUg06XrAGae09uHE8rsjK59icq7jqvxyInaPUSW7?=
 =?us-ascii?Q?6oGDGV2lL1gKhhi4yLZ1yBUI4m+eW+c0pTPKyW1LSrl8JynWqFCX8p0FEgk2?=
 =?us-ascii?Q?d0B+EcDGXj25AgpEo2OZ0FvD2N8XLHacDplrtfj61lOmj/51WZIwzjaKsPZu?=
 =?us-ascii?Q?aiPNpe45zWKvmZLqw9F77zWU9HT/M/3EivcqFXe0dHz5Lg6XLjs9jEJP54S4?=
 =?us-ascii?Q?rNIaM43CCHshv5bmAqCKO4445a+srAZPybmqXuTOcvkCO/nUOSVsqRHBGBp/?=
 =?us-ascii?Q?bxgKpVvA10+ZH2gRYRIFTHupbv4HbYVRnUZ4n3rEoL9u0w1w/5M2soetQbWm?=
 =?us-ascii?Q?2Hp2pClGTYrmMSUI1Q0LJrpYxn907pUt0oWyOnpxrGVUQoNkYKVhbvT1LKmv?=
 =?us-ascii?Q?Dv86t63fnj9eNU1TJo86v6/tSJOg5o3rjN+wzJKVe8n2KXKzdRiGJruOOM99?=
 =?us-ascii?Q?0/XXPu9gJ5Z/z2q0c9JX4e2F4PKeEK5QFVgd6z5sZdyhn3Vmt2VN9HvfeiRN?=
 =?us-ascii?Q?O+n81kTCJ9cEWR/2WQVxUq7IlV9gt7Vw2FovvctW2lKt+hT3BggAv9B05URW?=
 =?us-ascii?Q?NlvUSRN0k2Os4u79651xrURr9RmoMghR+TT9pw2DbkWR9sDrW0fLAKblH0WY?=
 =?us-ascii?Q?h1KBg/ZQxp/wDVU2Kp/Tj0XYIUlGHrHWUMxY1cToeL/934XXR8A/fEUAB0W+?=
 =?us-ascii?Q?FUXoyBqLPY/Kbbx1BHC79oWC74L/gP9shkMuLoEpE87JyI7cqmlbt/4gZhgL?=
 =?us-ascii?Q?q0Y5wO8nneknr3k24RiAA8LpIlGyDm5J/xZmxdpYI/YzefasIqvbjLeW0QY2?=
 =?us-ascii?Q?ek8B/mix7VmJQ1BenLqob1GsF4bXx8be78I+/L/AIDzO9E+OQ5Rog2tMs2eM?=
 =?us-ascii?Q?DpvTUZjUj13v+JzeOcwXMKY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794ccd0b-289e-4651-fe69-08dd98cec28b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 01:19:55.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCmOyKHzOuz0mFceE07szwGme7//0Z5IsYbel9MaLWFvhk3cAuY7OLFyrQhnnl8/t3O1lrsJLHF7Amvqf0xARywUZV76gljO3QskrKCEMSMByY6mNu3wT+Hg3u8QmPyN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7018


Hi Mihalcea

Thank you for rhw the reply

> >> 	BASE0			  PLUGIN
> >> 	+-----------------+
> >> 	| CPU0 <-> Codec0 |     +--------+
> >> 	| CPU1		  | <-> | Codec1 |
> >> 	+-----------------+     +--------+
> >>
> >>
> >> 	BASE1			  PLUGIN
> >> 	+-----------------+
> >> 	| CPU0 <-> Codec3 |     +--------+
> >> 	| CPU1		  | <-> | Codec1 |
> >> 	+-----------------+     +--------+
(snip)
> > BASE
> > 	my_card: card {
> > 		links = <&cpu0>;
> > 		routing = "Headphone0", "Codec0"; /* for CPU0-Codec0 */
> > 	};
> >
> > PLUGIN
> > 	&my_card {
> > 		plugin-links = <&cpu1>, <&cpu2>
> > 		plugin-routing = "Headphone1", "Codec1", /* for CPU1-Codec1 */
> > 		^^^^^^		 "Headphone2", "Codec2"; /* for CPU2-Codec2 */
> > 	};
(snip)
> hm, I believe this _should_ work.

I hope so.

>  I also think that we can just drop the whole
> "ignore_route_check" flag idea
(snip)
> also, I believe we can drop the whole "explicitly disabled links" idea
> since IMO, links passed via the "plugin-links" property _must_ exist.

Yes, agree. It is no longer needed on new plugin-xxx idea.

> if we go for this though I think we need to clarify the usage of the
> "plugin-links" and "plugin-routing" properties.

Yes. I think you need to confirm or persuade to DT maintainer that whether
it can be accepted idea or not.

> Thank you very much for this discussion! It was really, really
> helpful!

Same here. I'm very happy could do that


Thank you for your help !!

Best regards
---
Kuninori Morimoto
