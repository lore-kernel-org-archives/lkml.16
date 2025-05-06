Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E8198A08
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558599; cv=none; b=dsb6KDkHhhRAtHEyVkcyLXv4BKo15T9yXBktyJuDgOFbfnzIO+zc10450lmEOzvJkcl8eV3ygpAD7egZ0PKNdEUxDrAzfFvBJWelpL0tDF0ibMUHUHR03d5ayZfcBsm6IpjVukY1eWP6VTpvv+se3P3jb155bSG2Z4z63Lvd3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558599; c=relaxed/simple;
	bh=zdG2D9Rb2C2ESNufQJCGm+Wf8FimRoEiC9vKGXqYzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhrGKoRZrkNwJbSW/osi5LvmWAVhe57uyTBRl6QSoujtTLG/LgLU6kO6jn5vCbIuNHdGjjmpu1US4y/XTTqjNaKPNafKySx5QuF2AOn3ZWFwPAVUuhs06u98WznozggR71d863sAm0ZJmKVwy85yCDuz5RxjRcZAuXC2NfDEC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rb5LWJyy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rb5LWJyy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cv9t2nkiOZ/C9O6X5BLHLPxC2u6g2ujAp/9JLD+z1W8=; b=rb5LWJyy0B3NTyyMjI2TAecWxx
	yU5LTtjU5LeixJbuXVwZfORNexR/eEFsILkG6WbuiJ79+WcaqxgeU9dIgFavrtKk2/9qlcBY1hmt6
	4ZOjNiCjRutGizruYrNkvBWRnLEBQu0HY6INJEl9vZrSsBZRgQrDMUqSg4dZ1aQoBUZUHT7esdUGN
	UfqvbLfrKiunxYpHF5fTj0es5ra3AbKc1DdabL2bCQAnd8aTdcC51saCpCOHIeOMdcPbniD0MgaKg
	rpuRrURi3ZBxbYaOdnHfRXvuSOmqELrrOvmGnSyMs1a8OotHCwH5jsvVG3EZp9woXjw84n4viG+78
	fh61sMng==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNey-00000009vG1-0hdC;
	Tue, 06 May 2025 19:08:56 +0000
Date: Tue, 6 May 2025 20:08:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, osalvador@suse.de, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
Subject: Re: [RFC 0/1] Convert is_migrate_isolate_page() to
 is_migrate_isolate_folio()
Message-ID: <aBpeR5E6XoneDcEj@casper.infradead.org>
References: <20250506184155.587070-1-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506184155.587070-1-nifan.cxl@gmail.com>

On Tue, May 06, 2025 at 11:38:28AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> Sending out this patch per Matthew Wilcox's suggestion 
> that we need to convert is_migrate_isolate_page() to use folio
> https://lore.kernel.org/linux-mm/Z_XmUrbxKtYmzmJ6@casper.infradead.org/

That's not what I said!

This is what I said:
> >  
> > -		if (is_migrate_isolate_page(&folio->page))
> > +		if (is_migrate_isolate_page(folio_page(folio, 0)))
> >  			continue;
>
> I think we need an is_migrate_isolate_folio() instead of this.

> However, when looking into the code, I have noticed that among the uers
> of is_migrate_isolate_page(), in most cases the page passed in is from a 
> a pageblock. 
> I am not sure how we should proceed with these cases.
> Should we deal with pageblock or just leave it as it is and only do the page
> to folio conversion for the pages within?

Neither.  Add a folio_test_migrate_isolate() in addition to
is_migrate_isolate_page().  Don't force a conversion as it's a
legitimate question to ask of pages as well as of folios.
And some of the pages you want to ask it of may well not be part of
folios (they may be part of a slab or some other memdesc).
