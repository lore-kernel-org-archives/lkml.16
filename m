Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719C26B748
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879614; cv=none; b=mqSsneWDKYri988GaLCs0z3KytctzbebbALR+OAXamFx7D2lsh+Ij0X4VcM2VjvxffjtwFreGBg3HC2zNN/abrjZBhx17DkXuVUqPwsTMf9RXY+f6AZaN3wPjTLcF/7uHLc/askfaKtUofzoC6CIdeWdAgd8NBegEL620PvwY3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879614; c=relaxed/simple;
	bh=lzwFHTmArGTFfMnHS2pC4PiDBDDb1yR51vxeS8GWDfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6F2bNUBdn11nAdCMV0SJj1OwIj5gL4XmZ4FcTaRqdB0NeoQSpVWYD2dmgNuGTG5/+QDE2iizuepugTdHZWfUORsu2pDRpq7gNe0LUCcPaxz+IZ7EPCJAg+HKI0KKHIL+XU9ebgzM9kVJJ3IP34iRjEsnPCJ/v41bk9wHgDMMLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZiV/+trD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZiV/+trD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750879610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGfYjsrv3CHWJsl4ZYRpnVjuHZ4AXKNVmUWtYP9RsHQ=;
	b=ZiV/+trD/3ECqPDhy97fwfR43M0SlLcgQq9HFPGdc3EVC/sv5ydXps2qYsaFlD1QJuOGpH
	K+Dep6OFamql2i4bPivqTyYgvawSy9wSshQihN4pQYHuq4eqc/vlwIT0hBGNo1u7673tz8
	9rRPJ0wZnb/JXE87qnRKCV4MFn6pd+4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-IWAvKl2WNw6JjNeWtc4IYQ-1; Wed, 25 Jun 2025 15:26:49 -0400
X-MC-Unique: IWAvKl2WNw6JjNeWtc4IYQ-1
X-Mimecast-MFC-AGG-ID: IWAvKl2WNw6JjNeWtc4IYQ_1750879609
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a585ad6726so7224251cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750879608; x=1751484408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGfYjsrv3CHWJsl4ZYRpnVjuHZ4AXKNVmUWtYP9RsHQ=;
        b=JHKRE4926YIJiRE5KQ+bbQKjV6s1DOVwI76EuCUjOrwgq/IJEn5L6dh2oTF35b3AxZ
         0Us0zolLVgdYDIh6wmc49akibTtWmiL+4pH0kSpVIKuHV7/cX2b/IJQeAs+fmlf7mKGI
         Qxf+8DGPqz/clGeTQH6gE6GtC9zzFAwy7AIbjp22/pM+/EmSAj/s2yBs3oyL1/uYYR43
         8z9IZCczIrUrKbzOVCqE8rBDw4NdQY5u71JdE3O+GDTu2oo7ZTKqJJ7mEwTeN3AQZ2vW
         ZKWs0n06wVpOmXUXqDpiiB0PyJZ2vzSgm+tcg4QedrJY1sQh1VxQ97fWEQGoo3TonuVV
         7r3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+a5M8kLxJTDjp8mJ2ItSe+FrqPhd/nOGWF7htyJL2Re0oqiFcQOIynx1aj2GWEtwGXO36wQtO44tGT0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhH6tfMo73HZ96yZW4cLB10Mtano7HImlDQ9mgOs1/G8nB/aTJ
	6ja8PQLqrNsX3BidujCw1p0JG8zUgET8/ujnnzN5u5a9cD1daoyi9P6QQWuZwEaZo04e+rwbOup
	uraq2PJRVPpfyVvoWgNbh8ZWQYG2SXw+Yz6xmrtJaoIZIoSXvZHWPEZWqCKymO6OUfA==
X-Gm-Gg: ASbGncuN8YUVXgRk4ILoJDlPFIZyWig/MjJPojSET+O2QIs9efHhwXu9OSy6hDfU2Q5
	QjnvsQSAM+4onDzOeRsUj6YtcLk8cA85yvPxO0CEakzx11n3TEyOHeRkLu9rWv49ejGgftYa3BU
	G1HCLXcQUtYjO1oPXPosrMsjSioQv1AgtfNi86Jyry2E+tdEXW0vRPZvO26OI4/5kqnFJqXccGf
	FbdWFqFGok1bNTOnoO5bcUm1tZfLRm+HhDOOiwwKIWsiwEP/8avSc42K6Gi/VvSWmdazRFCgnGA
	eFaEeFUvb+Ejow==
X-Received: by 2002:a05:622a:d0c:b0:4a7:693a:6ae8 with SMTP id d75a77b69052e-4a7c0987d78mr76648611cf.52.1750879608525;
        Wed, 25 Jun 2025 12:26:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2/4t5r9VjiW5td+72Yce2Xj+4z6Ttju+rlhn9lvRECNav3t/dX5xvs86OsGTFFXZgQqVrUA==
X-Received: by 2002:a05:622a:d0c:b0:4a7:693a:6ae8 with SMTP id d75a77b69052e-4a7c0987d78mr76648091cf.52.1750879608097;
        Wed, 25 Jun 2025 12:26:48 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d4f7d9sm62877581cf.6.2025.06.25.12.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 12:26:47 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:26:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aFxNdDpIlx0fZoIN@x1.local>
References: <aFMQZru7l2aKVsZm@x1.local>
 <20250619135852.GC1643312@nvidia.com>
 <aFQkxg08fs7jwXnJ@x1.local>
 <20250619184041.GA10191@nvidia.com>
 <aFsMhnejq4fq6L8N@x1.local>
 <20250624234032.GC167785@nvidia.com>
 <aFtHbXFO1ZpAsnV8@x1.local>
 <20250625130711.GH167785@nvidia.com>
 <aFwt6wjuDzbWM4_C@x1.local>
 <20250625184154.GI167785@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625184154.GI167785@nvidia.com>

On Wed, Jun 25, 2025 at 03:41:54PM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 25, 2025 at 01:12:11PM -0400, Peter Xu wrote:
> 
> > After I read the two use cases, I mostly agree.  Just one trivial thing to
> > mention, it may not be direct map but vmap() (see io_region_init_ptr()).
> 
> If it is vmapped then this is all silly, you should vmap and mmmap
> using the same cache colouring and, AFAIK, pgoff is how this works for
> purely userspace.
> 
> Once vmap'd it should determine the cache colour and set the pgoff
> properly, then everything should already work no?

I don't yet see how to set the pgoff.  Here pgoff is passed from the
userspace, which follows io_uring's definition (per io_uring_mmap).

For example, in parisc one could map the complete queue with
pgoff=IORING_OFF_CQ_RING (0x8000000), but then the VA alignment needs to be
adjusted to the vmap() returned for complete queue's io_mapped_region.ptr.

> 
> > It already does, see (io_uring_get_unmapped_area(), of parisc):
> > 
> > 	/*
> > 	 * Do not allow to map to user-provided address to avoid breaking the
> > 	 * aliasing rules. Userspace is not able to guess the offset address of
> > 	 * kernel kmalloc()ed memory area.
> > 	 */
> > 	if (addr)
> > 		return -EINVAL;
> > 
> > I do not know whoever would use MAP_FIXED but with addr=0.  So failing
> > addr!=0 should literally stop almost all MAP_FIXED already.
> 
> Maybe but also it is not right to not check MAP_FIXED directly.. And
> addr is supposed to be a hint for non-fixed mode so it is weird to
> -EINVAL when you can ignore the hint??

I agree on both points here.

> 
> > Going back to the topic of this series - I think the new API would work for
> > io_uring and parisc too if I can return phys_pgoff, here what parisc would
> > need is:
> 
> The best solution is to fix the selection of normal pgoff so it has
> consistent colouring of user VMAs and kernel vmaps. Either compute a
> pgoff that matches the vmap (hopefully easy if it is not uABI) or
> teach the kernel vmap how to respect a "pgoff" to set the cache
> colouring just like the user VMA's do (AFIACR).
> 
> But I think this is getting maybe too big and I'd just introduce the
> new API and not try to convert this hard stuff. The above explanation
> how it could be fixed should be enough??

I never planned to do it myself.  However if I'm going to sign-off and
propose an API, I want to be crystal clear of the goal of the API, and
feasibility of the goal even if I'm not going to work on it..

We don't want to introduce something then found it won't work even for some
MMU use cases, and start maintaining both, or revert back. I wished we
could have sticked with the get_unmapped_area() as of now and leave the API
for later.

So if we want the new API to be proposed here, and make VFIO use it first
(while consider it to be applicable to all existing MMU users at least,
which I checked all of them so far now), I'd think this proper:

    int (*mmap_va_hint)(struct file *file, unsigned long *pgoff, size_t len);

The changes comparing to previous:

    (1) merged pgoff and *phys_pgoff parameters into one unsigned long, so
    the hook can adjust the pgoff for the va allocator to be used.  The
    adjustment will not be visible to future mmap() when VMA is created.

    (2) I renamed it to mmap_va_hint(), because *pgoff will be able to be
    updated, so it's not only about ordering, but "order" and "pgoff
    adjustment" hints that the core mm will use when calculating the VA.

Does it look ok to you?

-- 
Peter Xu

