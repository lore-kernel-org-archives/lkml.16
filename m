Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438017A2EA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961450; cv=none; b=Ni40E0l3o2i7LmdyisSedlrbW+lTud/N1ExWNzTNRh/gQqpYlC4MSVlwSuPvhx+xkNizF4CsYCpgKiuiVhnjk6qFXweco4VQ4y2Phd2bu6cfu3ntv6IPPs4o7AEao3gHNEAaQ5tFJK3kiyRv7ptHoydYbQtcoeLHGrIbDeV7KWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961450; c=relaxed/simple;
	bh=m27aq/uff5R7/6shxNmKRc5alXNmEne/PxgWTW+/ut0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGdWLeCLx4a1y8xdAcJVxFSZKSd87lBqHgh8vThsV9DK93G7XAiim1QmalgvBiGpVYuGJZ0CrPpWS4GHTWW+LlA9djr4c6BQrLT2id3emBPi/jXLyYvYz8HZCljaLEMqD5P8lRVI2lhKeOw8YRS7FcvuT95rM/DOm39P+41RjvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mwi166Am; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mwi166Am"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4B2C4CEED;
	Tue,  3 Jun 2025 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748961449;
	bh=m27aq/uff5R7/6shxNmKRc5alXNmEne/PxgWTW+/ut0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mwi166Am/NgJs/eDzkpMeigJrf7vlPoBKzdgoDOlCcDDh0tF8R6ld3PatFpTDFa1N
	 VQ0x+F5XS4xRl4NUr4Qt3dgehgKfNHVIoIl6eurRca1Vabhnkfuc9tsLg2fFqL4xK5
	 bqa1/qBp+CzGRHL//qEhtyvKdZCEl7TtNqm++mEYlh0ld/wC2goFHPX5A5WYMfsGvi
	 DzYChK/dm6yo+fk5MKZkkdLTf/dz0rO4wkfofIUfRpR0/q73CufT0Gm12rjo15Sice
	 XlF4bg7EwwxsPJsOj12viv1Bbu/zKKnCUiVAsJN0m9t8wG4HqPcswEG/Mx+0EEtC0S
	 XNXpNmoYfwfOw==
Date: Tue, 3 Jun 2025 16:37:23 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
Message-ID: <aD8Ioy+v8k/i0e8B@lpieralisi>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <aD7B96BiSb6mK9Bj@lpieralisi>
 <87jz5tdl9d.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz5tdl9d.wl-maz@kernel.org>

On Tue, Jun 03, 2025 at 02:09:50PM +0100, Marc Zyngier wrote:
> On Tue, 03 Jun 2025 10:35:51 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Tue, Jun 03, 2025 at 04:22:47PM +0800, Zenghui Yu wrote:
> > > > +	domain->dev = dev;
> > > > +	dev->msi.data->__domains[domid].domain = domain;
> > > > +
> > > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> > > 
> > > Does it work for MSI?
> > 
> > This means that it does not work for MSI for you as it stands, right ?
> > 
> > If you spotted an issue, thanks for that, report it fully please.
> 
> Honestly, you're barking up the wrong tree. Zenghui points us to a
> glaring bug in the core code, with detailed information on what could
> go wrong, as well as what is wrong in the code. It doesn't get better
> than that.
> 
> The usual level of bug reports is "its b0rken", sometimes followed by
> a trace with lots of hex and no information. Spot the difference?

Agreed, thanks again Zenghui for reporting it and forgive me if the
message sounded a bit patronizing, I did not mean it.

Lorenzo

> > > hwsize is 1 in the MSI case, without taking pci_msi_vec_count() into account.
> > > 
> > > bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> > > {
> > > 	[...]
> > > 
> > > 	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> > 
> > I had a stab at it with GICv5 models and an MSI capable device and this indeed
> > calls the ITS msi_prepare() callback with 1 as vector count, so we size
> > the device tables wrongly.
> 
> Not wrongly. Exactly as instructed.
> 
> > 
> > The question is why pci_create_device_domain() is called here with
> > hwsize == 1. Probably, before this series, the ITS MSI parent code was
> > fixing the size up so we did not notice, I need to check.
> 
> The GICv3 ITS code would upgrade the vector count to the next power of
> two (one bit of EID space -> 2 MSIs), but with the device domain
> squarely set to 1, the endpoint driver would never get more. It is
> prepared to fail gracefully though, hence nothing really breaks.
> 
> I don't think this patch makes anything regress though. Commit
> 15c72f824b327 seems to be the offending one. If Zenghui confirms that
> the hack I posted separately works for him, I'll follow up with a
> "real" patch.
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.
