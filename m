Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09552264C8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860184; cv=none; b=SdkSk1RBQoMHdM4NclgVqUTLNNZPETHG2pBmqdMgp+qOA9HScHBL+j5691WqFJg84B5uQf1n2hzQson7Pqowgw74Yb/2BWMI3Ir8pRs6y8QijAxSHGQ0nt4enpVU4RQhHJ+/56pQdOvEPYy8FBpuhJy9827gNpFAiHz5ME/4UpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860184; c=relaxed/simple;
	bh=9iNfpqxUuXq5MV/RMa8hzlNnFN5nz7n5Hr20oZq767w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1dwPCCRToq6BQuMEq7/IA7cbNeWTFU0pWfOxOU/P2KEFRnf/sU0RXirfdT00/wL2FlAvmKICcCRYuETVSQidb9e35a0EjHD2/IIgqbNXkMw9zjfg7IDrbEvHkmnZtghCwOTJidwiZWG8CIxizwL4VJOV2uDSzCeJ0L1i/8iV0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+KheqqP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+KheqqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751860177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvOm2Q7E7WhKUu0R/+1+wPe/9ebrmyIzTORef/nPo+Y=;
	b=F+KheqqPeMuIZKh2lRacgoi3cr/iniDeGtlvaGY7u5Bb/GYfiwYCHSALfmKGP0cMahChe+
	/Uv6OFdVLGR8BROus8mlecCoxAgSiZFZFDCtfFeZYlc7uV4J57Z6xBASqf6bR6NSRyETuD
	Xpeot9aV2kvkeHZu9z9ql3tNEKPlHdU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-GWkAuAZ0O7qOB7oqUiPWFQ-1; Sun, 06 Jul 2025 23:49:36 -0400
X-MC-Unique: GWkAuAZ0O7qOB7oqUiPWFQ-1
X-Mimecast-MFC-AGG-ID: GWkAuAZ0O7qOB7oqUiPWFQ_1751860175
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32b41b99f33so9118671fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860175; x=1752464975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvOm2Q7E7WhKUu0R/+1+wPe/9ebrmyIzTORef/nPo+Y=;
        b=tmzqNIqYaGFlD9EtKR8zGVEIr5ZBhUm7ia2N5OW029uqBgBEnztlRdNWpRL9bTfLev
         lbPelEB9ZD31JXLZpksYwRZIfvBYF5QpZGxzbuV+mxVKkRJqN0OfJR9JY68v6tXtw9eT
         RCxsFcDIbq+idjka6LOZMfDDPvotdi6ZPD1bDSUSDU6X3ifCAtrYVRIcgpaFK1sscK8u
         9PHgwrA/dfc/SN9DQUDZPS6TXbH/S4SPWSpd06SwP2mkPeVadXbQ8AsURC+Vre/vxIk/
         hCNQa8WLZSCkcxyX+uTQaG/UXFGj3mja7I4sdi8ZJdk4Zy1/TLw7tc6F7Z2iRLPV1ukx
         NIdA==
X-Forwarded-Encrypted: i=1; AJvYcCUMYZA1uhc9YmbZYm59KWDQEgRE4/S6pzl5x0RtO+uFw5TEwvjxUHe/dFwVWmzofeS4+rhK5X/bi55HNXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJRnwuxoCn44fEOWYCAkDZfHqBUcWLrMoZsg3QVQh6HFSlGYm
	OfCki2lu+Y14XG/3ZGg6pQ+P3ZA/58cVpHFPcQwXz6PhVfklZxH7Cd2Co4PpVT/DioCaWTL3IIj
	6Fz1CIOw+jKjkm4AltOnuXlBozGrcTQsjSTB6cGbXcA3ps1q65pcJqmqs9XK82Td9
X-Gm-Gg: ASbGnct9UlFBJsVuBhMVwZ0tNTEL5VRIkrB0bOAaDQl+ghOhFvmRnl+96TewMqtTK1Z
	a4jVoko81Mwl21EHcFBssMWJZhcpSm8RwIksberL3NvbkrX0Eti1sm/OVId3lDqaXyr7NS6q3r9
	UwlS3aTf0/j4PArexLTvDrSqiRf8wIaL3loY5qz1OPonjlkzr8GFY0JDBjEhy37uVgZPG0Cj0vR
	b3+3XitkKreZb6Rj9atVhvvCTCf6HVBzeiFlGRqq2Z+Fw1eYtQnBjzEFk0Gq3BNtco/NZN7X7f2
	gC98hXR+SiHE+fCrdPyAxE7fbMrhoBHXyTmXYVaJRNs28Wy4
X-Received: by 2002:a05:651c:2044:b0:32c:a851:e7a with SMTP id 38308e7fff4ca-32f092c6933mr16767061fa.24.1751860174978;
        Sun, 06 Jul 2025 20:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFteSHIvjYdgZx+QojYfNef14uWJx4LPm42VX2mBQ2e4xbmwfOPaNbOVGMJz9YCIzDcki2kpQ==
X-Received: by 2002:a05:651c:2044:b0:32c:a851:e7a with SMTP id 38308e7fff4ca-32f092c6933mr16766971fa.24.1751860174432;
        Sun, 06 Jul 2025 20:49:34 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1202besm10321031fa.54.2025.07.06.20.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 20:49:33 -0700 (PDT)
Message-ID: <fd86a9f9-66b4-4994-908d-af4c6637442e@redhat.com>
Date: Mon, 7 Jul 2025 06:49:32 +0300
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

This is where folio_try_share_anon_rmap_pmd() is skipped for device private pages, to which I referred in
https://lore.kernel.org/linux-mm/f1e26e18-83db-4c0e-b8d8-0af8ffa8a206@redhat.com/

--Mika


