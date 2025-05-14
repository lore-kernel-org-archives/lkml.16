Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5325DD07
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217706; cv=none; b=O38Gos9Tlhu74e4uBNnq/KhqIPvRus2qsRu22YF3QPhtPfH2ds1Wfhq4mDiwIVRzN06S9lYhc5Q9r1pLVCXJsXGFXNBRvHuUVJTCtFar/XSm4Fx1ijjI9qP/GXE3rY1J0OatQnUlr2ndDVRnT+H6O8eQochofBLw5lezW9edLuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217706; c=relaxed/simple;
	bh=wDmraekW7m0pgFwPRFE4S7PnYUyPMFc7PeEJ7Alaud0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeGhrooD+SmQVpTTA4kMSUZemr3dhc8ZihC/jRA7gHbRnrHSQy8UvYicjqQW0eZrSSYHPp2yYB2IJ/jKxyZT0boVgiMg+bSYqhak+yvbnTjuoUkEQHdBxjoRFGBFGDHBPX8ya2LzzyVQpnv2zFC+lJsyUXHnJfO2Qi7dPx/A3kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVsAw0OE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVsAw0OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747217703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8LKDxEPlK0zUrqmN4DZvo7SZOHbpNlPdUFt+T51TxI=;
	b=iVsAw0OE2vGJCyUNvW6ugcxjU7vSSbGD92RyjT5sMmupNXNUIMZ88541/tp/VEhQ7n1qUT
	oyWnl0avt8d9/CuW1efMdgdTscgETcK1B+EEX2UgC5ldbk+X3PFwvq/x10HC/J02w9tfJK
	dbjyRG8CUIEO5V+pbDti8SHEJ2epFCE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-nkjWSNYMMLqNZseHEO-MeA-1; Wed, 14 May 2025 06:15:02 -0400
X-MC-Unique: nkjWSNYMMLqNZseHEO-MeA-1
X-Mimecast-MFC-AGG-ID: nkjWSNYMMLqNZseHEO-MeA_1747217701
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad224fe3745so534391666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217701; x=1747822501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8LKDxEPlK0zUrqmN4DZvo7SZOHbpNlPdUFt+T51TxI=;
        b=n0GsYDf80dsUvScVpiGQuX0JfWE2/s4OOrYug7tcmEtGU0H7NbpWvj0CspnQlV4M9r
         7UfnJg53Uxmx5ZkEDPWJIGnQe+s69iNTWwlaxXI+KDxpZv7RlMG9M8aU3+P9/+A5FB6i
         zuu7mrF7GVrHEoNiASuvXH78ySYm0JM/vAXUd6iIhajQOH2ogsTsWap2UWZdgPL6lnMo
         00Iz2EsT6i9stEzNKetESc7NeQVaW3dKuSpyWZewjRwhmg/phttMTDy/xRErq0dZC+2V
         YqijVNu+6cTdMAwwCHUzsRy8KibVYc8h627zvQsRclcylSPWY8oxjayQP0WibD44l7DH
         ZIvg==
X-Forwarded-Encrypted: i=1; AJvYcCXXr6uP003cgadx21zhiXDTjfjrbWesOUxMOC1TGHAgcTnyz7/+LODyCysCRukLnIa09g1Sd5j0AUhw3K8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymJVtT+d2KrptdJ7iBOfzL8qVU6jPiDgWK/zHK2otrx39KKb9I
	Qe/Y58XMeuF7puvklax4qIpRlMSf11PNgFIb0ZyyCb0qb5pSvZbEB5r9IYCWngN79LStvcV+yi5
	jnRAwzv9ZeI6ndtv1kc0DmUOL+io3segVyXziX5rTHJOKb9PKqhuUsT9cBf31pg==
X-Gm-Gg: ASbGncs2r+BrqVlQXzKeSNe3Yf0zUbt/9mdmGAswXq+hOk4IaSbgpMQcHMv/LDCOhVc
	+DT6OaCS4Rkjmt7JgOPrDe8H98kkUpXWH/Gu63wVhM6kyaa8ONYLxrdOC++REGkkIjRKiLdSYgV
	wcv8+0THXl/JaNyhFnyWxSBh/evN86DI/owCZwc3Wq6vaGiHsIOhmhLb9iR5HDUC2F5Q7Ockx3L
	9bVCP9J0HXFdCgHEkMyBOz82oqvQYrck63a2NDp9KEHfr33IrU/kkB9HUzEcpagQiSjzMaVHVf2
	h6E7or5qGHeAYW3oVQ==
X-Received: by 2002:a17:907:96ab:b0:ad2:293d:166e with SMTP id a640c23a62f3a-ad4f717a571mr262750166b.31.1747217700925;
        Wed, 14 May 2025 03:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL7kdzll3t4oQ25ZYCbLYS9k6oyFJfi2q4wOT/F3rxR/d4Hx5O00NDK2zGNm+A5NAW2+hs3g==
X-Received: by 2002:a17:907:96ab:b0:ad2:293d:166e with SMTP id a640c23a62f3a-ad4f717a571mr262748266b.31.1747217700550;
        Wed, 14 May 2025 03:15:00 -0700 (PDT)
Received: from [192.168.37.224] ([109.36.142.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947acf8sm912226966b.85.2025.05.14.03.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 03:14:59 -0700 (PDT)
Message-ID: <adda844f-1dc7-4c4d-90f1-ddba1c99be65@redhat.com>
Date: Wed, 14 May 2025 12:14:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] gpiolib: acpi: Split quirks to its own file
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Mika Westerberg <westeri@kernel.org>
References: <20250513100514.2492545-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250513100514.2492545-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-May-25 12:00, Andy Shevchenko wrote:
> The GPIO ACPI helpers use a few quirks which consumes approximately 20%
> of the file. Besides that the necessary bits are sparse and being directly
> referred. Split them to a separate file. There is no functional change.
> 
> For the new file I used the Hans' authorship of Hans as he the author of
> all those bits (expect very tiny changes made by this series).
> 
> Hans, please check if it's okay and confirm, or suggest better alternative.

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Andy Shevchenko (4):
>   gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
>   gpiolib: acpi: Handle deferred list via new API
>   gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
>   gpiolib: acpi: Move quirks to a separate file
> 
>  drivers/gpio/Makefile                         |   1 +
>  .../{gpiolib-acpi.c => gpiolib-acpi-core.c}   | 344 +----------------
>  drivers/gpio/gpiolib-acpi-quirks.c            | 363 ++++++++++++++++++
>  drivers/gpio/gpiolib-acpi.h                   |  15 +
>  4 files changed, 392 insertions(+), 331 deletions(-)
>  rename drivers/gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c} (79%)
>  create mode 100644 drivers/gpio/gpiolib-acpi-quirks.c
> 

