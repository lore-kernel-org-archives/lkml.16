Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA327A107
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042986; cv=none; b=FxdarCuDcTv5ZrvCTMWAJ8i4EnxYo2hTl94QAA6Qi0EvCsaDKdm9sgHg+/3+mWIlx7LSfzeaio1Jriwvlvluy7pW8w1k72+XmwIo0xqM2cYo+iK54ey0welpe0DyO3b69JCj7YOZESJhX7qKtB6Mn0gC08LNJ/O7NDBK7PyCdd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042986; c=relaxed/simple;
	bh=8DYO87tL4uz15oxFGRFzhq4FVDsfxOJqXVc91boKovk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DG7S29cC65Xscs8LuQS3SRMGlmJFZqhkq3vN/fKAjqlTK8jhyNI2C8jTnHtTwMEChBc3uAecHMpr4QfIDLboawt3zUFC9v1S09r0asVa5Q77da1PqCxAn1HeTxHZDwu9LJ1evBvQdPM/86mScquWKaD4cfeAQIKQc0qTNVbbDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZJMwvcn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZJMwvcn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so4824875ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746042983; x=1746647783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fl3ZSe7H35q1B+EOiZUwtSQdGXkhze1P/MPuzRRU2ao=;
        b=SZJMwvcnxY4QDjtbwttO7EPipebLtB52QzGosHj8EZc6viUyhJE6bBISxoOciR/LcL
         zWO+MmJTdA95/Xy6lP2Q0mfo1pwkNXmwsjo+Z02KRe1jq6qTuM9tyagEFmPTaoxx/v4F
         km2Kj5wk8OxjZPdxqhFiVATxiSr94vgqQ/VW8fPzB8Ty/7tWSaxePf8RXp2BP7YXJl1i
         bLXaf16mAMx4BB7hOhBAxvBa6S0bjBxcRCCbmNaGK6bbd5yC07tT3b43jjiyvCHOv7zO
         8cD7SV1mOolZYR//p/0itfpvKvI3sLUGjyUPhgXMro/Nax1/BL2k2OaC9Ke/22RjA8J5
         rKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042983; x=1746647783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl3ZSe7H35q1B+EOiZUwtSQdGXkhze1P/MPuzRRU2ao=;
        b=HSMCVdYwdqAN1yk5RjJfohQ19JnGM30YjZQoGGx4Dno+vwdFY5W3Pp2Rnq2P0PPJRh
         2F8VDY609DopUrEMw/QyNbYlvX/+J1Bva0EDkDE0CWRiJV8JY2IAAqApypmsR3g+7Pe0
         qBxenD/2pdHvyDe+oR7r4HIZkrE5AqGnzxhFh6WwvidFqoypzy1PAP4Vh9pXNkKb7jYt
         XWcdP6Vx1+MrFhVojmCi0TTTRGSVD7C95L7GxWiS8sEAgdiwpBexcxpbDy+nbivwkc04
         zkMHIiKsTzLQLNe7fcKs1P677ePFEaKHt1x7FilyYfjQOYlMz6NNlOf13AWxHCSCkfvq
         Hs3w==
X-Forwarded-Encrypted: i=1; AJvYcCWj2n98x1DsHPppLzJoXjSK5lm4SrAlN4ExWW5m/Z72w095vFgQTBPsY5yChMtn/SekvzUpI5s7MdAIW6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93ucY73ssKzltcS6vmWiKmjel1VnrpNREjYiIJPEloKLuAMSv
	v030vzh780rZ5QKRfPMKdK2zTIXzONpRVcxcrQ6GuWpFarFyFoMmYC3NFM4MkjnQci2QcCEHpTp
	6RQ==
X-Gm-Gg: ASbGncvecny1LQOQOHs8z0a/Gk8IAzWp36d6KK3nu64+EFBpe/VLLdJE8r0xStrUwoK
	UBJ2IW8lDv3FIdQksO6XogcfvgqkrFhuKYxbNlZ9nF1FBYw0YWOrX6jpM1VT8x72gKoj5VM7Cwj
	vwhUSemYaXPJunqKsQE7LdrJ6LYYP/kOdTwyWyiqDhVcys1WHpc8C3cFtIhN4if7qxGTITHLDHV
	b8BbUmQ/PfiYoeK4Ef1mia9ODHj+N0Kax9WCjIhtsT7JakFfrfftUzY/ADPKlt9RwRuAuX8grX2
	9pALUgb46M+mQ3JSWc/+6DlWes29g6PCixT6RKJsi5g80TVvySJC+hwOKyDnGglbjAhn9m8YwWr
	CGlNkpA==
X-Google-Smtp-Source: AGHT+IEfvBtw6ZDkXGIV92ANTqElq200z1gKvtBKSpmArntOiAskzPFgnv57q18obGXP2jeZOb7RVA==
X-Received: by 2002:a17:902:f785:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22e041084e8mr4719445ad.41.1746042983190;
        Wed, 30 Apr 2025 12:56:23 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbb1a0sm126748995ad.58.2025.04.30.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:56:22 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:56:18 -0700
From: William McVicker <willmcvicker@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] bus: fsl_mc: Fix driver_managed_dma check
Message-ID: <aBKAYnP0u9ZlK12y@google.com>
References: <20250425133929.646493-3-robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425133929.646493-3-robin.murphy@arm.com>

On 04/25/2025, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_fsl_mc_driver(NULL)
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
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index a8be8cf246fb..67031136ef66 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -139,9 +139,9 @@ static int fsl_mc_bus_uevent(const struct device *dev, struct kobj_uevent_env *e
>  
>  static int fsl_mc_dma_configure(struct device *dev)
>  {
> +	const struct device_driver *drv = READ_ONCE(dev->driver);
>  	struct device *dma_dev = dev;
>  	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> -	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
>  	u32 input_id = mc_dev->icid;
>  	int ret;
>  
> @@ -153,8 +153,8 @@ static int fsl_mc_dma_configure(struct device *dev)
>  	else
>  		ret = acpi_dma_configure_id(dev, DEV_DMA_COHERENT, &input_id);
>  
> -	/* @mc_drv may not be valid when we're called from the IOMMU layer */
> -	if (!ret && dev->driver && !mc_drv->driver_managed_dma) {
> +	/* @drv may not be valid when we're called from the IOMMU layer */
> +	if (!ret && drv && !to_fsl_mc_driver(drv)->driver_managed_dma) {
>  		ret = iommu_device_use_default_domain(dev);
>  		if (ret)
>  			arch_teardown_dma_ops(dev);
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 
