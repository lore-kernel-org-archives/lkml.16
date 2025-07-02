Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBE1CFBC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483276; cv=none; b=VuCgMn9x1/rW/XL8P6Zsxntd0obiXGO5Bs6dRdnmtdn0PUNqmKBpxxxGz6E6f+dkFsX9TN6/KVseuhdNylkfXbQkfHZsNQQiLvqWcUcJM3WR6GdgmyixCcj/yAZheAMXSJH+oTM+KTJ3ac5z+33QvxzJquObmU8dEAbCnq/tn9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483276; c=relaxed/simple;
	bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4/gcIB77n3CQuCDMpsa/JJgfr7gI2N1D+zCwStIfYoB58AOzr5qkfxerQiXVDnK5v6smVZcKcq2JuRfKqoT/6Yw/j6E0XPIvONkx/2QZBbIvPmDcCSc4hYhDNufOtPkZ9an9yn+llIawSnNhKWLPD6pHzPHS7tHe9k930ibMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=EjNwwZ/l; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="EjNwwZ/l"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e5e6ab7b8so67819807b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751483273; x=1752088073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
        b=EjNwwZ/lQ6bz/Hl6hZjIiXD/AtdivpXTFa/VbJwd1FT4kMGQLYpISogicM8bLrH7xv
         QIE0TlBk5JsetkKOzVNcsHzSGbS+pNurjyQSQMO0ZQv5kTG3kl8kjvWQrr1Q9ENI7wTe
         T8hVKCWRLPZ4wVn0QDFMZV+RosqEm1r/VNceX1Qdzab51BS59iY+XzxCSrmvR4GiqI8a
         DYJGSxDz7hPDlEwcLUBGud8Y3ZnwnvJwtOYruh6funlZSf90+QQV/ZOUtmC17yhmboGr
         /0MeE1WcOGuPm60Rn16s0nfjN31dERN6Srmsbj9LpZDCFQDL9TaWOz1T5M/5dvgXGsK+
         kJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483273; x=1752088073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
        b=wsp7h5N0ucOms+L7kGf7Xsfh+J9P0IgZKYpV6EFYIIl5/BuUjUY8kcIi0kIm15lePd
         L70zopmuE+Bqr6Iz7RQdupIogdccyYnqAVIhtX30ck5YR7JMBgIdQodqbA3VCKElUmi0
         BZ0G5V+w7Yx3UO9yJkfjWaZrPX2efpadfAubusHSKQdjbGTylqDV++SOVK+odPnJ1k+f
         MFSbnNpC+kIfIcTzcR3/31W2kZjdzDKPZpyQgoTVE5wygr0A5N+UM4EpU+NA6P/LF0nV
         zhY52U6MM6X/L4SBLNlajitD9B2ZClKr1UNgWFF1TFr+F8GCu1Cq0O9U+RUFMPXJBxZf
         Y1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUPS/IOFKACd84lTx14q+CY5UnB5pnYG9Qk0SCQCImPvvzngebAqa7h/LmXe7Ep3Iu1GhAKqygpz9y/Tmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgnw5VlvPrvAl8Ww1wandDJ5/VIEUw9R1kiJKNarTHRk2Qv5Le
	Jp9kvegdFZuPe6IMkdXvXd+3JILUk2gxHe80uyVJk4BXCWBUXJ0AI8cS36DZbMOgHuV1rP2ZzoA
	KtClfMpidHvKTATcXCpPlUtFcPk67vEHNz6eiHaIz
X-Gm-Gg: ASbGncuCsaZSjBCIgYPobmIadFv10WyviSSWrrikBYTbr8NOKYdHUhhrcuQzl4ADFsT
	Og2yCAd/KGY1dncQV6Qgh/8tQ31lLbIIqU998y3DRMFqO6BaZaz6rsyFQFqHRRmCdIZDsRz06UC
	2bLfBzWUcUVjjaoBe3PySXqGFIlcd3KVUTBe+56ZrR7LDBrFHZa63pUZHieeF5OPuS5WZsJXiO0
	3fM
X-Google-Smtp-Source: AGHT+IGHElWqxIych5glg28+DrcUG1t7PUSfK4vTb3oHxY8WbSGSMjUbaCvnzu+2LABndjMybYrTqRZBHCrBQIwHt/8=
X-Received: by 2002:a05:690c:64c7:b0:715:1696:aafc with SMTP id
 00721157ae682-7165a3380f6mr3176317b3.12.1751483272654; Wed, 02 Jul 2025
 12:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
In-Reply-To: <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 15:07:42 -0400
X-Gm-Features: Ac12FXx0jufvdl6aujys7rH-wYZHUiDrrOxM3msmfy3FnqnGlyUndPFaQqBHPFQ
Message-ID: <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>, 
	Anand Moon <linux.amoon@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 2:40=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> wrote:
> >
> > On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
> > ...
> > > If, as the description suggest, the regulator framework somehow ignor=
e
> > > the timing set in DT, maybe this is what needs to be checked ?
> >
> > The regulator framework only cares about timing for regulator on.
> > Regulator off just turns off the regulator and returns without delay.
> There's an exception to this: gpio-regulators without an enable-gpios
> property. My understanding is that regulator_disable() is a no-op in
> that case (meson_mmc_set_ios() even has a comment above the
> switch/case statement), see [0].
>
> > The code makes incorrect assumptions. Then the kernel resets the board
> > without having enough time.
> Can you please name the board you're testing? I'm worried that I'll be
> looking at one .dts but you're looking at another one.

https://github.com/libre-computer-project/libretech-linux/blob/master/arch/=
arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi#L481

vcc_card is a gpio regulator that gets toggled on->off->on.

I traced the regulator framework a few weeks ago and forgot the final
regulator disable function call, but that call basically returned
immediately while the regulator-enable function complement had delays
implemented.

>
>
> Best regards,
> Martin
>
>
> [0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/core.=
c#L2980
