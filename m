Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1B1519AC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405061; cv=none; b=M7IlK5s5QgZmqA5yWRBGaxMWSepZQ5KzIDgINtx2qIpZPNarjIrK0QWOc7m9pj3h+/w5kVJSNFWQxgBW0yB/1UR8VGFfw6tJvXNRt56KMv3TsSL+v7R1xT6w4AqJLGXdHYMaiQyEgsCacPQ/cALObc8mEzYWfd4Gfg22Fs54jKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405061; c=relaxed/simple;
	bh=1gncUBYCwuSfN3USu7RdB/12vyV0h7/KF4QgTJljmys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=inNOcSpX8Es7HHK64DR+q4kGY9MYNelicg+Y30x0Sv16cVt+P52e9GUTGXcqJS7zrx6LUQq2ws0Jo6w8fJSWjj61EAzPInh3rADHUvC2R4kharZtfBVpNXJfWeHTzCiDiM6l7hAHqmUBJ0pL6/5V2ieJM3tBSU8L8bwQ1EV+Uyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijvEgMTF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijvEgMTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747405058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0h80qSfoD4MQf1+963ZWlawunbXgZmEBew3ZxMnjVA=;
	b=ijvEgMTFGa0pNtCHsnYBkW3LuQ1tweQ7LUj+YUYF2ZkM3m/yKuUdrrFMMycVIYhpGEQDhv
	0GY36+UoAWgeKcotEPZ/DRXjg35BpX5zUxSaIieQIXipeKqLsPcFyNmkohINnamAtoAVfS
	uqgdQHANCkOulrHzLoZ9PLynM9GlCwA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-YjqCIf6uOxusygs2H8IAPA-1; Fri, 16 May 2025 10:17:36 -0400
X-MC-Unique: YjqCIf6uOxusygs2H8IAPA-1
X-Mimecast-MFC-AGG-ID: YjqCIf6uOxusygs2H8IAPA_1747405056
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b45e94b08so42618639f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747405056; x=1748009856;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0h80qSfoD4MQf1+963ZWlawunbXgZmEBew3ZxMnjVA=;
        b=OuuB5J7leIZ6b+iEgoBIcF9MkwUPGTQ8j94SSZUrOZou/eqfuD1o7Ubc32COk2aHFC
         96cN99ME8eoQpkk0efzV64LU6bQ1v/jJ+clktKfG3PHWMPs49WWqXzvNEqbDTFmWlQQj
         nc8RdUc3nmpHCN3GZGwTKZKRSRbWkwrHc0jbB7/vQx+8za1YR0GwH51408bi7O4A5klN
         EAmOs1kY284OMeNur+wkzlVvCb9T0V9EeFguhdHuyJbm+8DEYZ5/JGkHayxs+7wFc3d0
         uaNzmuFPPeiNA+ibQg+lhyNRA5CXy7ArybRT2Sm/5SmO57uafcIW+iYCK8EXQ1DQD436
         lXHw==
X-Forwarded-Encrypted: i=1; AJvYcCV7V1wC+BBe4HZ0wQK8AuT1Pi9mU1b6HQ/eLXExLIWYSvXMx4UqUQXC8nMBJfT2WxmvyJaqoB3xqFjHpwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iIwz64c4HOmaYFPTqivKs5mV/WwIY3vS0lAj/nd0GCLgXl/6
	Ys0MZSOCNWgYccXo2nZwx1cooY7dJ7sIDXSHJ10Pr8KqJShMFNqRSt10WEtoxieSBnVEewaabWS
	Ts88KxmszkaUOKGf58FCPyICYm31rdyH5clt1mSFIIBckKLqUqCbbOYMnLC5ctblRmw==
X-Gm-Gg: ASbGnctw2HTQqO54QKKgbfxns1Znlm9fZdYO3nbuIk5abueRcXsjuhIQC54vPzXACsn
	+/6MOukLe7J7LlV0KMfFqmfFL3m7mMntrt6PY8cX1vrQHUq9M4vNa3zL6+AbN+L2j+lGwrk6qPf
	CB/aNxXksP/lJ5qXhqI8FAK9B/tI5ns2bLXIgvar3MRqIN1VBKpb8kpu4cr8t5qosQ5c3RYK9hC
	DagyJliZSRgiAb2ktK6mTvK5T74dntMVHgO8s2OZSIlaaFixcL+paDpvLmF9BdC9HM/RleS0CxQ
	wgT6vcX0drsid5Y=
X-Received: by 2002:a05:6e02:b2e:b0:3db:71e8:8630 with SMTP id e9e14a558f8ab-3db84368a14mr11357615ab.3.1747405055831;
        Fri, 16 May 2025 07:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPUdCId9H1s1LEogJrTgKv7lSwlk/EbBV62XdXrbd5Hld7O9fdGoDcSINOobzifFeGxoYeZg==
X-Received: by 2002:a05:6e02:b2e:b0:3db:71e8:8630 with SMTP id e9e14a558f8ab-3db84368a14mr11357505ab.3.1747405055423;
        Fri, 16 May 2025 07:17:35 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4b2f45sm409339173.126.2025.05.16.07.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:17:34 -0700 (PDT)
Date: Fri, 16 May 2025 08:17:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 muchun.song@linux.dev, peterx@redhat.com
Subject: Re: [PATCH] vfio/type1: optimize vfio_pin_pages_remote() for
 hugetlbfs folio
Message-ID: <20250516081732.06ef2230.alex.williamson@redhat.com>
In-Reply-To: <20250516081616.73039-1-lizhe.67@bytedance.com>
References: <20250515151946.1e6edf8b.alex.williamson@redhat.com>
	<20250516081616.73039-1-lizhe.67@bytedance.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 May 2025 16:16:16 +0800
lizhe.67@bytedance.com wrote:

> On Thu, 15 May 2025 15:19:46 -0600, alex.williamson@redhat.com wrote:
> 
> >> +/*
> >> + * Find a random vfio_pfn that belongs to the range
> >> + * [iova, iova + PAGE_SIZE * npage)
> >> + */
> >> +static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
> >> +		dma_addr_t iova, unsigned long npage)
> >> +{
> >> +	struct vfio_pfn *vpfn;
> >> +	struct rb_node *node = dma->pfn_list.rb_node;
> >> +	dma_addr_t end_iova = iova + PAGE_SIZE * npage;
> >> +
> >> +	while (node) {
> >> +		vpfn = rb_entry(node, struct vfio_pfn, node);
> >> +
> >> +		if (end_iova <= vpfn->iova)
> >> +			node = node->rb_left;
> >> +		else if (iova > vpfn->iova)
> >> +			node = node->rb_right;
> >> +		else
> >> +			return vpfn;
> >> +	}
> >> +	return NULL;
> >> +}  
> >
> >This essentially duplicates vfio_find_vpfn(), where the existing
> >function only finds a single page.  The existing function should be
> >extended for this new use case and callers updated.  Also the vfio_pfn  
> 
> How about implementing it in this way?
> 
> static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> {
> 	return vfio_find_vpfn_range(dma, iova, 1);
> }
> 
> With this implement, the caller who calls vfio_find_vpfn() won't need to
> be modified.

Yes, that would minimize churn elsewhere.

> >is not "random", it's the first vfio_pfn overlapping the range.  
> 
> Yes you are right. I will modify the comments to "Find the first vfio_pfn
> overlapping the range [iova, iova + PAGE_SIZE * npage) in rb tree" in v2.
> 
> >> +
> >>  static void vfio_link_pfn(struct vfio_dma *dma,
> >>  			  struct vfio_pfn *new)
> >>  {
> >> @@ -670,6 +694,31 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> >>  				iova += (PAGE_SIZE * ret);
> >>  				continue;
> >>  			}
> >> +  
> >
> >Spurious new blank line.
> >  
> >> +		}  
> >
> >A new blank line here would be appreciated.  
> 
> Thank you. I will address this in v2.
> 
> >> +		/* Handle hugetlbfs page */
> >> +		if (likely(!disable_hugepages) &&  
> >
> >Isn't this already accounted for with npage = 1?  
> 
> Yes. This check is not necessary. I will remove it in v2.
> 
> >> +				folio_test_hugetlb(page_folio(batch->pages[batch->offset]))) {  
> >
> >I don't follow how this guarantees the entire batch->size is
> >contiguous.  Isn't it possible that a batch could contain multiple
> >hugetlb folios?  Is the assumption here only true if folio_nr_pages()
> >(or specifically the pages remaining) is >= batch->capacity?  What  
> 
> Yes.
> 
> >happens if we try to map the last half of one 2MB hugetlb page and
> >first half of the non-physically-contiguous next page?  Or what if the
> >hugetlb size is 64KB and the batch contains multiple folios that are
> >not physically contiguous?  
> 
> Sorry for my problematic implementation. I will fix it in v2.
> 
> >> +			if (pfn != *pfn_base + pinned)
> >> +				goto out;
> >> +
> >> +			if (!rsvd && !vfio_find_vpfn_range(dma, iova, batch->size)) {
> >> +				if (!dma->lock_cap &&
> >> +				    mm->locked_vm + lock_acct + batch->size > limit) {
> >> +					pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",
> >> +						__func__, limit << PAGE_SHIFT);
> >> +					ret = -ENOMEM;
> >> +					goto unpin_out;
> >> +				}
> >> +				pinned += batch->size;
> >> +				npage -= batch->size;
> >> +				vaddr += PAGE_SIZE * batch->size;
> >> +				iova += PAGE_SIZE * batch->size;
> >> +				lock_acct += batch->size;
> >> +				batch->offset += batch->size;
> >> +				batch->size = 0;
> >> +				continue;
> >> +			}  
> >
> >There's a lot of duplication with the existing page-iterative loop.  I
> >think they could be consolidated if we extract the number of known
> >contiguous pages based on the folio into a variable, default 1.  
> 
> Good idea! I will try to implement this optimization based on this idea
> in v2.
> 
> >Also, while this approach is an improvement, it leaves a lot on the
> >table in scenarios where folio_nr_pages() exceeds batch->capacity.  For
> >example we're at best incrementing 1GB hugetlb pages in 2MB increments.
> >We're also wasting a lot of cycles to fill pages points we mostly don't
> >use.  Thanks,  
> 
> Yes, this is the ideal case. However, we are uncertain whether the pages
> to be pinned are hugetlbfs folio, and increasing batch->capacity would
> lead to a significant increase in memory usage. Additionally, since
> pin_user_pages_remote() currently lacks a variant that can reduce the
> overhead of "filling pages points" of hugetlbfs folio (maybe not correct).
> I suggest we proceeding with additional optimizations after further
> infrastructure improvements.

That's fair, it's a nice improvement within the existing interfaces
even if we choose to pursue something more aggressive in the future.
Please consider documenting improvements relative to 1GB hugetlb in the
next version also.  Thanks,

Alex

