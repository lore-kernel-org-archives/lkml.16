Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECF8274641
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652305; cv=none; b=UXNOk4iVzNbJa6arV4CEUw8G17q7I2/mks/b4RLfHNeOVU6VlDYQX4lIFoy1oqvfS2bqqdEmPYdS6JSzIIgbjG7N7KXgUt0sGGeragCDK5RdnbNi1w4ZLFiiynYGV0hBccMB1eSKF+F+GNZd/QJQYxcXnC3YZpxPbdoMyVGHBHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652305; c=relaxed/simple;
	bh=4Rcubgzs08lT1rQDdsUX1C2ZGRJkDl/Jt9BgGChqToM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dm4L2dHVsOVQQAF84noCg7NnQ2jX02o+R44mQeEy5KL6eYX/RK005q6AjzWV1CC1xOYZQTeTNizul6DnIaVRtuB38OE4Tn9dfhHYOaItV2YOSlC2XFK2wFKh0Nr1801YOg52sXKaYaJAr0cWUHDdPeGC8rD9U6P1+MWpDNPA3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28492C4CEE2;
	Mon, 14 Apr 2025 17:38:22 +0000 (UTC)
Date: Mon, 14 Apr 2025 18:38:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/11] arm64/mm: Batch barriers when updating kernel
 mappings
Message-ID: <Z_1IC-_Fp-yGLRSc@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-12-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-12-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:41PM +0000, Ryan Roberts wrote:
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 1898c3069c43..149df945c1ab 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -40,6 +40,55 @@
>  #include <linux/sched.h>
>  #include <linux/page_table_check.h>
>  
> +static inline void emit_pte_barriers(void)
> +{
> +	/*
> +	 * These barriers are emitted under certain conditions after a pte entry
> +	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
> +	 * visible to the table walker. The isb ensures that any previous
> +	 * speculative "invalid translation" marker that is in the CPU's
> +	 * pipeline gets cleared, so that any access to that address after
> +	 * setting the pte to valid won't cause a spurious fault. If the thread
> +	 * gets preempted after storing to the pgtable but before emitting these
> +	 * barriers, __switch_to() emits a dsb which ensure the walker gets to
> +	 * see the store. There is no guarrantee of an isb being issued though.
> +	 * This is safe because it will still get issued (albeit on a
> +	 * potentially different CPU) when the thread starts running again,
> +	 * before any access to the address.
> +	 */
> +	dsb(ishst);
> +	isb();
> +}
> +
> +static inline void queue_pte_barriers(void)
> +{
> +	if (test_thread_flag(TIF_LAZY_MMU))
> +		set_thread_flag(TIF_LAZY_MMU_PENDING);

As we can have lots of calls here, it might be slightly cheaper to test
TIF_LAZY_MMU_PENDING and avoid setting it unnecessarily.

I haven't checked - does the compiler generate multiple mrs from sp_el0
for subsequent test_thread_flag()?

> +	else
> +		emit_pte_barriers();
> +}
> +
> +#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +static inline void arch_enter_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(in_interrupt());
> +	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
> +
> +	set_thread_flag(TIF_LAZY_MMU);
> +}
> +
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
> +		emit_pte_barriers();
> +}
> +
> +static inline void arch_leave_lazy_mmu_mode(void)
> +{
> +	arch_flush_lazy_mmu_mode();
> +	clear_thread_flag(TIF_LAZY_MMU);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  
> @@ -323,10 +372,8 @@ static inline void __set_pte_complete(pte_t pte)
>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
>  	 * has the necessary barriers.
>  	 */
> -	if (pte_valid_not_user(pte)) {
> -		dsb(ishst);
> -		isb();
> -	}
> +	if (pte_valid_not_user(pte))
> +		queue_pte_barriers();
>  }

I think this scheme works, I couldn't find a counter-example unless
__set_pte() gets called in an interrupt context. You could add
VM_WARN_ON(in_interrupt()) in queue_pte_barriers() as well.

With preemption, the newly mapped range shouldn't be used before
arch_flush_lazy_mmu_mode() is called, so it looks safe as well. I think
x86 uses a per-CPU variable to track this but per-thread is easier to
reason about if there's no nesting.

>  static inline void __set_pte(pte_t *ptep, pte_t pte)
> @@ -778,10 +825,8 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  
>  	WRITE_ONCE(*pmdp, pmd);
>  
> -	if (pmd_valid(pmd)) {
> -		dsb(ishst);
> -		isb();
> -	}
> +	if (pmd_valid(pmd))
> +		queue_pte_barriers();
>  }

We discussed on a previous series - for pmd/pud we end up with barriers
even for user mappings but they are at a much coarser granularity (and I
wasn't keen on 'user' attributes for the table entries).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
