Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF091DC9B0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042801; cv=none; b=s4OrSY3kW1LkTH+iCrnZ+ZiEzD26qvhy/9w0iDD4sbzYLkrtVRsfXVmEI2KfldDGuVunCfskMQxYn6L1reW5emTEsn+cfEg+DoEuLFcFigJDF0KDLwvKjGm8O9XY9YHV0vfEs9piWk4onEr6yKeanX+56sQqrNoNW7o8A3wWV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042801; c=relaxed/simple;
	bh=BYVYLOb7g/trPsg04aimiZO3eX+8p1FII3bTfBVJKiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRB27iCPygg0DYwnj/9KKHUGn0WakRzi7rUJtVa8IVizZALyiW8C+Vm0hh9lvYZW1fHl5+jgMAZWRHGmoTqXwv6VSRuD7td366dxK/9VySXLhMvkL/J0X2OebnVgl8+WmIeDCNyrEF2sU+3edfRlK9Pfgv8ZLUatYoX7S/HGBTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sePEARQn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sePEARQn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c336fcdaaso3123555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746042798; x=1746647598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sS3+hirRuenFYIB7Pzrup/YFqLZ6iZUt0EDXHvDSPdw=;
        b=sePEARQnSrbfSNZI9kex87GsRwtE0/dTQeCbwiZZNCQjup9h4F4SpBJ1KuJ8a5n7cr
         QTIAolZc3wt3u5dCyDHWO+qyR5ANNVj+s1piv/4zvqzmVMmHlqpJCeEZiYkrcUnCXPls
         ZcBMCPXZg+RxCTop+8A/+edHlF4w5soFrrSfrfpF2yVMjn8HwB/Yj6O2TCtM2HzvDmqk
         qVRXlvOiIc4YT+4c/jIJ/JWZc5r6a5PUZnsLXzCCLyBub9cTQ1iSQqbOIpPFGK6kneJP
         z6RVSH41BdZ2xuCtS2qamUfWqSFcn50YsQa2kv1setZimggZXdRA9DRce18i5XwXUUz3
         BN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042798; x=1746647598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS3+hirRuenFYIB7Pzrup/YFqLZ6iZUt0EDXHvDSPdw=;
        b=TAZqaRfMh325HpSjGLSJoEwEsZ6CAfrI681efVQD2CWltA+LlnhR+Sy3FpwRM39z/f
         CuMTbuo4OpoMX8IBtwSG/QyuxL/wobzZkwbEenUUiCbOQN/3HJn5u+T4JsN+o1oR+c/M
         E9BcgZ/VTzGYt07MIcb3bWT82dGjc9vQRjdD5v33GsYZ2iA1phGXsLEHQf/wmUENmSah
         jS0ij6+ff/2T8czh06kdxZp4O988XWJKnn3gQya7a+fRSTFgvSveQ+wq5Fc4Y9cPZysc
         Z98bwiQoSV43g0NsNrIrIw1wjnVRLCDBLU1NOiakgnd6tYd/xk0C6tQj+823yYu8enVB
         spwA==
X-Forwarded-Encrypted: i=1; AJvYcCVclP4TuVM4J0ITomc3vMye3xw55S9k8U62K2mPGZ1iev1Pux+TcE8pcKASRu2LQumKnuL7BSVNVOpEBdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcaMJWMKDjveRPDoPgCqGlZhR4ea+e2Fq1oWzAsUc8O9y4DRg
	n/MPzaVIsg9C20ePcOZXoToGJ44DOiZOo1QUUIomRkS/Ys4JEOgE936/+j6qQqYIOI7ig2eUViS
	mWQ==
X-Gm-Gg: ASbGncuKc1lJRCMI3fs26knijOqIjv+qnlnCqbNHOiFOCkJ5OqD/HzQRLzTqTA2itdN
	bvIeRNFx/Ep+j8zpVhi1jXCADHXvgGoAXzB1GVPG4yFZAtWqN9hXX6V9o6H8m7KTy5RGN7xLJVm
	pxD9D8UNTS0K2S+rrQUIBV1YT5O/hZNVehMw4WJ6VXtQlDnEcLvHD3qdjC1C/CbY8hoFlZMKCia
	IxsDfk8SRNggU8MI11n1OfuWdamVubj2sdkDsfpNXsDFoPdxzTjWZxegYqBPXPdLSWWcjMp0dSl
	G7CCHp/DURMCnubjpWSz9ueKLB1u7i/ScZ5R+mJvXCMkRr7C8VqULR5+Ji/nxyzN0f5LBq7DQKQ
	bHsgDDg==
X-Google-Smtp-Source: AGHT+IGcs0gQ+kH9gePUq2IzeHDztkv1kvHGzYIx5as0naNDy5hQJ3XvIttYTvlnG7jSfZ8vALUe5Q==
X-Received: by 2002:a17:903:3d0c:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22df34ff95fmr71796595ad.25.1746042798140;
        Wed, 30 Apr 2025 12:53:18 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76d56sm126604585ad.4.2025.04.30.12.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:53:17 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:53:13 -0700
From: William McVicker <willmcvicker@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, Russell King <linux@armlinux.org.uk>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] amba: Fix driver_managed_dma check
Message-ID: <aBJ_qfy9cP_m5fSw@google.com>
References: <20250425133929.646493-1-robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425133929.646493-1-robin.murphy@arm.com>

On 04/25/2025, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_amba_driver(NULL)
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
>  drivers/amba/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 71482d639a6d..84bc788663e6 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -353,7 +353,7 @@ static void amba_shutdown(struct device *dev)
>  
>  static int amba_dma_configure(struct device *dev)
>  {
> -	struct amba_driver *drv = to_amba_driver(dev->driver);
> +	const struct device_driver *drv = READ_ONCE(dev->driver);
>  	enum dev_dma_attr attr;
>  	int ret = 0;
>  
> @@ -365,7 +365,7 @@ static int amba_dma_configure(struct device *dev)
>  	}
>  
>  	/* @drv may not be valid when we're called from the IOMMU layer */
> -	if (!ret && dev->driver && !drv->driver_managed_dma) {
> +	if (!ret && drv && !to_amba_driver(drv)->driver_managed_dma) {
>  		ret = iommu_device_use_default_domain(dev);
>  		if (ret)
>  			arch_teardown_dma_ops(dev);
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 
