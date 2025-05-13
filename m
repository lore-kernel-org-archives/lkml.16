Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA0291166
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143631; cv=none; b=e9r9iBeBGq1ai0iWjyhPC1i5fKkbF0n8aiTqvtbrzomDFOK7xUuyrYCeXxZq3PwJvvyJQCJc1BqloXQoWqVBlt/3VJ0klLIE5/HFxic4LSHHJX3vl8qRcYxqHp5hsdrPPVscFO4X76n6HNT5Ed5QSCq2A5xTk59FOOouCY7x9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143631; c=relaxed/simple;
	bh=BGaQ93izMEe02Cti68Vyan303ZMORdMe2po+7g1Hqbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuaKA9rIaVhxSEy8EU0zmGsUjUgg/RP2PJ8+mDiY9KgrnGpoUBr/e2iZF9STZDgZaFA8rkbrrM6JhqXbI4NgffSA7W9aYiG0Ut2U6Tziipw0W5nBK5mG+ASviqi+mgc1tkocFJGtQmPFNhgGWYwVFVHUBxqR55jpa/OdQATMf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=th3RCQuY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="th3RCQuY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so32620785e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143628; x=1747748428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xEU9Mo6/UKsuuLc31/10/BvFN8LdhjlBi5jmqi672+k=;
        b=th3RCQuY7ZtXYMOkZX71S5H7omzWwsaWnSG6C4IgAt1C2gXQsO/k6Sxr2tqYWMdLas
         xHDlGaddzadiZoZQkyYkHJIHBT+G7Wx3J+yhuPeEUB1FRX98GM3RrW9vOf4CRtzp9T/B
         t4jU1nDM8AKs45Oxh83eNegOzC2tAyGT5IliFXhkj4RVC2SLrYIFVyke2m2ski1b6LNM
         gMbT9F81ycWWPMaHIP/xcWuQKWSwjRqrDNuk24LE3Eu/OVzs2B1OHVGZvsZGrilHCWVz
         ySHiDYGJRTJZ4K0euz6+wGv+2en88cFhxCbXkZX6A0AxRiaI25prJCUFp2EIfyW5KBb1
         v2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143628; x=1747748428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEU9Mo6/UKsuuLc31/10/BvFN8LdhjlBi5jmqi672+k=;
        b=fnPsb8SmBJqatXbVeAAH6ELTe4lbBJM9bydqEjyvt3gz2+ho4v99K5kDClYcS+hQkj
         1Wuqn30E5sz5h7ZnC39Nv9FyO4xQ3+eiwEqtKbmFNaZKjIZMdbJSZa1/nWlUKjNl8w2b
         WORSUQUloQhY/1ZwB9VqmaQ7r/NjcII/7d0JpkY7LWXXN7IfoEWe7BazXjPHcZ4OBzeo
         LZ0ruUyr071qMHqlQOP+t8IFfiJp/ZC9GHyGyHMtz3FbCjrwUhFtKyj8AI4rwmgYUbt1
         6eTzxPtvx+6cQCy4ovqke48p+ppbQRa7PLEXaZtt8tW7Wfuks7OzG9WDu7Ete0euoZqi
         BFDg==
X-Forwarded-Encrypted: i=1; AJvYcCXKp7/i7mNJKTwXejMruBpc7irsPXhcKJXOh+2XN1Z0n+hGm1iUYjoCVnGLHC2lHQ3ew9Syn33aGsXWHk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuUTyJYDdBXqFxOmIGISEqUutWuJ+bwxsvap4gVrYUEeCthFb
	kUDS/Uiv+TDprkG3Uf/WFQnB9a3SVPmRawX14FoE8vpD3bfNm34pwwZd2xs8Pb0=
X-Gm-Gg: ASbGncte7jZPI+AEKUN2v1wrEkPpI0hDQItkc3vjpE2J3yHQMRJSVGwXvYxbH+zM/KV
	P1bZvEUdncVErdoE54+yVvxmdhcMg2fjr9eh76eFIrpznST9/DLGe7S9LjuiL5PgXvb3p+IP9J2
	Gy2rEMzgbdL8cNLcSbFkFxSy5NpqD17Goh05QdX0wAXUXXQ0PMDONyzzQzRLXbs4CDyhO1xBIF5
	05jNZcsfni4We+49FJ0jGOcVOeL32bKYSpKjQtIvSB4VTyOt8M9r3YBnwdn1M9EPm+nEI8OC3Yg
	beFHkH6sd/4BCKVwzuYccVbCttSlQFqgfwQ2UCLYXAI99TRRLmvec+h6t1ZXbwsGdgTdKH+GkFo
	XL4lNDLmAUv7WUw==
X-Google-Smtp-Source: AGHT+IEfBwQJXAJ0BaJ2PDlgayikP86FW2WlI8LpQoXcFz5Q+W2Tz3IsJRQQT5R4meXuclvg4ooRLQ==
X-Received: by 2002:a05:600c:b85:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-442d6ddd22emr128512155e9.33.1747143628084;
        Tue, 13 May 2025 06:40:28 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dd5sm209294255e9.35.2025.05.13.06.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:40:27 -0700 (PDT)
Date: Tue, 13 May 2025 15:40:25 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clocksource/drivers/timer-vt8500: Add watchdog
 functionality
Message-ID: <aCNLyYtxmqqklBN8@mai.linaro.org>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
 <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com>

On Wed, May 07, 2025 at 10:58:32AM +0400, Alexey Charkov wrote:
> VIA/WonderMedia system timer IP can generate a watchdog reset when its
> clocksource counter matches the value in the match register 0 and
> watchdog function is enabled. For this to work, obvously the clock event
> device must use a different match register (1~3) and respective interrupt.
> 
> Check if at least two interrupts are provided by the device tree, then use
> match register 1 for system clock events and match register 0 for watchdog
> respectively.

This code falls under the watchdog umbrella not in the clocksource. It
is better to find a way to make the timer and the watchdog separated.

The timer-gxp.c is dynamically allocating a watchdog platform device
with the shared pointer to the timer counter. IMO, it is a good
example to split this up.

> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  drivers/clocksource/Kconfig        | 11 +++++++
>  drivers/clocksource/timer-vt8500.c | 61 ++++++++++++++++++++++++++++++++++----
>  2 files changed, 67 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c8525996724fbf9c6e9726dabb478d86513b9..8f5e41ff23386d9ecb46b38603dae485db71cfc7 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -181,6 +181,17 @@ config VT8500_TIMER
>  	help
>  	  Enables support for the VT8500 driver.
>  
> +config VT8500_TIMER_WATCHDOG
> +	bool "Enable VT8500 watchdog functionality"
> +	depends on VT8500_TIMER
> +	depends on WATCHDOG && WATCHDOG_CORE=y

if WATCHDOG_CORE=y then WATCHDOG=y because the first one can be
enabled only if the second one is enabled.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
