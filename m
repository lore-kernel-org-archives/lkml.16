Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A047B226D0B;
	Mon,  7 Apr 2025 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010767; cv=none; b=al0jzrC5AmXeJ408t8gqia/pyZ/2WJeO9aAqu2FJuirFCebYR0FqdMGg2maamsACnsUw5Ej32V3ksb3PKulbnE1UW0KOMYvKdqZzFz/KB0Ys/PwkXW1Ya8OuwbKnrdw+JeF+bSwGb1wUMg5S1FS/nWgdyAgkHzeNd4a4B1aJPoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010767; c=relaxed/simple;
	bh=5Vf9eT2IBg3Wouz55ADVYPPEqlAi0F0CJd/8iiHScAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7c65oSWqFC75q8twkOGMsKC/9n3gTZybm0Pt67sKbmV+cOnKLqiaPR6nx4iy6kpVz9grjS1XVpWBPzuv4o0hJFkp5uqbym9mgxvd81L5ZQm37FwW51yNzB/JNCGmPBu6B+Qj7ii9d0R74cTo5UvXKfLx2y+nplyAUgUS1qcMbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GavUersl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GavUersl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p+sv0Xub/hlE4l6TjE7vOQjwl9+lnYb0AJ4jMCOEV4o=; b=GavUersl/U/jscxB5CPKvsESkn
	S6JTWqx1De/T/F9oaPgw618bjKjRxYvzJl89DIuKSq/J/+KDEM0Eaj0yRcrlymDeQDUn1ECYgXHH0
	jYj7C3O1Fm8mdPdWThKful9HMC4rrOU8G20d4ZuLiXTYAyJcpJU7idWvBUljCE+QuxnOKutc7sjZ7
	08tLFL2AUVkcY/A+TsMynGQbxLtDWhdF3/+BXVOBSR8QqbIFLd/ijekXlgiORsHILatGA6C39a0bo
	7VquTYatY4VNQPmmJ032sQ9CnT4xyxsLztqikW/FhHKs4W9nS8En7CbubZlAOX20h+RVD5Upfj+eW
	1cwj/WEg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1grt-0000000GlP4-3Mck;
	Mon, 07 Apr 2025 07:26:05 +0000
Date: Mon, 7 Apr 2025 00:26:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	virtio-comment@lists.linux.dev, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z_N-DaeAvSuSMJJI@infradead.org>
References: <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404062409-mutt-send-email-mst@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 06:37:16AM -0400, Michael S. Tsirkin wrote:
> some embedded devices can have addressing restrictions, such
> as the number of bits of an address.
> In another example, the legacy balloon device only supports addresses
> up to 48 bit.
> These can still be useful if driver does not use the inaccessible
> addresses.

Let's not mix that up.  The DMA API handles addressing limitations
just fine, which is totally different of only allowing access to
a specific region no matter where it sits.

> Now, a question: DMA API under linux at least, can actually work
> around device limitations using a bounce buffer. It does, however,
> need to know what to work around.
> So, maybe the device needs to expose a range?
> But what is the range in your case?
>  
> 
> Maybe the new registers list the range of addresses device can access,
> and driver promises to be within that range by negotiating the
> feature bit?

We do not have an issue with a device here.  We have a system design
that does not allow devices or the hyper visor to access random guest
memory, and because of that DMA or the virtual or physical kind needs
to go through a designated area that is accessible outside the guest.

Trying to frame this as a device limitation is already causing so much
trouble in this thread and it will just get worse.

