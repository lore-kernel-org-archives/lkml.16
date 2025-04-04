Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505642E62D4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743746572; cv=none; b=GD+yxN9PlDfMtr/UYWjlN0HJaA9f87X1QT4S+aiJn21ngRpNGxJ8cfiJPB1/8wchc7m3cRELLYwKeybVTvW3NY/c/LrNM1CZ1tDlp9EnUOECuVMzRBr0Hx2jyKkImDODj/iqydqnY3yfqh8yv7thyT6XePWiQa9o82dg43c/pdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743746572; c=relaxed/simple;
	bh=emPbLf925xcF5u1Mvhz8lGS+QEIcnRz2cN/xA9CfmKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKlSwBXUJo+STC6159muifamOVW84Ej3kDA6N5eCZskzk8jkWdWrhenpfa4nuHig9ZxCDEB4TiOZEb+561DC4c497DNN9ZSiLLh/8Ev0zkY445K9S9FvxXqAPIQbaafGnsoNd/s3j0IF2685HqnqbG9tJgbiwIjGHptyFeD2fKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DFFB1063;
	Thu,  3 Apr 2025 23:02:51 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42B2F3F694;
	Thu,  3 Apr 2025 23:02:43 -0700 (PDT)
Message-ID: <00a0d9f1-d0a1-41fe-a0af-7e2174efc2e0@arm.com>
Date: Fri, 4 Apr 2025 11:32:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64/mm: Batch barriers when updating kernel
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
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-12-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-12-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/25 20:34, Ryan Roberts wrote:
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

Agreed and hence for that an additional TIF flag i.e TIF_LAZY_MMU_PENDING
can be justified.

> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h     | 73 ++++++++++++++++++++++------
>  arch/arm64/include/asm/thread_info.h |  2 +
>  arch/arm64/kernel/process.c          |  9 ++--
>  3 files changed, 64 insertions(+), 20 deletions(-)
> 
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

typo					^^^^^^^^
 					
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
>  
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
>  
>  static inline void pmd_clear(pmd_t *pmdp)
> @@ -845,10 +890,8 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
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
> @@ -925,8 +968,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>  	}
>  
>  	WRITE_ONCE(*p4dp, p4d);
> -	dsb(ishst);
> -	isb();
> +	queue_pte_barriers();
>  }
>  
>  static inline void p4d_clear(p4d_t *p4dp)
> @@ -1052,8 +1094,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
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

Otherwise, LGTM.

I will try and think through again if these deferred sync and flush can cause
subtle problems else where.
