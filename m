Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F6E231C9F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817020; cv=none; b=jMtMi0OnAONc62k/gbMv0ZpXRyzvmUi3R+Nd34p9oXU3aeVIclqkR6XjnlME/Ev7gWPJA8ta3CZkcnbgZGWypSGwojQyEVpGwQ7bWDVhoBft1LQ6nXR+Xju2+zME7aOPnbralWjn1HJpmlPCCUSeFMl/w/tXjWpbPPDQgjkVxJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817020; c=relaxed/simple;
	bh=yt7QIvQQP+yscM4+L2JOiQOW0+9EHb6UGN4I+ug6mUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDBQNnwj7K7PPTHpCwqdjW4U6wsjzWtk01USZ1su1ZPNVGq4cFLSDsa96n9UCnfbEfWMRB/PlopiuxAOIWk9xxUDHMDr/b565VxaOn/Cl1P716yFgKoEhDL0QyTEhwksnhRk0dL3cteSek/hbMYgmnxKluBGPBXb/r7sNUwOET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22901515;
	Wed, 21 May 2025 01:43:22 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3AC93F5A1;
	Wed, 21 May 2025 01:43:31 -0700 (PDT)
Message-ID: <77e30902-dc38-4a92-9c29-ea9c6db53fc9@arm.com>
Date: Wed, 21 May 2025 09:43:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
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
 <20250519074824.42909-2-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:48, Dev Jain wrote:
> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

LGTM; a lot less churn than before.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/mprotect.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88608d0dc2c2..1ee160ed0b14 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,18 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	return pte_dirty(pte);
>  }
>  
> +static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
> +		pte_t pte, int max_nr_ptes)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio_test_large(folio) || (max_nr_ptes == 1))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> +			       NULL, NULL, NULL);
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -94,6 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> +	int nr_ptes;
>  
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -108,8 +121,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  	do {
> +		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
>  		if (pte_present(oldpte)) {
> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>  			pte_t ptent;
>  
>  			/*
> @@ -126,15 +141,18 @@ static long change_pte_range(struct mmu_gather *tlb,
>  					continue;
>  
>  				folio = vm_normal_folio(vma, addr, oldpte);
> -				if (!folio || folio_is_zone_device(folio) ||
> -				    folio_test_ksm(folio))
> +				if (!folio)
>  					continue;
>  
> +				if (folio_is_zone_device(folio) ||
> +				    folio_test_ksm(folio))
> +					goto skip_batch;
> +
>  				/* Also skip shared copy-on-write pages */
>  				if (is_cow_mapping(vma->vm_flags) &&
>  				    (folio_maybe_dma_pinned(folio) ||
>  				     folio_maybe_mapped_shared(folio)))
> -					continue;
> +					goto skip_batch;
>  
>  				/*
>  				 * While migration can move some dirty pages,
> @@ -143,7 +161,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 */
>  				if (folio_is_file_lru(folio) &&
>  				    folio_test_dirty(folio))
> -					continue;
> +					goto skip_batch;
>  
>  				/*
>  				 * Don't mess with PTEs if page is already on the node
> @@ -151,7 +169,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 */
>  				nid = folio_nid(folio);
>  				if (target_node == nid)
> -					continue;
> +					goto skip_batch;
>  				toptier = node_is_toptier(nid);
>  
>  				/*
> @@ -159,8 +177,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 * balancing is disabled
>  				 */
>  				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> -				    toptier)
> +				    toptier) {
> +skip_batch:
> +					nr_ptes = mprotect_batch(folio, addr, pte,
> +								 oldpte, max_nr_ptes);
>  					continue;
> +				}
>  				if (folio_use_access_time(folio))
>  					folio_xchg_access_time(folio,
>  						jiffies_to_msecs(jiffies));
> @@ -280,7 +302,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				pages++;
>  			}
>  		}
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>  	arch_leave_lazy_mmu_mode();
>  	pte_unmap_unlock(pte - 1, ptl);
>  

