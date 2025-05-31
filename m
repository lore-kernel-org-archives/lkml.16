Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBD13790B
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748711122; cv=none; b=gHbi3Zwjw0nrhNOM7Ayjbi5WGMiJd9JPj/wubVpmc1bAbNVCCJOwp/AALylm6f0vjERXgimx52v4oUMeaHpliOauUNZ0ZtA5ykBWmynlLa9HC3uacqxA76y1xm0P0jyNqrtel3vNllIY8iZzxVkq/vI3gihlMYuzFXWvETpVSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748711122; c=relaxed/simple;
	bh=x0iEMPA1LrYRc3lyTC/SW6IUNprH/IgN7GM+dmDoORE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYN54aUTMLlGc1uwbzSqAaMe+AvTQdEgwwqY2Dw1p+RhlmNKxPY4JOB5FKyqUznJL286R+O3ho728A/hT4nplpeEud65zeoqwKvGle6+l/meX9GA2XljFyBQCNy2q5GpW5ddO+MZFPrMNBdOhxhcXeFTixbWcJokyBEGpv0HH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lss9qpmC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lss9qpmC"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3354247b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748711120; x=1749315920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lM+Vm1sxzlwErSkujNdEr6GDSE2t0p0EBV3tSTtUlbs=;
        b=lss9qpmCSOmcyVxg7ceJQ2HnWtOtDRTEcskH7JBtdCeCig+9Gzp+EUpc4PswxaAEAE
         IVx2zhpMLc9Vs4sStL85NsIYuP2g7BAWCsurnBvCiTidbIHfTtJCl/XX3sRmF/se9ytE
         PlkGHztNyMplHmeU0L/UDko1afRsjUfLoksysftg2xJMyaaM7PPWdRo7BcOPjr9M3ue9
         MPsLcbkkgRPio3MWHaR0WobUYHuZ3R6D9uqmOQvEFBiDlp7UoeeI7nbdCuGAq2qAjzkS
         NQJKDWYhJSBp+fQcCl50ImhCP+DFIvBovcVw+QLhwTw9N8apodn3VB3O1ZhOyPOR9SCN
         03nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748711120; x=1749315920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lM+Vm1sxzlwErSkujNdEr6GDSE2t0p0EBV3tSTtUlbs=;
        b=S3aJgsybE6N30Fq2M0o9DDgH2Spck5Q6QtP1hyz0nu0NKyPdOL9qmNAr4uxEyXSkYp
         lZgSDWRUexyuVKrrtFmVS9xHlirlDnwD1BwOA3bmVYDL2TUj10xxE9LOUgx7ArTLO9+i
         zb1TZJSEMoUqJlDddOVbjmCEgoP9JVREX1qGrE0vi5xYQAqNDw0PM/FrL8S6pPvOJYk9
         sK6swRvwwvefSDZ9+yGM7kCL9RysLd+Xho90YhnTBJvv+8pZt7Nt37IrnYxyvKsQu7IV
         xlhNW2Jsd4MnnuyxnghazG+kVCawE3Yy/Enw84GBkesRZq9fjhFX5bbYwbcgSdsh8gqS
         +XXA==
X-Forwarded-Encrypted: i=1; AJvYcCW7FVmFBlYCxg4fZHdAGbKab1Y34BxBeqbRlw3O6vr+lR4OByD3xX25AYphcy7qlnxU5KCRFnxUqIJs9vw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/zxTftUAWnshURup/8DhCKbtws1fxCLIwO0imMDOLZBS4oex
	gWEzabRoHp5tJI9KYoPr5kh0Qr8vk5DDc/g8e+B0Lt3t93qK+kbJ0uXos2A3+mzwzQ==
X-Gm-Gg: ASbGnctoPMOXqa6qaz+6WEItt9pvpblYB8egNzp4DWT9v9wiyQomD+VRWC4c0Xlt0s+
	bAr5CR5px4ja5u5Re3ncIkocj4yO5H6KshKi9OO8R4y/J2vok0SFyLfvRoVF9WmLycenoslMPjh
	vvDfAG60ZsBmfZuQqCGEHT3ur0aFn7LKP00kBqPn+LmezPng6jESdAEYa4QlXzNWU9TUBHwo6H5
	FgxGIvHKCfZdkQy8SPh1xnJfDftQeo0XrivZZz7mAfr1aQE3JXWClnzQbW1Bb/FC5wNmkShAZyX
	/ZngWIg9Q0YSZMMvXwp/3T1+d2N3uReM5tygmJJsh5lCTQ6yQgeSdq40KkgNpA==
X-Google-Smtp-Source: AGHT+IFdEaiMsq9p/fY62ZuESsu9h6XTS78Q7H6VtGsbnxe3keQhoidzBkD/oQVVVD2Dr/Suvz582Q==
X-Received: by 2002:a17:902:e74f:b0:234:9fe1:8fc6 with SMTP id d9443c01a7336-234f6a08ab9mr185502615ad.18.1748711119638;
        Sat, 31 May 2025 10:05:19 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd38e0sm44835625ad.138.2025.05.31.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:05:19 -0700 (PDT)
Date: Sat, 31 May 2025 22:35:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: shao.mingyin@zte.com.cn
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, michal.simek@amd.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn, 
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, xie.ludan@zte.com.cn
Subject: Re: [PATCH] PCI: xilinx-xdma: Use =?utf-8?Q?devm=5Fplatform=5Fior?=
 =?utf-8?B?ZW1hcF9yZXNvdXJjZV9ieW5hbWXCoMKg?=
Message-ID: <i4qf2oycket7gkvyd3tfdzub32xlx27oydcporfb6thc4yosbq@grgbbjgymvgw>
References: <20250403154654546Uoj1gN_pronbxhSLPEIUn@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403154654546Uoj1gN_pronbxhSLPEIUn@zte.com.cn>

On Thu, Apr 03, 2025 at 03:46:54PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Xie Ludan <xie.ludan@zte.com.cn>
> 
> Introduce devm_platform_ioremap_resource_byname() to simplify
> resource retrieval and mapping.This new function consolidates
> platform_get_resource_byname() and devm_ioremap_resource() into a single
> call, improving code readability and reducing API call overhead.
> 
> Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/pci/controller/pcie-xilinx-dma-pl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> index dd117f07fc95..238deec3b948 100644
> --- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
> +++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> @@ -753,8 +753,7 @@ static int xilinx_pl_dma_pcie_parse_dt(struct pl_dma_pcie *port,
> 
>  	if (port->variant->version == QDMA) {
>  		port->cfg_base = port->cfg->win;
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "breg");
> -		port->reg_base = devm_ioremap_resource(dev, res);
> +		port->reg_base = devm_platform_ioremap_resource_byname(pdev, "breg");

This patch is entirely wrong as 'res' is used below. Please do not send buggy
cleanup patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
