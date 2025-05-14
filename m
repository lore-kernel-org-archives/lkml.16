Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439B513E41A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216684; cv=none; b=qgR8ibjLIoxHkxemUvnRFxkt5Knon0DCX3cJQcfKn7qg898VMIDeJNJyH76gIkjGqOztevazjnj1Oo0uWjq1wnnMioXcR1CpLby4OPSFxsywWEB2IAVwUEDEOr9t2rsMjhjm6fyzEJn5HxN62sYDav3lguS4r1TOKBlr16jA7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216684; c=relaxed/simple;
	bh=bS6OiwwODtIhVfytW0IXHsyd6ZKxJRnv6rBUnfwIwaw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4g3aczHfrdYxRUuLHSAN28pg0CO5T03M7oe+8/XS4tnmTLeamW5iwpUvaCCY4/fFMGmeEcNv2Jz1oFrRhOGsoWVM6lL/a1EZ5J+I8Yj+/aZZ3CMADTdT+fuFYkoUwD36pvZOZ25ZH4rcESzQ617RRPiJPU6/owKLptCqQ8fUvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HFJin9uy; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HFJin9uy"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30de488cf81so65814691fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747216680; x=1747821480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sef9ctaVHOch8HKf4l4HAkMpIwdQ/iI1WZkRcq3n7hA=;
        b=HFJin9uypWSHptoKRRqB/qFGU4LePrUzUdwNqJs0iS+MreEZ2idXsqc557Xa8XKkBd
         Y0Jby+6L/Xh9tGA5T+YRKcyG5gVPp6CYHgDYj+r0g2sndHQQ5r7rLjVRnYGWg/z3dySf
         Qp2L9LwCAhvw4fERF+IMrvaRrM+lpfqJa4kTgDktGkR8gPQ+vJXhFZrNLuQeW7q8XRN0
         O3WPcEyBlHhqRFF04NOc4yIJku1HKxf77ZuBUF7/RXOpaaETSLPzKdl0b4ohkSiolvN6
         v0kqsSy5ndpSvUduH9WYABDhsnc/v5knsfDJk4zOTwAmHzBzGbqVlOMx1Gd86jLkSaxu
         hFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747216680; x=1747821480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sef9ctaVHOch8HKf4l4HAkMpIwdQ/iI1WZkRcq3n7hA=;
        b=nMNSKzv7aeGeScY3PB2JR0+ri8AkBXXBlrOZmIhF8dtCBT2LjQW/EUEDwVXTSvvdj7
         BX7Q1RZCLWPBDa8pRLAnPhHZTXaguNsB0ulFmBxyKz9QPZvfFfyJrH2UZinn5avAoxoK
         ROiqfND9JilNVPS2zbyp5ZbkpBgnSzPU4mXv2R4f1hKldoV3Ir7w2bVkdFVc1qk8b63V
         c7ljTr5GzVxX8PzgfyxrhEN63fSH8idKg6NYgffhpnparaR5orDqKG/KAsM+B8MMxVWT
         lWGtuyObeEIDd7gnIoJ9dXSJKOCrdAO460Y/T1P/Bld7MTgmSe+pAHF/vyHIf/Eh/R+I
         v4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWC586lryHMtDMoUWhMAYElJACasKRuC1XLZk3mZ8eFcZY0Vr6iduT1qYZS2cISn8jYOKlPdwsYCWTM2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywja2pHdOefhFLoiS8tos5iYJQ5xpIALKvNf6JRIsHOrYWMPmPx
	qD+qhI3XJ4u3MxtAkG5CM0jf2qCrRD/sPuTA+5q5+pfB/NsAchv5axE46ug4xl4oALyo4nyACW7
	ug2jmmfGU4U2l6hIbSGWdVGsisRgrygDHftQ+Rg==
X-Gm-Gg: ASbGncv9Juz1ruqJkCVVMjhpecBKP7rR4BDsL6B5EvILcrFz6wakDbEu7GAk5LNTmtN
	8FLjSobr8i0/Stn6zaofQwvxq5T5zMbx9EqDMkgaJplZoSy13HT/ioUC4tc/2GPPAyGh+tmCL5B
	9r+dRyQN7uJsd0FI45z7K/Km8TIvSHDQc=
X-Google-Smtp-Source: AGHT+IEGW1BwG0vWRm5BlH8SykmxSxEEcq2RxvplxQZDDT5E7U5dCDchPUbWlRgl684WDWawwv+GOAwQdpalrax/dWE=
X-Received: by 2002:a05:651c:221e:b0:302:2598:de91 with SMTP id
 38308e7fff4ca-327ed11b3a1mr9949641fa.16.1747216680139; Wed, 14 May 2025
 02:58:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 May 2025 02:57:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 May 2025 02:57:59 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkdaErq4uwjjqug3BbiHMKbP=4PkzpXPuQ57+2mgjJQ7ACQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
 <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com> <CACRpkdaErq4uwjjqug3BbiHMKbP=4PkzpXPuQ57+2mgjJQ7ACQ@mail.gmail.com>
Date: Wed, 14 May 2025 02:57:59 -0700
X-Gm-Features: AX0GCFuzMkv-uw4OkxtcQ7B0bROFFsRTNAPuiGhyru3oWFwWfGG6-KWTDkLR3FY
Message-ID: <CAMRc=McwKEPZx=P1LMkWu6++=jLiU_+eDEHB=PRcJoFqVGufpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 May 2025 00:18:41 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> On Tue, May 13, 2025 at 8:39=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
>> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
>> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
>> valid_mask from direct assignments") gpiochip_line_is_valid() uses
>> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
>> Thus after this commit using GPIO hogs causes the following crash. In
>> order to fix this, verify that gc->gpiodev is not NULL.
>>
>> Note: it is not possible to reorder calls (e.g. by calling
>> msm_gpio_init() before pinctrl registration or by splitting
>> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
>> latter function after msm_gpio_init()) because GPIO chip registration
>> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
>> registration.
>>
>> pc : gpiochip_line_is_valid+0x4/0x28
>> lr : msm_pinmux_request+0x24/0x40
>> sp : ffff8000808eb870
>> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
>> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
>> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
>> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
>> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
>> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
>> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
>> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
>> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
>> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
>> Call trace:
>>  gpiochip_line_is_valid+0x4/0x28 (P)
>>  pin_request+0x208/0x2c0
>>  pinmux_enable_setting+0xa0/0x2e0
>>  pinctrl_commit_state+0x150/0x26c
>>  pinctrl_enable+0x6c/0x2a4
>>  pinctrl_register+0x3c/0xb0
>>  devm_pinctrl_register+0x58/0xa0
>>  msm_pinctrl_probe+0x2a8/0x584
>>  sdm845_pinctrl_probe+0x20/0x88
>>  platform_probe+0x68/0xc0
>>  really_probe+0xbc/0x298
>>  __driver_probe_device+0x78/0x12c
>>  driver_probe_device+0x3c/0x160
>>  __device_attach_driver+0xb8/0x138
>>  bus_for_each_drv+0x84/0xe0
>>  __device_attach+0x9c/0x188
>>  device_initial_probe+0x14/0x20
>>  bus_probe_device+0xac/0xb0
>>  deferred_probe_work_func+0x8c/0xc8
>>  process_one_work+0x208/0x5e8
>>  worker_thread+0x1b4/0x35c
>>  kthread+0x144/0x220
>>  ret_from_fork+0x10/0x20
>> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
>>
>> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
>> Reported-by: Doug Anderson <dianders@chromium.org>
>> Closes: https://lore.kernel.org/r/CAD=3DFV=3DVg8_ZOLgLoC4WhFPzhVsxXFC19N=
rF38W6cW_W_3nFjbw@mail.gmail.com
>> Tested-by: Douglas Anderson <dianders@chromium.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> (...)
>> +       /*
>> +        * hog pins are requested before registering GPIO chip
>> +        */
>> +       if (!gc->gpiodev)
>> +               return true;
>
> LGTM, Bartosz if it's fine with you as well can you ACK this and I'll
> stick the patches in fixes and get it to Torvalds pronto.
>
> Yours,
> Linus Walleij
>

Sure,

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
