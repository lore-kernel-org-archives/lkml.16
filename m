Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA92E3382
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654611; cv=none; b=YIcTnfBybFb4eIWqJFnrnB8YyIo+rdsMG6f8NMAq2NMHLWdwHLSOrvp7fUOJx4Md5MUEoe6s7kf5p3fV0opwuF+Aqmtqy4H7TY5RMCLThjj0/SHwByp+Hc6D3klPMHYbBZLnXZIMqAEC8GnK6j7YOOMhzURwCywPr4P4CrcpZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654611; c=relaxed/simple;
	bh=cnbuDVPZ9hBkwHxIgpx9C4L1VWK+PUhUf//KmmrPg4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ye3BSzlY4UMd3j0OwNXrw9uP8C6otg0OWvwbml89MD+t92nrTOZ2WklLi+p9AAuQBo08dpDDT8OENbKEIPnciVE65KTvoemQBWuMI4N0PcRa0xdVFoKPeNqx8wflgYTJcAbQzHfk3NGJ9afXLpxr9XMD/AB7T4feUmDAeeDxRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3695768CFE; Thu,  3 Apr 2025 06:30:02 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:30:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: shaopeijie@cestc.cn
Cc: kbusch@kernel.org, sagi@grimberg.me, axboe@kernel.dk, hch@lst.de,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gechangzhong@cestc.cn, zhang.guanghui@cestc.cn
Subject: Re: [PATCH] Fix netns UAF introduced by commit 1be52169c348
Message-ID: <20250403043001.GA22526@lst.de>
References: <1f55b71d-8e28-4eac-b14e-d32a7e704578@cestc.cn> <20250401061934.2304210-1-shaopeijie@cestc.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401061934.2304210-1-shaopeijie@cestc.cn>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Apr 01, 2025 at 02:19:34PM +0800, shaopeijie@cestc.cn wrote:
> +	/* sock_create_kern() does not take a reference to
> +	 * current->nsproxy->net_ns, use init_net instead.
> +	 * This also avoid changing sock's netns from previous
> +	 * creator's netns to init_net when sock is re-created
> +	 * by nvme recovery path.
> +	 */

Kernel comment style is

	/*
	 * ....
	 */

> +	ret = sock_create_kern(&init_net,
>  			ctrl->addr.ss_family, SOCK_STREAM,
>  			IPPROTO_TCP, &queue->sock);

This can be realigned:

	ret = sock_create_kern(&init_net, ctrl->addr.ss_family, SOCK_STREAM,
 			IPPROTO_TCP, &queue->sock);

