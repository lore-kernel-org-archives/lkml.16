Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697E242D8C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780503; cv=none; b=iwtgf0CY91gIf9A09qYSrYcAYiksheDK4ATKzKCtUtKvg/ARl0XoufmaTpECYb2MbTghULpG/PY/U6SS5WcJjVGMX79SSpkU/pTHDuAuyjPQp/Zp0h5I/qkKuwZKSulZ3To32X0MuH/3p9N3Kjm1zCq8EEk2F/cWu4evTSk6PHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780503; c=relaxed/simple;
	bh=G/qZCh5e8IqALffgL4PSg+SILS7Tze0xhMEWFjvrHHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBWntCSduGtnQvZBwVIAy1Go+j59Z9Uyi//BxOxwqV4SPZ7IaCfT9JONjVMDnY136dUp0WR1qT3BtaRLrbXpC01dHvCu71WP/6Z/fIWL3sFkc9yxIgl7x0gTEMnpNkGaL/83nF0OTXAjxCZPd9Pd/FSRwkrcrrYocmTG5pM/zLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0Dn5uB9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0Dn5uB9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-327ff195303so51849001fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780500; x=1748385300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
        b=e0Dn5uB9ac6prNeknALYJ7BuoRdeXIG822lQ7EoN8W8L5SozhHYtBGB2I6LKni0mGe
         E7MD/mPwCytlOqlj8wMDB843N9KmeUmrB3ecItahrETSO8xL4cFwcVeEctsc6IiQ5bH0
         AWU2SWuwWWBwrOqHU7WBxmpgG63EgMyHpeHSwLgqnV7uks9w/roBzJZgfK8EdxL1hLj/
         ioXDj8hzoAqCZ1Pez9SQbGpavb/gjupacpdHzDbJ6pq/zj/GveQ8k9XP/fg0/TLnJno9
         1Su0Fm99xwI7072qpMDVrh9tscWjLloaCtPOyzYpNLX2dRjOYiYkkXpxPZcwhDH7KFrR
         +kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780500; x=1748385300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
        b=mjRu1xLi4lL/dVwk72veehek56gzgFMrqUnfajXxPOOfHwrc8UWeB0Ah5rpmYWIaI5
         Nbc8t2yv9c5eD2WzVZAgrZ8+2hP8YkqWo1byv29u2YS5ZuwkOogtao3X713/2nfL2PJb
         W/hDmMeH8gLVrmggIWafNn5RWBPRgYAjgdtHy9HLjTWy6oOzACKPbZtQWKpTOe7JRHq8
         p70lkgAtb1eTfwrhQofjOADlYnMXzN3D4w8Y1nqqHI2+PsfzT3cujLeDecsd9Y+vbXrc
         cKZAaEpGyJ6dBzx2OfHB9/bjEmL0GYCmRM7gEnBC1vEfxbTh+bJ5XM77t5B69Ac0+W7e
         uArA==
X-Forwarded-Encrypted: i=1; AJvYcCUowT9end2WBH7ICWt8/Tp8TZmLullYEsDnhd+opcR5VsxfjpNiD3I3oYpjz/waGMMJZGpsT44hn5dGeB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIopNknAincUCoJUsjjnSJGNC09cofiJq/vkx6kgqr6CsNSf3Z
	7FSmhmzjTxPWGHRxNRgx//liO7x0S4edfgVl+j5dyv+f7GIyVKm6kewShBGGPIhlTV+XjBXlfyr
	SKvHMoDSWE8dMuL7G8RzsAnb3wyhv1D5YrftsVVPQ6g==
X-Gm-Gg: ASbGncuO3prhIPFiyprf9x6U7OaupS23NM3shP+o9pnspggH69Ecv2p2FoDtBrKeG+j
	dMiJNSM4XzS4idpiIN3LJgXA7Sn5H88FEMZr09pduamFhxrVzHglomPl+cBCuQH7EOS1seQxPfE
	T87GkVP2XCyw54QLJh+zTfn4n3D1ugdtQXKO429ghj6Xk=
X-Google-Smtp-Source: AGHT+IG3zE80N3OdjZZgIj1CBi8G4bnNpTjDsApWfo+qPPNIniOdUu0Ts+pT4sWio2WYX62CWpyx5h4GPmpl48aN4uk=
X-Received: by 2002:a05:651c:f0a:b0:30b:ed8c:b1e7 with SMTP id
 38308e7fff4ca-32807728eb8mr48465441fa.18.1747780499896; Tue, 20 May 2025
 15:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com> <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:34:48 +0200
X-Gm-Features: AX0GCFuW4vdoq3ZxavI5D-k3WcmH7E3A9H2e_P8Zln_7BppO66UxFChz04uYBvs
Message-ID: <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

thanks for your patch!

On Tue, May 20, 2025 at 5:04=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> This patch introduce the driver for the Hardware Debug Port available on
> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

(...)
> +static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +       return GPIO_LINE_DIRECTION_OUT;
> +}

That's reasonable.

> +static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct stm32_hdp *hdp =3D gpiochip_get_data(gc);
> +
> +       if (((hdp->mux_conf & HDP_MUX_MASK(offset))) =3D=3D HDP_MUX_GPOVA=
L(offset))
> +               return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & BIT(off=
set));
> +       else
> +               return !!(readl_relaxed(hdp->base + HDP_VAL) & BIT(offset=
));
> +}

...but you still make it possible to read the value of the line
if it's not muxed as GPO?

Should it not stm32_hdp_gpio_get_direction() return
GPIO_LINE_DIRECTION_IN if HDP_MUX_MASK(offset))) !=3D HDP_MUX_GPOVAL(offset=
)?

> +static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int offset=
, int value)
> +{
> +       struct stm32_hdp *hdp =3D gpiochip_get_data(gc);
> +
> +       if (value)
> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
> +       else
> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
> +}

Can't you just use GPIO_GENERIC for this?

bgpio_init(gc, dev, ARRAY_SIZE(stm32_hdp_pins), // =3D=3D 8
    hdp->base + HDP_VAL,
    hdp->base + HDP_GPOSET,
    hdp->base + HDP_GPOCLR,
    NULL,
    NULL,
    0);

The default behaviour of GPIO MMIO is to read the output register
for the value if the line is in output mode.

You may wanna override the .get_direction() callback after bgpio_init()
and before registering the chip, either with what you have or what
I described above.

Yours,
Linus Walleij
