Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75EE46B5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747627623; cv=fail; b=ItS76yOZbf1duM2IT1pN/227S09YhcGXOJDmh67nVhCHOJtD5i/mFRE8s19YLRDbN51z2E2xR8M0P81Aoya+BbiPKIDtDz8M4GzkKQs7CIGtgdz61X+p4Aw9shmldd+caidwDL5I8VwPdYSfKf+pmciXHHTzcbf+OJ/IZ9IxiGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747627623; c=relaxed/simple;
	bh=JdDfemRNdizAUdIYWwN2gxrNsZ1+oczZOlW2HZhYnoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D4YcWxEcaabLk9v/42guk8RbMHAU4iIi9SWQhIBLQ4ZgdunUQtjzAN6x54UCw+nu0JWFcg4AgIhoO93O7sX8YtdgUADlLMGwkC8/KZg9Vu5nGVmmL9zovM4L7wtCDoxtE8hQXRVkt2Vz3lQx3hXJhqEfA0j+4BIm0CODLtRqsw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=L7/t2OTz; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="L7/t2OTz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUBcoD8KNZ794eUnGkRk2TF89YWahQYMm83+jfxMRNF795v2ic2pyGWJ82lSx4g6IIKYnBxq0yNXMCce3m0vCIf0d4HaKKwtV+uTM36zC2N7JTTzQBZiKoJKdZ3sV8JOBIo5DasS33vPwlk9XwOuoAW1z/J+oA2BVRDvcFkqoTmUDGP2IjrzPi8F7q2jZJesmnD2Zx41VIBbKHn4r2rOioS0/lSpZ2Lexo9McaIWNHmk4oVbgYhLj3jLivSTBhK38X7NhUvgXszOnQbhQZzLcC8y0/yl7l8dSEgKPIBCEx7we/21/dwkgrtgYzpCgWXjh3CFQ7r23GZApNNQ+5OzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89xL/5WEb2BAQ5/NxUtSZDBVzkQWRne50A+Lo1/ymMU=;
 b=V7wnsl7BMfeNs5u/acY2WZiL8cuO6aP+/8Z+qtqeyxJ+MljTHnN+z+bHSdd29c3kyilKqrPeo9xWtNTf8Djy97Yhz6bBdEGv/uafd9YC9LT2itvFtVVDZeQ08cS4KgeOfReQ/96aO5nGQh4XiW/cOJVsRxH46DgkbXzgzD+BmBb5AKPc4LwZlMFQi1Fk8PrE0D83CWlrgW6DAYi3vQC+h4KuAj2THQjhKaUKb7faXQE0fFjcD3eM35Kd+uD7UzkumyssOpi4Chz+RgEQBvRHttriIZS8uyvw2n3Gr8xWBPIT3fHcjNNjozCkfOFFXX9KEK+2t5xvE3Z2ioqDDkVvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89xL/5WEb2BAQ5/NxUtSZDBVzkQWRne50A+Lo1/ymMU=;
 b=L7/t2OTzuuFYv6oFVdG2+aT2cwxmvOaUcX4ia5/xJKxX43r/iTSoU7u8/jMBJ6VugzHOiWO4v9btG1RG9deFrYP30DfJmRYQkw/SGFilHuTN/iyibYO0TQ//ANXmADGZowiWVpfHzY4ZgObi/71lenfQg6sxEUtWE7JY8ROl1MM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TYRP286MB5957.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ee::11)
 by TY3P286MB3552.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 04:06:57 +0000
Received: from TYRP286MB5957.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4fa2:6269:5738:624f]) by TYRP286MB5957.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4fa2:6269:5738:624f%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:06:57 +0000
Date: Mon, 19 May 2025 13:06:56 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-mm@kvack.org, 
	yuzhao@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: vmscan: apply proportional reclaim pressure for
 memcg when MGLRU is enabled
Message-ID: <vikyhadcjgxocywncbld3y3agyh2eml7ro6giqd52fcez333he@ynreedkwae6l>
References: <20250404141118.3895592-1-koichiro.den@canonical.com>
 <20250425190521.63ba5b25afcb938102b69335@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425190521.63ba5b25afcb938102b69335@linux-foundation.org>
X-ClientProxiedBy: TYAPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::28) To TYRP286MB5957.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2ee::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRP286MB5957:EE_|TY3P286MB3552:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f90f32-8fd1-477c-7811-08dd968a9936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hk14WiFc0vU7KSp+HsIKzpe7DSlzX0BUXNuwUGYb1SbBwV/hEOY/d2PJD64X?=
 =?us-ascii?Q?wENQ5Wi7fcNzljXBfakd62pRbZH4Htud3GmRTn0t9uNn/2WSiFM2qgMbd67J?=
 =?us-ascii?Q?DVyAvwHP4HVXTcDCWRQV/uw5r7+vLYhwvKoyUHLf5jHccME0jdJcj0ElGlCi?=
 =?us-ascii?Q?L33RcPILPeclvz1yr72QZMWyVN03yVUdEKtUGBtIp6cDZF99teL5G8aS0clA?=
 =?us-ascii?Q?qu2auk6zPGgyEX/jcTyOaTvU+owUW/ye46G4yfh9uekb3Dh0TUISWU4KUQh3?=
 =?us-ascii?Q?PEVBRb3kRn9vkMBqAcxEvssaAUvKJ2ztFn56jQY4ABAFNSvw4bg0fBSyOnKt?=
 =?us-ascii?Q?IrMFJ485HtpQl6ZGGn6jBqE9G6HaDYc+/bLqOU2Y1DJ+MPfgvc3EW3jKH+DX?=
 =?us-ascii?Q?+TTAyPphrbz9Tiwgwp3G0LB2rb+sGwTOgegCd4Sg1CQZwS/R4sC4RHrJlFsw?=
 =?us-ascii?Q?wyFYEaJXHBP8qms6FvEsE5ZscILlrJk1VpxOv6tSh5WfIayPxOOZLGnHL5h4?=
 =?us-ascii?Q?jp7lRvGX9GoHhSgdYxA3DSJS2hPD2OXWGG44Rh4y8NuJhdxwbAdF70h/jRHA?=
 =?us-ascii?Q?/y6q2uaLcY7qSDaAHO8uRhqTYHhBHPgODt8viyxd87UJYmFvG4uDSFQF/Swo?=
 =?us-ascii?Q?JmbW5pQ7fcpGLaRWVwhyXxWtFAJ76lRacXT9iN019OUAb4ddOZIfMdKyy49I?=
 =?us-ascii?Q?ZjIsQ6wLWTeTL2WnaRm/tJbQLkoTA3YfCLzdL9laIk7xsab6th4Zvpdy0DV4?=
 =?us-ascii?Q?YmqJeGkGnmWOfBngL5TajBr2JC2Uzzaxn/pPvmnCUKJBQPerhA6M9VbKn0dj?=
 =?us-ascii?Q?k7z2TAFeITmbVBBsnyV+IsubzmqueoP2BpOMY/kW/h0cLwg/mhv/8/D69ydP?=
 =?us-ascii?Q?SdbS7r974lK1gks9qiTYNJ0viBlJ77bH90Z4Q+z46Y8znxcgCmEo4cB6Cbun?=
 =?us-ascii?Q?7Uci1V5PkEJq1FX5WzzLBSEbUc9e2He2k9RrBypj4U0d583aop0i5HjkynSs?=
 =?us-ascii?Q?tlt7fI/ALdUJGvAshcW/XmjIvLgY8cERTsZanB3/qNdjo+RVNtRzHNHQ9+1Y?=
 =?us-ascii?Q?D66qgqqx6GJjChm/gw1STP0M+k5xdW6F4LzXOzBtyh7zAu92qGo8b385LPE6?=
 =?us-ascii?Q?nZPN/CotHsNWXfCHY4O7svI0mheQvRlbf3gHZYzEdONfyxDZOd45LAgVHkid?=
 =?us-ascii?Q?fEq0DM1whtv+OcPWDf2PlOTQT5zJpjUZxFlLKaA98HP1Yh9weyLUj9A5Wls/?=
 =?us-ascii?Q?/91a6ZbeggQCQ6A3CGrPR65I3Cl1LeCSJF47ir0tKLhC/2DEl25xBZyS27rb?=
 =?us-ascii?Q?V27d6aaeVPqBaNqGmDaMkjYDgbKfO815EnW7GsMrkSByBiNPfy6aUIV9VyKX?=
 =?us-ascii?Q?Sk1zpJqmRvbKgztyRp7ONG9wLqw8kVq/7OTKCThP2UIQZTSWyk+CbGE1FuPO?=
 =?us-ascii?Q?HP/rnMZlW64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5957.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I5bNDgxEP8bCg8jDqoO0RKwg7oC9N+hY8eTBs0fuRARw0PcNjIEu1wyuEXXa?=
 =?us-ascii?Q?mJn3o6wUZSVYO/b+SW6Kbkf+RtupDsb8idijUHKFLXLqy/XQj1VsQIO1waMy?=
 =?us-ascii?Q?9I0lcje4a+pZHfmSoNMTZ8OGWjYSrgd1ELi85jbiRZB31ARvHslfiJuwvAMh?=
 =?us-ascii?Q?bVimmsXxwPLdPLvDm4NxHqtVhAjz8n9VeZFpYUrQfDG7lrPJ13xVC03UqUGV?=
 =?us-ascii?Q?5Uy+rFxIyJFcbUkY7mJaGq2ceVwOgBU0rQMUmDKxwUP2CC08ldsDNOrKkYmA?=
 =?us-ascii?Q?yZEwOp2rSA5W278C921T9QTKb99KI5b+q8bjc5/jpdRfjv5ulWEhWl+oJXhZ?=
 =?us-ascii?Q?ljhtA+nJ3BVW2VYEQBRSdzFrYyYDnLkYfwxFQcaFNOdr0b/d/jdnKq3dJPGz?=
 =?us-ascii?Q?0DEkju/85rSFAbCEqqXvcggv/VTTAwT2u0BuEs6NqeoiSbO+UOPrKD+xrMsm?=
 =?us-ascii?Q?spjK1kmfAdI8UgXhyuvQT/wPCyVXQ3mUJlFy82+QcQwmoBkLjgxsSNRAw65D?=
 =?us-ascii?Q?+xS3bBeBUDRshccO1D4TLO87DZCCISPEZePRhHzHyKUCrCfYXR3jn5knch+C?=
 =?us-ascii?Q?QNuunYrGhjB5sVQcSxTmewbRn+awpa9Zhoiy+/HmPfU8gpUdbHktJYgB0SH0?=
 =?us-ascii?Q?83x4dOf/1QVjzHUPG2t7Wn8QiMoKJfdQYzZzEoVWVQWWItS9wqfNbA0SaoQf?=
 =?us-ascii?Q?P1Ut5r4LqUqmGLRIUEQQKDcN+hmaoDfgAK6KvIRP/ZW5OkTT3TyMzN/T3jT0?=
 =?us-ascii?Q?qh5VFAuE3zTbuT6JpwNiKohwga4FIHZtaTSgElLNoGfxfxF6tch13Gf+EKZJ?=
 =?us-ascii?Q?5f96W3wm/6ZYy9l76pUZ9qN8flDKBQbsUrth7jlcmBYqqMd0nu/7KIgKjRp0?=
 =?us-ascii?Q?rW8Jvrt5rzG6b42gE+1Um0PKztq2Yl7exePXWHVyDxG+rP93aG7PHe7rzc0S?=
 =?us-ascii?Q?vC8sEp2LfXp5qYlV4tU3Cy04OGkIGnclwPZE8A+Nkm1Xexum9+DIAky6Df2M?=
 =?us-ascii?Q?wTiz+Nr1VeXOd2EkrpKQq/Pa1qNmsry3mImI5T3tSmkbLsmYq/wQJC+QAxc8?=
 =?us-ascii?Q?RITL+CTDtJRCK/70+6aYgQ3d8yfsAER87ra0GtAxktCZrHvsigo4S4li/QGR?=
 =?us-ascii?Q?zCFTONKjKF6DLI/11eJhTWUbe1HqLLIgJicZYM7HRHvEQ4+FG8TgazK5oQOo?=
 =?us-ascii?Q?fIEDK86FaDHp2jP3Q2sLHU9MOMxyFqx4oA2IITEcrmzNrKmv/0nU7e/Mw8HF?=
 =?us-ascii?Q?RcaksNW8tPhXOD8keD8JxEmoAeeG2qbF5D0iqYixxUxzXprp4LQNeIBC9MSp?=
 =?us-ascii?Q?RKMuVJP9J1fiDKnpg0wPDVpljOyT8VoSvFEsOnymHaOGMLCOkzL67urabMd3?=
 =?us-ascii?Q?RyHzWkBEfCKH1CuOQSVCkgRlFg/QR7vWoq0jdsQkvkUIPz0XOWc5ifSzuqxj?=
 =?us-ascii?Q?brF1qxrj+mqboq/unirkqZvbqtpCSo3VGqPxctkiUpt4w7lCKODc5besWqG4?=
 =?us-ascii?Q?chUqEdqzoTB8Dz85QbSYf2oiZFGBzTDZRDGs2ufjh9pATwbixcT+3r0vDRe6?=
 =?us-ascii?Q?VKzLUeEoZCubZgRb8HNcugOIH3IJd4tT4IxUBKYc23LOAe2D9aT4b3QwKaCk?=
 =?us-ascii?Q?STM8hfeefvk4waC19UV9f+E=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f90f32-8fd1-477c-7811-08dd968a9936
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5957.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 04:06:57.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM4R1U7nHPgaBhMjOWK9eWJEUvoAoPvc1rdj/e/v+krWlP2ioD+ODwKPmj8tqbVGa63wluFoqj5PUOZwGcoAGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3552

On Fri, Apr 25, 2025 at 07:05:21PM GMT, Andrew Morton wrote:
> On Fri,  4 Apr 2025 23:11:18 +0900 Koichiro Den <koichiro.den@canonical.com> wrote:
> 
> > The scan implementation for MGLRU was missing proportional reclaim
> > pressure for memcg, which contradicts the description in
> > Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).
> > 
> > ...
> >
> 
> Could we please have some review of this proposal?
> 

Apologies for the delayed response. I'm no longer at Canonical, so I'm
replying here using my new email address.

To be honest, I'm unsure who I should reach out to for a review on this. I
added Yu Zhao to the CC in my original submission, as I thought he would be
the most knowledgeable person regarding this code.
Yu, could you take a look or suggest someone else?

Thanks,

Koichiro

> Thanks.
