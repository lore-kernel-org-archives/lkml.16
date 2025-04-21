Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E71B85FD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253243; cv=none; b=hrvLOFB6mTrcxOgmEc5mo1YAmpZaTxOTWsiWoQbNhZI7B7o4gvAakYswmHW/k2gdaWMxBGELDMVzHysY6kjq0iNcWnlNDurZDSJbgZ88s/qQxAhKA5ob4lGJl6RYYB5gPH1AfdJLuSqrtREaXzKk823r6GCgDZKdJUkbc6Q1rds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253243; c=relaxed/simple;
	bh=ii11Zr+Updew/MOUDrq24J55rAYYFktZ0u9SMNEKDb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2ygwaHPS9qfORn2GrEdI7V8uDRxqDNmFSHUTiYEWcZb2uhBWnDZxcXJzn9J4Y5bdmPEMSN2mhEc6GLbeJ4itYIF7OScuduv3A6bf3eYvQ/nJqzBCZC29PJrRvW01bvQ8sIOJgduzqIRrX/KbkNrUufGOFtvWTjjJTfye8UIrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeJ/fptO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeJ/fptO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F71C4CEE4;
	Mon, 21 Apr 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745253242;
	bh=ii11Zr+Updew/MOUDrq24J55rAYYFktZ0u9SMNEKDb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeJ/fptOWN3ZzdCtkjX88KJ3DRrra2qBbWUPxjrmqqFZ//JvENlW8AWYdHH4QRHNd
	 ANiVXWqymXWcIjWXo1REZ7Re6F2t2cYNbMKPhM/Rq21x9K1MyMD9fJQiTXX9CSNg4M
	 eWIhUWMZExrMytcHKiC/fF5IfJzInn/FgSQj/H6WLM8TD/Esh4F4lSlW5IBFSKxcJM
	 4+AQcDh2sCtOtAveocLY9ljxg+w59z/yclzhVr8gARJD7/Ncrk2XjyA33ttHyp9y6Q
	 zYVwQ5bFBxtA73MUgxwuH1qkvVR2vban7XC6xpRL2+O4FAG3VwagVc1UFRs0EmFMs+
	 k5b+4SaaQjB9Q==
Date: Mon, 21 Apr 2025 10:33:59 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] nvme/pci: make PRP list DMA pools per-NUMA-node
Message-ID: <aAZzd-9YjBP4IyNK@kbusch-mbp.dhcp.thefacebook.com>
References: <20250421161725.1610286-1-csander@purestorage.com>
 <20250421161725.1610286-3-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421161725.1610286-3-csander@purestorage.com>

On Mon, Apr 21, 2025 at 10:17:25AM -0600, Caleb Sander Mateos wrote:
> +static void nvme_release_prp_pools(struct nvme_dev *dev)
> +{
> +	struct nvme_prp_dma_pools *pools_end = dev->prp_pools + nr_node_ids;
> +	struct nvme_prp_dma_pools *prp_pools;
> +
> +	for (prp_pools = dev->prp_pools; prp_pools < pools_end; prp_pools++) {
> +		if (!prp_pools->small)
> +			continue;
> +
> +		dma_pool_destroy(prp_pools->large);
> +		dma_pool_destroy(prp_pools->small);
> +	}
> +}

A minor difference in style, I think indexing looks cleaner than
incrementing pointers: 

static void nvme_release_prp_pools(struct nvme_dev *dev)
{
	int i;

	for (i = 0; i < nr_node_ids; i++) {
		dma_pool_destroy(dev->prp_pools[i].small);
		dma_pool_destroy(dev->prp_pools[i].large);
	}
}

Note, dma_pool_destroy() already checks for NULL, so no need to check
before calling it.
