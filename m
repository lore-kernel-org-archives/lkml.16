Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE525D538
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458642; cv=none; b=fnzHx1+xuNGq/V1WXqcEYrTLDWcsdoALJPIb088oUJbJqCnHrS2Kwx2wxn0AhCprxCy2aTas3nqexsUkGTYjMPDVTwA9dgED6hP0zAppfTV/XCTIjOm5LvKa4kbXG+pIp85oKpN3nwvlJhL4dvg+ZDtByyIY8w7acG+6UhM75bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458642; c=relaxed/simple;
	bh=0Hc+EQxJfioQ+A+gYtKFPWTxdD4hKYAgnVL1ELeokBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCpG4i4X7ylKKRwijrkSdiKLmmGRReo1+7KRknCBufG50BF6TmsCqK/3PTLGvudqvMg18h2OMB1CbqAMUwyIIPHNBFQfxmnaW16azc2xT85W8ShstrLNSp//jpbvKzMoXr7a2zb2bSJWdGT/p6nBX7S8JkDFD7iFO69T7skitfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NYO3r7UJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NYO3r7UJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2260c91576aso40538185ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746458635; x=1747063435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41acKNPFt0X3b8kDDLPn8SygbWrcPwUb5jtg+E40A3k=;
        b=NYO3r7UJwq830BNe48tsKwAwa6tHZJfoJug9+q5GkaVx2IH5YMfDpZ9Cf9BHr4t65H
         PyeZc3NrPtHfrnIN1gZyNDypUD8fB17BcVxPo6mUIM+oCRMfFmKsGxubBeSWB0Oqy+ZY
         6aRlO8DW4c+WJLN27fBY9F+J2utg/2Fc1itMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458635; x=1747063435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41acKNPFt0X3b8kDDLPn8SygbWrcPwUb5jtg+E40A3k=;
        b=T1rM6DY4MeMMJjYpLeE+UuRWFvlHxECKCpvVK+WwL+3NXZ8BxD+9iLyEmhTGodp0Ql
         Jt6fcJS2GyLYRNQ2hHBSkq2yzwm/pA/ejJuiQy8n1FWAYgVAAAgyu8sY/QKHBQwo2xTw
         5Y00O3WBJiD+ofJlGxKXwUcXSmTcKV83Ghcuin+df+71ybZJtXK2VohcUs5kCRqTd+F0
         ykwCezKriJq8USGKOzSguiVc/y61aunQFykcvufiY8PG0sSfdrnLamGWop142DBUAuJg
         c5G/wjkcLBcDBf+jZ5ed3CBSYEDGov+MS8nRsKoU7iETDEiKTr+sehR71AUjAdvoX3vn
         oZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXuVkHP8J7Uoy0XpKpjGXMUjuCjuxJF8XVA7kdXJHoonv+F2rGzbd+dPMlA7gM8I45CW3USFpljmll+8W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHIYj9rbjeytt/uyLvPJ0oxIUT+HYPLkcPZZr81BWApqKYADx
	onpWdAm+3uWf+ZiSdiU6SUwsUo5OeAWaVZSNJhNGdGGGQ9QWhorLTUXSRVKBdS4wAdX8PRGcD34
	=
X-Gm-Gg: ASbGncvpxNkWyJ27fnKWol6ZFGBMcEQoL+2M41eXEIseuVWT/rRV2JXEZDVpymKCtdK
	wj/oV478PErmip1I63voQNKiccuquQyxfvNotifUUkPcXwZmxA4T2rB92JOLxU72UZ3yPKpALQ5
	Dev2YcJJiFAQLLKEI4LTtR/vfwlyYHjRygITApHsDHBndM9M6NExMZZN/dkv0hZOFPnwg9bu/RN
	FpIFV0YFGBCLT8L0TMy2zstRAsHevrpZsryL9z+4dXY/GfliG2gl+GizDj6xxDOORKgYE2AlIS0
	/1XePqHqJRbX2/6f7o0IxMyWMW+uM/QcO3Oe/4OXIUQJh8y0Cbdlnjby/vVCY7XSEY2FN+RPlS3
	dkZAm
X-Google-Smtp-Source: AGHT+IHHV+LPQ/eGyiQUI1JgYsrnmeRI+UpdHyrCw8rfKQqHavdbucf4Y/8eeign5ezDl64zB5JgUQ==
X-Received: by 2002:a17:902:ce12:b0:224:2717:7992 with SMTP id d9443c01a7336-22e1eae4d3emr111947295ad.33.1746458635625;
        Mon, 05 May 2025 08:23:55 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151ea213sm56336755ad.94.2025.05.05.08.23.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:23:53 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-308702998fbso4151672a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvxbtNZtb+2WmeGdohYLrwBEVGsmZJPlA56GErmdNzZKDaEIQjwe/JEyCA63oY/tHKx1i2lgIFp2zkWS8=@vger.kernel.org
X-Received: by 2002:a17:90b:2692:b0:309:fac6:44f9 with SMTP id
 98e67ed59e1d1-30a61a5de18mr11215640a91.31.1746458632939; Mon, 05 May 2025
 08:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com> <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 May 2025 08:23:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHhND2o_uAaGNe4RzmfbuO5bR6h2hYhs-cfsBzCfR=qg@mail.gmail.com>
X-Gm-Features: ATxdqUEU--2tfIQF8wAYYjbyZfA85xc3-X-O-5P-ZKl511Bl7WUYcv0F-TnAYZ8
Message-ID: <CAD=FV=VHhND2o_uAaGNe4RzmfbuO5bR6h2hYhs-cfsBzCfR=qg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 10:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gpiochip->gpiodev is not NULL.
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
>  1 file changed, 7 insertions(+)

So I guess this is fine because nobody would specify a hog in their
device tree that's an invalid GPIO?

In any case, this works for me. Thanks for the fix!

Tested-by: Douglas Anderson <dianders@chromium.org>
