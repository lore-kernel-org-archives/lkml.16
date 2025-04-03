Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3524167D;
	Thu,  3 Apr 2025 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666289; cv=none; b=tdEwqGAfeFirrcHA+VjeREqvX0HgAMJyEB3YmwAqE31bII62GlUm3DH9CJpP/okvXfeShdf4maIkmRPHcWstLiAAmCll2jvUH8SlDKTlF2Mg5oOXw7kSYreI1UR6FghYWr+lZcXbGKxbJ2XhaxdPl0s3JnJcprjkMalGwu2SeTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666289; c=relaxed/simple;
	bh=nBIcltQZNSJSeJcVlDAWs1DczIo6DIsS7I5l0/GkUm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtlLz7xQzP4BRYCPWi6mae7IaJzgDmUHKgMaIkSBng+z4+hG9IqnIfHq35hGtJuH8CDogSTNfMpcyEz33wOiasTPshg8B8NvthHSQZeO/K8bs7oQflyVbLVEow6lJTTYmuLX9QTlAQrIiwOzfEhsL0sJwmknpmclePZhrgQZ1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qv6zWAeU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qv6zWAeU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nBIcltQZNSJSeJcVlDAWs1DczIo6DIsS7I5l0/GkUm4=; b=Qv6zWAeUIY0Vtbpp83QhnfISu2
	4ghv4UddYKGczy7Mr1729cLMlaUhaTjDnb5EGcrNcEtimPBG3ICMZgZp2s1SScGtFQF005ye6eAxY
	RHCvn+NvVR9KopeGlBzqvSj6zRpXkU13LiKhIElH2Ii9+uayrnIp92TM8HuISssy8FX+oH8EWTD4g
	J7jEEo97VW4H3zG8IK0Iwh7/AKwl1ry/SgjmluKTT5DpBx3YJCv8gjweD/USYFIOKzRr56sMi2ZqH
	3JfeSL+XvFCl2+09tw+5Fsolc/hShbI+p03BI5IntCqI1S2PPDoVyhN6v45fqYiV9uiRv9H88HovJ
	kxTPdpCQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FFn-00000008A0d-40Nf;
	Thu, 03 Apr 2025 07:44:47 +0000
Date: Thu, 3 Apr 2025 00:44:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	virtio-comment@lists.linux.dev, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <Z-48b7jEpqZhbu9U@infradead.org>
References: <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
 <Z-47O3vkyIf0mzdw@infradead.org>
 <20250403034143-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403034143-mutt-send-email-mst@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 03, 2025 at 03:43:31AM -0400, Michael S. Tsirkin wrote:
> Hm. This is what this proposal does, indeed. Can be changed though -
> since all accesses are now within the SWIOTLB, they can be treated
> as offsets instead.

Yes, marking them as offsets into the BAR (including potentially
picking a specific BAR or region if there is more than one) is the
right interface and implemented by various hardware that way.

