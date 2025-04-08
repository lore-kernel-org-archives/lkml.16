Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B78264F9A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102235; cv=none; b=JXJC64J+qh+udx74v8kOqFNxwUJkQuOHnGikd7AEbUyXLJZw4qHOErP5Q54XWQ50Ex0hVRNf3k058lYBKLZi1hMpi+NGTG0vpoC+vi/2MgW3cGiNFcScWuiOgsV2KqCLKE0ETRjU6xkDJlpTtVIgLNTOI6aGy8wX3VOjbTTSaig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102235; c=relaxed/simple;
	bh=kxoU5HcQ+O7M8SUK0YQ8e6eKmlicd6hex/t7nCbWbt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZThmFdFurgzMHpgKpwnb1zbkHk2Smmul6rvGMGvDCeKkcQB887Voi98L/um36Vy2mR4UzIDiwY1h9PlYF8sL9tmZb7LQKttpdMu4KArMOUzn8psyvJX5WqllHVgIqQFfWsa9hTdTRuSFCg7neNg1x+jOc9cNGgmCOdDmQDstp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SAj8+9Ge; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SAj8+9Ge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744102232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQopZXdiy3xymCGR0rYIHwGprz+N88tu6wezwOaN3Nk=;
	b=SAj8+9GeeoPQ/W1Rsgp4cWptcU5cqmW5rOsPaoHdIatOhTQHgyl5L73XUBvafE/JvDNoO5
	4Pcp5z3qwdbLez/E1kSMWOi6wtqPTk3Lo/2nR3iOF0YwtyQd5OgDOmwbFT1ov8FACioTfF
	5y90dHcWE5gBNK2DYCimMBvI8fMr5os=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-8EnUCZMSPYKNxwJ27iXgeg-1; Tue, 08 Apr 2025 04:50:30 -0400
X-MC-Unique: 8EnUCZMSPYKNxwJ27iXgeg-1
X-Mimecast-MFC-AGG-ID: 8EnUCZMSPYKNxwJ27iXgeg_1744102229
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac710ace217so410621166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102229; x=1744707029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQopZXdiy3xymCGR0rYIHwGprz+N88tu6wezwOaN3Nk=;
        b=e80qeanpzqqROtzXLqPvGDM341xYpB9vTdD9nViA8kV3PbFU700kAwHCH+MjZyGY+q
         nmoagqmjxM2hK5JNpTBiWEpwHThy0fBuhWWdNQeLmDM612b4i9euT5o7mZP5EvgFrW2F
         KVNeyBbuAaKdYpkweSax4HtREqkiD1/CgbdyM27TRebf3sE3tdek1mo9BVCFWEwMfaY9
         Nw68vmHwGZrl+bAFu78rY2ltQuG3QV5qV2sAoYxaEWTrrCs5Aem86TnYBGDnLHnByeg6
         nc9VFaMrTlt4pqvQ13gP6ELOtHwvvjJt3NSEXdbMxp4poN2h5S1tzv+uH1R8WyYcuA+g
         Z/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW4L5I8Y50+mywXFStMrhh8IurQ+4wzFcpDh64O5P++2G52psZvTsfqtnM7g/1NQD+oknFsyJf0bi3IoQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PfjLtZiVB62s6+UrYNJYQFMh4FHvBiV3TUcTFJI7sLzMl422
	JTen4xbjRScDO0svV1nKExgdm914J/3h7qkN2covlTGhp7UyHUrQrCCAZWQdi00OGChHlufvwQB
	TKeRAiHAZyGFHOrxuI5gchRyzRkiuGbJtpG8IofuuUTsE1cZeB7sWQ1OoY93T1g==
X-Gm-Gg: ASbGncs43kxAj/v+/UldcX7iYppKgVLJJQKW+1VxhDNkigbZf6sM41utFr4DBKUJ3UD
	EYNOzFBxJNdS4HX2BYugLl0XX6TEtaDT/8U1Ma8wuVb7gWPyHJQA42YUg4kjzM2IDzl+iut8A4c
	/SWp20xbsXK85Nu3cw3HbUqPvFio6iPe/TVHbEEoFFmvcfl4RnYIINnti5er2pkcvCSc8Oa6qh/
	M90+MYHzFFHxx0ByEe3zcozLccSBz5sNfVF3nPBkwP0pXnQqXkQCqpyDrcVhUHkbISPMqEIvwfq
	QV0xiwtJn3MZQAET8SCSsjqEs5f5ul2HF7mjOrKdHLv6jk1VOJ43sSlggdqfCmWNlM2wt+CqfRF
	UtOFp407dZpjTSo/v9/AzlIzAwSPs0t2eKP8+UunWsi56Pl2EyA3Ei4SNBTA85FPDWQ==
X-Received: by 2002:a17:907:1b11:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac7d6eb8de1mr1531978866b.43.1744102228792;
        Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpsTVCILDyaXBZ5lkeFvik1nQEDh5z5n5qIxRWyhWTeQPllYWoHbltidBzTa2yJlwiabVPwA==
X-Received: by 2002:a17:907:1b11:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac7d6eb8de1mr1531976466b.43.1744102228388;
        Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe99b30sm882797566b.58.2025.04.08.01.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:50:27 -0700 (PDT)
Message-ID: <56826617-5e91-418f-869a-bdd24bca0f0c@redhat.com>
Date: Tue, 8 Apr 2025 10:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86: convert GPIO chips to using new value
 setters
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 8-Apr-25 9:19 AM, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the x86 platform GPIO controllers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> ---
> Bartosz Golaszewski (3):
>       platform/x86: barco-p50: use new GPIO line value setter callbacks
>       platform/x86: int0002: use new GPIO line value setter callbacks
>       platform/x86: silicom: use new GPIO line value setter callbacks
> 
>  drivers/platform/x86/barco-p50-gpio.c      | 10 +++++++---
>  drivers/platform/x86/intel/int0002_vgpio.c |  7 ++++---
>  drivers/platform/x86/silicom-platform.c    | 11 ++++++-----
>  3 files changed, 17 insertions(+), 11 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250401-gpiochip-set-rv-platform-x86-86788597f4a4
> 
> Best regards,

