Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBE221721
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185480; cv=none; b=l++dA0PRKobkS4OGi0sGROcUhzl+7OLus4e0APiyw5IjGg8V37fU7xUMFSvGrYHjbkIOripJUePkWoN4bZcgoKUckH8OcdR1s7JeJ235Q1eMJlZL8yayQpcny/4D1dMtQVkLBMVCMtC6bNBgTi/ObYFFusXlcbyQGAeJQuvkW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185480; c=relaxed/simple;
	bh=nsiFImJLoqRMPYE6uUcBaLQvv1p2h76vbEMvfRkjgS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HySSQK3JuxdgmguIkW3ROc7kKr+MxW7rux54JkVnWY4g9iyYtl+SDi749uSm6hlvUC3L5hNOnOq4QoqVdiKwJXKuI2Mfu7qVSc8wYUcurler5hN1T2kloMuAaxRVliHkDJlrVXtxpfLCIUscAJexGc/+VbQYxu6HjfS6GS2FYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BFAYSYv9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BFAYSYv9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so105563e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746185475; x=1746790275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PVZ4QM5gmv4w9v0TZil7CgJhd3wgbN41SsSO9rADow=;
        b=BFAYSYv9JpU8W61tifLJgclE8j7BYvenRD3psfh7CDkO3Vhdy5uhgLv9u6XRljMn0y
         uGhbtq9/tkaR3mDqrLZyrnBX97Lfs3rVLK1sBFguyv/KWObjto2wVI2nwAR4eAZwLyG7
         CaqtlZhZ3LZipuziJKb27Tebk+E3NHjT7fI3BUxNjvid833CfJogXI3NhP3Ht3WuC2Ry
         +ePFZq3OpYjqBXDEUigEr36+02/5i0PEpRBelolSibIJxISt5uRofoGhAMiGiWsdTr3e
         h4Jr3C7/TjeEQJZvIU6q7pZpyi19b7PE5WczLnaBAeKaGqpfbb6X1XWI0F7zFAZZdl8d
         GZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746185475; x=1746790275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PVZ4QM5gmv4w9v0TZil7CgJhd3wgbN41SsSO9rADow=;
        b=xLoW1EE10KlSlxUxFjgst4faS/vGf5kr/issjy5ZwMPFYb+kzTWzEa78eYbwXbSFVU
         q1/zMFfvOYdMF6JHzNf5wYKGZi/VmD7nTi273fVAxDvMQMzt3DFz/Tz0GNiaTPrBV8Ac
         wqRN7ioZ32BbkZNgidm0mqThcMAdzcaSbiyiFvEpz325qQjoqhDAnKHFLsyz70gmxTFv
         fvQr9a9YGxSsBi4LcGNT3mTasQ6dTgKGPurjbrcLEJ2nQvUEjJcf6hGYyJu1XajtrB+Y
         mV+fjU7Y7GuZHQ+tH538gB6OECsIhQFVDVyaJWuSsxRM9i7SFojZVIXnj2QVyMmc3MVQ
         ryDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiMaydGUpS5LVTJnz+SGPMjviRsi0J6AMVtUNgnFvABG8u9vb3TwCnmphG2iTXncSzUxxhiIvb8fMWmUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8CkpkmdeIVs8tIJ4BKcgRSej+RADu0+nk/0wR9nd32tBOYX/d
	fg4N+Ama1Cy3FrLyW3s2M2N4/zUcdDwXl/Rg0CUXEVJGTzi1lEK3UEgxDJSpGpfDHDZLyEA4XY+
	WH3u7BwlTE3RPg8u2hVK7uzCuxU2+lNP1pNojzQ==
X-Gm-Gg: ASbGncs+fUuftcqfYoVOvIfG1VKigExt8sHioSMF01A+/B8fDucIX0l6GdWHbh0FZSd
	lPhdkLA3hf60m1x117kIvI5EXxiu7+5ELS5noLT+zvha01+MoITyVeSD200UoQcrCc7gttDfv9g
	6yXVNU2JgV7NCWx9cMf8ACExnMbPOfhvATNlxolhTIUm4VW1+X7NgdYw==
X-Google-Smtp-Source: AGHT+IGaxwPjwZjPSxduV7/nv7xqHS4FaobXkSF8oU2RzlJXTcBtUuY8b6IbKqMF4S/Rcv+Wp8xW5CzYLKbGOnG9ITs=
X-Received: by 2002:a05:6512:234e:b0:545:c23:9a94 with SMTP id
 2adb3069b0e04-54eac24302emr669308e87.48.1746185475382; Fri, 02 May 2025
 04:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-irq-qcom-mpm-fix-no-wake-v1-1-8a1eafcd28d4@linaro.org>
In-Reply-To: <20250502-irq-qcom-mpm-fix-no-wake-v1-1-8a1eafcd28d4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 May 2025 13:31:04 +0200
X-Gm-Features: ATxdqUF7UFBB_n-kwTbMKu89mjJ3x0a4dj381-gCLDZrKHfAIyHJguUXxuGeqH8
Message-ID: <CAMRc=Mcg0xRvZWEP3hmWyrLF-gsfzR9DS0umE3NffqKbrRUgdQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/qcom-mpm: Fix crash when trying to handle
 non-wake GPIOs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawn.guo@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 1:22=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Qualcomm chipsets not all GPIOs are wakeup capable. Those GPIOs do not
> have a corresponding MPM pin and should not be handled inside the MPM
> driver. The IRQ domain hierarchy is always applied, so we need to
> explicitly disconnect the hierarchy for those. The pinctrl-msm driver mar=
ks
> these with GPIO_NO_WAKE_IRQ. qcom-pdc has a check for this, but
> irq-qcom-mpm is currently missing the check. This is causing crashes when
> setting up interrupts for non-wake GPIOs, e.g.
>
>  root@rb1:~# gpiomon -c gpiochip1 10
>    irq: IRQ159: trimming hierarchy from :soc@0:interrupt-controller@f2000=
00-1
>    Unable to handle kernel paging request at virtual address ffff8000a1dc=
3820
>    Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
>    pc : mpm_set_type+0x80/0xcc
>    lr : mpm_set_type+0x5c/0xcc
>    Call trace:
>     mpm_set_type+0x80/0xcc (P)
>     qcom_mpm_set_type+0x64/0x158
>     irq_chip_set_type_parent+0x20/0x38
>     msm_gpio_irq_set_type+0x50/0x530
>     __irq_set_trigger+0x60/0x184
>     __setup_irq+0x304/0x6bc
>     request_threaded_irq+0xc8/0x19c
>     edge_detector_setup+0x260/0x364
>     linereq_create+0x420/0x5a8
>     gpio_ioctl+0x2d4/0x6c0
>
> Fix this by copying the check for GPIO_NO_WAKE_IRQ from qcom-pdc.c, so th=
at
> MPM is removed entirely from the hierarchy for non-wake GPIOs.
>
> Cc: stable@vger.kernel.org
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
