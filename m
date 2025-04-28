Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216325F7BA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852494; cv=none; b=a2QdYOA1JhJSbOHOPWqJnnWVymFR/5gttJTVbFcd7/MAy+vgh+liQe5Fpz0ZaVk7x0NhLpmrAlr2g3j9vTkDw6lN2v+KBdchsf9GDlYVJBnU+E1AlYPEgraPe9gc8spTDq/gpn2ush8pIuQMx5VMRpdc6KmZwLiETdfHMQSESuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852494; c=relaxed/simple;
	bh=L6ftK1YtwSLWu98J7GlkvJulgQ+u3Pn+RMrpNruh2uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaFFQEnx9i6voDL9MWhV0ZXMJNGM2cJ2l3QsHOnPi2CEGNlzHXsQ/lFSkuqeWJ5syAr6dfe2MjUdwsEzfTPoo814Y9S9fw8ouzYaz6ljHVHwxUEIkxFAxmJHNWxK2SSRe7XBRMAkG8SL3TMzxPMNls/YzayUZh24uaqFF9LkTiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKomr+IC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKomr+IC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD34C4CEE4;
	Mon, 28 Apr 2025 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745852494;
	bh=L6ftK1YtwSLWu98J7GlkvJulgQ+u3Pn+RMrpNruh2uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKomr+ICxOawI2rdS0SCrvtRMfjWOcjyj8hcN9Uofmfmil44KIDpcxgbY8A2d+7L6
	 rRe/4m3GpyptKvl8EXKhKcuHo2ixiN6BruOJ4eII5btvDX05tka4qMe7SOiJgJhabY
	 JBg4ACLLwa84UreJSXs98zBiqUo6CoNGYq+pMdJ0hmmpXq3B/a0WU21ZHvvzMH4Nmz
	 RfRnyNK3uM892O8OIenalsk9zLHcpv4B/7UdBOGT5UoYLT8qWvhWkTsJ9rJwwvkXYh
	 PmyQRnOt1o16VtOr/Nx0GqRwXCsn3Fru7pXFiCnaOnxnWfkcRnnan4zXdebn4KJD+d
	 mMPrCSOViY5MA==
Date: Mon, 28 Apr 2025 09:01:31 -0600
From: Keith Busch <kbusch@kernel.org>
To: John Garry <john.g.garry@oracle.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dmapool: add NUMA affinity support
Message-ID: <aA-YS8Bv0kO75jdk@kbusch-mbp.dhcp.thefacebook.com>
References: <20250426020636.34355-1-csander@purestorage.com>
 <20250426020636.34355-2-csander@purestorage.com>
 <cb443e86-2639-4ed5-8d9c-00aa5e200f7e@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb443e86-2639-4ed5-8d9c-00aa5e200f7e@oracle.com>

On Mon, Apr 28, 2025 at 11:35:12AM +0100, John Garry wrote:
> >   static struct dma_page *pool_alloc_page(struct dma_pool *pool, gfp_t mem_flags)
> >   {
> >   	struct dma_page *page;
> > -	page = kmalloc(sizeof(*page), mem_flags);
> > +	page = kmalloc_node(sizeof(*page), mem_flags, pool->node);
> >   	if (!page)
> >   		return NULL;
> 
> For pool->node != NUMA_NO_NODE, pool->node == numa_node_id(), right? I
> mean, aren't we on a CPU in pool->node here?

Not necessarily. blk-mq hctx's could span numa nodes. We just want to
register the dma pool with whichever one is the first node.
