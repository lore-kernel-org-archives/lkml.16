Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C402BD5A0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073060; cv=none; b=HVj3fRhNtMJG48XS5owIB/1PxDrtWT4jiSzYqJlQSddIjWsvPSLb4KEmHzba9UmssK4PjRqkgA8khZLpTBbsrQaN3v+2gvRczklgMZ2KbmCPBxYFkrAUIHtd9YwDCTgyMoI1QOWSlQ1pz9ghJOyaZfHsLfzXk7xiteNhCwnqn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073060; c=relaxed/simple;
	bh=rebvp2cpkk8NcQdyiEZpB0yg9PnEC3G4PHfr+hIW0lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isnWBLBSfjh6GGED5z96ovbCd44S++U/8/AiQMHYmHdt/wxDFH4L3wHa8YxUlkjq3ueaN9pvyLCfBrFpv1PACeWYlZbx7tMJbBxY83mNXTK0RzwOIVCIEaScmP71HicvbFp8kpzgG5FO53JXCP+Vsvej3Vtp20H8DtFzy8dgKLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQhhMCxE; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQhhMCxE"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade326e366dso794544166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750073056; x=1750677856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbV9M4aDHf72M9H3YVkYBz+teJq6aW3dMMcIgDjIjB0=;
        b=eQhhMCxEuL954yTgshbjUL7DfVWLKMwRhxTO9AEoi4zws67b9mQLYfSSC2WSL55tsO
         NUnMXisMNgw3l9lCAjFczJ59df5zf4THQojNJw6q/zuhYU3JsDulUZy8/4a2bV6gqlD6
         w7FsY+qpFKRkOtNcm5b8g5pdEEMbVsJGa0WwjamCkDC7TgjoRalMuew5o6iso/uKtDU6
         27yn3mioWimLyeiyvoo5ggPggnh2ymCnriruI7LLbYlhQ2szFpfO7JelttJF1hRXjyIQ
         Gxz0lhX3lkAo/YML98PooVrtPhOFZsw1FkWQljjqG2JYngkiBcV+sREYqRZ6sbtfFAxh
         S+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073056; x=1750677856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbV9M4aDHf72M9H3YVkYBz+teJq6aW3dMMcIgDjIjB0=;
        b=AYs2HBbOMzXk9gyye/UrXLjnl0php5ICkZZ4lZdbkOwHIihHjbdwQFHjBEWbxSOUdZ
         AMbwj4w9EdpcMfpaxzYU/wtIPAWJTrf9c2R82BjpW/bHyQa8I5LuFXeZR8GgsjZGD9dt
         uSEZaj8GjMahXGfuU/yO6/vK0e+YIAmOf4wdPi+WjRqXIFVsZkPjqB2HKxdvMKi4ALha
         fd4Lj3n/iS972n5BD/rcYqBpYUp+PK55VXxJgXho2sE4DKiuyZTVUOBI2QR+Ke/5H/im
         DEDCILdEhBBF3z5ezFFdBb+sNj7CGnY6UswJdhef8puyn6Q7FNIBIvP6aS/Pj+B2bydL
         olNA==
X-Forwarded-Encrypted: i=1; AJvYcCXfVOXGtATV1lkBXXrJxzVfqIaNdVwEbwrYCySJ2ltdpf4S4eLgS7NKG2WVg+s+30wjjK9mQtptVAKmgdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqoELYM0J9OQ+XOFHFuCvfwrWmj+sx8dmHHfN7HksQ3TYcHw4E
	mBxIjecqxP6lkU8AsmiIHSVPZrZe+uwJcg+QGT4nyCCRJVvNJb6AZfqEAPTIJnTTxfY=
X-Gm-Gg: ASbGncvWmOEzUfxPox5gQZ+xM2/AtLvhNwQ9QKKA+1i6b85fP68SOYnczC1gOF8KW5V
	qQxjfFF0QCCoNQhv19ko0f46eNtwZS/oZT2n/jWAIz+GZ9GFnXZVbyp50COTdwa1IfezdS+PXoo
	dUq0Mc76UjXVS9agD7G8zOpczgHDn7iXfDPQBotECXb/Mnk+7dXAsxFfPIGNKv8jrlWb7N0YHER
	uZWdSKpjPYPyIuDxSwEZos0QCK9tF9PrypLTvRhwTA+yO9C0CmgfgqgbOB/8kYxaLgnVm7gjaPm
	EKt0eiNmtCf88Pb47GWf/D8sHjcAnN6jF0l9Igu9fzxRVRQ7dL88ZFXWThoUyKByVBH3SZTE5ZN
	VQgJm
X-Google-Smtp-Source: AGHT+IHPuq9aBuI6TRaihWL5uiY5RCyARuy/T3/fbEewo0xAONkAM9tB5ptUeAG85+/kjuw1/rSxAA==
X-Received: by 2002:a17:907:2d9f:b0:add:ed0d:a581 with SMTP id a640c23a62f3a-adfad31a905mr894228766b.17.1750073056200;
        Mon, 16 Jun 2025 04:24:16 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8929307sm638202566b.113.2025.06.16.04.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:24:15 -0700 (PDT)
Message-ID: <fb1dcbcf-0467-4a68-9d17-2a75dfcdc1d1@linaro.org>
Date: Mon, 16 Jun 2025 14:24:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dmaengine: Add NULL check in lpc18xx_dmamux_reserve()
To: Charles Han <hanchunchao@inspur.com>, vkoul@kernel.org, vz@mleia.com,
 manabian@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616104420.1720-1-hanchunchao@inspur.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250616104420.1720-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/16/25 13:44, Charles Han wrote:
> The function of_find_device_by_node() may return NULL if the device
> node is not found or CONFIG_OF not defined.
> Add  check whether the return value is NULL and set the error code
> to be returned as -ENODEV.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Can you have the subject include the driver which you are modifying ? if
you say `dmaengine: Add...` it looks like you are modifying the core.
> ---
>  drivers/dma/lpc18xx-dmamux.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index 2b6436f4b193..f61183a1d0ba 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -53,11 +53,17 @@ static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
>  static void *lpc18xx_dmamux_reserve(struct of_phandle_args *dma_spec,
>  				    struct of_dma *ofdma)
>  {
> -	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> -	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
> +	struct platform_device *pdev;
> +	struct lpc18xx_dmamux_data *dmamux;
>  	unsigned long flags;
>  	unsigned mux;
>  
> +	pdev = of_find_device_by_node(ofdma->of_node);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	dmamux = platform_get_drvdata(pdev);
> +
>  	if (dma_spec->args_count != 3) {
>  		dev_err(&pdev->dev, "invalid number of dma mux args\n");
>  		return ERR_PTR(-EINVAL);


As I see it, the function lpc18xx_dmamux_reserve is only used as passed
to of_dma_router_register . In every driver, functions that have a
similar role are written in the same way, not checking if
of_find_device_by_node fails.
Can you detail what happens in your case that of_find_device_by_node
would fail ?
Would it be required to have this check in all the other drivers ?

Eugen
