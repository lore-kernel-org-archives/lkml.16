Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0559E1A3BD7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464469; cv=none; b=LB761Jjy37YUcWP3m/czNB/kfWg0teRiqTuinabyDeihunv59Wy/7o1htqIYO3e4oKCd8O8G5DY9xMmDgjXJeHwuxQ05hJqHzt7Ig7enOUR4+lZhsLLmnjr14xpz4EXvQE7lGdTnQKriKsMSKX1UWRySuHHoyk2Irl125KAu2go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464469; c=relaxed/simple;
	bh=QHI4pERMKgnRMGVEKQXdrIlIz7Y7pXvElA6HvyzE4FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKJJAzUYTAoszZZfidPzm9vSb7SeBqOy6MknaITe7Lt2iKA391cq+PXeRxyy2zGrY2h9MpwXdfvJUXmWv59eYEckW3olgIceOHm7x/uu2Phvxne04z5y0EpuS9q6qYDUKHAZTqTpB7KyxPevPmUkoBqB7A94Y89dR2RY3HK/78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sIyHw6+N; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sIyHw6+N"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bef9b04adso49902531fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743464462; x=1744069262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=;
        b=sIyHw6+NzSnTAhkrHRImCWjxOKHlMdIHnOGgHDxVcIj4BSk4Sl/IiZUkeFZhSaGUoM
         oni3nhxS5xPIAYwc36X45LHyGl7eyZ4wGxH8aZ/U2tyaKVo5sYsrAOO7vdxFl5jaLjUj
         Q5/seRFylwoDLN65naw17Xb5g+RMBPTuNBPVYYNXyebqW7LIkGBJtdm3ovfTcdGkAGRr
         lfVOnLgWMtZiW1gyHsGQxurOmEU+3t0louqoSD/64ZC1CUMxsiRYfRvtIkMRs5W8QRH8
         1P45ECOI4LWdukixRKeIPNHfcPb+F2bmO7Otfxk/ioQXmUmbz4MEMBLoK4guZYMyHw8O
         C+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464462; x=1744069262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=;
        b=h0rptOz5YzCxMRwRo2ePqOwfODyM8Hm5k+/Tg/ragTO3QoRSR3oO8SvjqpqhPLYVfv
         J8Lx9MdxlPD90Ig8npf30SL+eyiiHQcRYoTej9h6Ak1LmwkD/utDx78IoPSLIGKmHrfA
         2ct9cW98ZJN/po2LqaRhDgA5yDnBxhDN070BlZAlLwNHHwb9UcoWc2auRAs0mLsJ/ELe
         rgg5pKfMG2UPiqtbeFQ3ZM454KyAjpc1/9spBi9v8mus+i0icRWea08oEdSQddqwW0lc
         ++ETy2lOONtRyEKBYBbmqyAD9b+2vjGNElihqNNx6NMgCErxz9qUIpgmWEI81MwxqfWn
         uGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTewH6okG/Tm+VZUImZ2kEf7WeAZkTVO4PdHxXNs43ETfWobDyIobRCFaHkdDOOMMQD5GJqo142evH5S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYoODo8EbD81IcbnSiOEVt8rnAjeIr5/CAK7tPI6XpT+bE2LDj
	cT0LWZZ2qj0I6kgWYWcEOsKyVypCjzdGR+UTjBXsP1ooP9C0VZAIXhZ3Xw87u9CQUkYpfwRQWlE
	oQiml+KO8TiL0NZrrurX9HZ1mOwg8Sblick8=
X-Gm-Gg: ASbGncsbhOGyV57pU3aY2ZV0isR82v5ErQOl3sJdDoN/4bQ0hvdzLWPM3VwTHaDI0mp
	4vsYPIZMBxkMFlf+YKJ8YD4m9RlCF/4f0ThyhTyMtNHF3sR+5Vl0eC22Zixqsnv9k6CeRhTByeD
	kwqa9u9mUnxP9Gt98NpLXyrGogSN2X8+9KMVlFOC1ee41nDmU9oN4TF+k=
X-Google-Smtp-Source: AGHT+IF3h32uucL3xY40HmWzn3evA+K+jabkhnqDz5vygl4XMcKOz4J5P2nUFJqU9c4v2ED1QiiikYOA6qjqGVaMVCo=
X-Received: by 2002:a05:651c:199e:b0:309:1e89:8518 with SMTP id
 38308e7fff4ca-30de02ce300mr34282961fa.27.1743464461848; Mon, 31 Mar 2025
 16:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com> <20250331230034.806124-3-willmcvicker@google.com>
In-Reply-To: <20250331230034.806124-3-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 31 Mar 2025 16:40:50 -0700
X-Gm-Features: AQ5f1JpN1uPBwlW10PDmdE0JIkoJNtbjg8pC6IakGecLKV2zkoUWAmiRsCtx93c
Message-ID: <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:00=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> When using the Exynos MCT as a sched_clock, accessing the timer value
> via the MCT register is extremely slow. To improve performance on Arm64
> SoCs, use the Arm architected timer instead for timekeeping.

This probably needs some further expansion to explain why we don't
want to use it for sched_clock but continue to register the MCT as a
clocksource (ie: why not disable MCT entirely?).

> Note, ARM32 SoCs don't have an architectured timer and therefore
> will continue to use the MCT timer. Detailed discussion on this topic
> can be found at [1].
>
> [1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirant=
an@chromium.org/

That's a pretty deep thread (more so with the duplicate messages, as
you used the "all" instead of a specific list). It might be good to
have a bit more of a summary here in the commit message, so folks
don't have to dig too deeply themselves.

> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/630817=
f7080e92c5e0216095ff52f6eb8dd00727
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/exynos_mct.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exyno=
s_mct.c
> index da09f467a6bb..05c50f2f7a7e 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -219,12 +219,12 @@ static struct clocksource mct_frc =3D {
>         .resume         =3D exynos4_frc_resume,
>  };
>
> +#if defined(CONFIG_ARM)

I'd probably suggest adding a comment here explaining why this is kept
on ARM and not on AARCH64 as well.

>  static u64 notrace exynos4_read_sched_clock(void)
>  {
>         return exynos4_read_count_32();
>  }
>
> -#if defined(CONFIG_ARM)
>  static struct delay_timer exynos4_delay_timer;
>
>  static cycles_t exynos4_read_current_timer(void)
> @@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc=
_shared)
>         exynos4_delay_timer.read_current_timer =3D &exynos4_read_current_=
timer;
>         exynos4_delay_timer.freq =3D clk_rate;
>         register_current_timer_delay(&exynos4_delay_timer);
> +
> +       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
>  #endif
>
>         if (clocksource_register_hz(&mct_frc, clk_rate))
>                 panic("%s: can't register clocksource\n", mct_frc.name);
>
> -       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
>
>         return 0;

Otherwise, this looks ok to me.

thanks
-john
