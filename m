Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3797125EF84
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963281; cv=none; b=exPgacGK/YN/zZubQy8LoRjFa4viPBef/rHf6dbDSBiHhox8m3tvjdp7mfhHo2T5Q0TUfBKk4vDnpaTyIBLnkJ3tUIckI+NX6HBUJ31FOtKG2Tqcfm3oEdDYvYZdqzjyPciI6LfpAJGbiBQrHvTrj4vhehuitd+OHOqVux/iq20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963281; c=relaxed/simple;
	bh=Duhnxo2adP6UJYufvvUxQ7vXQx/l15K0ZRqltJQCe/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOIdxu2J0REFtzZt9hNR94IHdA9zuEqaVSlfibY4GNOMMmyl+b8d20Gowy5CTkpmEcilbqx/2O933g6W3qOxuVqAvitI6H5m6IsqMIjvnSqZLLsrDzsyzQhu5egfRRv3HpMdTdfxCSsFWkKDYQ0X1jXTQDcJ1Vt2VgHzDP+pvhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trYtiYsA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trYtiYsA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2263428c8baso82435ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963277; x=1746568077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=;
        b=trYtiYsATtd5QlG2zV2Dp2Wyuiupe3QasFaawn3Zfs+RWQ0QLopNnqsX77q9nkgb9/
         bTzByT+phmQ8myaIpaaMpq9jXFXM1odtbH+CZvdxZrLGBvYg5T/mQW2c3Aduo2q7PYFt
         fzxQCG2zoNfvdx7D1eGVCNZH9v5ssE1OzaX4U3C2MFv8rxGbo3B7Otv38Q1F9fgZl3M7
         nKh7fOIToKCrgTMOTRtdVryzFF6Xib6iSgzE50qXCmYodwJiIhHQP9YCz5P3yh/NYcv4
         JOP8NNfiDeVOJYHU0XYxK8CYknqp9apwLsuG433HbbInW7p1N81QVYDAg9FUgMyKEGzc
         ds7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963277; x=1746568077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=;
        b=edeuSzsy8320Yfg2ACq5iu6QsPiEzVQCb9GSOKi3owTG98Dzo8GBIFWRbj17Br11Vc
         wJHQhW+N7sVbnmLQqAzYJZu7f1l4gaoM8NiaI3aTzNMB3lVTF0LD4d0BSDNCWKqOa5YC
         A6T4wx+9haWuTZwvjz8OMvTZUHwpn+0CsrLtmbI4MlIpMMjcdBjXO0cIs4K6UCjSVPST
         fvHXanVLcs3tzDcgwIzpR1mqRfTGYMQ2945wjkcT92f59TwxU7yB0bIjJz2Mv+oXf09T
         92kfBQmyApdojE2xUZbYAUUhmwvpmHgj+7c7d0ksMFyc20wZJPxE5a3cdG0ycFNYLA4v
         cAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJqak93yBaNcQtbCFlPRqrI3TqNZaFod8PkzsgE30udhRXsnssnJaRiFGonugvZXCKqlozUbJoa7rIwmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmY7LGWBQqtk+3YdBP+3Fp2qxqWFFZ4hPYrOW5N6wNuGTJL6pP
	L0B3dRiSWLQ3zZaf9cDdrBoIXIrhsagvueqrQlX2Wpi8FZYJtje3SC9JwER3Yg==
X-Gm-Gg: ASbGncsFKbT736uL5ESaTj6nTF3FoT+V73arD3bSSPtp0HVKGD8Y7/WAuIwBQv7RA3q
	GimLt5o3NP7A0J2MSP6+30c4gqROMzm5Er8hLqtip97pBfRPpwTNeyTlwia2s+qCQjRq1mmaIbq
	tywBhML+IHDtb0rLowfonO6adejHl+TKl16S1vtzNSM/oRxQjXmREQvQpz3WljHvoAevtDdbyy2
	48KAtZZmyOlBAWT8A4NBSYWptFMEE+4fJzmKm4+SCt4fg6gsRwOl5vUrEvJpDQ5uq2orInwbesR
	78p2GLPV1cXqVfGJhy0ZN22/d9xQEQ49lOx5U/st52ElWQsVvHXCffheOtCUnnd3SmY/lnSy
X-Google-Smtp-Source: AGHT+IFMqCAjaX52HtimqP3RondUOuNsl/Pw968hKtIW8LO6HydfSjoFrb+e/I5aVwqY3qXA13e21w==
X-Received: by 2002:a17:902:f649:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22df53e42e4mr308665ad.3.1745963277038;
        Tue, 29 Apr 2025 14:47:57 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a119ffsm32042a91.21.2025.04.29.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:47:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:47:46 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 18/22] iommu/tegra241-cmdqv: Use request_threaded_irq
Message-ID: <aBFJAhpnPoUh-wQC@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <fb97e2407ebad5240f3981bbf4121a75ccd1ea57.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb97e2407ebad5240f3981bbf4121a75ccd1ea57.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:13PM -0700, Nicolin Chen wrote:
> A vIRQ can be reported only from a threaded IRQ context. Change to use
> to request_threaded_irq to support that.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index dd7d030d2e89..ba029f7d24ce 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -824,8 +824,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
>  	cmdqv->dev = smmu->impl_dev;
>  
>  	if (cmdqv->irq > 0) {
> -		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
> -				  cmdqv);
> +		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
> +					   IRQF_ONESHOT, "tegra241-cmdqv",
> +					   cmdqv);
>  		if (ret) {
>  			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
>  				cmdqv->irq, ret);
> -- 
> 2.43.0
> 
