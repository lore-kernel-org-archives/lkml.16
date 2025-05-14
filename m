Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBC35970
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233038; cv=none; b=Fy/LjLcPzPbaMTvwR3TPa7RtcESE5a0Z/yUYEJUnKrS+9O39Fa5+3RHkFJkpTU8N4EPNswZwC+vTBABIlznL9Q9aGGTwruVIAddAlmnMPpJbfbhr/ZKqIuVhSmdRsfPoi51Tb1viLoKJ99jxRBJySJUebG7DIjNsuDNQeJeetZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233038; c=relaxed/simple;
	bh=TpqI7/UstRjD1t3hPg2je7OSJ+mR5sn9M/MPI9l8Hcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATVCbt92rIPojENq1Bqktyu4tGzFRO35YbswMvjEDr+W9nMbNeIaEfNJMKy3vz/rl43cTFnQ2TS5C/9moTSLYP0607BsY1NzRpcln1bseEo7Cv4kVldqm1jdHaHnWaqzhelI278GCn6oQ53yFyDizV2XyDkry8xEAg5EM8pNGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fo0bER3m; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fo0bER3m"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c1425fbfcso5337511a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747233033; x=1747837833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmvwNbNh3Td4tVXcEuUfGTCu9MlTY+8OhrY/bE97vRA=;
        b=Fo0bER3meSS57/t6Hqpl0MbqJ2ACh+x8B1LtldMHGUG7nmWrQ6FmZfOl8h3fC8Y5bm
         XIAhDkC1REsAdXB0vpX7jWJo09iEY39KFRhp+9Ix/icTs03MulTxSHlPUi0VLnOZ8qX7
         S7FrWAMHSXiuZRFl6Sd3iSgefu+dXd4dvvdaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233033; x=1747837833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmvwNbNh3Td4tVXcEuUfGTCu9MlTY+8OhrY/bE97vRA=;
        b=TvMJltur2z33ZVb7dD1tJsBPZ2Px1aHR6nUrQRMbs1xyEYotPTtmxePDImtORRJw9X
         216a8efdN9brJkLg0L+4SHVsBnLZoN+6Q/kClx1rvPUAogBzbYMfXrP6edruG9FFQAvh
         pC4cH2itEtbBXqlrZgzI40SxNM/z3tiOeyXQsiB2FuSKUrpcFv2S10sW5YI3rMoCpyNw
         xcf9PpWnUyqW5mPqz8wy1eABQQXuzTK5BTsFasQcbagW+px7bEEacIq8T902Uy9ZcCwU
         lGChQVJG1Pbp58yeAhghbKigUn/4q/Cj6j3S/XUdi5KUEv9HTVlKx4EVWMKWy5YxO7FG
         G3bA==
X-Forwarded-Encrypted: i=1; AJvYcCUxVSuQkqw2Qf0myM7CqAYEb0ER33X53w9AX2Q2SENt6KLhJTYP58E0ffMnT70qgDTFXIfTmDNfr8UbUaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85rzcs1LQd5RdJm9KCLysMVrVXON963nU6zXG2EzaILS3j9ex
	vSXG3O019Or7qCFarhTYV0hUbWpXAehBewa3OqFezEgSTRx5RPHBnHO/Z/RxSa4tYvaM9w0CJoQ
	=
X-Gm-Gg: ASbGncu88ZsxMA4gemWc1cCeavJkPCXgh9l+qVLNVrEJyrPLqyQkFoHJ57YgPRs11vm
	sF56cIL93ayXE9ZYfqez0VcRxxEZ/R9XwvuH4m6BqcpKv4d7qAU7boaFtVddoA3i64wvqK6iquY
	xSE7YrN56RXDppUnP1RNdA8YYo+ykdvlzIK0dMGy/NRN0kdTZaQA1m1eqhZloluxNuCMSZu8JqX
	AE9C2J4seAvyyW+ie8v+3MHwpfgfkUpI8nlTm0F5ARBLzts0nYmB9/8Ga1iGcAJpdL6LVljc2d2
	B2SdO6CxZvKgZvu9Pdfj0HWwEPVt4W68gJoqcNXW6crqo0Pv5wYjer76FKzu+jIlNo0HhuOThsr
	dfB7rWXNFugMS0M0=
X-Google-Smtp-Source: AGHT+IGQjWtXPpGb6rQK8UZ0TT/OwtgK3QgRclUqwwmqQozWBmtumowyCb/w19N2KdBfUm0Put1otg==
X-Received: by 2002:a05:6870:8303:b0:2c2:544d:e140 with SMTP id 586e51a60fabf-2e32b13590dmr1842483fac.11.1747233032689;
        Wed, 14 May 2025 07:30:32 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0af8c1csm2712522fac.39.2025.05.14.07.30.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:30:31 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c1425fbfcso5337420a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmiaDlT3W8bZOZ01M8hDi0SmY16uaDW+EOJcWm2JWjzOE2y9+QgEVdtYsmtzNfxv3T9WAUMejMOQPOuWM=@vger.kernel.org
X-Received: by 2002:a17:902:f54d:b0:223:6254:b4ba with SMTP id
 d9443c01a7336-2319811f06bmr51131025ad.13.1747233019581; Wed, 14 May 2025
 07:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com> <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 May 2025 07:30:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaiqwZsWJ0JdLrmfm1tVbG9dmi_jN_7one02OdV+ecow@mail.gmail.com>
X-Gm-Features: AX0GCFvLrY-v4BVXb_MRFpcALF8nRN6RsNjsWBFIx-m74SsDyBv5AvTCKf3v9G4
Message-ID: <CAD=FV=WaiqwZsWJ0JdLrmfm1tVbG9dmi_jN_7one02OdV+ecow@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 11:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
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
> ---
>  drivers/gpio/gpiolib.c | 6 ++++++
>  1 file changed, 6 insertions(+)

FWIW since it's changed slightly from the last version, I re-tested
just to be sure. Still works for me. Thanks!

-Doug
