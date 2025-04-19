Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17691DEFDC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745081524; cv=none; b=DXLrHRdxGQ7delubI49WNk3rLEGy8QyOUiMGaywJuUXGdgQTFVASKJCNA3PetlIUzajVGYs7fho04ynNHfH4lc+W3Y1uP9fMBj9qVivIpbiuZ0Vxfa4E5GWhVlnguVz6zq9VFzDVDefghO7O3/Qj2QnTvkJzXki9vt+TUlfP32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745081524; c=relaxed/simple;
	bh=0umZVab4MInIm6Hh9sW7E6pBic4UWXBleyLmUV0NDJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyziIuV9Ma9aS0kG9gORUv0A1PL0Xr7PVWflIw5e6kekLKz5HD64xs3Hn5lGrYV8ZNZ6C4AQmZK3CM7Ta32HtgayP+kPkmZS5DqCPbqxDLTS9hkWc+i5RrMls2BMbs89Sr8P9EIooIMti3xh3WeqDHr+RfCDe5dIcjv7N1f891Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v58tI5tf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v58tI5tf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fd89d036so33688505ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745081521; x=1745686321; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+ZQg5iuK94qPLtJ84KAwd3BvA9WmtkRkwUWNrpfTPA=;
        b=v58tI5tf286k4dhYLLj/7Tq4eqUckl+Xz/PppA2E7MsTB9pUXI/R0tUPok235vOwlQ
         tQZBUe+hxbWFXaaf3B6Bm3RhOgXodPSJStPHR5G4JLXdctEpVV4PBJjt7ExRyGvNFH9E
         uYYx0ZiNI7ANP3JCPV8j7Id9q9l9I15UDG+acrpgqMjunrA7ZRI/8s0F942YF0i2WLa6
         oRyQSmHdg4cy9a9+CNSryj3S02kJkCTSORpwGRDt/e6dbJ+LJLqYBkbR/XdBWkHYkV7d
         aYdFsJ8nDiwRmjjHWd96wRza34NyNL0sSTSfzF+ZCKejE6EKYtDmut2Yp2suM+5bkRmr
         MvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745081521; x=1745686321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+ZQg5iuK94qPLtJ84KAwd3BvA9WmtkRkwUWNrpfTPA=;
        b=FF7aYFI16zybua8M7LBCROuqu1qBHDC0CJbwmN1ADDO1YHokXLCNv7CZfSlKqSLpai
         uQ8FJGHfAKY4O12Xg9B9BoMSRNf90WYReKpUXWYA77QCV2K3UrCMlWwS3M42jw19NIaK
         SV1tGvD2DpSQvKXww96kwpkggHU1s5ZMK2nno+XO3QiUxmAyzmkwSf+Sn5ZPKQkx7esP
         lQLCCzOnhc+zNhJPX4Z7K3Sjhr1i0UrmkeLAeb6R/nbVS04w0xbYuqJRJt9NUg2flAIX
         VRGgOMR3V4qaoQua2rF9BVeYO/396wJZQIvpYoF1eIhUBTFJ4mhT6pNfiOrYrKVSNqma
         NhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBzZ8/S100ispFZCdUDSrH8+pQvpIDHy5G/szvokPNKIjH7D7tXmpd8qlD6T0W/LeckH8gRJ0hOYbDuZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPU7MmpTto6dbx3+8w8wosJ3k/xhQaNZf4+zbhjne5VEftjRsn
	mNNbULpGmpOyeyV3CuESvXzq2llMKACNo7E19rULcIfkzunYyw8yAjuIo0sA5w==
X-Gm-Gg: ASbGnct1SfZt4cxD/Yo1SdxqKHUeZ7qMzeumWClneizmbo0QlIgEc+x9Bu8ORqcqXdp
	tA8pbxzRKRVzQMXFquFnleJaQm0sFD0inly4hiBxVR6LfS4DYhVMc1FXJGyR0kFftEsgk93dO0R
	naIOUvMe7yIavd6FdpGLsdykWHjYUFd43GEmRBSKPrr8FeBdwvDLvN5RTZcMa0zu78343UG2nKf
	yNJP7OLYJ4wV+vG0RzUJbHD1kGcVvkwFpOW/R8jNTWA3pqmksi92ZmgXiXNJsCTpjOqy1Ce7/qa
	46r3VSMl/J7ocR5mPyuPA20Y4RnSVamE0MlrK1W4g9A5bkpJqZcYwZz/POWuNQ==
X-Google-Smtp-Source: AGHT+IHOvuDRuhzgmIYZ0PseMo6wMw5ZW9e3ASq9UuPs4rj4cDesFYOxLb1JejQpj1NRcFCMCHE/VQ==
X-Received: by 2002:a17:903:228a:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22c53620bdfmr86912015ad.53.1745081520863;
        Sat, 19 Apr 2025 09:52:00 -0700 (PDT)
Received: from thinkpad ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde283sm36154275ad.6.2025.04.19.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:52:00 -0700 (PDT)
Date: Sat, 19 Apr 2025 22:21:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, s-vadapalli@ti.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, rockswang7@gmail.com
Subject: Re: [PATCH v2] PCI: cadence: Fix runtime atomic count underflow.
Message-ID: <pjacxodfaywqxabqeftguqcrz2eoib5l5l32oevy5j5rrwl5s6@hhglbkyrmnzg>
References: <20250419133058.162048-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419133058.162048-1-18255117159@163.com>

On Sat, Apr 19, 2025 at 09:30:58PM +0800, Hans Zhang wrote:
> If the call to pci_host_probe() in cdns_pcie_host_setup()
> fails, PM runtime count is decremented in the error path using
> pm_runtime_put_sync().But the runtime count is not incremented by this
> driver, but only by the callers (cdns_plat_pcie_probe/j721e_pcie_probe).
> And the callers also decrement theruntime PM count in their error path.
> So this leads to the below warning from the PM core:
> 
> runtime PM usage count underflow!
> 
> So fix it by getting rid of pm_runtime_put_sync() in the error path and
> directly return the errno.
> 
> Fixes: 1b79c5284439 ("PCI: cadence: Add host driver for Cadence PCIe controller")
> 

This is not the correct Fixes commit. In fact it took me a while to find the
correct one. This exact same issue was already fixed by commit, 19abcd790b51
("PCI: cadence: Fix cdns_pcie_{host|ep}_setup() error path").

But then, this bug got reintroduced while fixing the merge conflict in:
49e427e6bdd1 ("Merge branch 'pci/host-probe-refactor'")

I will change the tag while applying.

- Mani

> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-host.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 8af95e9da7ce..741e10a575ec 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -570,14 +570,5 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	if (!bridge->ops)
>  		bridge->ops = &cdns_pcie_host_ops;
>  
> -	ret = pci_host_probe(bridge);
> -	if (ret < 0)
> -		goto err_init;
> -
> -	return 0;
> -
> - err_init:
> -	pm_runtime_put_sync(dev);
> -
> -	return ret;
> +	return pci_host_probe(bridge);
>  }
> 
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
