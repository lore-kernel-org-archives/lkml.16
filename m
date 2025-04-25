Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F2183CC3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579467; cv=fail; b=sTVXkYY1C4UIKvrYnPVZAUYfgRX2n09i5Xr9xkBCAlm3t+Fn1dNKcB1rhVrldITpdhXNOvZ7FyikHikCN2CFZCc1HaPL/o7B6SVQNhj2uhrY/ca0oCRsbx9vKOEPm9GFGT4NZfCniss49dsNtnW1SEnGZc84/9kikl48TLXTtTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579467; c=relaxed/simple;
	bh=of/L2AfnyJAl0vvVg8RbRoAx5FhIWLKt5jAYfrp1V94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=isScyUhuGjjf6fwOozt0eX8oX0iOY1vDht5lqz1qnExYkmxUmzO5h6thzE65bNnb+lzbqpaS/cxwapioabUqFNaFx+VaxeIxhcacwEDbckPe6DUdfSgKU25dP0clBuptR5mYIALYAlluCxIIM/Qp+5JT8Nai+GEKPCpYa/Oi48A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IVv+ZGM5; arc=fail smtp.client-ip=40.107.94.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IVv+ZGM5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ko7e2oJa6JHvKxjd8uzDQ2SbRvb8Wxn6xHkfoW5pu5XXZexvLRzHLlaqvjaSQhWO1fqAfBTo9cm57o4vCVFEiqSwMSR9gsra4KXp87fqeSiZw0QBDeWmApoI4VS+0IFTlrZ2ELDvVUr9xbeAFj+0K4ugAXm0QB02x619bHYhN2Pc+9wSy0OQIQg2KaSups9aoadRsA/naXi0rcu3KDn84xsJwoBpEvCcBkH9zl4lJdo7A4hfXG+TEwjrYoONWcsuP0C5Bvdar4VKz1N4yDisUJlxTZs+1cyOVGlY4w67EkkHWUErvKgcogOr45fx8n2utNry1JHqsmF7mf28i/IjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08BOKeEdAMbf09lu7JAL7DA6qxeMIXXA3soKomPtjB4=;
 b=hbX7rlGTfswYw1pVkZVnaawHBOvZBs8a9DwXd/RCydqTe7zz+PLdv6Onwhm6ig4Vd4NQo3q7/ZLjAF8F6JkhIVtjdFrSufibgITca1y2YFf5j16hx8rBV9y3WBf7jRisSgepE368EQQVZsNmjxHe1+GVcZscswnWq3K0brF2ztClWB26C38eqW+nvhrBaetptlW/MJMxELK7IV6z602pDKKoyssESExlOGBjKeUOVZjDSrwihzpiFzCchNkg0cv+iBmbughpRxNgiYH8QP7Wmt1a0eQWGWAb40BuhU+p/u7JlSyonZbpZ00aPTicTTcpPTfOz7+1fYXfs5149QEDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08BOKeEdAMbf09lu7JAL7DA6qxeMIXXA3soKomPtjB4=;
 b=IVv+ZGM5xOwnPcr2fWhyrkE6Sn6x/uIdcrjt3JKo1MuCQwYPqTUt3NA73ELHfqcfuyENzh3VkNYSg4RnvbeSDLh8b/oKHk15gDq5LSEh/cbYuQ+2uxBeRC3j2AU1xOYb6w2zfOT65mBjKA7yAaDpohtzFjF851vBU0aFxcY6vRal3JE0cD4DicFLziUyTt/E2PiJwy0GAM92fAYTV+/CBPYhm2uCd2clxh8UK3qXDgMfRdK9Cr9fDEz8hti3pjiiga8SGX2thaWPGuxavlumHCvSkBbfpHehj0WwgxeoYyI7mL39YH3IbwqkiYwI0RgRr1ZJ4RjKMD/z2fzuWEV/gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 11:11:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 11:11:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gavin Guo <gavinguo@igalia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, gshan@redhat.com,
 david@redhat.com, willy@infradead.org, linmiaohe@huawei.com,
 hughd@google.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/huge_memory: Adjust try_to_migrate_one() and
 split_huge_pmd_locked()
Date: Fri, 25 Apr 2025 07:10:58 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <40B90370-92E1-4E12-979D-7220887CB780@nvidia.com>
In-Reply-To: <20250425103859.825879-2-gavinguo@igalia.com>
References: <20250425103859.825879-1-gavinguo@igalia.com>
 <20250425103859.825879-2-gavinguo@igalia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:c0::36) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA0PR12MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7597e0-d03e-48d6-7fc0-08dd83e9dc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HbcQdD9GfPV/jx8AZOWIopiB4lXyi/TxygYwXozcXLDpTPAYIa8IfK9eCdvK?=
 =?us-ascii?Q?FyPeOBSvxkZnSPclccHMXHia9Sryb2/Omnu20NvNdwP+D4tgnkT851/Eqq8f?=
 =?us-ascii?Q?80Vsb5MQTtWopB3wbN55eGZHGfCrvBjUFcaN+yz2I10gq981qaKmeNmYaNQ4?=
 =?us-ascii?Q?+cX/kjQuYwzndh3LAaWMFZQRI7Do4j7WW0uuj6bnmiYPJ4CvQmO+jTck9MhH?=
 =?us-ascii?Q?yp9XtRlDGCMz3NPNeYTXnqKNpFqfVnQ96jRxkgarkM8pI1IcIxMvFuOQKXoX?=
 =?us-ascii?Q?KZYeGZYbTlXFIeUj0PtmHW0Vz4RjxGU/rJtVAf+I+iLrGwWkoHPSxn29EuZz?=
 =?us-ascii?Q?GEti9C2/cxvy1o/wJ/mVVXox0aHe5U4BduKOXGUcYxP4n4w1/aFSdWHsI1YZ?=
 =?us-ascii?Q?WEg9/HwErAb/4Q5FoRTmcEaRrOFaMqaQTRKWtfwDxrqRZNSJ1mBgBPBA0cjs?=
 =?us-ascii?Q?qYRQbfD9hWOEKmOFMCeUBCjHhA4gLfKwxH71f0VYdSHL6LBxykQ6S9vo1wJB?=
 =?us-ascii?Q?PrWeGgWEMi1h3VFf9pKnZpzSwn/HqVCBKC0z+04W8jdb3E4yj28w8oM457OQ?=
 =?us-ascii?Q?Zndu/lzeLz0hzbyd4ELuTbxs8bS84FCrZ8FgtjTJ7SGTYaZbqjGcvE80Z7eV?=
 =?us-ascii?Q?3xan7DxIbSsWXdLw/pjaNg+1T3LDR/NKDgR8C7DwDPcUx7O6NAkxGx4gFS5W?=
 =?us-ascii?Q?hk33ug4PxQ4T9C0AYcEsJu+7ehG2NQsh06g6Zor46FP9gd052WfTkAvUiyLD?=
 =?us-ascii?Q?k/xyqzSYoxHMVAEm6UgxGDIeGi0s7P/+L9KOIuriBs7Yj4Jly4lIH6VaGkEX?=
 =?us-ascii?Q?h6h1QlOncyv1GfZI4ArTLMzN+AlclWZfcZ62VJpF+Oj/hUgjW9g2f/GwncpN?=
 =?us-ascii?Q?E7UicT7zX37Qtf1oBi4zcuUUyVKJ1VNPIAtJWS97gyXlCzX4cpuvTFei5TB3?=
 =?us-ascii?Q?durtdNs7j31jez3u6CzlrGQD/lzrPQk905b61Mo6UI4G3Db6wClG6FCDhixq?=
 =?us-ascii?Q?NyrklR678KE+BT4pzLiIsGdb5kpVqnt1hNPN7pTH4JiP5e0DO5kA88B2BI7w?=
 =?us-ascii?Q?YQ/0sDd+Tq1HI1C2RGRiHhKq8+W8p85bsZEi3EeEzXngGNhVJOuf9p9yURSm?=
 =?us-ascii?Q?kUlt9KL3HHBTrcoErf91FWDY/vG1m9UPHjJUjVQ6mskGIlsPLi2ow9cETMPB?=
 =?us-ascii?Q?3GY/JnYz/dLyocaXf6Wb/S7i+KiYh57R8WcPlQqzKjRLwxLQ1dkYd3J7PbkN?=
 =?us-ascii?Q?HsNLzf/5BlLW2+OvtocTzRQwGherM1E1kQBujR1Nj9Tkxio5+JBaPKHN3eqb?=
 =?us-ascii?Q?bZ4bCUu2MoWYIWJm41oqTAkb+CTv/wH6I0lx1S/ezXHDNqHd0uRG9Llqtu5r?=
 =?us-ascii?Q?xvKtQ3lWYI9l2LXV9DPva9BirCZKKCYK5gShPLDsQVIOIIl2SVMufy92S+Cx?=
 =?us-ascii?Q?C1SK2MT75/E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WcfzPfR9LYM+K933IY/mu1G/TiekyNsmQ8Io0ajUMznR3ihVOtt588HaLHVZ?=
 =?us-ascii?Q?cxFNkddtdEdwF+Qhlyy+xkFdTOpcKI+fYWsLBGlffqoNXaj+6dJ51l9EMXI4?=
 =?us-ascii?Q?F+qorO8L2yJFL4zFRXLn0iMIYj+SpLKRXPw4zeI43ORhRuNhTCKT2L14sDHC?=
 =?us-ascii?Q?zerOeZhk4Dqom3W5+Orxumufu97DSlHGe7kpewA1ofuiIYR5s0Hrkta610wF?=
 =?us-ascii?Q?keUoLC8TfHRtbdyN2cc3U39wI6LXXr5yCxkzikhqlVlgV+prIRnLhkS/0D56?=
 =?us-ascii?Q?gvVjWm+6xJdeivC40SME4FLTVnf00aRgwZsXjkn6wVrTx3PKDBVMr6YkKTFo?=
 =?us-ascii?Q?C0kb8NdCL3De9gjAw5fKVEh6ThSUPf2FyiSALM4c2WCJqxhPKVL92NYkYHmI?=
 =?us-ascii?Q?ZdtNO4umPH05eqE/EDy25S7A0LB3fOOE5GaNU+lqevXbUWIvmmLNQVqYR97u?=
 =?us-ascii?Q?jtpwabBRzr5WzQ1YtYf+xH+oJLvtsv4pEBTW2uuBPG9nq5pAMwQiXBFJ4of7?=
 =?us-ascii?Q?PpdSYBYrUG8U8xSXFc54P+5xUfec6yeZLMhri9ChmprZcNRWrvyW2f3lZxdo?=
 =?us-ascii?Q?lwQagHHmHnwHWL3Wy/27YAsFb7frmLisMxl5F4PyOLO7Uc3fyB/RQRdQwNsQ?=
 =?us-ascii?Q?6qN3DxTcKKxZi++ih+l9tZ43Vfr1yRe/wXRQJ/0JYECeWvjo30mo4de+DCnd?=
 =?us-ascii?Q?k6+hJPfOWTphJOMiYIk8I/lk/z3iUSxqxXrS+xz6iFxCFBpLekK/m0Nzf3nk?=
 =?us-ascii?Q?EPMH4FxcZpdHilEqPhf6bitxmaaSGGsCyJGxCvdFwAwbQiyAIwqlURf5VGJr?=
 =?us-ascii?Q?3gozEi/+9LbjihpdO4vLUGNy5rUdpBvG2E2Cm33gB7Lrb4sebj/XpT9H1LtU?=
 =?us-ascii?Q?WcFrIoToXpkCxA9ZEn4HH2B0+S2wRKl1CfP9Pukgfq8bd9GJ/RtFbnDtcTf/?=
 =?us-ascii?Q?eCN9pL+WoSw2PT+NH8qHLkTkoPCsA8gLKYhd6oJBVHnQDRN3mT4N451BVAcD?=
 =?us-ascii?Q?TTe3fq5IKf7ocgdt9L/kQdCOwjLAuC398F9ZIsxmW85p5t8/401mOS2f9//R?=
 =?us-ascii?Q?Pi+jlbKGy8F0Rrb/0ZIojCS3g43gXm53ZXEb3Ug4tPXgYfNbHexld1G54m89?=
 =?us-ascii?Q?P8IYBnstlwxm4BUM7amIPeqioeHWwSlhKVDfpt+iNDY4OYcGZV2zeup/anc8?=
 =?us-ascii?Q?ZamqgYwR8utBaSc8AXajxd2CEw+spKqzxB2u5lVuSOk1nmE1QlBGyL6X2+Bb?=
 =?us-ascii?Q?JcJXSM8sSeMYMFXS/UQAU5NYgs+4Fe8nHuJkYQCi6W0BQdCECG1Csa/27v4l?=
 =?us-ascii?Q?uYEJSRELlBChAyay6jsA+QUYWPgoa1ptQjTthk+11XVRafDDBUY4rWxTsio4?=
 =?us-ascii?Q?Oqyx2Q362MyHZHrAYiz7v5OKcLfueHgKsa7kuJsLknCl2diY77RDWX8/dEos?=
 =?us-ascii?Q?oWn5T2BSeWPsIVeboajvbQXh9ltxAzJpAo9o1KB4azNcO/z/iRiOSvtN9Z+c?=
 =?us-ascii?Q?Fh8NO4aKduOvpW/otuAFMUFy2PsKc8LK3zX4LMWT/TGU0uLIyL2sYIk887x1?=
 =?us-ascii?Q?2FkT2mtdJIfu19ILB6jMn5MejHc74+ge4BdkkHEr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7597e0-d03e-48d6-7fc0-08dd83e9dc57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:11:00.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9Q/hvx8YzQlonf0hUocpMbtUCl7gRACGSoPaDKD09Hy1HZZ3JWaJOpxpCzvZf3k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092

On 25 Apr 2025, at 6:38, Gavin Guo wrote:

> The split_huge_pmd_locked function currently performs redundant checks
> for migration entries and folio validation that are already handled by
> the page_vma_mapped_walk mechanism in try_to_migrate_one.
>
> Specifically, page_vma_mapped_walk already ensures that:
> - The folio is properly mapped in the given VMA area
> - pmd_trans_huge, pmd_devmap, and migration entry validation are
> performed
>
> To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
> handling to the while loop checking and removing these duplicate checks=

> from split_huge_pmd_locked.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@=
redhat.com/
> Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@=
redhat.com/
> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/huge_memory.c | 21 ++-------------------
>  mm/rmap.c        | 18 +++++++++---------
>  2 files changed, 11 insertions(+), 28 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 47d76d03ce30..485a0ba011af 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3075,27 +3075,10 @@ static void __split_huge_pmd_locked(struct vm_a=
rea_struct *vma, pmd_t *pmd,
>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long a=
ddress,
>  			   pmd_t *pmd, bool freeze, struct folio *folio)
>  {
> -	bool pmd_migration =3D is_pmd_migration_entry(*pmd);
> -
> -	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
> -	VM_BUG_ON(freeze && !folio);
> -
> -	/*
> -	 * When the caller requests to set up a migration entry, we
> -	 * require a folio to check the PMD against. Otherwise, there
> -	 * is a risk of replacing the wrong folio.
> -	 */
> -	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) || pmd_migration) {
> -		/*
> -		 * Do not apply pmd_folio() to a migration entry; and folio lock
> -		 * guarantees that it must be of the wrong folio anyway.
> -		 */
> -		if (folio && (pmd_migration || folio !=3D pmd_folio(*pmd)))
> -			return;
> +	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
> +	    is_pmd_migration_entry(*pmd))
>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
> -	}
>  }
>
>  void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..b53a4dcaeaae 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2291,13 +2291,6 @@ static bool try_to_migrate_one(struct folio *fol=
io, struct vm_area_struct *vma,
>  	if (flags & TTU_SYNC)
>  		pvmw.flags =3D PVMW_SYNC;
>
> -	/*
> -	 * unmap_page() in mm/huge_memory.c is the only user of migration wit=
h
> -	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
> -	 */
> -	if (flags & TTU_SPLIT_HUGE_PMD)
> -		split_huge_pmd_address(vma, address, true, folio);
> -
>  	/*
>  	 * For THP, we have to assume the worse case ie pmd for invalidation.=

>  	 * For hugetlb, it could be much worse if we need to do pud
> @@ -2323,9 +2316,16 @@ static bool try_to_migrate_one(struct folio *fol=
io, struct vm_area_struct *vma,
>  	mmu_notifier_invalidate_range_start(&range);
>
>  	while (page_vma_mapped_walk(&pvmw)) {
> -#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>  		/* PMD-mapped THP migration entry */

This comment should be moved along with #ifdef to avoid confusion.

>  		if (!pvmw.pte) {
> +			if (flags & TTU_SPLIT_HUGE_PMD) {
> +				split_huge_pmd_locked(vma, pvmw.address,
> +						      pvmw.pmd, true, NULL);
> +				ret =3D false;
> +				page_vma_mapped_walk_done(&pvmw);
> +				break;
> +			}
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>  			subpage =3D folio_page(folio,
>  				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
>  			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
> @@ -2337,8 +2337,8 @@ static bool try_to_migrate_one(struct folio *foli=
o, struct vm_area_struct *vma,
>  				break;
>  			}
>  			continue;
> -		}
>  #endif

I wonder if we need a WARN here to make sure when THP migration support i=
s not
present all PMDs are split in try_to_migrate_one().

> +		}
>
>  		/* Unexpected PMD-mapped THP? */
>  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
> -- =

> 2.43.0

Otherwise, looks good to me. Thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>=


--
Best Regards,
Yan, Zi
