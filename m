Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC2298C10
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082587; cv=none; b=npVDJI9CbLhubDBmx99EEOFQKmypaCMN+3Au9mJ7+ewH2x6n5uBonQByxjMh010/u4MVnKDZbG1fRwLUlbxWudT/7wsSQXxJ6NKrYBbqJpVlZORBkQeBLdjYJVA7Ks/Zj4QFq8fK2wVFIHAdAoa/rgL1o1HA3o/yIUAS8EGAnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082587; c=relaxed/simple;
	bh=WffPH9tOkFRcVLWqf7oL70scsB31LOLtusrXCFGW/pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJGTY3jxkhHPk7NvLoi0Ob0IQgwdQL6rasgwdEmzfWPs+6B4VfJE5OpvcZU0MI8jzCRRj8CmOXjVvp2vFZ/zIwCg1YEGSZ1azQWZjCO6SmHTyEUlUk1FZHdpjFl+N6hytLquQ3+VKnx1qqjr8yGZTh/5HdYbPSriFZP+qtVprrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=voj0E+GC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="voj0E+GC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wg98wcvMhHEl7nkgNnx0lyBV38Qm+zLVW0jUJJpZJQI=; b=voj0E+GC7GVujyZlzXngrUwDpq
	ju/2rNYOcZ4hm9/xnqhBDf7gRStSaRNgBijO9DlZC/vEszhTqs89cErNFh1e/AVDl3dGw0AVb7i7d
	XeQYmCvxNGE/7Xuz6Z1nUkhBnJeJpFYPufq8eGkZClCvJfI551LKpqw5PrPmzHe2jFzmYLfS+rp3g
	mrYUmBIQq9/DEDUvCPdoijq1GzJ5Iq89tQ7K4l3cajtI2sccui6tzs3Aauh+8LWITToyGS9KJUvm2
	8bQdacHFovxhE73TxyueEv55ppOIZDDjxSpGgkh/lGms9Ek2t8wh/d+Yvvy3MU/KQhDcAFL47eFMq
	EaB+D2Cg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZzF-0000000AEOU-3iUi;
	Mon, 12 May 2025 20:42:57 +0000
Date: Mon, 12 May 2025 21:42:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosryahmed@google.com,
	yosry.ahmed@linux.dev, chengming.zhou@linux.dev, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] page_io: zswap: do not crash the kernel on
 decompression failure
Message-ID: <aCJdUQ5Jpo5JmJpW@casper.infradead.org>
References: <20250306205011.784787-1-nphamcs@gmail.com>
 <aCJF74ILruXJOAkQ@casper.infradead.org>
 <CAKEwX=PZkb4+nA0YL_jSmr66roPoAiw5ZEN9nV9KqdwymAw-rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=PZkb4+nA0YL_jSmr66roPoAiw5ZEN9nV9KqdwymAw-rQ@mail.gmail.com>

On Mon, May 12, 2025 at 03:49:29PM -0400, Nhat Pham wrote:
> Not a bad idea, just no usecase yet. From the POV of
> zswap_decompress()'s callers, any decompression failure is handled the
> same way, no matter the cause.
> 
> Where it might be useful is the debug print statement right below
> this. However, zstd and lz4 only return 0 or -EINVAL, I think - not
> super useful.
> 
> https://github.com/torvalds/linux/blob/master/crypto/zstd.c#L163-L165
> https://github.com/torvalds/linux/blob/master/crypto/lz4.c#L61
> 
> Not sure about other compressors.

OK, fair enough.  If there's no better information to return, then
this way is fine.

> > (also i really dislike the chained approach:
> >
> >         decomp_ret = crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);
> >
> > that's much harder to understand than the two lines i have above)
> 
> I can send a style fix sometimes if people dislike this - no big deal :)
> 
> BTW, hopefully you don't mind the Suggested-by: tag. I know it
> deviated a bit from your original suggestion, but the main spirit of
> that suggestion remains, so I feel like I should credit you and Yosry.

The Suggested-by is appropriate, I think.
