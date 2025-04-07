Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952C23BCEB;
	Mon,  7 Apr 2025 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010605; cv=none; b=UoN/6i/eBWBRBFlobNZ0yflSM3BzESH9krqJoJw8QJHB9PcxurI0AUD9f5l+Qmge7ZjBBxGItiDyQuAfUIsF+nlPmQg3RMBco1UUu1nXdYESMq2dW/6mHQ7W+nPgJAgnO1AhgsgSH96Ru3kKnlB82mOQosJiZ1ESQmQULVZDXew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010605; c=relaxed/simple;
	bh=LXtR31hhNj5bSGd9vha9UPMijN0OPoRfHKxac3WDpOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2hLw83qkJEFXpkEq5+kfN1upDcL6GNgYj9PRjJnbqG0H9MXtHpoM1BzB4F8KCrTfJYoZy6pTEniBR8l2xY/1lT8O9b+aYC1O8bSz/lh6EuYTOrNbcThrCuSnJmzZ+EPUj1sTBwmHplTTAnuztNY4wkjoCIYBCI4WSTSuGPhFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c1AStlZT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c1AStlZT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RtX1WX80CFak6EApQVjWRkMwAtvEofuse/CA/YuUqWA=; b=c1AStlZTOHcJSKZ5DIgrNVYaFl
	29IgsOtrUBoZqrFgEnPCPNc8gO1qpkme3YUtGKJKSl0u16VGMx+aetmrIYV573jbVnDozKj8cywSu
	+gkHWhmj7hxQqI9zrtZqX37kllFvDbSwN+EUNRsDkEBJ8GKVvZwPN5EIh5itAhDUU54WcrCIOTavw
	7KbX2TmPp3CkZ6DT3NKy5cdD8kFCY9SnnTX4gkyvsQGAvqfkhWigtgRP8+5cPWsn5tP08r/3UfYNh
	ffI07Nwf0Zpy53iGaIDnX7kvZJX+bt0VCO9X5ILLfmk5uB+GIPfkYGXBYrqwrh5zWwD+/IMPoN+El
	0pv6prtg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gpH-0000000GkJ9-076G;
	Mon, 07 Apr 2025 07:23:23 +0000
Date: Mon, 7 Apr 2025 00:23:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	virtio-comment@lists.linux.dev, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z_N9aqdeb9i0F9bl@infradead.org>
References: <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 11:15:33AM +0100, David Woodhouse wrote:
> Of course, the beauty of the restricted-dma-pool as supported by DT is
> that it's a *system* memory buffer, which is actually OK as long as
> it's reserved address space and not just part of normal system memory
> that an unsuspecting guest might use for general purposes. So the
> trusted part of the hypervisor (e.g. pKVM) can *allow* the VMM access
> to that space.
> 
> It doesn't *have* to be on-device. That just seemed like the more
> natural way to do it for PCI.

It isn't very natural.  For actual PCI devices it is a lot less efficient
compared to bounce buffering in special host memory.  For virtual device
that's not the case, but at least for Linux guest it still makes the setup
a lot more complicated as we can't just reuse the restricted-dma-pool
but need a new version of it that uses MMIO helpers and device specific
setup code.

