Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39829238D32
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705103; cv=none; b=JN47I1wE07kqfZqHxHpkR1WZsfmXx4u/oJj4ypxFL6wKPw3RDVS2YpkTmXcclKBPE/wdRDVMyKHSj2HEYWoOfxhZ8tw27QT66tznUZQxvygGMKgxeA5Hogo1p+UOc5NB+VJ5dRIZEuI3oBImaMFoEV727yDjelnrMKidaH3FRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705103; c=relaxed/simple;
	bh=KXC6nG9o6ovfA99bRXDtfifCdJkX3mbrQkn/5qBs7+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx49KZQizrdCUNeS6y//J8Tze4aGq4jHwtx2SbsHruM82iYkMuohW0IXgFc6xYOheIbo9QvvYFVkgNw59uazr8HHFAY/Nhm3Y8em3hfB2jgU2jWctw6EWGjfybIUKdtx5UBbtNm/IBjfmavLQRKm462AjCvbMixw48o/2jGO6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvVKiLgd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvVKiLgd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2353a2bc210so39683175ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750705101; x=1751309901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/O3h7OHyc2BiZHoJ0hTf/eryzYqTkwG6KkuAvS6L3sw=;
        b=AvVKiLgdfdSIqscYHKusHBqWSGbOkCIQhJXKBPJe+HVWTK/D6cY07cQ7Uxymypad9w
         gIbvUiosePAk3BfTrEgvHSmF0yGsu8iBovYLvvyPnuY13+3jkXhpruiOBy3pvIM/q4F3
         QG6+W8WRjja3ea2a+CJvGUqulpbBVE+BlWitgz5t5/smrU85jhB0L+/B2eAw58HEnu23
         xLher3Bcxa2u76mGk383+efLdq69xI0AyLdJZUA5HqqJ5sxj2pRoyZnjfq7A1zFLjKPH
         qr3NNBxHPf1mkAxm+ZegC8Qxynk/GBPaA7suaQfo+zYuZJevuU/xQIyuomq7HNLEUBO+
         pvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705101; x=1751309901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/O3h7OHyc2BiZHoJ0hTf/eryzYqTkwG6KkuAvS6L3sw=;
        b=pf8QaUJ+Utp0fHEmuKyr8sqlKmMCWU1Dck7ATE9Y60LNPlQP9ltDdnrC5Ls3wFl5dQ
         CKbEAjQ9ujQj4hgKp2NE14qI4vtbnb4YNnnzBbQ1nOIrmdSmvAE2mo77oQl4EVHW36H2
         XC9Ae4QXfyFNHgOjHJI3RSCvUIBf/fg5Ho3nRL5+Z8815HhGzuK55qq+Q5RlJ8hfjKdV
         UC4lyqwEe9YsAIJkD20jBvLHOw5Jt37aztIqm67iCpfdYTy/B8PtCcL3xjKxpgCOpFGI
         cUusAfvp+9Y2IdSlc5IdR0lUSehk2FIVXw5tkmbEgO839R4mMvIOQK4BUwDoZxQVdkj4
         A8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5l3vKqFI4fJcdOzpZ+QDntLhSCdaMGqtEuZDPqkBRPzBEb7HDqOddyRL2xGHc5MJYdxLuELMOFaQYQO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoJNs1h/EP/bRTufWmfVlkzQsl2KY/xL/4sImA7tTOnY1UL4E
	1FobKCWMjcGZM9d7M6BFAgOKijnruLdHpb+P1PzQUlvMFWUVoDdmvKKL
X-Gm-Gg: ASbGncv8nwUE212C3/ldbGWhteOUelEBB4DO9YGMdNZrGJ/t6d3htpVnLpBAG8Qh7Vy
	w2C3Ut/OE51U+pvlBAnNpCphaF4QXWFJDZuKlnEd6oWoeEenWs7Sz6hZJD4o+TA5OZUimfc/L8T
	4BJbHJLTEl1onK2m9uvInkr+GUeV9PhHURGgr0rX0BtfedY+Bj8zVzOC6GdxmvzYkEFqAhU8EsX
	RZ8ZVsrpNbBWmim0HLcznOjaMmiENYgjCcM36db9ZD5bFLaGIvabzjIQ6GH+/NGS4Gfcm2OAosX
	0ebtjaN5u5bMToFnU3OLHSxLEld0IkYBQi+HjJggCVCGn5gzycyJR8hPDZ5z9O01VEu30Ew2G47
	hANDHqzaYU8fEZdAotB+xT3AB5Wv8H2PnlnaHxcDQafY=
X-Google-Smtp-Source: AGHT+IENkeoSBuA4jTjYl9KWxptwSqcwo3i1xQKpXRpE42MjrM73xfnm42nrHcyeUL0MUt8nnDDBLQ==
X-Received: by 2002:a17:903:4b27:b0:235:2799:640 with SMTP id d9443c01a7336-237d98e293amr171449175ad.25.1750705101493;
        Mon, 23 Jun 2025 11:58:21 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f3e:1d84:1eef:8ea3:6428:4c20? ([2401:4900:1f3e:1d84:1eef:8ea3:6428:4c20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86ef84fsm88022405ad.216.2025.06.23.11.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:58:21 -0700 (PDT)
Message-ID: <85286090-e8da-4189-ad07-84876e0cf283@gmail.com>
Date: Tue, 24 Jun 2025 00:28:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: gb-beagleplay: remove unneeded calls to
 devm_gpiod_put()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250618082000.36039-1-brgl@bgdev.pl>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <20250618082000.36039-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 13:50, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gb_fw_init() is only called in this driver's probe() and we abort the
> probing if it fails. This means that calling devm_gpiod_put() in error
> path is not required as devres will already manage the releasing of the
> resources when the device is detached.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/greybus/gb-beagleplay.c | 21 ++++-----------------
>   1 file changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index da31f1131afc..1ea48b71a030 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -1041,7 +1041,6 @@ static const struct fw_upload_ops cc1352_bootloader_ops = {
>   
>   static int gb_fw_init(struct gb_beagleplay *bg)
>   {
> -	int ret;
>   	struct fw_upload *fwl;
>   	struct gpio_desc *desc;
>   
> @@ -1060,29 +1059,17 @@ static int gb_fw_init(struct gb_beagleplay *bg)
>   	bg->bootloader_backdoor_gpio = desc;
>   
>   	desc = devm_gpiod_get(&bg->sd->dev, "reset", GPIOD_IN);
> -	if (IS_ERR(desc)) {
> -		ret = PTR_ERR(desc);
> -		goto free_boot;
> -	}
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
>   	bg->rst_gpio = desc;
>   
>   	fwl = firmware_upload_register(THIS_MODULE, &bg->sd->dev, "cc1352p7",
>   				       &cc1352_bootloader_ops, bg);
> -	if (IS_ERR(fwl)) {
> -		ret = PTR_ERR(fwl);
> -		goto free_reset;
> -	}
> +	if (IS_ERR(fwl))
> +		return PTR_ERR(fwl);
>   	bg->fwl = fwl;
>   
>   	return 0;
> -
> -free_reset:
> -	devm_gpiod_put(&bg->sd->dev, bg->rst_gpio);
> -	bg->rst_gpio = NULL;
> -free_boot:
> -	devm_gpiod_put(&bg->sd->dev, bg->bootloader_backdoor_gpio);
> -	bg->bootloader_backdoor_gpio = NULL;
> -	return ret;
>   }
>   
>   static void gb_fw_deinit(struct gb_beagleplay *bg)


Can you add a comment above the function that it should only ever be 
called from probing code since it does not free up the resources? I 
might end up forgetting and using it improperly in the future.


Best Regards,

Ayush Singh

