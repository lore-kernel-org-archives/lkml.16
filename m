Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B01FC8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684062; cv=none; b=GudQULFiLewuU6P4aGbk7FfMLUl4OTaWH9GJ1+oB8x5duqtRKCpkbUbJLh/SxFl+oFSqgBzP+xJ7u5fT46SEx48JZN8/8IGqCMImO/vqqAysFoYJx58zI3YLYWLcae+UGmNOMM4jY503H9k25QRQTdHOTXkXdtEMJdL9xU9k2I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684062; c=relaxed/simple;
	bh=F2fxwJ/tLGSJU1oVvK9x5TYZPPvQXrubBX+kuc6q548=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M06M+T2bo7Jti9GIDg6uFpTRUXkxohx20rYp6pyHFHIXuhLdq971U3XEmfcpuyb4Gz13drsNKK470Y3ujIM3Md3KzXHT7BkG8e8IoZxhv25O3kaXaP20KPWSVGeiPZHQ0crL02y2sE0quzKetu1grJxFLOXutOo8ebE1gxcYJWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ie2IgIec; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ie2IgIec"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xP0KRNJzx8RIi5c4Icq/a4y8dcse2YorRXigC3K0lXg=; b=ie2IgIec/ZYa01/g+Sw24Q4MSY
	SpRG0f2HZvWX6kvpAzqdgrIQA4eNtEwiTOBo4SOrRn8Tb6QK4YCaJ4pXGfCh4hGCgJEOSKqi+2iPW
	FIROq5//PLuWKnXXb2l9w6yj4NhVpmjCnKWHqBS0ltDqtJv+f6A2VI9Gb757Cglz7nxErak/LJklp
	9yGgimiGSHDi1zaFkhlSuabCJwZAkZnR+bZhAYqq0b81Uu6VhLaHhXUtPrh+ochrr47Dt9KAL09Gg
	WcPuUvlaCztFqJKhf4iFwnm4ypR7FVzOVcvXagKYyTeJoyIAdM6V4BtK9zAzXq9GrVvlwifC21Enu
	sH+iPBqg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuJR-0000000HQ39-3pJb;
	Thu, 08 May 2025 06:00:53 +0000
Date: Wed, 7 May 2025 23:00:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <aBxIlUYEPojTopek@infradead.org>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
 <aBsDj0IGQBJC_JMj@infradead.org>
 <unyov4aypoaotj56m5scgd4qtjfn2mceb4zdmtaek42dfqaq3t@lrrqwojlmudp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <unyov4aypoaotj56m5scgd4qtjfn2mceb4zdmtaek42dfqaq3t@lrrqwojlmudp>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, May 08, 2025 at 02:58:14PM +0900, Sergey Senozhatsky wrote:
> Oh, I didn't realize that zram was the only swap_slot_free_notify
> user.  zram already handles REQ_OP_DISCARD/REQ_OP_WRITE_ZEROES so
> I guess only swap-cluster needs some work.  Are there any
> blockers/complications on the swap-cluster side?

I think the reason it was added it was so that the discard can be
done non-blocking with a spinlock held.  Which seems a bit sketch
when calling into a driver anyway..

