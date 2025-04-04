Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB850847B;
	Fri,  4 Apr 2025 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749083; cv=none; b=UlzPG4IEYw6sXtzNoMXoCbHqbCTY81cY8ZmmYRbcQM42L/D2Lg2CrsR+KiCIYiAZ2xIQAy5Cx5Dh0pvegWDrIWBQeeuWUNgGmwVZGBGUjuBx4pvW5RARs/jBP2f5NXlPFlEKrlC7ZO8sr05qpevQnOYXrsmIigiaGN1SoyqdCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749083; c=relaxed/simple;
	bh=fEI8b+fuPlA6VWO6eiwnARWzZ4YhwcT1ZPPRizGWi1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3DhgfBqmNPQWjh41DqqUtvh1JUx1F68Xome1K+0pSmgGOKXMGcOZeiofV0rrabQ+snsyRss1N2ow3DSN0ka7DdzRjo83BMqmwLAddSwQV83BqpZZHsBl2R05GGGWWx2NLOltrxcalbnV25amgI3aQMsgLrsiqIOs3iq4TGdoqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s925h0Dt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s925h0Dt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h7QWjYgd5b9nAiXLkFnrvYYpfQSsNb89njCjMP9ndJ0=; b=s925h0Dt1r5RtpKYmkMq1zX84s
	qqx5G1mkveRBc+Pvj5f7/m4gwZuUH18fpyCqfqn0bS1SE3etUy4Hm1AhcQmu+5g95CC/tpIvW4ury
	9PVD2rE2gIVrYP1YXpMMqM2uAwuxx2kyTMRqVBXb7aftXEQPiL458+TdNHGG8+6KeTV9Kz4ZCWXQC
	QwxPt9vl6HZsEo38KfwoQn+3bjQmcPu+EA4LqecFcYAbglWFXFqNDCHigUVBcrEBYpUaVyWBwloE/
	6+X7/WJoHGl3olbe3qXvzFX5gXxk8b7xcQi7W/9Op1kKGNerDKub1kZp0H+WCHpn/q+lEiZpDjBnX
	ZXhe/ZTA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0anA-0000000AuaD-2U3Z;
	Fri, 04 Apr 2025 06:44:40 +0000
Date: Thu, 3 Apr 2025 23:44:40 -0700
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
Message-ID: <Z-9_2IDmEWLKDKgj@infradead.org>
References: <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
 <Z-47O3vkyIf0mzdw@infradead.org>
 <cdd979bca2b8cc4ff170442d968b63f2b3f0ccd6.camel@infradead.org>
 <Z-98Lqpq4mZN545Y@infradead.org>
 <488D32C6-77FA-4CC8-988F-CD4D14548D4B@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <488D32C6-77FA-4CC8-988F-CD4D14548D4B@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 07:39:02AM +0100, David Woodhouse wrote:
> Plumbing a 65th address space bit through all descriptors seems impractical. Would it suffice for the driver to *specify* the location in the device's DMA address space that the on-device buffer appears, to allow it to avoid conflicts with system memory addresses? Better ideas?

That's what NVMe currently does in it's second attempt to get things
wrong.  It mostly works for the current use cases, but there might
actually not be a single canonical address where it is mapped.  This
was mostly theoretical, but with SVM and especially SIOV it is becoming
a real thing now.

In the worst case you might have to limit yourself to one address space
per request.  Or have a bitmap which buffer in the request uses which
address space.
