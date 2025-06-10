Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797DC22D4DB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556803; cv=none; b=DP6qwSzoso23XXILNE7CnwY6eFdIVJvTDR8J9uwbIJhX3GIfwyGIGppDteoWNcY37a1ktmlWzA3EA8esyJf7MirtEiDGJOhX5hTVcq3YNkepziuGoap8aFldCVk30BUvB+0P83bFj1SMnAeUnUI/HPqeombcfd2nLjKFUSO6bJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556803; c=relaxed/simple;
	bh=KWbx95K/VCToJB/Y7CExRq3LvA26QOVFH+4ubtkmPvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK4IkiTChGtamwtcfFwi53zeC+ZoE75T7h5s8YnLGKGC46SLMtM0PZQi3G3nnDDhTduTDwfEA6BI9OiF6FPxCpUlGlSo/drdxAAHQzPwWl5GMAt3MZQCXmTRpVEk8q6ln24Ad2WOQ2sWLoR305ukugx0HSMxhG4vbWw76Af38m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82832C4CEEF;
	Tue, 10 Jun 2025 12:00:02 +0000 (UTC)
Date: Tue, 10 Jun 2025 13:00:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Message-ID: <aEgeQCCzRt-B8_nW@arm.com>
References: <20250606135654.178300-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606135654.178300-1-ryan.roberts@arm.com>

On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> provided a quick fix to ensure that lazy_mmu_mode continues to work when
> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
> nest.
> 
> The solution in that patch is the make the implementation tolerant to

s/is the make/is to make/

> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
> exit becomes a nop. But this sacrifices the optimization opportunity for
> the remainder of the outer user.
[...]
> I wonder if you might be willing to take this for v6.16? I think its a neater
> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
> lazy_mmu_mode to be nested") - which is already in Linus's master.
> 
> To be clear, the current solution is safe, I just think this is much neater.

Maybe better, though I wouldn't say much neater. One concern I have is
about whether we'll get other such nesting in the future and we need to
fix them in generic code. Here we control __kernel_map_pages() but we
may not for other cases.

Is it the fault of the arch code that uses apply_to_page_range() via
__kernel_map_pages()? It feels like it shouldn't care about the lazy
mode as that's some detail of the apply_to_page_range() implementation.
Maybe this API should just allow nesting.

> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 88db8a0c0b37..9f387337ccc3 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -83,21 +83,11 @@ static inline void queue_pte_barriers(void)
>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> -
>  	if (in_interrupt())
>  		return;
> 
> +	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));

This warning is good to have back.

> +
>  	set_thread_flag(TIF_LAZY_MMU);
>  }
> 
> @@ -119,6 +109,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	clear_thread_flag(TIF_LAZY_MMU);
>  }
> 
> +static inline bool arch_in_lazy_mmu_mode(void)
> +{
> +	if (in_interrupt())
> +		return false;
> +
> +	return test_thread_flag(TIF_LAZY_MMU);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..4da7a847d5f3 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -293,18 +293,29 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  }
> 
>  #ifdef CONFIG_DEBUG_PAGEALLOC
> -/*
> - * This is - apart from the return value - doing the same
> - * thing as the new set_direct_map_valid_noflush() function.
> - *
> - * Unify? Explain the conceptual differences?
> - */
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> +	bool lazy_mmu;
> +
>  	if (!can_set_direct_map())
>  		return;
> 
> +	/*
> +	 * This is called during page alloc or free, and maybe called while in
> +	 * lazy mmu mode. Since set_memory_valid() may also enter lazy mmu mode,
> +	 * this would cause nesting which is not supported; the inner call to
> +	 * exit the mode would exit, meaning that the outer lazy mmu mode is no
> +	 * longer benefiting from the optimization. So temporarily leave lazy
> +	 * mmu mode for the duration of the call.
> +	 */
> +	lazy_mmu = arch_in_lazy_mmu_mode();
> +	if (lazy_mmu)
> +		arch_leave_lazy_mmu_mode();
> +
>  	set_memory_valid((unsigned long)page_address(page), numpages, enable);
> +
> +	if (lazy_mmu)
> +		arch_enter_lazy_mmu_mode();
>  }
>  #endif /* CONFIG_DEBUG_PAGEALLOC */

So basically you are flattening the enter/leave_lazy_mmu_mode() regions.
Ideally this could have been done by the nesting
arch_enter_lazy_mmu_mode() automatically but that means this function
returning the current mode and arch_leave_lazy_mmu_mode() taking an
argument - more like the irq saving/restoring (even better renaming it
to arch_restore_lazy_mmu_mode()). I guess this won't go well with the mm
folk who don't seem willing to changes in this area.

FWIW, this patch is correct.

-- 
Catalin
