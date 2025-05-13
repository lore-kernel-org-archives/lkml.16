Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE1E28DB53
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148649; cv=fail; b=P9efjwKJ8Pn80X15Z4ERrRTL1lFIpIFQDbv1rNsXYWmQbTlUxs6WHt96SW3p6zdCDgpeAJyWDYPIsK6fxqLoazDGoVuNZ5baOeXcomvMcdXJlQdNHDBB9buvqSeerdoNaQxYPU2YZEj/HAbDrxBfOtPUA1MCc0R4CBLJQfRx4u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148649; c=relaxed/simple;
	bh=pC9vZa/NVgALZ5KuYY8oz/Wp0wiC4BefKwfkEHIf8M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FcIJ9qPzrCVuVylvtSbiu/kQrrD+5jLUkFDDFGZRICZG2OnexfaLRH7rpp3BvtHdrJvTSHeIPUyzrZHpcyA1EXYwc1QJxb2mjSbS6GzcElQEu5Wn/nf2XC4ow2HVRaRVSrostYbZvqfWwJIzoGgMXe0hBxTVyna6+fwnoFF/qck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YNmfi93I; arc=fail smtp.client-ip=40.107.220.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YNmfi93I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKo8VK5mxq4oYIpFtXTpkiOuuM3UIv/SUYPOjQ9S/GeSlpLk3pQSlryW53UvFNVSgGIW9jCudwjLG5GXkftXqTmdW/MsurWqeuYKqDy60ATwBs0WihupeTkWlQ+hzeVJx6uk4j08yh5aubFZ6vEvLuKKCy0gFyHU3xyx0Dy5plIgdg1CU7HACm0niWcJlSLWTsCawRAHjgKxl1dJRQiHuN2IEw7hwiMUAnbleij79UmZW2P1Ag1TgeYvSy2y9yyLQG2GN2CvYmWwJlSSztLaRPFdXU7UN0aKzcpT9Ju8RH7s8pL1d+kqCzYFyChpfUAjeKXnEEePuxUK4cFk388ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTwKBDGdmKmghv8puTtLGlbJu4CEGwulbzocExGN8d4=;
 b=QX7J4/xtWsQzq9ZzBqTFi6eUsMDPM4TS2Yb8BYl3hv3ZxbKwaSt7U2y1ODvmQqLO8o5sv+u+MjTWR0m7F5ROewW66wZW4H3/bfJe9pHsNLLeUHegaI0ZVurnBvjiIkyYbJpnngOXIRoKZ3GzCsLvVrWb1nJNMiaap+sx++zOSb8yC///gYy/1VMSQk0OFvbbEq/J/fILEhKXn8GbHGORHk/u2JWmCve2hhY2/jVpOHAJWfbf52rRGnKJUe7mPzp836SAZZtfgr/0X8TwD/we4KhVycQzX02wkr02ADwJLJ4MMwjWI6YLFIAa0i2KFJez3hB6nlE0eGi/tWpMBkvu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTwKBDGdmKmghv8puTtLGlbJu4CEGwulbzocExGN8d4=;
 b=YNmfi93IJE+MOilxTCcxExKPA4ygK1UBHhoV3QiPtIh4z6qgFoAxMTLTByZivevpVjB68bx17Oo9k4Y+D4rvlxEBdaIEE6tdpzUjQDYZrkF0lJjI/S8tuGt/zX8xHmj1M06Il/Ngh7evXpFOb3np2xIYLCSljWpEt2n+cQanMdzzPPDFaN2Qbze+Mofl2Ge0UslR89a4igynWjQTJR3667oyHkmCOisDopQls5EuhVltnEe5hhnrXK2pjZ31PAj76q/EUizNJscuc2JxZmRkKUF40E06JW9XkTS5GNL2AIxrtqmjJGBKn0FmD76hNcweEDQgwG+DBx6+BUKl+2iEtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BN7PPFD3499E3E3.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 13 May
 2025 15:04:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 15:04:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Song Liu <songliubraving@fb.com>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: khugepaged: decouple SHMEM and file folios' collapse
Date: Tue, 13 May 2025 11:04:01 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <6629D237-A86B-4447-ADB1-FCAC352D4D40@nvidia.com>
In-Reply-To: <ce5c2314e0368cf34bda26f9bacf01c982d4da17.1747119309.git.baolin.wang@linux.alibaba.com>
References: <ce5c2314e0368cf34bda26f9bacf01c982d4da17.1747119309.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:208:15e::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BN7PPFD3499E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5eb380-4616-429a-5673-08dd922f66a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dx3ZwSe9huLNlKCLSZSC3MWt3xP218nBqEhA7a+NzPRS9NPO6UVcShVlLxYt?=
 =?us-ascii?Q?eL9a7cHTbqjDSCmIcnMZ8Xa693A+4oUQQzY7rSoxJiqWsAQNMCR7O0XZF47O?=
 =?us-ascii?Q?A7iX3ILMaUdbHrLvyUk4nATR3Nom1w+E/E5xNUJOHfkB+hq/f/KC3tyuetFI?=
 =?us-ascii?Q?d1AtOi994BQBZhU3ckEZULhb5PL8jZ2svRmoNeHxlEP251IXb/54cKp3Fge8?=
 =?us-ascii?Q?gCkxHSlpH5k0ML9TonZIeFJrZ72wXdKztd520dUl1pZhcVV8GGKCLQUVhK4J?=
 =?us-ascii?Q?j3k/UqEhp3b7UU3P7WEyN4qdyzjAmnOppm7t69MiTl7aH40fBnQ5S1R5PbWB?=
 =?us-ascii?Q?6sQxR++QgFNN7N0jbwM9YDcKO5b66vXxM6BIHQxDlz4VKAzCATmmzKVvEydF?=
 =?us-ascii?Q?H8oHEtVBDWIKUBYTRXv9xcrpfXgXQ6gv2GCBGww0ijJkMwkn/NusQezNtVxN?=
 =?us-ascii?Q?9cInpFtY/aKO/SrRI1svfIbAQ2E1JF8JzJTDDOYbbrNBAVQ/JRHueCj6OiHu?=
 =?us-ascii?Q?UEUK1BT+st7rwsGPK9/pAxVV41l0MZslCBkRgok5A29Hwv3kX1CVOgnFZSs5?=
 =?us-ascii?Q?D+1ZPGjhIL0LgRkRV5HJoBI36uImlWunyzHFSUihOEsvJJGVI6rcw2qwwFTQ?=
 =?us-ascii?Q?qjr5MlefN8VEMaMWcLDw6trlbe8D/t+m5rqxUT8Ia+5YqUAWVLtRswle0V6w?=
 =?us-ascii?Q?ANrs5pKKH6ajxTwI0GlET3+8GibuwKnY6ogiFOxmORVWoo/AWmcj93UloSj5?=
 =?us-ascii?Q?Hwa6epx4tZo4f/wLfNg3qyZ1KZVXWFeAqqA21N4/gj9x2SaJe3L7SKXip/KX?=
 =?us-ascii?Q?099KFFaIq58MTYq9slEwRHhnlc8kK1U65EaPf8m4fzueeFNx8tHeH5rAsU9N?=
 =?us-ascii?Q?P/a7GUP8FltSoyLokgViMkCPwe5HjEsLE0mPdzGMB1ewWJymk8uijDOQOCFy?=
 =?us-ascii?Q?CSPbdFYCZaHVwC8W0IWcak6CQYACiAYNz0fp8rjBWzavG1LbbRA3PKTiwc+6?=
 =?us-ascii?Q?RhVu+4mFEwOfxsFycXvkRrIQnvG2OSuC0ip0ZySBfeYqnhXycoEgzisvFzea?=
 =?us-ascii?Q?8rQIYexZ21l4SaMGl6larvWb+HL/TbZBMqERdbaCSrGcNxqsi8cNWOjL3Ewh?=
 =?us-ascii?Q?Y9eyahtGhTSBYlQvoxwSS37PwbfK4NWmGIRwwq6x8TDOTewZEoZikcy0nLwX?=
 =?us-ascii?Q?zKSUM0cVklZgoF9KxRIxx046SBFoOR1yrHwWeJu7viuLtz6CgrZP+0p9xLIy?=
 =?us-ascii?Q?qsYzteBXZuZX9qK2AZgNja9Eslof705iGe8fUrl48OIJ/ML31NCHPK6bEJhH?=
 =?us-ascii?Q?MAZ0B+QbwDGfmD2ZBSd7p165aEnoTGM+gczzHR/ln9dnebdI96J2WSYK2DG0?=
 =?us-ascii?Q?8qEwpjc6hYkYVAvyFE36PRNnnYW82h+UpFNzLH9Erohlrfke9MgH+K+0rGlT?=
 =?us-ascii?Q?+nVG1oVyknU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dgolf3io71gFZFWlxRnXmetn8YNYIDa1bgDc53i8EE96YzgUfUA5SXXRkiQ4?=
 =?us-ascii?Q?BGbGa/8dinDfnYrvQXPuUJEnqye+5KyqkdErWIjlAD2FU2syMScTcGnwdFQg?=
 =?us-ascii?Q?p9HEY2BRMht845lcm2RhBewEKozig/fbPVURsvHmq3b4B/GVDhZYRyvXLZaj?=
 =?us-ascii?Q?Jp+j816jg/wJg1IT07uWVBGo3kpVSZfDro2uZkSbfGoOqOwUpgskTT9UcQ4r?=
 =?us-ascii?Q?+GJY0nLsHExugxJQI4EFf05/pj8UecP4CbeOig2QLDQUNOuJ/Rs/aRjB8nj4?=
 =?us-ascii?Q?hBP2/iOwePAldnDraybYgSPyoUIcQnfzlbQ4cuVPUw819GvOgg6qgOJdqa7h?=
 =?us-ascii?Q?kKPiupZco4fo51aio9OGvFrwVw6Mxmj/mrFnMlHA5mv2ynZaT6WFJ76xe/W5?=
 =?us-ascii?Q?QKB6gXzdeL1Nn0jgGOxiq273ns7L6LIbN/v+oRipbBegDnPGGBXIKcNImIgT?=
 =?us-ascii?Q?gQo410YApr1LUwxLXoGB7XgJDYVEqiK+j1QsqrV9+T2SJAj7Ee9RqKRgKmEf?=
 =?us-ascii?Q?bLjbMtRXNdc1h+WIKE38+WwUS9g4fPpARyue85lSZ+lPdzh6kkCCmYHkp4Lt?=
 =?us-ascii?Q?pS+aSye8c1KFoxECNvvL6zqNAC0WQ7r14UVg/tIIixNE1akJ7z9RFvroZjRp?=
 =?us-ascii?Q?bS+Xrsma/CcT5yq3snqC/jdZyv4KAE2DIy/x08hK3UDjSU4kCrPCrcvv6Kvc?=
 =?us-ascii?Q?UDoeuYqHKDEXiOT7ULT7ZxakISQAKzTaC2Y5p3EM2Ta5ImokbaRyYhD28uBv?=
 =?us-ascii?Q?X/87nKD8oc6WxjVOPcsr22OUIP0HFScKcDqBLoHQD8YM+G7rldbrUVpA1J0y?=
 =?us-ascii?Q?3CWJ8o+rYU3YHqGG6uXpFJeC5Vd/4+j3VSA5NFfcRJMGl/2astzE3BjO2y9t?=
 =?us-ascii?Q?hCEGGWf1ivc6EG7m+NP7VleiWLIDHpmk9dEPZAcnYW/kDAK0WsbSFfUO6lfb?=
 =?us-ascii?Q?I5TMJKXeI8bTpYORIawOm+jM/mrU5xIYuqpKWNizG/S29BHCA5HMckkO73xd?=
 =?us-ascii?Q?ziHH6/tJ2sk08uXyYqMEYmSoEUNjHcTT7Vs5zhqO92HjwhUdgoUvQIw0RV9J?=
 =?us-ascii?Q?WggntgxEuJ1KSJ3mn1X9zqExgQoN2PCvh5eMf8D9HmFBrAxh2TCZ1QN0hNP/?=
 =?us-ascii?Q?om+A5LvosiaQxywNsESUP43LUy+bYByV3KsN7srtA/Hdy9mKav17zn3X9/la?=
 =?us-ascii?Q?yxFuIqByAAOrJ1Bsw8/wuYib5gcOuwVKXWndQNdvk3cgtlE/kT5h78G1nVDv?=
 =?us-ascii?Q?AK8d3wy94LeblHCy1PZFgE00CGnPNR54CEUp6NMmII9svm5BR5famLqM1p0P?=
 =?us-ascii?Q?HD1FvXxHqNf1Fjmgp85hTAmIL007J8QU3Nwi9TKERsWoJ+8FTlr1ZAJiuu3W?=
 =?us-ascii?Q?q8JZyobL/Go0/zR5a37YrmRT2UvCgPbqKX7xsHihZzLvRMU/EXoocbLZkC9R?=
 =?us-ascii?Q?2XM1WyepPvrYypcw+t1CRcLpn29zsHvauY2hnbN43qM/94DYv6hGGE2iADls?=
 =?us-ascii?Q?JrwTQ9uy6iu5YFHUZpDdO4b+K1+t2xVjrH4MNnoOQfyOkUqISloruzdSaO3o?=
 =?us-ascii?Q?2xwtE2yAD6gCbNJ4W2pXn0v/5whu0e3sKnfYfu/8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5eb380-4616-429a-5673-08dd922f66a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 15:04:04.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOQUWlrZ6gIre0/oR6LBti3Y4fBBa30UQhIZs9dh0aYs6VPWO+fTccjxbqKfRWhr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD3499E3E3

On 13 May 2025, at 2:56, Baolin Wang wrote:

> Originally, the file pages collapse was intended for tmpfs/shmem to mer=
ge
> into THP in the background. However, now not only tmpfs/shmem can suppo=
rt
> large folios, but some other file systems (such as XFS, erofs ...) also=

> support large folios. Therefore, it is time to decouple the support of
> file folios collapse from SHMEM.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
> Changes from RFC:
>  - Add acked tag from David. Thanks.
>  - Remove CONFIG_SHMEM in khugepaged.h file.
> ---
>  include/linux/khugepaged.h |  8 --------
>  mm/Kconfig                 |  2 +-
>  mm/khugepaged.c            | 13 ++-----------
>  3 files changed, 3 insertions(+), 20 deletions(-)

+Song, the author of READ_ONLY_THP_FOR_FS.

The changes look good to me. Acked-by: Zi Yan <ziy@nvidia.com>

>
> diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
> index 1f46046080f5..b8d69cfbb58b 100644
> --- a/include/linux/khugepaged.h
> +++ b/include/linux/khugepaged.h
> @@ -15,16 +15,8 @@ extern void khugepaged_enter_vma(struct vm_area_stru=
ct *vma,
>  				 unsigned long vm_flags);
>  extern void khugepaged_min_free_kbytes_update(void);
>  extern bool current_is_khugepaged(void);
> -#ifdef CONFIG_SHMEM
>  extern int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long=
 addr,
>  				   bool install_pmd);
> -#else
> -static inline int collapse_pte_mapped_thp(struct mm_struct *mm,
> -					  unsigned long addr, bool install_pmd)
> -{
> -	return 0;
> -}
> -#endif
>
>  static inline void khugepaged_fork(struct mm_struct *mm, struct mm_str=
uct *oldmm)
>  {
> diff --git a/mm/Kconfig b/mm/Kconfig
> index d4fd40f56178..79237842f7e2 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -898,7 +898,7 @@ config THP_SWAP
>
>  config READ_ONLY_THP_FOR_FS
>  	bool "Read-only THP for filesystems (EXPERIMENTAL)"
> -	depends on TRANSPARENT_HUGEPAGE && SHMEM
> +	depends on TRANSPARENT_HUGEPAGE
>
>  	help
>  	  Allow khugepaged to put read-only file-backed pages in THP.
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index ebcd7c8a4b44..cdf5a581368b 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1464,7 +1464,6 @@ static void collect_mm_slot(struct khugepaged_mm_=
slot *mm_slot)
>  	}
>  }
>
> -#ifdef CONFIG_SHMEM
>  /* folio must be locked, and mmap_lock must be held */
>  static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr=
,
>  			pmd_t *pmdp, struct folio *folio, struct page *page)
> @@ -2353,14 +2352,6 @@ static int hpage_collapse_scan_file(struct mm_st=
ruct *mm, unsigned long addr,
>  	trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result)=
;
>  	return result;
>  }
> -#else
> -static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned lon=
g addr,
> -				    struct file *file, pgoff_t start,
> -				    struct collapse_control *cc)
> -{
> -	BUILD_BUG();
> -}
> -#endif
>
>  static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *r=
esult,
>  					    struct collapse_control *cc)
> @@ -2436,7 +2427,7 @@ static unsigned int khugepaged_scan_mm_slot(unsig=
ned int pages, int *result,
>  			VM_BUG_ON(khugepaged_scan.address < hstart ||
>  				  khugepaged_scan.address + HPAGE_PMD_SIZE >
>  				  hend);
> -			if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
> +			if (!vma_is_anonymous(vma)) {
>  				struct file *file =3D get_file(vma->vm_file);
>  				pgoff_t pgoff =3D linear_page_index(vma,
>  						khugepaged_scan.address);
> @@ -2782,7 +2773,7 @@ int madvise_collapse(struct vm_area_struct *vma, =
struct vm_area_struct **prev,
>  		mmap_assert_locked(mm);
>  		memset(cc->node_load, 0, sizeof(cc->node_load));
>  		nodes_clear(cc->alloc_nmask);
> -		if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
> +		if (!vma_is_anonymous(vma)) {
>  			struct file *file =3D get_file(vma->vm_file);
>  			pgoff_t pgoff =3D linear_page_index(vma, addr);
>
> -- =

> 2.43.5


Best Regards,
Yan, Zi
