Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2049.outbound.protection.outlook.com [40.107.102.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BE2882A2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245048; cv=fail; b=OwHNYWQHIZhLj2Y01PMbluMkehWOyvAw9z8za1tu8fjEP8UAIUFeekCJ+riXci++NI+lcdZDKV7juLtMaMBgbxFzNNG8r/V22Ig1M1tvzGabaFHxe7FEt3sc0ZY7FJM9WVAeUiUNWwkjTmgt+1ihaaIM4sNthsPOkqYx6PU2EkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245048; c=relaxed/simple;
	bh=versJRuiZPvBjHlwLBFFLahvgDa2DvvOs42nUXP0MZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lBsGocs0vpLl8Rr+SQkhnb/Kj8F24W/UMc3erDezye4lH1aMFYwM0WBDnJYtRj3Rp0/hp5k2LxTBjF0oxRYzIKv8yJBkSeisnAWPQmjkAUI23zBF6FI2+AqGR6+W2vgSeFJavWtceTYz4YC14ef4G4zenLdpOyFZp5EMUup6iRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nCOR0HkB; arc=fail smtp.client-ip=40.107.102.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nCOR0HkB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cal/0+8k5KIkgsBC7Rqlvugmm6mrFY4e8xlQKhJgeO9AGXfJ/aUwkiGqUnhYfR2ILBAl5QA2rr/x2AzlW3wQkIsHP+m7Ees1TQDssWLRy48ORhVIqPBc0UW6/1I1SlrnBYQ9kU2Abr8OeL5D1hxTCB1X8d5TVWd1PuxIeR1AvQKXaR6nuWI5Xli16pEVLpVxYfO8Op1iWw/HqabUlxw9URYhZVYPJjZNWfbUHh94fhiSYA5IVoYNF1YtFlKu5MplaSrda49DgQ36dhuxyhmPaoC4Yx386YTfkocaV4ph+gPhWYt1oVIkglUWYpW58OmWy6otXbmYrybAqNK3F/piYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VsQ6lggJrEdFgXIAoIdIXMZRYaYgQ2mpqa9Edpcs94=;
 b=tRMguaLsUWBu/ZI8FLJ/5hyFJcoyBp0Qp54ykIQQbANNOnhqrSvtSHQbg5wjLzHkSYwx8rzoXsMQZNiAK7/WPqNtF+w3Nfs7mymrGm69SJ2FGXK7tlvbqJCA8y1lolfPBITWMFx+frvS2/YYfpLeg8XCZO7Luaa32IPO00aZcPma9d9RjX0WlTwFSpfOjLvSSTV+EpkfNpoYG3Ss7QUALyxMJSBm8UErnSltOqW+YeROrsNiuZfXyzm2cQcOtL1LEoHc7GDDJJEAU6dTMvBnJBFiuBdhkdZPjWbzGo56lduEQXA+0wpz5gofksuRW5iZRlrH0m2915jXg7Zori7fsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VsQ6lggJrEdFgXIAoIdIXMZRYaYgQ2mpqa9Edpcs94=;
 b=nCOR0HkBsju/aVixhe9Z5/dqiRbLggwT0izTPZQlvO3uA+vnLPJvlQEfs8C73f5NTfpiO6J1UCgs2xAHZANfyPXzJKhT3m4jvZ1UFs4/wXM9plTPpZbpd5LuVWoKJ7LMWKJJpd5SkQjpJFUq3k/fDSuzRrnmnQ9a4+5cdLWNCB2evHzmO8tY4FK/5yDlclhcyBa4fvQemBBO6klGj/jvevh0TQeo4mO5MDMe1fbMsNg5/k/5oha3469ZtzwayoOR+BgS5sX2qYdYZ85dEjUDGT8Z++hJlN67q/WzXlPzNV/rNPGCCX/7vYgxM26GepWtvswBZq0rCVX8yhQ5h6iD5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 11:10:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 11:10:42 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add missing files to mm page alloc section
Date: Wed, 18 Jun 2025 07:10:39 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <DD279102-8AFD-4987-86FB-7A5C4738C1C1@nvidia.com>
In-Reply-To: <20250618105953.67630-1-lorenzo.stoakes@oracle.com>
References: <20250618105953.67630-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:408:ff::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b048613-2320-4a69-5834-08ddae58c399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lFhTEcp5z0hRKYO1VP8+94lQIot7NaVGP6TKeh69ULTQKjJrpMR+JWDcLd+d?=
 =?us-ascii?Q?xEOae4sE08AUcmGBSxaV4d9sz/ZyqsMoXJ/Gz7uXiCnJmhKNyLXm+63Kuxr8?=
 =?us-ascii?Q?kfj+eizPEIeuFjIyXpvpgRAWNQdSR/y6g+Ur0oYolg51t/RG+VMcTWtIk6oB?=
 =?us-ascii?Q?bzrOtHbV7aWbSv1xdtDjF5oj8CqFx78GPb4NsZn0DpGcGMw26b2R3+elc/jU?=
 =?us-ascii?Q?p4EbXJlWSEXzkvVrb/ZCZC3bT77wztsF/0C4xSv4gQsbNbD3QywUq960+jcF?=
 =?us-ascii?Q?3ereW6VFJmtmUh/tO0znbPy4dGoeEKHW18agdBdlesEq9uuM/sSsonFPXmKf?=
 =?us-ascii?Q?jubyxJRaJTZSLTCB9RXANaxsJEhpFTYjj5ANaqOvpr3EQ0asLzUHFjX84l9+?=
 =?us-ascii?Q?IE05I0pn7/975vl7LZpS4ewVehl5ZOmBabzaM24JGx331T+QGdWchFXA2xB1?=
 =?us-ascii?Q?iEu2fR/RleFuMY/uLfEQvMIrAZXE7o2LFg4dwO/Mk485hMNd/vXOCwcrwVzE?=
 =?us-ascii?Q?wjHzzFf/NbJTK+g/uihpj7ZYsJPGI5zyXaq62tHWN/P6TMAkXE+Vg3mNcoOZ?=
 =?us-ascii?Q?64B37Bbg3rb051E62/8PSOi097pOSzl7bFZajsIyVqkk9KDBu8peSP1iPE3n?=
 =?us-ascii?Q?3ktVKIKPElHFU9OZuuH53Zn5UJd3cmPLKGUgAps2X3UpK0EY3TM6twHpDEvu?=
 =?us-ascii?Q?0JbhCcw7fCBB4LAfwIkanRmw29Xvc5+c+2o66vgz+kyJYrnZrS2rkIy4bthq?=
 =?us-ascii?Q?4cNat1ptmGniJ8R5iHgNM+suRg6ZuYwftBh9kPA1oEVWBsCZFLV1kXVzubdF?=
 =?us-ascii?Q?/nkxbN9C+8ae2lZdyjHxiun8bXpqFR+iUuyC/cul3DySf2BtmmMXqaFHJT7N?=
 =?us-ascii?Q?f539zyTSIVNNzcctt6MO4MSLUi3vOPlXpgLkkjVtCXyfQ3GSEdwFl+LJwTbU?=
 =?us-ascii?Q?wa6bv1Kb6n3Vw5IdMVp2aZAEGuXTycQSdgrETt9ZrwhIXaWySNyS6/weQ6tS?=
 =?us-ascii?Q?vrALyp3CgJgcOgQQV3Uvf9j0dg9LCocBXOz1qtqG+elP6oTs1fZfxj2qFwJH?=
 =?us-ascii?Q?9DweLara2GQz/V9dpsKJ9pxDrgY15K0dntm+Hxmf17Z+LqGtxG9X8pf3cPTt?=
 =?us-ascii?Q?30hxJ3eIKvb7oN5drN2n2dnPLjFgHCHFwPaIUxrHqRoqXeN6o92VBihBMjNG?=
 =?us-ascii?Q?EiAxSmZz7a3G41fh/cqzXkptxsIiS+s7SpPKPMZc70I3oBCVA4kdwyXn45lH?=
 =?us-ascii?Q?I2no89nL4PKgzWcDKP30QPzDP9LEp246LXhGA3WGrFIYIXolSXSqDt/Vycgr?=
 =?us-ascii?Q?us1y17b1+VdZFEqjW+2cevXvUZUxsVO2kiB5hG1TdZ1LjsVsx0ciHQtsijVK?=
 =?us-ascii?Q?6N8G8i08/JpaaJ2gZNEooS2P1VIgeEAMjNbBVEf9H9UHeU/kELrY8ejpBmkf?=
 =?us-ascii?Q?qBk4HUaJUOk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yNS69g5TpSSdoCtbQ2BpTe1cUAz0xPCGddbFkbs0klPQ/fYs7eWf4venDlB6?=
 =?us-ascii?Q?I7kLwVSgEhE05B1OpuwIHf+vpMoVhkgCiTwwYuk02JPrHjFk1N8XsaYM+tkc?=
 =?us-ascii?Q?6xgBQEzSQULOzODTGrQztJJNO5shT8j4TKmt7owW/0mOCsGiqennB0iiMJQA?=
 =?us-ascii?Q?fwk6XT0s2vjKSTXNFoTdNXf0ZdP/+Rtm80IaedFsUBhpBAm+A/COUCtf9xpo?=
 =?us-ascii?Q?2JpolzgKfmOpUV6rQM6L6OxQHiSIij9lfS2nD8gxiBtBsoNmCIwRb79qg2iO?=
 =?us-ascii?Q?3Rnx/ODvd+/H6ZysB1R/rjheZFlnxVCu7tHHSKomBS2ByGaRuCvT+261NrWv?=
 =?us-ascii?Q?a23UWHubz0ZfNJUVN1Lv27xLcHZGTKbOCiYKyzAWFPVP2dBzojxoLWcIOEi3?=
 =?us-ascii?Q?Dhka2yMP5emz548FIN7x4zvAe2g0w6gFLGvdgPSIixD6t7HEpyaCmvL9WYbV?=
 =?us-ascii?Q?AkEw0nSAy6iffpCNo6fco/Zc9LjR7QUOU8+GePj7zRX4EbvBwZ4Ra1U2SLR6?=
 =?us-ascii?Q?h+WfJkb5PbuEprztBbaohDyr46KT7E+yElJpQUg+CZw/sHo2aDLypX7hchua?=
 =?us-ascii?Q?zbEqvdFdVbpaCcvl8gsF0ZWMTOx9WkitVI+aE4RP6OXrTpPxiKEvnYvYAEOt?=
 =?us-ascii?Q?qifm7EoFXvRNgEIVjQLWidgPjTGu7FHbDJ87G3ZnN73JHsGwCNU/68JN8FsF?=
 =?us-ascii?Q?bXcHl5nSfvyNUlsBQMXHMp2ZsCqPrjyZTuOXKFujeLiRB0U/ooi83OWT7Svv?=
 =?us-ascii?Q?GslHETSy0yYVyNaBbojHEFrACUK81bUKab/Hlr7FOQnZU8Su3seCdLB6TaN8?=
 =?us-ascii?Q?7DHAHfCqesfRPHK6IKGljo9iktNwpKoZDSbNv4KI2y7dgsz3fL0fYNJ4X9Nw?=
 =?us-ascii?Q?O8FbDL2r/Tpt2lLPVEreWPM40DMKftHMEdOhipiFkkuqMN3rPGLGA7JSfJ4N?=
 =?us-ascii?Q?w3d8RDJl55mg6w02Q5szqWvVyFZOUwo6QkYgvsho+XE4qXSeUXDASV1IhXFl?=
 =?us-ascii?Q?cSeLmYHhrzpt87/7oFOluGjmfN1kBDu2s5bYEHAKe6mixHG9jeKDD/gtRm3l?=
 =?us-ascii?Q?3W+YXXW2GsH8hINoTjTn4cJ+GAoiKdr6vddqVuS5dTe8r6EwlQ8EXerzLHgE?=
 =?us-ascii?Q?nBlBMOylLRM/VtHdcdyrR/C8mdqJ/7lCU3d+6GXoyu1VGH4lQxmN5CZJDKDW?=
 =?us-ascii?Q?rOd+JftVUiVAc6856BCmrsNKwIaLhbf/7/aYJ43KQZN6q1G0q0VuZHKq9SVi?=
 =?us-ascii?Q?l9XB7t50oWaFczY3Pwgkaj4H6AdA7fe52vwySAjTyZ/pIOyyAZ8fRt3RcEBK?=
 =?us-ascii?Q?fj+SvmT2qeDVsmdat79YfgiWRAFF/sNLnEzds5Kzc3hKz5A/eoZCTi5Hsa29?=
 =?us-ascii?Q?eXCCcBwO6hGvxV1QyX7NXYknIXgPm8u9Yo9RV95pgRu5qFzgFKUv+yYkihdX?=
 =?us-ascii?Q?rfGSJHFATNvuQS/0mjx1p0SgpAWb0QaN2tZj/95PhoDqK8/xYEFdvDHjOlAx?=
 =?us-ascii?Q?pDWu662HXanM834lGZeCm5pmd4DmR7bxxqdU7kdRUMEGlRQUxCT4utNM9MZL?=
 =?us-ascii?Q?kUSpPZ3xjMx1Y9sf9WHuIehcTAC/2qC07Oik5PCX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b048613-2320-4a69-5834-08ddae58c399
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:10:42.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlvR1ENcTT+UUhJUO67leMoRewe21XZRu9A8GuoCCeh/3ERDQ9qgN5wHxyb/8Yrs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257

On 18 Jun 2025, at 6:59, Lorenzo Stoakes wrote:

> There are a number of files within memory management which appear to be=

> most suitably placed within the page allocation section of MAINTAINERS =
and
> are otherwise unassigned, so place these there.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Acked-by: Brendan Jackman <jackmanb@google.com>
> ---
>
> RFC:
> https://lore.kernel.org/all/20250616202425.563581-1-lorenzo.stoakes@ora=
cle.com/
>
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbabcb161572..40ff84e1dcd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15875,8 +15875,17 @@ F:	include/linux/compaction.h
>  F:	include/linux/gfp.h
>  F:	include/linux/page-isolation.h
>  F:	mm/compaction.c
> +F:	mm/debug_page_alloc.c
> +F:	mm/fail_page_alloc.c
>  F:	mm/page_alloc.c
> +F:	mm/page_ext.c
> +F:	mm/page_frag_cache.c
>  F:	mm/page_isolation.c
> +F:	mm/page_owner.c
> +F:	mm/page_poison.c
> +F:	mm/page_reporting.c
> +F:	mm/show_mem.c
> +F:	mm/shuffle.c
>
>  MEMORY MANAGEMENT - RECLAIM
>  M:	Andrew Morton <akpm@linux-foundation.org>
> --
> 2.49.0

Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
