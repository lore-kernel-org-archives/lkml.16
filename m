Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DD1DF265
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643420; cv=none; b=dYxE99WyB44z1YxBkett/ihe86wISW7jNy8OJFV8d3XsGeF4lsN+0DxoEhmMqf+q4XpoJBsBxdU6FWetUI+rgR4QUYwJAhUUG0T2lr7TY1N4J40M0eRseNPo5dTCwGpUoWfUC0KaJS+Gg9GbepCUUT8BIw7v6nG9tkahJG31VDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643420; c=relaxed/simple;
	bh=Nd2ieUJ4/LjUfPGJsbtgPp6Vi4m3tStbkjvl5grTX08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9AT9fN8V86IQXsPyHbEuExl5e3ggl3BMXq7YyIrOnRF6PO2gxHje0VB6wwu9+eYCmlUe7oLz6YbHDsXFHwBVnI8+WFXGylzUwqdP/ew6KHzb4LZzZvu5sA2uGYZzaWNuTxM+h+MScE8bB0efc+WcrHIXmQ+dq4pGWdYt1gY9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hK2ZiIY6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hK2ZiIY6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so898480f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643417; x=1752248217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiZwgpkLMualPzt87ntArI8waunCrBqnuH0mN0dSPE=;
        b=hK2ZiIY6Knsx9D8619FL2SHIy5Pf2DFkFggtLGWAtW6VJTwIAIyV8BtEsVuz3dDPUw
         +0DlCNkFgLi4cASKFkabVl0UULEKwFNAdA3mVge39BOee73aQw3PIHORFZx1mtN27FEW
         BJRBQ01bIIt34fYN5zvRxAFGnPaJRXpeRHviBgO+ofQsO2Y4o7iL9BsROWHsydmmVGi1
         ugXDqIamghDA5vbkDlyt++C5l+n+djR9lDZFs5DzsNXr1TYBD4w+ghXuaMnKHugHmENA
         QYqHxsiNcQWmXBOsl1lQm6Oof+WOdDQyIQG5u/gbE5w07yT9sPIFteOkOOf16RJzEvA7
         5seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643417; x=1752248217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiZwgpkLMualPzt87ntArI8waunCrBqnuH0mN0dSPE=;
        b=NqfgkPiMBSsf1NFWHuISC3+m1rGlChOgYR4O2mxNS8xUWTIC6H1LAwtiXx2+Xgk8AW
         qs2XQtiKVo/HfO3XYIM+7XZfVcrHE7w3BGHoexZXJG4UY6HR2hnVdt2VR1zlHdOu+XyR
         FuQ5mY00RW2OHrHfJXpHDgTKojsuiPgfOcFb7HXptqXeA/sGKhm1HnkEykMFYy9eaoY7
         skATM+Px0UCmqBVHeNCwCHRJj4Miq87iBRMMLi3W2fn1YKC1fBpcxcfHcmTofUXmc3Em
         3gaUBt3eSGK3pR6W17cDZFc9wOYkwmAzX0umoVfRALcMrv9IFfcyVnWsLB1g1HbDzxLw
         d+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQy7c7rV1/FgtTX5lkSALFwQ46cm+dJjmBWwudxxpP3Ao4AS4oQbFZCZNrYydPRFFFwiACjzgUjS1SAEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV06KD6zFrlmxgczmcUPfEf+0DJmcargfXt8AsO3W0BjSbFIyF
	ZylhaU+nruJ25Jv/XPR0XHQgnAd7fUvJp4V90nfJsO7RD+nnjOULtM75W8tG9Zs1Cvc=
X-Gm-Gg: ASbGncs94pf2Kj65DONVfHV8u9BJElMHuaieLiZNJsM5yKg6xr88S3tj9X+P1/otikJ
	AXUesJ3fcmQaYWL/aArO/sEBFnuleraS1m4hu6fFFOsrWp+G3Xuj/3DinByQ8g2B8wFzKvjkEfv
	dh5NPLd5O7Y0uI4QHtkoiw8ftFB30LCHTDyavVeO739FQdDJyhCv2kLzctie0Gr41WGvGtQwqXP
	IcS2hYWpHG2O5RPHBRt08s40R4h2u2oWS8HYWDSYaQLGlXY0/jzQM9a+rQ6fFdCdPiYqeQmHEQB
	9ScZiPR6/FTbRDomRmQa7/Ut8qJwwcQetGj7hS2DqTiWlopp/b+GrR5tHcuZY0K+3y553h8OuIL
	VDuLZ/BS0yf7Vx1VhapPUtEimUQwz
X-Google-Smtp-Source: AGHT+IHqM7Iy80KErSccPJqKfwLxmIXwKCu2g56lGYo/d8Opt8xmrzRkqZI8qhJs2jylA3Gj/Xk/CQ==
X-Received: by 2002:a05:6000:2512:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3b4970195e6mr2519830f8f.21.1751643417073;
        Fri, 04 Jul 2025 08:36:57 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030b501sm2788217f8f.14.2025.07.04.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:56 -0700 (PDT)
Message-ID: <ad0d5ff2-f112-471e-89aa-65cd229c52ff@linaro.org>
Date: Fri, 4 Jul 2025 16:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
> --- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> +++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> @@ -482,4 +482,6 @@
>   #define GCC_USB_1_PHY_BCR					85
>   #define GCC_USB_2_PHY_BCR					86
>   #define GCC_VIDEO_BCR						87
> +#define GCC_VIDEO_AXI0_CLK_ARES					88
> +#define GCC_VIDEO_AXI1_CLK_ARES					89
>   #endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
