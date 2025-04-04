Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2018BBB0;
	Fri,  4 Apr 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755009; cv=none; b=sTB8vVW474Hhm28JA7excoR778riZLgmwRv0ZIami8QCjuUVW/0YH6qD6gDfKinWtdF6a7ngorC/st+PrBnPoPba4iLMLZBk4VBeWIANKdTTge/PBl4TCAjNsy3oIzJqKMPEZwg797OsIJ8qk0cUXCU1VoZ2oXnIZy6Us0lvbmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755009; c=relaxed/simple;
	bh=exXncdCnC5w1jj9sp8tR3J47I5LVIscXdi7WvgXh54A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W77IEbUYhVQ+xh9ObkrijAzJWu/uuLXMZh5SBFAaQmcOedWmLr/tQL26LZp+ITHOmGQImR9cFhqfq/uFK/gr29sWkHobBJqdge7XgLjln6ruE/lgLivPYX3OljiOzL1iOUYWRP13oQ6wl9iW0HGEl8GcezWLkgIDnIjtLzAANTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=z1jZ0J1z; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="z1jZ0J1z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aQkPpwhCuI74t8MvuOuCVkLaOjb2i8DMN08lsw+64Yk=; b=z1jZ0J1zwZHjfaKPGV0j2opMuJ
	1UxXGv3TWNtATD3MXhjaBzoKspO2fkpnX28XVvY1gxrDDPVrZPyUNore5FQJzuFwgqWQ3h6fd7Xlm
	4WVCv+H4aJ1TXYjUxrg307a3DQ9xSf2IQb5W+M69EmiJ3zI+EJrMgbuPgb2G7qkUgEZQXZ1twp2L/
	23Lbrgd5lJdOeapzQPloEJ+xNNkp8SbGdxhTMOa2+zaqajeVZ0pGfh1dmgIsjMbIre5hc//EDcVBs
	1FkbtB/bzQkS7Hd8TsCVM0n6uTFVDeEpAIuOnzbj3H3vwV+jYSsqvaQQW88pzU9SMikJGmgRcRX4L
	Dyz6l5Uw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cKi-0000000B7qt-0v53;
	Fri, 04 Apr 2025 08:23:24 +0000
Date: Fri, 4 Apr 2025 01:23:24 -0700
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
Message-ID: <Z--W_JagTSyhYqzk@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
> I do agree, this is fundamentally a system issue. In a CoCo model, it's
> non-trivial for the system to allow *virtual* devices to do "DMA"
> because that actually means allowing the VMM to access arbitrary guest
> memory.


> So "for the emulated devices, just use a device model that doesn't do
> arbitrary DMA to system memory" is a nice simple answer, and keeps the
> guest support restricted to its *own* standalone driver.

It's also one that completely breaks the abstraction.  I still don't
understand what the problem is with having the paravirtualized devices
on a different part of the virtual PCIe topology so that the stage2
IOMMU isn't used for them, but instead just the direct mapping or a
stub viommu that blocks all access.

> What's annoying is that this should work out of the box *already* with
> virtio-mmio and a `restricted-dma-pool` — for systems which aren't
> afflicted by UEFI/ACPI/PCI as their discovery mechanisms.

Yes.  And the fix is to get the equivalent to restricted-dma-pool into
UEFI/ACPI.  That gives you a portable and device-independent way to
describe this limitation, which is much better than hacking around it
using an odd device model.

