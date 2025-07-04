Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F0285CBC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627433; cv=none; b=TbbEbrCsaT4sZSL0xIxqwoGqtRmdXpApHeBYw+UUIVSsBvlVwE+yHPz97eGN6rVZZnNBBVBQsLlUKJtmNSPcbXz2A99NMsXkxRuxj2nzu9d+5uood25lkKyRcd1uxD153X5tpMD0epB5IMtcd4qDLRXN+dBDTmMyfsQa1jBlffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627433; c=relaxed/simple;
	bh=yJquQKC2pKx7RzNEXrL8gccGvhLSPdP/j0yGbawBfpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6mTsebXPz/HWC22m/K2lQcAg7o6Pi8qz+/qlj+TWXXHggZ7NdFr5F1w8YZkhQCsDR7XjUnEFeaVYIkW4jZd2XqhrkOR6a+E6QJDApPuBNcOdlBCDUX03V+bVMpnG2FapexkZIw1GLqo6ZSNnIK09K1ZjcOB+zAmI1vQl7W8CBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwKvKf9u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwKvKf9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751627430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMdb9PRN+44i7f9frkGcPkndBjXM/NPvSxmrg11NQJY=;
	b=JwKvKf9uqyd/DuT0y5C10dmnKe27iUxAFntWJSmQjj8slmISrTp8Hr+sU2V03nzY8aKBrJ
	eV6gjlxMpoR6Tv7jeN1mEqAbTjogcD/fb4Gf1Tyo91LEV+VyhFKDcVSH7eimo2WPH7Bmhx
	WVo+41NeBMrnuGuNUxyo7lU60JNWza8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-G12jP3qiNbSiDN6olk7rOw-1; Fri, 04 Jul 2025 07:10:29 -0400
X-MC-Unique: G12jP3qiNbSiDN6olk7rOw-1
X-Mimecast-MFC-AGG-ID: G12jP3qiNbSiDN6olk7rOw_1751627427
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-553cff91724so521229e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627427; x=1752232227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMdb9PRN+44i7f9frkGcPkndBjXM/NPvSxmrg11NQJY=;
        b=NPCxAg+OI9vX2AEdxk9SIdezoGrA+0W1oj/MGwrNug7tHAQHtfjT7L7Cb3oQSguHht
         8rXtg+F8Ud1smGmV51d3spmAEHHSQxnKB+BlKFr/VKbua2MGIVz9Q2StIdqv6Kzt5aER
         dZQ2NpUitA1r75vbbGbgUzRohJ4bioP1Qpp4Zv+SsslDlaev6Vtq0B/+3/oz0TYhXn7K
         UDeh7fPQ5XOEs8B9ngaSTdmz7+7I2dXCNsA8xIwK9keXCV9ZwIVO78ub/PHzPmesrSpu
         0COKOb34+LK4uj3eFE75s8sSMSkfCFcoG+WA4eHtSj9Kg70DDn2dFZwFtnUxp+DOVhQF
         JoNA==
X-Forwarded-Encrypted: i=1; AJvYcCWfnOuAJIf9LO0lJPfj1PxmwkgCIGKtLd2e8q68/Bygn/8vG3bBnHunayxKZ2pq7ubtoCVHNbqR3+vxkC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMRWy+Seyr5R2YE5SziW8olmr92jj5Ni/dDmcZGu+ZCBTsrOJ
	n/Qk63wQKotTAbz27QJdYn79crPZQQTZoUfRHQ8yx/21I2JavzwFUE+0rZiB6eN08+bYDiiu1Y1
	ozUKbFAfAni2iLr9eM4Xzw2BQ7iagEgNvSEpTXOygNAls/DwPcwvMhgrFeJhqPA5v
X-Gm-Gg: ASbGncvi4eAakEMpQUnGdWBCtaZypW0j8glTvvq8mcU7oa0G1wh+wt1DYAd36sdskuW
	Y5ZaFQFzi0q+vq57qRrwcbDILBMsgtx3ckl9jY59rGKIgl0T+Xtfv0TTJYjUQq8+Ti0A0OBxJZk
	8PTGBx7YgNYzhnyuFqXPYYZTaLzfnp1Bf7h5TwZdrWzPKCkyn/aRvGdD4GF9uVXCEpwSqwfDzRZ
	kjqTNQCvyvSB5itpqcrWHsCP0ytgcd40bT2hJnEK5zSE6K1tuuEA6615votqbiKSTpM52hESfRH
	SZ3kwSJuk0EQVU4h6a2b79lYgcKcHpX/Uw8m+OPXvm7I72gJ
X-Received: by 2002:a05:6512:3e22:b0:550:d4f3:8491 with SMTP id 2adb3069b0e04-557aa964209mr512698e87.41.1751627427140;
        Fri, 04 Jul 2025 04:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2PZtsRuga3xKsC8d69Jk19CF7eIpNMi3+IqbZUwGPLhw9uYfIaAQAQrEchi2Dmr5kcqr+7g==
X-Received: by 2002:a05:6512:3e22:b0:550:d4f3:8491 with SMTP id 2adb3069b0e04-557aa964209mr512674e87.41.1751627426599;
        Fri, 04 Jul 2025 04:10:26 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494d5asm222436e87.100.2025.07.04.04.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:10:26 -0700 (PDT)
Message-ID: <4c274ac4-17d7-4d37-aeff-9517731d0c9c@redhat.com>
Date: Fri, 4 Jul 2025 14:10:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 03/12] mm/thp: zone_device awareness in THP handling
 code
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-4-balbirs@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250703233511.2028395-4-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/25 02:35, Balbir Singh wrote:
> Make THP handling code in the mm subsystem for THP pages
> aware of zone device pages. Although the code is
> designed to be generic when it comes to handling splitting
> of pages, the code is designed to work for THP page sizes
> corresponding to HPAGE_PMD_NR.
>
> Modify page_vma_mapped_walk() to return true when a zone
> device huge entry is present, enabling try_to_migrate()
> and other code migration paths to appropriately process the
> entry
>
> pmd_pfn() does not work well with zone device entries, use
> pfn_pmd_entry_to_swap() for checking and comparison as for
> zone device entries.
>
> try_to_map_to_unused_zeropage() does not apply to zone device
> entries, zone device entries are ignored in the call.
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  mm/huge_memory.c     | 153 +++++++++++++++++++++++++++++++------------
>  mm/migrate.c         |   2 +
>  mm/page_vma_mapped.c |  10 +++
>  mm/pgtable-generic.c |   6 ++
>  mm/rmap.c            |  19 +++++-
>  5 files changed, 146 insertions(+), 44 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index ce130225a8e5..e6e390d0308f 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1711,7 +1711,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  	if (unlikely(is_swap_pmd(pmd))) {
>  		swp_entry_t entry = pmd_to_swp_entry(pmd);
>  
> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> +		VM_BUG_ON(!is_pmd_migration_entry(pmd) &&
> +				!is_device_private_entry(entry));
>  		if (!is_readable_migration_entry(entry)) {
>  			entry = make_readable_migration_entry(
>  							swp_offset(entry));
> @@ -2222,10 +2223,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		} else if (thp_migration_supported()) {
>  			swp_entry_t entry;
>  
> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>  			entry = pmd_to_swp_entry(orig_pmd);
>  			folio = pfn_swap_entry_folio(entry);
>  			flush_needed = 0;
> +
> +			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> +					!folio_is_device_private(folio));
> +
> +			if (folio_is_device_private(folio)) {
> +				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
> +				WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +			}
>  		} else
>  			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>  
> @@ -2247,6 +2255,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  				folio_mark_accessed(folio);
>  		}
>  
> +		/*
> +		 * Do a folio put on zone device private pages after
> +		 * changes to mm_counter, because the folio_put() will
> +		 * clean folio->mapping and the folio_test_anon() check
> +		 * will not be usable.
> +		 */
> +		if (folio_is_device_private(folio))
> +			folio_put(folio);
> +
>  		spin_unlock(ptl);
>  		if (flush_needed)
>  			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2375,7 +2392,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		struct folio *folio = pfn_swap_entry_folio(entry);
>  		pmd_t newpmd;
>  
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> +			  !folio_is_device_private(folio));
>  		if (is_writable_migration_entry(entry)) {
>  			/*
>  			 * A protection check is difficult so
> @@ -2388,9 +2406,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			newpmd = swp_entry_to_pmd(entry);
>  			if (pmd_swp_soft_dirty(*pmd))
>  				newpmd = pmd_swp_mksoft_dirty(newpmd);
> -		} else {
> +		} else if (is_writable_device_private_entry(entry)) {
> +			newpmd = swp_entry_to_pmd(entry);
> +			entry = make_device_exclusive_entry(swp_offset(entry));
> +		} else
>  			newpmd = *pmd;
> -		}
>  
>  		if (uffd_wp)
>  			newpmd = pmd_swp_mkuffd_wp(newpmd);
> @@ -2842,16 +2862,20 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	struct page *page;
>  	pgtable_t pgtable;
>  	pmd_t old_pmd, _pmd;
> -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
> -	bool anon_exclusive = false, dirty = false;
> +	bool young, write, soft_dirty, uffd_wp = false;
> +	bool anon_exclusive = false, dirty = false, present = false;
>  	unsigned long addr;
>  	pte_t *pte;
>  	int i;
> +	swp_entry_t swp_entry;
>  
>  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
> +
> +	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
> +			&& !(is_swap_pmd(*pmd) &&
> +			is_device_private_entry(pmd_to_swp_entry(*pmd))));
>  
>  	count_vm_event(THP_SPLIT_PMD);
>  
> @@ -2899,20 +2923,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>  	}
>  
> -	pmd_migration = is_pmd_migration_entry(*pmd);
> -	if (unlikely(pmd_migration)) {
> -		swp_entry_t entry;
>  
> +	present = pmd_present(*pmd);
> +	if (unlikely(!present)) {
> +		swp_entry = pmd_to_swp_entry(*pmd);
>  		old_pmd = *pmd;
> -		entry = pmd_to_swp_entry(old_pmd);
> -		page = pfn_swap_entry_to_page(entry);
> -		write = is_writable_migration_entry(entry);
> +
> +		folio = pfn_swap_entry_folio(swp_entry);
> +		VM_BUG_ON(!is_migration_entry(swp_entry) &&
> +				!is_device_private_entry(swp_entry));
> +		page = pfn_swap_entry_to_page(swp_entry);
> +		write = is_writable_migration_entry(swp_entry);
> +
>  		if (PageAnon(page))
> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> -		young = is_migration_entry_young(entry);
> -		dirty = is_migration_entry_dirty(entry);
> +			anon_exclusive =
> +				is_readable_exclusive_migration_entry(swp_entry);
>  		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>  		uffd_wp = pmd_swp_uffd_wp(old_pmd);
> +		young = is_migration_entry_young(swp_entry);
> +		dirty = is_migration_entry_dirty(swp_entry);
>  	} else {
>  		/*
>  		 * Up to this point the pmd is present and huge and userland has
> @@ -2996,30 +3025,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	 * Note that NUMA hinting access restrictions are not transferred to
>  	 * avoid any possibility of altering permissions across VMAs.
>  	 */
> -	if (freeze || pmd_migration) {
> +	if (freeze || !present) {
>  		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>  			pte_t entry;
> -			swp_entry_t swp_entry;
> -
> -			if (write)
> -				swp_entry = make_writable_migration_entry(
> -							page_to_pfn(page + i));
> -			else if (anon_exclusive)
> -				swp_entry = make_readable_exclusive_migration_entry(
> -							page_to_pfn(page + i));
> -			else
> -				swp_entry = make_readable_migration_entry(
> -							page_to_pfn(page + i));
> -			if (young)
> -				swp_entry = make_migration_entry_young(swp_entry);
> -			if (dirty)
> -				swp_entry = make_migration_entry_dirty(swp_entry);
> -			entry = swp_entry_to_pte(swp_entry);
> -			if (soft_dirty)
> -				entry = pte_swp_mksoft_dirty(entry);
> -			if (uffd_wp)
> -				entry = pte_swp_mkuffd_wp(entry);
> -
> +			if (freeze || is_migration_entry(swp_entry)) {
> +				if (write)
> +					swp_entry = make_writable_migration_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_readable_exclusive_migration_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_migration_entry(
> +								page_to_pfn(page + i));
> +				if (young)
> +					swp_entry = make_migration_entry_young(swp_entry);
> +				if (dirty)
> +					swp_entry = make_migration_entry_dirty(swp_entry);
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			} else {
> +				VM_BUG_ON(!is_device_private_entry(swp_entry));
> +				if (write)
> +					swp_entry = make_writable_device_private_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_device_exclusive_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_device_private_entry(
> +								page_to_pfn(page + i));
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			}
>  			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>  			set_pte_at(mm, addr, pte + i, entry);
>  		}
> @@ -3046,7 +3090,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	}
>  	pte_unmap(pte);
>  
> -	if (!pmd_migration)
> +	if (present)
>  		folio_remove_rmap_pmd(folio, page, vma);
>  	if (freeze)
>  		put_page(page);
> @@ -3058,8 +3102,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>  			   pmd_t *pmd, bool freeze)
>  {
> +
>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
> +	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
> +			(is_swap_pmd(*pmd) &&
> +			is_device_private_entry(pmd_to_swp_entry(*pmd))))
>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>  }
>  
> @@ -3238,6 +3285,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>  	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>  	lockdep_assert_held(&lruvec->lru_lock);
>  
> +	if (folio_is_device_private(folio))
> +		return;
> +
>  	if (list) {
>  		/* page reclaim is reclaiming a huge page */
>  		VM_WARN_ON(folio_test_lru(folio));
> @@ -3252,6 +3302,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>  			list_add_tail(&new_folio->lru, &folio->lru);
>  		folio_set_lru(new_folio);
>  	}
> +
>  }
>  
>  /* Racy check whether the huge page can be split */
> @@ -3543,6 +3594,10 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  					((mapping || swap_cache) ?
>  						folio_nr_pages(release) : 0));
>  
> +			if (folio_is_device_private(release))
> +				percpu_ref_get_many(&release->pgmap->ref,
> +							(1 << new_order) - 1);

pgmap refcount should not be modified here, count should remain the same after the split also


> +
>  			lru_add_split_folio(origin_folio, release, lruvec,
>  					list);
>  
> @@ -4596,7 +4651,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>  		return 0;
>  
>  	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	if (!folio_is_device_private(folio))
> +		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	else
> +		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
>  
>  	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>  	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
> @@ -4646,6 +4704,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>  	entry = pmd_to_swp_entry(*pvmw->pmd);
>  	folio_get(folio);
>  	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
> +
> +	if (unlikely(folio_is_device_private(folio))) {
> +		if (pmd_write(pmde))
> +			entry = make_writable_device_private_entry(
> +							page_to_pfn(new));
> +		else
> +			entry = make_readable_device_private_entry(
> +							page_to_pfn(new));
> +		pmde = swp_entry_to_pmd(entry);
> +	}
> +
>  	if (pmd_swp_soft_dirty(*pvmw->pmd))
>  		pmde = pmd_mksoft_dirty(pmde);
>  	if (is_writable_migration_entry(entry))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 767f503f0875..0b6ecf559b22 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>  
>  	if (PageCompound(page))
>  		return false;
> +	if (folio_is_device_private(folio))
> +		return false;
>  	VM_BUG_ON_PAGE(!PageAnon(page), page);
>  	VM_BUG_ON_PAGE(!PageLocked(page), page);
>  	VM_BUG_ON_PAGE(pte_present(ptep_get(pvmw->pte)), page);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e981a1a292d2..ff8254e52de5 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -277,6 +277,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			 * cannot return prematurely, while zap_huge_pmd() has
>  			 * cleared *pmd but not decremented compound_mapcount().
>  			 */
> +			swp_entry_t entry;
> +
> +			if (!thp_migration_supported())
> +				return not_found(pvmw);
> +			entry = pmd_to_swp_entry(pmde);
> +			if (is_device_private_entry(entry)) {
> +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
> +				return true;
> +			}
> +
>  			if ((pvmw->flags & PVMW_SYNC) &&
>  			    thp_vma_suitable_order(vma, pvmw->address,
>  						   PMD_ORDER) &&
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 567e2d084071..604e8206a2ec 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>  		*pmdvalp = pmdval;
>  	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>  		goto nomap;
> +	if (is_swap_pmd(pmdval)) {
> +		swp_entry_t entry = pmd_to_swp_entry(pmdval);
> +
> +		if (is_device_private_entry(entry))
> +			goto nomap;
> +	}
>  	if (unlikely(pmd_trans_huge(pmdval)))
>  		goto nomap;
>  	if (unlikely(pmd_bad(pmdval))) {
> diff --git a/mm/rmap.c b/mm/rmap.c
> index bd83724d14b6..da1e5b03e1fe 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2336,8 +2336,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  				break;
>  			}
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> -			subpage = folio_page(folio,
> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +			/*
> +			 * Zone device private folios do not work well with
> +			 * pmd_pfn() on some architectures due to pte
> +			 * inversion.
> +			 */
> +			if (folio_is_device_private(folio)) {
> +				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
> +				unsigned long pfn = swp_offset_pfn(entry);
> +
> +				subpage = folio_page(folio, pfn
> +							- folio_pfn(folio));
> +			} else {
> +				subpage = folio_page(folio,
> +							pmd_pfn(*pvmw.pmd)
> +							- folio_pfn(folio));
> +			}
> +
>  			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>  					!folio_test_pmd_mappable(folio), folio);
>  

