Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E014EC4B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307409; cv=none; b=fpcCw1zrq8j1GxrtKsII+60Qu7RAM4HODqu+Qfsz/YdyFlBUPnWsPR6PEKDWd7HppJbF6ArNVG87QG0KqvWdAxhCpaaAgCvPFSqSS2r+ERy+P3nA6MdQQJnlYluEUuaY9wsUqRh7dLzf/9MpYPR1Hj2lvaYMTFAehJ2pdw4AatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307409; c=relaxed/simple;
	bh=Z0JqpIJcM6VT183+ZlPPB+dIkXk+EqicX8onkU0JBmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSoWew7NvVRzcpqFf2sUtxbY04zxNWTB9yo/kuQahW/DFD5H50JPWnwcwXNjW5f9ipNoiBwxs3ziAeVcfJYuKjJWYZk6fdeML9tGV5vfECyQGZ4NSN5ewBaeSCa2cvOvnTXmrAavSJyJrsmk4qN6Nz0I9CpC/CMK/RLivOb7GT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pVOThwwm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pVOThwwm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gnn9O5bhwCUoZ2vwLg43aIO2C1sCiVIi/g5nxmb2czc=; b=pVOThwwmjvZXsFr9BMGV8UxkSZ
	T5jyWkdlHJtIINV5cREf438q20VcCAn6k/j3ije99Id45nD2c/dK6ispDDTj9N3cKY9KPzhMynVlM
	0Bbv6WiZYnNFcaMige5UvjemEiVwtSYihRhWdrWNPZ3D1nS4qkBbvVvAgcgApT7P9PEBtpkL6yGvy
	JC6XsHRCzfPU+RUJH5kDvM76AjqSgZrCxi1Xn6vluJ3dLt5H0CUC05bA4EW0g/S5O9TjTsL+pwcsr
	v2x0cvViqD8HXnKzxX4J6ecfrcSqqX7Jdzz8PsbeHrbQqq16+/FgKykqRhJZFMDS4z8dcp3v4Dj9E
	TGet5l8w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdlAF-0000000A5Wz-2jWd;
	Fri, 31 Jan 2025 07:10:07 +0000
Date: Thu, 30 Jan 2025 23:10:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, hch@infradead.org, urezki@gmail.com,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] vmalloc: Introduce vmap_file()
Message-ID: <Z5x3TwhAWadIV8oJ@infradead.org>
References: <20250131001806.92349-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131001806.92349-1-vishal.moola@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jan 30, 2025 at 04:18:04PM -0800, Vishal Moola (Oracle) wrote:
> Currently, users have to call vmap() or vmap_pfn() to map pages to
> kernel virtual space. vmap() requires the page references, and
> vmap_pfn() requires page pfns. If we have a file but no page references,
> we have to do extra work to map them.
> 
> Create a function, vmap_file(), to map a specified range of a given
> file to kernel virtual space. Also convert a user that benefits from
> vmap_file().

As far as I can tell there is exatly one user that maps file pages
into vmalloc space.  It's a pretty odd thing to do, so figuring out
a way to get rid of that might be a better use of time.

