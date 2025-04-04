Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C48F17F4F6;
	Fri,  4 Apr 2025 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748533; cv=none; b=Tvckfn8K1rNnrOq2EIZJOADrG/wjoHtttbhZn9tyYiqNHviLkh62km/a9HnyAV4vOZhrxmvGIaNoJN4LznLf0Qmudfu2laMHaWUAFjyrgdUUcvCwmDeV8PZfKD09Yvkmh+mN8FnruArgXUsnOnCcmcH3seaO0K4HtqBc6xPY4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748533; c=relaxed/simple;
	bh=f5UIYiHZr8F8zpMCKNp8y/OGEA3xHGIo+nLug8tZ04o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzW3aFjjI5w0/ihkIRj5T6lUxpqHAXR9GDPMbknTlmT2ZKPCyi+LSt/aAUjkzLl1PYLaz6Rq2uCG5ZddExhDjYCsMnFreVo4OQqwK5PDYQAN1egL7L/xEnCwA2hIs5l90ZrFMMuhrBY+HLwIH9m8Yx/DTBd6XsJpi7KVYj0o0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yMLAmrTe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yMLAmrTe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oRL0tdJAjPV+G5hvzUicbBcc4clC5hezIULcGYZrejk=; b=yMLAmrTerlCYoA+aZjVyTxFk7c
	/ODMdcEzGnEXoNZfxHBGocpOAS6S5WWdpfJJ/VeXkrszrn/2k7BclSgztw1iRnkALPnx632SU7Wfl
	01XHHIZbz1cJeyP5Cxyuosnyf38KscTeVlmBTaUPwRJTdE49XYIz3jn8XVuY128BjrxhNx+Cn09lX
	Xfgs4/mE0vq+8HD7VOLB1H3qdhTmZy3/vQonUGAOiLNKV0d/JU/PSZb/FCiqoMSpdV5SZrLoEHJF6
	BodJBDnDcgfOf8VB9R0OgXQYFYrupaGYA3/qIiMSg/Lfh9UWcePY5aGGY2noFwUuwvbQdw+MExcfi
	EdEc7xXg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aeI-0000000AtBZ-2zlI;
	Fri, 04 Apr 2025 06:35:30 +0000
Date: Thu, 3 Apr 2025 23:35:30 -0700
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
Message-ID: <Z-99snVF5ESyJDDs@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 03, 2025 at 09:06:37AM +0100, David Woodhouse wrote:
> You are right, in theory, that (2b) is the job of ACPI or DT to
> communicate. But virtio is presented as just another PCI device,
> indistinguishable by the guest from other PCI devices which *are*
> actually able to do DMA through the hardware's two-stage IOMMU.

Then the virtual device should be behind a different IOMMU (or no IOMMU
at all) to clearly differciate them for the assigned hardware devices.

> To my knowledge there isn't a clean way, across platforms, to tell an
> operating system that a certain device just *can't* do DMA at all. 

Well, it's part of the device specific if it can do DMA or not.  We
had a bunch of early PCI (and a lot of ISA) device that could not
do P2P.  Even on PCIe there might be weirdo device that just expose
a bar or have some bitbanged i2c or similar.

Now if you mean virtio devices - yes there's no way currently as virtio
is a quite fundamentally DMA based model.

> And
> even if there was, why offer a device model that could *theoretically*
> do DMA, just to tell the guest through some other channel that it
> can't?

That would be the normal way.  Because virtio devices fundamentally can
do DMA.  It's just your guest specification doesn't want them to.

> What's wrong with a simple option to indicate, in the device model that
> the system designer chooses to build for the guest, that it can't do
> DMA?

As stated above I suspect you still are asking the wrong question and
have the wrong mental model.  Virtio fundamentally can do DMA, you just
don't want it to.  And based on the other subthread I also suspect you'd
actually be much better off with your bounce buffer in the virtual host
memory instead of coming up with this particularly odd case, but even
if not it's the system description that matters here, not the device
model.

