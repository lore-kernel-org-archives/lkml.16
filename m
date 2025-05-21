Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA01F8EFF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842061; cv=none; b=EGGCL63YntouKmH/f/+i0LJMK/hik5DTWB5QiCIYV01ZhCdwZNcNr/9p4NaEtgi6C6PMa4Y23gBvzQCYDn7BMo+8Ju8vRrhoIJShQJvZKP/NCh+Ae2NeAwr2wWQn1BtOCZbyvokCRiYXvYTy+sQ/q+zI4/5MjKIyuIyZ8pNuoGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842061; c=relaxed/simple;
	bh=x2UpAPG5W0IaNg6NUiNTzQrRTClAfJi/ienNx+wMne8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAFv8ij2GmNZs8WjwHJJWGnbgWI/F/3eD3wiLeaVrIV0BcWSJNFuPj8URQGujHlHhfv4r4M2ypa6Qk+WVFoutUebYpTpyNp2n4SKli/f53IVXPd0CfduYKSSk+JmRORHgbcsPNpfJuODSb6ArFsTR5dfZWb9BOjtXvhCRdzzMrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNt7Qqq4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNt7Qqq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747842057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6tqHSpRIfPfnEvmoItAnA0UzMEcUJBUk+JNOniEKUyA=;
	b=aNt7Qqq4XyHvOTXBlMK+JLAuWuwAJkKNdLLoSPbYXMlFb6xr7frxd+n6Gfkseb+wqitf+s
	EAA2q+j1YNsC6qDuWzpc7kJwyx4V0a9RvKsZ/YjInNv1qStrD76f87Na3tR430FP1F5Rjv
	4ce5nj/QWYu5cDdCXn3ExmscNG9qHZU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-lcwCnT0SPQ6qTbqaeyvLlQ-1; Wed, 21 May 2025 11:40:56 -0400
X-MC-Unique: lcwCnT0SPQ6qTbqaeyvLlQ-1
X-Mimecast-MFC-AGG-ID: lcwCnT0SPQ6qTbqaeyvLlQ_1747842056
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so1021469585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842056; x=1748446856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tqHSpRIfPfnEvmoItAnA0UzMEcUJBUk+JNOniEKUyA=;
        b=Zk7AMP+NH+mIphoWTxaDsFYVbcPJifZpEyUFNICpRtG4pzyDkxjdfLhGAtjgi/f0T1
         F3XxSehImPRGdiUsQPoHolTqbk6jAFqfHR9FCw7jjEzTkuvxK1F/MCG39zVZqW5TDoDD
         IxIl+l74Xfz8i9S9JSP7xEzybsXrwC0UzqXyRM5RtotMp1bjLJUFdAuXkVJyub78Hv5Z
         GCMZBnupswhlyDZONoFkJVqg3iIuY2vOyeLO0I9iX5/ltF/CKS/edK/6MJn6oPPwEcUC
         eQ1FbdIHCBH8msITWZw0WrhIMc2/uKgZpeUQw8FZLBaZFQ56AqYQ3wYDQxFDqyvvnu0T
         APvg==
X-Forwarded-Encrypted: i=1; AJvYcCW2uvVQBiBFcoHsFXckWrhD5qtvWwFsxjagNZ+sX7/WBF0M2yneKCLstxf0auhSjLAYXoR6xWViZNCRkaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YytAeokZCC24z9bU3RD9oM/22o2RaaDosS3jf+RJNy0UG35lsCu
	eif+evT3Px1c1Osayvh6JXsEZL+/4v3dqw+JILjS9IGSS5w9oomwYC6sC7i81uBPUW8h/rmGBGc
	pdITpszVENfeBP1DMcq93K0BiRW40SCE1m0ZgH0JBN7SRIzxpzv9sPPS+lq9ybfbbiQ==
X-Gm-Gg: ASbGncsIX2R8DIqy+iLOikdLgXvxI9J+l/obmKSA2luBsaCJR7PfKdAzQCGh6UICubo
	9KBGeskMJF68PPdpC/MWHbUD4awlyoafARL/3uFTDSLK6pXtRANHIXlupf5fcj7zxqilE3yLSA6
	BzOHiTQP3vtAEXvqw3vH9UXdVC7yV+AxEvoxwBm/QM7h8QNZmJKHlaj2fSroNtrCcPi497kP3fv
	cSH4iUpu196ErfbFaI61AZc/bt15cZnglocV0YeSCpZRMJuS8olDwSq0Mmd4eyKq4HpgJ3QlsNU
	Mbo=
X-Received: by 2002:a05:620a:4555:b0:7c5:9788:1762 with SMTP id af79cd13be357-7cd4678051amr3110618385a.45.1747842055644;
        Wed, 21 May 2025 08:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3a2uIuhszzX6u/m8PaNUSfSQHEqGfmhnxFRkzcN2fPM+8UtLLD8Ja0vDy+EkZ1oN2jOSBLw==
X-Received: by 2002:a05:620a:4555:b0:7c5:9788:1762 with SMTP id af79cd13be357-7cd4678051amr3110615285a.45.1747842055227;
        Wed, 21 May 2025 08:40:55 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef019sm891786485a.63.2025.05.21.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:40:54 -0700 (PDT)
Date: Wed, 21 May 2025 11:40:46 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, lizhe.67@bytedance.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge
 folio
Message-ID: <aC3z_gUxJbY1_JP7@x1.local>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
 <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
 <20250520162125.772d003f.alex.williamson@redhat.com>
 <ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>

On Wed, May 21, 2025 at 08:35:47AM +0200, David Hildenbrand wrote:
> On 21.05.25 00:21, Alex Williamson wrote:
> > On Tue, 20 May 2025 19:38:45 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> > 
> > > On 20.05.25 09:00, lizhe.67@bytedance.com wrote:
> > > > From: Li Zhe <lizhe.67@bytedance.com>
> > > 
> > > Subject: "huge folio" -> "large folios"
> > > 
> > > > 
> > > > When vfio_pin_pages_remote() is called with a range of addresses that
> > > > includes huge folios, the function currently performs individual
> > > 
> > > Similar, we call it a "large" f
> > > 
> > > > statistics counting operations for each page. This can lead to significant
> > > > performance overheads, especially when dealing with large ranges of pages.
> > > > 
> > > > This patch optimize this process by batching the statistics counting
> > > > operations.
> > > > 
> > > > The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> > > > obtained through trace-cmd, are as follows. In this case, the 8G virtual
> > > > address space has been mapped to physical memory using hugetlbfs with
> > > > pagesize=2M.
> > > > 
> > > > Before this patch:
> > > > funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> > > > 
> > > > After this patch:
> > > > funcgraph_entry:      # 15635.055 us |  vfio_pin_map_dma();
> > > > 
> > > > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > > > ---
> > > > Changelogs:
> > > > 
> > > > v2->v3:
> > > > - Code simplification.
> > > > - Fix some issues in comments.
> > > > 
> > > > v1->v2:
> > > > - Fix some issues in comments and formatting.
> > > > - Consolidate vfio_find_vpfn_range() and vfio_find_vpfn().
> > > > - Move the processing logic for huge folio into the while(true) loop
> > > >     and use a variable with a default value of 1 to indicate the number
> > > >     of consecutive pages.
> > > > 
> > > > v2 patch: https://lore.kernel.org/all/20250519070419.25827-1-lizhe.67@bytedance.com/
> > > > v1 patch: https://lore.kernel.org/all/20250513035730.96387-1-lizhe.67@bytedance.com/
> > > > 
> > > >    drivers/vfio/vfio_iommu_type1.c | 48 +++++++++++++++++++++++++--------
> > > >    1 file changed, 37 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > > > index 0ac56072af9f..48f06ce0e290 100644
> > > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > > @@ -319,15 +319,22 @@ static void vfio_dma_bitmap_free_all(struct vfio_iommu *iommu)
> > > >    /*
> > > >     * Helper Functions for host iova-pfn list
> > > >     */
> > > > -static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> > > > +
> > > > +/*
> > > > + * Find the first vfio_pfn that overlapping the range
> > > > + * [iova, iova + PAGE_SIZE * npage) in rb tree.
> > > > + */
> > > > +static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
> > > > +		dma_addr_t iova, unsigned long npage)
> > > >    {
> > > >    	struct vfio_pfn *vpfn;
> > > >    	struct rb_node *node = dma->pfn_list.rb_node;
> > > > +	dma_addr_t end_iova = iova + PAGE_SIZE * npage;
> > > >    	while (node) {
> > > >    		vpfn = rb_entry(node, struct vfio_pfn, node);
> > > > -		if (iova < vpfn->iova)
> > > > +		if (end_iova <= vpfn->iova)
> > > >    			node = node->rb_left;
> > > >    		else if (iova > vpfn->iova)
> > > >    			node = node->rb_right;
> > > > @@ -337,6 +344,11 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> > > >    	return NULL;
> > > >    }
> > > > +static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> > > > +{
> > > > +	return vfio_find_vpfn_range(dma, iova, 1);
> > > > +}
> > > > +
> > > >    static void vfio_link_pfn(struct vfio_dma *dma,
> > > >    			  struct vfio_pfn *new)
> > > >    {
> > > > @@ -681,32 +693,46 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> > > >    		 * and rsvd here, and therefore continues to use the batch.
> > > >    		 */
> > > >    		while (true) {
> > > > +			struct folio *folio = page_folio(batch->pages[batch->offset]);
> > > > +			long nr_pages;
> > > > +
> > > >    			if (pfn != *pfn_base + pinned ||
> > > >    			    rsvd != is_invalid_reserved_pfn(pfn))
> > > >    				goto out;
> > > > +			/*
> > > > +			 * Note: The current nr_pages does not achieve the optimal
> > > > +			 * performance in scenarios where folio_nr_pages() exceeds
> > > > +			 * batch->capacity. It is anticipated that future enhancements
> > > > +			 * will address this limitation.
> > > > +			 */
> > > > +			nr_pages = min((long)batch->size, folio_nr_pages(folio) -
> > > > +						folio_page_idx(folio, batch->pages[batch->offset]));
> > > > +			if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
> > > > +				nr_pages = 1;
> > > 
> > > 
> > > You seem to assume that the batch really contains the consecutive pages
> > > of that folio.
> > 
> > I don't think we are.  We're iterating through our batch of pages from
> > GUP to find consecutive pfns.  We use the page to get the pfn, the
> > folio, and immediately above, the offset into the folio.  batch->size is
> > the remaining length of the page array from GUP and batch->offset is our
> > current index into that array.
> 
> Let me try again using an example below ....
> 
> > > This is not the case if we obtained the pages through GUP and we have
> > > 
> > > (a) A MAP_PRIVATE mapping
> > > 
> > > (b) We span multiple different VMAs
> > > 
> > > 
> > > Are we sure we can rule out (a) and (b)?
> > > 
> > > A more future-proof approach would be at least looking whether the
> > > pages/pfns are actually consecutive.
> > 
> > The unmodified (pfn != *pfn_base + pinned) test is where we verify we
> > have the next consecutive pfn.  Maybe I'm not catching the dependency
> > you're seeing on consecutive pages, I think there isn't one unless
> > we're somehow misusing folio_page_idx() to get the offset into the
> > folio.
> 
> Assume our page tables look like this (case (a), a partially mapped large
> pagecache folio mixed with COW'ed anonymous folios):
> 
>   + page[0] of folio 0
>   |              + COWed anonymous folio (folio 1)
>   |              |    + page[4] of folio 0
>   |              |    |
>   v              v    v
> F0P0 F0P1 F0P2 F1P0 F0P4 P0P5 F0P6 F0P7
> 
> If we GUP that range, we get exactly these pages, except that the PFNs are
> not consecutive, because F0P3 was replaced by another page. The large folio
> is partially mapped.
> 
> 
> Maybe I misunderstand that code, but wouldn't we just "jump" over F1P0
> because we assume the batch would contain F1P0, where it really contains
> F0P4?

Looks like a real issue (even if unlikely setup)..

Before a next-gen GUP.. Maybe we should stick with memfd_pin_folios(),
that'll require mmap read lock taken though when seeing a hugetlb folio, so
it'll be a fast path to try to ping hugetlb-only vmas.

VFIO will also need to check in the fast path on: (1) double check it's a
hugetlb VMA (in case vma layout changed after GUP and before mmap read
lock), (2) VMA boundary check, making sure it's not out-of-bound (3) stick
with VM_SHARED only for now (I don't think anyone uses MAP_PRIVATE anyway
that will also care about how fast it pins..). Then 1G will also work
there..

Thanks,

-- 
Peter Xu

