Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B52248A8;
	Mon,  7 Apr 2025 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011022; cv=none; b=VV7/ZAiJLK1jbg2Fr9AIuTIZ0JrNHlj2/DECKUel+Q3ivJ19QrIgeWO1SRq9+F5u4ieH5oHI8bYzIeSR5jHioNS7z4Q3lybgolLqhCh1WnpPFzJuZfZg1fuXNkHiiwGObq9CLiadi81OH036u6lOQ2Ci1qhajl9bDxph1c2eomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011022; c=relaxed/simple;
	bh=AAZcUqXMOFsje6qKA1exvPZ8ClNtHmZch9/SRqveXNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKYajFu7cuLTMp725PslVJ3SMuBFsUrmlKz66sbee9RhAxtMhzu+KKD8z+AoOmBGfb/vKTPVFXqZbdkXqMbgkNefSjZeDx9ucYPXPrAOqtISe2Czt0A+ySpUG8bVtJc8ajJDJFBOyDzx6QJgao2oYVJaZVqJqkUMnEycolfmzoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I16D+JR3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I16D+JR3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7QLSDYF/qFsisVzcMe52X4dQZr863YZYqA6KQWyqRw4=; b=I16D+JR3LpCvmmaAr5UMkL2BoX
	T8MkXyt83aiSPS9CsFXIfSWMsbmic8u4PsukHfRdAkYTGWPXMeZK6chvnx77WfoRa+MlFGxYiFiY/
	8yiS1tsbjEdei8aBP1QAFGiD21dm+xzI+vm1zcmR9/1IJHzcSdOQvem5iLJ4RX5xaao4Rt3K57lYa
	NSC19E7DauEoXFUY0dvht4WbdMAtYmYWNcjOrdv/2eHqjuE4WHgJOaj81CzmhwqvhYgP2LIKaQA/5
	13ZKI0P09gIuihwzPoiMm6eeShJ66nebVhRW2Z7NxWQQymGPmw6LJlhtSgQt7bnHupHKLMqiL6kxP
	77dRvohw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gw0-0000000Gma7-21xa;
	Mon, 07 Apr 2025 07:30:20 +0000
Date: Mon, 7 Apr 2025 00:30:20 -0700
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
Message-ID: <Z_N_DNXq9VbPvTfA@infradead.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> We could achieve that by presenting the device with a completely new
> PCI device/vendor ID so that old drivers don't match, or in the DT
> model you could make a new "compatible" string for it. I chose to use a
> VIRTIO_F_ bit for it instead, which seemed natural and allows the
> device model (under the influence of the system integrator) to *choose*
> whether a failure to negotiate such bit is fatal or not.

Stop thinking about devices.  Your CoCo VM will have that exact same
limitation for all devices, because none of them can DMA into random
memory.  The solution to the compatibility problem is to just not boot
an OS aware of the exact CoCo scheme into a CoCo VM.  Bonus points
for figuring out something clever at the system level that let's the
boot fail gracefully early on for that case.

> The main thing in the CoCo case is that the range in question must not
> contain any memory which an unenlightened guest might treat as normal
> system RAM (because it has to be accessible by the VMM, and that would
> make it insecure if it's being used a general-purpose RAM).

Yes.

> So on x86 it might be an e820-reserved region for example.

Hasn't e820 replaced with something more "elaborate" for UEFI systems
anyway?

> I don't think we want the guest OS just *assuming* that there's usable
> memory in that e820-reserved region, just because some device says that
> it's actually capable of DMA to those addresses.
> 
> So it would probably want a separate object, like the separate
> `restricted-dma-pool` in DT, which explicitly identifies that range as
> a DMA bounce-buffer pool. We probably *can* do that even in ACPI with a
> PRP0001 device today, using a `restricted-dma-pool` compatible
> property.
> 
> Then the OS would need to spot this range in the config space, and say
> "oh, I *do* have a swiotlb pool this device can reach", and use that.

Yes, that's largely how it should work.

