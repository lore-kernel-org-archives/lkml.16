Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB630E820
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750384461; cv=fail; b=N9x9erMOUC5jXYRUMHvp4GqrhBCdwZkRak6WmK1WTr9yPERPYf9ahWOtHjNHwwOTgTrm3c5+zCa5vkJOhS+kTFtutCJVD2APo1pI9wySzauQlWOpaK2tq1biJhFL47ppbicB9rnBSKXzYbcxEMITNZMbnr4VPNYtu3j+oHeHFo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750384461; c=relaxed/simple;
	bh=2isOoRLTglBvcer7XjxBvYRpxsgcQrd1aya1cVbPrsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LdqLkmFGPTcRyheP3GtOFF+92pibvvZQSNfnYgawrfHP6zkkZFZLNCrRyGbg8KaWdC38Hid2cs9OL4t+jlVBvf+Ryr0Y5xddPasWKzqc22WhUSo5ft2hrzH1Xo17g3IH2WuK4s0lR2jA+dmNVnli1u/9VyLKr/9bG2+svaafsaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PxUUhMnC; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PxUUhMnC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfQ4d9hUXINNPKDBzMEgryrrPJMMOapabETH4BnOfYpektWd8mbIM5YQq+aWZoa+T0pviQ4B3jPJCn8VPlzg/h43z2IIfuxf2sG+YTYLLepmj4rasJnUP4Z4ZIi2BD8XzrM1TRj/ZhOgAnprX64J3pJw6vlu7qE0Bxco5SCB2/D8qRhM4BawyDEX9b84+jMEmhk2lYjFi11ZokDIUL+fxx1RdUgPRpPzZHNZD5WBC8Sufe6jNU8I/k1k+iLXp0s5BHVqzwYOhlCFhidHcU7LRp7AaTUw4tspIOYmIenqIK3EXtLGOGiaZzLEDCzc2NbEvK9IGH6CEfb+g0CLfS8h3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cccD6xTwFWqjadaMx9A4iZYWXJnkZ5Cv3fKc50YM/xw=;
 b=Pa5LhY4yEWyQC5t6IWqUX+ngha8ylgrYlvlOg+KbT9RXqIC07Z6a416EQHDoaKLplqxyRnMESg2kMpV0S9fcwHGFAfsw0R6Jav3Ahp7uthAXcif0cHyxgbz7zkast7Ntn5zkGaxMxbA82qc9w5DrBmeZBWpOs3c5HmoM4et6/iE4iTHLJUFo62uohsZAAwXH0dyzIxrVR8+6vrQqOXtUa/CiLxvck2HCk3GYrldFe/n+RM8YrxVChV+l+kMi+KzQ4ppYMOcZ1v3o5zwPjBqIh+hcu9ZRQn+YhPRaNNTm0Dal7CG/+80pmFMN5NWf0ZLABiQNpJgAhzqwn8bSLZy8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cccD6xTwFWqjadaMx9A4iZYWXJnkZ5Cv3fKc50YM/xw=;
 b=PxUUhMnC/gcrpnCUoMcqhftQWXfu1mFCI+Q0d5lJtArBK4aVfTpDfg6bTMhb+aA42Gs3xCfsGzN86Hr2lRnyEPAvFzRwPNms200QtsDA7LTLHvGrRmW8hOO2GrrRrpBRw17JOgOpgH2xdIo18oJFkfqbjB28U6ZetI8MRct+TsWLmLoRvvPo+BYZfXAxed99cLTLlGDL8jdKorcLVhR/tHMLSAoyoIOiVE3qKsxgFyS06xFZmw01xQsZZUypNCd/bWz1zbYUjhoZEDwFBhR/FSs07O+qqc9HMCZoMobwiPzSngSmkMum/s2/pWDXXsRJSY3MCUG8c8rlnoDj3JrvGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS4PR12MB9794.namprd12.prod.outlook.com (2603:10b6:8:2a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Fri, 20 Jun 2025 01:54:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 01:54:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Date: Thu, 19 Jun 2025 21:54:11 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <3651A1A2-6EB0-4731-BDB2-E11FF7E63749@nvidia.com>
In-Reply-To: <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR15CA0048.namprd15.prod.outlook.com
 (2603:10b6:208:237::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS4PR12MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 126d9b91-2a60-4f30-b8d3-08ddaf9d5be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kpBdmceki+GH8uVdV1Pjn7ntQUJNpNvwJrA6yAKwjveokyOgkzYvj74P/IiQ?=
 =?us-ascii?Q?3+nS8OOQKcxQNyn9mKynauwxwsZjsmVrlFHEU0NSHYXvAqd+amypheRCCC/o?=
 =?us-ascii?Q?RgGeQc1ewQrxn0H2iKfYfHpvFdHrf2F9V0rskByIlg7t99WgMNG9ENlQ5Q59?=
 =?us-ascii?Q?+fLkp4JeXkYGYNFfZZfc4abQIf1YSzduTesB4gK07xlv2DsUFnxbNWuLoEHY?=
 =?us-ascii?Q?v114NyjECkMvnelO8o1owffijuw7cSYZcbQv/eEYLzBT8rs9P/qnO0F2Vf+e?=
 =?us-ascii?Q?KPQK48uunfOsNuuwbYsLx6Gq10y5U/92vIM2zUfcMX7qxRZ6H1mmwk9E4PZH?=
 =?us-ascii?Q?Twm+xv0nSzbYZI1WlXK+SKEz7ImUZi8aP7qzbFYnTk5jA4e066lb2J/iWLaI?=
 =?us-ascii?Q?31yvHaHOT2kmS0hRsQ8wlHoka36CvSPs0aMorY26CixszR9ACoYj4M1l4YtI?=
 =?us-ascii?Q?v+LIDWO971oFI93NMJiEMCPiFmj5s30UzDGZBw0M3s79elScloLu34QAPXSY?=
 =?us-ascii?Q?mLTxSP7qOne2YXHKz47lS6yHDog/Nyp9Wi16PzcgbvwqB1iimsd/1haeF8Db?=
 =?us-ascii?Q?HSB0kdueu1M7oV55OJXzLoSr80eOoAh5N2HBcyj5MUP5an/VBgffaRh3g2Ep?=
 =?us-ascii?Q?G3KvQQbO9u+4uDuIwN9ZebXMoVjS48CDiCvWCgxAKlixcA/KiF+NC7+XJ84x?=
 =?us-ascii?Q?XBKVl64ALxn2WWLALtz106eKzOJz2Ju8cH4MswwnGUhSWkMi4AQm6TwFPRhz?=
 =?us-ascii?Q?XRCGNSXzCIPW06WTPx5f0pa7rZoj6/c2u1xABZ5fW9Ex51L9R2EfPVH6jebb?=
 =?us-ascii?Q?calK9HdVlkhMQ/eMAmPFo+xEZqi4ocsUUV2WjBJ4qkm8hXWvgtiqPkZQaoi7?=
 =?us-ascii?Q?RCN2DM5mQwlXz2qYRuDcmAAonx9Yc8nBjiOsAuzO4FcPFlh+Od9Z6Wkw84lH?=
 =?us-ascii?Q?qB0mFXlNBZLQP1PhkkcjgzOZpTi12zp++gBzDxzppxNIVi3GPX5X6j1faxCZ?=
 =?us-ascii?Q?6l9ciuW41yqKnW//ApOVmM3HbZmlywspaLXaoCceedbja8N51UzNA457X84o?=
 =?us-ascii?Q?sgpyUFBCvcxjQ6P6CgvBe0tLpX2OdYzEkqQ7eb9F/aVm58RwTaueCySMp5oC?=
 =?us-ascii?Q?+o4tKoRDojYufUh6FgooVB2TIHcx6ISpOm2uP993tVTZqZq9toMHzvTuGzz8?=
 =?us-ascii?Q?gjQ2EJ3cJTZkmC+z4CZptjdj9mKnWEKWCo7itX/pDupJa85U8ysCVyOvPTb2?=
 =?us-ascii?Q?Wp9Dq1ROXA2TurqJY3CWUF/Cq7WP75+BdczfKqgxqCSyZ2LSczu50jnV9Fgh?=
 =?us-ascii?Q?Mn/B099y8p/GD2T1Yfo0/BCf+5wwD/FOKMJjFCU9iKvRmBGziF9jTNdO/5P8?=
 =?us-ascii?Q?JG0PcLXFXxjsKaqyM7CUMJrC+hKDnYvXnqayy9iyWSEGQvWqhgt/N6e2RIc1?=
 =?us-ascii?Q?WNJR8ji+rxs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMOG0v5paLTv8dS84qN471iXExtV4aPQ4PMkv+B6BKzy15YQ0Jq3Ox3d/0wk?=
 =?us-ascii?Q?oSdl/gGmIoKFeDYun9WHg9IqlS/0XBGGHk7T3Z9P/DU1qiAkKk86u7IIdwGW?=
 =?us-ascii?Q?Nw4x9xOqzcon9Kw1p/lwZkYsCEmi+Pfy+nMz1AtSGI1CjWTNHL7E2zpXGYp1?=
 =?us-ascii?Q?F8w49jYS70Spp2DKQ7wiJd8XQqw/wnskNIwH4lW2VK7NGmP5clDimRgCCccG?=
 =?us-ascii?Q?woREZo0FkbVcHW18cFaRB3jmwrAPZzJ9UVtqbXJmgCBFI/EGq/sD3yjip/g1?=
 =?us-ascii?Q?Xo9PoRISaoGsjq/UM2Zt2REyMIW2MwSob78oweHiq8YiIeVbC49jobBqz7qa?=
 =?us-ascii?Q?4UnhsZG7r3mMuLuiNdYItuIpoS0VwlOMbl6z51LQ5A4VJRC7B1s2uqB3hsvg?=
 =?us-ascii?Q?r8vr2acdKcp4rbABnkv/Lez+JJRZvypkFZr1lL7SOcPy8a+G5FllTtmbpYNX?=
 =?us-ascii?Q?PfBF/hDecJ4xDqg6e+1cgF6eZhMjvnRIJPYCp+w/xVtp6IxVlxbyADtANi4W?=
 =?us-ascii?Q?QFZ5GKhR49qSrFA+XeG4vNDhc/yBrJEO3zjOpvwz6yFfrooKNIx5x2yzqa77?=
 =?us-ascii?Q?vMEjj8CS057CyURiu+M5rsYdzs1Y6s+l/gzSNWeWRUl6Xmt/wVL5OGP9wMb8?=
 =?us-ascii?Q?ZDeGXO4qGhzpjICg9n6vPmQkJwI5uHW6Th4vJ+OSx+jPSYF3ZyTCbr9qHCcc?=
 =?us-ascii?Q?YpZLxQ6/Jr7o7hCdVCLUzWxOYXp38nwjUWwlqnN18xe0FlcqyTAmiWKKCr0p?=
 =?us-ascii?Q?NsWdMKF1rjuAaOtcS1og2VOa0gfANlLv9uuinto1xGxZLIQjcqHd5ALenNmm?=
 =?us-ascii?Q?XsqQKaUY5PcfzQncRoQwIhOT3qqpGWe8yj/RqKaUu2PxWxYvKB8hfGywiK+1?=
 =?us-ascii?Q?jDA6ordOMQv0+h5B/7ytzkvLCnM+CpW8qsAoFYoXlvhWtZ8CQZQse20rW0Qs?=
 =?us-ascii?Q?ta4zybqO8164LUJ59sDnv7mFyeiF8NR1nE2pcUdZb8FjcKH7vprJK6GkhItG?=
 =?us-ascii?Q?BjDvA2v5SZ0Vt0Mc0PnnAwdSHBhcKVzhDaYc+idjnmKbnFt1Pg6sUHsreU0H?=
 =?us-ascii?Q?w2QyyE9mmgqa/SkQi33zXMQ0lC8sls8tbauw3g5hVhXZ7jFmWeEE9U5Tj0wF?=
 =?us-ascii?Q?q5LzAF64T4aSovmP5yIHLwDMTWEHGsl6AWPEKwZ7bjLTwhukbQGpR5SM1Q/7?=
 =?us-ascii?Q?CY5ZbxoQw0pTl14wec5EiX0EuJMzS7rq+W8njRsoroxTfRnqDo6+oG3tVVKV?=
 =?us-ascii?Q?hU1gS3q5PHhaU7rf716mshaQ3ktwF4KZj5dJjmoyQxd+8Avu6r6+fZDdEyiw?=
 =?us-ascii?Q?t9LV55oDEfIS4SUhSBTUP/VYOk1hcBUNCz6BwLW685zxTGzykWr1P7QabNQ7?=
 =?us-ascii?Q?7dzqE1Y+o/NtCYWpjHmE9MdTAPffzqQEOhFQSmSjphUF84+ESaNmGM8LdD9L?=
 =?us-ascii?Q?tSau3VLpQFoPHIhf/r/d/M/SkExc8atpL2tiHZxMKZIbd7tcUKRSp70EljWO?=
 =?us-ascii?Q?vqxe6qoYQ3m321Ow4O0zrbu+mYTq0SGiaZ1de66YNW1909lBnpXVQ8zuwdJ3?=
 =?us-ascii?Q?8N+7YQHtPkNmW6eaVyBu9iapilkWIpqAKktj2/i3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126d9b91-2a60-4f30-b8d3-08ddaf9d5be7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 01:54:14.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPVq4dL7vFmzHRiaYn0Mwj04OSeRYGNIlGP4xBeOQVY+rwTkSsGhB5eRpL/eZzQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9794

On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:

> Rather than updating start and a confusing local parameter 'tmp' in
> madvise_walk_vmas(), instead store the current range being operated upo=
n in
> the struct madvise_behavior helper object in a range pair and use this
> consistently in all operations.
>
> This makes it clearer what is going on and opens the door to further
> cleanup now we store state regarding what is currently being operated u=
pon
> here.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 101 ++++++++++++++++++++++++++++-----------------------=

>  1 file changed, 55 insertions(+), 46 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 47485653c2a1..6faa38b92111 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -58,17 +58,26 @@ enum madvise_lock_mode {
>  	MADVISE_VMA_READ_LOCK,
>  };
>
> +struct madvise_behavior_range {
> +	unsigned long start, end;
> +};
> +

Declare members separately?

<snip>

> @@ -1425,10 +1437,11 @@ static int madvise_vma_behavior(struct vm_area_=
struct *vma,
>  /*
>   * Error injection support for memory error handling.
>   */
> -static int madvise_inject_error(unsigned long start, unsigned long end=
,
> -		struct madvise_behavior *madv_behavior)
> +static int madvise_inject_error(struct madvise_behavior *madv_behavior=
)
>  {
>  	unsigned long size;
> +	unsigned long start =3D madv_behavior->range.start;
> +	unsigned long end =3D madv_behavior->range.end;
>
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
> @@ -1482,8 +1495,7 @@ static bool is_memory_failure(struct madvise_beha=
vior *madv_behavior)
>
>  #else
>
> -static int madvise_inject_error(unsigned long start, unsigned long end=
,
> -		struct madvise_behavior *madv_behavior)
> +static int madvise_inject_error(struct madvise_behavior *madv_behavior=
)
>  {
>  	return 0;
>  }

OK, now I get why you pass struct madvise_behavior to madvise_inject_erro=
r()
in Patch 2. The changes make sense to me now. Maybe delay that conversati=
on
in this one.



> @@ -1565,20 +1577,20 @@ static bool process_madvise_remote_valid(int be=
havior)
>   * If a VMA read lock could not be acquired, we return NULL and expect=
 caller to
>   * fallback to mmap lock behaviour.
>   */
> -static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> -		struct madvise_behavior *madv_behavior,
> -		unsigned long start, unsigned long end)
> +static
> +struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv=
_behavior)
>  {
> +	struct mm_struct *mm =3D madv_behavior->mm;

Is the struct mm_struct removal missed in Patch 2?


<snip>

> @@ -1846,22 +1854,23 @@ static int madvise_do_behavior(unsigned long st=
art, size_t len_in,
>  		struct madvise_behavior *madv_behavior)
>  {
>  	struct blk_plug plug;
> -	unsigned long end;
>  	int error;
> +	struct madvise_behavior_range *range =3D &madv_behavior->range;
>
>  	if (is_memory_failure(madv_behavior)) {
> -		end =3D start + len_in;
> -		return madvise_inject_error(start, end, madv_behavior);
> +		range->start =3D start;
> +		range->end =3D start + len_in;
> +		return madvise_inject_error(madv_behavior);
>  	}
>
> -	start =3D get_untagged_addr(madv_behavior->mm, start);
> -	end =3D start + PAGE_ALIGN(len_in);
> +	range->start =3D get_untagged_addr(madv_behavior->mm, start);
> +	range->end =3D range->start + PAGE_ALIGN(len_in);
>
>  	blk_start_plug(&plug);
>  	if (is_madvise_populate(madv_behavior))
> -		error =3D madvise_populate(start, end, madv_behavior);
> +		error =3D madvise_populate(madv_behavior);
>  	else
> -		error =3D madvise_walk_vmas(start, end, madv_behavior);
> +		error =3D madvise_walk_vmas(madv_behavior);
>  	blk_finish_plug(&plug);
>  	return error;
>  }

We almost can pass just struct madvise_behavior to madvise_do_behavior().=

I wonder why memory_failure behaves differently.

--
Best Regards,
Yan, Zi
