Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980941C7F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174736; cv=none; b=YzAdjdRKb/CPFN/WwN2NQ9o+KibqiBplogg/+qf8I0pKTpESk2Z9lvqPHJv9K2Wu/GkdOlS4CQHHrK4viaQC6g9jBF7RCJdKVu/DG9GCtAJix2khuJ5Ojiyh0XV0f+Z87SuHjAQVqZgOW0nnosqPdm/AGmQWdqDxL+KVGhjcPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174736; c=relaxed/simple;
	bh=bZhd6eIsWJGTn+eW+3Nma1zngRRAOJBVJssD7pBAgLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBf3GgoKxYholyB+qINIfhE/m/ynl8GWRxlAwIx9hOEpC7tPPYM8QuOTsHRZR0NJL4es8tVymXp77ewS0SwIr0lHhog54eLfRxxYXQfxC1T7dqAYwoHnXgq9xzAV9ihocjcQOjxTPCSaJXzJcDy9dEI8+whBO2BBGPsr2Oz255Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5Fqm9SN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5Fqm9SN"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-550d09d4daaso1837449e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747174733; x=1747779533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN4P+ZmIbDZPQ8igWPA14/sZhWS4aBJywZdR2bP8Ghg=;
        b=D5Fqm9SNxpl2pm6CQCTmOQJlZUPglom+MYiwyjlsmq8osa626AVSXeK6VrTkt70elI
         JBhes60Tjdph4nEhsDPQ+CAnxhx4zEOG2tFbN2QlPBiHX+DItYg5S8oxwumsvyH5qSXE
         Z+Lt1KJgPAabWKa6M+FAg3McuKyyIcrgmg4viHrEQCj8lNj0XS10RCsxjyaYU5HPcduL
         QTnPSfuXjg77FDToPmiWVxFvIiSa1FhKDjIptoLxTy9aziKacvoJLykemVlNO/DavGkh
         dbu8/oiBCtu0KlQrEJ70V5ge3qRUW6cFZjB09cDL9WzuxXuQvMNg8zhhppGtucnpP20D
         e5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174733; x=1747779533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN4P+ZmIbDZPQ8igWPA14/sZhWS4aBJywZdR2bP8Ghg=;
        b=mRwXpZ7LR8FQgrwRYQo1ovzjvSP3wa4+XiXqCh5dV+xHkB2HOoIl5ps+8u/SeIAekn
         IaNyQDUWsy5qMlSd+aYcoBv3nrqi2NOywh2mNqVwbWhMZvEwQAovHva7TVfSlkylQ4wi
         nSRVNNe8ObsMG1rLfrHE1s0hbRLYPtcp4NZly7uiI+b4Je5UKIQ5ZTGdgYgjcj64V/dt
         pLnZzvS9DKG4pg4LJMcyrF0BaWiq3a2Q0g3U9+i5rzU8R6QhqY1+TymN3Gfef52Ateqj
         TAUhdX24BqmU+tXqvKVq0SKU47yi+3Bt7QwQxSHw5FVHJBhrjoww+EtKbgN24KBrhSs+
         HKIg==
X-Forwarded-Encrypted: i=1; AJvYcCUiPB2DzBp5d7rV02uw6M4S7lj8GImvZECdDHJv7IWT9kvAHw763lCmabK5fF4ZRK6gXFSSqcXL+8qksiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrr9K9dytSRxHllVLhPW/9AP+PDQt5YjXlIAVlvEw/EcZn3h+
	AVEwe5T4TtSgrVULVOIOdEF+Li3QOUwC9jO8+iUnY72JQsDD0tZZ7Vums8vcAimjrOC/v1AsPul
	t1Lh5g0TmSHJvUfMMygF/vXtHhMn49gMxoTXZsg==
X-Gm-Gg: ASbGncsJgzJeBd9+b5rCvzQkHbrIHxgug9a2drME1LrFjjMU3ndQtSOf7i6WTuoZDPj
	rrwbdJ4lDiSiE5vWtmkpLGlw/wX3BmdutDx+F5SGOgJBOY6YpNLE4UjEFqNxKJ+Hb0YskMwy7jK
	4xHmCIUCuh0d7i3sRU4mkcKIbMjo7dLKsH
X-Google-Smtp-Source: AGHT+IE3TaSTQ0y218sJ+MttBfYGqIbZTqfhTRRCbOoNaxFSRd2+WixJNWrBoYYMksflMGRwz0a2vprztgfYC8UG+D8=
X-Received: by 2002:a05:6512:4484:b0:550:d4f3:8491 with SMTP id
 2adb3069b0e04-550d5fdbcb6mr436263e87.41.1747174732660; Tue, 13 May 2025
 15:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com> <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:18:41 +0200
X-Gm-Features: AX0GCFuutKXjW8lF9hct4WnyYCwisgn9vG1wjD46G9ryQuu-y_Y00Zf7UCkilig
Message-ID: <CACRpkdaErq4uwjjqug3BbiHMKbP=4PkzpXPuQ57+2mgjJQ7ACQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gc->gpiodev is not NULL.
>
> Note: it is not possible to reorder calls (e.g. by calling
> msm_gpio_init() before pinctrl registration or by splitting
> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
> latter function after msm_gpio_init()) because GPIO chip registration
> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
> registration.
>
> pc : gpiochip_line_is_valid+0x4/0x28
> lr : msm_pinmux_request+0x24/0x40
> sp : ffff8000808eb870
> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
> Call trace:
>  gpiochip_line_is_valid+0x4/0x28 (P)
>  pin_request+0x208/0x2c0
>  pinmux_enable_setting+0xa0/0x2e0
>  pinctrl_commit_state+0x150/0x26c
>  pinctrl_enable+0x6c/0x2a4
>  pinctrl_register+0x3c/0xb0
>  devm_pinctrl_register+0x58/0xa0
>  msm_pinctrl_probe+0x2a8/0x584
>  sdm845_pinctrl_probe+0x20/0x88
>  platform_probe+0x68/0xc0
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x208/0x5e8
>  worker_thread+0x1b4/0x35c
>  kthread+0x144/0x220
>  ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
>
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=3DFV=3DVg8_ZOLgLoC4WhFPzhVsxXFC19Nr=
F38W6cW_W_3nFjbw@mail.gmail.com
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

(...)
> +       /*
> +        * hog pins are requested before registering GPIO chip
> +        */
> +       if (!gc->gpiodev)
> +               return true;

LGTM, Bartosz if it's fine with you as well can you ACK this and I'll
stick the patches in fixes and get it to Torvalds pronto.

Yours,
Linus Walleij
