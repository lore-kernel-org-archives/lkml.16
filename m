Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF5275869
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746043024; cv=none; b=Kh/CIlwOwjUZYzKwOV+SCHMXRQkDyes8Ih1riBEhjAYc7rUmP+f+4eFBju3jbQeBFrISn38TcBkpUaZdWQx2Hyp4six8gL3b2LGZg6BSVS4YEyER8pbZXZpod5j512ghbMYGl9F1lX5oQcnZhAZmUCNtUWo9eWk43exDYr0TYmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746043024; c=relaxed/simple;
	bh=3qDTN+MBFQnDotoSGCXSC0TIqshMNt8VgM+VnIIfAOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIXFpTm2bMY2CJ1DJRKtY6t1mxmSQcat/ZFF9KWo61x1ZNqe5eU7ghP9AazNicMK/KIanmfv4SJ9zP1LI1vGBxMkXHMjM/9uzsV3rfdRDxuVX62m1YoYPqIWix3pKvb8hH/3kRj6f22bS4wXMuaeahtHxbApxTNXn3GCX12YO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0UCulZlC; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0UCulZlC"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301cda78d48so434211a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746043022; x=1746647822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+qKL+MUCJJ9XsZqOZSeMflU/a6s+djka0YUBDd9w14=;
        b=0UCulZlCbxaaCS3q43QZ3WRx/9PzbnP9nvapKHzj4tFYNZexmgPVwAi47XnyVAAtRF
         Mbe2Wn8vuwL4dQrzZLT5vGJBktrt7bD5a9GO9qskzgZNLKNVTLv0kJB0neRMq7A/VKcE
         jJUtZ5x+QwVQIEAKOBNo2Fcsc07nGy5lrQ1msL0UN5HRNvb7NzpUjJeH1D8Hhj630Cy4
         DoTMhccWcdy2IFqaTSeP5w+q6NW/6DWhxPSHjK1ph5wNpS0L0qQLiXAVrOD6MhK2MaEs
         3PyFO3f2FwQD2o96VoJZDsWF5oGeMBedKfiXWeEeksdW87hfaVGWQh+8Lt1Ml7UykgCu
         Of9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746043022; x=1746647822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+qKL+MUCJJ9XsZqOZSeMflU/a6s+djka0YUBDd9w14=;
        b=rI5MsTWGcVvUqkjNupO94P6ma5aylOY0MMBzvB3TXogkZaFPByoYodPaDIz1N0oy97
         FfxRqQ8Qc+izen9IdAho3ZjvdrKEyxINyfrXFL85o0feR330nh/4407oB4aC2/fOxB0q
         LnYhCFMPFAcyJkycZolSTSc/sZ6yEfq9Uu4eN6JQ5OoBPSC0nXe0zUVKVTZaXPysb61q
         JEC/rKdj/sQG4aRdgBjlAwrW9iq4SABmdiy2GtGO3t1U4LEEed93s7fPBFGk5DtTP3/S
         MNU7zikBgHLmtZCz5An4F6c6ahmJsbV7MOCtVlkfdjhx3mLFEk3Mi2xYf0lRE/hox8fJ
         DPdA==
X-Forwarded-Encrypted: i=1; AJvYcCVbdPxXOPbR+1igLFdfcW6ltMMmmj29ONK5cWAes128z2PRbNla8OmGGwZMt4L+v84cgR0DIbdpzWJCVgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtyQTgv8/uyUbRz8vR2Skc7QcnsvCyVoLb508jx0+WhcP+L6Gs
	8tQQez/DZe+5pWoPAfogfXNCEWcFa5RYLRbuxD9R9lJ5Uc4AEd1HEL/fQ0QnUg==
X-Gm-Gg: ASbGnct1UFAjZn7HiY+0AEM5LQ40zxWDF4PDUgHp0Chtjk6FGukHDuEBp/4ReWzHTua
	pQiTV8xLd/ZezW0giLIAwPS2S0Mf2Fg0u9rwN1KlEXOJc36p6eSSQXR8V4m7DNHK/GiZ315u769
	8C2vPezEEyuYCl0g7HWc5jOq4oRNo9svOiYX0YG3LMTLItsxyZyshCc0O2MIX/LveeG6MsX5AUg
	9NyT9YFoPepiruQvXHfn0AmBfsBAB7/C8dEyZ+ki+reJ+RM81ADdJ2EeiKbeBhP4LjGz6pvwXYw
	hgjnkJUpYdhVGX/5jB5Ll25I2FZb2+eXm7naIQkyFKTRVsgFUAdoeTjOsQz6sujVssFuDhmpQx3
	URU3O9g==
X-Google-Smtp-Source: AGHT+IFYLwXsSVzpZ58dXpoeXLiC5qkI9bTIycsk32TydeZra3btf6V9VE3JspqpRKaeMTjXf206sg==
X-Received: by 2002:a17:90b:3812:b0:2fe:b016:a6ac with SMTP id 98e67ed59e1d1-30a41e6c2fdmr10756a91.15.1746043022099;
        Wed, 30 Apr 2025 12:57:02 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471ee7esm2100393a91.4.2025.04.30.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:57:01 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:56:57 -0700
From: William McVicker <willmcvicker@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: Fix driver_managed_dma check
Message-ID: <aBKAibjRdrYVEWAM@google.com>
References: <20250425133929.646493-4-robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425133929.646493-4-robin.murphy@arm.com>

On 04/25/2025, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_pci_driver(NULL)
> is already computed, and thus the check fails to work as intended.
> 
> Will and I both hit this with the platform bus, but the pattern here is
> the same, so fix it for correctness too.

Thanks!

Reviewed-by: Will McVicker <willmcvicker@google.com>

> 
> Reported-by: Will McVicker <willmcvicker@google.com>
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/pci/pci-driver.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index c8bd71a739f7..66e3bea7dc1a 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1634,7 +1634,7 @@ static int pci_bus_num_vf(struct device *dev)
>   */
>  static int pci_dma_configure(struct device *dev)
>  {
> -	struct pci_driver *driver = to_pci_driver(dev->driver);
> +	const struct device_driver *drv = READ_ONCE(dev->driver);
>  	struct device *bridge;
>  	int ret = 0;
>  
> @@ -1651,8 +1651,8 @@ static int pci_dma_configure(struct device *dev)
>  
>  	pci_put_host_bridge_device(bridge);
>  
> -	/* @driver may not be valid when we're called from the IOMMU layer */
> -	if (!ret && dev->driver && !driver->driver_managed_dma) {
> +	/* @drv may not be valid when we're called from the IOMMU layer */
> +	if (!ret && drv && !to_pci_driver(drv)->driver_managed_dma) {
>  		ret = iommu_device_use_default_domain(dev);
>  		if (ret)
>  			arch_teardown_dma_ops(dev);
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 
