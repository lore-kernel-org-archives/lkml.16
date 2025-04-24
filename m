Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0C1B414E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509221; cv=none; b=DNS50iHH71IIqs/9DcdkWI9N1W6OhDeFQX55O+p5aPWO1c1EtR3lWp6g+hsAN6ygEJga4xCSGMr5c11krw6ed4dubYewRC76TRbVlTlZicxD0oUfkFcOK5rHtWjPo7obKe4g6Zm4L+Qowkb3yiuemlYeBUaVWicYaFkRZeUd07c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509221; c=relaxed/simple;
	bh=m79yZBVMxE4AA+f552+EtExtizaGN1TqMSESd2aS1SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7/m4O78lP2vOltrdrDHEKkuDY8p85oWUC4ektVltFYiZtNdCIZJ2F/gJKDwKe737084oVyiy7tL5FhMP88crrZQ1h2u40RnkRQjLfzMfkmJPqoVrRf+IgfevxUl/5xhW7kbvPH8SXcHxTgxRZEt/nAqEHk5VwBZ+C1p4bcqYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4SnX1Sp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4SnX1Sp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A503BC4CEE3;
	Thu, 24 Apr 2025 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745509221;
	bh=m79yZBVMxE4AA+f552+EtExtizaGN1TqMSESd2aS1SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4SnX1SpGM96KuxInmm2t03yLng6qqivRc2wHB4xd8CtP+uvMU7jkKFpKZe45BteH
	 zqcj1DUZMShku6uzUtSBDI5rx5uEh1QHaFhgPxUGwXNZbuShRbDVG+xHDAzy3OPROr
	 rU+2l58DxT4fbGkZO8xoTv6BlTIx00VCgB+eat7UHHYIaDKSumURqvQC09O/ZPdBkK
	 0HQGmwElb4FhGgmcEB25UvRzoltQujcCwEWIvnR1GDjHtHFmnfnlwYXFHVMuRoNIDH
	 x9AJZp8qsMfWve6AsPQDHkOEovPrQ+qb5dceT168S5fh8FnQW7YJsliQPupcjWm/1m
	 HGS+iQba20kDw==
Date: Thu, 24 Apr 2025 09:40:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <aApbYhyeYcCifoYI@kbusch-mbp.dhcp.thefacebook.com>
References: <20250422220952.2111584-1-csander@purestorage.com>
 <20250422220952.2111584-4-csander@purestorage.com>
 <20250424141249.GA18970@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424141249.GA18970@lst.de>

On Thu, Apr 24, 2025 at 04:12:49PM +0200, Christoph Hellwig wrote:
> On Tue, Apr 22, 2025 at 04:09:52PM -0600, Caleb Sander Mateos wrote:
> > NVMe commands with more than 4 KB of data allocate PRP list pages from
> > the per-nvme_device dma_pool prp_page_pool or prp_small_pool.
> 
> That's not actually true.  We can transfer all of the MDTS without a
> single pool allocation when using SGLs.

Let's just change it to say discontiguous data, then.

Though even wtih PRP's, you could transfer up to 8k without allocating a
list, if its address is 4k aligned.
 
> > Each call
> > to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool spinlock.
> > These device-global spinlocks are a significant source of contention
> > when many CPUs are submitting to the same NVMe devices. On a workload
> > issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2 NUMA nodes
> > to 23 NVMe devices, we observed 2.4% of CPU time spent in
> > _raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.
> > 
> > Ideally, the dma_pools would be per-hctx to minimize
> > contention. But that could impose considerable resource costs in a
> > system with many NVMe devices and CPUs.
> 
> Should we try to simply do a slab allocation first and only allocate
> from the dmapool when that fails?  That should give you all the
> scalability from the slab allocator without very little downsides.

The dmapool allocates dma coherent memory, and it's mapped for the
remainder of lifetime of the pool. Allocating slab memory and dma
mapping per-io would be pretty costly in comparison, I think.
