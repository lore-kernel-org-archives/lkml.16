Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D132E3382
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654640; cv=none; b=Tsf2YMBp1+UPHF3Yu+uecLrZFwCy0YIRAwmsJiQC+JGQPjHBneit32z5Cv+mzBG2OOGj/78UGuEkYpPGQllhcoeoefnohPxcp//w7S4givmIfZc6PTYqLgZhq62W2YJDPCMoCyXvPV7CJCI5wuOX9k3URRdHK5PPTdmEiDRhS3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654640; c=relaxed/simple;
	bh=yjA7552oAT7a5Mm6wFiZzPGs+RIX1W+sbvchKZI/C8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1KRhw6Y5M5HLW8v77sP7sx/iV+NPZ62igiRUmYch1Y66l6dZ5YGlHYWbXUPW+IHCiEobQJJtNVOhVPNcy+AlqpB3CcS8XdnBMOH8bMsY5XvESpO1+54Bo3/bzkg2T98/9VqFIg8R3YbItOQltcYS0qVfw38p8h4Lm8Gc+DcY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6FFE568CFE; Thu,  3 Apr 2025 06:30:34 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:30:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: shaopeijie@cestc.cn
Cc: kbusch@kernel.org, sagi@grimberg.me, axboe@kernel.dk, hch@lst.de,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gechangzhong@cestc.cn, zhang.guanghui@cestc.cn
Subject: Re: [PATCH] Fix netns UAF introduced by commit 1be52169c348
Message-ID: <20250403043034.GB22526@lst.de>
References: <1f55b71d-8e28-4eac-b14e-d32a7e704578@cestc.cn> <20250401061934.2304210-1-shaopeijie@cestc.cn> <20250403043001.GA22526@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403043001.GA22526@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 03, 2025 at 06:30:01AM +0200, Christoph Hellwig wrote:
> > +	ret = sock_create_kern(&init_net,
> >  			ctrl->addr.ss_family, SOCK_STREAM,
> >  			IPPROTO_TCP, &queue->sock);
> 
> This can be realigned:
> 
> 	ret = sock_create_kern(&init_net, ctrl->addr.ss_family, SOCK_STREAM,
>  			IPPROTO_TCP, &queue->sock);

Also did the original patch get merged already?  If not please fold
both into a single one.
