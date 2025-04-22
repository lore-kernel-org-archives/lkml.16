Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640D1EF37A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309811; cv=none; b=JGWsCV+1Z6jrmn6s7YOhlr4IxS4B9ohDwMwDZ68HkpQ9DEGnqOgS26zuJ3EBbxtAmDGDA5nmRPYiKGvKKT1LT8TVnWh5vqE+3jw2Elnp4/Swl+yCY9kVR/4bBm5nqV9F0FrQDEcC+G3VMJznxMTQqRIUU+HllUFGDm+kaN0fJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309811; c=relaxed/simple;
	bh=8+AJtABvgFwXzYTxi5z5tHd7Yx6+/IBejIizWd/FsJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd2H4jkJTDzxuYgeDD6uZlxv4OeBxqmWGEq9s2bwJfA8XiCHSbNOkVTeH3E+dU+WYrwwJMw8019ozNFHzfCSVlxytSq1x3KoGjzXWGLSwg72AdiyFcLAL6pqeOwjIfm9iS/lt0Besa9RI5/ROXL9rP5a6li20T1NXZSdWh3aTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7E39A68AA6; Tue, 22 Apr 2025 10:16:44 +0200 (CEST)
Date: Tue, 22 Apr 2025 10:16:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard@sigma-star.at>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, kch@nvidia.com,
	sagi@grimberg.me, hch@lst.de, upstream+nvme@sigma-star.at,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [RFC PATCH] nvmet: Make blksize_shift configurable
Message-ID: <20250422081644.GB411@lst.de>
References: <20250418090834.2755289-1-richard@nod.at> <0e61c6e9-10bc-4272-b446-31e0d67547ce@kernel.org> <8418057.aG60p0z9Xu@anvil>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8418057.aG60p0z9Xu@anvil>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 18, 2025 at 11:56:30AM +0200, Richard Weinberger wrote:
> TBH, I'm not sure whether it makes actually sense for the bdev case to make
> blksize_shift configurable.

> It's also worth discussing whether we should limit blksize_shift to a specific
> range. Right now, any shift is accepted, and it is up to the user to
> use a sane value.

It should have a hard lower bound of 512 bytes (9) and for direct I/O and
the bdev backend the reported dio alignment.

The upper bound is capped by the nvme_lbaf field being a 8-bit value on
the wire, no real need to require anything lower than that probably.

