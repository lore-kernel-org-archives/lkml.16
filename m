Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870AADDBC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744168544; cv=none; b=uep3wahHzDAP9ItFe8OrOevfMQ7tNoEiuSfSSFoxNALucfx0QsK7yfpSp3g6VSezs5thkNPt1AMYuKQyO2zG7BSu6xNqJhDHH2WYVMoL7EXDNg0Geg+Kro5mV4ONyDqM1KsaTkRgajg2UotG04s0D5xVZSRKoWPdSP0OFKzk9lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744168544; c=relaxed/simple;
	bh=UGhu01vP8CSYmHh6eG+OptLkU9eM4Gjl7x+trTftArg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6ya50CWHHk+Y75g7gy3lyOLV5SvbkjcCTz46QJx8pcWxzwCANTnSo6SwGkBV8NiDUR6ImZiMSs5uZvovo6dYeohACPagngO0sqdik5zdM91bzJP1GSPuuXD5agbUXWhKbZSPjh1zxcdeqmytk0S7gOFfOgXxcJR1s5cxXNmhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tGYmQ8gH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tGYmQ8gH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=48M+FnhY7uZ8tqy247D7H8JPYIzLS6Ux7OX9yqw3LtQ=; b=tGYmQ8gHW2+T2oVngTBiEIcONj
	Kpu0p1Q30aeq3gSZsaPEMHwhx89hNzD51hsDOZeStKcwe7VMEo6ZOBYtoOwuh09px++UDSc97mLMf
	011rcscX3bvdQRLOSBUQyj/XaXoAudTiPuV4XIZa7zbe25nVnLe/FZPfUe434sawd1fNv+oMJAybh
	jSV54wvRzu0OYM6tTpv0W+f1pYzKgbnaLSf+PCHG2NjZnBT0TdlTMEFH8hfz/9nWYtilwzzMOJ7B7
	f0epa6E2dnp7M/tgXgR1IvZLHLTXth//4US/Ydk5ik8U+/NtWYnI/qxpHJSfhg3ebMJ+Xljm+xfPu
	Y+2URBNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LuU-00000000pTD-1C1a;
	Wed, 09 Apr 2025 03:15:30 +0000
Date: Wed, 9 Apr 2025 04:15:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
Message-ID: <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409004937.634713-1-nifan.cxl@gmail.com>

On Tue, Apr 08, 2025 at 05:49:10PM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> Convert the use of &folio->page to folio_page(folio, 0) where struct
> filio fits in. This is part of the efforts to move some fields out of
> struct page to reduce its size.

Thanks for sending the patch.  You've mixed together quite a few things;
I'd suggest focusing on one API at a time.

>  		folio_get(folio);
> -		folio_add_file_rmap_pmd(folio, &folio->page, vma);
> +		folio_add_file_rmap_pmd(folio, folio_page(folio, 0), vma);
>  		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);

I think this is fine, but would defer to David Hildenbrand.

>  		folio_get(folio);
> -		folio_add_file_rmap_pud(folio, &folio->page, vma);
> +		folio_add_file_rmap_pud(folio, folio_page(folio, 0), vma);
>  		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);

If that is fine, then so is this (put them in the same patchset).

>  		spin_unlock(ptl);
> -		if (flush_needed)
> -			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> +		if (flush_needed) {
> +			tlb_remove_page_size(tlb, folio_page(folio, 0),
> +					     HPAGE_PMD_SIZE);
> +		}

You don't need to add the extra braces here.  I haven't looked into this
family of APIs; not sure if we should be passing the folio here or
if it should be taking a folio argument.

>  		if (folio_maybe_dma_pinned(src_folio) ||
> -		    !PageAnonExclusive(&src_folio->page)) {
> +		    !PageAnonExclusive(folio_page(src_folio, 0))) {
>  			err = -EBUSY;

mmm.  Another David question.

>  	for (i = new_nr_pages; i < nr_pages; i += new_nr_pages) {
> -		struct page *new_head = &folio->page + i;
> +		struct page *new_head = folio_page(folio, i);
>  

This is definitely the right thing to do.

> @@ -3403,7 +3405,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>  	if (new_order)
>  		folio_set_order(folio, new_order);
>  	else
> -		ClearPageCompound(&folio->page);
> +		ClearPageCompound(folio_page(folio, 0));
>  }

I might be inclined to leave this one alone; this whole function needs
to be rewritten as part of the folio split.

>  		folio_split_memcg_refs(folio, old_order, split_order);
> -		split_page_owner(&folio->page, old_order, split_order);
> +		split_page_owner(folio_page(folio, 0), old_order, split_order);
>  		pgalloc_tag_split(folio, old_order, split_order);

Not sure if split_folio_owner is something that should exist.  Haven't
looked into it.

>  		 */
> -		free_page_and_swap_cache(&new_folio->page);
> +		free_page_and_swap_cache(folio_page(new_folio, 0));
>  	}

free_page_and_swap_cache() should be converted to be
free_folio_and_swap_cache().

>  
> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
> +	return __folio_split(folio, new_order, folio_page(folio, 0), page,
> +			     list, true);
>  }

Probably right.

>  {
> -	return __folio_split(folio, new_order, split_at, &folio->page, list,
> -			false);
> +	return __folio_split(folio, new_order, split_at, folio_page(folio, 0),
> +			     list, false);
>  }

Ditto.

>  
> -	return split_huge_page_to_list_to_order(&folio->page, list, ret);
> +	return split_huge_page_to_list_to_order(folio_page(folio, 0), list,
> +						ret);
>  }

Ditto.

>  
> -		if (is_migrate_isolate_page(&folio->page))
> +		if (is_migrate_isolate_page(folio_page(folio, 0)))
>  			continue;

I think we need an is_migrate_isolate_folio() instead of this.

>  	if (folio_test_anon(folio))
> -		__ClearPageAnonExclusive(&folio->page);
> +		__ClearPageAnonExclusive(folio_page(folio, 0));
>  	folio->mapping = NULL;

... David.

>  
> -		split_page_owner(&folio->page, huge_page_order(src), huge_page_order(dst));
> +		split_page_owner(folio_page(folio, 0), huge_page_order(src),
> +				 huge_page_order(dst));

See earlier.

>  	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
> -		if (!PageAnonExclusive(&old_folio->page)) {
> +		if (!PageAnonExclusive(folio_page(old_folio, 0))) {
>  			folio_move_anon_rmap(old_folio, vma);
> -			SetPageAnonExclusive(&old_folio->page);
> +			SetPageAnonExclusive(folio_page(old_folio, 0));
>  		}

David.

>  	}
>  	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
> -		       PageAnonExclusive(&old_folio->page), &old_folio->page);
> +		       PageAnonExclusive(folio_page(old_folio, 0)),
> +		       folio_page(old_folio, 0));

The PageAnonExclusive() part of this change is for David to comment on,
but this should be a VM_BUG_ON_FOLIO() instead of calling folio_page()
to keep this a VM_BUG_ON_PAGE().

>  
> -			unmap_ref_private(mm, vma, &old_folio->page,
> -					vmf->address);
> +			unmap_ref_private(mm, vma, folio_page(old_folio, 0),
> +					  vmf->address);

unmap_ref_private() only has one caller (this one), so make that take a
folio.  This is a whole series, all by itself.

>  	hugetlb_cgroup_migrate(old_folio, new_folio);
> -	set_page_owner_migrate_reason(&new_folio->page, reason);
> +	set_page_owner_migrate_reason(folio_page(new_folio, 0), reason);
>  

See earlier about page owner being folio or page based.

>  	int ret;
> -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> +	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
>  	unsigned long vmemmap_reuse;

Probably right.

>  	int ret = 0;
> -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> +	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
>  	unsigned long vmemmap_reuse;

Ditto.

> -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> +	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
>  	unsigned long vmemmap_reuse;

Ditto.

>  			 */
> -			spfn = (unsigned long)&folio->page;
> +			spfn = (unsigned long)folio_page(folio, 0);

Ditto.

>  			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
> -					&folio->page,
> -					HUGETLB_VMEMMAP_RESERVE_SIZE);
> +						     folio_page(folio, 0),
> +						     HUGETLB_VMEMMAP_RESERVE_SIZE);

Don't change the indentation, but looks right.

>  		result = SCAN_SUCCEED;
> -		trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
> -						    referenced, writable, result);
> +		trace_mm_collapse_huge_page_isolate(folio_page(folio, 0),
> +						    none_or_zero, referenced,
> +						    writable, result);
>  		return result;

trace_mm_collapse_huge_page_isolate() should take a folio.

>  	release_pte_pages(pte, _pte, compound_pagelist);
> -	trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
> -					    referenced, writable, result);
> +	trace_mm_collapse_huge_page_isolate(folio_page(folio, 0),
> +					    none_or_zero, referenced,
> +					    writable, result);
>  	return result;

ditto.

>  out:
> -	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
> -				     none_or_zero, result, unmapped);
> +	trace_mm_khugepaged_scan_pmd(mm, folio_page(folio, 0), writable,
> +				     referenced, none_or_zero, result,
> +				     unmapped);
>  	return result;

ditto,

>  	result = install_pmd
> -			? set_huge_pmd(vma, haddr, pmd, &folio->page)
> +			? set_huge_pmd(vma, haddr, pmd, folio_page(folio, 0))
>  			: SCAN_SUCCEED;

I feel that set_huge_pmd() should take a folio.
