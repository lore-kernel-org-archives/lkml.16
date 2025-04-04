Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FD79F5;
	Fri,  4 Apr 2025 06:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749162; cv=none; b=LKRxNL+j+K+sD6zhy6ngJgoYFyGg2P/pkq+1Dbp7WrKU60S3Ty2aZS5q4TFWP3aZt30SydOvFb7+PutCTZ/uCnONsel6poDAqa4oeNma6xOXaZ0eoFad4mh5RGZ9wfcqiQV/VOn/RSM2ywlOfQ4ruUMbuhi115RKeewYIw1+tzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749162; c=relaxed/simple;
	bh=uUWg9QhErzXI9QGfmIU6XMMspD+vl5V0pvC/GXoEARE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piL1F5XqDZ+Njk0+BLt0EDoMC7MfzDXV4/HhC+NZ3StZKnIbsjNGDWv6wT7svLF3DhKBObd4iGJUy+sGMsKTMffew/TsmwAj2rVjIqAzkiWaakuh3sXTqu3VqtyuOFFLQ3ePPil5Upxgym4dXQJbzZzbIs03Vvld5kO73MMxLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RlWJmOJX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RlWJmOJX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EGXw7PEXY3s5iB8Oj1X2X1hvn8HladWfj1rgTSNVE68=; b=RlWJmOJX52t+LCpesEj4XAsm+2
	dt2t3mL9vib+D/KcR/fNXz6kYPcNIdSfnkkS2oDC0vmFplZOy2+zcaIsUTv/PiH/VoXcSko4Yn4R/
	yEWc0CU2JP3PR045LCFvmzZy//ZjA2Uno7Jm9Q58Po62/RjCzd4tgjrG30ssTdReu2ifYpTAw3rFT
	9EAB4iKoCE73sNpRXaAj/k9kIi9jGCDNTKC3lhf5wBQkrd6fTP2EfUPbPCc0IytpJLZA9L/+m0vRu
	6jo4g5FPfAXfnL3OJTaewwFC0lxS9G2k/NFBzVfLDeujWF1PnV8vOzAKpNT5ryQkdOWkOea0dLYk7
	dvGV1RHg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aoQ-0000000AurD-3mln;
	Fri, 04 Apr 2025 06:45:58 +0000
Date: Thu, 3 Apr 2025 23:45:58 -0700
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
Message-ID: <Z--AJt32atl_l3kY@infradead.org>
References: <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
 <Z-47O3vkyIf0mzdw@infradead.org>
 <cdd979bca2b8cc4ff170442d968b63f2b3f0ccd6.camel@infradead.org>
 <Z-98Lqpq4mZN545Y@infradead.org>
 <488D32C6-77FA-4CC8-988F-CD4D14548D4B@infradead.org>
 <Z-9_2IDmEWLKDKgj@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-9_2IDmEWLKDKgj@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 03, 2025 at 11:44:40PM -0700, Christoph Hellwig wrote:
> That's what NVMe currently does in it's second attempt to get things
> wrong.  It mostly works for the current use cases, but there might
> actually not be a single canonical address where it is mapped.  This
> was mostly theoretical, but with SVM and especially SIOV it is becoming
> a real thing now.
> 
> In the worst case you might have to limit yourself to one address space
> per request.  Or have a bitmap which buffer in the request uses which
> address space.

Also with unordered I/O in the newer PCIe specs we might need another
such address space bit to force use of that for certain ranges, although
system use cases for UIO are still not finalized.
