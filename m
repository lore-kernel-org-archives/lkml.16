Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0A21516E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779695; cv=none; b=SNn0VMYtbFlXBWqqMZZEJOz4eGsj7aSQyhWMrd7FMHQtVuZaCaA8wSMoPVC2h1UkHLjW/p679cxlM5udbAEDh3i65GK8uyKnQmpQfmplnIEgYjiSwYQ0tiGwMlGb1FmzDdQAytdrJ4ff0sZTByAix6MfnsUFlVF/Px2k5Zh4n/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779695; c=relaxed/simple;
	bh=kZwtGWY2flgcbywZ9XJ1E6J0wN65Qm3snx9fwFnDj+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1v9Lp6+6tJgALtxHzYuP9sv0oTvtkINJFZmxSCNaKE6Qt6f2tTJle/RKsKKaPs1sbAy1p1XbPCh2AdabHsf24FIKW30FkPPcqr7IQzJpta/xd3nIevJJG9rg3YJXsqGZv+9nzgjQJLqT4LZ+qV7spYDX9zaHYQgY+uKNSs8nY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO+Lm6B6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO+Lm6B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747779690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/GIayeRWHhnJsp9RrPNdmxoLKar4VzgOZkx43n7k5k=;
	b=ZO+Lm6B6eSD++lq2sJIWMKHMO2J+qXaLTsY51+4Kd+yX5HmqYVXvNjI9MiK+NICsiUMJn2
	qaBbuqSOaDVoS/yitLlZG5vX9Akby1Z2WK0RXSXRWqYDPy0rJ3xQechCYEdrdt1+PwRiC4
	TsXHJ7WRl9BgI6/ZFn99arWstvyJz6k=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-zaAi4IjYPi2251Ysf23vlA-1; Tue, 20 May 2025 18:21:29 -0400
X-MC-Unique: zaAi4IjYPi2251Ysf23vlA-1
X-Mimecast-MFC-AGG-ID: zaAi4IjYPi2251Ysf23vlA_1747779689
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d93736c9b4so5286625ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779688; x=1748384488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/GIayeRWHhnJsp9RrPNdmxoLKar4VzgOZkx43n7k5k=;
        b=YtGxkZmVnkf1I73w3srkZ3uIREhjCxWZHc9N8mrzC0+JIneciMVypYw+xt71hocR/C
         dj2Am5xh6EwHKO5jzPhO+r0MpSKw4CeYm8OLQLKd4jlpOaMXsZ711TaSG6a3Ez7g3+gq
         U4K0crG4K5X2FwYjG/ufYf/1hjnmRxI1qBPi9VOIk/udt/NjAjdpV0bPRTFJg9FrVLWc
         PuYUBBKCq7yhJm+KHvt4NLmNiCL5sDRs1AV0ifl/ALzWfNnzyn3zxw3BMQfgH9Sg+Qhg
         ofeH0Liyi+z+zCC0VXRc3R5u1yWK5fnL+RRvjWTj6PoMhD41GryZMAcCuKnkVXH+C1zJ
         KDHw==
X-Forwarded-Encrypted: i=1; AJvYcCX55W7QdRBNfWtEOHpuNPr66/8hrjs5Mc8+11B3QBzjOGpVK9ctRC44V50Z50/VbASQphYkmdORepMt9YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLw5Ed5z/x1rKRJvHeyet+yVbjPs6JECrek8xGvDbd2m0FICar
	RKactQiAP10HqRAdZEpRlxdTRs/u9jtg4AO9RyO+hN+4n1EgVFb8OSRxRLsyuUdzmaHbfkoE2O6
	2F/4YFsTs65bImh/BttGDG0wvZt+WANMRS7lAws1g8zt/WGbCVND4Puz4on//dsMc8A==
X-Gm-Gg: ASbGncutWWsStyWmQPE6wr0cbKodGyIcsPdtkSTr5Z+xbD2B7G8tdUo+iVant8znEyV
	zuujQLoVK40r1eT7usWoVgSRhCfe11Tq34NI+OR3qecr7flpwnHBYdOAHyngsL07bkaq1NcHBPb
	IlzGw6coTHGDGjm0PhmnhLKFGHCIatZixpxLAk5Jx1/Rw+APEajkkyMTsaRdWwtXC/QlZ0nXJIo
	7ewfmtspxmF3PxpbrsD07yPy5X1t6eGVHHgWFpcvckY1whSAnnxQztMkV7M9rjAou4+giquwDgq
	fvqFfo4tSLZpNZI=
X-Received: by 2002:a05:6602:2b8a:b0:855:9e01:9acf with SMTP id ca18e2360f4ac-86a2316d8a8mr584886939f.1.1747779688573;
        Tue, 20 May 2025 15:21:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcCiwdgbQRI1IjD0iiclGvv1BY8EoLQQNunqFAtSi6j9W5+zDP8eWNF+j2krOUp9DDbLPzrQ==
X-Received: by 2002:a05:6602:2b8a:b0:855:9e01:9acf with SMTP id ca18e2360f4ac-86a2316d8a8mr584886439f.1.1747779688148;
        Tue, 20 May 2025 15:21:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4af7dcsm2366546173.107.2025.05.20.15.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:21:26 -0700 (PDT)
Date: Tue, 20 May 2025 16:21:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250520162125.772d003f.alex.williamson@redhat.com>
In-Reply-To: <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
	<3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 19:38:45 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 20.05.25 09:00, lizhe.67@bytedance.com wrote:
> > From: Li Zhe <lizhe.67@bytedance.com>  
> 
> Subject: "huge folio" -> "large folios"
> 
> > 
> > When vfio_pin_pages_remote() is called with a range of addresses that
> > includes huge folios, the function currently performs individual  
> 
> Similar, we call it a "large" f
> 
> > statistics counting operations for each page. This can lead to significant
> > performance overheads, especially when dealing with large ranges of pages.
> > 
> > This patch optimize this process by batching the statistics counting
> > operations.
> > 
> > The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> > obtained through trace-cmd, are as follows. In this case, the 8G virtual
> > address space has been mapped to physical memory using hugetlbfs with
> > pagesize=2M.
> > 
> > Before this patch:
> > funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> > 
> > After this patch:
> > funcgraph_entry:      # 15635.055 us |  vfio_pin_map_dma();
> > 
> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > ---
> > Changelogs:
> > 
> > v2->v3:
> > - Code simplification.
> > - Fix some issues in comments.
> > 
> > v1->v2:
> > - Fix some issues in comments and formatting.
> > - Consolidate vfio_find_vpfn_range() and vfio_find_vpfn().
> > - Move the processing logic for huge folio into the while(true) loop
> >    and use a variable with a default value of 1 to indicate the number
> >    of consecutive pages.
> > 
> > v2 patch: https://lore.kernel.org/all/20250519070419.25827-1-lizhe.67@bytedance.com/
> > v1 patch: https://lore.kernel.org/all/20250513035730.96387-1-lizhe.67@bytedance.com/
> > 
> >   drivers/vfio/vfio_iommu_type1.c | 48 +++++++++++++++++++++++++--------
> >   1 file changed, 37 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index 0ac56072af9f..48f06ce0e290 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -319,15 +319,22 @@ static void vfio_dma_bitmap_free_all(struct vfio_iommu *iommu)
> >   /*
> >    * Helper Functions for host iova-pfn list
> >    */
> > -static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> > +
> > +/*
> > + * Find the first vfio_pfn that overlapping the range
> > + * [iova, iova + PAGE_SIZE * npage) in rb tree.
> > + */
> > +static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
> > +		dma_addr_t iova, unsigned long npage)
> >   {
> >   	struct vfio_pfn *vpfn;
> >   	struct rb_node *node = dma->pfn_list.rb_node;
> > +	dma_addr_t end_iova = iova + PAGE_SIZE * npage;
> >   
> >   	while (node) {
> >   		vpfn = rb_entry(node, struct vfio_pfn, node);
> >   
> > -		if (iova < vpfn->iova)
> > +		if (end_iova <= vpfn->iova)
> >   			node = node->rb_left;
> >   		else if (iova > vpfn->iova)
> >   			node = node->rb_right;
> > @@ -337,6 +344,11 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> >   	return NULL;
> >   }
> >   
> > +static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> > +{
> > +	return vfio_find_vpfn_range(dma, iova, 1);
> > +}
> > +
> >   static void vfio_link_pfn(struct vfio_dma *dma,
> >   			  struct vfio_pfn *new)
> >   {
> > @@ -681,32 +693,46 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> >   		 * and rsvd here, and therefore continues to use the batch.
> >   		 */
> >   		while (true) {
> > +			struct folio *folio = page_folio(batch->pages[batch->offset]);
> > +			long nr_pages;
> > +
> >   			if (pfn != *pfn_base + pinned ||
> >   			    rsvd != is_invalid_reserved_pfn(pfn))
> >   				goto out;
> >   
> > +			/*
> > +			 * Note: The current nr_pages does not achieve the optimal
> > +			 * performance in scenarios where folio_nr_pages() exceeds
> > +			 * batch->capacity. It is anticipated that future enhancements
> > +			 * will address this limitation.
> > +			 */
> > +			nr_pages = min((long)batch->size, folio_nr_pages(folio) -
> > +						folio_page_idx(folio, batch->pages[batch->offset]));
> > +			if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
> > +				nr_pages = 1;  
> 
> 
> You seem to assume that the batch really contains the consecutive pages 
> of that folio.

I don't think we are.  We're iterating through our batch of pages from
GUP to find consecutive pfns.  We use the page to get the pfn, the
folio, and immediately above, the offset into the folio.  batch->size is
the remaining length of the page array from GUP and batch->offset is our
current index into that array.
 
> This is not the case if we obtained the pages through GUP and we have
> 
> (a) A MAP_PRIVATE mapping
> 
> (b) We span multiple different VMAs
> 
> 
> Are we sure we can rule out (a) and (b)?
> 
> A more future-proof approach would be at least looking whether the 
> pages/pfns are actually consecutive.

The unmodified (pfn != *pfn_base + pinned) test is where we verify we
have the next consecutive pfn.  Maybe I'm not catching the dependency
you're seeing on consecutive pages, I think there isn't one unless
we're somehow misusing folio_page_idx() to get the offset into the
folio.  Thanks,

Alex

