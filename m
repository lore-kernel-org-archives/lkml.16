Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF621B909
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747971768; cv=none; b=G99/GGKsFmzL8mJDgtoQG4iFImXokaozpp+QhdLKPubceJfWlU65+UAAGMmE4feP4sOErgjPo2hhR1hGiggQ0s+1V8+61/LGaHfmq+f68eoOwAthe+0TzyGkn8+fi2KczCoQcctTHrsCkmbRFMHPvQdsoGTXQ9twIwM2edHXwsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747971768; c=relaxed/simple;
	bh=d5huQlXh1efRAppCXkTe3d+67Nij6wkb6lcWjYVptT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJUzuqME3mQ7ctwbUY++hBwO6gDGZfZRJwq6dq69vtj+Ns8UT0QqoWBQoDndQ66hrFIj8ud0zWEgHvJ2ap3kyB17WphdtAt6IIxfqzT+RwR48dkNrUAbhKmS0kJNlsCtKFLWk/q67K2E1rCtvnZHtH0vq9YbAS+t0ihtaCPzMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Awkyi31E; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Awkyi31E"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-afc857702d1so7399909a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747971766; x=1748576566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brAyXchy3n3A0Nkwv5gIonlyt1rlot5eF557LcIjUwI=;
        b=Awkyi31EFeK7NswFPiNuD/R9sQimcB3P9c4VG6xChiaiJtQlWyvmRCY3UVz1mFHPRz
         2M7lzh40jy9H3PZ7XtWaRpw2AHwWpwpSUa1k2loaYPLdn2ilGK/sp9HmGvaRQ4Him6MU
         MmGN47I7Q9Tecq8/iX+NRyH4TT2WoHGrYqhxYf0n7HA+sswTZQBiHWzusmFlqy5q3oV7
         2n6e5Um/kUbsi4Wviojs5wLX1aXm7nD9inLW6ktl+l8GZdqriw4RgcKvC4eNJtl7Ko2a
         OPBoAP6pBo3XB3hcOUwZHL4nWskkqaYfz+PzfFegJVG6nf38pUNWprZSNslb7IsLjSs1
         eDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747971766; x=1748576566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brAyXchy3n3A0Nkwv5gIonlyt1rlot5eF557LcIjUwI=;
        b=LtQk5ikHDxVHC4Rzf6aPTFw6MjQPczLh2vVR5+GPm5VjT6xRi3gMbbHWYmSjoXLUVo
         UID7eeVfu3l2XduVRtl6gabEw34zacawCNH/sWYwMadQUg9lQPeAMyv7mw/ABqPHsin0
         A6WsXhr0BLecwejK1K2UrPc08U5t1MZsBA1Vfds1YhMEWIiZ31soZabtCnlPm8oQtwp8
         XgfLl+NFYaOAcNgSifNzQEVtS2Mxw9DqKBLo7jGbOtowOjOqhh4C5U7E/NxREHZiCu0K
         kafCPlPfV951DqIxcqxGa21+jh0jQwWpoghOu1pKjfITGLa0wOZSvFAORT3XoztXsEOq
         gKug==
X-Forwarded-Encrypted: i=1; AJvYcCWh16jUpNTGIV9PUBYO+V9VuqE7YpQlKMlN+dCZZCK0fZXPKVYP1vdLhkddrUlml6XIJge7Y3uwHZ1zVmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Zv95SiLql3TU+o5m+rk4ZEvAacnLykn66QdM6CxyDi5RDv+h
	PLtGkzS2VT1ZH3w/+fQxzT0bNDbziOZVVLm3dsC3esGL70/bJhLv/Xa+lkH1+SYYO/Q=
X-Gm-Gg: ASbGnctr8xBWaQxgsfR4GcbgRaukTvb5roi2qCGSWcf3l6H5paDsz4E3cmPbIW+O/4U
	qwlhHo8BrIrUcjt+MWsHLQVUZvdxVAdY1kD9VReQpUZSgYA+jrQ1bXEXa73hjrhlfX0CTJ8LKJ0
	SCHLq9LxoFuY2xkS5pyfOboquRD79ncb09l7jQme6jeFJ1Q3eeJ5YmgLaXsgAx3lJSDG0p2xrdF
	oA6RnSciL1so8qqjMs+F7j61V5xxLOeG2AuqwV4dU/ljkzLPrZlhkei9Zgq4tbBJu40EqjpAF8s
	UkRctjrxFDhk0Q9ssn2EMNwQWd8nfVpHIDSboOT4bwi1+dbzx7EiYrdivsd0aZGnpFd34BxZ5Co
	eRyE=
X-Google-Smtp-Source: AGHT+IFZqE9jOyZSfXutukv9I+Uu+19n0xB9UudX0/PzDm8KMUsJ1r5OLWeAJAanYYQMUDZq9+sbOw==
X-Received: by 2002:a17:903:320e:b0:231:7399:7db8 with SMTP id d9443c01a7336-231d43dc996mr353089525ad.7.1747971765669;
        Thu, 22 May 2025 20:42:45 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed4ecfsm115278405ad.234.2025.05.22.20.42.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 May 2025 20:42:45 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for large folio
Date: Fri, 23 May 2025 11:42:38 +0800
Message-ID: <20250523034238.35879-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250522145207.01734386.alex.williamson@redhat.com>
References: <20250522145207.01734386.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 May 2025 14:52:07 -0600, alex.williamson@redhat.com wrote: 

> On Thu, 22 May 2025 16:25:24 +0800
> lizhe.67@bytedance.com wrote:
> 
> > On Thu, 22 May 2025 09:22:50 +0200, david@redhat.com wrote:
> > 
> > >On 22.05.25 05:49, lizhe.67@bytedance.com wrote:  
> > >> On Wed, 21 May 2025 13:17:11 -0600, alex.williamson@redhat.com wrote:
> > >>   
> > >>>> From: Li Zhe <lizhe.67@bytedance.com>
> > >>>>
> > >>>> When vfio_pin_pages_remote() is called with a range of addresses that
> > >>>> includes large folios, the function currently performs individual
> > >>>> statistics counting operations for each page. This can lead to significant
> > >>>> performance overheads, especially when dealing with large ranges of pages.
> > >>>>
> > >>>> This patch optimize this process by batching the statistics counting
> > >>>> operations.
> > >>>>
> > >>>> The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> > >>>> obtained through trace-cmd, are as follows. In this case, the 8G virtual
> > >>>> address space has been mapped to physical memory using hugetlbfs with
> > >>>> pagesize=2M.
> > >>>>
> > >>>> Before this patch:
> > >>>> funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> > >>>>
> > >>>> After this patch:
> > >>>> funcgraph_entry:      # 16071.378 us |  vfio_pin_map_dma();
> > >>>>
> > >>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > >>>> Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
> > >>>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > >>>> ---  
> > >>>
> > >>> Given the discussion on v3, this is currently a Nak.  Follow-up in that
> > >>> thread if there are further ideas how to salvage this.  Thanks,  
> > >> 
> > >> How about considering the solution David mentioned to check whether the
> > >> pages or PFNs are actually consecutive?
> > >> 
> > >> I have conducted a preliminary attempt, and the performance testing
> > >> revealed that the time consumption is approximately 18,000 microseconds.
> > >> Compared to the previous 33,000 microseconds, this also represents a
> > >> significant improvement.
> > >> 
> > >> The modification is quite straightforward. The code below reflects the
> > >> changes I have made based on this patch.
> > >> 
> > >> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > >> index bd46ed9361fe..1cc1f76d4020 100644
> > >> --- a/drivers/vfio/vfio_iommu_type1.c
> > >> +++ b/drivers/vfio/vfio_iommu_type1.c
> > >> @@ -627,6 +627,19 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
> > >>          return ret;
> > >>   }
> > >>   
> > >> +static inline long continuous_page_num(struct vfio_batch *batch, long npage)
> > >> +{
> > >> +       long i;
> > >> +       unsigned long next_pfn = page_to_pfn(batch->pages[batch->offset]) + 1;
> > >> +
> > >> +       for (i = 1; i < npage; ++i) {
> > >> +               if (page_to_pfn(batch->pages[batch->offset + i]) != next_pfn)
> > >> +                       break;
> > >> +               next_pfn++;
> > >> +       }
> > >> +       return i;
> > >> +}  
> > >
> > >
> > >What might be faster is obtaining the folio, and then calculating the 
> > >next expected page pointer, comparing whether the page pointers match.
> > >
> > >Essentially, using folio_page() to calculate the expected next page.
> > >
> > >nth_page() is a simple pointer arithmetic with CONFIG_SPARSEMEM_VMEMMAP, 
> > >so that might be rather fast.
> > >
> > >
> > >So we'd obtain
> > >
> > >start_idx = folio_idx(folio, batch->pages[batch->offset]);  
> > 
> > Do you mean using folio_page_idx()?
> > 
> > >and then check for
> > >
> > >batch->pages[batch->offset + i] == folio_page(folio, start_idx + i)  
> > 
> > Thank you for your reminder. This is indeed a better solution.
> > The updated code might look like this:
> > 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index bd46ed9361fe..f9a11b1d8433 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -627,6 +627,20 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
> >         return ret;
> >  }
> >  
> > +static inline long continuous_pages_num(struct folio *folio,
> > +               struct vfio_batch *batch, long npage)
> 
> Note this becomes long enough that we should just let the compiler
> decide whether to inline or not.

Thank you! The 'inline' here indeed needs to be removed.

> > +{
> > +       long i;
> > +       unsigned long start_idx =
> > +                       folio_page_idx(folio, batch->pages[batch->offset]);
> > +
> > +       for (i = 1; i < npage; ++i)
> > +               if (batch->pages[batch->offset + i] !=
> > +                               folio_page(folio, start_idx + i))
> > +                       break;
> > +       return i;
> > +}
> > +
> >  /*
> >   * Attempt to pin pages.  We really don't want to track all the pfns and
> >   * the iommu can only map chunks of consecutive pfns anyway, so get the
> > @@ -708,8 +722,12 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> >                          */
> >                         nr_pages = min_t(long, batch->size, folio_nr_pages(folio) -
> >                                                 folio_page_idx(folio, batch->pages[batch->offset]));
> > -                       if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
> > -                               nr_pages = 1;
> > +                       if (nr_pages > 1) {
> > +                               if (vfio_find_vpfn_range(dma, iova, nr_pages))
> > +                                       nr_pages = 1;
> > +                               else
> > +                                       nr_pages = continuous_pages_num(folio, batch, nr_pages);
> > +                       }
> 
> 
> I think we can refactor this a bit better and maybe if we're going to
> the trouble of comparing pages we can be a bit more resilient to pages
> already accounted as vpfns.  I took a shot at it, compile tested only,
> is there still a worthwhile gain?
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 0ac56072af9f..e8bba32148f7 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -319,7 +319,13 @@ static void vfio_dma_bitmap_free_all(struct vfio_iommu *iommu)
>  /*
>   * Helper Functions for host iova-pfn list
>   */
> -static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> +
> +/*
> + * Find the first vfio_pfn that overlapping the range
> + * [iova_start, iova_end) in rb tree.
> + */
> +static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
> +		dma_addr_t iova_start, dma_addr_t iova_end)
>  {
>  	struct vfio_pfn *vpfn;
>  	struct rb_node *node = dma->pfn_list.rb_node;
> @@ -327,9 +333,9 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
>  	while (node) {
>  		vpfn = rb_entry(node, struct vfio_pfn, node);
>  
> -		if (iova < vpfn->iova)
> +		if (iova_end <= vpfn->iova)
>  			node = node->rb_left;
> -		else if (iova > vpfn->iova)
> +		else if (iova_start > vpfn->iova)
>  			node = node->rb_right;
>  		else
>  			return vpfn;
> @@ -337,6 +343,11 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
>  	return NULL;
>  }
>  
> +static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> +{
> +	return vfio_find_vpfn_range(dma, iova, iova + PAGE_SIZE);
> +}
> +
>  static void vfio_link_pfn(struct vfio_dma *dma,
>  			  struct vfio_pfn *new)
>  {
> @@ -615,6 +626,43 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
>  	return ret;
>  }
>  
> +static long contig_pages(struct vfio_dma *dma,
> +			 struct vfio_batch *batch, dma_addr_t iova)
> +{
> +	struct page *page = batch->pages[batch->offset];
> +	struct folio *folio = page_folio(page);
> +	long idx = folio_page_idx(folio, page);
> +	long max = min_t(long, batch->size, folio_nr_pages(folio) - idx);
> +	long nr_pages;
> +
> +	for (nr_pages = 1; nr_pages < max; nr_pages++) {
> +		if (batch->pages[batch->offset + nr_pages] !=
> +		    folio_page(folio, idx + nr_pages))
> +			break;
> +	}
> +
> +	return nr_pages;
> +}
> +
> +static long vpfn_pages(struct vfio_dma *dma,
> +		       dma_addr_t iova_start, long nr_pages)
> +{
> +	dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
> +	struct vfio_pfn *vpfn;
> +	long count = 0;
> +
> +	do {
> +		vpfn = vfio_find_vpfn_range(dma, iova_start, iova_end);

I am somehow confused here. Function vfio_find_vpfn_range()is designed
to find, through the rbtree, the node that is closest to the root node
and satisfies the condition within the range [iova_start, iova_end),
rather than the node closest to iova_start? Or perhaps I have
misunderstood something?

> +		if (likely(!vpfn))
> +			break;
> +
> +		count++;
> +		iova_start = vpfn->iova + PAGE_SIZE;
> +	} while (iova_start < iova_end);
> +
> +	return count;
> +}
> +
>  /*
>   * Attempt to pin pages.  We really don't want to track all the pfns and
>   * the iommu can only map chunks of consecutive pfns anyway, so get the
> @@ -681,32 +729,40 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>  		 * and rsvd here, and therefore continues to use the batch.
>  		 */
>  		while (true) {
> +			long nr_pages, acct_pages = 0;
> +
>  			if (pfn != *pfn_base + pinned ||
>  			    rsvd != is_invalid_reserved_pfn(pfn))
>  				goto out;
>  
> +			nr_pages = contig_pages(dma, batch, iova);
> +			if (!rsvd) {
> +				acct_pages = nr_pages;
> +				acct_pages -= vpfn_pages(dma, iova, nr_pages);
> +			}
> +
>  			/*
>  			 * Reserved pages aren't counted against the user,
>  			 * externally pinned pages are already counted against
>  			 * the user.
>  			 */
> -			if (!rsvd && !vfio_find_vpfn(dma, iova)) {
> +			if (acct_pages) {
>  				if (!dma->lock_cap &&
> -				    mm->locked_vm + lock_acct + 1 > limit) {
> +				    mm->locked_vm + lock_acct + acct_pages > limit) {
>  					pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",
>  						__func__, limit << PAGE_SHIFT);
>  					ret = -ENOMEM;
>  					goto unpin_out;
>  				}
> -				lock_acct++;
> +				lock_acct += acct_pages;
>  			}
>  
> -			pinned++;
> -			npage--;
> -			vaddr += PAGE_SIZE;
> -			iova += PAGE_SIZE;
> -			batch->offset++;
> -			batch->size--;
> +			pinned += nr_pages;
> +			npage -= nr_pages;
> +			vaddr += PAGE_SIZE * nr_pages;
> +			iova += PAGE_SIZE * nr_pages;
> +			batch->offset += nr_pages;
> +			batch->size -= nr_pages;
>  
>  			if (!batch->size)
>  				break;

Thanks,
Zhe

