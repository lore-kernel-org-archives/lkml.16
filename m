Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC982949F4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023625; cv=none; b=QvZPJCuqdqUwRV4/Uw66Pyxweczea1yglo3a9O5eWv8n7VgzbUZrCdbJtjEYhkWep7ByJ7cdEYAI89/HchZArHLMhFCdt8RTHS/iF+FdcCKBbEY2q4NOJCzTi3/Q1i5KDvXXWg3wajq8rVq2O2EvO7zPPbeHdIeiNW81ItdIiBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023625; c=relaxed/simple;
	bh=uFEV5RoLkGLfqQGQzLaPIZyVtjmDdyEpkPLS9ZeaCOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiaDJ0NGzvssRXwhy6nhZtRGlvA4i2Eviu5hdgu3U8ts19UbHmqEt1bi8/XvWOrYoRuHBVoSPly1Jn5xkyW6rPlz3+nW+BJORNKNQ3tuNhz0HTEHJ/nDBP7XlIO3W/C3HzYcfMJ7ZRZQUSq0l2Jkmv6M7JcPb3BQoWC5EueTd/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q/id/Bzq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q/id/Bzq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3105ef2a071so1215211fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748023622; x=1748628422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQeY0iIN+5GZNG+0tyR2awygnQMNrIb8aLwJMVvtPFI=;
        b=Q/id/Bzqp4PUAm5U60UXcbHpYr31hcUgcFmfGEQEHJ91//aEkJ19DRG+7QT/wEeBNK
         aT+RwW99kVnjNiO1Z5V+UdN4YHNItX8kmU2iKHgkb7WNmB9EIVA7fTXzcL5XM0WpUpb9
         VHjP3KeKj05iCgQPu0Vx9QgzSEkWQQ4jiYT038+9X78P4plepYuZk8JAjQ9eLeYMFLgH
         zfxswCHbVa8RiaIXr/u+nNcC1X16L0wuH06KBNAl4ft3EpXPv4ghXm47WXMUXu7nNzeR
         CZqJZrrMswxaBcg2++ZTHrtolyS0X8xBIrNf8tCR2U6hV3a/mJl1+VPd3YydePOR0IKk
         yBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023622; x=1748628422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQeY0iIN+5GZNG+0tyR2awygnQMNrIb8aLwJMVvtPFI=;
        b=ZtItFibOPwPZFTiZi/1qsusOV+JuZVOCJbImFexD8WUtu+CuTu+QLmTtlOEfjOQ5Ww
         fGnBM+s86vMPl6cUf6JHIif/hUrIymoGT7ahBMywKUfaP3ro/bnnqKBrl54fvCeIsgG3
         EvLdSnBeUABUJDO5V3Uq1247UnG17DL3e+HnlAvxKQ+XW68Cs7WlmZ3bPNVeVG63ut5P
         uPoJpPmbbs/4yykeDJkBjJayrbQLzKnvN5VFOE9nWsVI3Gu5mxjVWuZalMzr6k0YuL5r
         +wTHziNlIwzrpEg1SKLDtqMIM6gabpqaidaxWHpp5YY1jb+VUQyVNKIvtWlwZ/sppA3R
         /zHw==
X-Forwarded-Encrypted: i=1; AJvYcCXWO6fQreau2lKmrhVaTraQrCe3aDDzK7LPvUMAzT5D7BLMrM2rqr5oqxbJjSlu+nugeBNMxirrDCyWhvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJQ+11ITUgQaTDvD+Jn9GuY85z4VlSbIW8BcBP+R7IeCOhYyr
	Onung/rcgZly5L435XAGpmRoaclSMYP4jE7xOvKh7tpj1zP05v8LQh1VTjSiNf+Qu/xDVQl9V5W
	koV4qy2ABmSL/2hRfeIfxNWnn6VdGIccSuuY5ZUQj
X-Gm-Gg: ASbGncsH7EHohJSmZEaAO74WtLAYOoZ80EbeysW6wrYYXN6JUbWUntqd/++p/NpB901
	05skQFprNSUQEtAOxPAV6WgJUyYltBlygnvsgizNbc37q3Qqc1BOqK+eK71CzpjjeXJ5/+PvOsM
	t3Z0x90fGQYHVDdESzYJDrAnGv2F8LEJTn5uu+MYlb1w==
X-Google-Smtp-Source: AGHT+IHnjp9T1CiF3zXUGrVrt9+40P6mtBZ7VGoSvqkcTrUQnB4/c0BQtPeaRLMgOef5bXI10oH49TBo09PLGFm4IkU=
X-Received: by 2002:a05:651c:3048:b0:30c:189d:a169 with SMTP id
 38308e7fff4ca-3295ba6dcd7mr470021fa.25.1748023621621; Fri, 23 May 2025
 11:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org> <aCUkN301jWUkXJ3_@google.com>
 <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org> <aDCrGT67ubNNUoUz@google.com>
In-Reply-To: <aDCrGT67ubNNUoUz@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 23 May 2025 11:06:24 -0700
X-Gm-Features: AX0GCFud2nCrPMyuCZEHKFYx0zIOalx0cp0aPqDJ0Dgkc2YdrTSGRNkye6koVas
Message-ID: <CAGETcx84OfLNRjMNGh4jS54_DgRuXx+gF5DhfiGrgckoyOfTMQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, John Stultz <jstultz@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 10:06=E2=80=AFAM William McVicker
<willmcvicker@google.com> wrote:
>
> On 05/23/2025, Daniel Lezcano wrote:
> >
> > Hi William,
> >
> > On 15/05/2025 01:16, William McVicker wrote:
> > > On 05/13/2025, Daniel Lezcano wrote:
> > > > On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > > > > On Tue, Apr 15, 2025 at 9:50=E2=80=AFAM Daniel Lezcano
> > > > > <daniel.lezcano@linaro.org> wrote:
> > > > > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > > > > >
> > > > > > > On Arm64 platforms the Exynos MCT driver can be built as a mo=
dule. On
> > > > > > > boot (and even after boot) the arch_timer is used as the cloc=
ksource and
> > > > > > > tick timer. Once the MCT driver is loaded, it can be used as =
the wakeup
> > > > > > > source for the arch_timer.
> > > > > >
> > > > > >  From a previous thread where there is no answer:
> > > > > >
> > > > > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa41=
3@linaro.org/
> > > > > >
> > > > > > I don't feel comfortable with changing the clocksource / clocke=
vent drivers to
> > > > > > a module for the reasons explained in the aforementionned threa=
d.
> > > > >
> > > > > I wasn't CC'ed on that, but to address a few of your points:
> > > > >
> > > > > > I have some concerns about this kind of changes:
> > > > > >
> > > > > >    * the core code may not be prepared for that, so loading / u=
nloading
> > > > > > the modules with active timers may result into some issues
> > > > >
> > > > > That's a fair concern, but permanent modules (which are loaded bu=
t not
> > > > > unloaded) shouldn't suffer this issue. I recognize having modules=
 be
> > > > > fully unloadable is generally cleaner and preferred, but I also s=
ee
> > > > > the benefit of allowing permanent modules to be one-way loaded so=
 a
> > > > > generic/distro kernel shared between lots of different platforms
> > > > > doesn't need to be bloated with drivers that aren't used everywhe=
re.
> > > > > Obviously any single driver doesn't make a huge difference, but a=
ll
> > > > > the small drivers together does add up.
> > > >
> > > > Perhaps using module_platform_driver_probe() should do the trick wi=
th
> > > > some scripts updated for my git hooks to check
> > > > module_platform_driver() is not used.
> > >
> > > Using `module_platform_driver_probe()` won't work as that still defin=
es
> > > a `module_exit()` hook. If you want to automatically handle this in c=
ode, then
> > > the best approach is to follow what Saravana did in [1] for irqchip d=
rivers.
> > > Basically by using `builtin_platform_driver(drv_name##_driver)`, you =
will only
> > > define the `module_init()` hook when the driver is compiled as a modu=
le which
> > > ensures you always get a permanent module.
> > >
> > > [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1=
-saravanak@google.com/
> >
> > Thanks for the pointer and the heads up regarding the module_exit() pro=
blem
> > with module_platform_driver_probe().
> >
> > After digging into the timekeeping framework it appears if the owner of=
 the
> > clockevent device is set to THIS_MODULE, then the framework automatical=
ly
> > grabs a reference preventing unloading the module when this one is
> > registered.
> >
> > IMO it was not heavily tested but for me it is enough to go forward wit=
h the
> > module direction regarding the drivers.
>
> Great! Thanks for looking into that. I'll add that in the next revision a=
nd
> verify we can't unload the module.

Daniel, is the module_get() done when someone uses the clock source or
during registration? Also, we either want to support modules that can
be unloaded or we don't. In that case, it's better to make it explicit
in the macros too. It's clear and it's set where it matters. Not
hidden deep inside the code -- I tried to find the answer to my
question above and it wasn't clear (showing that it's not obvious).

>
> >
> > One point though, the condition:
> >
> > +#ifdef MODULE
> > [ ... ]
> > +static const struct of_device_id exynos4_mct_match_table[] =3D {
> > +     { .compatible =3D "samsung,exynos4210-mct", .data =3D &mct_init_s=
pi, },
> > +     { .compatible =3D "samsung,exynos4412-mct", .data =3D &mct_init_p=
pi, },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> > +
> > +static struct platform_driver exynos4_mct_driver =3D {
> > +     .probe          =3D exynos4_mct_probe,
> > +     .driver         =3D {
> > +             .name   =3D "exynos-mct",
> > +             .of_match_table =3D exynos4_mct_match_table,
> > +     },
> > +module_platform_driver(exynos4_mct_driver);
> > +#else
> >  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> >  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> > +#endif
> >
> >  is not acceptable as is. We don't want to do the same in all the drive=
rs.
>
> Are you suggesting we create a new timer macro to handle if we want to us=
e
> TIMER_OF_DECLARE() or builtin_platform_driver()?

One you convert a driver to tristate, there's no reason to continue
using TIMER_OF_DECLARE. Just always do the "module" approach. If it
gets built in, it'll just initialize early?

What am I missing?

Thanks,
Saravana

>
> > Furthermore, we should not assume if the modules are enabled in the ker=
nel
> > that implies the driver is compiled as a module.
>
> Ah yes, that's right. The ifdef should be checking
> CONFIG_CLKSRC_EXYNOS_MCT_MODULE.
>
> Thanks,
> Will
