Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3AC1519A7;
	Thu,  3 Apr 2025 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682509; cv=none; b=V15NV5xR7IE8Nf7AEDdl4dKlrN8m1LtK2saa7refDAZhDjaGOTyXyDQPNp4u4sam1PvVT813zLFkqeaKtO3jtAcHEmv7Cdt9zVlp6R/vvdzyliELmbrkSYdZN5SLiw7PBwLH0WPuIYbAOaZ70An8DWfbuTj385gBwv3rtXNlICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682509; c=relaxed/simple;
	bh=Bftxkh4bHFoiu3H0g5ZPpdrSHV6AgFSlGYQ4+hfbMdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpTm0aJ5vNS2Hra3bf7VRfLPJx9FHt/Uxvd4l+fu9uVle1MCgcRz2ntYUEM0sDasLkuAEZidE8Xb3Ghj0Xf3prVybCryyPoJnaV3ALAY/lyF88WxikYm5utom16OaOMlh+/rSDTQtmsMET2Y6kyZFZaSy+GC5/AKES4UsqYLrj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFBK/vMk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFBK/vMk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264aefc45dso11372615ad.0;
        Thu, 03 Apr 2025 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743682507; x=1744287307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MPG36/Xl3AvNG1FiiDUMt54TrdxpwOFTfcyH2y+w3F8=;
        b=aFBK/vMkoNcEu+z4ILDwgTW4uYlaSnYsi8By6BOR41f1wMESC9TnPvfk+xu6qXsGGl
         OIB6e86m8XGxQCNzS9ToSS+deS1duZhNZDDa0z4FfV++7PFsi8HdtBxEhi5GBNlmJ2V7
         U5pt/97LaYx7s1NYWSuUBpgZiuA+vH1swd5zNUukoiry4ppoBTP4/845qoAdvBk8Iz29
         +QCPjkp/hxvu311uhvjZRfng+FMunEoUYCs4nY3J5vqrFsMOm6L0RUj1QCo3uGDWygAV
         Vk5ezyG3gLXnTSy/4Lh0yzo+OCEajSDHPcFy9e7QwPd8Y8bs+AncBZ2idSioKZr1vRWD
         Dr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682507; x=1744287307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPG36/Xl3AvNG1FiiDUMt54TrdxpwOFTfcyH2y+w3F8=;
        b=hjDE1CEQeZV1AvQZkL39rnUUCRZYNY1j1vkjIpWp0Ir6qRVJ0W7ejvnxoO41896sUS
         dZ965my3dXz2w36O+mudwD+YT1c+ds2nPXTzV8ByKfX3ZNkGlUMaufAelYwvA4Fla40+
         3bSMf0SWIbLWWoVyf0QI3eAFuh5QLR/f/andQRJeSQKIfnkca3kXpNeOI3hj4hCE4qsM
         w/FMzUE3+2J3LTlDFevqcUa/6IKAnRt2YRlfPWi+VMOMddBavuxQ+DfP453tJsvRY/Ms
         337Dd7yFpp1yw98/1c+V6r6e3BM59VFx9YK1vV4iSPwMAynDCZfxjOQYmQ9gPcf1Sd+A
         qB8w==
X-Forwarded-Encrypted: i=1; AJvYcCWQSPYR/xUG4m0IXhC2xNuUoR4qxW4NasWf4TBmKvyAE1Sn+o4v7nLDhlHtwkE5FSC7RdMw3I0B4VRt1+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaNCXB6EGv0LhvOfi0CO6G/DDzwHpqvZ31u8uE6raEnjeuRl7
	f0Z2z47ISmoBwUMK6aRvEQBCnl30iDYGIWrYC8kCLm2DqBkTVBM3Y9UrlA==
X-Gm-Gg: ASbGnct+q8M9u8TC3WUlX/SGz/T4EAVrm8XkewRTnX7/9/tZr/BB3M/n32neNoj+XqT
	aX9YUlSk1gr7A6D4fPJreRXHYSElz0YQY8AZyeqrAmNIdg9ykZ1H3RB84zqfciFE5NPoHDXVOjG
	3DV9/clJ3MsSGe1suJ0zm4AGwvd8FxlJkjqYI30LTg9HAATZg/S/UU2Lq+jl8W/8ZsBeYMQd2HF
	XvTi4b7wVUtaAfH11i48ii3ry9Tzeyye98McEIoTO3rk+6PsHUfbD4x7AcLGcu1zSX4qmDaKaK9
	rt757OYD3X1w1Y2zFrULdnNud9+s1gapRcxAtUYT74ApJYrSCkntFct+tkAuZDx3o3KHLRCOwLY
	oBJbC/6nsKljdTct0hw==
X-Google-Smtp-Source: AGHT+IGNTOyNKFX1ox2cARvuLnsrRIZYhN/3/6mcnFnVhog2TVj4X+gtJH0rjiyodRdh5fgAkPaLfw==
X-Received: by 2002:a17:903:1ca:b0:224:24d5:f20a with SMTP id d9443c01a7336-2292fa1add0mr356936755ad.48.1743682507345;
        Thu, 03 Apr 2025 05:15:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866dccbsm12632115ad.176.2025.04.03.05.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 05:15:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
Date: Thu, 3 Apr 2025 05:15:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Florin Buica <florin.buica@nxp.com>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 03:15, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
> dedicated voltage regulator.
> 
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   drivers/hwmon/ina2xx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..ab4972f94a8c 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
>   		return PTR_ERR(data->regmap);
>   	}
>   
> -	ret = (dev, "vs");
> -	if (ret)
> +	ret = devm_regulator_get_enable_optional(dev, "vs");

devm_regulator_get_enable() should provide a dummy regulator if there is
no explicit regulator. Why does this not work ?

> +	if (ret < 0 && ret != -ENODEV)

Why this added check ?

I know it used to be necessary if regulator support is disabled,
but that is no longer the case.

Guenter

>   		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
>   
>   	ret = ina2xx_init(dev, data);

