Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6951BC41
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750383640; cv=fail; b=AYMF21HSwLGq8x2ILK9F/k18k+Virbm/EopErBnfxRcjBtzhHp/lttHnrLGmrgAW1VSc9Yk+iOaWA894X7Q2nCpn3eKTHsxSUkpytrzv81ILw7jzSA32S7o0P+9uc36QYxEwHf0Nfa3v6p7uc/ezxj/c1HWU/aLY/YVqqM+abiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750383640; c=relaxed/simple;
	bh=l9TDlle8+JkP/nXkYkytgGqXgFktTbyxS1IXoaHtcYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mms7+Lv6PWdawF4yjQqaTeR25eJ5iK2uBt/oMQsBX1EiaMLNik4/8CvbX/8F5M2hrkwUs0HGE4zrg2qXCPih6PX/z5xotmTJMvLoLENvhrK5fbrBuJ49+nWSTfETdyWO+5vlyS7NiMJz5oNzFCUz4Brp0A+DlRQutfPbHreUHqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KF3gY1NC; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KF3gY1NC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN2TN1kDolFgDkSt1f30pryyh3esLXbBq6RbgBbN1FJGsMUzS4Ey2vyUtWcur5YJ/En+sqfWq7ue0C+//d17ALH1nRRGrRZXl9yTRba9VcbNFTbMwW8+V7ptTgsGkx0LxlqPxiLIVYuDOByzgY6m+8uBwS8hm+Xmfs7zD5F+4pnvRi85RTgMZU6LcSsPDIgBIyYYAdQ4KdUNePSSgeZ2Tgv5pNlhQe5etFYCvFxDq58iKB/9KPfJqsYR2n9jIm//ANOgu+2R3BGxXLHBZPS3JOTGFGgeaDzMTjtfkXbvc+KuRBAGNrJLcjWHJHKk9ZelMMlXIximvzH5+C7I2/HB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BK75AxhJRnBLt6wnDK2A/Tp0BSujdMM/QUpTV+kc9Uw=;
 b=smU/d6SFA+407pcaBESqWIM58bC4XuJPs9LvxU4RBgc+BF7roLt1jMYW9IKgQ6AUfnwaGL8dPA6VeaYE76zN22bGNn6FHqu5C87GxvgXpZz8cRU1RLOz1ETpTnaA02q1jXPI6tu7tjc2loVGITSnoiGwVH/rW7QDOmh8Co3XYCPWrIZZKzyp5jq3w8LjEcIJiRaxxrPkvCTojHsJwmHw3gqDE/Zy9xdbcfB7cMjA9mIBbCqkOzZQs3RwwdQEAu7r796rq5UBnnwUqDQt52DonhCNsSBjMHjpp5eJJC/KwqHTxXkItp32RJCZnYAIwPSPHRCnwsp/dc3JoZ44wgupQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BK75AxhJRnBLt6wnDK2A/Tp0BSujdMM/QUpTV+kc9Uw=;
 b=KF3gY1NCeonhwZ5n6CWmO47WQkC/sl5MEZAklhBtn5QvjNl6EeJ8wNR1eniid3DTfnpiQZa4SLs0iCMb9nIrWpYeUoLs3c467DTcCVuoak1uZeiaQ8fWQ1xXnfQGZ2v89LQ26eTe8EBZa5n3ZzMCr3zFadwZHijqR7sVN9m4AEsy9kkNpoTJZVx9ZG1kXFg+kDT8QNzudbD++JO++spLbDm/1WNv+SG/ZNpuVJ5/bz1+rPRItm1+oo3iw6mfXjDWKWgtam1Vejcdc4cyZcA0PfaoZhkOIcZGDyKTdQpMjK5Ev2Ctyy5b8SFi24gQP0G6B81kL+oj1QaGzdeUTBQ57Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 01:40:36 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 01:40:36 +0000
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
Subject: Re: [PATCH 2/5] mm/madvise: thread mm_struct through madvise_behavior
Date: Thu, 19 Jun 2025 21:40:34 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <B4B8173E-F592-4CEE-B35E-BFC6B2CDDFB8@nvidia.com>
In-Reply-To: <1be4352e1d414712e876cff4b5d982cc24dc7692.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <1be4352e1d414712e876cff4b5d982cc24dc7692.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0437.namprd03.prod.outlook.com
 (2603:10b6:408:113::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c4c7c9-315c-41e6-14e7-08ddaf9b7439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0yJijcA5jfBPsSkB+Wxd9P+2eEjDiS7+ZLkKU6Swor45yoE27RzA+8EBrnzd?=
 =?us-ascii?Q?NUhAx+Zoi6MwIvwwWZWRSHXuVRLgXJ1NrCgYeTycqTRmAyhR89/bbxvoSE8L?=
 =?us-ascii?Q?arW7OGTC2B+QqgVJlUFRWiW24eOqAhDAB54hwS/MvqoBx+L97qJQwjG/dD7D?=
 =?us-ascii?Q?xg4oBKvBEPWOtJ1YtY7IYtWWsLyjTgn7BwHmzuVaNnnFnV9Sv15V/Tbpgs2K?=
 =?us-ascii?Q?1m8qP3o5ggejpOa/n07HCOAnduEpv82AN07NgwMN8P5pYOuIBGq7OQHK7vYJ?=
 =?us-ascii?Q?xW4vpZTyNXJhUoedw5HzCRF3vvpssk/LL8eu8RfBmvur98DxnCDWu0FUzfp4?=
 =?us-ascii?Q?DoxUkLMSfwAp+rmLXIRLI/+/QdBzcv6gyWqy3NIriUhYz0d4zcCbQBDW/Tx8?=
 =?us-ascii?Q?V2s84GuIz+SkGGdDYolbiAp/6N7YpnVogrqJql4iQgvuNR7IpKBbwukd9yjM?=
 =?us-ascii?Q?EvnBViVDpBminDkIO2tUE0T+U70zn8JRp2LlLbigwBtM1yVhoNcKKTFHjCSz?=
 =?us-ascii?Q?bpHRZPhYi1BDe7CTLKk5YnSn/ecZhoj1K9D0gNRgfw7oQgY5mVdNyEva2IEu?=
 =?us-ascii?Q?GgyP8ZPu7RKkqO+oxqSYey+87IcRFuD39kvtZFRZG2OGXY6jurX94MSdJ4HA?=
 =?us-ascii?Q?HblvyaL9cChJKjfPKM8cPV439DMoauFGi/+7AQETwS0iMYhi/CbUV6M/f9Fz?=
 =?us-ascii?Q?uSoDTwNvR3125cImb10uisADxPXQq7xd1HjbBtz5vA8h9VlUR0yYf7NUgC+V?=
 =?us-ascii?Q?qcfa/OZzXvMhvSXfCuAsdnYF4JOgqjXzY0o2eHDmhFUbiA/6hBakl28PIKR+?=
 =?us-ascii?Q?WwVjW2QWud9tJP7LaPrGxQpwiUYZSl8kv+jDzeDQj5sgCfR86+2Vfat8ao47?=
 =?us-ascii?Q?RXskg0LtbXGVZMGX+ttXtwgULN5MWCyb/iKHBJsWiQbyt3R2GGrXOgqPmj+L?=
 =?us-ascii?Q?VIZKX5aHCJBr0MGcL/BARk5ABK6VUKl4vAk+Q6W94s4svNnuDcuEJIsmQqxV?=
 =?us-ascii?Q?TjBevJ+ZCbNq7mtzEDAdydbEgJj2zOMM6R7MW7Jmc1IIKLl2zynoSvpyugBP?=
 =?us-ascii?Q?PwQtnNztFgyu+gzOIVloX3ahX2h8bA0kHrJAnncmRfz6pv4Q/jkrPb98VfB2?=
 =?us-ascii?Q?oc10F5KBzaU3IlgHXAM9uuBKKdIhNFbHmmdvf70sjjWGvB58+C9bPZsLYNUm?=
 =?us-ascii?Q?MsUZ03jwPWzMwtydn+pWJbzRKyuxLqaX+Wfx938eRmpnUSrBAbjphd2vudac?=
 =?us-ascii?Q?Zv8+1hAJKvRjdPd+2X7qG4fzHGBn8dkjkG4ynUGfzEPKogCnKjcHFDCJiK0F?=
 =?us-ascii?Q?XjSBzrQ/9JxKd0sCMbqbDU9/xSGS2gOhXY2Xh3RMmC1/shcpbaSFcxCaV5sx?=
 =?us-ascii?Q?ieG4yletf7XleZg9QIvxBOjoNdjcmR6SV2vaMNqdnecKXp5dOOa5LlP/AIfM?=
 =?us-ascii?Q?B2gsNNq1Vl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1hRVd9qkmuBmqxVmkwJECM9KkaOQPOwW9bmMPINI4MA9/Q7DrBZdCCkZzSie?=
 =?us-ascii?Q?uIE1mzhcCzGZ/CY+Enxqn65I3vLIaJgloWRUKSItqlkJPF4JoGauU+/PetWb?=
 =?us-ascii?Q?FU12vu1Ggr3dey7LBWgiOiG22AF31DWcDauQgo5nuSQPbjB1d/VbCf7YZ/+j?=
 =?us-ascii?Q?BcNs2dhsieGtPRYbfVs9GVqtY6P23B9uO4fEKGwh4WQ9qMrjRxEyJlnQD/KP?=
 =?us-ascii?Q?64aHefk7PN2Btx6EpmESHetiDBvtAnol9hQu27VSOCTg/ngX/ID+SUrF/eqA?=
 =?us-ascii?Q?P1l6Ie0HGPKC7YUtUPBMptEBexaPg1EUvFCJXr+/rkabU3ZvW4/n6jaAbJIA?=
 =?us-ascii?Q?BcqSifhGhLoFrCRL3JO5zKTiK+Mev3AJ4pPlV6wJMnK40pkwBXkId0VEw9YR?=
 =?us-ascii?Q?U6G3/lSZm/Al7jm+diSsGa05IXpKEtJMe+3yjFFRHWdHtvSSZr7kmQQQFSYj?=
 =?us-ascii?Q?ROGIMz7irh9DoUvpM1jHdHZo7itRU4iTcD0rLut0v/kxzYyqFY3fQVWLV3Ur?=
 =?us-ascii?Q?zF5wZJGFeV86wKfCBoFBckwgHF7QjcfK5fVZF2lmiZoe1F8+uXFBckmfwWQJ?=
 =?us-ascii?Q?L7FYLZVlB1stxzJG3LEdvmtDv6QytW0PHb969M5S6tgB+Zh+tjFOo5WYPcP/?=
 =?us-ascii?Q?JlpML1CNj9jeFaB9XwIc3VrXhVU9T008erW5Ph33oCd6mzALr/7zXREA6KtE?=
 =?us-ascii?Q?ZWYfsfcKxcnONTc7lPWb+lS94nE34bcWfs7dbFaZLQSMjoRoqcqBP7tjJocm?=
 =?us-ascii?Q?GXzDcZoxAH/gMI2DBcbp0Tpl/hpLxKdOPIJOPIOIFZNia6FpA0T1DISMHpyT?=
 =?us-ascii?Q?HRR5w4Z8Ny4eRoqjKiqX5jrB4thtxZoGqC25Dxs18g8EuHKPbYSjGOjMDXt4?=
 =?us-ascii?Q?XdgGH4vhySd1YKvx9yNP2q6/xSqrDJNs4UjLJ8AN7vmO2QzoTWvgl8cOm24t?=
 =?us-ascii?Q?GFotv14Wa5mI3iofeIa5AZeGutpQTHENMdyRoDPLnKEDed3ING27YOQoZgb1?=
 =?us-ascii?Q?yhnwH+OkyL16SRlDmtX72zNFDIDmViRtumy7HtjdUQSqV8RL4QOLScSv+Qho?=
 =?us-ascii?Q?JgwBUU9Eu4gcIsSUaE9sz4zaMGGKYPRNAkLuf+zpkgOUJUloe1TB8EeXyDNy?=
 =?us-ascii?Q?I9hVWskZ18c9mTt4yBWxkZEl3fsSzCYBUM1a+tACKIrfRNcxp8TqSQg+EEoV?=
 =?us-ascii?Q?6gOtpS2pDIrc8v8N+iG32Ak7HG/4nk2td6WM48gEFeecjnixwhjVZg7j2KLz?=
 =?us-ascii?Q?l1wjjRDFnup+Nuv4Hl7YKUSaBMW7uIMzUpAzp2zqI/WWN3dzvzDm8/J9VZpR?=
 =?us-ascii?Q?ufY+2OmeF2C1YyuufqbItkqw1BJAMjKvRekucVE91lz1Gq0gIaOXC9yrjYHV?=
 =?us-ascii?Q?FGvJxRYykVZTcAk8Ghk9wODtlDa9/x4ZPW4ipXSgK6AvjBr1Ti2EFoQNuIoc?=
 =?us-ascii?Q?1cFLUn+H9HgY0MWlXUdsy0+B+V/67S4t1zm42fpn1oT3XjpsXFWIzhTilhtG?=
 =?us-ascii?Q?dYFMTvI2s8XPVuvk16hzrBFBGQx2YeNMk5QnwYkOat6tj6aYoFOL5R+0olQp?=
 =?us-ascii?Q?2IBq1GTdU2s/5PvKp4Z/6djqZjQf0IhwuckFs/ui?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c4c7c9-315c-41e6-14e7-08ddaf9b7439
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 01:40:36.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lUtbiIeQ2YePsYdcWT9y3MZ6o7Eohy1A0Mvb902o2McLlW3k++ccze0JsT217C5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007

On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:

> There's no need to thread a pointer to the mm_struct nor have different
> functions signatures for each behaviour, instead store state in the struct
> madvise_behavior object consistently and use it for all madvise() actions.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 105 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 54 insertions(+), 51 deletions(-)
>

<snip>

> @@ -1422,15 +1425,14 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
>  /*
>   * Error injection support for memory error handling.
>   */
> -static int madvise_inject_error(int behavior,
> -		unsigned long start, unsigned long end)
> +static int madvise_inject_error(unsigned long start, unsigned long end,
> +		struct madvise_behavior *madv_behavior)
>  {
>  	unsigned long size;
>
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>
> -
>  	for (; start < end; start += size) {
>  		unsigned long pfn;
>  		struct page *page;
> @@ -1448,7 +1450,7 @@ static int madvise_inject_error(int behavior,
>  		 */
>  		size = page_size(compound_head(page));
>
> -		if (behavior == MADV_SOFT_OFFLINE) {
> +		if (madv_behavior->behavior == MADV_SOFT_OFFLINE) {
>  			pr_info("Soft offlining pfn %#lx at process virtual address %#lx\n",
>  				 pfn, start);
>  			ret = soft_offline_page(pfn, MF_COUNT_INCREASED);
> @@ -1467,9 +1469,9 @@ static int madvise_inject_error(int behavior,
>  	return 0;
>  }
>

Is this necessary? madvise_inject_error() only cares about behavior.

> -static bool is_memory_failure(int behavior)
> +static bool is_memory_failure(struct madvise_behavior *madv_behavior)
>  {
> -	switch (behavior) {
> +	switch (madv_behavior->behavior) {
>  	case MADV_HWPOISON:
>  	case MADV_SOFT_OFFLINE:
>  		return true;
> @@ -1480,13 +1482,13 @@ static bool is_memory_failure(int behavior)
>
>  #else
>
> -static int madvise_inject_error(int behavior,
> -		unsigned long start, unsigned long end)
> +static int madvise_inject_error(unsigned long start, unsigned long end,
> +		struct madvise_behavior *madv_behavior)
>  {
>  	return 0;
>  }
>
> -static bool is_memory_failure(int behavior)
> +static bool is_memory_failure(struct madvise_behavior *madv_behavior)
>  {
>  	return false;
>  }

Same here. Your is_anon_vma_name() still takes int behavior, why
would is_memory_failure() take struct madvise_behavior?

<snip>

> -static bool is_madvise_populate(int behavior)
> +static bool is_madvise_populate(struct madvise_behavior *madv_behavior)
>  {
> -	switch (behavior) {
> +	switch (madv_behavior->behavior) {
>  	case MADV_POPULATE_READ:
>  	case MADV_POPULATE_WRITE:
>  		return true;

Ditto.

The rest looks good to me.

--
Best Regards,
Yan, Zi
