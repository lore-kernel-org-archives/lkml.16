Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3701F03FF;
	Thu,  3 Apr 2025 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665742; cv=none; b=SiawWBPw89YMBBfvUmz5+/doajbnX6P2Kc/nTdHD7Zd+dKfOJH6dKnkUiPdpgDE/Lko8qTMTJ9KQJ0vkolRHHu0/80faY2gtZHXq1SNttnN/azfDbcqqcNJ27zN9hgj8BrvznSZ6iHtLjM7JrYi8xgyKItdInNb4a/8JTS7gI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665742; c=relaxed/simple;
	bh=e0L0MDTC86WNY25ZVXuk14zJBUEEdKURilmAGzClip0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw8laurs8n+drJuIXvykBIVlNCteQI1nH6SQu8cpI+WSeVPTTPCHOrjnLHdH1+TJ2y8SbCKWn13oqm6hDsY3LWvJwHvMQmopCSgPlZLo6qJ5ofDGlxy7murIRep0u3/VMf1Y34v2iPkdk4Dr+cqAmg317lOi9ZFs8BPBDuSkxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UiJDBofv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UiJDBofv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7AYXy6Uppmi4wTYFqWzamj8y+AXC5NnPKODX/4UEG/k=; b=UiJDBofvC2p80gzSlxN+JF5iBH
	TWzCFTJaVGsc/B9JwwN3cZ0GnaF6RhWo8WqowF1mf/CLFNXb6QyoBMZaeY8u35+HkkOyUXBO6R4pb
	IY5q+c7xr/NLKsjZoeLqYNkJ9X5zssMxYP5cIvSomSsTTrpeX5xD61uv6G5P+wuexB1rsyufUXMzs
	mRtYDZIlXjMKV4Yn60e+96BJPEJsHog/TSfrNmv8oihOQIbgtsIUKGfZAZG3ert3J8+tSMJJdKR3X
	oDBcqVUR6Mw1yQ+wz4q3TZXXUN5MvtIVbMKl13Glw6HCZwwcLSPHfGZ9CeMN1ENouXC0Ph65n8FTO
	kGEc7tyA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F6y-000000088CK-18mx;
	Thu, 03 Apr 2025 07:35:40 +0000
Date: Thu, 3 Apr 2025 00:35:40 -0700
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
Message-ID: <Z-46TDmspmX0BJ2H@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 03, 2025 at 08:28:19AM +0100, David Woodhouse wrote:
> Linux has 'SWIOTLB' support, but I didn't see it as a term specific to
> that particular implementation; it seemed like a concept would would be
> understood elsewhere. But sure, I'm happy to rename it to just 'bounce
> buffers' or something like that. I'll see what I can come up with that
> is succinct enough to use in VIRTIO_F_xxx and VIRTIO_PCI_CAP_xxx names.

I think you still miss the point.

What you describing is either:

 1) A BAR (or BAR-like region on MMIO) that can be used to stage
    indirect I/O

and

 2a) a device that doesn't have any DMA capabilities, but instead
     requires use for the above staging region

and/or

 2b) a system configuration where devices are prevented from accessing
     guest memory
 
1) makes perfect sense in virtio.  It is the equivalent of the NVMe CMB
and similar features on various devices.

2a) would make sense if we actually have such devices and not just
system configs, which I doubt.

2b) is the job of ACPI or DT to communicate, not that of virtio

