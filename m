Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A962B279786
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920744; cv=none; b=Y2XI7z6eK4YGqhX+aJjtVNhNDk7gXzRmTuGfRt+y9wJNUNYDkeZyccqUCYcJ7LRvN0Z3idy7iKnEjTmpGJowWfTdA32psDA0mAlzpiq6HcHHRHkTSTznQdU87jNvpEKxSBtbzcOrEtt1rDkZsojlBpHwUhgMfH3U0W31LiJDQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920744; c=relaxed/simple;
	bh=Y4CZR3AkR1qLJtYLeiYskE8UkSuhw9qUG8qTDjUwqsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYyB3bcTNp4ADnmqQc2YSkffrjGGCsMAkmg0A4BGG8+0LB8MDZIv1EGmVhxeRz+9OXyFDV/hN86kvsKtpN6MxphOje4RgGlv3ip7MrLAiH14+pXJzjqIY+s9q7bu05Q5UYoGjOAkYRp1n4jQgWtLPIJyEzmu1tpUm1yIHT1+aaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3BuVB01; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3BuVB01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745920741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roYvIVYawbb7U9Ozs/yO7NRr33/w0j3RYgfII2ExJPs=;
	b=S3BuVB01XIsI+V+s5fXA7BFQnea1/2dWQDZ2TdMjHDBSH3IDjYFTkAesxVJaOAlKfEjDZ1
	MhX2dbemvvjsTqrKvYXXcGH/A1EFcK/rjLNZ6dOT6YduwDu2So4GedQcG7yqRX22rK7/aw
	AkgYjUsbOBuxhZBLE+GmEwZ6wwBqR+g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-hcOmqyrjPgO5cXXh2kAKjQ-1; Tue, 29 Apr 2025 05:59:00 -0400
X-MC-Unique: hcOmqyrjPgO5cXXh2kAKjQ-1
X-Mimecast-MFC-AGG-ID: hcOmqyrjPgO5cXXh2kAKjQ_1745920739
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5f64bb8ec7dso1224269a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745920739; x=1746525539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roYvIVYawbb7U9Ozs/yO7NRr33/w0j3RYgfII2ExJPs=;
        b=WeS8tDoGhE86WHDXTlIFi3dD6giocSXMMwuoHgtmae/JQvV7VrvPFuNIFEE4eKuRFV
         QYvgm+62G1Dfr90UQUw9XhqRfjzkeF+loQnfpMEZZUXzThhK2/Kq1tEKA/L5cGx1NKDy
         Qxu5wfM5h4kWBj3dQMru2hJskDTeCKpb/nb04betTBwSRVPCQkN1m1EJQqzZwN61qSRd
         Uv2ktcMrP/bhqcGvcKsnPpKB2LUh+8S7o5o31M302hsCVpxO0AiwPmvmkZJ2lfkfv3wX
         KC5GH31KH1OKp62GwETW9bacTn1kQzySYrfLrTzFDHrXm8IcYLVeRC9BOlGWnRJBGugr
         v0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUOMnAIV27MVZl7ChU3CPhrCRN4ncMueeovD9bHaJI5X41d4Cmj88f6ppEUCEWJ4yvQDVuMJe6V9xL4PUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf5uq7Fv2Dq1a5WG/3at6okhbAR7kCVmPworxoLhSoONvXhedH
	DZLWLI710nGxQYpPYXKP8AlaLGqohx9VRbpgs6rI6639QcBnIa1DHrAFjTvk94MPJ2Mz8K4LSeq
	5DmMqgfNKFl7PWtlW5wipZDNrc9Y8OziZeGbdiAA5UTf8Stj2j3/S+fMk94DTCg==
X-Gm-Gg: ASbGncvTdtc8WP/hfCFDm47bqV9mM97/KHQVvvVpwJXj2l6hIgWFSiJ5sAPYXqGVP7u
	p3WyveOS4jve38ZA53oP3Nia7BVcP9a5MJYoWukxffG/rYdUb3C/eHhMaPEU53p/kZ7ujjwKEfh
	wFhUA39z3q2yH49916wEpAdmeOtKbnSSIsvMtNGTR+FewRdNattW9BmDRP/czxe54jzrBZQzUeT
	Q/asRSu1JgLbMn46AgSqMiNMLEy/1knndIl9qDYpMqyunlMQn3s0oaIKIbp5hpN72+c0fa03+wQ
	ziv0WOKDxOycjuSKVl3SMOPCo1QRDEJdAiPmeu16o39XGPSqpl5pQyqhexur7G+qQGEsuLUbLPy
	MJQwihG3R3GaFgW5mEkPZbV5wfwcDQWu9T9t/SaNwiOMYJ2EtLgMLHqsh1n9GuA==
X-Received: by 2002:a05:6402:1d48:b0:5f4:ca30:acab with SMTP id 4fb4d7f45d1cf-5f8392ab7eemr2411843a12.9.1745920738868;
        Tue, 29 Apr 2025 02:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFg8v2+6FTKwtHy/PC8HBUYDQ7YrAJwzJ0+rorJaw+QydUc6H37omfnGkWnwp3gC0Ea8ovMQ==
X-Received: by 2002:a05:6402:1d48:b0:5f4:ca30:acab with SMTP id 4fb4d7f45d1cf-5f8392ab7eemr2411816a12.9.1745920738463;
        Tue, 29 Apr 2025 02:58:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f48a3sm7155592a12.34.2025.04.29.02.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:58:57 -0700 (PDT)
Message-ID: <ae359018-6561-4b06-8518-1b14497d5c5f@redhat.com>
Date: Tue, 29 Apr 2025 11:58:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: goodix - Allow DT specification of missing
 reset pull-up
To: Esben Haabendal <esben@geanix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-2-0687a4ad5a04@geanix.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250429-goodix-no-reset-pull-up-v2-2-0687a4ad5a04@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Apr-25 11:56 AM, Esben Haabendal wrote:
> In commit a2fd46cd3dbb ("Input: goodix - try not to touch the reset-pin on x86/ACPI devices")
> a fix for problems on various x86/ACPI devices where external
> pull-up is missing were added. The same type of problem can exist on
> device-tree platforms, and the fix can be activated by adding the
> no-reset-pull-up device-tree property.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks the new version looks good to me.

Regards,

Hans



> ---
>  drivers/input/touchscreen/goodix.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index a3e8a51c91449533b4d5185746df6b98676053dd..ce4622bbcc89434a4d89c49bb97f084fb61aa448 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -772,10 +772,12 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
>  
>  	/*
>  	 * Put the reset pin back in to input / high-impedance mode to save
> -	 * power. Only do this in the non ACPI case since some ACPI boards
> -	 * don't have a pull-up, so there the reset pin must stay active-high.
> +	 * power.
> +	 * Avoid doing this on boards that are known to not have external
> +	 * pull-up, and all ACPI boards since some ACPI boards don't have a
> +	 * pull-up. These boards need the reset pin to stay active-high.
>  	 */
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> +	if (ts->gpiod_rst_flags == GPIOD_IN) {
>  		error = gpiod_direction_input(ts->gpiod_rst);
>  		if (error)
>  			goto error;
> @@ -969,6 +971,13 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  	 */
>  	ts->gpiod_rst_flags = GPIOD_IN;
>  
> +	/*
> +	 * Devices that does not have pull-up on reset signal should not be
> +	 * changed to input
> +	 */
> +	if (device_property_read_bool(dev, "goodix,no-reset-pull-up"))
> +		ts->gpiod_rst_flags = GPIOD_ASIS;
> +
>  	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
>  	if (IS_ERR(ts->avdd28))
>  		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
> 

