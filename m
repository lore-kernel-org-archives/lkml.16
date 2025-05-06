Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70D264620
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538635; cv=none; b=R/IEIfT6yCJDAEofYS6aLBzevZtVXvOIvixRa+atc9Vw90Mhq9xtLJoTBssiIKiW7Nm7b0jhMPFHhawThtrBkGz+OTzJap/HIH62dRXpVyTY+srie9Lrqph5vXc4u78t1AD1aQw1tPEhkA9e3ZRwGGKOQxamLuUuduTC2W9eBF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538635; c=relaxed/simple;
	bh=V5fcW8ga44Yc49gkxlzh8VXaJ1EatD8XSXe24C6aTTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfPP41qsTbMrnjRtSI/S5Lf/cLl1LsrZl+YXTmI/ouWZSAyoAW+1rTHUnYPqP6dWLs8YYCJFNDRyYbUhp1M1r7FPQxm1vMZqhaZyEMCwTLZ8w1rfLGvyS92/hRU7I5hcFcNGca+V0zigwZ9+2zAeE3Tr2GgVEPQVd4un3dRomnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 68FD168B05; Tue,  6 May 2025 15:37:07 +0200 (CEST)
Date: Tue, 6 May 2025 15:37:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Igor Belousov <igor.b@beldev.am>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <20250506133706.GA29215@lst.de>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se> <aBoK7f7rtfbPFGap@google.com> <aBoOVajBDXkFNUBI@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBoOVajBDXkFNUBI@gondor.apana.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, May 06, 2025 at 09:27:49PM +0800, Herbert Xu wrote:
> On Tue, May 06, 2025 at 01:13:17PM +0000, Yosry Ahmed wrote:
> >
> > Keep in mind that zswap_decompress() will always do an extra copy if the
> > address returned by zpool_obj_read_begin() is a vmalloc address. To
> > avoid this we need to enlighten the scatterlist API to work with vmalloc
> > addresses.
> > 
> > (CC'ing Herbert as he was looking into this)
> 
> acomp now supports linear addresses so vmalloc can be sent through
> directly.  It will fail if you use hardware offload though since
> you can't DMA directly to vmalloc virtual addresses.

You absolutely can and lots of code does.

