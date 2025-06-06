Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9719D07A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222434; cv=none; b=MMp6SUdHIdl9DsKLLFTG0rYzAAa4JdGtWsgAGPGWonNgmXSSh8woilj3UjHDY8Y2zLTZocUu9KAW6IDcW6xUVJg4Vd0SjtIoSQ18wSwHlZA2QxA7TSksX3NXEY8hshUJsC4ailRLEYsM8mopVPc//6vjzMp6a2AIVu5QH26N/h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222434; c=relaxed/simple;
	bh=ADVJJCRcmD0mLAlYAE92zYCKME0YhADfudgXzeyCt+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7fIF0msBoHQQu3AWHYbXdctv68jotM0YeVFfzzTWQO3FLRT2DJeXf1I7hPjAyNl4+75AaCGRI/pXJhQ5aTS/hIoP4zj1jG4V787JfSbzD/YilIA9/7V/wkHM/1o5Gtq32M+JIKhoCmrtQmbGgqUreluKh+VCmCqYkMlYvD4uKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hve9braA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hve9braA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adb47e0644dso493771966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222431; x=1749827231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc/SK1Fvfl7qYXo204AzZDmTFG30IXxvBddG6FvY2z4=;
        b=Hve9braA/Xw2ZtkTjBqpKh1ShWZQe0+Kj2zPfQSihjN+7rzlCIqzRSBj13BhEG4JOJ
         FC1S2PHg6yWK3G1JyaU/Z3clV9VkIw2OeCYQiGnh5ldadlpRbE11vTFMw+f8vKbY58MW
         hH9Vc7lw474waRGL23HF6DksydN1F/p0RhoWnPwHcD3NSt8uSkoa+Rknjtesu66hLKHW
         MB1CFsvR3ADgQWWYnckAaRvZ5AOLNXSYUtXRKY614f6ew+JHfbIxFiBg3SpNcJLO2mnL
         SvQjJvVz+ybzrW0X63shQ6A5Iamexypiv4XK53ul4VCYuJSpnnuRSAFIaoZDEBmt6ovK
         LHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222431; x=1749827231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc/SK1Fvfl7qYXo204AzZDmTFG30IXxvBddG6FvY2z4=;
        b=cbvCYEh63xf2FhSImd9TiNGTMw8zYOidnrUkhTA4F8zV9H1MK+SDvuzpjy99xM4oEt
         2nEAcjZGy+t6ytyU6rjepEMhMXVapx9mitGfZgwaR1oDP0O9qNdvo98aLLb9+6qGleA5
         l2LVhUucvJAjGty96R8yTxARTkXGOA4PGP2RIFdQsLc93/pmBvKsgqWXTD69lMr4HIMY
         Enb0U4j6MdnLoCJ9j/JU1Srlgnscyy91CIB572H/vRTQXmpHMGkaRM0OE6D17bIrAOnr
         szMsA8Yf5wHG9SWNk2cc072hf9mQ0YwhgTunnmLw0LTfNH00snzFeof45bKyw/khrfxE
         vMuw==
X-Forwarded-Encrypted: i=1; AJvYcCU/SDf50tA9aW8ZnY4Ki37gIEZGL64ESnRcL3YMes+9enhj5MD6i+SRl5G3IxAQGfLyT49Aq38+Ye8Uzk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQduc/6rveu4f7IDl0hIDVrsKmqiVHrdhsQS4mKhgPobiokv8t
	cPrSRsSNVV4l0oFFFoOV/eCU8FNFgsX5a/crEbVOsm6ExEvTeVacmVAzkHgDyQ884sA=
X-Gm-Gg: ASbGncuBBg58dtKcI+mB75a47jxIMf9nYd181rXesY8YAkCOCWcbMdqU5Am9vbx9hcx
	2fe2veZVCCy+NoAlv+7DcDYzrI2IoHqs8OmaColC8TV7FYo4ycj/7MQPJ7tLXJ9gTBGWtDaUVOW
	8CorJX88lePiX6SYK0NXoOyiHjnWnogek196PXiErXCeCD/YE684S19gHHvYjA0q8taZoASYIDk
	ewkAL1bZPjDiP47I7TUcmxpb8lqx2hvWlYFSezdVZyS6vS7pxd7nRLip6V10JxWrVMeUZ43HSYx
	onYmvQZVhkczpCnPIy5HWco4gw+1vu1uN0XrvcyOCtTuLHJCo7965XjxUQVj/4c8s4rzDisEtg=
	=
X-Google-Smtp-Source: AGHT+IHAKCgU6k68iC6QxjWSvfB5F/Whj3LvE9iYIb5LO7mQImUC1Ui1uT3AEHCwbJX5msacoU1mJA==
X-Received: by 2002:a17:906:830f:b0:ade:31bf:611c with SMTP id a640c23a62f3a-ade31bf657cmr104820766b.9.1749222431322;
        Fri, 06 Jun 2025 08:07:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:fec5:df29:72db:ff36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7542c8sm130047266b.21.2025.06.06.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:07:10 -0700 (PDT)
Date: Fri, 6 Jun 2025 17:07:05 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: quic_utiwari@quicinc.com
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
	quic_neersoni@quicinc.com
Subject: Re: [PATCH] crypto: qce - Add suspend and resume support
Message-ID: <aEMEGZhGamnRD6_I@linaro.org>
References: <20250606105808.2119280-1-quic_utiwari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606105808.2119280-1-quic_utiwari@quicinc.com>

On Fri, Jun 06, 2025 at 04:28:08PM +0530, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> Add basic suspend and resume callbacks to the QCE platform driver to
> manage interconnect bandwidth during system sleep and wake-up cycles.
> 
> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>

Can you add runtime PM support instead, so we can also reduce the
bandwidth/power consumption at runtime when QCE is not used?

Also, what about the clocks? They should also be disabled, not just the
bandwidth.

Thanks,
Stephan

> ---
>  drivers/crypto/qce/core.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index e95e84486d9a..2566bdad5d4a 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -249,6 +249,21 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	return devm_qce_register_algs(qce);
>  }
>  
> +static int qce_crypto_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct qce_device *qce = platform_get_drvdata(pdev);
> +
> +	return icc_set_bw(qce->mem_path, 0, 0);
> +}
> +
> +static int qce_crypto_resume(struct platform_device *pdev)
> +{
> +	struct qce_device *qce = platform_get_drvdata(pdev);
> +
> +	return icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
> +		QCE_DEFAULT_MEM_BANDWIDTH);
> +}
> +
>  static const struct of_device_id qce_crypto_of_match[] = {
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> @@ -259,6 +274,8 @@ MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
>  
>  static struct platform_driver qce_crypto_driver = {
>  	.probe = qce_crypto_probe,
> +	.suspend = qce_crypto_suspend,
> +	.resume = qce_crypto_resume,
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qce_crypto_of_match,
> -- 
> 2.34.1
> 
