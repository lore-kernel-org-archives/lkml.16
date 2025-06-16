Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE582E4240
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075644; cv=none; b=g8b7Pzisf4IQiJSmfLG9u07BOGIzfITm2myKHyaClB60EPAGXz8rKvQEqI0CSjpn5PiO1fiRPF78JtOW4MQbNCp/9psnj3HYzJuF8aKCKgRp7PjdyyjGuaK8uh/oW/jA5PAJ6KlnsZJcip0LurtcPWf63/qOpYlrVB2k3nqvJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075644; c=relaxed/simple;
	bh=jNlCkRXjRY3Bl+tK3pgG6V7kMO5jS9r7uxY6qRXJPto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7elCwy8uQriF7nr8YWaOUPGuTLD9iIJXSbu8MdxX/NFtMYso/v9qH/LVy8Ho3F2ym9IZfnVzw7UWJUdOHcAzgbzSOU+fq0X6OOCSe2vX9SBvDghlLSRtSWTy/sVsE9FUKjwG6Jgq6ZxJKHh3OkexzE4zi0Df6JbsSFCpYXxXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AhmjeuvA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AhmjeuvA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234d366e5f2so55559565ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750075641; x=1750680441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxuuo/qfgrhmPQ0t/hAmkZEHSbbtN0whe6oJrPLEQX4=;
        b=AhmjeuvAtsUSUD7mlbvBJaVa13Fz+m6jRVzrVehBYRVAsQaLXeNgkTYpVDeeIF9lwj
         Ok+mFuVoE5Ft9umYnmQ/yhC+CBBqsKcrLAZ/hJJaBnXEgYJlY13wuMKEDHCQJt9TWpb7
         N2L0nHM3H3RrXi2pTG+sEAEzuRWxEvXw2Bp1Fq3jYUgCiwJFbhbqlJAcEeimcppmbsJs
         vMzcVxDgjq8vQ23VYNt2bFfRxDSLJwC1y65RaQ1AuK61DDP7y3ScNNOCdwCT2KUSr0K6
         Swv2I0fXthC9lO+emOR0+TeModWoJOlCIBIOaephk/oQn6VO3IrK3mS6cXVpVzXM6bfi
         Yl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750075641; x=1750680441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxuuo/qfgrhmPQ0t/hAmkZEHSbbtN0whe6oJrPLEQX4=;
        b=l3/q/dSmT+WTtm9/KKnZkIz9UNcKOsNYPWQcnjAyrnKQ9FdHJwLHw0oXs0+OmCwdS4
         lrrCEMN31I8a8xlvzx/K7FC0qAT/A7/JkpM/VI1vS4KhDWpJXJ+dMhvxD8TVOLY0z0/4
         O9WKqnr8vYlRyM22jrPcmxqtwJiIvbzddA9c9Bs6lRqyzaPa8jv2fyXCNt/eECe7vfSV
         7VnbsJmAGN2uV5lCK5N/WU66b+uQrCIwIlKz/PNttMZ482EfBDvexh8fDuB/dym4/T3v
         9RGPEqgVUA1jsg0Ef39iOPxUPUXCZYVIhax2ucpS4Cbd4pgJYl7p8mORpA595MU11EmD
         6v8A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+oKecJ0xjsG7orgquo9q6Tqa6dWpsliofGK7jxIadSeA0dkxbHZhGKRfbB8yaka29F+chtKOAESyTO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQZ9eeO6zJl+QkG0jxPcgVZfLn35VRifE/a4I75krXkfgbT9L
	rCGtNR0MgfaJA3iD0BoWSSu6wQ8zGiKzWBL2sOv8SCHWwclSheKsYpRzOddJnCAWios=
X-Gm-Gg: ASbGncuspIc1GwqQNqgXfgWfTS/tPhyAjiCoQqO9o5nSDB/EecaZCh5KnF0vyVyvqMf
	IRQ+inn+GYOW7c0Ff7G/t2kZAyZ7BRn9oBaR70SiQtMRL9MGD86R5WO1uDcbu9vV9NredTZKtHm
	2OAMhDkVauvU8EPsKuwjJXjuza3CdIDhdUylR9IV38D6hXpLcTuTcGnSkl39Xx2CC2JHhlz7W9U
	KjLfuZA4+OoWt/Z9bYCvgBYWy6KCDkMwEbu2EM28W9h3CBoYWRpRVNTS4TjNs23wnZCVnMQ1J0L
	qpwRy0waBR2A5gmxcrS6PZqjECDi8S5dwQxaYpc64/IzVdZAWIKvBkIMrc7/bNSP2NGCCSlteEI
	Fc/2Br+98noty
X-Google-Smtp-Source: AGHT+IH88+OLHvzx5WeFSL/EMKRPuhcV8i+Bn2LZzyPP5AxYcGanjzyXse+8iIxqwAkjniuVNXbTJA==
X-Received: by 2002:a17:903:1905:b0:235:668:fb00 with SMTP id d9443c01a7336-2366b3df79emr143127135ad.46.1750075641098;
        Mon, 16 Jun 2025 05:07:21 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bef8sm59811675ad.30.2025.06.16.05.07.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 05:07:20 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com,
	alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v3 2/2] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Mon, 16 Jun 2025 20:07:15 +0800
Message-ID: <20250616120715.12445-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8483b457-6044-4174-9190-161f29f2cda5@redhat.com>
References: <8483b457-6044-4174-9190-161f29f2cda5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, 16 Jun 2025 13:18:58 +0200, david@redhat.com wrote:
> 
> On 16.06.25 13:13, lizhe.67@bytedance.com wrote:
> > On Mon, 16 Jun 2025 10:14:23 +0200, david@redhat.com wrote:
> > 
> >>>    drivers/vfio/vfio_iommu_type1.c | 55 +++++++++++++++++++++++++++------
> >>>    1 file changed, 46 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>> index e952bf8bdfab..09ecc546ece8 100644
> >>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>> @@ -469,17 +469,28 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
> >>>    	return true;
> >>>    }
> >>>    
> >>> -static int put_pfn(unsigned long pfn, int prot)
> >>> +static inline void _put_pfns(struct page *page, int npages, int prot)
> >>>    {
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
> >>>    	}
> >>>    	return 0;
> >>>    }
> >>>    
> >>> +static inline int put_pfn(unsigned long pfn, int prot)
> >>> +{
> >>> +	return put_pfns(pfn, 1, prot);
> >>> +}
> >>> +
> >>>    #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
> >>>    
> >>>    static void __vfio_batch_init(struct vfio_batch *batch, bool single)
> >>> @@ -806,11 +817,37 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> >>>    				    bool do_accounting)
> >>>    {
> >>>    	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> >>> -	long i;
> >>>    
> >>> -	for (i = 0; i < npage; i++)
> >>> -		if (put_pfn(pfn++, dma->prot))
> >>> -			unlocked++;
> >>> +	while (npage) {
> >>> +		long nr_pages = 1;
> >>> +
> >>> +		if (!is_invalid_reserved_pfn(pfn)) {
> >>> +			struct page *page = pfn_to_page(pfn);
> >>> +			struct folio *folio = page_folio(page);
> >>> +			long folio_pages_num = folio_nr_pages(folio);
> >>> +
> >>> +			/*
> >>> +			 * For a folio, it represents a physically
> >>> +			 * contiguous set of bytes, and all of its pages
> >>> +			 * share the same invalid/reserved state.
> >>> +			 *
> >>> +			 * Here, our PFNs are contiguous. Therefore, if we
> >>> +			 * detect that the current PFN belongs to a large
> >>> +			 * folio, we can batch the operations for the next
> >>> +			 * nr_pages PFNs.
> >>> +			 */
> >>> +			if (folio_pages_num > 1)
> >>> +				nr_pages = min_t(long, npage,
> >>> +					folio_pages_num -
> >>> +					folio_page_idx(folio, page));
> >>> +
> >>> +			_put_pfns(page, nr_pages, dma->prot);
> >>
> >>
> >> This is sneaky. You interpret the page pointer a an actual page array,
> >> assuming that it would give you the right values when advancing nr_pages
> >> in that array.
> >>
> >> This is mostly true, but with !CONFIG_SPARSEMEM_VMEMMAP it is not
> >> universally true for very large folios (e.g., in a 1 GiB hugetlb folio
> >> when we cross the 128 MiB mark on x86).
> >>
> >> Not sure if that could already trigger here, but it is subtle.
> > 
> > As previously mentioned in the email, the code here functions
> > correctly.
> > 
> >>> +			unlocked += nr_pages;
> >>
> >> We could do slightly better here, as we already have the folio. We would
> >> add a unpin_user_folio_dirty_locked() similar to unpin_user_folio().
> >>
> >> Instead of _put_pfns, we would be calling
> >>
> >> unpin_user_folio_dirty_locked(folio, nr_pages, dma->prot & IOMMU_WRITE);
> > 
> > Thank you so much for your suggestion. Does this implementation of
> > unpin_user_folio_dirty_locked() look viable to you?
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index fdda6b16263b..567c9dae9088 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -1689,6 +1689,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
> >   				      bool make_dirty);
> >   void unpin_user_pages(struct page **pages, unsigned long npages);
> >   void unpin_user_folio(struct folio *folio, unsigned long npages);
> > +void unpin_user_folio_dirty_locked(struct folio *folio,
> > +		unsigned long npages, bool make_dirty);
> >   void unpin_folios(struct folio **folios, unsigned long nfolios);
> >   
> >   static inline bool is_cow_mapping(vm_flags_t flags)
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 84461d384ae2..2f1e14a79463 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -360,11 +360,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
> >   
> >   	for (i = 0; i < npages; i += nr) {
> >   		folio = gup_folio_range_next(page, npages, i, &nr);
> > -		if (make_dirty && !folio_test_dirty(folio)) {
> > -			folio_lock(folio);
> > -			folio_mark_dirty(folio);
> > -			folio_unlock(folio);
> > -		}
> > +		if (make_dirty && !folio_test_dirty(folio))
> > +			folio_mark_dirty_lock(folio);
> >   		gup_put_folio(folio, nr, FOLL_PIN);
> 
> We can call unpin_user_folio_dirty_locked(). :)
> 
> >   	}
> >   }
> > @@ -435,6 +432,26 @@ void unpin_user_folio(struct folio *folio, unsigned long npages)
> >   }
> >   EXPORT_SYMBOL(unpin_user_folio);
> >   
> > +/**
> > + * unpin_user_folio_dirty_locked() - release pages of a folio and
> > + * optionally dirty
> 
> "conditionally mark a folio dirty and unpin it"
> 
> Because that's the sequence in which it is done.
> 
> > + *
> > + * @folio:  pointer to folio to be released
> > + * @npages: number of pages of same folio
> 
> Can we change that to "nrefs" or rather "npins"?
> 
> > + * @make_dirty: whether to mark the folio dirty
> > + *
> > + * Mark the folio as being modified if @make_dirty is true. Then
> > + * release npages of the folio.
> 
> Similarly, adjust the doc here.
> 
> > + */
> > +void unpin_user_folio_dirty_locked(struct folio *folio,
> > +		unsigned long npages, bool make_dirty)
> > +{
> > +	if (make_dirty && !folio_test_dirty(folio))
> > +		folio_mark_dirty_lock(folio);
> > +	gup_put_folio(folio, npages, FOLL_PIN);
> > +}
> > +EXPORT_SYMBOL(unpin_user_folio_dirty_locked);
> 
> Yes, should probably go into a separate cleanup patch.

Thank you very much for your suggestions. The revised implementation
is as follows.

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fdda6b16263b..567c9dae9088 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1689,6 +1689,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 				      bool make_dirty);
 void unpin_user_pages(struct page **pages, unsigned long npages);
 void unpin_user_folio(struct folio *folio, unsigned long npages);
+void unpin_user_folio_dirty_locked(struct folio *folio,
+		unsigned long npages, bool make_dirty);
 void unpin_folios(struct folio **folios, unsigned long nfolios);
 
 static inline bool is_cow_mapping(vm_flags_t flags)
diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..3d25b2dcbe85 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -360,12 +360,7 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
-		if (make_dirty && !folio_test_dirty(folio)) {
-			folio_lock(folio);
-			folio_mark_dirty(folio);
-			folio_unlock(folio);
-		}
-		gup_put_folio(folio, nr, FOLL_PIN);
+		unpin_user_folio_dirty_locked(folio, nr, make_dirty);
 	}
 }
 EXPORT_SYMBOL(unpin_user_page_range_dirty_lock);
@@ -435,6 +430,26 @@ void unpin_user_folio(struct folio *folio, unsigned long npages)
 }
 EXPORT_SYMBOL(unpin_user_folio);
 
+/**
+ * unpin_user_folio_dirty_locked() - conditionally mark a folio
+ * dirty and unpin it
+ *
+ * @folio:  pointer to folio to be released
+ * @nrefs:  number of pages of same folio
+ * @make_dirty: whether to mark the folio dirty
+ *
+ * Mark the folio as being modified if @make_dirty is true. Then
+ * release nrefs of the folio.
+ */
+void unpin_user_folio_dirty_locked(struct folio *folio,
+		unsigned long nrefs, bool make_dirty)
+{
+	if (make_dirty && !folio_test_dirty(folio))
+		folio_mark_dirty_lock(folio);
+	gup_put_folio(folio, nrefs, FOLL_PIN);
+}
+EXPORT_SYMBOL(unpin_user_folio_dirty_locked);
+
 /**
  * unpin_folios() - release an array of gup-pinned folios.
  * @folios:  array of folios to be marked dirty and released.

--

Hi David, Alex, if there are no further issues, I will include this
patch as the second separate patch in the v4 version, inserting it
between the existing two patches. Thank you for your review!

Thanks,
Zhe
