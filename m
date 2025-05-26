Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8816419
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748287227; cv=none; b=PZcKFk34XjSUJHaezo3VoBmJ21JrLlPs1ky2RQ+eNvzjbZgwMYWtosHblPMRfYtxtjZ/PQwApGVfMU8lFGrEoS9dgidHYKqF2xy77Xn3sRanwXCPnydFe6oKiQ8edudmt7dCSjZ40cG0lEFU/kbyb0ctm5IPiSXD4Oavq+8vfaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748287227; c=relaxed/simple;
	bh=mj+YOtG9RKyY5FyiIyBurmUulpwxvT7M/OYIKBk3R9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmsaOMPiVyX/bVqZcL3I184NozjhlPCdgr3gqT6zdDL0FOgaUDRGbztussMxEFh2fUz/tUhx4CvAIfMCTwo5vZLEdvweBzqSabza8nqVQyEu+/OAUKEcc5pLqgH0eDKKTrqN8pk+xXT5XOkSNDSIeZI7ZuiLzVjLGiPiJD2k/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mWuKe3fM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mWuKe3fM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/NV95irI55Pn1dIUahTxJbOhFuCF2L936tCyrHrEDOw=; b=mWuKe3fMkNYKRWGZTn06GzCwN3
	c5T6RoXqWCwAiaZgUGe+oeBPGkveBahHBRpq4j6S5lYN0oqQmJA+0AoxXbTNuts07VNQpkUSFtr4E
	MWyYN2kg+Ti/16X88hmrTqnH7y2YR8+f0VfHEn+IVtMpMizG0WMYOgP47U0w+MG5Z60BjCLzM60kW
	j9woTWwVisxlzOR/ppM2pzIU6TwR05hzpZLXmVL7YJBTZ/KvcrVXoOuKjbrUvYZcG8U/c/vErGKe3
	ak83Ewy7gog65JpqXdbRueRrUy0dACvWCZp1N2jTxC7M5D7NMh/E0dbAm6TbHeSy/k0Owud3QFtKx
	tSxDN0OA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdMv-0000000BiV3-36jl;
	Mon, 26 May 2025 19:20:17 +0000
Date: Mon, 26 May 2025 20:20:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, ziy@nvidia.com, dhowells@redhat.com,
	hughd@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, aneesh.kumar@kernel.org
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
Message-ID: <aDS-8RigFM-ii2mz@casper.infradead.org>
References: <20250526063524.22597-1-dev.jain@arm.com>
 <8da60934-0670-4f8a-8bde-fa4de320cdbb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8da60934-0670-4f8a-8bde-fa4de320cdbb@redhat.com>

On Mon, May 26, 2025 at 09:40:06AM +0200, David Hildenbrand wrote:
> On 26.05.25 08:35, Dev Jain wrote:
> > Hello all,
> > 
> > After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
> > on the folio, and we do an xas_reload(). Is this just to reduce the time window
> > for a race?
> > 
> > If the above is true, then, there is a negligible window between xas_load() and
> > xas_reload(), because only xas_retry() exists between them, so why to even reload()?
> 
> The usual sequence for the pagecache is (see filemap_get_entry())
> 
> 1) xas_load(): Load the entry
> 
> 2) xas_retry(): Test if we have to retry immediately
> 
> 3) folio || xa_is_value(folio): check if the entry stores a folio
> 
> 4) folio_try_get(): try getting a folio reference, might get freed
>    concurrently, so a folio_get() is not safe
> 
> 5) folio != xas_reload(&xas): recheck whether the entry was changed
>    concurrently
> 
> iter_xarray_get_pages()->iter_xarray_populate_pages() works on whatever
> xarray was provided to iov_iter_xarray().
> 
> erofs/netfs/orangefs seem to pass the pagecache ... so I would also assume
> that we have to use the same sequence as above.
> 
> Willy and me had a look ad that code in b57f4f4f186d ("iov_iter: convert
> iter_xarray_populate_pages() to use folios").
> 
> But looking at it now, I think that code is incorrect. At least the
> folio_get() and reload-before-folio-get is weird.

Well, I just converted it; I didn't think hard about what it was doing
was right.  I think I may have mentioned to dhowells that I thought the
xas_reload() was unnecessary as the folios are required to be referenced
by the caller.  So if you can look them up, they're guaranteed to not
be replaced [1].

[1] the xas_retry() cannot be skipped as it guards against a rearrangement
of the tree which can happen even with the folio pinned.
