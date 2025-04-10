Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2641AAA1E;
	Thu, 10 Apr 2025 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303925; cv=none; b=sbydFO1yOEXoiIJBJtRqdFsHI+qd5uAZ3A0LrgH0GpT/8OtjQDka+bIMGB7ZoWh1QSbNtQOKUlO9nluLqJas2CHbzuIN+jXW2EulLWOuSzBW4IBEFRlTSli12bcL7szcUauv2TWP6s4cm0WCCo2c2pC/1k98zPYv0vKLlTq4Vq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303925; c=relaxed/simple;
	bh=h+pmHy2x2qcqGwPMErMQ2GPwatDQxp3usz35PZILRBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSWSXFtQ64OBtBMzJScRwvoM1PFQb9C+mLP23hoiCRYRSaMQqLj07NK4vdy4qCYmXZe7hClrtPQWuKH/LysPrJ3WLQfLcQQ1uW4n0pU2fN7rDt52cwtdAeg/5vlSD0u4+HVOiVhnmDmYdqNqmD2LjwgAbJteCLHM++mVuOblFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RAnFP+sa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RAnFP+sa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EjNA9E6fQoObQrEF9x/xR2bwcpg2cboOt/4jyue8tog=; b=RAnFP+sa8REHwREQhuJs2YHIWN
	OrZAs12oMxeWbpncHVB29giNb8cyVPFV3+HdAb/cmklF4kTJD8BRqCv4exsJXSKaiW7dMlbUE2hHr
	6rgi9NFwGz8ahECnVaFqrUK7nZu6YDFwiK+BHj3w1GQ+CEtykNrITzBxkTj4pqJiUfipuZUkHryYk
	FcoRDUUy751+rhrtNHwqavdxk62n4fXInDOnrKxh3cYuCP8m6EB01JqmoKvbOfJc3bUcP58GoemOM
	1W4ZmB951GNXPtbhO0Bcpxn93wdKB00fjmkCjI9efyEMQ5M5eQvjPtqEsh9cRwdCtzr+Y2WqmmMYv
	c2UMaN8A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2v83-000000039mo-2MIy;
	Thu, 10 Apr 2025 16:51:51 +0000
Date: Thu, 10 Apr 2025 17:51:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z_f3Jyac_o308ws-@casper.infradead.org>
References: <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
 <20250409125630.GI1778492@nvidia.com>
 <Z_Z8-BLWMkiWpaDY@kernel.org>
 <20250409153714.GK1778492@nvidia.com>
 <Z_aeEn7hKqGOG3Cf@kernel.org>
 <20250409162837.GN1778492@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409162837.GN1778492@nvidia.com>

On Wed, Apr 09, 2025 at 01:28:37PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 09, 2025 at 07:19:30PM +0300, Mike Rapoport wrote:
> > But we have memdesc today, it's struct page.
> 
> No, I don't think it is. struct page seems to be turning into
> something legacy that indicates the code has not been converted to the
> new stuff yet.

No, struct page will be with us for a while.  Possibly forever.  I have
started reluctantly talking about a future in which there aren't struct
pages, but it's really premature at this point.  That's a 2030 kind
of future.

For 2025-2029, we will still have alloc_page(s)().  It's just that
the size of struct page will be gradually shrinking over that time.

> > And when the data structure that memdesc points to will be allocated
> > separately folios won't make sense for order-0 allocations.
> 
> At that point the lowest level allocator function will be allocating
> the memdesc along with the struct page. Then folio will become
> restricted to only actual folio memdescs and alot of the type punning
> should go away. We are not there yet.

We'll have a few allocator functions.  There'll be a slab_alloc(),
folio_alloc(), pt_alloc() and so on.  I sketched out how these might
work last year:

https://kernelnewbies.org/MatthewWilcox/FolioAlloc

> > > The lowest allocator primitive returns folios, which can represent any
> > > order, and the caller casts to their own memdesc.
> > 
> > The lowest allocation primitive returns pages. 
> 
> Yes, but as I understand things, we should not be calling that
> interface in new code because we are trying to make 'struct page' go
> away.
> 
> Instead you should use the folio interfaces and cast to your own
> memdesc, or use an allocator interface that returns void * (ie slab)
> and never touch the struct page area.
> 
> AFAICT, and I just wrote one of these..

Casting is the best you can do today because I haven't provided a better
interface yet.

> > And I don't think folio will be a lowest primitive buddy returns anytime
> > soon if ever.
> 
> Maybe not internally, but driver facing, I think it should be true.
> 
> Like I just completely purged all struct page from the iommu code:
> 
> https://lore.kernel.org/linux-iommu/0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com/
> 
> I don't want some weird KHO interface that doesn't align with using
> __folio_alloc_node() and folio_put() as the lowest level allocator
> interface.

I think it's fine to say "the KHO interface doesn't support bare pages;
you must have a memdesc".  But I'm not sure that's the right approach.
