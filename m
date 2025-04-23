Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C39280CDC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745434241; cv=none; b=hb/eE132JGxSL1RMAOcd47lC52rJlScUmAoOEQ97V4OmQ3mVA+zGF9QlmuNAeIloNKPdKec5khOblKijKcTrqye6O3UKKFDa1JTXYBC49Al7AJOHCBtRbpQz35NNmC5ihmKHcMZejBE241bk9xslXYwtaXrf3Ead46jCjWuelDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745434241; c=relaxed/simple;
	bh=QwhTgQXPrLEnsOMCtPpaGts4Mr6pEIvqpO9ftc958uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IULmGeeKPgpt6FD2uTQh9JgQx4wJzUQw016ywT39WGoKLOZieqwCsOoUq/JiQXKKI/B8G+fQiDLOshmA/lrtM5B+TJbUUaaL3GbzTCtEbwXHYfxMIQiWg1+C56a4UNbAPPh6Wl29JO8+UdWqRZIDD6iHca2rTN70QW96djWTCx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lhHEjxGE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lhHEjxGE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=163fqENWuFQxoVuJPb9NCuNRkwVafkYxdXQIBrpfRPE=; b=lhHEjxGEl1FWIkenDXcvQ3ESps
	370Cy8bfjUgZw6Y8R/oGtN/oX+rd5YGVZPGjVhDdmwD2YZQBD4wAL3kydqlXnXf+dg6WBBoJnalpS
	Y3FrhrD6iZ7RE9Boc/eIY+Z5KJChC6leZBdA+9qSAnQ1P1ZOkfEA0ffX2MiprjMXrlZPyLWa2C4sE
	bO37mXg2jeL1lMkL1KrryRRCzqbDqtMSgkXWv6tIT6w/sIRj6zVZPY3nshweOZq2j6LsXBJaQyOdR
	DYgrMSertn4MmcFFarkZN9ol+tYPeUUmF10sHa+Q85s9TSXOfWXNbuawIGG+gZoHN4iTCEU/vhYVM
	haqw/fVA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fAy-00000009uQl-4ALn;
	Wed, 23 Apr 2025 18:50:29 +0000
Date: Wed, 23 Apr 2025 19:50:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
Message-ID: <aAk2dCTru-C595oY@casper.infradead.org>
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
 <aALVZdStnPQ-d9PA@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aALVZdStnPQ-d9PA@debian>

On Fri, Apr 18, 2025 at 03:42:45PM -0700, Fan Ni wrote:
> > >  	result = install_pmd
> > > -			? set_huge_pmd(vma, haddr, pmd, &folio->page)
> > > +			? set_huge_pmd(vma, haddr, pmd, folio_page(folio, 0))
> > >  			: SCAN_SUCCEED;
> > 
> > I feel that set_huge_pmd() should take a folio.
> There is a patch on the mailing list for it,
> https://lore.kernel.org/linux-mm/20240817095122.2460977-5-wangkefeng.wang@huawei.com/
> 
> If the above patch is needed, do_set_pmd() should be converted to use folio.

Maybe?  I think we'll eventually want to support folios larger than PMD
size.  So I don't want to pass in a folio here unless we can calculate the
precise PMD-size chunk we want to map from this folio given the
information available in vmf.  I know that today the implementation
does this:

        if (folio_order(folio) != HPAGE_PMD_ORDER)
                return ret;
        page = &folio->page;

but eventually we should do better than that.  And I don't want to
lose the information about which page in the folio we really want
to map.  So have a think about what the right interface should be
(passing in a page?  folio + offset-in-number-of-pages?  Something
involving the PFN?)

The obvious hurdle is folio_add_file_rmap_pmd() which today takes both a
folio and a page.
