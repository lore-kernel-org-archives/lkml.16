Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB7221D9A;
	Mon,  7 Apr 2025 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010401; cv=none; b=gDl6HxJzR4P3FZ+VN7hhgg+CMpuEHAW3lEHpp1g7ItLc9Um+I+TIxyJY9dxGeN4oQeJUg8azBq1BjMQL6NVhQLBdyZ0oGn+LhNkhrwT6mG7uDs4BmqiXHMz6qZUdUJ7weQGlpZCP5YowK2SIBTZjWZ18VD+gJnzfp5HJlKxj/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010401; c=relaxed/simple;
	bh=lndtBobJoLesrhzrh5xgstIcOeftXPA6n5ZNo0kL1oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moKGl21POG62dMaslSzCk/O17AM0haTWor08bK4HCDqxDadX+LqYaeaSKpu+BSDt0rxwmuYMMSdV76WoUgewmexWy0dbF43ZY1j1KEuhX7G7YMk/1sm8tGzeMvlk5MBlDJxYQGtQCmb+uGrSy9hAEF+S0EEP46D3VigJh6NKOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uTwd8qGM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uTwd8qGM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5G6EkzTo88uUPXRsiiqM7dcsCQlZ75x+RO778RUeMzk=; b=uTwd8qGM8sI/tZqcX7GEER8IbR
	DoBYD9mzg3r5VeUXdcY36G3gx7ii5JJ/dKvHaRRhXCjTAlmy7XY4vSU7QGpxBjJItUPHmER5bdOrM
	GhzmA1WoEJOaT7o6CyNiX3V0FCwNkQ434WNKjCph6GPGrjeRIvVDztBTvqupIgrK99y65suw12uX2
	zW4kyacCjD0fO7iJtaK+qvOLFUzdHznuOfrKYO5fOj1FdD+sQUXmihRkXtuaG2eQxMonhnA4Q/zA+
	EPNtPy+EGTPfjcEZIWDfZc8w83hRrFn5MxlXwvmIKNOS3Fv5M+QRdExoAf9Pcg/S8sfCEeA2IKJ+6
	vKurhswQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gly-0000000Girh-0KBx;
	Mon, 07 Apr 2025 07:19:58 +0000
Date: Mon, 7 Apr 2025 00:19:58 -0700
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
Message-ID: <Z_N8nk_CpD4v9-VE@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> The sad part is that the system does it all automatically *if* it has
> CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> notices that the dma_ops it's using are the swiotlb ops using the
> provided buffer.
> 
> Which is *kind* of nice... except that when on a guest OS which *isn't*
> Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore the
> `restricted-dma-pool` node and try DMA to system memory anyway, which
> will fail.
> 
> That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB feature, so
> that the device side can refuse, if the guest *isn't* agreeing to use
> the bounce buffer in the situations where it must do so.

That all assumes the indirect DMA is a device "feature".  It's not.
It is a limitation placed on the guest system.
