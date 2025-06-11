Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3C28F930
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650256; cv=none; b=uYmIqPXNP40NBxvsApkv/PSy0rrlrQwtvNuWKbJvhmZN+gQRL+eQm4TflpJpBCmJSTf54B7J/DtoRj582/cgMHBRgbxXdJj/fNAL/mtEdkIp4oUJcj7qiPMjtdAZJFpZb/21AGfVQDKtJw/yO9C57BRn79my5cFx27miWFADS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650256; c=relaxed/simple;
	bh=nd64DLm4mhs4qa7Cw4rmwJkqLp8AQYl+cgtOwldnmD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcOPJ7fVtUL7CkhtF72vNhaocB2ztXWbxFyZnx/cLL9ze3NHgDY5IgpNKw56rUquTL69EJgDyavMOt1nRJ39pkwJggZUny7qf5qEGEMuI+c+25t9Ko6dRLVDUZjFeZ79q9AzgpSgSS8bOesTRslAUFGVnzsrmwUSJcMCODwDGl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jisvjjVS; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jisvjjVS"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-408e0986303so4693124b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749650254; x=1750255054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=;
        b=jisvjjVSMo6qU0hKqooo4xFc31Oxn/qrMatYVDoyD1Hlz/Mx81tChCJMdJtqh6+eu7
         WFDPicZtUYGKuRJ+HLRIiMLLoCu8+mxhOyHj2EEif5tZMWHXo3NFf8uuTIWl366+nP5j
         4Dg2IrNX+bFVtrTogNgEByk059T4xNAV8smCcD1idD5NF7PN2OIkNG2iQvgBChGia+hA
         cmXNoqrx7InvM8/WD1Qk+btPc4wBRIuJ/zheCgXbEkf2PE7IumT9X1LUVitKVnBnvdYr
         EI06lDApvbkvt1ZPcAJtDrHQ6/lykU6eSgbnBB3r2PewVAQnUQv5gpcTdJdQzbaUk+Xo
         vS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650254; x=1750255054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=;
        b=Psza/6dw8zyKkPLz2dNBXwUG3I89jJr24z5HR09T9bR37paIjO405alvFHCL959/BC
         zcqGRCEU0xff8jnqBGqhMWTsCuNVVxt1Wn2PmyI+1+6AeGE+mHX/TF18RlDz9f0W7E2q
         KfweC50HxC6MmioeQRmSUHr1kXxw5me5rtaVszl1Wee2iQRcy2XDO6m+CUS8No2gMZHj
         n+M4DPmwWWJGGgGFefVMBd94vPGna5RY9TJbpTs2oHoxCcAHKjxkt3bNbhWspw4FenB7
         FaWkEQ2IKBa5hrH79suPGWLUO5WROTWRRO3hSAV35Kp4GzwINNavfTmvPhxszMt64Iul
         hmpg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5+1ClF4JhUmuNPjZOerujdWDj7doCrBJ8H3/BShKOU6SRB5P81iPG/d6smzxbPAuO7K9f2holRG2Rqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ODJ5I5Mgvm0GotCZeR8GxcX1fh5TIEPFlGGwGzTRxD8IhtQf
	1OBkrOoRUBnp72MqJPJHSPpcRrLOwR7bnrfc/ReasTzlzibfEepeRzSTaFW64wm89HQ1CdB0U06
	ch94C
X-Gm-Gg: ASbGncuy6TwnmOc0chY+UAUS1zYBP7ZY7csUEnT1tWhf4rGe2lU0G/lnOi6S/w0Ngcx
	qSLKdiXLlBAa0Ay3aYwXQ+vIC8+kk2kdZF48xr62OhpNJcmvujUhWcIZDCXUjTf7rfwqfJk3zs7
	CXyJgO0tXRQHqEIHJU1qXH5VhPlw6RJdh3F/9IxcrCWsu/bHDvGYfdMs2+jc2DeWyQsutgiYVGF
	3ETcMpZCtHEzIGGHs08jdpsA3TQKDnwiqEycMBpi6vOx4T+Td++eEWTfR/D/N7qKcL7T/ddKnJv
	gh4yz/5RlMXhHvzBQw4Zuja7JPSsaqW7bP54t/d10oG/ij7xCJXQfBCutSdu7pvS98jVLydkPc+
	8s96sqohvVD54QoYXLNCOr1O1bjbhaYTvAC0S
X-Google-Smtp-Source: AGHT+IHHOJ7UPUjqfa7Ax2DODQaNiUV5DY9O1oiua1yOw8frXqBPksX3fFK+2Qk20HoobYMoNjVxXw==
X-Received: by 2002:a05:6808:21a4:b0:3f8:3eeb:11a3 with SMTP id 5614622812f47-40a5e0a6824mr1694522b6e.11.1749650253782;
        Wed, 11 Jun 2025 06:57:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d941cbesm333645b6e.24.2025.06.11.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:57:32 -0700 (PDT)
Message-ID: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
Date: Wed, 11 Jun 2025 08:57:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-9-jirislaby@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611104348.192092-9-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject should be "iio: adc: stm32-adc: Use dev_fwnode()"

On 6/11/25 5:43 AM, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 

...

> @@ -421,10 +420,8 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
>  			return priv->irq[i];
>  	}
>  
> -	priv->domain = irq_domain_create_simple(of_fwnode_handle(np),
> -						STM32_ADC_MAX_ADCS, 0,
> -						&stm32_adc_domain_ops,
> -						priv);
> +	priv->domain = irq_domain_create_simple(dev_fwnode(&pdev->dev), STM32_ADC_MAX_ADCS, 0,
> +						&stm32_adc_domain_ops, priv);

In the IIO subsystem, we still usually wrap at 80 characters so
wouldn't want to unwrap the lines here.

>  	if (!priv->domain) {
>  		dev_err(&pdev->dev, "Failed to add irq domain\n");
>  		return -ENOMEM;

