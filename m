Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A531FC8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751606261; cv=none; b=PIzML/VM+TlpihaLvvYyh4dJj5oG21MYjLb6l3GaOjxKUu5wkBHrQ7XRgiYuPFXYsJiFJxUx2EIoVjv2tb4moUA5vESSbQPS56CdjmTR6gbQU8ZNTqybGwXpGCitncGifQnw6gh1upL5K+55/n8cxQ0/jPmYroOJDJVlTkHlTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751606261; c=relaxed/simple;
	bh=yIOrjDSRcJUsDofaodNNxMxlX7kwOOinH1Yhx8A3Qa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wr2UD5jlylr+IXKDI7/c1sf9jTiPerI1LjrKSruJkAZJCmrrkFzHUjDTucSYxyscOkz77SFSvCmDCdl4ULLApv2nBbPuo13ktjH9nSIvh1RoaRZ8NZXlDfKctIHzxTS+IBj46t5fkE71BWrJoP6dzJM/2HkjIKC16TNaIa7socI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WliQEziK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WliQEziK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751606258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRUEvcfXdqvwdxgQ4+c1YZOWPsm20G4vBAXrqZXc2jk=;
	b=WliQEziKBLMnGKBgOw8Kyg3vLsDKLzzm5MkHOf5Egp7CuLymgdvOWhI0o+d13/q2bVZDZF
	ygMyfwZyr72yVtPA9EamWnhNap33E6MyG/ha3tndpqykrrafZcIVoV5unCIYP6ySXA4wnD
	h9TdFVRnx5Otup6ncVKlL9bzI03g1vw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-NhnNdGcXPHWlRMfnwlaMfA-1; Fri, 04 Jul 2025 01:17:36 -0400
X-MC-Unique: NhnNdGcXPHWlRMfnwlaMfA-1
X-Mimecast-MFC-AGG-ID: NhnNdGcXPHWlRMfnwlaMfA_1751606255
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5562a916832so319308e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 22:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751606255; x=1752211055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRUEvcfXdqvwdxgQ4+c1YZOWPsm20G4vBAXrqZXc2jk=;
        b=gnMVBANmYIbZrZtgUfadpCYCkjtFuCrbZA03A/3Wc9gkieRchadpmUZcLP7PspKC6E
         HwHQpegpjGwKLXMjrllPKjuo2tjNMprF3t9Gmrc3W2ClWGsncn+sNZxjKRvHl0eZp/gg
         SavbGtQ+ibTdC3J2gA7vfUp1xW5Qk8QVMSo6utltuuNnFhR/v/LvyF6aedQ5+HVXlXML
         gL7VSSmx9ET5sZxGK9HtgKIQcv2brMlrSJpxXM5hNMck1pnb1t3y/fwkNo9HYkqqJK35
         CRnO0AYGkzYiHZBJy5WVuWpXCByI39fiWqo2jDv10OM/oKYxoWrj2d9WK2ByBDVVNbJV
         nlCw==
X-Forwarded-Encrypted: i=1; AJvYcCWbgsjxuKJUCTckf2j9KJq9Cr9llyQD9ypw898w92zA2BXqsaBa/TSdkj2zvClmace8iD/dNJQNUbXJ1Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4l57W52VOyP5bhQxxi53zN46mLp5FDiQUepqzurLe8guMRdgK
	J9iiBZS576IOmeKB6dOfyyGS9knePvRnbLxmE7H5yShBvrbpSKT2QSgpqX3lfy9BlHatgmaioe7
	T83sFsCMQ4Lw60nZSvmUzuoS6Cam73+mUMOdgV2pUkBu7ea0TNhAaLnuOg1cTWRJ3
X-Gm-Gg: ASbGncv2MMqdp5zwplofnKVgCRMVMYBRuc2kRBIIuSNyXt+cCtbpDGprbNIQ0dkmbbq
	9QJj0Av/clk0kC7/ELnTEWd4XkPntl6yo+04rnd9Ra3pQhyMEymt7QKnGLRd+Bfwa1tF2sBRb1g
	cbcLY1qR1a7tcsTypv6g6MrW2owq2ntpaGCyS+ZQ32ayvPKhxTLjUCk1YevU3yOjxpI1zG9JV9H
	vvIH65L7PigiGa2RZEYu27bohiT0mkR1EtNrrNHgK+1Vclj1SXhsUdKVxtI4lMnZmHuYdjT5tap
	KrupG7EiBesktlerocZ7ybteR1R00WDLvxz94TejAWZQDk22
X-Received: by 2002:a05:6512:6d5:b0:554:f76a:baba with SMTP id 2adb3069b0e04-557a132be69mr187669e87.3.1751606254903;
        Thu, 03 Jul 2025 22:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNxmEl+b8akt8r3Ay7zRPWHzT8OyQwvUzVXxV5pqjm04iOGu0LsvWHBNBVl8huhB/SBfX2A==
X-Received: by 2002:a05:6512:6d5:b0:554:f76a:baba with SMTP id 2adb3069b0e04-557a132be69mr187645e87.3.1751606254348;
        Thu, 03 Jul 2025 22:17:34 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d1271sm147541e87.252.2025.07.03.22.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 22:17:33 -0700 (PDT)
Message-ID: <e1889eb8-d2d9-4d97-b9ae-e50158442945@redhat.com>
Date: Fri, 4 Jul 2025 08:17:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
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
 <20250703233511.2028395-9-balbirs@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250703233511.2028395-9-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/25 02:35, Balbir Singh wrote:
> Support splitting pages during THP zone device migration as needed.
> The common case that arises is that after setup, during migrate
> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
> pages.
>
> Add a new routine migrate_vma_split_pages() to support the splitting
> of already isolated pages. The pages being migrated are already unmapped
> and marked for migration during setup (via unmap). folio_split() and
> __split_unmapped_folio() take additional isolated arguments, to avoid
> unmapping and remaping these pages and unlocking/putting the folio.
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
>  include/linux/huge_mm.h | 11 ++++++--
>  mm/huge_memory.c        | 54 ++++++++++++++++++++-----------------
>  mm/migrate_device.c     | 59 ++++++++++++++++++++++++++++++++---------
>  3 files changed, 85 insertions(+), 39 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 65a1bdf29bb9..5f55a754e57c 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -343,8 +343,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>  		vm_flags_t vm_flags);
>  
>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
> -		unsigned int new_order);
> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
> +		unsigned int new_order, bool isolated);
>  int min_order_for_split(struct folio *folio);
>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>  bool uniform_split_supported(struct folio *folio, unsigned int new_order,
> @@ -353,6 +353,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
>  		bool warns);
>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>  		struct list_head *list);
> +
> +static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
> +		unsigned int new_order)
> +{
> +	return __split_huge_page_to_list_to_order(page, list, new_order, false);
> +}
> +
>  /*
>   * try_folio_split - try to split a @folio at @page using non uniform split.
>   * @folio: folio to be split
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d55e36ae0c39..e00ddfed22fa 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3424,15 +3424,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>  		new_folio->mapping = folio->mapping;
>  		new_folio->index = folio->index + i;
>  
> -		/*
> -		 * page->private should not be set in tail pages. Fix up and warn once
> -		 * if private is unexpectedly set.
> -		 */
> -		if (unlikely(new_folio->private)) {
> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
> -			new_folio->private = NULL;
> -		}
> -
>  		if (folio_test_swapcache(folio))
>  			new_folio->swap.val = folio->swap.val + i;
>  
> @@ -3519,7 +3510,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  		struct page *split_at, struct page *lock_at,
>  		struct list_head *list, pgoff_t end,
>  		struct xa_state *xas, struct address_space *mapping,
> -		bool uniform_split)
> +		bool uniform_split, bool isolated)
>  {
>  	struct lruvec *lruvec;
>  	struct address_space *swap_cache = NULL;
> @@ -3643,8 +3634,9 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  				percpu_ref_get_many(&release->pgmap->ref,
>  							(1 << new_order) - 1);
>  
> -			lru_add_split_folio(origin_folio, release, lruvec,
> -					list);
> +			if (!isolated)
> +				lru_add_split_folio(origin_folio, release,
> +							lruvec, list);
>  
>  			/* Some pages can be beyond EOF: drop them from cache */
>  			if (release->index >= end) {
> @@ -3697,6 +3689,12 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  	if (nr_dropped)
>  		shmem_uncharge(mapping->host, nr_dropped);
>  
> +	/*
> +	 * Don't remap and unlock isolated folios
> +	 */
> +	if (isolated)
> +		return ret;
> +
>  	remap_page(origin_folio, 1 << order,
>  			folio_test_anon(origin_folio) ?
>  				RMP_USE_SHARED_ZEROPAGE : 0);
> @@ -3790,6 +3788,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>   * @lock_at: a page within @folio to be left locked to caller
>   * @list: after-split folios will be put on it if non NULL
>   * @uniform_split: perform uniform split or not (non-uniform split)
> + * @isolated: The pages are already unmapped
>   *
>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>   * It is in charge of checking whether the split is supported or not and
> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>   */
>  static int __folio_split(struct folio *folio, unsigned int new_order,
>  		struct page *split_at, struct page *lock_at,
> -		struct list_head *list, bool uniform_split)
> +		struct list_head *list, bool uniform_split, bool isolated)
>  {
>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  		 * is taken to serialise against parallel split or collapse
>  		 * operations.
>  		 */
> -		anon_vma = folio_get_anon_vma(folio);
> -		if (!anon_vma) {
> -			ret = -EBUSY;
> -			goto out;
> +		if (!isolated) {
> +			anon_vma = folio_get_anon_vma(folio);
> +			if (!anon_vma) {
> +				ret = -EBUSY;
> +				goto out;
> +			}
> +			anon_vma_lock_write(anon_vma);
>  		}
>  		end = -1;
>  		mapping = NULL;
> -		anon_vma_lock_write(anon_vma);
>  	} else {
>  		unsigned int min_order;
>  		gfp_t gfp;
> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  		goto out_unlock;
>  	}
>  
> -	unmap_folio(folio);
> +	if (!isolated)
> +		unmap_folio(folio);
>  
>  	/* block interrupt reentry in xa_lock and spinlock */
>  	local_irq_disable();
> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  
>  		ret = __split_unmapped_folio(folio, new_order,
>  				split_at, lock_at, list, end, &xas, mapping,
> -				uniform_split);
> +				uniform_split, isolated);
>  	} else {
>  		spin_unlock(&ds_queue->split_queue_lock);
>  fail:
>  		if (mapping)
>  			xas_unlock(&xas);
>  		local_irq_enable();
> -		remap_page(folio, folio_nr_pages(folio), 0);
> +		if (!isolated)
> +			remap_page(folio, folio_nr_pages(folio), 0);
>  		ret = -EAGAIN;
>  	}
>  
> @@ -4046,12 +4049,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   * Returns -EINVAL when trying to split to an order that is incompatible
>   * with the folio. Splitting to order 0 is compatible with all folios.
>   */
> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
> -				     unsigned int new_order)
> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
> +				     unsigned int new_order, bool isolated)
>  {
>  	struct folio *folio = page_folio(page);
>  
> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
> +	return __folio_split(folio, new_order, &folio->page, page, list, true,
> +				isolated);
>  }
>  
>  /*
> @@ -4080,7 +4084,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>  		struct page *split_at, struct list_head *list)
>  {
>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
> -			false);
> +			false, false);
>  }
>  
>  int min_order_for_split(struct folio *folio)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 41d0bd787969..acd2f03b178d 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -813,6 +813,24 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>  		src[i] &= ~MIGRATE_PFN_MIGRATE;
>  	return 0;
>  }
> +
> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
> +					unsigned long idx, unsigned long addr,
> +					struct folio *folio)
> +{
> +	unsigned long i;
> +	unsigned long pfn;
> +	unsigned long flags;
> +
> +	folio_get(folio);
> +	split_huge_pmd_address(migrate->vma, addr, true);
> +	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);

We already have reference to folio, why is folio_get() needed ?

Splitting the page splits pmd for anon folios, why is there split_huge_pmd_address() ?

> +	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
> +	flags = migrate->src[idx] & ((1UL << MIGRATE_PFN_SHIFT) - 1);
> +	pfn = migrate->src[idx] >> MIGRATE_PFN_SHIFT;
> +	for (i = 1; i < HPAGE_PMD_NR; i++)
> +		migrate->src[i+idx] = migrate_pfn(pfn + i) | flags;
> +}
>  #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
>  static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>  					 unsigned long addr,
> @@ -822,6 +840,11 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>  {
>  	return 0;
>  }
> +
> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
> +					unsigned long idx, unsigned long addr,
> +					struct folio *folio)
> +{}
>  #endif
>  
>  /*
> @@ -971,8 +994,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  				struct migrate_vma *migrate)
>  {
>  	struct mmu_notifier_range range;
> -	unsigned long i;
> +	unsigned long i, j;
>  	bool notified = false;
> +	unsigned long addr;
>  
>  	for (i = 0; i < npages; ) {
>  		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
> @@ -1014,12 +1038,16 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
>  				nr = HPAGE_PMD_NR;
>  				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
> -				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> -				goto next;
> +			} else {
> +				nr = 1;
>  			}
>  
> -			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
> -						&src_pfns[i]);
> +			for (j = 0; j < nr && i + j < npages; j++) {
> +				src_pfns[i+j] |= MIGRATE_PFN_MIGRATE;
> +				migrate_vma_insert_page(migrate,
> +					addr + j * PAGE_SIZE,
> +					&dst_pfns[i+j], &src_pfns[i+j]);
> +			}
>  			goto next;
>  		}
>  
> @@ -1041,7 +1069,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  							 MIGRATE_PFN_COMPOUND);
>  					goto next;
>  				}
> -				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> +				nr = 1 << folio_order(folio);
> +				addr = migrate->start + i * PAGE_SIZE;
> +				migrate_vma_split_pages(migrate, i, addr, folio);
>  			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
>  				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
>  				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
> @@ -1076,12 +1106,17 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  		BUG_ON(folio_test_writeback(folio));
>  
>  		if (migrate && migrate->fault_page == page)
> -			extra_cnt = 1;
> -		r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
> -		if (r != MIGRATEPAGE_SUCCESS)
> -			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> -		else
> -			folio_migrate_flags(newfolio, folio);
> +			extra_cnt++;
> +		for (j = 0; j < nr && i + j < npages; j++) {
> +			folio = page_folio(migrate_pfn_to_page(src_pfns[i+j]));
> +			newfolio = page_folio(migrate_pfn_to_page(dst_pfns[i+j]));
> +
> +			r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
> +			if (r != MIGRATEPAGE_SUCCESS)
> +				src_pfns[i+j] &= ~MIGRATE_PFN_MIGRATE;
> +			else
> +				folio_migrate_flags(newfolio, folio);
> +		}
>  next:
>  		i += nr;
>  	}

