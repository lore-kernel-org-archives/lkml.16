Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040818DB2B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746427857; cv=none; b=GO4fPgBDQA5N2cHaToyIxYVDzUplVGzxeKz8SOtpNxEm8UmaAAXDswXrSxEAZJdbXlxfQ+8L1+DDPFHj5x0FsBw/n3/ZtE9r0n39+/lheryc2HaB4lOWn3fwRWvVj4plrFDVXXbRYqnLcksy0zrbMTch3OGdn4aJBo8PfeJP4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746427857; c=relaxed/simple;
	bh=c4ZQBUMn/VoUO8vRN2n+APMsy1PkJH7Jfr08u+sr8QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFqCUxl8IH8e0Uec8Sag1uR1VFlmL2csdNwn8OGN1kq7pz6BBuyEhxuBnjtDIFPXhB8pKJOrHz4tLuFCft3Jv/7fnPP53jPP+QkJyeffhEhurEW3/UbnBZRRHtFqQbOmqkxe7u/iC8m00vUyrL0hbhbKAhjrO3gyLroawyJTHRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cnCr3Up5; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cnCr3Up5"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so55079611fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 23:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746427852; x=1747032652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbyxFb/dxGAzdjot1cWRldqEt9Sh5+xovy8mV3fvyjA=;
        b=cnCr3Up5CAWbXCmcUvmV5j480dPRjcMcBxHAKB8tNLtENYlm/C03V+k7feolnSbtmV
         lAaO6xK+R/xxa3XyZA2vdPFyUk2M9Nx6gxYQMS/7Q1fDWP/jbro1ff+YO5St1S/7a7+0
         V0CrcKHiALwycnAPw1FVe+RzLM6LA6g09BfD1z3xdbKT3fQVDdd1AF9PDTKkYqIKPSo8
         MWBt9p1ithW5WYKp802Rl/pmR7NauQSfyQg+yDJV9mz2o0yf13jzMrxhisY8I6wr7Szm
         qbo7iu4bhNbtvgn340bvsCHIoZkb0sElY78iR05OOqZq7aGGA5QjSxrj+20sAjDrguzd
         0bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746427852; x=1747032652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbyxFb/dxGAzdjot1cWRldqEt9Sh5+xovy8mV3fvyjA=;
        b=DUWU5HNlLIQVp/eL3TAp8gZ3CQvTTxaD3NnS2UagSeODfNCm3nNXivQ/5n1QYTiqLZ
         tA0crqFwFSUscnKkaVUUjzHlYG2LfQX2xG296nwRBX143+tdZF+SdVK/6JrqLxCfvuzV
         sVklPNq4PBn9MgNg1lgVOJ8gnCzfdEouPJpU8ZAli7mFLvJfUGuEXK/q4yWsPqcv5uOl
         Kb3KDUVlec3ufXVrDtj/UEvzGs/LPSqXG3VOJaT70kFC07LNInqoVcdq9PdlWJEOCLI3
         WZWwcWW5+NpKyk5rkzufwU843l1ZolhP55geOJd8oagP9MVTb3QD/PPHm5GXldfdcBAZ
         3tVg==
X-Forwarded-Encrypted: i=1; AJvYcCVcKmvTFEQyJjVdpoiZBdUxb5tXxt0fcjQvKyQIMlsa53XIrHnyRyqjo0jvcl5rZgcVF2gXhTytlv/J/v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+axBpdVAw2M8zQMQhhq/QDG0X8NVOURv0T4qdKD7WPcq95wz
	88dHGDp9qUUQiXQeQv47CkICR8CmXlWgY9HmU+8xMSR/Ox+eLi+iT5HCzb2fD8Jg7N1nOdTUMA0
	x0C5sZYP1QeNTsdaRPHMgZy4JoD/KsszbZywFsw==
X-Gm-Gg: ASbGncuR+SW+4N991Af4efn7y9HPZrkEsdP6dXp9NIabyx8JhE4HoV02La5wtvhKixO
	zgYghRnYmJ/UKGjl7c5awgvSBQyYnsvpyc2X/lPEX7y5ap4AEWr1GOdZkqA5c+5LdIgxTZSRZ+z
	qp58SYD2ynbovEo8/YG3D7sghW3EDFzMsabXqvLA6CVJtf1o2mMqhl/0ij7gl/lMU=
X-Google-Smtp-Source: AGHT+IHgYvw6fOkyyiCKq4QfxnEdORJfhCwnB/NruKqs6eztGmVUrh49LXjtpm9TvPQMpypwr1TCoSuqdcH0yffsPCg=
X-Received: by 2002:a2e:a542:0:b0:30d:6270:a3b4 with SMTP id
 38308e7fff4ca-31fbcf4c9ddmr38559731fa.15.1746427851905; Sun, 04 May 2025
 23:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502203550.2053573-1-arnd@kernel.org>
In-Reply-To: <20250502203550.2053573-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 May 2025 08:50:40 +0200
X-Gm-Features: ATxdqUF6f7nwepgbCqjlbAglbnMNGYO0fPR5ZRr0fWiNruz-evCms6ksgSoPbUA
Message-ID: <CAMRc=McmsV-igk6MuvghJCuM5oThjYGqKV+dYn3=b1J0ar7fgw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: fix CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Selecting OF_GPIO is not allowed when CONFIG_OF is disabled:
>
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=3Dy] && OF [=3Dn] && HAS_IOMEM [=3Dy]
>   Selected by [y]:
>   - PINCTRL_AT91 [=3Dy] && PINCTRL [=3Dy] && (OF [=3Dn] && ARCH_AT91 || C=
OMPILE_TEST [=3Dy])
>
> WARNING: unmet direct dependencies detected for MFD_STMFX
>   Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - PINCTRL_STMFX [=3Dy] && PINCTRL [=3Dy] && I2C [=3Dy] && OF_GPIO [=3Dy=
]
>
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=3Dy]=
 && OF [=3Dn]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MF=
D_SYSCON [=3Dy] && OF_GPIO [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])
>
> Add back the unconditional CONFIG_OF dependency, but leave COMPILE_TEST
> as an option when that is enabled.
>
> Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPI=
LE_TEST=3Dy")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index db84d80b7e7d..5d368fb66115 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -103,7 +103,8 @@ config PINCTRL_AS3722
>
>  config PINCTRL_AT91
>         bool "AT91 pinctrl driver"
> -       depends on (OF && ARCH_AT91) || COMPILE_TEST
> +       depends on ARCH_AT91 || COMPILE_TEST
> +       depends on OF
>         select PINMUX
>         select PINCONF
>         select GPIOLIB
> --
> 2.39.5
>
>

Hi!

I sent an alternative patch[1] which simply removes the OF_GPIO
selection as this driver doesn't really need it at build-time.

Bart

[1] https://lore.kernel.org/all/20250502100841.113091-1-brgl@bgdev.pl/
