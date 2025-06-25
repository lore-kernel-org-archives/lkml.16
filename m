Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FE14C83
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825720; cv=none; b=jrFfbv92b7hNL9vlOe33Ox6y7Mc7h8AFsktgPYQJmQ9goIlj5+r3jFO3D9c8muVtgg62/87Th1dVonSPvi33vohlGbdlikHu4aqvDBJejekRzE2j00UcvE/su3JPuq5CFim4XmvnaiSvfv71qsq8Hhlu2/Kcfe9gfKVyuPGo8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825720; c=relaxed/simple;
	bh=btd2rfpBu/rAsC4hlc8GQoMpxvHTTjCRmNX7cdtBqVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxtF5EBiCSdBj2B8fPnEMOoEB+ucXd1B1jwuQIGUOBZfI/wJlKN20JwRyH17LwsfRe/RjpSRz9owBBalJbulXsIM290kkFYoPDJOmW3C6iCbup0HTZjlDzxRG60ZwxDoomJvHFON19rusiYIPOfy24nJes/eQ7PcFJPyqNq6po8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C4D113E;
	Tue, 24 Jun 2025 21:28:18 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B39513F58B;
	Tue, 24 Jun 2025 21:28:34 -0700 (PDT)
Message-ID: <9fb04185-5b71-46c0-b62c-0e0e6ee59e6e@arm.com>
Date: Wed, 25 Jun 2025 09:58:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] mm/debug_vm_pgtable: Use a swp_entry_t input
 value for swap tests
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand
 <david@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>
References: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
 <20250623184321.927418-2-gerald.schaefer@linux.ibm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250623184321.927418-2-gerald.schaefer@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/25 12:13 AM, Gerald Schaefer wrote:
> The various __pte/pmd_to_swp_entry and __swp_entry_to_pte/pmd helper
> functions are expected to operate on swapped PTE/PMD entries, not on
> present and mapped entries.
> 
> Reflect this in the swap tests by using a swp_entry_t as input value,
> similar to how it is already done in pte_swap_exclusive_tests().
> Move the swap entry creation to init_args() and store it in args, so
> it can also be used in other functions.

Makes sense.

> 
> The pte/pmd_swap_tests() are also changed to compare entries instead of
> pfn values, because pte/pmd_pfn() helpers are not expected to operate on

Swap entries compare is also happening now in pte_swap_exclusive_tests().

> swapped entries. E.g. on s390, pmd_pfn() needs different shifts for leaf
> (large) and non-leaf PMDs.
> 
> Also update documentation, to reflect that the helpers operate on
> swapped and not mapped entries, and use correct names, i.e.
> __swp_to_pte/pmd_entry -> __swp_entry_to_pte/pmd.
> 
> For consistency, also change pte/pmd_swap_soft_dirty_tests() to use
> args->swp_entry instead of a present and mapped PTE/PMD.

Makes sense.

> 
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---
>  Documentation/mm/arch_pgtable_helpers.rst |  8 ++--
>  mm/debug_vm_pgtable.c                     | 55 ++++++++++++++---------
>  2 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/mm/arch_pgtable_helpers.rst b/Documentation/mm/arch_pgtable_helpers.rst
> index af245161d8e7..e2ac76202a85 100644
> --- a/Documentation/mm/arch_pgtable_helpers.rst
> +++ b/Documentation/mm/arch_pgtable_helpers.rst
> @@ -242,13 +242,13 @@ SWAP Page Table Helpers
>  ========================
>  
>  +---------------------------+--------------------------------------------------+
> -| __pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE |
> +| __pte_to_swp_entry        | Creates a swap entry (arch) from a swapped PTE   |
>  +---------------------------+--------------------------------------------------+
> -| __swp_to_pte_entry        | Creates a mapped PTE from a swapped entry (arch) |
> +| __swp_entry_to_pte        | Creates a swapped PTE from a swap entry (arch)   |
>  +---------------------------+--------------------------------------------------+
> -| __pmd_to_swp_entry        | Creates a swapped entry (arch) from a mapped PMD |
> +| __pmd_to_swp_entry        | Creates a swap entry (arch) from a swapped PMD   |
>  +---------------------------+--------------------------------------------------+
> -| __swp_to_pmd_entry        | Creates a mapped PMD from a swapped entry (arch) |
> +| __swp_entry_to_pmd        | Creates a swapped PMD from a swap entry (arch)   |
>  +---------------------------+--------------------------------------------------+
>  | is_migration_entry        | Tests a migration (read or write) swapped entry  |
>  +-------------------------------+----------------------------------------------+

__pte_to_swp_entry() and __pmd_to_swp_entry() are still being used (and tested)
even after applying this patch. Should not their entries be preserved ?

> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 7731b238b534..3b0f83ed6c2e 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -73,6 +73,8 @@ struct pgtable_debug_args {
>  	unsigned long		fixed_pud_pfn;
>  	unsigned long		fixed_pmd_pfn;
>  	unsigned long		fixed_pte_pfn;
> +
> +	swp_entry_t		swp_entry;
>  };
>  
>  static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
> @@ -754,12 +756,15 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
>  
>  static void __init pte_swap_soft_dirty_tests(struct pgtable_debug_args *args)
>  {
> -	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> +	pte_t pte;
>  
>  	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
>  		return;
>  
>  	pr_debug("Validating PTE swap soft dirty\n");
> +	pte = swp_entry_to_pte(args->swp_entry);
> +	WARN_ON(!is_swap_pte(pte));
> +
>  	WARN_ON(!pte_swp_soft_dirty(pte_swp_mksoft_dirty(pte)));
>  	WARN_ON(pte_swp_soft_dirty(pte_swp_clear_soft_dirty(pte)));
>  }
> @@ -793,7 +798,9 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args)
>  		return;
>  
>  	pr_debug("Validating PMD swap soft dirty\n");
> -	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
> +	pmd = swp_entry_to_pmd(args->swp_entry);
> +	WARN_ON(!is_swap_pmd(pmd));
> +
>  	WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pmd)));
>  	WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty(pmd)));
>  }
> @@ -804,17 +811,11 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
>  
>  static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
>  {
> -	unsigned long max_swap_offset;
>  	swp_entry_t entry, entry2;
>  	pte_t pte;
>  
>  	pr_debug("Validating PTE swap exclusive\n");
> -
> -	/* See generic_max_swapfile_size(): probe the maximum offset */
> -	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
> -
> -	/* Create a swp entry with all possible bits set */
> -	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
> +	entry = args->swp_entry;
args->swp_entry should be reused here as well.

>  
>  	pte = swp_entry_to_pte(entry);
>  	WARN_ON(pte_swp_exclusive(pte));
> @@ -838,30 +839,36 @@ static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
>  
>  static void __init pte_swap_tests(struct pgtable_debug_args *args)
>  {
> -	swp_entry_t swp;
> -	pte_t pte;
> +	swp_entry_t entry, arch_entry;
> +	pte_t pte, pte2;
A very small nit - s/pte2/pte as the first one is pmd not pte or
make it pte1, pte2 if preferred.

>  
>  	pr_debug("Validating PTE swap\n");
> -	pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> -	swp = __pte_to_swp_entry(pte);
> -	pte = __swp_entry_to_pte(swp);
> -	WARN_ON(args->fixed_pte_pfn != pte_pfn(pte));
> +	entry = args->swp_entry;

Should args->swp_entry be used directly here and 'entry' local variable
be dropped ?

> +
> +	pte = swp_entry_to_pte(entry);
> +	WARN_ON(!is_swap_pte(pte));
> +	arch_entry = __pte_to_swp_entry(pte);
> +	pte2 = __swp_entry_to_pte(arch_entry);
> +	WARN_ON(memcmp(&pte, &pte2, sizeof(pte)));
>  }
>  
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>  static void __init pmd_swap_tests(struct pgtable_debug_args *args)
>  {
> -	swp_entry_t swp;
> -	pmd_t pmd;
> +	swp_entry_t entry, arch_entry;
> +	pmd_t pmd, pmd2;

A very small nit - s/pmd2/pmd1 as the first one is pmd not pmd1 or
just make it pmd1, pmd2 if preferred.

>  
>  	if (!has_transparent_hugepage())
>  		return;
>  
>  	pr_debug("Validating PMD swap\n");
> -	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
> -	swp = __pmd_to_swp_entry(pmd);
> -	pmd = __swp_entry_to_pmd(swp);
> -	WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd));
> +	entry = args->swp_entry;
> +	pmd = swp_entry_to_pmd(entry);
> +	WARN_ON(!is_swap_pmd(pmd));

Good to have the WARN_ON() to test whether it is a swap PMD or not.

> +
> +	arch_entry = __pmd_to_swp_entry(pmd);
> +	pmd2 = __swp_entry_to_pmd(arch_entry);
> +	WARN_ON(memcmp(&pmd, &pmd2, sizeof(pmd)));

Sounds good.

>  }
>  #else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
>  static void __init pmd_swap_tests(struct pgtable_debug_args *args) { }
> @@ -1166,6 +1173,7 @@ static void __init init_fixed_pfns(struct pgtable_debug_args *args)
>  
>  static int __init init_args(struct pgtable_debug_args *args)
>  {
> +	unsigned long max_swap_offset;
>  	struct page *page = NULL;
>  	int ret = 0;
>  
> @@ -1248,6 +1256,11 @@ static int __init init_args(struct pgtable_debug_args *args)
>  
>  	init_fixed_pfns(args);
>  
> +	/* See generic_max_swapfile_size(): probe the maximum offset */
> +	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
Why not directly use generic_max_swapfile_size() which is doing exact same thing.

unsigned long generic_max_swapfile_size(void)
{
	return swp_offset(pte_to_swp_entry(
			swp_entry_to_pte(swp_entry(0, ~0UL)))) + 1;
}

> +	/* Create a swp entry with all possible bits set */
> +	args->swp_entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
> +

Makes sense to use maximum possible bits while creating the swap entry for testing.

>  	/*
>  	 * Allocate (huge) pages because some of the tests need to access
>  	 * the data in the pages. The corresponding tests will be skipped
