Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995C2267B88
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768337; cv=none; b=DJe41T0p5777+SevmrauqoMgEGwfXCJbsUuf8ln0fRYofZjMWMfs9T/i2uM1OlA1lkvvBpBXhE4bU+RojxA585OZyk4g4mJjKwJlfP1CpOsKbZzk1MgW6phJ7X6gl/Ir15c4Ga8d7LCdKgq9XIFtfG4M5+1eA01mXOIzZi0dbO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768337; c=relaxed/simple;
	bh=UewFyxXQ2hSFAUAdEYExssncc1PBAxhiSoguwu86XH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCee+LCEr8kcc1q3ze/8A76DSnp03X+Qg0sCiQkfu3TDktne7PT0bknl6euXB9tcYM8zHMdZpGhNm4Qi3om7UO93n6vl04StiX9np6L5BwODQ+luSOp0P/tbLZ+cielztIqDptKzuUSyso0MO/szPBd9Vg3qJkm2zoHN2dX9d9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF50D153B;
	Thu,  8 May 2025 22:25:17 -0700 (PDT)
Received: from [10.162.43.14] (K4MQJ0H1H2.blr.arm.com [10.162.43.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083603F58B;
	Thu,  8 May 2025 22:25:21 -0700 (PDT)
Message-ID: <b4e092c4-8388-471f-948d-f0b5828efed3@arm.com>
Date: Fri, 9 May 2025 10:55:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
 <887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com>
 <b104b843-f12a-4382-a05f-53e2e35bdcb0@arm.com>
 <0979ce4e-d316-477c-872e-d3f9e47690e5@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <0979ce4e-d316-477c-872e-d3f9e47690e5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/05/25 4:25 pm, David Hildenbrand wrote:
> 
>>> (2) Do we really need "must be part of the same folio", or could be just
>>> batch over present
>>> ptes that map consecutive PFNs? In that case, a helper that avoids
>>> folio_pte_batch() completely
>>> might be better.
>>>
>> I am not sure I get you here. folio_pte_batch() seems to be the simplest
>> thing we can do as being done around in the code elsewhere, I am not
>> aware of any alternate.
> 
> If we don't need the folio, then we can have a batching function that
> doesn't require the folio.
> 
> Likely, we could even factor that (non-folio batching) out from 
> folio_pte_batch().
> The recent fix [1] might make that easier. See below.
> 
> 
> So my question is: is something relying on all of these PTEs to point at 
> the same folio?

Hmm...get_and_clear_full_ptes, as you say in another mail, will require 
that...

> 
> [1] https://lkml.kernel.org/r/20250502215019.822-2-arkamar@atlas.cz
> 
> 
> Something like this: (would need kerneldoc, probably remove "addr" 
> parameter from folio_pte_batch(),
> and look into other related cleanups as discussed with Andrew)

I like this refactoring! Can you tell the commit hash on which you make 
the patch, I cannot apply it.

So we need to collect/not collect a/d bits according to whether the pte 
batch belongs to a large folio/small folios. Seems complicated :)

> 
> 
>  From f56f67ee5ae9879adb99a8da37fa7ec848c4d256 Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Thu, 8 May 2025 12:53:52 +0200
> Subject: [PATCH] tmp
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/internal.h | 84 ++++++++++++++++++++++++++++-----------------------
>   1 file changed, 46 insertions(+), 38 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 25a29872c634b..53ff8f8a7c8f9 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -217,36 +217,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t 
> pte, fpb_t flags)
>       return pte_wrprotect(pte_mkold(pte));
>   }
> 
> -/**
> - * folio_pte_batch - detect a PTE batch for a large folio
> - * @folio: The large folio to detect a PTE batch for.
> - * @addr: The user virtual address the first page is mapped at.
> - * @start_ptep: Page table pointer for the first entry.
> - * @pte: Page table entry for the first page.
> - * @max_nr: The maximum number of table entries to consider.
> - * @flags: Flags to modify the PTE batch semantics.
> - * @any_writable: Optional pointer to indicate whether any entry except 
> the
> - *          first one is writable.
> - * @any_young: Optional pointer to indicate whether any entry except the
> - *          first one is young.
> - * @any_dirty: Optional pointer to indicate whether any entry except the
> - *          first one is dirty.
> - *
> - * Detect a PTE batch: consecutive (present) PTEs that map consecutive
> - * pages of the same large folio.
> - *
> - * All PTEs inside a PTE batch have the same PTE bits set, excluding 
> the PFN,
> - * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
> - * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
> - *
> - * start_ptep must map any page of the folio. max_nr must be at least 
> one and
> - * must be limited by the caller so scanning cannot exceed a single 
> page table.
> - *
> - * Return: the number of table entries in the batch.
> - */
> -static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> -        pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
> -        bool *any_writable, bool *any_young, bool *any_dirty)
> +static inline int pte_batch(pte_t *start_ptep, pte_t pte, int max_nr,
> +        fpb_t flags, bool *any_writable, bool *any_young, bool *any_dirty)
>   {
>       pte_t expected_pte, *ptep;
>       bool writable, young, dirty;
> @@ -259,14 +231,6 @@ static inline int folio_pte_batch(struct folio 
> *folio, unsigned long addr,
>       if (any_dirty)
>           *any_dirty = false;
> 
> -    VM_WARN_ON_FOLIO(!pte_present(pte), folio);
> -    VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
> -    VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, 
> folio);
> -
> -    /* Limit max_nr to the actual remaining PFNs in the folio we could 
> batch. */
> -    max_nr = min_t(unsigned long, max_nr,
> -               folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
> -
>       nr = pte_batch_hint(start_ptep, pte);
>       expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), 
> flags);
>       ptep = start_ptep + nr;
> @@ -300,6 +264,50 @@ static inline int folio_pte_batch(struct folio 
> *folio, unsigned long addr,
>       return min(nr, max_nr);
>   }
> 
> +/**
> + * folio_pte_batch - detect a PTE batch for a large folio
> + * @folio: The large folio to detect a PTE batch for.
> + * @addr: The user virtual address the first page is mapped at.
> + * @start_ptep: Page table pointer for the first entry.
> + * @pte: Page table entry for the first page.
> + * @max_nr: The maximum number of table entries to consider.
> + * @flags: Flags to modify the PTE batch semantics.
> + * @any_writable: Optional pointer to indicate whether any entry except 
> the
> + *          first one is writable.
> + * @any_young: Optional pointer to indicate whether any entry except the
> + *          first one is young.
> + * @any_dirty: Optional pointer to indicate whether any entry except the
> + *          first one is dirty.
> + *
> + * Detect a PTE batch: consecutive (present) PTEs that map consecutive
> + * pages of the same large folio.
> + *
> + * All PTEs inside a PTE batch have the same PTE bits set, excluding 
> the PFN,
> + * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
> + * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
> + *
> + * start_ptep must map any page of the folio. max_nr must be at least 
> one and
> + * must be limited by the caller so scanning cannot exceed a single 
> page table.
> + *
> + * Return: the number of table entries in the batch.
> + */
> +static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> +        pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
> +        bool *any_writable, bool *any_young, bool *any_dirty)
> +{
> +
> +    VM_WARN_ON_FOLIO(!pte_present(pte), folio);
> +    VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
> +    VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, 
> folio);
> +
> +    /* Limit max_nr to the actual remaining PFNs in the folio we could 
> batch. */
> +    max_nr = min_t(unsigned long, max_nr,
> +               folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
> +
> +    return pte_batch(start_ptep, pte, max_nr, flags, any_writable, 
> any_young,
> +             any_dirty);
> +}
> +
>   /**
>    * pte_move_swp_offset - Move the swap entry offset field of a swap pte
>    *     forward or backward by delta

