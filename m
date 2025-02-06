Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842841D61B1;
	Thu,  6 Feb 2025 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738875419; cv=none; b=WQkK6RzVC9R1EasaENkDF4R2uunktKClBcq5PMI4SJTpB/SzIDGjgz0laxS8RSI6cicclg2ztJffVVe0XedrqUnFARYxwzwr0WY4WOFCy37fFQt7PX0rQhhUggnCNFHRhMTL0jm2IYBl5k9Q9KcdPpdOTrejIOudqyKPvyxIYmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738875419; c=relaxed/simple;
	bh=eQA952u9kkaqAXMAY6HcEfCClqJW3Q7InchGllPb6Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1ABCnpE5UTZE2FGskq41DbX4Dba+HRKvDybezSPUZqtCAI9CzDQkFbxKWELccpmJ5DTEtCSPfS2MqDP5lmIcOY/GXwvt3mkpxfCVz4QJJ3QmFU3ol+MqxPzgVwgV3yqDI2x9EegrOvZBuils6mPQNMXmC3lVhnX0XvFKDYu8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnScLVMu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnScLVMu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21661be2c2dso26771025ad.1;
        Thu, 06 Feb 2025 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738875417; x=1739480217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t9X7DiuBxbqVPGkKZzespQrlxwkrd/xKDxew7+nhW+A=;
        b=NnScLVMu9X3DcD861GaLIar3irSSnPl+4xJQbmYlPi8dKz1Jz+wbOBNSqflwPdFRKK
         aQmGDMBGdZg3rvIzj3DSEAw7JI3Te+e8p8lbdcF4A493s9TX+KQTQ2QCjh2c2TyV/Yps
         LZpyvn90iKZjQRF7BDwXvK8G8tOY7k8Env/wGxHYVMg2UrH6hweMcC/J7cYCXBBM6jvi
         n82VyymSa/9Di57vxg+Wj3QcvH4CRGhJ0pcGUga72wBjb+iAyhmjVrd4jZonO4zpyCBE
         z/m8RGRHdfOew2sXfa8+g9X6tqgpEJCs27M/W6gggVLDKv6sBiaaQGhvA98pxQWp+IS9
         4lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738875417; x=1739480217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9X7DiuBxbqVPGkKZzespQrlxwkrd/xKDxew7+nhW+A=;
        b=oS2ZumEoDF9fcwt6JkdhglO5vCTGTdf5X4y5HkpdM8fjSZaYKtEF7qvbzmZeX8hryJ
         csVwXUZl9taa6/xj18J+wgos10lTBt/sGk+FVVtlLYbuHvFgkxPtrv39lW/irEFnhj6l
         yd9O4TheCmLPtF86AtpU1Pbw+BHcQCXQucrWhFOoni5dtD6kKlWK9vreVp6eFgQumlmL
         OVcy4Maad8+YhHPoDQT/1vS+JaIwhR7theZh/YlWqbAr15OgLxNOJ21WnpeaM6j6kTYW
         eI53AXRI77zuh95cnFysw7a8Pomfxo/dlKIUeP+hownScOvPPW5U07R1+q+BYuOzR6Ch
         xYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGAGtvcjEAdEYyeTKWnSjnAd05xOdUF0Nw7ofrumQC2DoIzt5neYQeNiEIiYfJd5fIVGO6lzE9PNVbT3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnSJbjE3VIIrrNJz509R7vosfcEaPaulHhLQ93WQe2PkkpT59Y
	LInw+ariLS3466B7owYoWqRaPDkYD0BrPNvm6AIn6rs7LXsNnJwM
X-Gm-Gg: ASbGncuITJR/aJU9Z9MRhx0ciIOF+Juze7ggMtJAxagNkWooi7fsl2JkkoyJ5FRAYLt
	eLfGP+Cev/oIn1WvYo9eRi1UlCTx5MCPD+Sjb+ilpYEHNvUMXbA4Jg2PhVC6zXTALE/9URpxI+G
	3/E9Xckmef5KCmAZv6/GF3x4tnbcDMYvq3Y/wxRhxGaeqgQZttLXp3vcDKSlWwJNfQQnTlqc7Ep
	7H5I824ndzdI+KNF/kOzwhnIaLyjq3GyDz3R4wgy92kzbIEfdm12nZbwFVZ3VLgXWtu8EUgWOJG
	GAhodqe8aOf11WaXM0HnXO8vMY2/fDECyw0NLQzP7ePmyqym61AzyCRE+eLT4SSl
X-Google-Smtp-Source: AGHT+IFHKQzDDwJDvoEHHbrGLWZSJmyOofHRIjNbezcZZwLH6ufZCHjcbjaD+F0zAin9G7ojQ7kBng==
X-Received: by 2002:a05:6a20:438c:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1ee03b66183mr1855658637.40.1738875416655;
        Thu, 06 Feb 2025 12:56:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf1413sm1773128b3a.98.2025.02.06.12.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:56:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <92a7ac6d-3600-4bc4-8dad-b679a8e18251@roeck-us.net>
Date: Thu, 6 Feb 2025 12:56:54 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] hwmon: (adc128d818): filter out 0x1ff reading
To: Jerry C Chen <Jerry_C_Chen@wiwynn.com>, patrick@stwcx.xyz,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206063600.321650-1-Jerry_C_Chen@wiwynn.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250206063600.321650-1-Jerry_C_Chen@wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 22:35, Jerry C Chen wrote:
> ASPEED i2c driver doesn't support SMBUS timeout thus we will get dirty
> data while SCL hold time over 35ms, filter out default register value
> 0x1ff to avoid abnormal data reading.

If the Aspeed i2c driver has a problem, it should be fixed there,
not in drivers utilizing it.

> 
> Signed-off-by: Jerry C Chen <Jerry_C_Chen@wiwynn.com>
> ---
>   drivers/hwmon/adc128d818.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> index 5e805d4ee76a..8197d3f14ea7 100644
> --- a/drivers/hwmon/adc128d818.c
> +++ b/drivers/hwmon/adc128d818.c
> @@ -88,7 +88,7 @@ static struct adc128_data *adc128_update_device(struct device *dev)
>                  for (i = 0; i < num_inputs[data->mode]; i++) {
>                          rv = i2c_smbus_read_word_swapped(client,
>                                                           ADC128_REG_IN(i));
> -                       if (rv < 0)
> +                       if (rv < 0 || rv == 511)

That would return a pointer to 511 to the caller, which is most definitely
not useful and would very likely result in a crash. That makes me wonder
you have actually tested this patch.

On top of that, 511 or 0x1ff is a perfectly valid return value. I find
zero evidence in the datasheet suggesting that a returned value of 0x1ff
would suggest an invalid value. More specifically, the datasheet does
not say if bit 0..3 are returned as 0 or as 1.

>                                  goto abort;
>                          data->in[0][i] = rv >> 4;
> 
> --
> 2.25.1
> 
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

That means that I would not be able to apply the patch anyway, even if it was perfect.

Guenter

