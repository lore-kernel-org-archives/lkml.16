Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64343FD4
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748179050; cv=none; b=oEQOb813W/yiL2QvpfR5R7f/d7x6ACoQra9riYdOmiMLTk+oIHLeTMF6eZ15SIrswJT6gjbA0P3aBR4XpbTCnGNJ2sSDYMHFc6esnVuakfn8yr+QMJBr1K0DZWZVpQeXtsNcq7l2cZ3PYArU2a6NhZN2w+hW+f98lrd4FChFY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748179050; c=relaxed/simple;
	bh=yWElqFPs5a9gcF5uShGdpJvQeNx0CXEIIB8Ra08qU9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeEMHo5YOHe9uqjd0qdVnFp7l4AlYWuLCQNongtVoqukkGekOvyONvc5ATuWUbBDgD5ty1BpRJ5SP3Nl9okWttImKpp65XJkSGCtPafzd2u0QFiWQNdU1JQch/9f5oAF+7atvEycGocf+TpbZV1YUahoPE6sZxMzcnBPrAK2Cqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5S+BSyN; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5S+BSyN"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad564b7aea9so484818666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748179047; x=1748783847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JncznSaz+/oGV5IjmubnRQRwE7XgtuBlaUti3hLAlQM=;
        b=d5S+BSyNkStCE7L/xKprqAJ+GKOxbTJ0piITYMuuAAw49XVVnol9Q3cUNd0XtdXTEM
         /pO5wwsW0VJOrg5RJHXzUmU+GSqXq+WPTZ7fD4r89m7fsWm31xvtifMqHicSvjg892W9
         ntMVP6AZZ6YgfMav5XmE9W37ceAcqA+ln7K3BceSkXIowsX2jsx68CkLro9UcyWWGVrn
         Kzlmu8Xe/s3JkQPvMNsbScfoL0Tjwhse3GNxajF7jfLYWMGAN9loHP7icxxc5WVVxuFc
         /4E8QQNHRWErXjoK8qBpkem2MeiXh9sdE1CiQmqKtkm4yC7ewL5AfMHoBOt+URc7Zsv3
         W5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748179047; x=1748783847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JncznSaz+/oGV5IjmubnRQRwE7XgtuBlaUti3hLAlQM=;
        b=YI0J7FN4SvxsPP/jP0V1Z5kCdCZjoPTQvip3RwpRkR2veqT5jFO2QGm8vR/RwZwZY3
         kxHdMgWhW0RRAI/Z4icbHLUTlqjxL0bBAwnTnZV6XxyinHV9p2tAD6U/V+ewfI87OoUb
         MmcZzOFeDOR0sk2A/BKLLPz7f1D4y8+u8jBpTKzHd9QCnjVTuOvyCPbMsP0yEPvxFAcm
         7BPsNaFnLjj8SBDZliRO2rkOemu6IHt3LpZ123olwwFuN9HvO9NyqSS+V8j4PW+iGJt0
         bOENxvnD7SXFXPJJrMSw2e/nDwKyBJyLTtAZmJL8jicvaoQhyTQ/mox1jWf0lhtQ4/5e
         7S+w==
X-Forwarded-Encrypted: i=1; AJvYcCUjheVH7C0PfIz6Oyoh1HGI0fUR2fEP9tPg9BUs6QNiCLkGuvFwZLY/40c07ckosHN1F6gXSkR72mIZtTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHy1SajKfV5iCSaxZlnkJ8A1Qa2LrAO8i3lDbfnuD3hPcf1ceW
	zK1BnNppj8aCWQnnMR8IKC+zPx+EAzA99bSwDzKA/G8af24I3jEb71+c
X-Gm-Gg: ASbGnctSPeqN6B5GrGOn/nUvUYPbNNahZjmUrMgdCEV5R8hbgH8b6ef+evLbClLAP+Q
	jmUMwfPIJAZTfOBQ3vMdRZtJ6dkYoD227w9hpej2zjoo2kgT13BllDZwIYYZLV+9XBMNh0JmJ9C
	untpG5D0Fz7aD/YOwM+B7m6FeaOUfmnYxyPptIr5RqaoSZjr3XeDV5YiQkNbFL1AeKZ56G/3ZEz
	UF4E7CSQuXblPcte/3QGnPUkx9oRrf/D0P8xXCg4+MVW/uwj1HRxSISsyJeJF9aUF8ha9W/Tq8n
	5qVnJArIcFur0JnHnnxWJVTBY6A5JnJ6O0Q2ZkE3zUBaLuMU4MpLGAA4I6STBDwXjGPx1OJWb3u
	7LYTrWpbWUMQCAY7E8mYivNfHV1aK4clkv7fhzB61
X-Google-Smtp-Source: AGHT+IEPO3BUquyLdtb7MQDL7gYW1Bx9fzEBnimFTAkrCO8oSIr40b9FXRWi8LcR5YBrvb8fT6eF0g==
X-Received: by 2002:a17:907:f509:b0:ad5:2e15:2a7b with SMTP id a640c23a62f3a-ad63f97fec8mr1095362966b.2.1748179046923;
        Sun, 25 May 2025 06:17:26 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4381edsm1537643566b.105.2025.05.25.06.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 06:17:26 -0700 (PDT)
Message-ID: <73836711-95e3-49ec-b502-0638af8d6c3f@gmail.com>
Date: Sun, 25 May 2025 16:17:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] phy: phy-snps-eusb2: fix clock imbalance on
 phy_exit()
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-2-johan+linaro@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250523084839.11015-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 11:48, Johan Hovold wrote:
> Make sure to disable all clocks enabled at phy_init() also on
> phy_exit().
>
> Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index b73a1d7e57b3..19af3f99692c 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -504,7 +504,7 @@ static int snps_eusb2_hsphy_exit(struct phy *p)
>  {
>  	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
>  
> -	clk_disable_unprepare(phy->ref_clk);
> +	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);

This shouldn't affect functionality for Exynos 2200, as gates are not
handled manually in the clocks driver.

Anyways, this is good to have for other/future supported SoCs.

Acked-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Best regards,
Ivaylo

>  
>  	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
>  

