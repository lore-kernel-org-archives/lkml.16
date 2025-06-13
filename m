Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D654433B3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824187; cv=none; b=ZAdcawUna9vU2UIcs+S25S9CTucsxG4GaemLCktRD/NeVTqt6Udwkc/0OYOTnit7/T5h72B1f5e9rYY3Rp5oe5Mq9oQyZ7hXjmzfGJVfJW3ixQcCQlqKQeZtwTM+u/4ujpMiAvCey4gQlbYEIOTFSYzxF7nMrL8RMO6DfOIWq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824187; c=relaxed/simple;
	bh=QGww1yzEb8QJqnEjlKVo1G7xRfOl8BeipDqARiECuYA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBtT7dvlvB6NERGZ3lpvR8TxzTzVS76aF10J6bmqgVqCudZuUmwQ1/S56/09Btt0M+h+FGwzwJdfCM0Ltnh915w0NHE7tDcTYVdubjujfQAIsgt5IzK5rq6ZVoblxF4JhpUoMWt9bIwD7DpLlBZlV2J466/95ij7Ehl5hTH42ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EJB/wH98; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EJB/wH98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749824184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1vYPJOLaWcT2RxqTFWat03C15+kdrCA8LnBY4Rc0gQ=;
	b=EJB/wH98oy1ppVsTi3c9C2bMG7mxaz16zhxKlebYnz1LrFV2NEpwlvMh78BTjmAHXCp9c8
	lNrYtuONocsPTIrXtsWNz1VGWLHFsE4gJrvRmbg6uHllf39oe96q64YzEX08InJArJrvVP
	v5wziAY6giAMHMa3iZ7zBHb+jiAHTvE=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-PXmEVKZ_PMKe-I_tXN9ioA-1; Fri, 13 Jun 2025 10:16:23 -0400
X-MC-Unique: PXmEVKZ_PMKe-I_tXN9ioA-1
X-Mimecast-MFC-AGG-ID: PXmEVKZ_PMKe-I_tXN9ioA_1749824182
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-60ef1e1cb0fso583337eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824182; x=1750428982;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1vYPJOLaWcT2RxqTFWat03C15+kdrCA8LnBY4Rc0gQ=;
        b=YmQ5LTlUbN6Z2A/WHKmqqBmMQgrJSMPla4FbVOwKbo7uxWI1sqjVcLeq1a17JFnL2l
         x5s6x7VzykES9WFXt6OiWYEdfoZJ+e28vsfd7miMvSUtERo4nJKcbhtE4Lsuh9Bxk7AA
         evYxJDr4JnM7QiLW5TNmenlIlD3W+LTRKMY6TGRAejpmcCidinNT9Aw9EVkwwyXPIped
         XFaRKLTKEuu318thi/oYj15CaRJyqAmjOScQ2ng20PUft8K+CP+EfN2TRGUiPYpMTZ60
         3zPtr5zO4JZOXVDAXGOrbvLXo81De2Sv92Ho9r7en0eSZ3DbQRctb/w3+AFQpsY/ytqn
         l9cg==
X-Forwarded-Encrypted: i=1; AJvYcCUqfD3M31YsM+VxEwLr88SIVrLP4Bt1Z237rPm7e5VOuugkEbEpjBWd2QlIFtNRa7diaZPOqRqcBsA0BtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Cl+WVBbQ1PICLvs9Pg8uRs2aWyHs4NMVNOKaypXXksniwF5k
	WJRtnWXqqg0/EsC15AassJ9Wf9YuEi/t00bWIm3ccnVxKvTeu9JMeCbNMD6MdrawaNpkHHHBgg0
	6osphy1SQR0j8aWkAtc7qTbYHXq3DHQuLQzJIwtGTjEySuC1aBzFkb381/hs3qk7l+g==
X-Gm-Gg: ASbGncstP/T7b8maSz9vRkSTIubeYIgFEfn7u/5b/B2zyXoNZ5kwSBMZEXoYV4ogtjF
	zoNJ3rM/gyHaFy5d+PNkVScDlJAkc0VKEnoFXHJlPJYp+U3jupGHy/wtAJ9LlCFZIQ9LuyEAsdB
	PtDQcjnF03s/dSHQVj0KO56cs3ZsSLsYcyrb0/oR0ZLoBZHvGVRtJvQZNcc0lOFkqTGeXwG/XZ2
	Vt7kYo2bD2peBHuwrs6JTa8Aw36VvFbLXLXnhyPIMYFt5CsDh12iXV/a5J0mM41v0W68ZiFswei
	IAR2W1ZmIbS4coF+dmbOi+MXtw==
X-Received: by 2002:a05:6820:238a:b0:60b:6a75:20fa with SMTP id 006d021491bc7-61107a59ae1mr518666eaf.1.1749824179971;
        Fri, 13 Jun 2025 07:16:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlNDjXpDPxHORL4vi+7JkH6YzMJLMzE3hmQ5A+JlZVig9Fx8fisVIEPdgFb2PehmYr4p7MXQ==
X-Received: by 2002:a05:6820:238a:b0:60b:6a75:20fa with SMTP id 006d021491bc7-61107a59ae1mr518653eaf.1.1749824179480;
        Fri, 13 Jun 2025 07:16:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108d7cb51sm186420eaf.6.2025.06.13.07.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:16:17 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:16:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com
Subject: Re: [RFC v2] vfio/type1: optimize vfio_unpin_pages_remote() for
 large folio
Message-ID: <20250613081613.0bef3d39.alex.williamson@redhat.com>
In-Reply-To: <69f5e1f5-5910-4c45-9106-b362e300da8e@redhat.com>
References: <20250612163239.5e45afc6.alex.williamson@redhat.com>
	<20250613062920.68801-1-lizhe.67@bytedance.com>
	<69f5e1f5-5910-4c45-9106-b362e300da8e@redhat.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 15:37:40 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 13.06.25 08:29, lizhe.67@bytedance.com wrote:
> > On Thu, 12 Jun 2025 16:32:39 -0600, alex.williamson@redhat.com wrote:
> >   
> >>>   drivers/vfio/vfio_iommu_type1.c | 53 +++++++++++++++++++++++++--------
> >>>   1 file changed, 41 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>> index 28ee4b8d39ae..2f6c0074d7b3 100644
> >>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>> @@ -469,17 +469,28 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
> >>>   	return true;
> >>>   }
> >>>   
> >>> -static int put_pfn(unsigned long pfn, int prot)
> >>> +static inline void _put_pfns(struct page *page, int npages, int prot)
> >>>   {
> >>> -	if (!is_invalid_reserved_pfn(pfn)) {
> >>> -		struct page *page = pfn_to_page(pfn);
> >>> +	unpin_user_page_range_dirty_lock(page, npages, prot & IOMMU_WRITE);
> >>> +}
> >>>   
> >>> -		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
> >>> -		return 1;
> >>> +/*
> >>> + * The caller must ensure that these npages PFNs belong to the same folio.
> >>> + */
> >>> +static inline int put_pfns(unsigned long pfn, int npages, int prot)
> >>> +{
> >>> +	if (!is_invalid_reserved_pfn(pfn)) {
> >>> +		_put_pfns(pfn_to_page(pfn), npages, prot);
> >>> +		return npages;
> >>>   	}
> >>>   	return 0;
> >>>   }
> >>>   
> >>> +static inline int put_pfn(unsigned long pfn, int prot)
> >>> +{
> >>> +	return put_pfns(pfn, 1, prot);
> >>> +}
> >>> +
> >>>   #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
> >>>   
> >>>   static void __vfio_batch_init(struct vfio_batch *batch, bool single)
> >>> @@ -805,15 +816,33 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> >>>   				    unsigned long pfn, unsigned long npage,
> >>>   				    bool do_accounting)
> >>>   {
> >>> -	long unlocked = 0, locked = 0;
> >>> -	long i;
> >>> +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> >>>   
> >>> -	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
> >>> -		if (put_pfn(pfn++, dma->prot)) {
> >>> -			unlocked++;
> >>> -			if (vfio_find_vpfn(dma, iova))
> >>> -				locked++;
> >>> +	while (npage) {
> >>> +		struct folio *folio;
> >>> +		struct page *page;
> >>> +		long step = 1;
> >>> +
> >>> +		if (is_invalid_reserved_pfn(pfn))
> >>> +			goto next;
> >>> +
> >>> +		page = pfn_to_page(pfn);
> >>> +		folio = page_folio(page);
> >>> +
> >>> +		if (!folio_test_large(folio)) {
> >>> +			_put_pfns(page, 1, dma->prot);
> >>> +		} else {
> >>> +			step = min_t(long, npage,
> >>> +				folio_nr_pages(folio) -
> >>> +				folio_page_idx(folio, page));
> >>> +			_put_pfns(page, step, dma->prot);
> >>>   		}
> >>> +
> >>> +		unlocked += step;
> >>> +next:  
> >>
> >> Usage of @step is inconsistent, goto isn't really necessary either, how
> >> about:
> >>
> >> 	while (npage) {
> >> 		unsigned long step = 1;
> >>
> >> 		if (!is_invalid_reserved_pfn(pfn)) {
> >> 			struct page *page = pfn_to_page(pfn);
> >> 			struct folio *folio = page_folio(page);
> >> 			long nr_pages = folio_nr_pages(folio);
> >>
> >> 			if (nr_pages > 1)
> >> 				step = min_t(long, npage,
> >> 					nr_pages -
> >> 					folio_page_idx(folio, page));
> >>
> >> 			_put_pfns(page, step, dma->prot);
> >> 			unlocked += step;
> >> 		}
> >>  
> > 
> > That's great. This implementation is much better.
> > 
> > I'm a bit uncertain about the best type to use for the 'step'
> > variable here. I've been trying to keep things consistent with the
> > put_pfn() function, so I set the type of the second parameter in
> > _put_pfns() to 'int'(we pass 'step' as the second argument to
> > _put_pfns()).
> > 
> > Using unsigned long for 'step' should definitely work here, as the
> > number of pages in a large folio currently falls within the range
> > that can be represented by an int. However, there is still a
> > potential risk of truncation that we need to be mindful of.
> >   
> >>> +		pfn += step;
> >>> +		iova += PAGE_SIZE * step;
> >>> +		npage -= step;
> >>>   	}
> >>>   
> >>>   	if (do_accounting)  
> >>
> >> AIUI, the idea is that we know we have npage contiguous pfns and we
> >> currently test invalid/reserved, call pfn_to_page(), call
> >> unpin_user_pages_dirty_lock(), and test vpfn for each individually.
> >>
> >> This instead wants to batch the vpfn accounted pfns using the range
> >> helper added for the mapping patch,  
> > 
> > Yes. We use vpfn_pages() just to track the locked pages.
> >   
> >> infer that continuous pfns have the
> >> same invalid/reserved state, the pages are sequential, and that we can
> >> use the end of the folio to mark any inflections in those assumptions
> >> otherwise.  Do I have that correct?  
> > 
> > Yes. I think we're definitely on the same page here.
> >   
> >> I think this could be split into two patches, one simply batching the
> >> vpfn accounting and the next introducing the folio dependency.  The
> >> contributions of each to the overall performance improvement would be
> >> interesting.  
> > 
> > I've made an initial attempt, and here are the two patches after
> > splitting them up.
> > 
> > 1. batch-vpfn-accounting-patch:
> > 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index 28ee4b8d39ae..c8ddcee5aa68 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -805,16 +805,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> >   				    unsigned long pfn, unsigned long npage,
> >   				    bool do_accounting)
> >   {
> > -	long unlocked = 0, locked = 0;
> > +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> >   	long i;
> >   
> > -	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
> > -		if (put_pfn(pfn++, dma->prot)) {
> > +	for (i = 0; i < npage; i++, iova += PAGE_SIZE)
> > +		if (put_pfn(pfn++, dma->prot))
> >   			unlocked++;
> > -			if (vfio_find_vpfn(dma, iova))
> > -				locked++;
> > -		}
> > -	}
> >   
> >   	if (do_accounting)
> >   		vfio_lock_acct(dma, locked - unlocked, true);
> > -----------------
> > 
> > 2. large-folio-optimization-patch:
> > 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index c8ddcee5aa68..48c2ba4ba4eb 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -469,17 +469,28 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
> >   	return true;
> >   }
> >   
> > -static int put_pfn(unsigned long pfn, int prot)
> > +static inline void _put_pfns(struct page *page, int npages, int prot)
> >   {
> > -	if (!is_invalid_reserved_pfn(pfn)) {
> > -		struct page *page = pfn_to_page(pfn);
> > +	unpin_user_page_range_dirty_lock(page, npages, prot & IOMMU_WRITE);
> > +}
> >   
> > -		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
> > -		return 1;
> > +/*
> > + * The caller must ensure that these npages PFNs belong to the same folio.
> > + */
> > +static inline int put_pfns(unsigned long pfn, int npages, int prot)
> > +{
> > +	if (!is_invalid_reserved_pfn(pfn)) {
> > +		_put_pfns(pfn_to_page(pfn), npages, prot);
> > +		return npages;
> >   	}
> >   	return 0;
> >   }
> >   
> > +static inline int put_pfn(unsigned long pfn, int prot)
> > +{
> > +	return put_pfns(pfn, 1, prot);
> > +}
> > +
> >   #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
> >   
> >   static void __vfio_batch_init(struct vfio_batch *batch, bool single)
> > @@ -806,11 +817,28 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> >   				    bool do_accounting)
> >   {
> >   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> > -	long i;
> >   
> > -	for (i = 0; i < npage; i++, iova += PAGE_SIZE)
> > -		if (put_pfn(pfn++, dma->prot))
> > -			unlocked++;
> > +	while (npage) {
> > +		long step = 1;
> > +
> > +		if (!is_invalid_reserved_pfn(pfn)) {
> > +			struct page *page = pfn_to_page(pfn);
> > +			struct folio *folio = page_folio(page);
> > +			long nr_pages = folio_nr_pages(folio);
> > +
> > +			if (nr_pages > 1)
> > +				step = min_t(long, npage,
> > +					nr_pages -
> > +					folio_page_idx(folio, page));
> > +
> > +			_put_pfns(page, step, dma->prot);  
> 
> I'm confused, why do we batch pages by looking at the folio, to then 
> pass the pages into unpin_user_page_range_dirty_lock?
> 
> Why does the folio relationship matter at all here?
> 
> Aren't we making the same mistake that we are jumping over pages we 
> shouldn't be jumping over, because we assume they belong to that folio?

That's my concern as well.  On the mapping side we had an array of
pages from gup and we tested each page in the gup array relative to the
folio pages.  I think that's because the gup array could have
non-sequential pages, but aiui the folio should have sequential
pages(?).  Here I think we're trying to assume that sequential pfns
results in sequential pages and folios should have sequential pages, so
the folio just gives us a point to look for changes in invalid/reserved.

Is that valid?  Thanks,

Alex

