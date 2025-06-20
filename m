Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3430E820
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750383170; cv=fail; b=MZhqmP1YoaX8Q41kYenHSAmw8BGdHo5y/p+kCf1VVf1x+I6sr7V0bZFQLkupOxebH6vm+XRE1qoYz9v789F0lquzGpuoqesFj7HF9cjQ55iYT+evXGxoq4nGAYoYIafFs7xM2Mq6bVy30BNWP79JLTOEmmkuDqoK4+2sfZxANUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750383170; c=relaxed/simple;
	bh=qWyq3M7WSQJay47R2gXcZiwO2NoBI+Il7Mk1Xs7PahI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OHWkC49qbv9TkOVD0Px/j1G/R/6ahYrmgY9Wcwa7RCj6nbcofL0xW2oFuhWokBYJV/DWxUzEI7Rm3v5H7INIAyUkTEX7MdQFDaQwI4o5Iya9moAqaxNomjQ1+pcOz0Z4ZiNGA04p2orMK7m7GCbAqPQlaSLGkmFrQS9xFrz3Oxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ouxsg9Ff; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ouxsg9Ff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T97QeS9azjXMOL1nvyLrmz52h3/lC8PZazlKL51BPfetnbN3BhBnKu1vxFWBlP+n9FMtXX5YeBV3go+rQyUNZHLO2rW3C3IcoOxyxFLmFVwrWitFxmtsNK1zVq+U0RvSYmTVGr2TrvV3YuQJsqYcN6UDnIEddhZLVxvHIGZotdtjHvrrKh3AZ1xZ9/ERSdixNjnyo4XrDaG1c7/Aj8e4Z15ADg3QuECUyKHzAD9R+gVcJPuGHeZwKRFEWp5opaBCVlpFQN5z+vRJ9OiOd27e58llvr/l1YPXYt9jbf6UwxV24XVKCfNG5NNYk2NQd7zw4ehVyvx1kIrpckVAApT2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZOsBgBGrsQlY3u7pvfwD/kNhtULzi180pDI8UcnMQY=;
 b=uYPqNoGy6RWGrETr86OXQYFgxE3Xo6ExXmILqoWG/iSOEvhPZhhmyl76KXGHHBXs20I4qhmv2XmovAM76+9q9GmAm8rc12nXu5oa6/7fTvkZLQOA9Cz4gCPm3ZYJis9Rh/kf2T0FJWI+Ztyov+I2SFdSZcXmOov7+kztv2ZQngqQdKeHqzxQc1NFF6hFWK7NbV4g0u5SGeUWRRMt40tcIZpXPWeka1iuYH9iTwwA73I9nEyocv/LD83wV2gGHqCqfvJpbPwVslv6drPxImgPhGlOAckF7wXSFv1UxLPPaOnr8gu2B6oY5NshPXO+d8+L5zguu1ClBRjJGvQ+qhnAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZOsBgBGrsQlY3u7pvfwD/kNhtULzi180pDI8UcnMQY=;
 b=ouxsg9FfO5Z/Py4XtCC5/0loOOceVeeTivsZml198HRxj5SQCebpzEtKhYqIGg5Z8dE5rsBUj9/G1WWlQfGm80l2Ykozzin713dX3MA/uxuDk8tCMttRw7cnmCoqAhJ2gUJIN5yHR17VMxhwGJYKTl0blpGo4gcfixblWhNtAMKvguHd3d+NHvRHMemwfGs+7fr8ZWLeAQMCj1lNa+kri1gAb2ZotYscSs6nzyGQwDppA0PwlRAwzEzTtf4ojqSVlZdoxX6lI0cj3KT1NsNYpt5+7LS+R90fUwMr+vbWOlJrvUprkb9jR6PfBtZm/l8D4L3bG+KAza+A9HZUrsYFVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 01:32:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 01:32:45 +0000
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
Subject: Re: [PATCH 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
Date: Thu, 19 Jun 2025 21:32:43 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <85146A1C-767D-4761-A37D-3F2248F0C7E7@nvidia.com>
In-Reply-To: <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f72a00-d776-454d-db50-08ddaf9a5ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UJWsfI1Xd5RAp2TzuuBB2yLKsb4mAfKXykLkQ7gxiu3LKcIt/5ZR67mhfn0I?=
 =?us-ascii?Q?PT4Ps4h839A+bI7U0PESrHv8EF1YGCI5OMfqk3f819M5RWpovRqg7kRxbsrm?=
 =?us-ascii?Q?ur5aVxpALl/QYaGZKu1aRQSAf4XDhUzfHpnMWhozet/ElwedgAowHRdigcWB?=
 =?us-ascii?Q?hqf3Xp4AVxCSF5vWUkWEMeK67HaJVeoNsb+F49uFPFgDUHqMQ4aoWm3uC56X?=
 =?us-ascii?Q?yK9a5oQ2EfWfTG2WIuWtMHv4t11NMwRB9mHQBRMYBc1YcSA8SqgbZZhOR1FD?=
 =?us-ascii?Q?/53vfeEnoXs90gJFT18PJyrWaTtdCJwNF/R4DwmxXkBRUIt3nJemT97gBAQh?=
 =?us-ascii?Q?6IkonYxGSqbizFIJKHsvsGFkjrT9tSmMWZ3AbyNkyuEdJLaCmzhjP1EDWbxl?=
 =?us-ascii?Q?3QWzOzJkx5kUhbRRaoFyvgRqNwMf/2O+W1BmrJ19eOwlJ3/dY0iV4pyd5Pfp?=
 =?us-ascii?Q?3RSTqiCQXwBOPfS3JyqO2ZiQ2l53fpjGHY5EVVHHok9lMSeRDyHYvVuPKEBR?=
 =?us-ascii?Q?0WQXqqSWKNptZgfn4NiYV8QRAX8F1EiLscojsvMz5wKEWNhAapL9b9Rh7DE2?=
 =?us-ascii?Q?tdZsBWM/MTTmsX23YUECRf5oLkpybdIqwVOCZP+Ed78GvLliCfYH2zxtVbGD?=
 =?us-ascii?Q?vhrVMWQhK3/XSOy6/tkMeXy1RDxgFHXfWySmIV6jG2J+ZRKHmHFGGwb1EPXI?=
 =?us-ascii?Q?fcPFTv908TOOxBd+MM5sWbENPvq2kXYEZfXdKOj0Mz1IsHmtK3LXxj0ez8Zl?=
 =?us-ascii?Q?BLz3FH3plo79HkgNWcnAY1WBjObx+NCIueh2kbDxJ6Ch5RxraNLbx/aUqsv8?=
 =?us-ascii?Q?KTuCu8RjC1cTHsadERCgClG22dZSk2joOlIXTGYx2vNk9tpTjKci0pMCOzlb?=
 =?us-ascii?Q?/CMT2X9nZNu6Xp/n7Neg79HdCNO6UunfTyKU48eaJo0qik7cBua9MfxSmpzG?=
 =?us-ascii?Q?t2mKDgbwedWIES5efcHetIg0cYTxJRIIkNp+/TR3ymPMEEyCDn8UBE+ka9su?=
 =?us-ascii?Q?14IcOsr3SsluSRYkfuFqXd1jpfmF3ov8EjKPJ63KGDV4WthWA86aiGA8gxwa?=
 =?us-ascii?Q?jX9fOhME/BUBx/KNoufZnE2AoNE1M17Ud9Hqwl7iR1hlpJARVC9fBSzox5oY?=
 =?us-ascii?Q?eoXO81fH7fUnJg4elRX+b3cNPcF5CRrC0M/+WK08SgcnDOhSgHrjsc49k+EG?=
 =?us-ascii?Q?SrxkjdaSxZTDlDmP93XZpzOZxgIazH/GGqVJ5Bzq9Voz5e5nVuh0GmQV/Zo1?=
 =?us-ascii?Q?Ry0ymBOSOXXzu3PD8JkJZaLlQQ6eoojRSe/6gLZYvIBS/tp0HcwkwSr+BYP6?=
 =?us-ascii?Q?VOkpLCJSJgqYEVTZopU05WdIAtjIFqkRDq4JAlO+M65dhcvcTD7pvxPuAmLX?=
 =?us-ascii?Q?abpwV0iYDmvGMjaKv/PoYDcqzkInXBoGHDSDdi30LOByF9gCTCwlOPyhc/k4?=
 =?us-ascii?Q?Re1LGIfixoA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fcQUkUhJK9NTRtxsZwxXXewP4qs1pCVDtxN/U3IsqpIMucNKJhReEIdNmTXA?=
 =?us-ascii?Q?T4LHXEyUkDlwI1ut0WB+2J4wUULPJ5rAG8ELCIcWjt9z+dFKCJbJ6uVKIiVi?=
 =?us-ascii?Q?+rNaA1hwHLpMzj90olk1/oCGpIvvP61816yVeD+6BlgC6Ix1nw5gwyBlJ2Kp?=
 =?us-ascii?Q?QIzYh9vplmI/UcIFH3+attRAMkdAyEXYsVBQv46ShO2/ACH+1u5/IEUryejR?=
 =?us-ascii?Q?9ZJO3HI2l1dT8Rz0sASRslJ/II5FLuWzwbdBIVOW8c0JtDv4+EPsstrOa8pm?=
 =?us-ascii?Q?QUd4tgzf/TfC9XIeN3/BBEgLeoaetPAktrKOgUzMAid5m+5iQPXFn490bivo?=
 =?us-ascii?Q?LK7bf3U0Mn4DEoK8TIHAKWwzdK4Ux9xJ4vaxpDvSfcdMhTRABTPTMwg6jI7/?=
 =?us-ascii?Q?LZjW6eesJ4abfLv7XV0+LULOSQ6nGqbJWjD4yQgu/Ya+uSfZoLEuMs5t3v/t?=
 =?us-ascii?Q?I6lDis765I7C6LCm5o9GOEghGpaRZk+6jdVOq/T1zq165r6ktBSKsoorOdBw?=
 =?us-ascii?Q?vi84UcdYM35oP8rdjDobAIZxTWhDf790gJ3b/yKZ8MEqxS8QyKDs/6ZD3rQs?=
 =?us-ascii?Q?Jf0kfjWQn3pAmCD78bn4P09Y2cIdFCLycFsHUFqYfGrmMdVkDbOhoEKP7lo9?=
 =?us-ascii?Q?6JhYMJ433GZIhEZVx1JjPCBM11UlY1oVZXRsCdYNVBZA27QZcE3WctChhaWa?=
 =?us-ascii?Q?Fb0JTFCj4P5girhbdt47FmZ7dYyAk+8Pn1GJtCCpTQHusLdZDEUymmyxnb5Z?=
 =?us-ascii?Q?V6z8N2JSKlX2xtGc2baerJwhDhnwancop+CecNd4MJO+vNQXCTq8f7n7Gyea?=
 =?us-ascii?Q?ScO1DHb7yMOHu61XkGCBT+riTE+oaVSrqHdSKYLcRQR/lVC0Old1/fMre4it?=
 =?us-ascii?Q?x1vCDdVVbWg1tjz0gjKJwtf25UfGmvRpUu7RpSqscXrYljJ/HurAR039ssbZ?=
 =?us-ascii?Q?kn5JOXiqOy6UXO5Ssc3actUFyabPHoyKtOHNwH+kBt1E9FTjAQVQzO1vNAnU?=
 =?us-ascii?Q?+6qaoABAk+riTU/Aw5qGI2Wi0Kcf2yhmIMV3B7xmLONUryk0zxtI1YgLyHPT?=
 =?us-ascii?Q?tm6RutGaFUBH30EEZugEYvDIArUvmKH9RnCx77GERloK8pP0E5VRbL2v1Y3y?=
 =?us-ascii?Q?zqw/CbIESfeFGAuHXMAVuDM0rrCPRKlXTyP5kPLA8NG7TTB7txnefHhZ6xLu?=
 =?us-ascii?Q?u5wfg+KIbnpmeKs0dtXR7xuVCj6uqGtbnBWNgsrvLEjfIGLV13MkvOnQxwnK?=
 =?us-ascii?Q?atvXmzGk/SZ0dG2FS8OufIUKOfIAW+fPEQ+QJi5VGjZUh/b/CZw3plovYXv7?=
 =?us-ascii?Q?creVyctlQrIVAePXUYlWJWfcZqk468oH7IY8IBIV5Uaaq4NtGXDmabmfJcAA?=
 =?us-ascii?Q?zersY0rye4wkl8ntlYZE+/zT5KlmyG4fY2y9+QLf0kW0Xdxdnrc95P5QsS2k?=
 =?us-ascii?Q?y5yIQjbHlYHFk68MywqwigxpM3aWOD8nl6bSbpUGq3/ToPxVmzqr70qiiDsv?=
 =?us-ascii?Q?TN+kxCS/kuP9nbrOqg8r3tD5RVDJjrgnFcqjyS7kdolfYpukjbby/hqGP3rz?=
 =?us-ascii?Q?9AdYj0CFTSavYp84Oxlozvditll9PUgx0fVyw8EK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f72a00-d776-454d-db50-08ddaf9a5ba9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 01:32:45.8031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7OCzpW6ncK0CKZN/cNygpNsXG+f7R1tUfi92kV+a/kOw0y8Dkdn/1VXTKl0r0BO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007

On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:

> Now we have the madvise_behavior helper struct we no longer need to mess
> around with void* pointers in order to propagate anon_vma_name, and this
> means we can get rid of the confusing and inconsistent visitor pattern
> implementation in madvise_vma_anon_name().
>
> This means we now have a single state object that threads through most of
> madvise()'s logic and a single code path which executes the majority of
> madvise() behaviour (we maintain separate logic for failure injection and
> memory population for the time being).
>
> Note that users cannot inadvertently cause this behaviour to occur, as
> madvise_behavior_valid() would reject it.
>
> Doing this results in a can_modify_vma_madv() check for anonymous VMA name
> changes, however this will cause no issues as this operation is not
> prohibited.
>
> We can also then reuse more code and drop the redundant
> madvise_vma_anon_name() function altogether.
>
> Additionally separate out behaviours that update VMAs from those that do
> not.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 167 +++++++++++++++++++++++++++------------------------
>  1 file changed, 90 insertions(+), 77 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 070132f9842b..9dd935d64692 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -37,6 +37,9 @@
>  #include "internal.h"
>  #include "swap.h"
>
> +#define __MADV_SET_ANON_VMA_NAME (-1)
> +#define __MADV_CLEAR_ANON_VMA_NAME (-2)
> +

These are stored in madvise_behavior.behavior field and used
internally. At least you could add a comment in mman-common.h
about this use, in case someone uses these values for MADV_*.
Yes, these are large values that are very unlikely to be used,
but who knows whether one will use them. :)

>  /*
>   * Maximum number of attempts we make to install guard pages before we give up
>   * and return -ERESTARTNOINTR to have userspace try again.
> @@ -59,9 +62,13 @@ struct madvise_behavior {
>  	int behavior;
>  	struct mmu_gather *tlb;
>  	enum madvise_lock_mode lock_mode;
> +	struct anon_vma_name *anon_name;
>  };
>
>  #ifdef CONFIG_ANON_VMA_NAME
> +static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> +		unsigned long end, struct madvise_behavior *madv_behavior);
> +
>  struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  {
>  	struct anon_vma_name *anon_name;
> @@ -112,6 +119,48 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>
>  	return 0;
>  }
> +
> +int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> +			  unsigned long len_in, struct anon_vma_name *anon_name)
> +{
> +	unsigned long end;
> +	unsigned long len;
> +	struct madvise_behavior madv_behavior = {
> +		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
> +		.anon_name = anon_name,
> +	};
> +
> +	if (start & ~PAGE_MASK)
> +		return -EINVAL;
> +	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
> +
> +	/* Check to see whether len was rounded up from small -ve to zero */
> +	if (len_in && !len)
> +		return -EINVAL;
> +
> +	end = start + len;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	if (end == start)
> +		return 0;
> +
> +	madv_behavior.behavior =
> +		anon_name ? __MADV_SET_ANON_VMA_NAME : __MADV_CLEAR_ANON_VMA_NAME;

How are __MADV_SET_ANON_VMA_NAME and __MADV_CLEAR_ANON_VMA_NAME used?
It seems to me that madvise_vma_behavior() treats them the same.
Why does anon_name is NULL or not make a difference?

> +
> +	return madvise_walk_vmas(mm, start, end, &madv_behavior);
> +}
> +
> +static bool is_anon_vma_name(int behavior)

Maybe update_anon_vma_name()? Otherwise the function reads like
the behavior can be anon_vma_name.

> +{
> +	switch (behavior) {
> +	case __MADV_SET_ANON_VMA_NAME:
> +	case __MADV_CLEAR_ANON_VMA_NAME:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
>  #else /* CONFIG_ANON_VMA_NAME */
>  static int replace_anon_vma_name(struct vm_area_struct *vma,
>  				 struct anon_vma_name *anon_name)
> @@ -121,6 +170,11 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>
>  	return 0;
>  }
> +
> +static bool is_anon_vma_name(int behavior)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_ANON_VMA_NAME */
>  /*
>   * Update the vm_flags on region of a vma, splitting it or merging it as
> @@ -1252,13 +1306,12 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
>  static int madvise_vma_behavior(struct vm_area_struct *vma,
>  				struct vm_area_struct **prev,
>  				unsigned long start, unsigned long end,
> -				void *behavior_arg)
> +				struct madvise_behavior *madv_behavior)
>  {
> -	struct madvise_behavior *arg = behavior_arg;
> -	int behavior = arg->behavior;
> -	int error;
> -	struct anon_vma_name *anon_name;
> +	int behavior = madv_behavior->behavior;
> +	struct anon_vma_name *anon_name = madv_behavior->anon_name;
>  	vm_flags_t new_flags = vma->vm_flags;
> +	int error;
>
>  	if (unlikely(!can_modify_vma_madv(vma, behavior)))
>  		return -EPERM;
> @@ -1275,7 +1328,17 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
>  	case MADV_FREE:
>  	case MADV_DONTNEED:
>  	case MADV_DONTNEED_LOCKED:
> -		return madvise_dontneed_free(vma, prev, start, end, arg);
> +		return madvise_dontneed_free(vma, prev, start, end,
> +					     madv_behavior);
> +	case MADV_COLLAPSE:
> +		return madvise_collapse(vma, prev, start, end);
> +	case MADV_GUARD_INSTALL:
> +		return madvise_guard_install(vma, prev, start, end);
> +	case MADV_GUARD_REMOVE:
> +		return madvise_guard_remove(vma, prev, start, end);
> +
> +	/* The below behaviours update VMAs via madvise_update_vma(). */
> +

Great comment and code move!

>  	case MADV_NORMAL:
>  		new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
>  		break;
> @@ -1325,21 +1388,25 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
>  		if (error)
>  			goto out;
>  		break;
> -	case MADV_COLLAPSE:
> -		return madvise_collapse(vma, prev, start, end);
> -	case MADV_GUARD_INSTALL:
> -		return madvise_guard_install(vma, prev, start, end);
> -	case MADV_GUARD_REMOVE:
> -		return madvise_guard_remove(vma, prev, start, end);
> +	case __MADV_SET_ANON_VMA_NAME:
> +	case __MADV_CLEAR_ANON_VMA_NAME:
> +		/* Only anonymous mappings can be named */
> +		if (vma->vm_file && !vma_is_anon_shmem(vma))
> +			return -EBADF;
> +		break;
>  	}

__MADV_SET_ANON_VMA_NAME and __MADV_CLEAR_ANON_VMA_NAME are
used here the code below. I do not see the functional difference
of them. I understand a NULL anon_name means clear the name,
but it is also just set the name to NULL.

>
>  	/* We cannot provide prev in this lock mode. */
> -	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
> -	anon_name = anon_vma_name(vma);
> -	anon_vma_name_get(anon_name);
> +	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
> +
> +	if (!is_anon_vma_name(behavior)) {
> +		anon_name = anon_vma_name(vma);
> +		anon_vma_name_get(anon_name);
> +	}
>  	error = madvise_update_vma(vma, prev, start, end, new_flags,
>  				   anon_name);
> -	anon_vma_name_put(anon_name);
> +	if (!is_anon_vma_name(behavior))
> +		anon_vma_name_put(anon_name);

Otherwise, the rest looks good to me.

--
Best Regards,
Yan, Zi
