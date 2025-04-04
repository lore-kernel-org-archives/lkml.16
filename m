Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C094A3FF1;
	Fri,  4 Apr 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748147; cv=none; b=eMf66br5+xAPoL1lyDWRlb57K75VKVLfz/6zFlzPrNLWjsHNJo15GIO1Z5WOY8zcnCSkrptUzkwJlIelDdijvD8iLhtbOP1teuX6bxH5bQJ1LuXazw7NuQ+qW1y78kgBNeFG9b+5Ftaq0Q3xeqNP5Nhhu8QImL+xx515EoEySiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748147; c=relaxed/simple;
	bh=0cXwsrlmI4kpYpmXPsreZ/PBe4dTaTgr46V4y/owBlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHSIt+yBJwgZcHAGoFDoVN47CJFq9KauwduwzoCfGmvVLpy57acusuPKLBOXgn0EcHfB5DirKKUHBdtmX69Y7n1Bo6DCP9ovtU8pImjmcxXJLb/WZhfLhcMlpqW3CzyTGp7zBdLoZeNbRZH/3LfZCtifT+6LAu68g2/IVy+YfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eBGL2UQV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eBGL2UQV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OALZ1QhbxGHT/88J12tC/Hv6s/xhb6tvZprQO99ysVo=; b=eBGL2UQVDzGR/kon+3l7lgW/RZ
	ntxPdTr6/vtsLJaDnWDwG+MW/6QswxTjnssGs0cZKJMM6wduFGbMqBf5sk7zQBAIWw3jzyKv0KSlM
	x1GrOVuRVUofexhKCkNoVGJZ3PqsHhG+PIKJIxqDFaZ5foS4XZMYtNvzKjXrNjdLbxbDgokAnm1bi
	6d+7GowYd8MyIIj0TvwvF+GMNkNxqkPlnTQOswkrHO2ATfPAmVvBO0tksCKv6GZjc6R8yCnehPH71
	8oy0n5JaLyMXqkcyvSziNMB5B0Bi0OnTEKi1Bv6sPW/7VrvZBvIUGqBydSMlhdmYYJmh24CyzjJ6D
	cz/3ULtw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aY2-0000000Asvo-1rR9;
	Fri, 04 Apr 2025 06:29:02 +0000
Date: Thu, 3 Apr 2025 23:29:02 -0700
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
Message-ID: <Z-98Lqpq4mZN545Y@infradead.org>
References: <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
 <Z-47O3vkyIf0mzdw@infradead.org>
 <cdd979bca2b8cc4ff170442d968b63f2b3f0ccd6.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdd979bca2b8cc4ff170442d968b63f2b3f0ccd6.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 03, 2025 at 09:10:41AM +0100, David Woodhouse wrote:
> Thanks. I'll take a closer look at handling that. I think it's
> reasonable for the negotiation of the VIRTIO_F_SWIOTLB feature to be
> the thing that switches *all* addresses to be on-device, and the on-
> device buffer can't be accessed unless VIRTIO_F_SWIOTLB has been
> negotiated.
> 
> Which neatly sidesteps the original thing I was trying to clarify
> anyway.

Switching all addressing does not sound like a good idea.  The main
thing these indirect buffers are used for is as a staging points for
P2P DMA, in which case they often are only used for some transfers or
even parts of a transfer.  At least for physical virtio devices P2P
is probably not far off with the current GPU craze, and I wouldn't
be surprised if people found uses for paravirt P2P as well.

