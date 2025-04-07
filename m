Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D7E1C5F36;
	Mon,  7 Apr 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034784; cv=none; b=SODYm1yyQ+dS/Jfx7gYBKRK0o02i+MbrAOaQZ0T4ojjKavmetLxU8JW2Ay55umEdekNT4YFYqYaCv4CMkmccxOKgF9MK8t0bBvuZ6r9VuBgR02c+Temc9E/dJW0YxB+M6H9tks06BVBuRPU85tBS8n3Pb+gM3ueWyFoLPbawjnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034784; c=relaxed/simple;
	bh=VaE38B9psm2vNPTiIr3PvloCdO/DJdgNMBHnmydyXHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuVZN3m+wXsTp5NQiuQ+/F8jt5mj3Z7V8O9h/luw33dJJYcPUPr6on/RkX5ZiT3EbV2gd+8U1OrbSDepZZx7Pvb72EWEgaDQwfTWbHlh7Sb1lcBdIwtj86cNYAz1ZWuxr5JvovlY2p0BT48MzmbtbyCu9KVLyDIE180fnP6jw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hJfl4aO0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hJfl4aO0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2xeYr7Vg3Kr8BkqVMtZaLqTmdjG2/9k4H9+LI9KM7kQ=; b=hJfl4aO0IdwNyGX9uCa7h88DTp
	kg1IEdZWki1v9flTRM2VPDg9RDaHTizGPt4GcYylVoCbK69oj0OfGi0RVCc2+iSDjG+kn6+ua5f5U
	ZZDkvWI3SU7glgYlWu0I5NSVUXnHq7A37C8u9RoQBZ0uAZeGFH1A+H4QLChO3oscXpNSSYETnYGWK
	4+IGYj8jVDCzGLoONoCduQ4p5KVuEfApyWohTUj/akZSB0J6aZyDO0zKzgQV3NirEdX7b31BVFjUm
	BCzKmAgNXZRO/36tf/4m/yHDMwMDsqaNuOvI0oO6QFXoW/EMJN/tZl0OicVS1sRcNRu7aXyzd5l60
	QELPepNQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n7E-00000000ei1-3AC1;
	Mon, 07 Apr 2025 14:06:20 +0000
Date: Mon, 7 Apr 2025 07:06:20 -0700
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
Message-ID: <Z_Pb3PPIJNp4ZTjY@infradead.org>
References: <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
 <Z_N_DNXq9VbPvTfA@infradead.org>
 <f54f46399aa2d0066231d95ef9e98526cf217115.camel@infradead.org>
 <Z_OVbRNHU1LXU368@infradead.org>
 <c08d3fd2bdae1b0fa629ecd9261a5ca9549ce9aa.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c08d3fd2bdae1b0fa629ecd9261a5ca9549ce9aa.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Apr 07, 2025 at 11:09:54AM +0100, David Woodhouse wrote:
> > Except for all virtual devices.
> 
> Yes, that's what I'm saying.
> 
> And that's also why it's reasonable to have a solution which handles
> this for virtio devices, without necessarily having to handle it for
> *arbitrary* emulated PCI devices across the whole system, and without
> having to change core concepts of DMA handling across all operating
> systems.

Except that you might not have a working two stage iommu everywhere
anyway.  So fix it for real to cover all these cases and skip your
layering violations as a nice little benefit.

> This isn't just about Linux guests, and especially not just about Linux
> guests running running 6.16+ kernels.

That shoudn't matter.  No interface should grow stupid hacks ever just
to support legacy guests.  Get the interface right first and then
implement it in all places you need.

> A solution which can live in a device driver is a *lot* easier to
> actually get into the hands of users. Not just Windows users, but even
> the slower-moving Linux distros.

Don't go there, that just gets us stupid crap like the Intel hiding
NVMe behind AHCI hack or PCIe firmware first error handling.

Get the interface right and then work on making it fit later.

> > should be usable for all devices bar actual addressing limits that are
> > handled in the dma layer already.  The only things you need is:
> > 
> >  a) a way to declare one or more pools
> >  b) a way to destinguish between devices behind a two stage IOMMU vs not
> >     to figure out if they need to use a pool
> 
> I'm not averse to that, but it's different to the `restricted-dma-pool`
> model that's defined today which has explicit matching. So I'd like to
> reconcile them — and preferably literally use PRP0001 to expose
> `restricted-dma-pool` even under ACPI.

A per-device flag is probably fine and easier for some things like
pool sizing.  It also would be worse for other things like eventually
implementing percpu pools.

> Maybe it's as simple as a flag/property on the `restricted-dma-pool`
> node which declares that it's a 'catch-all', and that *all* devices
> which aren't explicitly bound to an IOMMU or other DMA operations (e.g.
> explicitly bound to a different restricted-dma-pool) should use it?

Yeah.  Similar what we do with the generic shared-dma-pool.

> Either way, we'd still ideally want a virtio feature bit to say "don't
> touch me if you don't understand my DMA restrictions", to prevent older
> drivers (on older operating systems) from failing.

As said before they really need system level awareness of a coco host.
That's not something to be hacked into virtio drivers.

