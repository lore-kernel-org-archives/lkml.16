Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB7E19E97C;
	Thu,  3 Apr 2025 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665348; cv=none; b=mzduwQDFSRVJlfy8Phxoy9jpE7zcLUTQnE2YpkdbpYJlHAwzBmaiQudFnljYUhdop29HmLm2MN41Zvm2BP/4g3s1TjXgOT32voRKkpox5G7bg8NV8NDydfIknFChxA6wpzqbVV0sc2raMjVmVKJYfDr2s9BOtEye1qfhJBiGnkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665348; c=relaxed/simple;
	bh=I/6uLc7S6JvaoKcWn48WGv/C5zQslO/3Z6eEJjfZl4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9EPC+LA2k+dP5diqlNg5m0+rNCsWRuic3dtzCIl6T3PgR29msBWuDMMj438bMXPeB0qKC9aVjDTPQBEt0XLS3c0FTagjxle1LMe0nJA+weFGh47P09324Q/8D17UlMZvkqde4NpjQA9vfzZIO5cllwRlKJiV+oTtor8c3JG4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GKBJpwGj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GKBJpwGj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rdnUioqSoX/jYhvYRXLLXf/QdTTUrX4HNgWVPOSf58s=; b=GKBJpwGjKh+DpFTbIhbCiIpHj8
	FoZKNtGEfebvHAOfmJFFCnwCyVxMrcoCdhQW17zTqFaRf3XEvzzCw10pGiiyDxSJ1y3PMwPnngTTg
	e19GiUR4Bx8K/pwGXRs0xoByIZ5ueHglkb8mm2c8LSrv36dvVYkfd23ws1ccGXY/pozoktRUtlwQK
	Ra/vHYbxoTWYCct15VbstqPYhSij+2wkyBnFzX4ERPR75iTr9dxOb8zo89opRfzfnETjFYsRM3J66
	dV2Qr8qAPFF4+dpJ8gCkU2dleFciUzHhewmuYGVP6IJDsGJ4aTPQdV6QDoHIb0nTqmk0JfFgQpk+A
	Dnes+9bg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F0b-000000086xu-29ZD;
	Thu, 03 Apr 2025 07:29:05 +0000
Date: Thu, 3 Apr 2025 00:29:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev,
	hch@infradead.org, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z-44wXdyia4RC6Cr@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Apr 02, 2025 at 06:10:53PM +0100, David Woodhouse wrote:
> > I know a bit more about PCI, and for PCI I prefer just not saying
> > anything. The platform already defines whether it is behind an iommu
> > or not, and duplication is not good.
> 
> Not a hill for me to die on I suppose, but I would personally prefer to
> spell it out in words of one syllable or fewer, to make *sure* that
> device and driver authors get it right even though it's "obvious".
> 
> After all, if we could trust them to do their thinking, we would never
> have had the awful situation that led to VIRTIO_F_ACCESS_PLATFORM
> existing in the first place; the legacy behaviour we get when that bit
> *isn't* set would never have happened.

You'll need to define the semanics for VIRTIO_F_ACCESS_PLATFORM only
then.  An the only sane answer there is: don't allow non-translated
regions at all an in a broader sense stop people to use
VIRTIO_F_ACCESS_PLATFORM at all or at least for anything that requires
a new feature bit.

> > For mmio it is my understanding that the "restricted" does the same
> > already? or is it required in the spec for some reason?
> 
> No, it's exactly the same. But I still don't trust driver authors to
> realise the obvious, or VMM implementations either for that matter.
> 
> I'm not sure I see the *harm* in spelling out explicitly for the hard-
> of-thinking.

Write a whitepaper than and explain how it maps to the existing perfectly
working features.  Note that VIRTIO_F_ACCESS_PLATFORM just like
everything in virtio would actually benefit from being turned into
proper spec language, but anecdotes about random use cases are not
helpful.

