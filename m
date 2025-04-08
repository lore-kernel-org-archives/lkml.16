Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E791B4A21
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153551; cv=fail; b=HLlYlP1IT/6m+sMIGbXwr3FVx+6ittD/kH3W5JsYCri58wiDWtN2JrL/1/opmTXTUo7TNU50pbEMqw7pg2Z/flp7G/vEGWM6rpr2Qae1EVY/BTIG7tKZsS8FYA1Ji7ejYahqKtimju3Tgfnfymfuc3+d9nHART6q85e2JJJFDJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153551; c=relaxed/simple;
	bh=hyuo1S6I2Fr5JaSZcIZmZZl62kACI4nbsCG15IZXcRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qSzg3cfzTZyqZPRTHHcOegvOhSKW76JkA3TNYLX5ITKjDKtulU8L0f6Aa7j7Z6ym6J2uty3G5J0AV9U+QsInCfsI6Y64/XKxzNQUSydCL+2cxAh6OSTK3rT70Vys0FoGOd8dPJTmplg9sS+fbm/b3zK7ZXjymJhEqKcjD15MMcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S/6VDOoz; arc=fail smtp.client-ip=40.107.93.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S/6VDOoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1XW12pEWq9C2OxoUPeHztqtpuDLkm1pAAkqn2xN/JgYk6q72kZWSwYxy2K+WYpTMKyuR+v/vwZglBG3VxEnj2e0DNASTmX58YCVI6C1KJwpINKahd3+MtdY6Z8tS/pMPt2GpXci0CFy2155T7Ec6ZrBtbvXeNqbj09wsZiiFzM5NMR6jEq6kBj5NMYlyrxBhRlhgJjBzPfJ7AwijIdNxwXRUb4tFlOVS+UcumZTqfkPqklHPkQeo0dh8hsEzYXF+OoUiBGU9/j7YQGZDT6bEsigR68e4rO4GRgqCPC+bp3Ugj8Ak45aQIPnBw0aMKS3JDKxpqaAnwy0l4xVoaTBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkd8STPjfs5O7LliYySagSdWRtrFCXytUXVVMKq3dUs=;
 b=UxT66SRhunWPQfKspKBOqlhqkLxqk9kFPyezIAwOjVY7bxR3HnXjSfbu25P6o2nFR3BaXOqVqK/PjDwPlwrXh8sBXO6n+tJYiDuPUJuq7b3ng2tGxlpkriDNSlYR1NAQ27RLJiaxco438ybAFwFabsqxa1mMb3rWF2t5RZqWsNuBVfVO0esSVeBLLNNDV6VledqdopfNtiHv78dRSDh6hnyxK+BTjLwFnQqYBfJImmoDpxoTf6YHxN7eoYwge52oYOSLxYWsOfXjROX+6gQRZBC/YToxVp7pPit9Qc85AuQhbraoB1GwqNszxsmJ7XEl9f64hAgRtCYqNU9QWqI6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkd8STPjfs5O7LliYySagSdWRtrFCXytUXVVMKq3dUs=;
 b=S/6VDOozwjLkgwe5iAq+r2hMlmbkBOSH+uR6nT/lWW1vsHkdEOPKm4gU1njjMibb9c+FqcE/6A/js5MJpOy0ndRbDbDR67rIld6E4Vb6tOY08YS+vAvBe5/nsS5TGnaIJMjSQrOACXfNk9jR6l2Lc8N+kpl0xZs9mum38VUKjnzBky4tGWeUP8bppVV1R5s74ssurN8OTVC0ccbHnYJARGg3/coVTtKtywGsZZr1Pk9bfN4i5I4Bpi/M8iqgC2lLRc2AaxixLqWPoqlRlHoiRNq3gdjgqZJMydlaiqXTFx7bBHQwKvdBwUYN+3yC8IEsf/de8n5SuhARbK3dXegE4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM4PR12MB7720.namprd12.prod.outlook.com (2603:10b6:8:100::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Tue, 8 Apr 2025 23:05:47 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8606.035; Tue, 8 Apr 2025
 23:05:47 +0000
Date: Wed, 9 Apr 2025 09:05:43 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, akpm@linux-foundation.org, peterx@redhat.com, joey.gouly@arm.com, 
	yangyicong@hisilicon.com, ioworker0@gmail.com, baohua@kernel.org, jack@suse.cz, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dax: add devmap check for pmd_trans_huge
Message-ID: <qzqanugi6qbbucxp2fn2456t4n7q4lj2enhzf4z767jpcbgacu@37cowlipfmgo>
References: <20250408085914.1946183-1-mawupeng1@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408085914.1946183-1-mawupeng1@huawei.com>
X-ClientProxiedBy: SY5P282CA0074.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM4PR12MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a87b81d-6876-4f65-0084-08dd76f1e5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tWdjtYY9fVE+dLhSupPXHtR+IilVGZfHQlBtUhFL4WF/M2KqlLmvWV92Tk/m?=
 =?us-ascii?Q?/Hf/P/NXmVsMx7o3yH7D7+x1TyQNQBqfIIwVvgPdWu+3/CUHO645XcBOOShF?=
 =?us-ascii?Q?qecHsMiipIYcz2Lfb2Fd0eXubRQwj//wM4+nOKWIeLnt08vnNCS1JWJiTxxf?=
 =?us-ascii?Q?ePbdh/Yc9CzH6zK9cG2jI09X2j28KbEppTe+XBOzyVPMqFKCAxLmWnr2fHKp?=
 =?us-ascii?Q?Vhu/VNCjpHvA13YJn5eRJlpjyFkElYHph35rVr5VTA1kZ0E33q8vmKVV+5EB?=
 =?us-ascii?Q?yQ35N+NrMANa5a2XQ+jq8UNcxo98Xt5FF7jLhyqHi362JBnnGYpr8jl9lS9J?=
 =?us-ascii?Q?/dJQ6gZADFVaxuBy2J4NNsZjURZYh8fz7vO7lG9qVRpuQxN9mD05waggHc56?=
 =?us-ascii?Q?aTzd3tau+J/PWwoAAI0veWDzIeQKCWPTe+7Zt9gTIlUo9MHlC6M+MTYejrtS?=
 =?us-ascii?Q?ixEAL0KgbBLhXsgxxJpLT3eR89F9d4I3bbge0EedCtkf8JdGfbX8I0kvsAN8?=
 =?us-ascii?Q?6kRoHbFdQlI+ktxqoT3X8LWw0BC+5bKXnl1pL3hFFfw1af/Bl0evCLChabpe?=
 =?us-ascii?Q?OubuW9Cb6e4E+xGVfpv/zk3PX1B+1zUzW7OrekPJ8oi4dNqMlwfkiTQnj1d5?=
 =?us-ascii?Q?3fHLBr8fJqUPQfeskjbBEbbeQlRN8wsj0rOs3Cdsf2D+7dKZLFLDXSbTRmz3?=
 =?us-ascii?Q?wFZ3qBBHes9iUJL22jPWPo+Cg2Hk5W+NC9Q6xiTAzLB14Iz+t+yCj74Job1C?=
 =?us-ascii?Q?l+49EqXV6o+ZnKMLk2Xqaint22WOFtkgL4I25junJbleXGBLEWYoqFOZ5bUE?=
 =?us-ascii?Q?fQ+ncxztczfAGSva3vqIx85gEfBY+LO6PZl2ddph88o44mbexMC7svLvPcCp?=
 =?us-ascii?Q?12BAR1cxC4jNUwPLHNEdj8uLpd3wIBg+uDdX1L45SVBlTpuE1v0t6jvt3l0V?=
 =?us-ascii?Q?MfkMHsYrxyELBROWvoZvBONvvf5OBZP2fm6UCLeheUME/+UNyPnHtaCSWaIx?=
 =?us-ascii?Q?2fR5kNJvvs8/0D7Xe8IzUACrPE/3tRnPV5Cv3odqqkeqMpszDUZV6EZTGlrv?=
 =?us-ascii?Q?BzbnsLC7M3GLrvFWGs7t98AzyviXfWQnyEpKuH+jlZJHvQAJCmL2dMuhjPzy?=
 =?us-ascii?Q?ph8LIXYlsrzliOtGf3Dh+YMqUT75a5om4ONC3pXTRBxCsX58yiIiPvph/0LL?=
 =?us-ascii?Q?wgnUprUxom47U/bLBfFqVwpqmT5AUDI/q8v7xMUW+ofTpDPKz9JTVO5uWXTo?=
 =?us-ascii?Q?5seDPeOmmrNpUkqJaXgihbTxfgdLvA16tUEEotASlUgcZvDT/SNhSYzBskZJ?=
 =?us-ascii?Q?t7SNNHzNB73Jnsldd/P0Hu6Q5u1IPlVxRC/Dyl+MtiW06Rd5NsqFJfh+FlLj?=
 =?us-ascii?Q?TzYFM0gF3/PRlXEhE/TiHUIMVTco?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+/46ehfMLUlp0F0uuGDqaL3BBUTNbafaI0DpxGP++CFhxjc/svjfFlZnqj1h?=
 =?us-ascii?Q?6aoM1GdEmpPyvUR83fiHfjTyWS1qs56BX+JioNy6Kuju0O2yB2rdeJeuLMcd?=
 =?us-ascii?Q?PLJC7GadsxSLBfFz//021Yal9MebfhVNeFqUOERrjkH/83imPSmdH7hUOsTr?=
 =?us-ascii?Q?ncf3a13CjpXxO/l8hJJYTUyvvtcB6mtXfqlTJWWVwgZKwxhNqq33+DsPazZ8?=
 =?us-ascii?Q?xxWLqH250ctVcH73leMyElQfN4HfjaWsHTBAlfkOzzlfKNBv0rG2Rz5aV8qV?=
 =?us-ascii?Q?U/+Q0E2XJhVFr5wntckkUs7/QNG1uJykNe9R5mtpKr7P/dEHw/DfWSRu78mp?=
 =?us-ascii?Q?qj4FuMhGQ9J+SBANijVDLPLQEFhy9EEooOXDrGckiNmt3YqG9nVorMBq2sle?=
 =?us-ascii?Q?22ks0zbqsmEx8sjR1y+i6je0Qx5Ms4PoPYD/osA/n3MS9/JiPjdUy5NJ6kkx?=
 =?us-ascii?Q?Oc6dAbQxcz6AIMQxh+wLSqsu17tYqAR1FiikgUr/Ci1gZ2gQSiABcfS3YPdX?=
 =?us-ascii?Q?l3j1BubdiM+TT8UWj4QDd7tKkOwYQMgpwiquuH4FPl3srB3K+WQZ3F22CpiR?=
 =?us-ascii?Q?ckmL6g5HLOBSCiCKNg4NlYq/TCZo0QM5Jn++iCxz1HBR6d6uZmOiCi+fF1et?=
 =?us-ascii?Q?Hyj5qiKyKPehVDFuEggkaaVcVZUq3AyxvrmoQjE+c9oX4Q4bR/FcwKNWDIdn?=
 =?us-ascii?Q?NC3o0YKGsmcAyzdyGpONZNlnSNhCO2Wbf18KvxSgO6N1QwDHYRkJ1zdnCNOq?=
 =?us-ascii?Q?quKgyqf60oQ8oSWSLxVUb5krG3Spj25tKyQMIOBIuZ47Xvuo0hIwF0gbO5d6?=
 =?us-ascii?Q?evFL1Epwo6yr0Ev8FCJyQ43uhSSUNynIv13FsMjNut3m6tNyXW8LpWcvKeXw?=
 =?us-ascii?Q?utNUgmTDEOmNwYBicMxfUMhtr/XelA24C6z+I48dYY4wy6LdrDRK+IVEOKk5?=
 =?us-ascii?Q?VBuZTY81dGBkz4pO0ve/oOPiwhtB50SnXQHSJAgdf6LFqmLl82HCZS49pnaQ?=
 =?us-ascii?Q?AZcnyAOkLt8T0sOlw+wbnw3TQdaLFuwpR+cSxOYscE6tIRN+gAoaYU5q6j/4?=
 =?us-ascii?Q?Cvtz5NQt7z04QJwl2Ey7no3jXxtLuAdCEHXHfZ0TYa4997gBy1eXq7vK+nli?=
 =?us-ascii?Q?JEC9IqHXFQ1QR5NBW33nQtBeIRJLk0N4Tc76T45E98AhzPH5P9Us8YEEG5Eu?=
 =?us-ascii?Q?t2rn1l/DoIqUzUMLx4uOC4uvO09pCzhUbZ5/lYbtAheS3rG4rjGgrGrjHDMa?=
 =?us-ascii?Q?RXMWPecWhD3I1L4zlqsm1NPAo/MyLkRvGbpw9pJ/ZAzA3Q0YZ1GFx+SVbql3?=
 =?us-ascii?Q?Y+YjHOhzPhLMtrt/NmX7cTgbNhfR8TATsyvr8x0euXq4S5FETE988N0zdnDI?=
 =?us-ascii?Q?AKb/THcO0IawSnBFePv7ulbhJ7lqbvLhj7ZJUpkOHfvNbpiHiREOxr4ee5N5?=
 =?us-ascii?Q?F8OvBc3FLyI7Z7fw/IDFZOANku80mnRncyB7pnGFzR/rZW8Ipej/j3+QifbE?=
 =?us-ascii?Q?Xp11CvhPcg8xrxVr4o78cdoiUTNMBgthfGsMiZAM6PMYlqEcqtWGjpCYYNf9?=
 =?us-ascii?Q?3naZiLe0MpFASbFzcB4AR8HddYLAxbXlBn+mVoBK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a87b81d-6876-4f65-0084-08dd76f1e5b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 23:05:47.1892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P49NH9UldPs0jpEAPv0oqE2tUCM6cM6d7vUACWY3IZNegdI50dYFyAlU6/5BdBQ2PiDdQK3BpdRWgWNWuwPvfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7720

On Tue, Apr 08, 2025 at 04:59:14PM +0800, Wupeng Ma wrote:
> During our test in ext4 dax linux-v5.10 on arm64. A BUG_ON is trigger in
> follow_invalidate_pte as follow since this pmd is seem as pmd_trans_huge.
> However this page is really a dax-pmds rather than a pmd trans huge.
> 
> Call trace is shown as follow:
> 
>   ------------[ cut here ]------------
>   kernel BUG at mm/memory.c:5185!
>   CPU: 0 PID: 150 Comm: kworker/u8:10 Not tainted 5.10.0-01678-g1e62aad66bbc-dirty #36

This is an old kernel, and I couldn't correlate the line number of the BUG_ON()
probably because you have patches applied. But I assume this is the VM_BUG_ON()
in follow_invalidate_pte()? Does this issue reproduce on more recent kernel
versions (eg. v6.13)? Or some other upstream kernel version?

>   pc : follow_invalidate_pte+0xdc/0x5e0
>   lr : follow_invalidate_pte+0xc4/0x5e0
>   sp : ffffa00012997110
>   Call trace:
>    follow_invalidate_pte+0xdc/0x5e0
>    dax_entry_mkclean+0x250/0x870
>    dax_writeback_one+0xac/0x380
>    dax_writeback_mapping_range+0x22c/0x704
>    ext4_dax_writepages+0x234/0x6e4
>    do_writepages+0xc8/0x1c0
>    __writeback_single_inode+0xb8/0x560
>    writeback_sb_inodes+0x344/0x7a0
>    wb_writeback+0x1f8/0x6b0
>    wb_do_writeback+0x194/0x3cc
>    wb_workfn+0x14c/0x590
>    process_one_work+0x470/0xa30
>    worker_thread+0xac/0x510
>    kthread+0x1e0/0x220
>    ret_from_fork+0x10/0x18
>   ---[ end trace 0f479050bd4b1818 ]---
>   Kernel panic - not syncing: Oops - BUG: Fatal exception
>   ---[ end Kernel panic - not syncing: Oops - BUG: Fatal exception ]---
> 
> Commit 5c7fb56e5e3f ("mm, dax: dax-pmd vs thp-pmd vs hugetlbfs-pmd") and
> commit 36b78402d97a ("powerpc/hash64/devmap: Use H_PAGE_THP_HUGE when
> setting up huge devmap PTE entries") already check pmd_devmap during
> checking pmd_trans_huge. Since pmd_devmap() is used to distinguish dax-pmds,
> add the same check for arm64 to fix this problem.

That seems correct to me. In practice most callers of pmd_trans_huge() that can
see a dax-pmd already check for it explicitly with vma_is_dax(), but there are a
few cases that don't.

> Add PTE_DEVMAP in pte_modify as commit 4628a64591e6 ("mm: Preserve
> _PAGE_DEVMAP across mprotect() calls") does to avoid the same issue in
> mprotect.
> 
> Fixes: 73b20c84d42d ("arm64: mm: implement pte_devmap support")
> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500b..b9a618127c01b 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -740,7 +740,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>  	 * as a table, so force the valid bit for the comparison.
>  	 */
>  	return pmd_val(pmd) && pmd_present(pmd) &&
> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> +	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID)) && !pmd_devmap(pmd);
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> @@ -1186,7 +1186,8 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  	 */
>  	const pteval_t mask = PTE_USER | PTE_PXN | PTE_UXN | PTE_RDONLY |
>  			      PTE_PRESENT_INVALID | PTE_VALID | PTE_WRITE |
> -			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK;
> +			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK |
> +			      PTE_DEVMAP;
>  
>  	/* preserve the hardware dirty information */
>  	if (pte_hw_dirty(pte))
> -- 
> 2.43.0
> 
> 
