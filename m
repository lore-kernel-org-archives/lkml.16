Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF381211479
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600855; cv=none; b=MB1FF0+rNMSmo9ApNzqm+7rdmsq/Df9kgt+CqkWoqfHt48HH7bty0o1h8VMNLRshfdzpHR4AE5Bqy2R6+ucNEop7yEtNiDGe2e+VJEvU3WFNRpWnz+c3t9OMRzW3bsv03Pb1XpxycroNED8Jon4RfDNR6DVOshCWSloEdagwNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600855; c=relaxed/simple;
	bh=PtNzqmp20p/hblDiVAQTV2nsHx22vPusBRDkLdyzsvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb1dTNgCl+0hs9KqMUZ0X+6MbUDgqkgKLO6PlkpK5tjvWIXCOgLaM/OJeEUVKvnpqZHFwxf4a0JvyaYuJqYHK8fbemAL62GKiPKxtUxy0YMf3N1l5R938wSJzpWufVvP5PqNPKhgnIIoEsWufzHkPl59FZzdL1BWJ5YUUox48J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W0gADbho; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W0gADbho"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nmQLpf+AM+jFKpY32ZXiygXe9j4W/ZtuRVuOcJgme7U=; b=W0gADbhoZtP7n3LRtRmLU6FmEO
	4RUCFYXZKQnLHJKT3kOT1Gi1RESLVr3GNz27jAjWkMvMQPAUoJgoEdfb41EjR07nSN5xCWGZR/GJo
	og2VaibyqpEED6YPR/s4oJufqNMHqboZbExzTFgydLdDAYMqzOLHkRuuqo75gcEup0q5LYy3c5coX
	coHS7/KOCjw0KaqOOqT+H80xaq64jr88seYmeb4AqHgAiPWgnsp57ybndG8YRN/qfiEdSVuTyBBuF
	Ojn7FQtFq4fz6Pu5SHGNbIFvcEbH7T2q/Iqg8fnKQRi0LbOvvT8VGIsnBP2emMdreI1puF2LaAN1g
	2KW+vI1A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYfP-0000000ER09-34Tq;
	Wed, 07 May 2025 06:54:07 +0000
Date: Tue, 6 May 2025 23:54:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <aBsDj0IGQBJC_JMj@infradead.org>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, May 07, 2025 at 03:08:08PM +0900, Sergey Senozhatsky wrote:
> > This sounds interesting.  We might get rid of lots of memcpy()
> > in object read/write paths, and so on.  I don't know if 0-order
> > chaining was the only option for zsmalloc, or just happened to
> > be the first one.
> 
> I assume we might have problems with zspage release path.  vfree()
> should break .swap_slot_free_notify, as far as I can see.
> .swap_slot_free_notify is called under swap-cluster spin-lock,
> so if we free the last object in the zspage we cannot immediately
> free that zspage, because vfree() might_sleep().

Note that swap_slot_free_notify really needs to go away in favor
of just sending a discard bio.  Having special block ops for a
single user bypassing the proper block interface is not sustainable.

