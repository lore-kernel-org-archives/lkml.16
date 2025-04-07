Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1B19CC05;
	Mon,  7 Apr 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011269; cv=none; b=QSr4Z2hfjqF1mKda7/A4KJlV+/NtuWq/lti1Mr3/XsukEuJgSS255ZKQOfS4cCyBtyY0vVOf79gs8kly8I2ku9G/rsX9U96e/VEbmyiiYuDGYSrlSiwIof1SDiyMrW+/jCCOZwctV3eH20fNxg0d1khXtf2Ps5qRn87Jgvsb9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011269; c=relaxed/simple;
	bh=OvFTZWVxok7Yh7TM8jJco47iNhMsnYLxmLRrKQQw3Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhVRGp9RSrva9cyx58QFgkcsvksZlbe2kep6FZFPlcI2ZmSgLa5M++GJ4O2cNASZUMFnS688rofBVaqRpBadej1wmMz6jja+/u2C8leN1iSXHUhHO07ydrrmttBUl8A84e3AQ+US0vkQm1JrH5DeHxC+H77aqam2KSMYG6M9X+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b4V1R35b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b4V1R35b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E3wml/8+r4IsbKmjPypYCwVOPWR42TPuEreb9gSDrb8=; b=b4V1R35boRkA2HQoNEBDzhpItv
	haipoU4Zie4sTAAGE83MMpjUFKpI1KRVgAJLMkLn5rbJS4aZYLo+eyswJM9pO/rcXPtrWH66rxCGu
	61b8TqV+E7afjGroLw7yOuLuX3kV+EkJK9eO5OXxQIwmBEe2HPHfhwXbjL9s2/fsAdFDx/ypm5vvf
	d0tOt6egMbf53SnpzXLwX1rFCxiDTx4ygSTb9Jf2bxGXlpN6vrkphSGLIvuWU6MvHXhCydrD9CFYh
	NHHh6tFEoJibIj4vdpHNWjP/ogZpqYnePdoVM+mb5yJucEHk/3aP0PxqRG1uU8mmglqWe5jt0Sdw3
	ARAmV9UQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gzy-0000000GnWG-3Lu5;
	Mon, 07 Apr 2025 07:34:26 +0000
Date: Mon, 7 Apr 2025 00:34:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	mst@redhat.com, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z_OAAthpLmmyKsXM@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <Z--W_JagTSyhYqzk@infradead.org>
 <3251F79D-4838-4C89-80BF-6EB19076833A@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3251F79D-4838-4C89-80BF-6EB19076833A@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 10:39:35AM +0100, David Woodhouse wrote:
> >> So "for the emulated devices, just use a device model that doesn't do
> >> arbitrary DMA to system memory" is a nice simple answer, and keeps the
> >> guest support restricted to its *own* standalone driver.
> >
> >It's also one that completely breaks the abstraction. 
> 
> Hm? Having a device that simply doesn't *do* any DMA surely doesn't break
> any system DMA / IOMMU abstractions because it's no longer even relevant
> to them, which is kind of the point.
> 
> Which abstraction did you mean?

Implementing a DMA less device is fine.  Implementing a DMA less virtual
device to work around the lack of CoCo shared bounce buffers in the
system is.

> 
> 
> > I still don't
> >understand what the problem is with having the paravirtualized devices
> >on a different part of the virtual PCIe topology so that the stage2
> >IOMMU isn't used for them, but instead just the direct mapping or a
> >stub viommu that blocks all access.
> 
> It can't have a direct mapping because the VMM can't access guest
> memory. It has to be blocked, which is fine.

I only mentioned direct mapping in not having an IOMMU.  I fully expect
it not to work.

> But that's only part of the picture — then how do you actually get data
> in/out of the device?
> 
> By having on-device memory and not attempting DMA to system memory,
> perhaps...? :)

By implementing the discovery of a shared pool in host memory as
discussed in another branch of this thread?

> >describe this limitation, which is much better than hacking around it
> >using an odd device model.
> 
> It still has the problem that existing drivers in all operating systems
> produced before 2030 will see the device and try to use it as-is, with
> no comprehension of this new thing.

Given how much enablement the various CoCo schemes need it won't work
anyway.

Btw, you mail formatting in the last days went completely crazy.
