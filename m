Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB51281351
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538093; cv=none; b=AlSQbqoA+hieh864Lb4Fmaus7ues9smAlCrSqDoTWA37Lrm+Bb39ZHRd4o2K01kUj/WoVrPEd485LRw/CKWfO0ZdxtdyzyrVeALDwP4DGu37KyuXEKyaU0pSo2F7JBmrYxyjHMHoIoOjy2rj9dSZR6/0ylYAEUWcLvzjyuKFwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538093; c=relaxed/simple;
	bh=yZq94mtxdAUS4lIj/pk0COyxQWfAPoyNluwhjEjtx9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVZdHCXqeg0ZJ4j7lyP0tV7lfIzjUQzsxYQHNkUZPEqktgNf2WsAqp5FiCf61G+bKooGKBhb5VDYJm6uswzloizIeICauE7KDypBqbBQgVLr0OY1ruXnuiAgcHnObgaC2dmnfE8f7DUWRoFGHB8XxVtsCSaI+3pKiwiycMbE+Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ldwYpiKm; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ldwYpiKm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hpIkIfNRzdkMG2WDLJ4VT+s4aYd+ehMC2pL6nQAZ2VE=; b=ldwYpiKmFpzGWRoOQ372AfHfnX
	lZ9eRw6XvHzEDTQAQUEX4L4gtbJLpftrSuoJ83Sw9AdXXDM/od9kCb/4AVgxOjGl5AIKrE0eudafB
	60pA6PuFFcDh45KOLwuo0Xt7OumLYvLnsnntdAGlLOxrsvDwDLk3TAAP4ObFmpWgXh89L65tfzI89
	Xyov6ZiuFY4qNbtJSWqOlEQiTd4HsMayAYEf2N36nahJVIqmP3dXC2xIi/JWq27EIjj2yith2GURz
	ewjo6Sf2P5JRia6r0WpIf541gggSyBNakhQGUb4IlGPLmMAEJXPQ0u5IcoMXe7jqN1XZ0n+0bjMdy
	lJgTWHSw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCIKr-003yFQ-2L;
	Tue, 06 May 2025 21:27:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 06 May 2025 21:27:49 +0800
Date: Tue, 6 May 2025 21:27:49 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Igor Belousov <igor.b@beldev.am>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <aBoOVajBDXkFNUBI@gondor.apana.org.au>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBoK7f7rtfbPFGap@google.com>

On Tue, May 06, 2025 at 01:13:17PM +0000, Yosry Ahmed wrote:
>
> Keep in mind that zswap_decompress() will always do an extra copy if the
> address returned by zpool_obj_read_begin() is a vmalloc address. To
> avoid this we need to enlighten the scatterlist API to work with vmalloc
> addresses.
> 
> (CC'ing Herbert as he was looking into this)

acomp now supports linear addresses so vmalloc can be sent through
directly.  It will fail if you use hardware offload though since
you can't DMA directly to vmalloc virtual addresses.

If you wish to support hardware offload, then you'll need to break
the vmalloc memory down page-by-page to create an SG list.

Adding Christoph to the cc list in case he knows of any updates in
this area (using vmalloc memory with DMA).

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
