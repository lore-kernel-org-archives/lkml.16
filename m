Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7316A2A1D8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960397; cv=none; b=Zjd6cuj1sCh3vj3uDtAe0JsvogQbIVBDayCRIxwKuMTJ1lnJUNMUmv6jOnOCon1ilY1euRIU+SQQiYM6wdUGoR9bSjAsVVLR+YgKNGn2STjkwkOLEgyBMbfZNzHV/DR+jqa7SFEwCD4ZiY/ErAjXNeEdHwgNWSGQeIedXWxpT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960397; c=relaxed/simple;
	bh=T0i+T8f/fGXbZDbRjptinB25bnQH0CfmcAFBJRxvNRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcO69iboasg1zrg5qEMt4gpq7b7YJTvvlTzJLljUZopYSu/fEHJa7rKZDaDYtrTwQM+KncYxy60Pjd5Lh9IhJ30sHAdbXu2QhmMnSTK5z9LfAwX+BHxoPUXmgNXQVjno/UYKLW2W1lVpBM7JUINRdPVNjUE3drTI1IPb05oETNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yw+B2VcT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yw+B2VcT"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5440efe97baso2795651e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738960393; x=1739565193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW2vOgB6bgDG5mmgyCSvB76L98jFgeTMFmrfO8s1Z6k=;
        b=Yw+B2VcT9uLjmAa9xQiYjEqTE7nykO5ygDR9UR/ne7WESsuclgCRGSpz4gV6SOBi9x
         Tmeez6WbXnDTspPHt+hkLmV84ixgMFDXNITAGmNhtxMAklDKuvPnifyftaYvTQ8wuPCi
         eiIfOYd72xRHoiA9EwlwzhwSwqOh352I4fziVxROXoAPNEG3MDSSDit5dUl90kcmZs9H
         DNtBEgDUASIb4vakwMWnxCazvs6UhetkFyJnj6ROKvW29fdKu6Vd5bis87xCA+phpmWW
         jva9Lp/vIjkyMsaDyk1VeghKN3cJjTFYJVlw8Gj3LBj9TatbFVDJaErSNj6ZBHr5n2oU
         qfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960393; x=1739565193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW2vOgB6bgDG5mmgyCSvB76L98jFgeTMFmrfO8s1Z6k=;
        b=hF3yQ4Cp+IQRBCmvs/QNVAOyPl8E/s0Qk/W/wfxLNJGnj+otpnJtTW5fJGwxKq6gmX
         SkP/fHfXaRl5s23zOKQc+uf7chsz63E2mww2xTCTsr+9tYE5ARIxmZb0W8fjQaNuBGlw
         9fJ8ESQqjNdf6XTAVudToUHqqf0xANpo97T/JTzVGJRQ8aHpeRuHU20VTYUJ6EDUppP1
         AAJag0fU1MujFzGTayXWY5azE2vMRSFvzYu1vSXGR4P8MsacYk3vwG2prZuvMsSKLQxS
         v3EPlWnG4i/InB0hB1TA4llntOmM4aPstaaiMQP+ZEx8SdKdJ8wfjEgyb2WHCmD3TQcl
         UYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmv1M/z+4Qd7rmCVcB3oxWLGmPAx7oHUD9SRPqZvYeVCrNGhk+1BA5+2gltl0k/J5oQsiVo6znO4ZjQDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0QoMS2SaU9mlBOkc2UiripH3uWdIPj78whTeTAjrkBzeqPSE
	EBes+2w7EO/dq71Vyv4m+HwQ/eyMvuSnhtkU/hT/6P3RHqdcl2WK3gGC49+bskdXLWfk8DiCKX+
	cVe7cXLwQOg8XoK2pSi6CrR6t5MH7l0iIlDZfVw==
X-Gm-Gg: ASbGncvSJGBy6A8jGtIE57whfLG6SG2Pb7TSnsdrIlzpx5iZNL1M3M1mr1ZzdyucXAX
	wVwigcavkuvFtDR3dZirrDoeimDgaI+OGxWVzKIETvu4bCbyAVBqXsz6GyLfQIRwCJZqIglRQor
	fMatl/VNL9IOrNvyyXoAyVpDj8OE8=
X-Google-Smtp-Source: AGHT+IF1IrGAtJdeeEHIkfuTVjmO57+6voLGDlLEPmeCMVPqcpYupKtXRcE7wRdLsw8262YSbmFgdCwRyTc+m/xBfYQ=
X-Received: by 2002:a05:6512:3ca1:b0:545:48c:6de2 with SMTP id
 2adb3069b0e04-545048c6f8fmr62951e87.13.1738960393528; Fri, 07 Feb 2025
 12:33:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207083030.17698-1-brgl@bgdev.pl>
In-Reply-To: <20250207083030.17698-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 21:33:02 +0100
X-Gm-Features: AWEUYZlP1D4GyPf7liRrgYL26q5AaSQQ2fCUIiqVJnjpqgQs7J9PvQ3GnLGOYBI
Message-ID: <CAMRc=MfSr4CN_3GABi_NH0W4ACg4UU7KUBJ-NoUdXQ6Ou-FboQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add missing include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:30=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With some randconfigs I'm seeing the following error:
>
> In file included from drivers/gpio/gpiolib-swnode.c:19:
> ./include/linux/gpio/consumer.h: In function =E2=80=98gpiod_enable_hw_tim=
estamp_ns=E2=80=99:
> ./include/linux/gpio/consumer.h:557:17: error: implicit declaration of fu=
nction =E2=80=98WARN_ON=E2=80=99 [-Wimplicit-function-declaration]
>   557 |                 WARN_ON(desc);
>       |                 ^~~~~~~
>
> Pull in bug.h to fix it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/gpio/consumer.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index db2dfbae8edb..0b1acd014186 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_GPIO_CONSUMER_H
>
>  #include <linux/bits.h>
> +#include <linux/bug.h>
>  #include <linux/types.h>
>
>  struct acpi_device;
> --
> 2.45.2
>

Ah, build bot responding to my CONFIG_HTE patch made me realize we
already include asm/bug.h for !CONFIG_GPIOLIB. I'll rethink the
approach here as we'll need it for the HTE stubs too.

Bart
