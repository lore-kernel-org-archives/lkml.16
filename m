Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4F1A2545
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745604179; cv=none; b=OX0MVefxce48tm3ydT7SL0IFcap23EaVKaSAb8CXmF/OTezzgJ1PoZuq96V3/hn931QUMThoUs7vjqZUOkZGs2uQCV29079shjJ/q/t6OqqgR3Kc3if6wKybKkD4j0lbZXtsNr4zDxBxRaqsRieASX08/IV4W54o80zCm7s00OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745604179; c=relaxed/simple;
	bh=GlHZ3nQIl/lKAjbzyAfvCDkSdKESLA3OEmyBcQjujck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToLASMn8+w22/O9kwC+a3N4pwW5tmI+KLuR1oyqCCrRAVQppIClJH9RHselrzxKHqmxGLtgkWD6LNBf1KSQ3x8Mt+HvH5p+XUfrKeKwtpfC7FSVZOE+sFExwufzqNITztCDFtjGy0EJUUYXb8iC1uXt1RYMuJcrY9N8l1S6MIUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rgkfw+BQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rgkfw+BQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFD1C4CEE4;
	Fri, 25 Apr 2025 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745604178;
	bh=GlHZ3nQIl/lKAjbzyAfvCDkSdKESLA3OEmyBcQjujck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rgkfw+BQTICZthivqCvV/L24rzpWQHbDcyxggr1y+m/v43rfeZ8mVc0gW9um7fv0b
	 8UafxsdBy2OSnbMDS5NFMohqw/JUMNlm1lLeRM9bksCbnWhkpvG1sMaT+pD4u+ffRH
	 8pIUlmyLfoSlvzGXqDwnfiebUuADE431RCYOd6tbrbLbvBjoynuBlQ5zFLUwzx+Bi4
	 rGux6Foo2lHXO20hT1/pHPb+gHQz9MKCOsluoedgGVWhhJf8tGKuOY5k2+/cT7G2O3
	 Lha8hXq2f86SbjO/kQE7iwnWqluHmT2utJrQpEDxaiqrLaVadzaMFYa480cXg0cBjW
	 /ZIf/+bOW5TJw==
Date: Fri, 25 Apr 2025 12:02:55 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <aAvOT8meWyuBpUpS@kbusch-mbp.dhcp.thefacebook.com>
References: <20250422220952.2111584-1-csander@purestorage.com>
 <20250422220952.2111584-4-csander@purestorage.com>
 <20250424141249.GA18970@lst.de>
 <aApbYhyeYcCifoYI@kbusch-mbp.dhcp.thefacebook.com>
 <20250425132111.GA5797@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425132111.GA5797@lst.de>

On Fri, Apr 25, 2025 at 03:21:11PM +0200, Christoph Hellwig wrote:
> On Thu, Apr 24, 2025 at 09:40:18AM -0600, Keith Busch wrote:
> > The dmapool allocates dma coherent memory, and it's mapped for the
> > remainder of lifetime of the pool. Allocating slab memory and dma
> > mapping per-io would be pretty costly in comparison, I think.
> 
> True.  Although we don't even need dma coherent memory, a single
> cache writeback after writing the PRPs/SGLs would probably be more
> efficient on not cache coherent platforms.  But no one really cares
> about performance on those anyway..

Sure, but it's not just about non-coherent platform performance
concerns. Allocations out of the dma pool are iommu mapped if necessary
too. We frequently allocate and free these lists, and the dmapool makes
it quick and easy to reuse previously mapped memory.
