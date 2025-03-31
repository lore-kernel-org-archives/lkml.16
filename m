Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C3C1E3DEB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436064; cv=none; b=rc6DOPKVHmYg1kTwNdHtCeIKredaK5XT7sLnSxg7CKymFyvDagIK3QmPuiOJ9tYU4MygdN8C33K1w4R+Kc8LcEeCJPw6mjfUhjGrr0lzs9JKchcJ58X1qtJjZschziGfC5rWleRwdonOIg5NCg0hDriPM3yI8vlnYF6gbyog0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436064; c=relaxed/simple;
	bh=N65N11WbY3TnN0lGxuuJ8Sj0UFk4DgnhH2qdHywl4dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBcB4ng3EUL8qkBxDmpI/DjrJDy1Tz3hykLn/5qSxq9kw3pkF0WxweivXWKHpGXQdfVrvBARxWpufdeA9InA859ho8p5tay1Dtkna9xIlSnKycbrcCc1uOXI/503bTur5HGFDOEknUVckFeKopmMIUfWHaT5hEXU1/ydRZJOjkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q7edpJoE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q7edpJoE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SXh35uPg1iE/+1CO75ediFu4mmjIMxL70GTXjgfW1so=; b=q7edpJoE9usUYRouv2k89Q9r6H
	GdXc9G2MYNbQs3K5a1UKdEL2T2RgYvcsaGuCXn/GJMEnKncEPVeJjpzUMMJjDr3o0V5thcD5kyHWy
	vXGaLkyUHJHqFIgezTeXs+iPHsWHbU2qX5ekT4QYPvsSk4q/y1DNfTfHMVgXe4QO0dZcM9vh6Oxhf
	8pObiEO038yIcjev4nv8Bgcy6OGNbYBAg0W1ftPMMfv4ZG6Gu9PxKRL5Qkzq2yimXFqO519XceYZK
	c+rCfETCSv6KVoln5q3FQMr/Ca12DVQW3owNRg8ih5QTgaU0uFHpuHxGlIXSy8k2b25YlI0jSL/Sy
	Fb4kC8Kg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHMP-0000000Ez3y-3Svx;
	Mon, 31 Mar 2025 15:47:37 +0000
Date: Mon, 31 Mar 2025 16:47:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 RESEND] intel_th: avoid using deprecated
 page->mapping, index fields
Message-ID: <Z-q5Gf57y9LEZcUE@casper.infradead.org>
References: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>

On Mon, Mar 31, 2025 at 01:56:08PM +0100, Lorenzo Stoakes wrote:
> Greg, as we're late in merge window obviously now, could you roll up into
> 6.15-rc1? Thanks!
> 
> This does not require backporting, as this is a critical change for mm
> moving forward, as page->index,mapping are deprecated and will be entirely
> removed extremely soon.

"extremely soon" as in "There are four places in the kernel which
currently use page->index, and three of them are gone once Andrew
sends his pull requests".  So this will be the last user, assuming
nobody else decides to add a user of page->index in the meantime.
