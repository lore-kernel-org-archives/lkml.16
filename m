Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94DA1E0DE2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744236476; cv=none; b=W7N7VtmhXTO+aPQPoWzgrIdXmdpR1kVYr0DHPesIXkzYFFcLFoaqqARGlp9EzvEks10WPNEqD/Wk0l3RtXAm5eg1c4TX5Em6h546diM/nvR647BDO4G50B+EIvZwasL8kAhneKoPRMBgxN8yP3iCrLwbtI2TAVs6YKvnTvLjvTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744236476; c=relaxed/simple;
	bh=zerBjadAhDYjeqo3yYEho7XphY0tGd/Ug0KS+3Sm2iE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNfizn30JRl+kHK7YOiHamAYO3y/O5RckxbIT+IQ7/u9xbOnyG8lokrYg/KEWdcHENzFexTRaepCvFZRbqUS8b3OLgRJYjXYA344guFX/cHdk+Ic/2zqtc2SZJ81VDjglokn+SLzta9p+7rPYi25LswPZcqOmdvpbWcIE1ngpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYs7e/bT; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYs7e/bT"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f74b78df93so2768497b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744236474; x=1744841274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIOAufFGfzvsiWIx0kg6chyCPXkxwvpFYvwyJCLyIhw=;
        b=aYs7e/bTBUq6vCJFaE/t7Dai/pg0WCtzhPUsnyBMCq+aGJ8CwC2Ji1kdQZGB8aajmj
         snZtPCQmeW+jCIFyxnPQaGvX8yHWCPpEus9wVmUe7ZRgVpQ+ZOLKXfz4Q4XrgyJKjX5y
         Ysx+IhDJ81QcySZW7oNBkP6aUyEfyAaPf+CtqiGSt4kllXlhxo7pJJiTD3fQUsy1tnzu
         oMFAx1YmOehpUA8lglCcE6lq4eWN7g7C7Myfj1GHos+/4uedrNdBl8AqfqiBL25UZztc
         k+7whD3eGeeb3QWaYBOeQCrnNjHu9Jub+wzfAxovfTwfCYyhvPh9ssbo3/Zh5JD9yGnJ
         MJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744236474; x=1744841274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIOAufFGfzvsiWIx0kg6chyCPXkxwvpFYvwyJCLyIhw=;
        b=piriEz20eOL5Vkun89umGWjmaZyI40rOZGBv3okB056Er0DquIXvQ9w5W+1k8Eppgt
         +M26wXtqnvS3+rqjVsjX4UWKe/IEWhkw/2NaXUSQmpuWJVkJ61S6nQ40Tg2mmJQDt0y4
         Wem7iYU6KvH9A0j06DXjyZtq2Vv2IY0NRmVG4FENpuZEC28p8r+7f30VmVd/91bbf53J
         o1CACXm4Icj04GqdFKAZ7Qo210yTT5mHmkULCiqoEhCWZhYuDDI3moAJF+oTHnypdLQF
         Lp62ZwArvAIFGgtMlDwaGY3r8Z1SgzJawvGugln5Tozxmv7ro+k008OOqcVvIvFgU2mJ
         apwA==
X-Forwarded-Encrypted: i=1; AJvYcCWg5DpgXqFKnRaWlECwLy7QAtgG8BfUZCHhpaHKwA4wf9KpzeIuvJBscGVDbKXlVwLJz8URPz1PtR9NRg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQ1J/C1Q1/IkP+b/g2G9RMv4foCm57rr74pGImzoCML/kSOPR
	bsXkANvkD1/vKBDaENXn6drvJrj9AULkjW5HI6pgw8SMqCeLiMdlRrAgiQ==
X-Gm-Gg: ASbGncu//0V/X4wzhK5H6sTRFOKSxOcTtuIwUCDuiZNEvppL9b9INolg2oV7Qa8J9+P
	+YH1bm/t03HKFBfihxIc3GtPj+kBlMxp1C+X6uV513ir2Wr0xg0uPMzauLJ7E9z3ShZ8gCDhAF6
	WRvlG3inqzPhpZSQAMQQAirr0ltrWl8sgocD1oMT6nHH17mqK/vP+4lo/NCBxdNfiLRv+LgylTp
	x2lhg8EoGCEEsDgSzVUeRxyLtI2RwMgQVez7TnWnH/yATOJgb5slp1+24CAIZe5opdVKrl7Xr9w
	sIiL2oFFzAuWkm4BykfxK78XhMJ62JNd2Wqns3CS
X-Google-Smtp-Source: AGHT+IGi6jXn92yv38JH3Zmq59oA3rL8jNYUD6UXdxnrzc1t/Yyzmf0exmbDDhLrnFJjM6qa9uhH6w==
X-Received: by 2002:a05:690c:c09:b0:6fb:9495:1650 with SMTP id 00721157ae682-70549e9c89cmr8685617b3.11.1744236473747;
        Wed, 09 Apr 2025 15:07:53 -0700 (PDT)
Received: from debian ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e3be5f5sm4690107b3.122.2025.04.09.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 15:07:53 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Wed, 9 Apr 2025 15:07:50 -0700
To: Matthew Wilcox <willy@infradead.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
Message-ID: <Z_bvtonNQJ6HIPSA@debian>
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_XmUrbxKtYmzmJ6@casper.infradead.org>

On Wed, Apr 09, 2025 at 04:15:30AM +0100, Matthew Wilcox wrote:
> On Tue, Apr 08, 2025 at 05:49:10PM -0700, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> > 
> > Convert the use of &folio->page to folio_page(folio, 0) where struct
> > filio fits in. This is part of the efforts to move some fields out of
> > struct page to reduce its size.
> 
> Thanks for sending the patch.  You've mixed together quite a few things;
> I'd suggest focusing on one API at a time.
 
...
> >  		 */
> > -		free_page_and_swap_cache(&new_folio->page);
> > +		free_page_and_swap_cache(folio_page(new_folio, 0));
> >  	}
> 
> free_page_and_swap_cache() should be converted to be
> free_folio_and_swap_cache().

While looking into this function, I see it is defined as a macro in
swap.h as below,
#define free_page_and_swap_cache(page) \
        put_page(page) 

While checking put_page() in include/linux.mm.h, it always converts page
to folio, is there a reason why we do not take "folio" directly?

static inline void put_page(struct page *page)
 {
     struct folio *folio = page_folio(page);

     if (folio_test_slab(folio))
         return;

     folio_put(folio);
 }

Fan

>
> 
> >  
> > -	return __folio_split(folio, new_order, &folio->page, page, list, true);
> > +	return __folio_split(folio, new_order, folio_page(folio, 0), page,
> > +			     list, true);
> >  }
> 
> Probably right.
> 
> >  {
> > -	return __folio_split(folio, new_order, split_at, &folio->page, list,
> > -			false);
> > +	return __folio_split(folio, new_order, split_at, folio_page(folio, 0),
> > +			     list, false);
> >  }
> 
> Ditto.
> 
> >  
> > -	return split_huge_page_to_list_to_order(&folio->page, list, ret);
> > +	return split_huge_page_to_list_to_order(folio_page(folio, 0), list,
> > +						ret);
> >  }
> 
> Ditto.
> 
> >  
> > -		if (is_migrate_isolate_page(&folio->page))
> > +		if (is_migrate_isolate_page(folio_page(folio, 0)))
> >  			continue;
> 
> I think we need an is_migrate_isolate_folio() instead of this.
> 
> >  	if (folio_test_anon(folio))
> > -		__ClearPageAnonExclusive(&folio->page);
> > +		__ClearPageAnonExclusive(folio_page(folio, 0));
> >  	folio->mapping = NULL;
> 
> ... David.
> 
> >  
> > -		split_page_owner(&folio->page, huge_page_order(src), huge_page_order(dst));
> > +		split_page_owner(folio_page(folio, 0), huge_page_order(src),
> > +				 huge_page_order(dst));
> 
> See earlier.
> 
> >  	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
> > -		if (!PageAnonExclusive(&old_folio->page)) {
> > +		if (!PageAnonExclusive(folio_page(old_folio, 0))) {
> >  			folio_move_anon_rmap(old_folio, vma);
> > -			SetPageAnonExclusive(&old_folio->page);
> > +			SetPageAnonExclusive(folio_page(old_folio, 0));
> >  		}
> 
> David.
> 
> >  	}
> >  	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
> > -		       PageAnonExclusive(&old_folio->page), &old_folio->page);
> > +		       PageAnonExclusive(folio_page(old_folio, 0)),
> > +		       folio_page(old_folio, 0));
> 
> The PageAnonExclusive() part of this change is for David to comment on,
> but this should be a VM_BUG_ON_FOLIO() instead of calling folio_page()
> to keep this a VM_BUG_ON_PAGE().
> 
> >  
> > -			unmap_ref_private(mm, vma, &old_folio->page,
> > -					vmf->address);
> > +			unmap_ref_private(mm, vma, folio_page(old_folio, 0),
> > +					  vmf->address);
> 
> unmap_ref_private() only has one caller (this one), so make that take a
> folio.  This is a whole series, all by itself.
> 
> >  	hugetlb_cgroup_migrate(old_folio, new_folio);
> > -	set_page_owner_migrate_reason(&new_folio->page, reason);
> > +	set_page_owner_migrate_reason(folio_page(new_folio, 0), reason);
> >  
> 
> See earlier about page owner being folio or page based.
> 
> >  	int ret;
> > -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> > +	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
> >  	unsigned long vmemmap_reuse;
> 
> Probably right.
> 
> >  	int ret = 0;
> > -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> > +	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
> >  	unsigned long vmemmap_reuse;
> 
> Ditto.
> 
> > -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> > +	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
> >  	unsigned long vmemmap_reuse;
> 
> Ditto.
> 
> >  			 */
> > -			spfn = (unsigned long)&folio->page;
> > +			spfn = (unsigned long)folio_page(folio, 0);
> 
> Ditto.
> 
> >  			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
> > -					&folio->page,
> > -					HUGETLB_VMEMMAP_RESERVE_SIZE);
> > +						     folio_page(folio, 0),
> > +						     HUGETLB_VMEMMAP_RESERVE_SIZE);
> 
> Don't change the indentation, but looks right.
> 
> >  		result = SCAN_SUCCEED;
> > -		trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
> > -						    referenced, writable, result);
> > +		trace_mm_collapse_huge_page_isolate(folio_page(folio, 0),
> > +						    none_or_zero, referenced,
> > +						    writable, result);
> >  		return result;
> 
> trace_mm_collapse_huge_page_isolate() should take a folio.
> 
> >  	release_pte_pages(pte, _pte, compound_pagelist);
> > -	trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
> > -					    referenced, writable, result);
> > +	trace_mm_collapse_huge_page_isolate(folio_page(folio, 0),
> > +					    none_or_zero, referenced,
> > +					    writable, result);
> >  	return result;
> 
> ditto.
> 
> >  out:
> > -	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
> > -				     none_or_zero, result, unmapped);
> > +	trace_mm_khugepaged_scan_pmd(mm, folio_page(folio, 0), writable,
> > +				     referenced, none_or_zero, result,
> > +				     unmapped);
> >  	return result;
> 
> ditto,
> 
> >  	result = install_pmd
> > -			? set_huge_pmd(vma, haddr, pmd, &folio->page)
> > +			? set_huge_pmd(vma, haddr, pmd, folio_page(folio, 0))
> >  			: SCAN_SUCCEED;
> 
> I feel that set_huge_pmd() should take a folio.
