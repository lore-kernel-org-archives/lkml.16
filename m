Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69344262FC9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826170; cv=none; b=KiV9zoiF6xaDr2/rQFpcpphZMOQdSw5NzLMvKFTucTqWYepy1Ubvg73nAJkTaZiaugU6jF3wyrpT+kS0bxemlc8PIfPbucGn23YPytE5eOpkNdO34b0jx/cLUm5ACplP2EG30YMVncfhWFPK/iAcIx7bcyKqSZ1xLClrDa5HjnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826170; c=relaxed/simple;
	bh=f73pjsfIjgBbIGHeMWl7yg9K8SL15WszZZoyDkdpE6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kbpidn+L+SHMo9WofkPTsIefJ1W4X4d6hyvVUAATTxlFRJzr4HWg/zEwfUXFttsvSwA70VW5cI0DpUjUQJswJ9WAUf+tP+XPtuwNoV1Fa0Rc4/KuL2Fv/w4/A0E350F+f3qH8sC/FED7Yo+wgZYLmpDXgBfWPhkJ0nk0HwQruuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA2FC263D;
	Wed, 21 May 2025 04:15:53 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A21A3F6A8;
	Wed, 21 May 2025 04:16:03 -0700 (PDT)
Message-ID: <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
Date: Wed, 21 May 2025 12:16:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:48, Dev Jain wrote:
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> Architecture can override these helpers; in case not, they are implemented
> as a simple loop over the corresponding single pte helpers.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 75 +++++++++++++++++++++++++++++++++++++++++
>  mm/mprotect.c           |  4 +--
>  2 files changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..e40ed57e034d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1333,6 +1333,81 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  	__ptep_modify_prot_commit(vma, addr, ptep, pte);
>  }
>  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> +
> +/**
> + * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
> + * over a batch of ptes, which protects against asynchronous hardware modifications

nit: This overflows the 80 char soft limit.

> + * to the ptes. The intention is not to prevent the hardware from making pte
> + * updates, but to prevent any updates it may make from being lost.
> + * Please see the comment above ptep_modify_prot_start() for full description.
> + *
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_modify_prot_start(), collecting the a/d bits of the mapped
> + * folio.

nit: "mapped folio" is a bit confusing given we are operating on ptes. Perhaps
"collecting the a/d bits from each pte in the batch" is clearer.

> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ.

nit: Perhaps "batch" would be more consistent than "range"?

> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> + */
> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, unsigned int nr)

I thought David H suggested modify_prot_ptes_start() and
modify_prot_ptes_commit(), which we settled on? I'm personally fine with either
though.

> +{
> +	pte_t pte, tmp_pte;
> +
> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> +	while (--nr) {

I thought we agreed to make the loop logic a bit more standard. I don't recall
exactly what was finally agreed, but I would think something like this would be
better:

	for (i = 1; i < nr; i++) {

> +		ptep++;
> +		addr += PAGE_SIZE;
> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> +		if (pte_dirty(tmp_pte))
> +			pte = pte_mkdirty(pte);
> +		if (pte_young(tmp_pte))
> +			pte = pte_mkyoung(pte);
> +	}
> +	return pte;
> +}
> +#endif
> +
> +/**
> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
> + * hardware-controlled bits in the PTE unmodified.
> + *
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.

You've missed pte and old_pte params here.

> + * @nr: Number of entries.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_modify_prot_commit().
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ.

How can it? All the applied bits other than the PFN will be exactly the same for
the range because they all come from pte. I think this line can be dropped.

> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.

The middle sentance doesn't apply; the PTEs will all initially be none if using
the default version of modify_prot_start_ptes(). I think that can be dropped.
But I think you need to explain that this will be the case on exit.

> + */
> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; ++i) {
> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		old_pte = pte_next_pfn(old_pte);
> +		pte = pte_next_pfn(pte);
> +	}
> +}
> +#endif

I have some general concerns about the correctness of batching these functions.
The support was originally added by Commit 1ea0704e0da6 ("mm: add a
ptep_modify_prot transaction abstraction"), and the intent was to make it easier
to defer the pte updates for XEN on x86.

Your default implementations of the batched versions will match the number of
ptep_modify_prot_start() calls with the same number of ptep_modify_prot_commit()
calls, even if modify_prot_commit_ptes() is called incrementally for sub-batches
of the batch used for modify_prot_start_ptes(). That's a requirement and you've
met it. But in the batched case, there are 2 differences;

  - You can now have multiple PTEs within a start-commit block at one time. I
hope none of the specialized implementations care about that (i.e. XEN).

  - when calling ptep_modify_prot_commit(), old_pte may not be exactly what
ptep_modify_prot_start() returned for that pte. You have collected the A/D bits,
and according to your docs "PTE bits in the PTE range besides the PFN can
differ" when calling modify_prot_start_ptes() so R/W and other things could
differ here.

I'm not sure if these are problems in practice; they probably are not. But have
you checked the XEN implementation (and any other specialized implementations)
are definitely compatible with your batched semantics?

Thanks,
Ryan

> +
>  #endif /* CONFIG_MMU */
>  
>  /*
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 1ee160ed0b14..124612ce3d24 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -188,7 +188,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  						jiffies_to_msecs(jiffies));
>  			}
>  
> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>  			ptent = pte_modify(oldpte, newprot);
>  
>  			if (uffd_wp)
> @@ -214,7 +214,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			    can_change_pte_writable(vma, addr, ptent))
>  				ptent = pte_mkwrite(ptent, vma);
>  
> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>  			if (pte_needs_flush(oldpte, ptent))
>  				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>  			pages++;

