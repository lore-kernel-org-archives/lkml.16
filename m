Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B351DE3C3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563865; cv=none; b=JhM6PS5xMsetjS97qT3ViOQbmWerM/K+8O5hv8JcAd+8idi9urKW3cL6yd+eVjA/4tkG0aCTwHPDhQlUgF7hX+oONyl5RHjukbBz4uLVNn0OTWVc2L9VNyZT0N9Z4+HluwaWgcaiBl6sHbPsb82UIx3NZz2s9qoX8qW5VzS70nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563865; c=relaxed/simple;
	bh=yPwDn54Vac1JGWRY146dwgLEgVTLswU9aEd6LJpURUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU1R8IzsKlc0cQn0znQwsdnp7q8EncKr4TImY/x8K1ts+u5SVRoiwz6r4DgjkE/VWtw1bjvYv2rbpHgVACcFEjaKUxY/gCUFk4uOAu31bzefEbAkwP/aeuLf6TB/pj3iDpkBlSHVk0+V8DT/620W3H/K7C8jznGqUZpQb6C2jO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=caYBOeaA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="caYBOeaA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3342493b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563863; x=1745168663; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=;
        b=caYBOeaAV9f6eRwnKS1B/QM7guISX5BcuLQjOJnU3knJ4bfZPeH/nKTPBflc7vZbhL
         6LYrC37YWMKQFie8TOa8Jc2hSb1Y+mWD/Vhq8lQRBaUEoGGHrIAVziP89IKBk3bPFiWt
         vWMvooj6H9h6TfKnk3xQNo7plMckQE66w/6+bmhIMBV/MXsvT1kXQqJAF4lx9cUlefnT
         sShWZ71f4tAmKy8kBGE8F8xpHejWNMC6v94MQ2EjeJzCnWpHH6ZAVMVRec3mY+rvMTX+
         0GR+A50uixsmVE6f+Q6gQiAbiVhASWtmQiJP1ydf0rlYtxDL2/+2Kf5IXZaOqPfQaKCk
         M8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563863; x=1745168663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=;
        b=Dbo59SUVc6HrxSLnVCK/pswDl/zfvXuszEyEKJR7TVj3x9dy/o31Nwrspzy5q1oWKJ
         2/o6mnTVusUldJxj5c0H+F8Vt0nc4N5s7dzP5Ezvcm56ZQrbINEzTuXoNdiprHS5eqkO
         84auicRc+YCCaVxMEVotO49G+otexp5arSJDT868/As9FaBjLaVxLcp996VQspt2Fdxq
         qqeJm9LEcYPF5EldEVBV9F/5SpfdYzEYKjkNgAixXO97UrjhFP8mTYqk5fhCmY/AaGLt
         qzGG57HsIhkb8j/A0qeVai7G3fZEdLJyTnIDZWdQx0h2fUTdhk+mcdxGT66331oT1Q5E
         7Bgg==
X-Forwarded-Encrypted: i=1; AJvYcCW3ceTmTux6knLo26iHGPkjbcNX2kzXigOrBSOYXohWnP69aLgrOdMCQfI+tUDgtLdxEq2kevLuWj6AGhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAT4uaTiX7xnCzfRh4AnZDYB+KyNYAkQDNosc9n9SX6UaiWdiC
	nyizxGlYH1VeD2rfA6648o/vMnjf5rPPMhKO/1FCSRL4eO5CjgvfGpUAlX3R5A==
X-Gm-Gg: ASbGncsf4vIF52U+SRnmCIv0qM++TrO/wPrk1xAe+Hi6AXHMUOskTHFUUfN42D8sJcu
	KfItXNWqpRcBg2qUykwv+uG+OuWEdzzalgAd+gdP+2n3CB5bQINWKUjCpN+RhEmweyDxU6jPevB
	n5hIwbv5QeAGLJvqnxNAFBfoGpHzL1Bou3bdA8Os5W5f1aGZEkMeFuV802wqS0BU9Vk3xBPDRKE
	kgbC7cyCOrFO8QsRhQThjUonCo7rawug27gJkh7u3uRFHqPHu6J5xlNtk3jB42Os9uRwIdYCn64
	QA8ND10p/97srtMZRY1JcJ+H/cs7EWt6mFjbeOF6uYPvlCt+Ce1p
X-Google-Smtp-Source: AGHT+IFjyC9Nav51W8D+xJs56DEyrXe47gAj9cOlUzK/cynD/DwixHK7w/Y7LX+u7QpqEKkPzlHNBw==
X-Received: by 2002:a05:6a21:c8c:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-2017999735fmr16680739637.40.1744563863083;
        Sun, 13 Apr 2025 10:04:23 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2199535sm5339872b3a.14.2025.04.13.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:04:22 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:34:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 04/13] PCI: ecam: Allow cfg->priv to be pre-populated
 from the root port device
Message-ID: <5nwjlpnpwh4yto6wi4nxcwumpd7iilpq4mblpfqsvdxg2bfdsy@md6ok4btonxz>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-5-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-5-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:04AM +0100, Marc Zyngier wrote:
> In order to decouple ecam config space creation from probing via
> pci_host_common_probe(), allow the private pointer to be populated
> via the device drvdata pointer.
> 
> Crucially, this is set before calling ops->init(), allowing that
> particular callback to have access to probe data.
> 
> This should have no impact on existing code which ignores the
> current value of cfg->priv.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/ecam.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
> index 260b7de2dbd57..2c5e6446e00ee 100644
> --- a/drivers/pci/ecam.c
> +++ b/drivers/pci/ecam.c
> @@ -84,6 +84,8 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
>  			goto err_exit_iomap;
>  	}
>  
> +	cfg->priv = dev_get_drvdata(dev);
> +
>  	if (ops->init) {
>  		err = ops->init(cfg);
>  		if (err)
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
