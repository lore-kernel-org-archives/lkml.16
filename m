Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9252F7D18
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484624; cv=none; b=lK/3uc1SCf+P3VYTE+BTfKEAhHazGXT8O7DLOaD48MnDsbTtT6FaQMA7feu12y2pD2LlZUX7ZO06WiqXI6vGi0kuNhoZ5HVFQeSaJvGEhFAnuaL3lutC/tSS3S/aPQlOEl6Fq0NZpFAM7SbrJbw2Z1DxQSvaLyH6KNp8qyaYMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484624; c=relaxed/simple;
	bh=sqGDApwK+RkK93D+5heEBkQKPJVnN6cdJg5/KLXWmAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bsw8hm1AaSubSxx25UakwcanYao/jvTUZ9g4dC3mplYE3WBvUGH9zn8o+U10SHfXDOGRYBCdIwr3V5a89c5xR9GC2x3WTWLbIlHc0CguJ2Ts+XghwK0Hax5rlXkxhQSca6kMnum/J6upJlgrVUPE6CvpdRYq31FXVAvFkRfe/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CO0TzRUo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CO0TzRUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751484621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bVjNXEmwWJ25OMSC8D6SKZP+6PnJvUru8QWuoRzdce0=;
	b=CO0TzRUoel8ZoKGHB3QBFldNYkceZblILqlEjKWo3XAlKL4UZGh0z3qh8jnKFqkgTqanux
	FMIr0xGrDzmz8kxl/5xG4HHo4w1Jbez9+Ut1FEJvMLEvjpCW0iTqZspuUU2y8SPozCPP/n
	73tyAL+jq7pddErrte0uqYzeOsnis/c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-vnLzLULVO8SfxTlSbjEqIA-1; Wed, 02 Jul 2025 15:30:20 -0400
X-MC-Unique: vnLzLULVO8SfxTlSbjEqIA-1
X-Mimecast-MFC-AGG-ID: vnLzLULVO8SfxTlSbjEqIA_1751484620
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5664c771so116252766d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751484619; x=1752089419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVjNXEmwWJ25OMSC8D6SKZP+6PnJvUru8QWuoRzdce0=;
        b=NQP4jUIluQf0L13ff2kdEjI0Vtd1n3njhdiiFWHHgP3MRyeJvrwOTcxeBxzYp+88Ld
         BA7/z01+0HjdQckHQTLgH5ehT426HX5Qsuxqvfljlg6xrV8eRX/FgJ4/O1Z+TtlvW1GB
         5XNZx6Gfxy0OQF50TWQHUAvtjdeBTDObSMGkZCY0gVcKe119+LYrgOwzbMrwkDPBKrhf
         DuDEhuReDSDxrnMGyPlXXCD2w5VZlyoO21jTBhfTY/pS03BYYLxq9X5grXElPA+AvIgP
         dkUxIo8/WgEUfk81aXqXs6Drqb/1oZLe2pB9O1pCqN8xxwHY1Xic8gVF0vuQgiFZziH3
         D5nA==
X-Forwarded-Encrypted: i=1; AJvYcCXH//EP0G0mF8MceyQqovXBzvuaEQvuMT24Qy/u5NhQRQcIE4m1sK5ig4cqIwzakznk2rYSusAe+5Dr8zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTWz01jFJxGMUr0HtN82hHgJXjPTxqCUFJnpMlPP0xSppLBiEt
	3bpZBkRyPKVa3dkkrlhv7KHCQ8962RHrv1nEJX3aqQjVfdt+Ofo+LI/dQwSaVuPxFawm9KS43mx
	M5eu/L8z1aTXWD9GlWHtOW1K5ok0/lpZmPOeGktu3B+QpFPo5E1S5WTMKKt/Qmfn+rQ==
X-Gm-Gg: ASbGncvw++Dc6NIjZGygxcPjwGvnNRx6sGCIbojWaylZuy/OZR3wOa14EDajz5SYDnT
	XDk32L0MJSIE/SKL0q4ZVAr/5Q/D4kmspwPQ38xFDrvBEVHWKTbAB0b9/tXj8UdBxA4yjIV6xQg
	uuLjpUQA0Hpoqe6GyhTMyWo7Nwar5uZFWKpiq44A5Q+0L9EueDtHtSrItRb4mop0/J2Yz/NGuqr
	8XsEpDZ2qsLwbGqhE3fB7qlcP2EXLFlQ8tRWd4NJhggAbUfQH2jtOshAfkcpFVw+M9S1+pisybo
	5Tdi0TNMlqkpUw==
X-Received: by 2002:ad4:5de7:0:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702bc8a6f74mr10611576d6.10.1751484619053;
        Wed, 02 Jul 2025 12:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESVA/R9sRs5Zd0ceXMGp/3YBzwNIxrliDpxNfmTWOPrytf8EoXJDoPprMsHlrfqNc+nZKlSg==
X-Received: by 2002:ad4:5de7:0:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702bc8a6f74mr10610616d6.10.1751484618418;
        Wed, 02 Jul 2025 12:30:18 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd773119c3sm106153026d6.120.2025.07.02.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:30:17 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:30:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGWIxj74Hk6Fld06@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aGD-QxroTEDUh1eX@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGD-QxroTEDUh1eX@kernel.org>

On Sun, Jun 29, 2025 at 11:50:11AM +0300, Mike Rapoport wrote:
> Hi Peter,

Hi, Mike,

> 
> On Fri, Jun 27, 2025 at 11:46:52AM -0400, Peter Xu wrote:
> > Introduce a generic userfaultfd API for vm_operations_struct, so that one
> > vma, especially when as a module, can support userfaults without modifying
> > the core files.  More importantly, when the module can be compiled out of
> > the kernel.
> > 
> > So, instead of having core mm referencing modules that may not ever exist,
> > we need to have modules opt-in on core mm hooks instead.
> > 
> > After this API applied, if a module wants to support userfaultfd, the
> > module should only need to touch its own file and properly define
> > vm_uffd_ops, instead of changing anything in core mm.
> 
> I liked the changelog update you proposed in v1 thread. I took liberty to

It's definitely hard to satisfy all reviewers on one version of commit
message..

> slightly update it and here's what I've got:
> 
>   Currently, most of the userfaultfd features are implemented directly in the
>   core mm.  It will invoke VMA specific functions whenever necessary.  So far
>   it is fine because it almost only interacts with shmem and hugetlbfs.
> 
>   Introduce a generic userfaultfd API extension for vm_operations_struct,
>   so that any code that implements vm_operations_struct (including kernel
>   modules that can be compiled separately from the kernel core) can support
>   userfaults without modifying the core files.
> 
>   With this API applied, if a module wants to support userfaultfd, the
>   module should only need to properly define vm_uffd_ops and hook it to
>   vm_operations_struct, instead of changing anything in core mm.

Thanks, I very much appreciate explicit suggestions on the wordings.
Personally I like it and the rest suggestions, I'll use it when repost, but
I'll also wait for others if anyone has other things to say.

> 
> > Note that such API will not work for anonymous. Core mm will process
> > anonymous memory separately for userfault operations like before.
> 
> Maybe:
> 
>   This API will not work for anonymous memory. Handling of userfault
>   operations for anonymous memory remains unchanged in core mm.
>  
> > This patch only introduces the API alone so that we can start to move
> > existing users over but without breaking them.
> 
> Please use imperative mood, e.g.
>  
>   Only introduce the new API so that ...
>  
> > Currently the uffd_copy() API is almost designed to be the simplistic with
> > minimum mm changes to move over to the API.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/linux/mm.h            |  9 ++++++
> >  include/linux/userfaultfd_k.h | 52 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 61 insertions(+)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index ef40f68c1183..6a5447bd43fd 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -576,6 +576,8 @@ struct vm_fault {
> >  					 */
> >  };
> >  
> > +struct vm_uffd_ops;
> > +
> >  /*
> >   * These are the virtual MM functions - opening of an area, closing and
> >   * unmapping it (needed to keep files on disk up-to-date etc), pointer
> > @@ -653,6 +655,13 @@ struct vm_operations_struct {
> >  	 */
> >  	struct page *(*find_special_page)(struct vm_area_struct *vma,
> >  					  unsigned long addr);
> > +#ifdef CONFIG_USERFAULTFD
> > +	/*
> > +	 * Userfaultfd related ops.  Modules need to define this to support
> > +	 * userfaultfd.
> > +	 */
> > +	const struct vm_uffd_ops *userfaultfd_ops;
> > +#endif
> >  };
> >  
> >  #ifdef CONFIG_NUMA_BALANCING
> > diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
> > index df85330bcfa6..c9a093c4502b 100644
> > --- a/include/linux/userfaultfd_k.h
> > +++ b/include/linux/userfaultfd_k.h
> > @@ -92,6 +92,58 @@ enum mfill_atomic_mode {
> >  	NR_MFILL_ATOMIC_MODES,
> >  };
> >  
> > +/* VMA userfaultfd operations */
> > +struct vm_uffd_ops {
> > +	/**
> > +	 * @uffd_features: features supported in bitmask.
> > +	 *
> > +	 * When the ops is defined, the driver must set non-zero features
> > +	 * to be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.
> > +	 */
> > +	unsigned long uffd_features;
> > +	/**
> > +	 * @uffd_ioctls: ioctls supported in bitmask.
> > +	 *
> > +	 * Userfaultfd ioctls supported by the module.  Below will always
> > +	 * be supported by default whenever a module provides vm_uffd_ops:
> > +	 *
> > +	 *   _UFFDIO_API, _UFFDIO_REGISTER, _UFFDIO_UNREGISTER, _UFFDIO_WAKE
> > +	 *
> > +	 * The module needs to provide all the rest optionally supported
> > +	 * ioctls.  For example, when VM_UFFD_MISSING was supported,
> > +	 * _UFFDIO_COPY must be supported as ioctl, while _UFFDIO_ZEROPAGE
> > +	 * is optional.
> > +	 */
> > +	unsigned long uffd_ioctls;
> > +	/**
> > +	 * uffd_get_folio: Handler to resolve UFFDIO_CONTINUE request.
> > +	 *
> > +	 * @inode: the inode for folio lookup
> > +	 * @pgoff: the pgoff of the folio
> > +	 * @folio: returned folio pointer
> > +	 *
> > +	 * Return: zero if succeeded, negative for errors.
> > +	 */
> > +	int (*uffd_get_folio)(struct inode *inode, pgoff_t pgoff,
> > +			      struct folio **folio);
> > +	/**
> > +	 * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
> > +	 *
> > +	 * @dst_pmd: target pmd to resolve page fault
> > +	 * @dst_vma: target vma
> > +	 * @dst_addr: target virtual address
> > +	 * @src_addr: source address to copy from
> > +	 * @flags: userfaultfd request flags
> > +	 * @foliop: previously allocated folio
> > +	 *
> > +	 * Return: zero if succeeded, negative for errors.
> > +	 */
> > +	int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
> > +			 unsigned long dst_addr, unsigned long src_addr,
> > +			 uffd_flags_t flags, struct folio **foliop);
> > +};
> > +typedef struct vm_uffd_ops vm_uffd_ops;
> 
> Either use vm_uffd_ops_t for the typedef or drop the typedef entirely. My
> preference is for the second option.

Andrew helped me to fix some hidden spaces which I appreciated, then I
found checkpatch warns on this one too besides the spaces fixed in mm-new.
I do not know why checkpatch doesn't like typedefs even if typedefs are
massively used in Linux..

I think I'll simply stick with not using typedefs.

Thanks,

> 
> > +
> >  #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1) + 1)
> >  #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
> >  #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

-- 
Peter Xu

