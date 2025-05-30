Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CF2367A2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624386; cv=none; b=A9G9MGPkZFpo22KjufV/BalWjTJdURxRVENEUxNxRvEDO98j2YUnfgjitKO7g7RFWr2XcSYRYUfKwsXdD8orYDKGxJYZdaLYHB80GQcu/s1FAX1MXtTKHcJ0BlKP7OQ1qoiQsqV2vVrnZt6kON4BT1oyrzQMskJ2GHW2PixXSRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624386; c=relaxed/simple;
	bh=VGWVZxESU05WmMt1edHXrx1Pg3sF9xmNIcrHlOd7m/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iis+c0o2TGoFBrhq9Z6RfuOTGJUUgJZqQQvInElWs5wqO+679RjbR3I1J4l2Vzcdqjp+vutZtaFnKFXr2xKI0difzX82hzx82dKGRpWUO8zC/C3L1zqAGtnZNvzzyK0fkeuFd953zS5ieKfJEuk19qyXIm7wAglJij+G03HjZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=blmAPTUY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="blmAPTUY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OoVTE1G1Q2DTmsRPkg5M4FIOu4586porR/MJ2EgcVZ0=; b=blmAPTUYi4GVtIclESrhPLyLyV
	XUtSy21zua9b85UF99ozhe6OTKejUOeegtLnmlVW+bIdOaqATGobMKkFvjvdpeiFylzVasSlBQj/F
	c0FyN5jdTU0gotUWdDjZOm/vOFG4qF1rEiNoPAYwhig2jHAMjuuQPbrG7mycRzX7LyRK8KxqY92kR
	uVZ4f+LfU4SMeiluegjIGPIyiUXpk/RfC9C62XQca5JH8eKlscB/wnJAVT/evRipNElrn5BtP8I1t
	pe2fV8HdPOw7z9qLpbjp8fpxLT+yfPxM2q6Q+mGMJZp0iZQdXdSfOJUM+PXVKhwAJTZ/x2lb+WlYK
	gtsdLimA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL34n-0000000G1yC-3tls;
	Fri, 30 May 2025 16:59:25 +0000
Date: Fri, 30 May 2025 17:59:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm, slab: use frozen pages for large kmalloc
Message-ID: <aDnj7QCvM1phrvEX@casper.infradead.org>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
 <20250529-frozen-pages-for-large-kmalloc-v1-1-b3aa52a8fa17@suse.cz>
 <aDiBUr38QArXjO6v@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDiBUr38QArXjO6v@google.com>

On Thu, May 29, 2025 at 03:46:26PM +0000, Roman Gushchin wrote:
> > @@ -1549,6 +1549,8 @@ static inline void get_page(struct page *page)
> >  	struct folio *folio = page_folio(page);
> >  	if (WARN_ON_ONCE(folio_test_slab(folio)))
> >  		return;
> > +	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
> > +		return;
> >  	folio_get(folio);
> 
> I guess eventually we can convert them to VM_WARN_ON_ONCE()?

Eventually they go away
