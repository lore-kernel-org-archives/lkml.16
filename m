Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9AF149E1A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160300; cv=none; b=oKaN8bXViIwP+hrBfEP6LT6Jt49xxlgpogFA/ONOszyT8MPLat6gp0i50vTMuiZO0V30zDaFa9cn0fFxRLOaz5hQhK/8fU+7wm/aPh+YF1DGw4paTTrhPseiH0kB9xGiyx1n4mDOprq4yCKgmAchCTKPNgwQYMg/CGG7vF9NSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160300; c=relaxed/simple;
	bh=/oegG0DYsf8+eZbpRhMQF1APNdBnPMoD3Tpoy0gnUsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGzIqpUOCLSA+EqKXxZLYRz8y8p1Sp6LoN5arRaZC/ZPbXwFxrvZGMjI0j050xcQadNAsN8jQBj/4yHdvnFZF71c8JaI0GvstcebtPycI5gmCKeczlc8dBjkz2eoMZqwMLX1cEoQ99lotFE+EAxxJ7UOf6wza+RzGnEy/G6m4T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5550B68C4E; Mon, 10 Feb 2025 05:04:46 +0100 (CET)
Date: Mon, 10 Feb 2025 05:04:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH] nvme-pci: Use NVME_QUIRK_SIMPLE_SUSPEND for Qualcomm
 Snapdragon 8cx Gen 3 platforms
Message-ID: <20250210040446.GA2823@lst.de>
References: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org> <20250208185124.GA1120888@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208185124.GA1120888@bhelgaas>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Feb 08, 2025 at 12:51:24PM -0600, Bjorn Helgaas wrote:
> > +	/*
> > +	 * Qualcomm Snapdragon 8cx Gen 3 (SC8280XP) platforms doesn't retain
> > +	 * power to the PCIe bus after entering low power CX power collapse
> > +	 * state during system suspend. So shutdown the NVMe devices to have a
> > +	 * working system suspend on these platforms.
> > +	 */
> > +	if (dmi_match(DMI_PRODUCT_FAMILY, "SCP_MAKENA") ||
> > +	    dmi_match(DMI_PRODUCT_FAMILY, "ThinkPad X13s Gen 1"))
> > +		return NVME_QUIRK_SIMPLE_SUSPEND;
> 
> I certainly acknowledge that this is a big problem for users.  At the
> same time, this seems like a maintenance nightmare of
> platform-specific hacks scattered through endpoint drivers.

Yes.  And it's what we stated that we won't do multiple times.
This needs to be taken on in the firmware or at least core PCI/PM
code.
