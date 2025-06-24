Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B31AB6F1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752131; cv=none; b=T4nKSwyj/uQpKk1GNJ8UMl885klNQnUxIArHoDgSMv1osc64YORLXmbe1J1wQzqFj+iaYJW00ZHW/9p2nYQGkzvhP5lH9yN5piM5V1hOHvrm913hiNst9xbtgKGyFQe1j71yTu4a9qFbJ7p5BQU9UVH0VIFtMfCTsLeFflZrseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752131; c=relaxed/simple;
	bh=6RJ35Le43lWBAzVG4/jUlEyKbx+1PoEcme8RrymJVbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhuqTaRq1GBgpuo/n9X+ItndYdjL0WMsLxCmSZZWQp5vH37xwcCdqwQ5LRRHVNtzOzrVQ12+Hg6D1pas5JzCjNuV3kO7sZlY6Wpb86EYQPSYLcrPxfKj9eidUmTjfWLxGwroBrOLnfj8Vk0h540uHQtnfv+zuii/wGG1WM7bljc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FjtZ9j/g; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FjtZ9j/g"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade30256175so894003166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750752128; x=1751356928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFrQ1pMI4pxJoYVMvbXoXA6AuXo1ZRbUlGABw1ebDAQ=;
        b=FjtZ9j/gJmuoimsIpJ05k5xEkNDfCoDGapX3l4j+Jdq9LpQ4pvjf0Z4Mo6WfeF3Fhu
         XLTsenPkQ42iUb33GxaswOuFn5ybQXr8qIZdcOuzrB8Jz7mM8Rg4vgoNG81syg09LGD7
         HFANUtMQO9MGy6b7XubBajJNnRG9U6CJel2tVB3kuao/4K/wzwHPnj1l30QlzXMrO+ei
         TXhuFJuMtE0ern+xFp1vVZWj/eu5XUSay/NgPB9gfd18OJX/KYM277jvuaPf6nkdxf7h
         E+elcmLs4/BlZfp+371mxjthjxXlTtTlo408Lq3WeQ81Gqq5zF7OYnuxMMXDGnzBiMtW
         ewBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752128; x=1751356928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFrQ1pMI4pxJoYVMvbXoXA6AuXo1ZRbUlGABw1ebDAQ=;
        b=nKA3Xvv0n9r9fYa2ZscweTK0h3KKyPX87r+mVoAz5FABGM6XFy/IzY7pyVTNR2sLi7
         sYKZRqK//S+ct7XzKg35WFKYZ1EBy1k/EdXmOmjbT0/xYbyF7/8FL9yrDVVr1xvVhaEX
         ZSpDjfX60pVUv5QH2gb/WrwmVxBQR82WlDarzfJz+pSiGIa0obPNy1NH+LpMFa2YqoFz
         jhmqbTN6saaWe19qqLe5ACPI6ufhw6suwu1/EBBgn8v5EVKx9mFQqdexFWwR2gt++7YA
         HvoHT7StvW6pTp6zjIZ9XrYwVwEUNAp5HRwBybsUX/KcmdaIDQrI6ejuZsZtuvs3yscA
         dUPw==
X-Forwarded-Encrypted: i=1; AJvYcCU8fZ0+16H7W74FbEY5hHoJr27ruguAzCFWRe80UWoTu7DRdCs6igiRXs/RUEzn/bfcMVqhMVTjDPM0qAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXsqIp9OSrz6vhi2zOwRm3jn7iHarHUru0YLDpIIGGoBzv/Zur
	seB9uXVaNjHCLRSlsB8Ndatv98F8a6KN8rPk9dtluC3TDD2ZPqM68xug+OgOI5v7Yh4=
X-Gm-Gg: ASbGncsxfHGWXF0X96VSIGPcIcRcxp7s9y8CCFa1+uzX0djuTDGqMzO8lCTngy7MCmT
	4TIHqqR2GKWSFaKFFvXEjyEwAP1mIq2JEw9M3o25muyhziCaTLBFglNxfxgEKUcbJXFaQr6SN8y
	kQOyTe5dzgC6y4QtSPJd93xIsbFVkbCTJ80i4I4jmED/UonrWIN3ewQrR7m1eQ9GtjvdRQnZC2C
	4ATOEQ8+4cP3pAMhrUsPiHaERKkufGqaU5KdmrEVpNCiYRFgx05NACoLHIWJV3qUTr0aukbrKGN
	0CedhGBtZ7IhvB8xr6Xp0l0ramuyKx/vucpOV1NAH3aK5ENRHv9/j1eM9OuoJA/yHfFNK07pwYE
	rAp4gtXtBcbBJrFg1CKiNZrSmH783
X-Google-Smtp-Source: AGHT+IEdr+PvVsdvmAzpLHvmFL07SmrEujVejrlyKeJmYOHXna0duMtEQ8+NC1MXRgl8ZmvM7PXCkg==
X-Received: by 2002:a17:906:794d:b0:adb:e08:5e77 with SMTP id a640c23a62f3a-ae0579c3084mr1501065066b.20.1750752127797;
        Tue, 24 Jun 2025 01:02:07 -0700 (PDT)
Received: from ?IPV6:2001:a61:137e:6d01:d4a1:a0e5:eaa3:6f3b? ([2001:a61:137e:6d01:d4a1:a0e5:eaa3:6f3b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae086a98f6dsm398436666b.32.2025.06.24.01.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 01:02:07 -0700 (PDT)
Message-ID: <f2419bb9-2d81-4a6d-838d-b404e3ce7786@suse.com>
Date: Tue, 24 Jun 2025 10:02:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb_wwan : add locking around shared port data in two
 FIXME-marked places
To: Abinash Singh <abinashlalotra@gmail.com>, johan@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250620101747.39037-1-abinashsinghlalotra@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250620101747.39037-1-abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20.06.25 12:17, Abinash Singh wrote:
> Fix two locking-related FIXME comments by adding a mutex
>   to protect shared fields in `usb_wwan_port_private`.
> 
> - In `usb_wwan_dtr_rts()`, access to `rts_state`
> and `dtr_state` is now protected by `portdata->lock`.
> - In `usb_wwan_tiocmset()`, access to `rts_state`
>   and `dtr_state` is now also synchronized with the same mutex.
> 
> These changes prevent possible data races
> and inconsistent state updates when the port is written concurrently.

unfortunately this patch is rather problematic because

1. you never initialize the mutex
2. these values are read in usb_wwan_send_setup(), where you don't take the lock

Now, as usb_wwan_send_setup() is called right after you drop
the mutex, this patch is kind of inelegant.

	Sorry
		Oliver

