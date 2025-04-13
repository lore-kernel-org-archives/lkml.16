Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2E1EF097
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564633; cv=none; b=n/4vjXg1xjpA90v4CkJDFXOkFaH0aoPPNL1srdj1AF9hjFmHRD+RNep32KuSJHrnt/5kbBjSEKHnXWC+YKVfa0A43DYTbHEG5Pd7sUIsW2FCWcS7GUk9KM0zbAqs7Eh+LVxyJoY6aTY7JzLwOlIPw5l/zR+y6W+0ihkBk6epc2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564633; c=relaxed/simple;
	bh=yzmYr4JLOS40LoDlK4MgPp+nJ9KhGdxaumE41jBjK4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVrdMGv2DoYjoZSlICF6KDf6cSymt9HLU0rhQZFXbXd2OJI2VRzy4PsfQFD8khTfepqasrzMw5szoHokU2XxQ6vjKoiRi+j/PpVbg/nb+CK215k94NtzI67gHrSM3wdsYjOr56JubbfALXv2mSTalANehUzh0we9sNuKa8iy9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OaqUHXp0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OaqUHXp0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so32602085ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564631; x=1745169431; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=;
        b=OaqUHXp0MKXECUMrJIJCDFeAzQMhGK0fYAM/othAcpZ6CfzTueYmYlI+ad5Yo0zGA9
         IpdAwyhxmGkVB79Erb/aT0/sIx7lYF0zNTQ3HGMtVfU4Vv9B9V4c9Dm+sC4SlxKasTGf
         yz5m96M6lvoTfRSnYKNU9aeUM0TiybxFFwqK65YdeGaV0oQhfnXFagqCDA/VCo/kfhrH
         fQ1HNy2DRXjfrwxI+a8xJhq+xGwStUKNTjutusruUH2orXjjqS9yucbzNkAPwzqdepWu
         HVQyNRYfl5SUrBFMIMD2k0D18j8+cCCltShrmfKymhzXQvQt6hvgosQPrPS1SJgI9SFK
         PDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564631; x=1745169431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=;
        b=wZHHqMg137nfbDGwc1o6QkDT94aC6b1D9sSqVEg/iKfzwkm3FeDPjf839tsK5sDeEH
         3V5uHI7AFt9kT72XpcNO/Krs8AfQhWsybD/CuPvlhUMVlOMbnVD/QXB8L+dIdtFqfwuw
         HSnS9yHvHLEhyfp4DvmuMWg52pnDjKI6UGY6n1wlNF3+Hg1DYU3PtMwy21J4C7tmTXfc
         cpYIRnHOvjonskoBMkFOgvuO90yCNIJhSs/s7aJcmgB7Ws4bXI/jG6MlmGr7sT/gMqbn
         wZ6F1zhN0Lsz1c4PCtrog04TNBsLOAHaewomLIrk7Wvgw98jdW5jwNvmNnRdSJ0EF0uU
         5O6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv274lGk3xjH6rmHcHjCrwq1Ej7ec/KQYn0YRQP+SbLczwYtKQNSO/FHVE6af03A/Zoh6lfQtjSLKBSd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkU2UJvkJivsqO/8rBPkqAmRtAVnnNlub3OzrtL1uH5f4gpL3Y
	LBKZLTQS41NsVUXbl2UUe/dECbKRHaMShKGX+31UNc0n60QerB9sbsXc0xhjZQ==
X-Gm-Gg: ASbGncuHhLtG7acRRJxU0C5oAMunVolMivd80KRhDcHTAvU2/i+BTY1l/WxXCdTqytG
	vtC98011fBoOQIej2yjSIOY8FoFLmYlEZ5OkPVYK4EZ7buZR9uGfKsMFB3pqt1wZKRFOsmoCrWM
	T3aQjehQ4G74r0XhN5bzpNVYO3eooMv7p8hYGCXdkD8LFQFDIACAqPJO/UOPddG2brEFeF3yQuJ
	JRRVNLhWfjntbBXcgB/OBQJY7H1JrYRVJ/I5ZYVvnxkzrncjIfm9SuqRvD2fJ9PXHftmqpQTUvk
	xTWpqjvzvyAUNX1Ew0Rq0vC0TG6Uf3nti3M31J92oPjr/HuI4cnF
X-Google-Smtp-Source: AGHT+IEtOLc2J65A5BztfZy5lJCUWgfZuua8Ed0F/wWmVQ49XJn2NKHTr6y3ixbdHzeiNIvZR7HI/w==
X-Received: by 2002:a17:902:e5c9:b0:21f:1549:a563 with SMTP id d9443c01a7336-22bea4954bfmr127432855ad.2.1744564630883;
        Sun, 13 Apr 2025 10:17:10 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97228sm84677405ad.128.2025.04.13.10.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:17:10 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:47:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 10/13] PCI: apple: Drop poll for
 CORE_RC_PHYIF_STAT_REFCLK
Message-ID: <rzrouiqucgtdpapcqwf6pbdrbsrxeii6khx3h2q26etu3772tb@qxxdjuv5uias>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-11-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-11-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:10AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This is checking a core refclk in per-port setup which doesn't make a
> lot of sense, and the bootloader needs to have gone through this anyway.
> 
> It doesn't work on T602x, so just drop it across the board.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 94c49611b74df..c00ec0781fabc 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -475,12 +475,6 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
>  	u32 stat;
>  	int res;
>  
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_RC_PHYIF_STAT, stat,
> -					 stat & CORE_RC_PHYIF_STAT_REFCLK,
> -					 100, 50000);
> -	if (res < 0)
> -		return res;
> -
>  	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
>  	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
>  
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
