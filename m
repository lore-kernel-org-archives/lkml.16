Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54E290BB9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339647; cv=none; b=osfhwJy95zhSY0qZExus6Hm6mGySL+epIBCsS1/Bj09YcmM/OIHi5Ju/6Yr+UfloK1LeNgvOf1K92lmzR24hH1LB+scrK6kvkjeY9Jmhdx+S1I+T0Lje+hgnCkFFZde9qqNhD8iPWOLHowjqBtfUVnhDS7eh3/Z4F1ZPsQnWZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339647; c=relaxed/simple;
	bh=2HX9NnIdWdyEKGSVqKyROEqpVfX1aEeaCkk+QgIbE2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/VUNo4Da44bAuPFJa4epFhE8y3pSnu19Th0HkH2hf1I1qJfsTkS2I83awK1qmyVUfQO73WsiHj3PlDC+N/Z3YZ+IulH0lzcz4MDXgn7SGrJctahvXysDAbL3OlSvsUD65O0lDTZjI5XFpRW1A60LEHTwcEuAymBaoGS+GHnxek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ygfp0wn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ygfp0wn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2852C4CEE9;
	Tue, 22 Apr 2025 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745339647;
	bh=2HX9NnIdWdyEKGSVqKyROEqpVfX1aEeaCkk+QgIbE2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ygfp0wn02RZZnWptASc2GOcVr3uW5p1gSPFTeEYMLPZVxU4TWqJ0CHAcHbLAWtb0h
	 NcwH9r/PCuHaHq/SoWCLdk83KNK6jXdNw5nO39qzi4OrLF7DU9jhFCpZaXNB+HXjI8
	 Bs9gTFhqGmmhDc+qRw9hxt3YNMsXTa/ZHnh586VBNVph+nmUzqTXeR7e4dnatGvl4Y
	 ZsmBGL7IfrktutcMlsrEYJo/lGE+//KIIsviTLBaLEA4nK8YikHiAUjWJW9kA7lWqv
	 mEj/mCcETLvVDkfDGc/FMWYUUoB6FQx4Vlxtog8WIltv/J/pSl6JPAv/QXMpUe2qp7
	 FH5T4p6YZ2zRQ==
Date: Tue, 22 Apr 2025 10:34:05 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <aAfE_eofwrOIQ3Sw@kbusch-mbp.dhcp.thefacebook.com>
References: <20250422161959.1958205-1-csander@purestorage.com>
 <20250422161959.1958205-3-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422161959.1958205-3-csander@purestorage.com>

On Tue, Apr 22, 2025 at 10:19:59AM -0600, Caleb Sander Mateos wrote:
> NVMe commands with more than 4 KB of data allocate PRP list pages from
> the per-nvme_device dma_pool prp_page_pool or prp_small_pool. Each call
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
> 
> As a compromise, allocate per-NUMA-node PRP list DMA pools. Map each
> nvme_queue to the set of DMA pools corresponding to its device and its
> hctx's NUMA node. This reduces the _raw_spin_lock_irqsave overhead by
> about half, to 1.2%. Preventing the sharing of PRP list pages across
> NUMA nodes also makes them cheaper to initialize.

I was hoping for an even greater improvement, but still good. Maybe we
can do slightly better if we also pass the numa_node to
dma_pool_create() and allocate the 'struct dma_pool' on the same node
that's going to use it.

Looks good,

Reviewed-by: Keith Busch <kbusch@kernel.org>
