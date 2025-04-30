Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B35C2AE8B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018732; cv=none; b=cHCq5Ua8oKdP6XrW9N6zr8qxpPBoD9aagNnWOsSvXoV5XXfMdhlecnMCtXolmiNGpGKtp6k0DKHs9QOfiMoxz9Xz/WeGdO6Svdlthl0gvzHohpnUurIFuiYI61/Pc+FwvP/zlk9CtmL6ZEUbfRrPoGErxBK8ehtln1MEVc8bXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018732; c=relaxed/simple;
	bh=mM3rq4Kn9Xsl23kjwKh7u3CTXjrbYnW3HO8imw9HZLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr6VHiZk8/j+lFQQ6SXo+GX3vvf2Q5pFqNb6uv7AIB8iNgqOfd0ue3iTNOIANTRASkOUAixMzh9g0nExka8Fxpl3sBD5I0GEq/mY3V3HkL2oSctBz/M131QXpF1GSa5Jk4rVRWw7JIU3P/RjeNSh669a+0GkCbRMENSdetDw/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8C43A67373; Wed, 30 Apr 2025 15:12:07 +0200 (CEST)
Date: Wed, 30 Apr 2025 15:12:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Liang <mliang@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] nvme-tcp: fix possible data corruption caused
 by premature queue removal and I/O failover
Message-ID: <20250430131207.GB2191@lst.de>
References: <20250429163944.tvyrxt7z6c55abk2@purestorage.com> <20250429164201.cmrhsz5p45q4ceca@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429164201.cmrhsz5p45q4ceca@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.15 with a bit of commit log tweaking to avoid the
overly long lines.

