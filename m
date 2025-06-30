Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF8217F29;
	Mon, 30 Jun 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279586; cv=none; b=eav9iZVcmUqvzJYPeq20mVnnvuApijEuLA9Wo1TszWLTVidf3r2tC9MiqSSGWN2e7bRhG7V7LnNBCo/wxNHVmUaHBPJFRutewuSIqgkza+WKTXYRdAQGzrQdSddEg64ymX93w81bf35AtSFM6aSeC3zNEi1CmqlUlHePQodTWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279586; c=relaxed/simple;
	bh=bhAx4bbqx+UD3ZbMy33jZb4BKWq+b4drZDZZ5h6FzHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHhaKLyeo7ySiHeUhbgU7GWLM8S+NKRZNq5S0iJgyZl6M0vy3hru4o11/Wee1A5/3s3c0jkfeWuEuXKIWXgh/KcLCklwiPMim6WYC85n6tYijv/c616PGLi/CL3O/kjomEzL3uCV2+zoOyHkdQb/5ALQDoZ7YIbQgTUYMLk1n0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOtpJCct; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOtpJCct"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55516abe02cso1459199e87.0;
        Mon, 30 Jun 2025 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751279583; x=1751884383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzWyRCaaXmVUVP1REDok2Q7RPDXULmMHqoi09b7dW6Q=;
        b=OOtpJCctvpxHSjQ85QZKtqFjz4yacCT3c5fbtLR8lJHl0Qzxjv52HRtP0fdvk8Dc6M
         HsjxUEcsPqmNZdKZeHzfK0yQNSINW1QOupzErhF49VwyHIvGw+hwj2fKpabcVKy3GPgM
         g4ABx9KY2ImXydRAvIMJhm8UTrvJROlOzdBhhKnOQpk6bL5smqN4NHmA4x3OQ4FcMoY4
         hEOKB2Mg4uamouOvxYDcx/S9e7S037Fv2sNJCRVmbTZJ05sKkAaSLkE+1C3BAj9UzjDF
         nXbib7HD70aMENS6AI89WDGunIJgzquSL1PO+ubS/xcawR8odQtbNl9/HJRw64JnwdDM
         gElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279583; x=1751884383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzWyRCaaXmVUVP1REDok2Q7RPDXULmMHqoi09b7dW6Q=;
        b=VghHhu/YKqOyOPGtz5q2lbLU661x+hdghhv9FvMXLAczqiFxyKDjPs9q7xTzZao/W0
         qaQ/i5mfpLhzhL40ztB+UrNEiqj7r+HDp5ICcaG3m/RREvEUGv1M6eAbSD1sLrSiypBV
         3tQtiJshl2R1hbFp2QwB3WHjVypFQYVSWZN0lNL/BXGAqsz6nVRFsUkI7ucvot95W7yT
         jP248PqZyE1KsBgdrsO8BRN+tkGOPre+3qUVVrusXHsYxUl08JurYBdiIY3cfrN1x+ZX
         gcHMkIaB6GfRHDmHFz7psXP05TxrZqpgvAcMePv1rdxd4q+88tGD1YgP3GqVS85mSTF0
         vCow==
X-Forwarded-Encrypted: i=1; AJvYcCU9X7NxJugY0Wm6MjGgd3tCPOBE70BLjdshDdLEzcG7DffaRU+LcilOcvA9iJPaNlhw+bCNLIQrqjRO@vger.kernel.org, AJvYcCUAD4QhyrVSYQLiGbuxQEK/b42B8OosMm0UNLSvIT54bRGuQ81QQCKgEo8VUTY5CEoSoGb2ORK8NdhUwis=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYkllzh62JL2AGXiXlFQCknTJ4eh5ChLuo1EeRjG9qlfuSPPbM
	4RJSVwxf/EY8FubjvI3xQwU5KUTFSlQ5TykRT82gEQ1xWpA3rAk+aGh1
X-Gm-Gg: ASbGnctFDFXIInwg5+Ky55HwPRDLC5vTwjKLenmyw6A57NSTRWOsdZBC3bHsD377Kek
	uUFoqh0+e2s7O8YrrU1Og1arBYFYHBxVPTUUFSKjWbxzUeL7yHfmvSDcvcUqXHFIxVK2NTjZE8e
	8a1kXQWsC5DEf8mrk7E0LGBd5dcTSm9+d/1VO5r73zbntWWgC3GHWJ4orCq1na0bH6ByUw+phPA
	oB7510qE9TZSJ9zaoD7IhD7BY8IXnmuYBHYsWvfQNATsNkllv/9SqtTqFB8DHKmS68bKwA/cBcU
	umkZ5zuk2djS6hK7FyvKVgXl7oEFFIvqJMGvii4dEt3iyHBG7D6+UBpIu74tv6ZEkgFYNQi8bQX
	hhpw=
X-Google-Smtp-Source: AGHT+IGi0sREbaGgFiuHHhb0KaMB3zds6tWfV2waxQl3oJk9b3xy0+WA524dxAXC/Tfc0YwXkpgrYA==
X-Received: by 2002:a05:6512:39cd:b0:552:21b9:8bae with SMTP id 2adb3069b0e04-55502c97b4cmr4847421e87.7.1751279582257;
        Mon, 30 Jun 2025 03:33:02 -0700 (PDT)
Received: from foxbook (adtq110.neoplus.adsl.tpnet.pl. [79.185.228.110])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d9b0asm1357367e87.214.2025.06.30.03.33.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jun 2025 03:33:01 -0700 (PDT)
Date: Mon, 30 Jun 2025 12:32:57 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: VladTop46 <mcsm2654@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] USB HID initialization delay (~8s) for Semitek
 keyboard on kernel 6.15.*
Message-ID: <20250630123257.3bcfa86b@foxbook>
In-Reply-To: <c5a8fdd3-fc35-4055-9d1e-7a5b4b50db91@gmail.com>
References: <c5a8fdd3-fc35-4055-9d1e-7a5b4b50db91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 00:09:31 +0900, VladTop46 wrote:
> Hi Jiri and Benjamin,
> 
> I'm reporting a regression in USB HID initialization timing for the 
> Skyloong GK104 Pro keyboard (detected as "Semitek Gaming Keyboard", USB 
> ID: 1ea7:0907), which I observed when upgrading from Linux kernel 6.14 
> to 6.15.
> 
> Summary:
> On kernel 6.15.2, the keyboard takes approximately 8 seconds longer to 
> become initialized and usable compared to 6.12.33-lts. The USB device is 
> discovered at the same time, but HID input registration is significantly 
> delayed. After that, the device functions normally.
> 
> Hardware:
> 
> - Device: Skyloong GK104 Pro (detected as "Semitek Gaming Keyboard", USB 
> ID: 1ea7:0907)
> - Motherboard: ASUS ROG STRIX B550-A GAMING
> - CPU: AMD Ryzen 9 5900X
> - Distro: Arch Linux

No progress on that? I think git-bisect is your best bet, then.

Is this by any chance unique to USB ports on AMD desktop motherboards?
Their chipsets are particularly slow to perform USB control transfers,
so that could be a factor.

Regards,
Michal
