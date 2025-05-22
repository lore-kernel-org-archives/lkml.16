Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E928D838
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925853; cv=none; b=JrIyCxdteGHqdpQItbez4AwDQ5YImuoACwejAz4xz4Bg1GzmOiFQR4f8Ce/uKAH3ye/ztk5QDgU6diNqc2zTu9IPg2wgxQpPItFj1IDXZSdfUFOmRx5IMFIxOktD+VAhsD7EZxrcOUM0SWl4QaZo5P/AKAMDamZKeA4eYqmJ4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925853; c=relaxed/simple;
	bh=x84Jv7lQMIOw1R3qsq+oOaAa+7Pp/x2Vq0hlZPSj9TY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A38tgHQFmwV+8j5Opyyf+yDDEqYDx6epXQcJx/jD9tSRYrOZAs6usuAbMUqG2jfTOw/0gzRSvwCi4Gs8CXISAfIiTLkoWRNU6Ce1cRtMue8NzL/wB+z0anKkFh4VmMsL1mxnqw0TNqd+p15sNARrBEg/GQf9GvqWctRU7SlhD4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crNk2Wjo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crNk2Wjo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74068f95d9fso7133932b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747925851; x=1748530651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+s5922QNFxHhwB+9M0M0SMe23D26Zax/vzJ20NnmTQ=;
        b=crNk2Wjo+hg2ZoJyOu7vTIS0fdxFlRrQ1IJ5cU7M1taINr9L0RTjzWMftYuFIfXLcT
         5n+xx1d5fIQBMEfNgheruEjVgJc3ZA0iVg1ZODwB0Waw8ehOWfZQbRJvs1cB73UfwQIv
         XcyjR4Kl4po4PhlO6XZEXd41kSLaB3eUwiY5oGHRn1XxDPOHH2LDXsbrfmS8qKq6hyGV
         rdk99HVW7K/8GF8CXosgp9qRG5965HWDyMzQ2d9ffxZhjoaGzf+hmwYMOlardRF8dVQl
         x8mJOPi9CwHySojmWSjjA9vhWqV73A6Mrj4IWxMn6DCRLs6fp07I29/FegcRDHet197+
         ohUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925851; x=1748530651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+s5922QNFxHhwB+9M0M0SMe23D26Zax/vzJ20NnmTQ=;
        b=xTv1jTBK1xjC1uMAUsyHa5j7HwF4g3xSVk6VPdc2YWs8kxm+QBF0p60gbv/CbHbl/c
         pAw4VSz2/lXCSgJzY5A9V+0CnRcObfxxAs8D4vV3vUbrELSVNKlwfnDeSGhRaM4uCrRc
         AtBvxCuUz2SfuAlUf0rOPnBRBvinI3J8iRAZwHniOY6yU1z8HOWxtaoe7qEYMbb0MFXQ
         aU854jDgbzVvAVNRmaAb127LQ1oN2Lj4E2zb+EbMQ4jzDsFeKhBCCWyGAbzgo0mNFd3Q
         1ZkHcqPMZh4pP6c0HXzVouMJB/Jc95NObklVSGLq1As1l4efR2PuZp75zQHRON14eZJy
         HNRA==
X-Gm-Message-State: AOJu0Yx0JOg37DqGlrzhgnpc2A5hNuX0q4HuM8FK/tSzNFRKwquqNi3S
	nM5iI8oJE1QesYfQGhoJ63CtDM816Y4kXhvnARSxtTefbC0jp9stwZhs2vwjTg==
X-Gm-Gg: ASbGncu8SZE34lZqxd03EbWEr9N1p+KcGFx4QeC1Mdd24wRgqPUEQugalv5f7Ycc409
	5mnHc5fuGrfN8F73Nb0qlbifzpVHbRlDfypDwhnEvSWDu9B4kN8yoRiaff0pnqXmPEUAvJpzHxE
	uvd3TvHX1ymNAOXj2l4XWwUK1MPdPnKjV6/1R7rAyCIKRkzZS+6XGghvbh/nkkGbaSvdH8dPu2h
	tki/R8F31eoRK5+Vld9TwkCzT8b+2fJgLgVpZ/zG7/QRe27C6nNfHFDpzi0q7AwYVK0vLFuE8VA
	5MlqoE9MyeRGdDah3qx1qrIY/1d8KQtVxt8uw2huVJcGJ4TSxfEhZGbHIxwo4AmIpi+n9n5cA03
	4XTymUxfc
X-Google-Smtp-Source: AGHT+IFK2YPRWz07OH8DUrztEUg8Ad2S3iLjo3B1kKh2kMU0GV2Qh/c/7clUgSRBynbH7jZKtZ3nwg==
X-Received: by 2002:a05:6a21:695:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-2170cb07de7mr32530144637.5.1747925850808;
        Thu, 22 May 2025 07:57:30 -0700 (PDT)
Received: from localhost.localdomain ([221.239.193.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a9893sm11477407a12.72.2025.05.22.07.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:57:30 -0700 (PDT)
From: stephen.eta.zhou@gmail.com
To: daniel.lezcano@linaro.org
Cc: linux-kernel@vger.kernel.org,
	stephen.eta.zhou@gmail.com,
	tglx@linutronix.de
Subject: Re: [PATCH v3] clocksource: timer-sp804: Fix read_current_timer() issue when clock source is not registered
Date: Thu, 22 May 2025 22:57:25 +0800
Message-Id: <20250522145725.4014136-1-stephen.eta.zhou@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aBsVsZu50MMJkI0q@mai.linaro.org>
References: <aBsVsZu50MMJkI0q@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

On Wed, May 7, 2025 at 10:11:29AM +0200, Daniel Lezcano:
> #ifdef CONFIG_ARM
> static struct delay_timer delay;
> static unsigned long sp804_read_delay_timer_read(void)
> {
>         return sp804_read();
> }
> 
> static void sp804_register_delay_timer(int freq)
> {
>         delay.freq = freq;
>         delay.read_current_timer = sp804_read_delay_timer_read;
>         register_current_timer_delay(&delay);
> }
> #else
> static inline void sp804_register_delay_timer(int freq) {}
> #endif

Thank you for taking the time to help me improve this patch.

>>  static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
>>                                                         const char *name,
>>                                                         struct clk *clk,
>> @@ -114,6 +127,10 @@ static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
>>        if (rate < 0)
>>                return -EINVAL;
>> 
>> +#ifdef CONFIG_ARM
>> +     delay.freq = rate;
>> +#endif
> 
> drop the above
> 
>         sp804_register_delay_timer(rate);
>>        clkevt = sp804_clkevt_get(base);
>> 
>>        writel(0, clkevt->ctrl);
>> @@ -318,6 +335,12 @@ static int __init sp804_of_init(struct device_node *np, struct sp804_timer *time
>>                if (ret)
>>                        goto err;
>>        }
>> +
>> +#ifdef CONFIG_ARM
>> +     delay.read_current_timer = sp804_read_delay_timer_read;
>> +     register_current_timer_delay(&delay);
>> +#endif
>> +
> 
> drop the above

Thanks for your feedback.

I'll make the changes accordingly and send out v4 soon.

Best regards,
Stephen
