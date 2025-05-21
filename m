Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB47622D7AA
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846523; cv=none; b=YpXZahRiKL0CMzLAuyXQR1fi9wU++3BhELoL4lH7KEkpg1ER2aZEWhfie7zosHJj4Tei5VNn80T13fapHFmzJiYmms/L+TyNVkX+vQVMWROrqXYDyF+AvkEDmfSisTcvRO9f8shCzalbqxSzYpfH0TUssB9ypo/4kQMVR5XDnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846523; c=relaxed/simple;
	bh=a9+yZRUlPcE91FSdeZCetP2JpzO5DO/CwagpOD7IPR4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDK/9dDM40TZTTmrASvY4HH1gLsolna0T6SjukI0SOHiZEh4buXghydtHLEkGrxhCCrsS7aGNhunmkbs9y81cSYIqYfppEDZQAsaqaN02ZF4T/fTWSnn+/cHfRsMDlDBkavo9WfJIVytPcseKZr8kxG04jht/3T1WTjYBWj0FUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CgrRDEm8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CgrRDEm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747846519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JI7GlB8avqfxSq7aqjAIWqQ62KVafx4vq+laogUBGIU=;
	b=CgrRDEm8ZEmd9MtoetC9fhv9/TZZAjv7TzHP/Pjhr/rXA77Djjtdlw2s/ZbUJmSxURAJ70
	bnes5DX4B/pQu6zxWlez/gBwGK5AGoKbJKgIBPoNH/ORKkSnAqPdd3Xe1+WjZeZZ+oxmlI
	B/dBzd8105zv2/ZadjGgnHfcv/vGt0M=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-kG9YqAFWPZ2rj9sdXrQ8Sg-1; Wed, 21 May 2025 12:55:18 -0400
X-MC-Unique: kG9YqAFWPZ2rj9sdXrQ8Sg-1
X-Mimecast-MFC-AGG-ID: kG9YqAFWPZ2rj9sdXrQ8Sg_1747846517
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2c233ba182cso1531005fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846517; x=1748451317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JI7GlB8avqfxSq7aqjAIWqQ62KVafx4vq+laogUBGIU=;
        b=KSv/4u04I0mzxI4XhZ0jrJxBnWGXUjMT1bN7UnMXNRblNwEaRMB44x5iymTzLhNLq0
         B32VEgmeKsLb/5YENSzwpSo3D1lilqDhDulI0/AtLVNlsJc1kAf7MU1u4gCOYVMP0QdC
         Ncc+Ta4GJPVsXGqNUWXGUk7jABmp2ENds0fvKxX705lMlBxJ5n3w1XcMjTgXAK4up9e7
         b1lKmyi3U0tOlGcPOyCKHeyUyg7sGI/+th7hUI7KNaoDifDwja/+PXmmyrTCSOLElkth
         Vqx1EcCQh4cc87dHv+iCLq0de57jY3Y6xeDlaoohbAnliROzTtV1hTpifx9RnWaitbK5
         ZuIw==
X-Forwarded-Encrypted: i=1; AJvYcCVesH+jifCnUx29/6dh0RFV7L5jwJ86G4bM5IPqV+a9204jTzm8wCUIWHI29+OIzkJRNqqKpGox+x5oDM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRAZT9qIV6nrv0xOKTwb3JRN57xnAek6EpBxBRo9SkAI1LZyZq
	qIvvQqQisyjXlawAyshrLno8dU9HP88XhBegT8i2Sdln2Esv3pYt8VnsVY05+BnlrTy78M4oZ/e
	rPcck3g231jqB+XUg0J7OUkLu+fw6TRPcKUevaFKBIH2fJaoCugXScX4Yfh/imJBOcly5IKDWrw
	==
X-Gm-Gg: ASbGncsXVNuL7qDuGEXoyCKBm53YgOhhBrBouaUifO5w70StTU1NYic9qseeFn/4N0M
	aFTtDQytDdpYPL9W4j8waX6yN7st+pHGJfwTPA9wMEvFuNM+MVcPYIQPW1L1mcy1+JEZfMrVDzN
	pbcOYOrMd/2EPSPlgw8aF0eOWM+DtFvBvxwH4D9rAZC6IvltfbKj2j2V7Oz/+xieX1CKcHdX2/S
	lBmtv3bA2m5JRQLe6B80dYcvX9kYiLc+7b/Ai/JGTwqWvpraYJOf58vkzhVfngLvcfMtbUDzAkT
	jWd47/q+tVKVqWo=
X-Received: by 2002:a05:6871:78e:b0:2d4:ce45:6986 with SMTP id 586e51a60fabf-2e3c1c2e2cfmr3673273fac.4.1747846516611;
        Wed, 21 May 2025 09:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOi1uRBcwms/BVu7f6VJDS+H+NrLqgm88+eoihl0Va4PRldVexL/AsumYH0aXcZYK/AujS1g==
X-Received: by 2002:a05:6871:78e:b0:2d4:ce45:6986 with SMTP id 586e51a60fabf-2e3c1c2e2cfmr3673266fac.4.1747846516181;
        Wed, 21 May 2025 09:55:16 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c060d523sm2682182fac.9.2025.05.21.09.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:55:15 -0700 (PDT)
Date: Wed, 21 May 2025 10:55:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250521105512.4d43640a.alex.williamson@redhat.com>
In-Reply-To: <ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
	<3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
	<20250520162125.772d003f.alex.williamson@redhat.com>
	<ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2025 08:35:47 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 21.05.25 00:21, Alex Williamson wrote:
> > On Tue, 20 May 2025 19:38:45 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> >   
> >> On 20.05.25 09:00, lizhe.67@bytedance.com wrote:  
> >>> From: Li Zhe <lizhe.67@bytedance.com>  
> >>
> >> Subject: "huge folio" -> "large folios"
> >>  
> >>>
> >>> When vfio_pin_pages_remote() is called with a range of addresses that
> >>> includes huge folios, the function currently performs individual  
> >>
> >> Similar, we call it a "large" f
> >>  
> >>> statistics counting operations for each page. This can lead to significant
> >>> performance overheads, especially when dealing with large ranges of pages.
> >>>
> >>> This patch optimize this process by batching the statistics counting
> >>> operations.
> >>>
> >>> The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> >>> obtained through trace-cmd, are as follows. In this case, the 8G virtual
> >>> address space has been mapped to physical memory using hugetlbfs with
> >>> pagesize=2M.
> >>>
> >>> Before this patch:
> >>> funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> >>>
> >>> After this patch:
> >>> funcgraph_entry:      # 15635.055 us |  vfio_pin_map_dma();
> >>>
> >>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> >>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> >>> ---
> >>> Changelogs:
> >>>
> >>> v2->v3:
> >>> - Code simplification.
> >>> - Fix some issues in comments.
> >>>
> >>> v1->v2:
> >>> - Fix some issues in comments and formatting.
> >>> - Consolidate vfio_find_vpfn_range() and vfio_find_vpfn().
> >>> - Move the processing logic for huge folio into the while(true) loop
> >>>     and use a variable with a default value of 1 to indicate the number
> >>>     of consecutive pages.
> >>>
> >>> v2 patch: https://lore.kernel.org/all/20250519070419.25827-1-lizhe.67@bytedance.com/
> >>> v1 patch: https://lore.kernel.org/all/20250513035730.96387-1-lizhe.67@bytedance.com/
> >>>
> >>>    drivers/vfio/vfio_iommu_type1.c | 48 +++++++++++++++++++++++++--------
> >>>    1 file changed, 37 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>> index 0ac56072af9f..48f06ce0e290 100644
> >>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>> @@ -319,15 +319,22 @@ static void vfio_dma_bitmap_free_all(struct vfio_iommu *iommu)
> >>>    /*
> >>>     * Helper Functions for host iova-pfn list
> >>>     */
> >>> -static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> >>> +
> >>> +/*
> >>> + * Find the first vfio_pfn that overlapping the range
> >>> + * [iova, iova + PAGE_SIZE * npage) in rb tree.
> >>> + */
> >>> +static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
> >>> +		dma_addr_t iova, unsigned long npage)
> >>>    {
> >>>    	struct vfio_pfn *vpfn;
> >>>    	struct rb_node *node = dma->pfn_list.rb_node;
> >>> +	dma_addr_t end_iova = iova + PAGE_SIZE * npage;
> >>>    
> >>>    	while (node) {
> >>>    		vpfn = rb_entry(node, struct vfio_pfn, node);
> >>>    
> >>> -		if (iova < vpfn->iova)
> >>> +		if (end_iova <= vpfn->iova)
> >>>    			node = node->rb_left;
> >>>    		else if (iova > vpfn->iova)
> >>>    			node = node->rb_right;
> >>> @@ -337,6 +344,11 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> >>>    	return NULL;
> >>>    }
> >>>    
> >>> +static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> >>> +{
> >>> +	return vfio_find_vpfn_range(dma, iova, 1);
> >>> +}
> >>> +
> >>>    static void vfio_link_pfn(struct vfio_dma *dma,
> >>>    			  struct vfio_pfn *new)
> >>>    {
> >>> @@ -681,32 +693,46 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> >>>    		 * and rsvd here, and therefore continues to use the batch.
> >>>    		 */
> >>>    		while (true) {
> >>> +			struct folio *folio = page_folio(batch->pages[batch->offset]);
> >>> +			long nr_pages;
> >>> +
> >>>    			if (pfn != *pfn_base + pinned ||
> >>>    			    rsvd != is_invalid_reserved_pfn(pfn))
> >>>    				goto out;
> >>>    
> >>> +			/*
> >>> +			 * Note: The current nr_pages does not achieve the optimal
> >>> +			 * performance in scenarios where folio_nr_pages() exceeds
> >>> +			 * batch->capacity. It is anticipated that future enhancements
> >>> +			 * will address this limitation.
> >>> +			 */
> >>> +			nr_pages = min((long)batch->size, folio_nr_pages(folio) -
> >>> +						folio_page_idx(folio, batch->pages[batch->offset]));
> >>> +			if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
> >>> +				nr_pages = 1;  
> >>
> >>
> >> You seem to assume that the batch really contains the consecutive pages
> >> of that folio.  
> > 
> > I don't think we are.  We're iterating through our batch of pages from
> > GUP to find consecutive pfns.  We use the page to get the pfn, the
> > folio, and immediately above, the offset into the folio.  batch->size is
> > the remaining length of the page array from GUP and batch->offset is our
> > current index into that array.  
> 
> Let me try again using an example below ....
> 
> >     
> >> This is not the case if we obtained the pages through GUP and we have
> >>
> >> (a) A MAP_PRIVATE mapping
> >>
> >> (b) We span multiple different VMAs
> >>
> >>
> >> Are we sure we can rule out (a) and (b)?
> >>
> >> A more future-proof approach would be at least looking whether the
> >> pages/pfns are actually consecutive.  
> > 
> > The unmodified (pfn != *pfn_base + pinned) test is where we verify we
> > have the next consecutive pfn.  Maybe I'm not catching the dependency
> > you're seeing on consecutive pages, I think there isn't one unless
> > we're somehow misusing folio_page_idx() to get the offset into the
> > folio.  
> 
> Assume our page tables look like this (case (a), a partially mapped 
> large pagecache folio mixed with COW'ed anonymous folios):
> 
>    + page[0] of folio 0
>    |              + COWed anonymous folio (folio 1)
>    |              |    + page[4] of folio 0
>    |              |    |
>    v              v    v
> F0P0 F0P1 F0P2 F1P0 F0P4 P0P5 F0P6 F0P7
> 
> If we GUP that range, we get exactly these pages, except that the PFNs 
> are not consecutive, because F0P3 was replaced by another page. The 
> large folio is partially mapped.

Ok, I asked the wrong question, this seemed like a good optimization,
but I think you've identified the key misunderstanding that makes it
appear that way.  Thank you.

This optimization does rely on an assumption of consecutive _pages_ in
the array returned from GUP.  If we cannot assume the next array index
is the next page from the same folio (which afaict we have no basis to
do), we cannot use the folio as the basis for any optimization.

I expect this assumption works for effectively all QEMU use cases, but
regardless, it's bogus for the general case.  I guess that using
something like memfd would provide that guarantee of the linear mapping
in user virtual address space.  Without memfd we'd need to be able to
get at the extent of the actual page table entry, like we added for
pfnmap.

> Maybe I misunderstand that code, but wouldn't we just "jump" over F1P0
> because we assume the batch would contain F1P0, where it really contains 
> F0P4?

This optimization would incorrectly assume that the GUP page array
indexes are consecutive from the same folio and it'd end up mapping
page_to_pfn(F0P3) (or really page_to_pfn(F0P0) + 3) rather than
page_to_pfn(F1P0) at that index.

Thanks for catching this!

Alex

