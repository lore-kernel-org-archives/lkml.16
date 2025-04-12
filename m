Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5419D891
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 23:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744498841; cv=none; b=sra3q008IcM0qKI9Ujdh7KtjgSd3XmWtLoEsxakfL4CO+J+FDqapLWJpbXYixvkQ6I3ihWpkCQEccIraIW8E8qjOVzgZnA2kRbyZIhDf9JYPRPeoyu525YTP9jFrFJshsDdZSin7x/A+JHGhE363hPbQ65dR3wIbRKBNv0U/ycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744498841; c=relaxed/simple;
	bh=oPo1blgwzyJP/bY5bwvLVevkdwQtLQb4S/wTulcJtJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptE5uCBvlBvelgegFnq8TGKOKzDRjvy+D7PFfJt3UJnf9wy1jdjy3Xi2cVW+/y8X3pJt7JzL13WsNLDi2A/s4RvYdOeRaaedfgsgzmn1OTRIy2gl9uxGGeIo5HnPmqwE6UVtXbtaQQfj69YA2VGbEztR5XX6S3VJbQoAKLNyTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lmQxz28k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lmQxz28k"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2255003f4c6so32798125ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 16:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744498836; x=1745103636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU3iBfM7D5CeCGE+Vgvqc8yYV4eCj2ocSR/M1MRt/RQ=;
        b=lmQxz28krQsor78ean5movzKBT/7cAWJAI6/eVFJ3lyrXINhpuzhwxZvg63dBA2FV4
         U7MCmF/xrgRlz4xniRCFpBSKFGrZXDcW4s9YcRmospQHUyR1nYGpoyOLXMxvxQ5RbLLQ
         iQDzwtiV85U5hIlM2WavMD/+kiVay9C9gDaqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744498836; x=1745103636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU3iBfM7D5CeCGE+Vgvqc8yYV4eCj2ocSR/M1MRt/RQ=;
        b=WdJwz9tpfmQgSGeYmfqKZSZIq3g+tCbhTaCUM6Na7lE38sWc2t+UxLYikWhf/8ysmo
         iz8ysWMCmy24ZIfVUVyvB8CrmyG1pZG2/dUjD4wqKkq9qX260QuInq+YMywRJC1pSTgn
         +2kgCngVYdVsTRW7FtTfgZOcIJwAGM9h+yl1oiwwBnD68pe8IW598ZLcY63fsw6C3Qfx
         gVg8s7SIlJra0tkUxS02Qj+jL2zE7yrY8h5xWYr7OVhKKL2cKgrEDGGHv2+B/72xlUMF
         0OYDd6ihL/doR9ezqEzL9aMfuHO1cYwoQMCWj0Iyq96/GFAHRUm15s2XStAm3xM6D04T
         mNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCULpVpqyX322ElxOA//ZBYle5FslMAxlfO6PG+zuOgbxdz6Ejau3qQ3ISwM60jaNYF/EUM74Y9xdVG9/LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+qmeMoNAPmg+UUwabzfgm0DFOLRVZtc1D2f/sVPnuzXRxdTJ
	0mXKOGqh7Fyr3XiB07Hz0hads7xwlwbnFu1aF4ZugafIig7eVCEhixsClkD2jJje1z5whs3BblM
	=
X-Gm-Gg: ASbGncszUVovLo06VXAKtonfJlq5WyUOyKBgLUEcXclg+2Qk0DNX+Z2crTUFPOscpWa
	xHhQoKyQLZzAVUWGspvQqBy5GHTWcDnhgizUuXbQA328sb/9vqKzg1m/0/MAnQWSuRayEhekwvw
	KD8lIsz6LPfCRw3VSPMvyYMWUfgWgRg9RfXdMOfp+ZL/mWORAaEsiQztGjJe70EO/+UhYd8xHNy
	LUNKyjEMAa5YaIBPioS1g6xk2RyBdrOpdE2JxWWXtiAl2yC6FaaQFLrCui9BBTFn2IHyIxPJbzG
	r6/5YKXsGXrvS4JLSi2oHSYNjemUCnVyxmQuJ3RbbiUsfEiAP8dDLJT2ogwPg9Nb3LDuhPeuMWx
	R8buu
X-Google-Smtp-Source: AGHT+IETa7325MGb4TWpW98fZNC4Z4Hrh6B761OpGbnasCMJN+4SfisAyaemZLhT7yaMB+3JFn3LjQ==
X-Received: by 2002:a17:902:ebc2:b0:224:1579:5e8e with SMTP id d9443c01a7336-22bea494e47mr105229365ad.1.1744498835602;
        Sat, 12 Apr 2025 16:00:35 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62ac3sm72677605ad.25.2025.04.12.16.00.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 16:00:33 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30572effb26so2874275a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 16:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXs3G7Odcg4TtKCrY3AFNh2DV+/y6RwoX7eosgSM86wG7UElIL2KBdCHY3agY38TcZzS1DfTbVYK1koxrc=@vger.kernel.org
X-Received: by 2002:a17:90b:510d:b0:2ff:58c7:a71f with SMTP id
 98e67ed59e1d1-308237ce153mr9648710a91.32.1744498833042; Sat, 12 Apr 2025
 16:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1741180097.git.mazziesaccount@gmail.com> <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
In-Reply-To: <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 12 Apr 2025 16:00:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
X-Gm-Features: ATxdqUHXuDUacWtFQbmrQv_egGL6K4UpbFGxUUNUsvQNVBATH0HPo_GCExTfnng
Message-ID: <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 5, 2025 at 5:23=E2=80=AFAM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:
>
> The valid_mask member of the struct gpio_chip is unconditionally written
> by the GPIO core at driver registration. Current documentation does not
> mention this but just says the valid_mask is used if it's not NULL. This
> lured me to try populating it directly in the GPIO driver probe instead
> of using the init_valid_mask() callback. It took some retries with
> different bitmaps and eventually a bit of code-reading to understand why
> the valid_mask was not obeyed. I could've avoided this trial and error if
> the valid_mask was hidden in the struct gpio_device instead of being a
> visible member of the struct gpio_chip.
>
> Help the next developer who decides to directly populate the valid_mask
> in struct gpio_chip by hiding the valid_mask in struct gpio_device and
> keep it internal to the GPIO core.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Revision history:
> v2 =3D> v3:
>  - Rebase to gpio/for-next
> v1 =3D> v2:
>  - Hide the valid_mask instead of documenting it as internal to GPIO
>    core as suggested by Linus W.
> https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
> ---
>  drivers/gpio/gpiolib.c      | 16 ++++++++--------
>  drivers/gpio/gpiolib.h      |  3 +++
>  include/linux/gpio/driver.h |  8 --------
>  3 files changed, 11 insertions(+), 16 deletions(-)

FWIW, I've found that this patch is crashing me at bootup on my
sc7180-trogdor board. The problem is pretty obvious in gdb.
"gc->gpiodev" is NULL in gpiochip_line_is_valid().

0xffff80008066c760 in gpiochip_line_is_valid (gc=3D0xffff000083223890,
offset=3Doffset@entry=3D66) at drivers/gpio/gpiolib.c:746
746             if (likely(!gc->gpiodev->valid_mask))
(gdb) bt
#0  0xffff80008066c760 in gpiochip_line_is_valid
(gc=3D0xffff000083223890, offset=3Doffset@entry=3D66) at
drivers/gpio/gpiolib.c:746
#1  0xffff800080666338 in msm_pinmux_request (pctldev=3D<optimized out>,
offset=3D66) at drivers/pinctrl/qcom/pinctrl-msm.c:152
#2  0xffff800080662314 in pin_request (pctldev=3D0xffff000082686ac0,
pin=3D66, owner=3D0xffff000082c02790 "3500000.pinctrl", gpio_range=3D0x0)
    at drivers/pinctrl/pinmux.c:176
#3  0xffff800080662900 in pinmux_enable_setting
(setting=3D0xffff000082684b40) at drivers/pinctrl/pinmux.c:445
#4  0xffff80008065fd54 in pinctrl_commit_state (p=3D0xffff000083a07520,
state=3D0xffff000082684a40) at drivers/pinctrl/core.c:1300
#5  0xffff8000806605bc in pinctrl_select_state (p=3D0xffff000083223890,
p@entry=3D0xffff000082686ac0, state=3D0x42) at drivers/pinctrl/core.c:1381
#6  pinctrl_claim_hogs (pctldev=3D0xffff000082686ac0) at
drivers/pinctrl/core.c:2136
#7  pinctrl_enable (pctldev=3D0xffff000082686ac0) at drivers/pinctrl/core.c=
:2156
#8  0xffff800080660814 in pinctrl_register
(pctldesc=3D0xffff000083223a90, dev=3D0xffff000081406410,
driver_data=3D0xffff000083223880) at drivers/pinctrl/core.c:2193
#9  0xffff800080660df4 in devm_pinctrl_register
(dev=3D0xffff000081406410, pctldesc=3D0xffff000083223a90,
driver_data=3D0xffff000083223880) at drivers/pinctrl/core.c:2313
#10 0xffff8000806657b4 in msm_pinctrl_probe (pdev=3D0xffff000081406400,
soc_data=3D<optimized out>) at drivers/pinctrl/qcom/pinctrl-msm.c:1579
#11 0xffff80008066afcc in sc7180_pinctrl_probe
(pdev=3D0xffff000083223890) at
drivers/pinctrl/qcom/pinctrl-sc7180.c:1147
#12 0xffff80008089583c in platform_probe (_dev=3D0xffff000081406410) at
drivers/base/platform.c:1404

(gdb) print gc->gpiodev
$1 =3D (struct gpio_device *) 0x0

-Doug
