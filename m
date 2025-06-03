Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F16231828
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957403; cv=none; b=cngLjIcg1Fg4e23MDUQOH47K6v2mhJxjfErZ0ihGr4I7iMl3ohjtyNpvZfpGy4xIsYS7kOiezvLOilvmaSrJRapLVofZgeW0qoAbq53unjaesZ/Hh8X1pqV6ko4T+h1D5bMtcfM3q7UoGz0DqAhlE0H05czOzQ0+7tUlgCfclT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957403; c=relaxed/simple;
	bh=SqETY9ANTPbdK3VFt37imgf1Txorsar+chC5aa3Cp0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdWjrcUSjhHgiywENR0evgl8zr5TQ7spzsZirHJL8fDEAgQUXfJLneoj7/qwXp96AjPrjYLwR5lRfjTJkTmzK/NDJRtXW1tWJvVFDB/fI2JAF1KxA7yifx+6gpMPktPk0iU9tPU3+9m7H4/HmqtFWjlKx82bOrs+vIQ+HBn2Gxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1VzN47+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1VzN47+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0795C4CEED;
	Tue,  3 Jun 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748957403;
	bh=SqETY9ANTPbdK3VFt37imgf1Txorsar+chC5aa3Cp0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1VzN47+SCfNpJNJCugePfyugbmrcTXkDh+X/O1lCNcpPA0+A7QyVYrO9TFGii7K0
	 ba8j8G9hShux9EHPwz9xhjx2G/qXp+mGGiTcGH962uW++Ors+MQU1fjDZBteyF39Q9
	 2OSN/Ibgu7YfsFQyuWPKKvl29aVceqReWpNaBBsYV9PI9GMf8PpIwVM+9BK2uP2sif
	 JMr+onb9T0O0zB9RQyVpuJWJPoa2V0oLuJgV0T9UYS6wI6qpl7qhskF2x1c5U9AFp3
	 M8RLM3wOGavIrZbSvhhr+Y/4mnPBe56NXQ6pMwqDo0vF6xwDfLC9ixv9kMMQzQrAz2
	 ru67xXhnpJAZw==
Date: Tue, 3 Jun 2025 15:29:58 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
Message-ID: <aD741hI7MfTmi7Rl@lpieralisi>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <87ldq9dm54.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldq9dm54.wl-maz@kernel.org>

On Tue, Jun 03, 2025 at 01:50:47PM +0100, Marc Zyngier wrote:
> Hi Zenghui,
> 
> On Tue, 03 Jun 2025 09:22:47 +0100,
> Zenghui Yu <yuzenghui@huawei.com> wrote:
> > 
> > > +	domain->dev = dev;
> > > +	dev->msi.data->__domains[domid].domain = domain;
> > > +
> > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> > 
> > Does it work for MSI? hwsize is 1 in the MSI case, without taking
> > pci_msi_vec_count() into account.
> >
> > bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> > {
> > 	[...]
> > 
> > 	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> 
> Well spotted.
> 
> This looks like a PCI bug ignoring Multi-MSI. Can you give the
> following a go and let people know whether that fixes your issue?
> 
> Thanks,
> 
> 	M.
> 
> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index d7ba8795d60f..89677a21d525 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -287,7 +287,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>   *	- The device is removed
>   *	- MSI is disabled and a MSI-X domain is created
>   */
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
>  {
>  	if (WARN_ON_ONCE(pdev->msix_enabled))
>  		return false;
> @@ -297,7 +297,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
>  	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
>  		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
>  
> -	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> +	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
>  }
>  
>  /**
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 8b8848788618..81891701840a 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -449,7 +449,7 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	if (rc)
>  		return rc;
>  
> -	if (!pci_setup_msi_device_domain(dev))
> +	if (!pci_setup_msi_device_domain(dev, nvec))

If pci_msi_vec_count(dev) > maxvec we would cap nvec and size the
domain with the capped value.

In __pci_enable_msix_range() we are sizing the device according to
pci_msix_vec_count(dev) regardless of maxvec, if I read the code correctly.

While fixing it it would be good to make them consistent unless there is
a reason why they should not.

Lorenzo

>  		return -ENODEV;
>  
>  	for (;;) {
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index ee53cf079f4e..3ab898af88a7 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -107,7 +107,7 @@ enum support_mode {
>  };
>  
>  bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask, enum support_mode mode);
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev);
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize);
>  bool pci_setup_msix_device_domain(struct pci_dev *pdev, unsigned int hwsize);
>  
>  /* Legacy (!IRQDOMAIN) fallbacks */
> 
> -- 
> Jazz isn't dead. It just smells funny.
