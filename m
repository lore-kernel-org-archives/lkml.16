Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457B2212FAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486001; cv=none; b=CcNfmyZ/WoUhdfET/yi00ilVZ3wsCrygtlMN5927ot3L928/ZYaZrZJIS2ObZGqYJOTct9mi19vZeGXKyF0XHNLJGJ7bE0smac8ag9AjkiAHEjYzsIpqo9CVpbc4dK230WPWZTU/bPxRncT1dcLoGCKYKKQ6epNv84jtJiOOAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486001; c=relaxed/simple;
	bh=2x3yOcv4qSe4Jq1as4fknGnxJi6Z05xGD+6EbldsjQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUIXP7ft+v9ebXLZ9BLR2S3N3qUV/AR5nEEf16SsAmd8W5yXhBLrfsyDsGTWellXB4idblXVtOsLKnbHBwguE9xl6tv2NZsOY5HVRMKGHqw5a21k7ohecv6MhQ72D8D5h1SlbyIheUZmagMKGbv8DdVJOTCJ2Hmw1A44hzsR9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D7911063;
	Thu, 24 Apr 2025 02:13:11 -0700 (PDT)
Received: from [10.163.49.106] (unknown [10.163.49.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88FE63F66E;
	Thu, 24 Apr 2025 02:13:11 -0700 (PDT)
Message-ID: <faaaaba2-db31-489c-8016-36f11f52d11a@arm.com>
Date: Thu, 24 Apr 2025 14:43:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/11] arm64/mm: Batch barriers when updating kernel
 mappings
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
 <20250422081822.1836315-12-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250422081822.1836315-12-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/22/25 13:48, Ryan Roberts wrote:
> Because the kernel can't tolerate page faults for kernel mappings, when
> setting a valid, kernel space pte (or pmd/pud/p4d/pgd), it emits a
> dsb(ishst) to ensure that the store to the pgtable is observed by the
> table walker immediately. Additionally it emits an isb() to ensure that
> any already speculatively determined invalid mapping fault gets
> canceled.
> 
> We can improve the performance of vmalloc operations by batching these
> barriers until the end of a set of entry updates.
> arch_enter_lazy_mmu_mode() and arch_leave_lazy_mmu_mode() provide the
> required hooks.
> 
> vmalloc improves by up to 30% as a result.
> 
> Two new TIF_ flags are created; TIF_LAZY_MMU tells us if the task is in
> the lazy mode and can therefore defer any barriers until exit from the
> lazy mode. TIF_LAZY_MMU_PENDING is used to remember if any pte operation
> was performed while in the lazy mode that required barriers. Then when
> leaving lazy mode, if that flag is set, we emit the barriers.
> 
> Since arch_enter_lazy_mmu_mode() and arch_leave_lazy_mmu_mode() are used
> for both user and kernel mappings, we need the second flag to avoid
> emitting barriers unnecessarily if only user mappings were updated.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h     | 81 ++++++++++++++++++++++------
>  arch/arm64/include/asm/thread_info.h |  2 +
>  arch/arm64/kernel/process.c          |  9 ++--
>  3 files changed, 72 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 39c331743b69..ab4a1b19e596 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -40,6 +40,63 @@
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
> +	 * see the store. There is no guarantee of an isb being issued though.
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
> +	unsigned long flags;
> +
> +	VM_WARN_ON(in_interrupt());
> +	flags = read_thread_flags();
> +
> +	if (flags & BIT(TIF_LAZY_MMU)) {
> +		/* Avoid the atomic op if already set. */
> +		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
> +			set_thread_flag(TIF_LAZY_MMU_PENDING);
> +	} else {
> +		emit_pte_barriers();
> +	}
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
> @@ -326,10 +383,8 @@ static inline void __set_pte_complete(pte_t pte)
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
>  
>  static inline void __set_pte(pte_t *ptep, pte_t pte)
> @@ -801,10 +856,8 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
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
>  
>  static inline void pmd_clear(pmd_t *pmdp)
> @@ -869,10 +922,8 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
>  
>  	WRITE_ONCE(*pudp, pud);
>  
> -	if (pud_valid(pud)) {
> -		dsb(ishst);
> -		isb();
> -	}
> +	if (pud_valid(pud))
> +		queue_pte_barriers();
>  }
>  
>  static inline void pud_clear(pud_t *pudp)
> @@ -951,8 +1002,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>  	}
>  
>  	WRITE_ONCE(*p4dp, p4d);
> -	dsb(ishst);
> -	isb();
> +	queue_pte_barriers();
>  }
>  
>  static inline void p4d_clear(p4d_t *p4dp)
> @@ -1080,8 +1130,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
>  	}
>  
>  	WRITE_ONCE(*pgdp, pgd);
> -	dsb(ishst);
> -	isb();
> +	queue_pte_barriers();
>  }
>  
>  static inline void pgd_clear(pgd_t *pgdp)
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index 1114c1c3300a..1fdd74b7b831 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -82,6 +82,8 @@ void arch_setup_new_exec(void);
>  #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
>  #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
>  #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
> +#define TIF_LAZY_MMU		31	/* Task in lazy mmu mode */
> +#define TIF_LAZY_MMU_PENDING	32	/* Ops pending for lazy mmu mode exit */
>  
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 42faebb7b712..45a55fe81788 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -680,10 +680,11 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	gcs_thread_switch(next);
>  
>  	/*
> -	 * Complete any pending TLB or cache maintenance on this CPU in case
> -	 * the thread migrates to a different CPU.
> -	 * This full barrier is also required by the membarrier system
> -	 * call.
> +	 * Complete any pending TLB or cache maintenance on this CPU in case the
> +	 * thread migrates to a different CPU. This full barrier is also
> +	 * required by the membarrier system call. Additionally it makes any
> +	 * in-progress pgtable writes visible to the table walker; See
> +	 * emit_pte_barriers().
>  	 */
>  	dsb(ish);
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
