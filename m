Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FFB18732B;
	Thu,  3 Apr 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665076; cv=none; b=ZKr6ZNRpTF7jdtPbsUN7m1MR9ZIe3sqqJUJDHpzvNkISJwAA080tElrxiMMWrPwb/Xildb8YJv6wKOpctzk6wRHtgC7NA/j53x0sSgC9Re4BD0BxIfOzzCstxulNz8V+h9Tg0pgvNFtBnh0oKu8mCTdoGgsf7iney/Y5/P4AG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665076; c=relaxed/simple;
	bh=06ghVNU5N3saoruBnttTeD8smgvYZomjIXvnQDjTLEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaNJFDxhNEG39oblaaVDYoovYeZ1wAMkdz+452KZh5ZS9xfkPrORpN7KKjkUWTwuCb1JfTAsLpKH8Y0JEga/j8W5xPa+gmW5DV+EMVbtNE6oRe1cIjpV0TeSxKzlM8QzujjwO4DcaxKIh1lnqUD9pB9HxslOx5eDdeheSVbJ0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V8Nm8y44; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V8Nm8y44"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mZJoRgl7tKUmuHw/xIDGXaeA0kg35+tgF4aTMSGhxZI=; b=V8Nm8y44qTUMr/32bDu8BfdFLv
	J/xl3p//WZXV00K78sdsCVF30rB8tCwwgtI76WVn2D//TsALfZDThwfJUy566w3c7UCunE8g5SNOG
	xwO+sg/yboDd/DyqOOys0fx2m3U5jLlDfXyJEawyreTy9RfWgr8CMhvYTxRhkVWuq9LFYlmXVW2i7
	pHGuTLmmlIck1Qd1UE7QVGAqrAvaNj9ZZ81hC6mH08Kl7GJ81bIw9YwCIaI2XPqjX77wpj8+ZMAJ9
	12puYOD09T+EHuMXeCn5QFgdbthJ7kv6r4648hRYrf84LgkRQJS6DxzCeQI79c/njfwrnNIJN3rAy
	ERTNdrSg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EwE-0000000867w-1zgG;
	Thu, 03 Apr 2025 07:24:34 +0000
Date: Thu, 3 Apr 2025 00:24:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z-43svGzwoUQaYvg@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402112410.2086892-2-dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Apr 02, 2025 at 12:04:45PM +0100, David Woodhouse wrote:
> Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
> agree on the use of the SWIOTLB, if present. This enables the device to
> refuse to operate further if the driver does not support the SWIOTLB
> requirement expressed in the device-tree.

This makes no sense whatsoever.  Swiotlb is a Linux guest implementation
detail, virtio is a transport protocol.  Mixing them in the same spec
doesn't even compute.  Please describe the actual on the wire semantics
you want, and don't use the term swiotlb.

