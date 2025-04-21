Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DD19F42C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245654; cv=none; b=rqQXHvXQFlxNmLfvhQ4aFEN8hSqPiRj4Sg6Hc2rcVtWcNFExSoCjLxliaSvzqlUY5NSP0xNNm2UvSwPVydQHpE+t086bq9zDNebUMLZoGiX1cCver9K9jiBes/JofomuJTd69/CW2+Idjey1FBCtxUTQh65lv7+rRtjyx1qxWkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245654; c=relaxed/simple;
	bh=cvWak/FtVDINlP3w9NFQgGGjoUQOizrqtoV6iLldsy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZoq0YOmR5g3CaGJa5M0JdibR07SIASLewPx1F6gb+arYObQyQEhWTtRxE9sn0lBUKkROlt0XcXMiGYo9u4VO9Dvb4NyF29eczUfHBKdikR9aWpuHaxfUwSaj9kA20CqkNOqwJjCOlXxMiGTyuvyEPgvUB7sosDwX7r2ldc35Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHuisIuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHuisIuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E351C4CEE4;
	Mon, 21 Apr 2025 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745245654;
	bh=cvWak/FtVDINlP3w9NFQgGGjoUQOizrqtoV6iLldsy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHuisIuLLblwEP7kaCgO4UtMmpqnbCSbl44+vPqLCDpXp0V4TbRjSrKR3whS2/UHf
	 lZXpuHyFEHn+6Ec/OlyzgV9SnKK9zZRU023yobcA8SvS1duXCWsFaAnEFEt5iwBVLo
	 wAWD/KQJhGpBVBDXTvyiG19QKbIG2K/TSmZ29iaHuF7rPao6L4phM++MI8rVlDrbmd
	 ZEHiHYGScbdNEnKNFvY/OZvatrNcDhcwwiB8FoDsV3I/NoNFvDttrJfHEAJ7XImFq9
	 pbuI9afbck6IgGjefBZh+Gk3HuMFyw7OxQfWJ6ThkZD2iTTElfnT+CuWBSQNpO4Nju
	 OKfNnhC4gBCkA==
Date: Mon, 21 Apr 2025 08:27:31 -0600
From: Keith Busch <kbusch@kernel.org>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <aAZV04hiWIz2UT2E@kbusch-mbp.dhcp.thefacebook.com>
References: <CGME20250420164653epcas5p10dba2c638655fd4b16c6553d5125a3a0@epcas5p1.samsung.com>
 <20250420164450.1144416-1-csander@purestorage.com>
 <be873f40-d3c4-4f0e-8b36-dc6e4f5bcf48@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be873f40-d3c4-4f0e-8b36-dc6e4f5bcf48@samsung.com>

On Mon, Apr 21, 2025 at 12:43:24PM +0530, Kanchan Joshi wrote:
> On 4/20/2025 10:14 PM, Caleb Sander Mateos wrote:
> > struct nvme_dev {
> >   	struct nvme_queue *queues;
> >   	struct blk_mq_tag_set tagset;
> >   	struct blk_mq_tag_set admin_tagset;
> >   	u32 __iomem *dbs;
> >   	struct device *dev;
> > -	struct dma_pool *prp_page_pool;
> > -	struct dma_pool *prp_small_pool;
> > +	struct nvme_prp_dma_pools prp_pools[MAX_NUMNODES];
> 
> I wonder if it is worth to make this dynamic using nr_node_ids?

Yeah, I think so. MAX_NUMNODES is derived from a config value that may
be much larger than what the platform actually has.
