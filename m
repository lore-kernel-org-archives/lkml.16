Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0AF23B0
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200198; cv=none; b=js0oX525RvsON8sl0MhWqcNylNCWCUHv5ZAPINHMnNp1R5m8/ZYHSVlBX3ksoO5yVoRQ2etw2NgVeY8siUdkFRjT1FS+yW7Y7XFAawqGjOliYf4fexgk1qVuJ1xxS2DNFBPlp9LLplERgcuuJ+L6GzMN+5lzCVD1Dl1gijNxASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200198; c=relaxed/simple;
	bh=3BAV8Vn4xGGDhP96Ad7to89CEGi5VAjBKGPATV/9yrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+lANlLOC4Hp2bDUFp2b7qENm0XnvxGk2rbohH77d39xlANbZ6mdRS07qSzkiCZ3qUZZIHRiAgBvw+ZX0/Ha59/6+8A7OmfFUAIYS0BAoIA9FbtCSd8kSmW0OhNH3GHtWHq5jK40mFnLVuayJwP2ut2yse9iDVn5QZskUQJAF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xsf9AdLd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xsf9AdLd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b350a22cso1955384b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746200196; x=1746804996; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ID/3gEVRaELChbZF1u1wTlxxoC3hlcOuUi/IoEPjJzQ=;
        b=Xsf9AdLd1uXRrktRw3bXyCetKFazuNAiY6MmKMhw7Huoxf0UKsVfY99NtNrhyzvifo
         5HS7lXf3kumJPcB/qgOMCs3FFBQ88AWfmR5ivPRWWCWzTRbqRfGp4WnCBGi/6o6pox5R
         60L6MlKFew+SE3DkrLzb7FdoangsNxGKLiazJugK8ukzfFyzSuK17DALS3aa7P2P+cTs
         I/zLDFCUHB+G0zZZpJw6Fku+hueyrOb/vc5hHOphWgg1RTXJ2ZgVT9hGLpxOzPqc90tn
         xFmCiebpWfwB1jEnK4xpLECVnMo8xSzKH8+SvMZKl5Q/ZxqM/jPgS/hmlotpLbuJt4Mq
         +Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200196; x=1746804996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ID/3gEVRaELChbZF1u1wTlxxoC3hlcOuUi/IoEPjJzQ=;
        b=MOh52stna9Z6FZ21eO+CVAje9+UUwkdrBQ3aunVgVHYuuFqwW2ueDOZdNRBo+k7TcR
         VMlB3wbFIaR0CWVRaEMUgeoiZ2ZI7jOyirnCLI7E2ILH8VMaQ40KWUeHIUbMMbDGVJGB
         dg8FtCBfdr9U2ys73e2oU6ZhfOSDqojxF0MeX3KWjjnWNlrQZ8QHBG5W8OVq+UBbKW1O
         0fbGQTjm0Ul9urgvIwebYafQ36QFvnNtrc2BW4AiuoFqHV/GWV0vfCssf3VH1JNO5gDe
         w3YJA8CTBEecHx9eajzNO8eZqjMgszeW6p1Hedii46sh3DBx/xWHxyEHe/pCIlNd/cTX
         nIAg==
X-Forwarded-Encrypted: i=1; AJvYcCWq/aLc+BDK7sZc2ws009lpFpjY2WQm8ZUbCWi9jevQ8ZnK5keuk9cBf8XZd/K6lXrGliRSdEcAlOU8f/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8XG0Q9+50sXXY9u87byyULpPc0aPwX88PbF3mR0z/InFh5mH
	O1eoHMoXDgn7CppU1xne/Zu02DhhIWg9Ipf2PMGoo0uxR8tpUvoe5c/OeDD90Q==
X-Gm-Gg: ASbGnctA4K4bmYjMuGldRYSyMK1rH7eomcyolDDDsA/N26YR0oX1JaCN0AnptDTpcf4
	2DEIFSRBcaUkEX4JzDROlCu6uCQOGCX4F1/b8xHXsG+uCXgb+DSGErPyjPn/geDm3lmQLthc256
	39nnlGkUkN87D0ewPp7VkYYQY2097CFTZSQlBEsrZrzJufnV0f6PT150wlzoPZsqlhjl2exVGTQ
	7E0eQ1QZeieFMv9V4+zls8jyNnZN6nmX7zdraBKF8VAmgdSQHVZ/7mY7pJYmoR1hFGuSAoDor4H
	C3iB6PhY6SWFLVZOtjMv+lWy9mVSLyXPoWga7VFtJGthSNy+eqzTcw==
X-Google-Smtp-Source: AGHT+IFb0CRE5XpBeKP67vibx/Q9XRU6cVwp3u+88sAT+xVnNz7vp/obg79d1d6ykFtM6a7ldH9EkA==
X-Received: by 2002:a05:6a21:3943:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-20cdc0f55fdmr5042626637.0.1746200195776;
        Fri, 02 May 2025 08:36:35 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b7cb28sm913569a12.42.2025.05.02.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:36:35 -0700 (PDT)
Date: Fri, 2 May 2025 21:06:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	jingoohan1@gmail.com, cassel@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Standardize link status check to return bool
Message-ID: <7oxb4uviwnpnkdjacihwjrzqhxpd7nk244ivpwml5372jsiimm@5hgnnfjlfkr3>
References: <20250428171027.13237-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428171027.13237-1-18255117159@163.com>

On Tue, Apr 29, 2025 at 01:10:24AM +0800, Hans Zhang wrote:
> 1. PCI: dwc: Standardize link status check to return bool.
> 2. PCI: mobiveil: Refactor link status check.
> 3. PCI: cadence: Simplify j721e link status check.
> 

Thanks for the cleanup. Looks good to me except the redundancy conversion that
Niklas noted. So with that change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Hans Zhang (3):
>   PCI: dwc: Standardize link status check to return bool.
>   PCI: mobiveil: Refactor link status check.
>   PCI: cadence: Simplify j721e link status check.
> 
>  drivers/pci/controller/cadence/pci-j721e.c             | 6 +-----
>  drivers/pci/controller/dwc/pci-dra7xx.c                | 2 +-
>  drivers/pci/controller/dwc/pci-exynos.c                | 4 ++--
>  drivers/pci/controller/dwc/pci-keystone.c              | 5 ++---
>  drivers/pci/controller/dwc/pci-meson.c                 | 6 +++---
>  drivers/pci/controller/dwc/pcie-armada8k.c             | 6 +++---
>  drivers/pci/controller/dwc/pcie-designware.c           | 2 +-
>  drivers/pci/controller/dwc/pcie-designware.h           | 4 ++--
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c          | 2 +-
>  drivers/pci/controller/dwc/pcie-histb.c                | 9 +++------
>  drivers/pci/controller/dwc/pcie-keembay.c              | 2 +-
>  drivers/pci/controller/dwc/pcie-kirin.c                | 7 ++-----
>  drivers/pci/controller/dwc/pcie-qcom-ep.c              | 4 ++--
>  drivers/pci/controller/dwc/pcie-qcom.c                 | 2 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c            | 2 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c            | 7 ++-----
>  drivers/pci/controller/dwc/pcie-tegra194.c             | 2 +-
>  drivers/pci/controller/dwc/pcie-uniphier.c             | 2 +-
>  drivers/pci/controller/dwc/pcie-visconti.c             | 2 +-
>  drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 9 ++-------
>  drivers/pci/controller/mobiveil/pcie-mobiveil.h        | 2 +-
>  21 files changed, 34 insertions(+), 53 deletions(-)
> 
> 
> base-commit: 286ed198b899739862456f451eda884558526a9d
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
