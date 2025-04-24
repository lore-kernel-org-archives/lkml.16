Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9154F81
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503979; cv=none; b=AZkbCtYCwAGO1GP4kVt80ulBHVQfTko5bywVgvWySzzvhCqjLphn8wLfte2OB5noeIAwqOG2eet5aSKwHXXyWBF5E02/Ze/h4YzJKSUiqDHutklR8dBpVwwY+y0rehgybJebjtMvzFQBTpCveFCgwjzn6na62cPEHkchux9DYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503979; c=relaxed/simple;
	bh=0wGj4KW+DayUWRtnjV7LyncVJ+JWm5POBbmEXTwI7JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6GRCuj5AiQ7zeGYrxKe061O7ku571VQyLd0WDcDr3lfVIQSvEmnVEvxlvKPn+TUxhUCZRfOlJdq6rw3ujnqkm8562MC98cY53ZWlmCLoOYBlL3C5GeqKRK1ktZ9gkHDnrN54MKFm/4ZjrLHDyMjEnXV99iwqMzZE4nBjvvo3E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 748D468AFE; Thu, 24 Apr 2025 16:12:49 +0200 (CEST)
Date: Thu, 24 Apr 2025 16:12:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <20250424141249.GA18970@lst.de>
References: <20250422220952.2111584-1-csander@purestorage.com> <20250422220952.2111584-4-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422220952.2111584-4-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Apr 22, 2025 at 04:09:52PM -0600, Caleb Sander Mateos wrote:
> NVMe commands with more than 4 KB of data allocate PRP list pages from
> the per-nvme_device dma_pool prp_page_pool or prp_small_pool.

That's not actually true.  We can transfer all of the MDTS without a
single pool allocation when using SGLs.

> Each call
> to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool spinlock.
> These device-global spinlocks are a significant source of contention
> when many CPUs are submitting to the same NVMe devices. On a workload
> issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2 NUMA nodes
> to 23 NVMe devices, we observed 2.4% of CPU time spent in
> _raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.
> 
> Ideally, the dma_pools would be per-hctx to minimize
> contention. But that could impose considerable resource costs in a
> system with many NVMe devices and CPUs.

Should we try to simply do a slab allocation first and only allocate
from the dmapool when that fails?  That should give you all the
scalability from the slab allocator without very little downsides.

