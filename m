Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45922A7EE;
	Mon,  7 Apr 2025 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016752; cv=none; b=HP74sBBqxuvRlQkYOqq80uIZaToJ9n9uPsd5/zAPcYxk748kLRgr+eESFTnL6MBaj4QiVgOs7VNuE3KeR5HbeQAi+3OKRHicF/u+VIoFjyZLtdLWXOcPukr/XDwtu58TOjXx+zVNeYGkpp29nOcECG/HjkkOi/4B/Zn8WJ5Kiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016752; c=relaxed/simple;
	bh=3+d8GF/W5pSv010EdvZImpFaSTGyBae92FfD7EJsK+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aakBIH5iqEe7DkGiy3tki2nxG/wsohkBtT1Dcu6rOlea0MXHaZLTLYzksg81T+uYRFUR5tAJSQ8CueMoLJidHsS/XmM8w2Mofxm25PM67ZUMZo03CWo9rZhDqGcKRKqpNey7ATD0CGvoDFQGl+8aRJL+nMH34Hsm8yUpkrby2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GF4li4Ab; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GF4li4Ab"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9u7S8Ul3QZSlWc4Utovw3OWnYr/ONFL7Jukfpg7e3/E=; b=GF4li4AbYyalo0lDtNb7eS6HYq
	Zj4GfxYgB6a+oK5zaCLpyA5/lkSmpXPgPKQxM+osplK9RjB0swIhBRcvH3oiXbLrVzJjdJ4IBIjHm
	56FusUGZq4xOKDuTxSSRcrVFrzcQL/Piww4Y/+JlSFUQCQ4VImDhyWrn9lh+7E0IVBS4oNkpv8Unc
	Y6tJ9nSObcZCS2CUyljNRugEZrmPa7Ix4BLmcqWeFvV8WHp+oMN6xTQ0PPJ0+O4u+pHRhMqtxqa2Z
	KrZv46QeLzTdRjdp7bHCfJjuPNclgS8aRpsuX+8JfuGf+fyuzyuWtK9+TSCJ1XZiiVwtFtNhuCdcl
	bw6pxVAQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iQP-0000000H7uS-3ScJ;
	Mon, 07 Apr 2025 09:05:49 +0000
Date: Mon, 7 Apr 2025 02:05:49 -0700
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
Message-ID: <Z_OVbRNHU1LXU368@infradead.org>
References: <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
 <Z_N_DNXq9VbPvTfA@infradead.org>
 <f54f46399aa2d0066231d95ef9e98526cf217115.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f54f46399aa2d0066231d95ef9e98526cf217115.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Apr 07, 2025 at 08:54:46AM +0100, David Woodhouse wrote:
> On Mon, 2025-04-07 at 00:30 -0700, Christoph Hellwig wrote:
> > On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> > > We could achieve that by presenting the device with a completely new
> > > PCI device/vendor ID so that old drivers don't match, or in the DT
> > > model you could make a new "compatible" string for it. I chose to use a
> > > VIRTIO_F_ bit for it instead, which seemed natural and allows the
> > > device model (under the influence of the system integrator) to *choose*
> > > whether a failure to negotiate such bit is fatal or not.
> > 
> > Stop thinking about devices.  Your CoCo VM will have that exact same
> > limitation for all devices, because none of them can DMA into random
> > memory.
> 
> Nah, most of them are just fine because they're actual passthrough PCI
> devices behind a proper 2-stage IOMMU.

Except for all virtual devices.

> > > Then the OS would need to spot this range in the config space, and say
> > > "oh, I *do* have a swiotlb pool this device can reach", and use that.
> > 
> > Yes, that's largely how it should work.
> 
> The problem in ACPI is matching the device to that SWIOTLB pool. I
> think we can expose a `restricted-dma-pool` node via PRP0001 but then
> we need to associate a particular device (or set of devices) to that
> pool. In DT we do that by referencing it from a `memory-region` node of
> the device itself.

I don't think you actually _need_ to have an explicity device vs pool
match.  All pools in host memory (assuming there is more than one)
should be usable for all devices bar actual addressing limits that are
handled in the dma layer already.  The only things you need is:

 a) a way to declare one or more pools
 b) a way to destinguish between devices behind a two stage IOMMU vs not
    to figure out if they need to use a pool

