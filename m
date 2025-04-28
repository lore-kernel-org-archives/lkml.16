Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597271F4629
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829203; cv=none; b=aFy0OFbiP09y9JocbvYQ6rs1U2NbcWAeRRn9uHd1p2SRGznCxyUMrv8CKNylDgr4wZcQ6HfpZgxhe2FZ+UBhd/10srqX5odJEk/pJu1Bfj5AVeNlOTTEaLtiL09A5V6EK31S4hmR9KbJCeyWzgOihZyCMWfDRC4gUPYK2DAefjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829203; c=relaxed/simple;
	bh=pJ8O7gTrYUeWwxuWTIvgNyTjTeTs5VMSdWV0Q7CbJaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvNVSfnxYtn3kkNIgkLH2zOTUH2hyJG9vfYr1NHVOo6HKSNCthE9DceQn+2OzB71+yb3Y/fbf0SwOoLvDiMdrAIx+BOvTd5un1KBUYgZKZTlN+RzX0jdeascHfA6x0w+PGlHgkbCtTcHima3J6PJH4GxUwaLLam0JeTohl0DARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QRlQgfVb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QRlQgfVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745829201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGcvqcUvkm2g9wzS683vHLZvM4pUfmU6Vbf587HsfpE=;
	b=QRlQgfVbii4lS8qL7CbYJ/Z7/aBzcYghZbiHIz7L/1JdwTPunP9WWC7OiVjAuv6lFeWTFr
	mPybNMMvgCxGd+vsT9fB1qvo3SsZGYqGEWCREEjQ87Pa4sZKJR13syxN9uncATsMHQNQys
	7PPoaOM0ix7H2qAq4sSR/IMuRedrZJo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-yfamurlxNiyIS1UOlXX54A-1; Mon, 28 Apr 2025 04:33:19 -0400
X-MC-Unique: yfamurlxNiyIS1UOlXX54A-1
X-Mimecast-MFC-AGG-ID: yfamurlxNiyIS1UOlXX54A_1745829197
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e6c14c0a95so3455404a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 01:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745829197; x=1746433997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGcvqcUvkm2g9wzS683vHLZvM4pUfmU6Vbf587HsfpE=;
        b=ZmgvHECy+g7I5sBRIile2y/upJBZUtAG6Ha68J4wafKyS5EyBJL1IiUiVYj8IZm8R0
         NaYUj5avcucDSdJc9Dcct6nA0OxrFyUpJQEwZ7yvbDvNV7jcC/G5XRoobjJPB9PLTcSs
         0otoUdzIyPiPuhrL4yP1mwpUJWGSbttslSThhmkyPFLWPPf8vfRzzMvpJ+8689R/P535
         5NLXrDCsq6icii4IYGX2FmAsMFUGpZklLyoUBBT3cfji6b7W33sS76kl1uwmfaJHnX4C
         pj+sNOjvxZ9yPz5tBw72C0pEU0NPmEnZmvNux0WYTLZ6j8e7YNushnKCcbcvjOML1pPN
         q8rA==
X-Forwarded-Encrypted: i=1; AJvYcCVClv3lndKPG0C3/F4frMogpUS417NhgCaV2lTVDbfdKCmKOR4KZEBUk1/5Nkfqk1ZGimUYGOUtigXfBZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+dXogsXQJRStYEdYnJ/hcM36XXPPi/G8caJw24naOvwbG7Fd3
	Ja+ublNbpu3BGO+Sh7MNNHvY2IYYPKI8L3lCZUIrKXUIADuTFleFMPsKrTSm21F80vSESAPG9QF
	8wbpD9aV0eEZuGMgCDgHZkvY3zSgugbVwAu4R9bAeNSi+rxaYNsMIbKKnt0Hpbw==
X-Gm-Gg: ASbGncsuN8pwAA8g16Fw1hY85FIKbGV24txnsQLb1iykhUqrRFsNJ1BstpNBKEKm/ZZ
	RAjqswdhxCFriPAwynAF8G4ISG5QP8+xZfJHXPWazZ/LYkWKpSpRLxEttNeBDSM7YeEkoIooAsq
	L+yQNH3JLlQEzhd/kx+QNyXOF0p7IeGN+86wwDNYiq9SADup9+lMS1sWJ51yLbm43j9wZd8b+7Q
	T/h3dnSyRFnceNxNSJqma0FrgHTpR64diTudqAiiiRmxOZQEXKSCT2zeJKaw8EugpvMFsCsZW8L
	+m3VEzxvkXoOz5M=
X-Received: by 2002:a05:6402:1ed0:b0:5e7:b015:ad42 with SMTP id 4fb4d7f45d1cf-5f7398433aemr7803774a12.28.1745829196879;
        Mon, 28 Apr 2025 01:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnQGf5p3Imb0SlRCtdMs61uLPDDIs2q+uuHYQl1CCgJCkHHSa0Rk4MkuYWgz4wW7ho0OyaDA==
X-Received: by 2002:a05:6402:1ed0:b0:5e7:b015:ad42 with SMTP id 4fb4d7f45d1cf-5f7398433aemr7803759a12.28.1745829196464;
        Mon, 28 Apr 2025 01:33:16 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703833c66sm5480374a12.75.2025.04.28.01.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:33:15 -0700 (PDT)
Message-ID: <e9bafdd2-d84a-49e3-a221-36088f3c753b@redhat.com>
Date: Mon, 28 Apr 2025 10:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Input: goodix - Allow DT specification of missing
 reset pull-up
To: Esben Haabendal <esben@geanix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
 <20250422-goodix-no-reset-pull-up-v1-2-3983bb65a1bf@geanix.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250422-goodix-no-reset-pull-up-v1-2-3983bb65a1bf@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Apr-25 17:15, Esben Haabendal wrote:
> In commit a2fd46cd3dbb ("Input: goodix - try not to touch the reset-pin on x86/ACPI devices")
> a fix for problems on various x86/ACPI devices where external
> pull-up is missing were added. The same type of problem can exist on
> device-tree platforms, and the fix can be activated by adding the
> no-reset-pull-up device-tree property.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Thank you for your patch.

> ---
>  drivers/input/touchscreen/goodix.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index a3e8a51c91449533b4d5185746df6b98676053dd..3a55b0f8e5132a5e1fe77bd27de74e058a4afdaf 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -775,7 +775,8 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
>  	 * power. Only do this in the non ACPI case since some ACPI boards
>  	 * don't have a pull-up, so there the reset pin must stay active-high.
>  	 */
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> +	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO &&
> +	    ts->gpiod_rst_flags == GPIOD_IN) {

You can simplify the check to just:

	if (ts->gpiod_rst_flags == GPIOD_IN) {

that will work for the IRQ_PIN_ACCESS_ACPI* access_methods too and
nicely lines up with the gpiod_direction_input() on the next line.

Please also update the comment above the check to reflect the new
situation.

With this fixed, this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





>  		error = gpiod_direction_input(ts->gpiod_rst);
>  		if (error)
>  			goto error;
> @@ -969,6 +970,13 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  	 */
>  	ts->gpiod_rst_flags = GPIOD_IN;
>  
> +	/*
> +	 * Devices that does not have pull-up on reset signal should not be
> +	 * changed to input
> +	 */
> +	if (device_property_read_bool(dev, "no-reset-pull-up"))
> +		ts->gpiod_rst_flags = GPIOD_ASIS;
> +
>  	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
>  	if (IS_ERR(ts->avdd28))
>  		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
> 

