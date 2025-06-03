Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86D238D49
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960686; cv=none; b=FEu9/+4VbaMQf1wZgyCbEa/tT7waKuFHSZtPXlSOa6tLy8KpOHZeaXjTGNWpDW0PyTRsXob1+Mh2MmnQZ1eq2xtey3SqSqkVbRb6qjaW3/ZlP4u+Eg6ihZUPmgAYJwY73sqft7jP9Zpk0uZM9Kpr0vbmp1ManH/LKDARre/9Xc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960686; c=relaxed/simple;
	bh=8P8VpDyERLX0d7YNci0mUwMHPwaKMA33bffoWYiDOoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uss3t2z8FLeW07aDfDdCFs99LVIWmPttrFNWygHgdAYuBOIssrMgAF4qpJ9x9OXUJtiKw44o/G1vlZNSn8BxFnvfKwm8weE5LCEtSyidPvXGD64fMDWy4d2iPUk/TPAQfEd4NVWQ5fwHw7kNz9CCSXqHyDZv46/0YjZ/W1cyIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcZZUlY4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcZZUlY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F937C4CEED;
	Tue,  3 Jun 2025 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748960685;
	bh=8P8VpDyERLX0d7YNci0mUwMHPwaKMA33bffoWYiDOoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcZZUlY4T6EfydwCQ090MG6vqI7M4UU9SIKhGZRzBEnWbgz/cP1Uy/djS+adVoJNQ
	 NwWME4e3vLT/EELNQnDkSgIN0y1aNf4ZGKWCDPo5D/xAPt+q4hyNS6UnuXOlGufVCl
	 aSfrdoWeAuHab//2ghDX/LhcrAp3UOwKdAf3lstikV4Pwg0tWWdtTEHK0Wlkc2A2J9
	 0E8lWXJQ7ZH959nry1KBohTeWMB1TgLyBaAE0YS174Cyqn+Qc2mHz4wROWHJwkjj/F
	 IroNYxEkovS4Ok4uCF7bLQH9LS2TKBRRB9hAYYB6BvLia1enGpH7axLzxTsG99QxfF
	 VSXmpo7Rrykwg==
Date: Tue, 3 Jun 2025 16:24:40 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] PCI/MSI: Size device MSI domain with the maximum number
 of vectors
Message-ID: <aD8FqJvZWaZR7J9m@lpieralisi>
References: <20250603141801.915305-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603141801.915305-1-maz@kernel.org>

On Tue, Jun 03, 2025 at 03:18:01PM +0100, Marc Zyngier wrote:
> Zenghui reports that since 1396e89e09f0 ("genirq/msi: Move prepare()
> call to per-device allocation"), his Multi-MSI capable device isn't
> working anymore.
> 
> This is a consequence of 15c72f824b32 ("PCI/MSI: Add support for
> per device MSI[X] domains"), which always creates a MSI domain of
> size 1, even in the presence of Multi-MSI.
> 
> While this was somehow working until then, moving the .prepare()
> call ends up sizing the ITS table with a tiny value for this device,
> and making the endpoint driver unhappy.
> 
> Instead, always create the domain (and call the .prepare() helper)
> with the maximum expected size.
> 
> Fixes: 1396e89e09f0 ("genirq/msi: Move prepare() call to per-device allocation")
> Fixes: 15c72f824b32 ("PCI/MSI: Add support for per device MSI[X] domains")
> Link: https://lore.kernel.org/r/0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Tested-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/msi/irqdomain.c | 5 +++--
>  drivers/pci/msi/msi.c       | 8 ++++----
>  drivers/pci/msi/msi.h       | 2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index d7ba8795d60f..c05152733993 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -271,6 +271,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>  /**
>   * pci_setup_msi_device_domain - Setup a device MSI interrupt domain
>   * @pdev:	The PCI device to create the domain on
> + * @hwsize:	The maximum number of MSI vectors
>   *
>   * Return:
>   *  True when:
> @@ -287,7 +288,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>   *	- The device is removed
>   *	- MSI is disabled and a MSI-X domain is created
>   */
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
>  {
>  	if (WARN_ON_ONCE(pdev->msix_enabled))
>  		return false;
> @@ -297,7 +298,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
>  	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
>  		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
>  
> -	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> +	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
>  }
>  
>  /**
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index d6ce04054702..6ede55a7c5e6 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -439,16 +439,16 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	if (nvec < minvec)
>  		return -ENOSPC;
>  
> -	if (nvec > maxvec)
> -		nvec = maxvec;
> -
>  	rc = pci_setup_msi_context(dev);
>  	if (rc)
>  		return rc;
>  
> -	if (!pci_setup_msi_device_domain(dev))
> +	if (!pci_setup_msi_device_domain(dev, nvec))
>  		return -ENODEV;
>  
> +	if (nvec > maxvec)
> +		nvec = maxvec;
> +
>  	for (;;) {
>  		if (affd) {
>  			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index fc70b601e942..0b420b319f50 100644
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
> -- 
> 2.47.2
> 
