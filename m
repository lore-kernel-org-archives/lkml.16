Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C325F965
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582232; cv=none; b=oWsrJqbs/FR2aPaAEmlTL7gOZQYm9hhyy92c5lSInB6HtgiFqrnBg31nhJGhnO9SnsjXowZH8+IFPlcMcyQIJuYP2oX4xjmIZ1UACKHNJ7aK9RWdzM9juUCkh1sOlELIHcFW4MoMsq9AsErUqeMxg88mTppg3dMtJPgId7Yffcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582232; c=relaxed/simple;
	bh=yHYkDxxRy38M1FlNtZYPSs82PtWZaK2ZvGmVJyM824Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxbHcCaIO3+3coln89skuxQTwrFjGKwuM5fVYCMJhcbH7/TbpQQQKonqatLI2fSJHjFruWbZWlK0GcWECR/1m+mneU7wNIyAgAC2n9ZWA5X/NVlXIoVjiuSQEJw8t3Hxty24HeHL0J6uaabWNgC79FkbqGOcNJrlsvsl5QpfvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URpkAOrh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URpkAOrh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d3f72391so75436055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749582229; x=1750187029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=funz8EyNepVDeMk/RxHWitYUvBrNyORmOZCxo5M3b94=;
        b=URpkAOrh4FTPog54w5xzIUSwYxK5JGHu/569LRZjVANl/CnXIuUiAwELLXSYv72ylB
         Ig/CRvz3qkP3rs20FQbkPW4g68JRstuNmrxZJmSOi9+55djuGcVMjmbHi2Fjbp8PGjvD
         FvbVz6bliyNHT5pn4gGIaGoPy8YAYVCCeoTGl0Lh1K0F97z1bRDLZ7Ght4ZqsFnLvALN
         +8moCPYxs8XKmmDxe7HlZAjkvCh52b9xvwSRuZYrxyWof8FKv7H2uUMWzb3u8KlP85+N
         c0TukoLHNGO1JKNisq5IKu+EXOPeEEcHr1z2ExK7QDUU8vibLL6+ye/8Nz3xFH1Fk+0H
         ZBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582229; x=1750187029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=funz8EyNepVDeMk/RxHWitYUvBrNyORmOZCxo5M3b94=;
        b=F+BBGmNCAN2GVGBJnVn1jJ9M0U3LUPbgqXYVEtUrwx3vhkLtqB/3H8vDS+qArjnzBj
         SNWByB8m5VOAISvdW7BA0Z3PzyaUQd0dxRkFeqgxeJ/ee+USI/hTZJYRkjey8pD60Lku
         bGcxSclELW4LhvpdyJDtAG/j9chx93/1NcSVWc/Iw5TN/QQ4W8bHeSd1383pp1Bxy8Rc
         Zb+QCDVYE0Ci+MBufFRNcKc2qr46bBXJvifoFErwl6BqwHLHtJkTS4HO3J0gEvOIbdmQ
         Gs/QGNtyVo5OT6/mK0fs63upDfo8JTmfLizFCVs8y+QkTigKXV2FdpZz/07wETt8CBP+
         MlaA==
X-Forwarded-Encrypted: i=1; AJvYcCUu+qy+l+f1f715+GIqP0bQDvWB+1VkuuHELol6kRn/YUI7PrEPIOiHTLZ0PM+o+qplUm0d8JbUKQ9N9ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7MGSKy9711DKNDft7PWF3UjT7ZKbmUFRSFSS/R1gcf/GF3npk
	saXOjHhoTJjFfDRJYMUg5ZP7Rxms0StMJ5Q+2YJ2vE8F+BC7nh+Vps6NNBbQOCBxD4o=
X-Gm-Gg: ASbGnctJQ6dFlyxB4RnVn8hRU4w1v6rBAfTyDhsULJ3HlBVVzo0J0L8WeKHsTtDdQcQ
	JozIlKuGDCLWPji/bkT+bwNQ0ZA4RD4XSwypQW+PysE/QYlD2sTWFCvIRtkWInDHXh206PbqXEL
	ILMhQJEbceUZB0WXTEQoi+FoTL+YGbF3Xaf88wwKdW+Vs8zWl9ehhE7kAXyeWCprJjVfNHjJZHn
	YBdB3EsXfKiKPhufvx74EsBVrcI6XKLtXg36kHct8St00sZgcWPvw3wAxzhezLCXBfR+BCz4VOh
	sU//wapVRiNfhRefSXrr7gq5wdUq9z40hBf7JnUNIiW9ysOFyveN2sy62MlzmM/w59j8t/hJ13d
	zOvNid0W5jmzgkCKHIT1CinqiJ1Jn/KxXWDUZvQ==
X-Google-Smtp-Source: AGHT+IFka0ouDWU/1cfYMkQ1O8mZ7JUKop6qAwXN0Nv0LhNi30kWDFWStH0iiouNqQwWBVbHfIQMdA==
X-Received: by 2002:a05:600c:1c08:b0:442:f44f:655 with SMTP id 5b1f17b1804b1-453248f8b5emr2177315e9.32.1749582229240;
        Tue, 10 Jun 2025 12:03:49 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709670sm149959845e9.25.2025.06.10.12.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:03:48 -0700 (PDT)
Message-ID: <b574bb3a-eba7-430c-bd83-544eb5188cfc@linaro.org>
Date: Tue, 10 Jun 2025 20:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: lenovo-yoga-c630: use the auxiliary
 device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250610-yoga-aux-v1-1-d6115aa1683c@baylibre.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250610-yoga-aux-v1-1-d6115aa1683c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 09:41, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
> 
> Use it and remove some boilerplate code.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> This is essentially a resend of this change [1] which was sent a few months
> ago. The necessary auxiliary bus support has now been merged with
> v6.16-rc1, so this change should be safe to apply.
> 
> [1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-4-c3d7dfdea2e6@baylibre.com
> ---
>   drivers/platform/arm64/lenovo-yoga-c630.c | 40 +++----------------------------
>   1 file changed, 3 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
> index 1f05c9a6a89d5ee146144062f5d2e36795c56639..75060c842b249c1b4cab21fef943266ae0b31d32 100644
> --- a/drivers/platform/arm64/lenovo-yoga-c630.c
> +++ b/drivers/platform/arm64/lenovo-yoga-c630.c
> @@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
>   }
>   EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
>   
> -static void yoga_c630_aux_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -
> -	kfree(adev);
> -}
> -
> -static void yoga_c630_aux_remove(void *data)
> -{
> -	struct auxiliary_device *adev = data;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
>   static int yoga_c630_aux_init(struct device *parent, const char *name,
>   			      struct yoga_c630_ec *ec)
>   {
>   	struct auxiliary_device *adev;
> -	int ret;
>   
> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	adev = devm_auxiliary_device_create(parent, name, ec);
>   	if (!adev)
> -		return -ENOMEM;
> -
> -	adev->name = name;
> -	adev->id = 0;
> -	adev->dev.parent = parent;
> -	adev->dev.release = yoga_c630_aux_release;
> -	adev->dev.platform_data = ec;
> -
> -	ret = auxiliary_device_init(adev);
> -	if (ret) {
> -		kfree(adev);
> -		return ret;
> -	}
> -
> -	ret = auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> +		return -ENODEV;
>   
> -	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
> +	return 0;
>   }
>   
>   static int yoga_c630_ec_probe(struct i2c_client *client)
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250610-yoga-aux-30715036a8f4
> 
> Best regards,

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
