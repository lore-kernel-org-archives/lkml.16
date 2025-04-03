Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7A22CBC9;
	Thu,  3 Apr 2025 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665981; cv=none; b=R12QOsiDA3+1LT49B2ysiEyK/nLjhsrIxS2do9FsMUl9/nDsFNwLuGsRZ5iNzOG/BD3V6jrPUq+zSmXqMHsRrqceB6d+kFY13NMtBOOk9DxG3tf4XblW406tubx3DHmWjEcUCW9e+53DPs8mr36hIfEkxfpcze1nG5UxlZppWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665981; c=relaxed/simple;
	bh=wOiaKdqyk8ZktVbNweGRcA8gxQelPyHX+1w1VuNo49c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJePq5nq79/thC+jdKwoZ5xkuvVUJzTa8Xh2SrJT2kQhhjSQPjsW7waM1Rk3KZb1OXez7xUl13OEYIbj0QgKFDfFcxQ32nOnAuh2SH/16E3oglR9Y7PItZ49dnzFiBgU65cf/wia3DB20sLSfqDBcMbzmmilVqvtWYaRwihcHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wPAEqvcz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wPAEqvcz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HfTxIdAN/ahZ9DZCy4cmhVcnDTa2i7h44ZJVx9qLKR8=; b=wPAEqvczF56oz8r8yJcoJ4i6KG
	arJfMGleNzHiFv5WycGmKw/kmkywuAdFjSG2gQCOZeHzeg3PIhTRYp1KzycDBdz9R6igTzAaPg+QD
	/Fe9Y6fl0jtnz0H1PUU18pn4PNLB2QirM1GgYXGWf9BkZQiI0gojW90RCmeiEV1gZkJIq1ll8C6jf
	PaAZrpHtgvlUUqbXmZI3eJIlqD4sJcqx9SDSAF2t6FSxgXmTynJYkW0QwS5d8d5q89Q8TMxWgQ76n
	e2AJR7TaPKTzVj3jGh2YCytgKxOjheXQC1kJNuG25H8yaE+/KL57vPOQj/5R3u123otJUbqllS6Xv
	EJrXIG9w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FAp-0000000890G-1wHW;
	Thu, 03 Apr 2025 07:39:39 +0000
Date: Thu, 3 Apr 2025 00:39:39 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	virtio-comment@lists.linux.dev, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z-47O3vkyIf0mzdw@infradead.org>
References: <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 03, 2025 at 08:37:20AM +0100, David Woodhouse wrote:
> Hm. I was just trying to point out what seemed obvious, that when a PCI
> device does 'DMA' to an address region which is actually within one of
> its *own* BARs,

PCIe devices can't do DMA to their own BARs by definition, see the route
to self rule.

Pretending that they do it by parsing the addresses is bound to fail
because the addresses seen by the driver and the device can be
different.

NVMe got this wrong not just once but twice and is still suffering from
this misunderstanding.  If you want to enhance a protocol to support
addressing a local indirection buffer do not treat it as fake DMA
but rather use explicit addressing for it, or you will be in a world of
trouble.

