Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8B3074AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881502; cv=none; b=g8BA3+rzzo5byLenjkeo9cKzIdu1A6mxnecsv3FrihuvSMNnZVFLZIqWhXxGc4TzPT9LrxnACcAwYGOkTJBP8VDGyQ6pZq1rL1wwPx7CCAgPt8jdcmiKJzDsPpt8tFdLG3ra0Jn51cMcXYKUWwDea9j1cFUWf+wgVfgQhO/2yHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881502; c=relaxed/simple;
	bh=jYdbV9uJKg9r5WhRRWvW9I/FwGWEpAF/XtKPHUY6snI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X7gntfJLvWzBERcrSbSlSS2lBuii1I4fvPxNfkpRb3hjVtI6Ufe6P/dlJPk5R76pkA1mNM2Qkr7Z41ieritAwfnuvxawMngYmZ7O2v7RpONIfjKQyFD6Xi64a6Fs9v9uNc6FgJ73r+I05qPD1oAcDFl/jD0fE0IENE5iNOJy1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YWfIcgN/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YWfIcgN/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so226390a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750881499; x=1751486299; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMnkO7vTBq6DOiNYMMqPpHcpyVr2YOVm4AgOmDBWMV4=;
        b=YWfIcgN//dx17IHIeKmeg+ObixgDbo1plgMppuv2NhuSO9wbcdKtsLgSBMrC4rYm+x
         cp8r2rQx8NwgNfkRr1W7g5KPjlv2BmeyGwmdhbPg3UDxEG4U7ue217jzf1OduFlM/9cJ
         TKjizmoyCLOqKmGHMf5RsiLmWWsrfzGajmA7tUGQgVoELDvHZmJxIhIYo0Lz2q1rvDnJ
         BlBX3l95Zckh2S0N2+ecey32llwkxQClYW7Do/j3w2mibMsHWk4U8FgUEDqQD8lAf+Cb
         Bjw45yi9n8aG8TIB7J/eQbY5AsTTO0RcVAUWA/xabSvAfjNL/6RwSMue06C0FqWA2D/H
         V9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750881499; x=1751486299;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMnkO7vTBq6DOiNYMMqPpHcpyVr2YOVm4AgOmDBWMV4=;
        b=FvzIWSVvSvdBlku5rI5+RWRRXW6S3IoDaxwP3FohbFFdE2tSFVtr4UbLyoCZxmNh4C
         IOIOzjgLTHVG1yWfM/2mRz8Zdf64F55rFMNcSLA4oNfn9IpIgPop6TW0RbHYn8LKAv8w
         jB8UiISMemRK5FC8Qm6Zk2e7llo4YnYpCF4baaUXvAwkQN5ox7fl5zvINIyFYNh0fP7G
         3q0mvZHVL/gCIN1U7m10diRoVAFO+v9iLEHR+oVe5h8HMh8Is5rinBkyeow20waqYPeV
         JHCP9CbEbxaPtYy62Rs7UZ+ufPklBRvrXsGVbpJu9psD1hDQZCrya5DVuDpL1f4oqnxT
         Bw4A==
X-Forwarded-Encrypted: i=1; AJvYcCUizOCtGPXSDW2iVuR3WeCUxN7EJUpYqG7UwIfFnYViBdJikKtaX/PiOvi3aLF/CJTYNHZFlYEi4R17mtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNhem1WPvu2CBT5ovXBp82tNQ5Opadm6CnF8et2UHfTHTOOZC9
	kzJjPLNu2FeXARmB4i61IXWSEJBPzb+eV5QpmUcgveZnEQh9QHG5IGuHR5cRF6iyMnA=
X-Gm-Gg: ASbGncskl9zyuziR1H4jKSIi5CVd8ElA5TwEq3gmqYuGNUCsFvOrixLF2q6S6VaSXy5
	obb5poXWqYdsD4ucTH+kfhrFt1PAM34hVW2qa2cEXNYsj28zkuZDhXaaOuOjEEUzgCZAkB75JKS
	Wre0HsDwPdevQ8h47JfahogCyrUUkeNR/0YwIhsZa/GY9D1+L7jbJc4TMXKm5rrkwDky+REbt7I
	raE9DHyGyplQtb6tS0Kxud4TiKSlI5xo1CwINhh7KdhNqNpAqnaZae/5ST/KntDI52r87dUv4cD
	7a9WF1R2EEVI0qlPgOp1jnNKE1yFsEHAvxuAk2qMt5x/Dqbbpm1r70ngQLgX
X-Google-Smtp-Source: AGHT+IFPgzkSNtxRIvlxI1Dhp/8ZEptJJx6uBJZquOlS0M/VtshKBl9326CDMd+XLQ/6Q21tUVxYvw==
X-Received: by 2002:a17:90b:1fce:b0:313:f6fa:5bb3 with SMTP id 98e67ed59e1d1-315f268a4cemr5008172a91.26.1750881498553;
        Wed, 25 Jun 2025 12:58:18 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53f2483sm2517997a91.47.2025.06.25.12.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 12:58:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Vishal Mahaveer <vishalm@ti.com>, Dhruva Gole <d-gole@ti.com>, Sebin
 Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>,
 Akashdeep Kaur <a-kaur@ti.com>, linux-kernel@vger.kernel.org, Markus
 Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix property name
 in comment
In-Reply-To: <20250623-topic-ti-dm-clkevt-v6-16-v1-1-b00086761ee1@baylibre.com>
References: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
 <20250623-topic-ti-dm-clkevt-v6-16-v1-1-b00086761ee1@baylibre.com>
Date: Wed, 25 Jun 2025 12:58:17 -0700
Message-ID: <7hqzz7oap2.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Markus Schneider-Pargmann <msp@baylibre.com> writes:

> ti,always-on property doesn't exist. ti,timer-alwon is meant here. Fix
> this minor bug in the comment.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clocksource/timer-ti-dm-systimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> index 985a6d08512b42f499b3e243eb69cc9674bc8e53..fb0a3cc23b5a35e2906a253d36ccef2baccca50a 100644
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -226,7 +226,7 @@ static bool __init dmtimer_is_preferred(struct device_node *np)
>   * Some omap3 boards with unreliable oscillator must not use the counter_32k
>   * or dmtimer1 with 32 KiHz source. Additionally, the boards with unreliable
>   * oscillator should really set counter_32k as disabled, and delete dmtimer1
> - * ti,always-on property, but let's not count on it. For these quirky cases,
> + * ti,timer-alwon property, but let's not count on it. For these quirky cases,
>   * we prefer using the always-on secure dmtimer12 with the internal 32 KiHz
>   * clock as the clocksource, and any available dmtimer as clockevent.
>   *
>
> -- 
> 2.49.0
