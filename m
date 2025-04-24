Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C54EB51
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501586; cv=none; b=dMz1kH3hRPdC+SToNES8oLN2pHhOF2ibRi1AM1rQnroJCHjVSrPs9KSR2GpRLUn4/UfdZIpfNx2HToRKt8rbGsVh9JFUdeXiylOQ0yxhNhbSQeu6bjuaev29O74pmDHXbQ9HttD4c5kZF8SDCqtV5FkON/tsduaDXHFOzRDl4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501586; c=relaxed/simple;
	bh=LA71N4HpdA00DNR3cy7tmy8RIrWXurxFp5u3exa3E/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfzKmeR4ySwQohE6vJ8A1kcMK7HooMUNktOJZbzQwn4XudIdeUdvcbH8Yo/sKak/SOgFEDy+5/rsbY9NisJDu6aT3eiiI6UE5p9Ol6rxTeEU7jH0/B3oIBIMlCrrjXyf7JL3sVbG75EEWUwmuzllmUmL0t+mRGQsFn8FDjc03Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KanNq0A8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KanNq0A8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so62585f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745501583; x=1746106383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J9gmDV0y2h0g/i+6lcT/qGWaJ83HIs21XudkCX81jd0=;
        b=KanNq0A8jbDAnS15tdcLA6QBfa66uZSp0PJRWVFIsVv7UKJ0yBT9LwhSZ7PnJweGqr
         LflZX4TFVVeOeU3PpQ0KBBKIfa3+KLovFj/JftQbM9mKZxjo7Je9v4/8KsCjSgxAJ+n/
         mltQ+FEd34T2sR5E36kTvgY6X+ZykoVjmXA30MoLtSViOumTShpuAwK20GbDEvNX7DsP
         BVktEs8lgRxLG5E9V8HDphBVja/p31pm8o6JC0jaz8GPTm3qe8tJiQvurUyPaMdvv/dn
         2D7ywqe3SF1lU4FGjphqLDhSq3D/JYY4DUNmCd/U9mULUAhS3nCoAiQDJg1Zo/dO3Mkx
         wRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501583; x=1746106383;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9gmDV0y2h0g/i+6lcT/qGWaJ83HIs21XudkCX81jd0=;
        b=uLNQKYNJjD2hsd23gsGycLkgYSxQ64rx0UMpvPnrKD2OA5BuDvOAFOrephQKifCiIT
         A1ZiDz4b1LCicGCfI0lB6DMtPvmmlmJNrrv20urgo3yfTsi1xpgAkmkemD20waTlthRr
         cXgQY9D8dnPLZaFl+HUPnlbhIJqvLoSzOLpgoW51b6sbLvD8NmBGR0swWJPAXEu+vVMv
         248L/NE48lsllws0Vl/Hjci0rMCKRC8NR+WqCMlfTT3e1RDfjRc1XbJqAjb1UACugHwO
         XHWiv4DnwuBivM6R+AZ3LTJI0LNFYokL2CcHtTzF+q3Pt7wcrQiAVWTDeVlBPqi2jWPJ
         +51w==
X-Gm-Message-State: AOJu0Yy/C9ZT8GnIh9sCKLOV1D4GYFvsW0CS0dsIDWzxoWBXBnDU26zb
	QMVMD0iENL02sCssJHLcW+vgQKJ3ApIKO0kP8x/UDVqv6E4p1CeQy34pV9UTx5s=
X-Gm-Gg: ASbGnctyv1cboh6RLSazyhCf5gTTrY2lPqP+Lbh0iIQLbWBaJ8Fx9v5Eb/lkdvTb6zn
	cGi+aKXCRO4MS5BzEXRrsYau9hbL1onS86RA4nKkkiEzVd4zt+N8jqnIZGwKiG6Oni3XjuwpZCR
	+9vyAV81cdoCxVacxhrWmI1Fzuw25rPYO8R+boJsjQHv6ppoRZStA3Q5HR0UuHrUyytwbqNb80e
	lWN3k9VWZ5+ggVwF88bCbTCFG/6L6WHc9IyltcCqQ5WiF8U4uVPP6FHQXMQzR2wRCuUb6sl2QF9
	JaOJQHGF0BuvUfOvXpoY3Kr8ExpUZmkE+ZKP9coWiVNihflmC/sqwK6wJaM=
X-Google-Smtp-Source: AGHT+IG0F+WyM8H8kGAtLPCGpVrGhPxx/uXDhXoGzURhM010jbFr27mm3hrZu/CkzuG2i7A6hA5FMw==
X-Received: by 2002:a05:6000:178c:b0:38f:20b5:2c80 with SMTP id ffacd0b85a97d-3a06cf5f097mr901401f8f.6.1745501582826;
        Thu, 24 Apr 2025 06:33:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29c0c9sm22755305e9.5.2025.04.24.06.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:33:02 -0700 (PDT)
Message-ID: <1a05e237-4ee1-4e36-a6e8-9efb5d9739fd@linaro.org>
Date: Thu, 24 Apr 2025 15:33:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add the System Timer Module for the NXP S32
 architecture
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250417151623.121109-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 17:16, Daniel Lezcano wrote:
> These couple of changes bring the System Timer Module - STM which is
> part of the NXP S32 architecture.
> 
> The timer module has one counter and four comparators, an interrupt
> line when one of the comparator matches the counter. That means the
> interrupt is shared across the comparator.
> 
> The number of STM is equal to the number of core available on the
> system. For the s32g2 variant, there are three Cortex-M3 and four
> Cortex-A53, consequently there are seven STM modules dedicated to
> those.
> 
> In addition, there is a STM variant which is read-only, so the counter
> can not be set because it is tied to another STM module dedicated to
> timestamp. These special STM modules are apart and will be handled
> differently as they can not be used as a clockevent. They are not part
> of these changes.
> 
> The choice is to have one STM instance, aka one STM description in the
> device tree, which initialize a clocksource and a clockevent per
> CPU. The latter is assigned to a CPU given the order of their
> description. First is CPU0, second is CPU1, etc ...
> 
> Changelog:
> 
>  - v5
>    - Fixed typos in the comments (Ghennadi Procopciuc)
>    - Added clocks bindings for the module and the register (Ghennadi Procopciuc)
>    - Fixed help in the Kconfig option (Ghennadi Procopciuc)
>    - Changed max_ticks to ULONG_MAX when registering the clockevent
>    - Removed Reviewed-by tag from Krzysztof Kozlowski as the binding changed
Unimportant changes do not justify dropping people's review.

Best regards,
Krzysztof
