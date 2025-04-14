Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988271747
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641242; cv=none; b=E0wtmUNhVwVbTYtLz1kmDds3xwTXC3nonE/7pS/y1xD1idSMVnCO+x8iNMEac+qKanrcfIATsT29pfMSoZGNtYi5uGLUEOFpys3cGkS0mXZitRmmt9Yg1XHQzPkbTj3sNIHjrsc40nwyoC2XrauHnl/lqErXd+q87rOqW/yibvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641242; c=relaxed/simple;
	bh=/+t9QGXKXVa8bBwAa0QnI4RGKt1VeKHvfIcG+xkD0lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ni4XdzyUbXuyDf7pG5fuw+HlqkDt5Dy91fKdaY7ENlqlY5jOo6dzvPXzPKVgqS6eeKZ4D26HLrfidZKR0sohz5L0KoiADHrPKodIznDyNOYKzcKuoR8VBaxZoN7OiSienfq+1WpM2qh63i4NiJnKxNQija4NbC1bl7tgRxNHskQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uRjELT/u; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uRjELT/u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CFFuaE3R++59vy9qAwSLJRf4+vACp6JZp4jAVAd37A4=; b=uRjELT/uOghvev/ARt9ySpgm7A
	83KlC5nxntNIehT2YKvjwABxysnbNUhJdoYyWCgUgJN/be+lKCYiw7Q85RWpail6YZwSrVaN+Rxd8
	AYp+Q1sv/G1RnMsxLBfvbG+TizCjyEMhgeXNd3yxvbG+8wiE09c/Ctn+iVcEQ4sdiBuodC7ZZBRQf
	rfWnveP4Bh4nbxIx8wYKCCx/zZHmhie+u2zx4nLMAWu3aqNkTXx7j2N7g5DRqTgx/lT4+YE23EYU5
	dYcNq1cx/dUmceTvVN+TIbA2jYkdBIiz8RQepUB2EnF9wtNM9QyZek40oJvihL6DL1xhu5lGA+uNI
	1p9O4hWg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ksn-00000008FtH-2jzK;
	Mon, 14 Apr 2025 14:33:57 +0000
Date: Mon, 14 Apr 2025 15:33:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 RESEND] intel_th: avoid using deprecated
 page->mapping, index fields
Message-ID: <Z_0c1TGH27ecE4hM@casper.infradead.org>
References: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>
 <Z-q5Gf57y9LEZcUE@casper.infradead.org>
 <2025033142-rack-viewer-80d4@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025033142-rack-viewer-80d4@gregkh>

On Mon, Mar 31, 2025 at 06:15:14PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Mar 31, 2025 at 04:47:37PM +0100, Matthew Wilcox wrote:
> > On Mon, Mar 31, 2025 at 01:56:08PM +0100, Lorenzo Stoakes wrote:
> > > Greg, as we're late in merge window obviously now, could you roll up into
> > > 6.15-rc1? Thanks!
> > > 
> > > This does not require backporting, as this is a critical change for mm
> > > moving forward, as page->index,mapping are deprecated and will be entirely
> > > removed extremely soon.
> > 
> > "extremely soon" as in "There are four places in the kernel which
> > currently use page->index, and three of them are gone once Andrew
> > sends his pull requests".  So this will be the last user, assuming
> > nobody else decides to add a user of page->index in the meantime.
> 
> I'll get to it after -rc1 is out, thanks.

-rc2 is now out.
