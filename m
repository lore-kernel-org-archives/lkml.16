Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197F2DE6F5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489936; cv=none; b=dVZjDOQIIhnrT1bDcone3eGDZOhUNbpRw0XDL736OZam04KdNaK011X9r7l5DSjKVC1o0rwkt/H2FPUqjcGnT6HQnSaVT8t6Y3amov7Z+Ff9AfGDkmR7Tu/PXSvfA6TRlSB1c2+f4SwdNtGHXl/24Vuv6L/Wbe3x65cayzB1YK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489936; c=relaxed/simple;
	bh=eTPngYW+xIIJsPFNulV3zvN+v6Iqt2lDwz2DaFgqNr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAJZH/ktmB4DV9XiajKbJaykKrFEbYmkhJ+OxKGTt5c1nJyxCSTOtyy0PQI9Z3FDstjVhRmvXzQgi53a1t+KMJe7vp0Vuq64kGiynH40VylSHT2eMOManbCjlsowHBJ+EKiiwL816BxAG5v3uizJFhK8mPG+eSi2LuRL6TvEgng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpwOBkT2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DpwOBkT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751489932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WOTU+d2v5BAWQ3IDOfILW9WYtvyZL2oUTXZsgcEBv+A=;
	b=DpwOBkT2aMpq18ucrYpVtDWn0KkSCLDi+s24VP/svjUKtm3FlmB2ekA2VVtCyR69sVx98k
	kqKpDhkodCtvzuYO5fij+kspq80tGie592RIicr8W8kLg5uAYmfCwmYHrzqdLGw1QWQJWu
	5pM0s27pVb1iJjSPd8u/Qh0x5eQa3LE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-iXSliJxXOxyCRKBkZKn1mw-1; Wed, 02 Jul 2025 16:58:51 -0400
X-MC-Unique: iXSliJxXOxyCRKBkZKn1mw-1
X-Mimecast-MFC-AGG-ID: iXSliJxXOxyCRKBkZKn1mw_1751489931
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso111371396d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 13:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489931; x=1752094731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOTU+d2v5BAWQ3IDOfILW9WYtvyZL2oUTXZsgcEBv+A=;
        b=LFs9LRf78RtDJtVkTqz7XqYMP8PuUGTW9tHt5b8tbhM4HjB9fA7Vnqn8TqONG/sf2T
         JSo3HLWLmjD+YLt+e9A+5l+advmYZf2EJwO8bjim8Lfx0g5WpFLRK+eHWn5sX6LiN9wn
         dV+A30XzPZPs0xA+gwPHQk9hUSMAsI6c62FzsnqcQvKljdFJ+LdUkXxIbzdkmq0+iFfr
         7DPW5MWVHYdkuW6GHVgEAOwovnsAWx1vaoasBE8LSouZ0wqOQt9twqBOryQb2LCgyTxJ
         rZqQpZxyjX87lyYdCbLywGdjV1Rb0uw98w8a6jqV3MTSOuA7qjAYGcIqXValghI/VnqB
         BdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhzbSPaFv/zEz7RSVuJ5AmA1L/WZ0zHFdX3f+vu2zmFBcvPPuwgwxj3JJ3bH7/vcVxfOxBvGYHSZTJRPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rhqvQiEykT3Uqx3FIaTEeBAikz51dlqBKbRC4YiqLylKdvlK
	jcqfnlXg2jrLSrKBsCxACx15Zusut1IRKn8DWEJqAP0NAO81+XX17SSQPBMW1HWzfa1rBkP4SIi
	hTe9Wy+Qf5f5g1KmKDCL8ROvhCID1y+RJp+pwTYBJXvo5OLojgCgo8LLwsN+cLS1juOvDv+95VA
	==
X-Gm-Gg: ASbGnctU9nv92PVhAzgaAY6GzGhLQ+FJ0+t+qOGFytvH2JRUYJGdzJW/MubvKsIU3hw
	nuZTP9wYej2PrI9gIc5qOXWi2+kNIJFZMy48vKTr2RbmbLpNa51UrPeTlwctbyFcxA1hyuR75an
	Ix6ARbu03l6YP+HhswCKH4m4eSVfRz0UiOVpsvuN0l3nCzwOiay9/YFDhvfRlyWI2hkF6KOCiZj
	vnQG9uo90eLqBk49Py+qw7A8A6BP8eUhcFJIYPEruNOI33MHwQbIUMHvZ1x0sfYkNA9YN0ZJVyz
	z0NlQ/OvMR0qDA==
X-Received: by 2002:a05:6214:2aa7:b0:6f8:e66b:578e with SMTP id 6a1803df08f44-702bcc67924mr11063106d6.32.1751489930980;
        Wed, 02 Jul 2025 13:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QOp1gP5d1ygXeemNGH1JhDJQDSPwFCZsqWpTNaKH+tPWObjk5CcB+1Hqk3D9Ifq7DRzEeg==
X-Received: by 2002:a05:6214:2aa7:b0:6f8:e66b:578e with SMTP id 6a1803df08f44-702bcc67924mr11062776d6.32.1751489930414;
        Wed, 02 Jul 2025 13:58:50 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718da94sm106707176d6.24.2025.07.02.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:58:49 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:58:46 -0400
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
Message-ID: <aGWdhnw7TKZKH5WM@x1.local>
References: <aFQkxg08fs7jwXnJ@x1.local>
 <20250619184041.GA10191@nvidia.com>
 <aFsMhnejq4fq6L8N@x1.local>
 <20250624234032.GC167785@nvidia.com>
 <aFtHbXFO1ZpAsnV8@x1.local>
 <20250625130711.GH167785@nvidia.com>
 <aFwt6wjuDzbWM4_C@x1.local>
 <20250625184154.GI167785@nvidia.com>
 <aFxNdDpIlx0fZoIN@x1.local>
 <20250630140537.GW167785@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630140537.GW167785@nvidia.com>

On Mon, Jun 30, 2025 at 11:05:37AM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 25, 2025 at 03:26:44PM -0400, Peter Xu wrote:
> > On Wed, Jun 25, 2025 at 03:41:54PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Jun 25, 2025 at 01:12:11PM -0400, Peter Xu wrote:
> > > 
> > > > After I read the two use cases, I mostly agree.  Just one trivial thing to
> > > > mention, it may not be direct map but vmap() (see io_region_init_ptr()).
> > > 
> > > If it is vmapped then this is all silly, you should vmap and mmmap
> > > using the same cache colouring and, AFAIK, pgoff is how this works for
> > > purely userspace.
> > > 
> > > Once vmap'd it should determine the cache colour and set the pgoff
> > > properly, then everything should already work no?
> > 
> > I don't yet see how to set the pgoff.  Here pgoff is passed from the
> > userspace, which follows io_uring's definition (per io_uring_mmap).
> 
> That's too bad
> 
> So you have to do it the other way and pass the pgoff to the vmap so
> the vmap ends up with the same colouring as a user VMa holding the
> same pages..

Not sure if I get that point, but.. it'll be hard to achieve at least.

The vmap() happens (submit/complete queues initializes) when io_uring
instance is created.  The mmap() happens later, and it can also happen
multiple times, so that all of the VAs got mmap()ed need to share the same
colouring with the vmap()..  In this case it sounds reasonable to me to
have the alignment done at mmap(), against the vmap() results.

> 
> > So if we want the new API to be proposed here, and make VFIO use it first
> > (while consider it to be applicable to all existing MMU users at least,
> > which I checked all of them so far now), I'd think this proper:
> > 
> >     int (*mmap_va_hint)(struct file *file, unsigned long *pgoff, size_t len);
> > 
> > The changes comparing to previous:
> > 
> >     (1) merged pgoff and *phys_pgoff parameters into one unsigned long, so
> >     the hook can adjust the pgoff for the va allocator to be used.  The
> >     adjustment will not be visible to future mmap() when VMA is created.
> 
> It seems functional, but the above is better, IMHO.

Do you mean we can start with no modification allowed on *pgoff?  I'd
prefer having *pgoff modifiable from the start, as it'll not only work for
io_uring / parisc above since the 1st day (so we don't need to introduce it
on top, modifying existing users..), but it'll also be cleaner to be used
in the current VFIO's use case.

> 
> >     (2) I renamed it to mmap_va_hint(), because *pgoff will be able to be
> >     updated, so it's not only about ordering, but "order" and "pgoff
> >     adjustment" hints that the core mm will use when calculating the VA.
> 
> Where does order come back though? Returns order?

Yes.

> 
> It seems viable

After I double check with the API above, I can go and prepare a new version.

Thanks a lot, Jason.

-- 
Peter Xu

