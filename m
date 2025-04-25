Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CCB253939
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587281; cv=none; b=Yg3hFtalitCQcKF/Q+7UdUMzR9imIFgt75D00lfUqfHjft+stlCvka7KYoMsKmQc4zS9+nu+speFRuN7r5VwSR303G0bmf5ElkjUlUvd3IrYO13BUAfu/HJg8auDhWL0V/qaaHZb4FD0bhgNID1BdIeaVUyrLto0Lw9q8g9G24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587281; c=relaxed/simple;
	bh=/494NBtHMPTGxIZF0dVKjTyBHLOGhJNYiJBjmyhTwEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3rsaaV3cqEx93Dxw48E0Hw2NInmLXe9Z8qhlga1Q3bv0Da9wxLQK783fLTzGiBTVeR7PRIvEAZRYQKlBmrQj9tHBOlC59BX9Hw0bWnTkJw2W9p1TAG96bzzDeCBZInyGN1IY0EBhX+a5+2tK08JpaEwk50zubmkkRFOacNpp0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 596F968B05; Fri, 25 Apr 2025 15:21:12 +0200 (CEST)
Date: Fri, 25 Apr 2025 15:21:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <20250425132111.GA5797@lst.de>
References: <20250422220952.2111584-1-csander@purestorage.com> <20250422220952.2111584-4-csander@purestorage.com> <20250424141249.GA18970@lst.de> <aApbYhyeYcCifoYI@kbusch-mbp.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aApbYhyeYcCifoYI@kbusch-mbp.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 24, 2025 at 09:40:18AM -0600, Keith Busch wrote:
> On Thu, Apr 24, 2025 at 04:12:49PM +0200, Christoph Hellwig wrote:
> > On Tue, Apr 22, 2025 at 04:09:52PM -0600, Caleb Sander Mateos wrote:
> > > NVMe commands with more than 4 KB of data allocate PRP list pages from
> > > the per-nvme_device dma_pool prp_page_pool or prp_small_pool.
> > 
> > That's not actually true.  We can transfer all of the MDTS without a
> > single pool allocation when using SGLs.
> 
> Let's just change it to say discontiguous data, then.
> 
> Though even wtih PRP's, you could transfer up to 8k without allocating a
> list, if its address is 4k aligned.

Yeah.

> > Should we try to simply do a slab allocation first and only allocate
> > from the dmapool when that fails?  That should give you all the
> > scalability from the slab allocator without very little downsides.
> 
> The dmapool allocates dma coherent memory, and it's mapped for the
> remainder of lifetime of the pool. Allocating slab memory and dma
> mapping per-io would be pretty costly in comparison, I think.

True.  Although we don't even need dma coherent memory, a single
cache writeback after writing the PRPs/SGLs would probably be more
efficient on not cache coherent platforms.  But no one really cares
about performance on those anyway..
