Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B2194098
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999435; cv=none; b=Ae5gjzNNH7Jkoel8R+iQbdH7KYoi6Q4MaZe0xeEZlz5iHsmHS//rCFe/wPZpvFk2U81XHTsFhGhvId6/vfcXAEDmJe48ix3/IlRfrBx0V6Za6iZBmhKw7cwL1gVEYXQJMGkXtJH7cI0zw/OPoCETNxtc4/Am+GSAApb4w2v3SFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999435; c=relaxed/simple;
	bh=SXpaVowOjROKHvD2g7AaoOxQ67iSJN5+F0KXnXlPtX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX1lNDFbS68dOrqzZaAz0+gdVyoKtV6ODCSZH4SEqinZJ6ZuteiI0zxWrIz0laehD+xZxY6YZs5sgTneFKwKQLs9dY7ZFu1e3EMqbV7Zs8AaSFi9vxUI4UFy9mkdZsyMSKLyyvqouz3PxdDUr27rDoXF+0gl04sz/xYgG+XRddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=haRnRn2d; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="haRnRn2d"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32cd499007aso10131151fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750999432; x=1751604232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxPgQ7YUs21ZfESgNsIrJgnZYu8Jg67aIbBn648ji8M=;
        b=haRnRn2d58Yfsip+nrXshivEk1zvZtov3Ri9CtI4G0iWk4eZosMp1GaGvyDf4lX3VP
         7A1fd8lcIUbLfxxVAKcBuNA+yVrYQHurKS9L3ot9Sf0N5zl9ztoTq7wG0xSFwuP2QCf7
         uwruHmEIhOxIRiq3lu7/r8uKRCivKdKq3LVGpdEjUHciHOG6B/Ag+GWx5hTsmaXL5NZs
         xhtXgKIQ/OCHf/+UG9mKX7O6o3xVO41MW2mGT7UwJ0PUtfTRgKJzphPYK7LTwqQXmmRU
         VDLzWCDJ4+f7NwemJyomM4+dmx/THgyMHPEj904mCLlq9sCm+sgCz8fyltfGANtjXhQA
         lcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750999432; x=1751604232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxPgQ7YUs21ZfESgNsIrJgnZYu8Jg67aIbBn648ji8M=;
        b=gcqoUYxgIexpdBTVZHq5HviFuJuKPzYHlg5W0SH/DB97NmFVi9GrQQK8foyHeAqW3P
         BQDCN8zpxdXax7BZ8LC68p42Naa3iMDCHEYb0Uiumr52VQNqIDum2LgVOc3jnLryKnUn
         +rtrMp5iFBN7AyGzi+eJbatc/+Ymi/2HhzZF9hFiNvrtA8n6/bcOQoPQjUMosq7vVmyr
         0Lh6RC+qvV6BeSLgKK5Hlmx18xYJR0uOE8wMSrDgL6tVWsKQtNjCa74CrxlmLKao0xeR
         lIMHk95SALd7wZBKV9SvmbTgx9D4kEfq3l+YD3SNGdnadBW9y+ZsefdCaIOtO2SfYH90
         iZBw==
X-Gm-Message-State: AOJu0YwzZUjioKvcy8SKRqlO3eI1dOi/cWCTs2+uxbWrMvkWt1FSiec4
	xj42GrTiEwL4c7Uy+LSreQwvBmn155fiam6zngpCsU/NapHNFLIhiB8PujmySSZ6UOPrrxp+sVj
	pF+FAbF5pF4Qgso1YxQ8bir0mmLfXwYpIpJJSvPNTMps0rf4SdyP1klU=
X-Gm-Gg: ASbGncs5qPDP1Wjkw8mC389hNxwXW6Dnjy4E4rBA85okRn/qj95Nqx4r1ie53MKuA7r
	Y815C7398bIeSnmYzASa0DPmEJpk1Sdy85vGABCvAWk1+8ZBb/2gRh61S7tSuRSMUc/9ezd6F1w
	ziOEDxnC0KHlUlHFB1vTHRWPUFoM9xXYmmtpk67tiwZj1JuAVe+4AXNY19BlsNRyzsYgYyfwzK
X-Google-Smtp-Source: AGHT+IEJJskJkIq/rBPDCOQfkGK9/Z5x+dlpvposQwrNHH1cCAWTKZ152aNAZQbtOKXqX5n+tdSL+eqcG1ys62JJS3c=
X-Received: by 2002:a05:6512:3b0c:b0:553:3621:efd5 with SMTP id
 2adb3069b0e04-5550b87b616mr612145e87.16.1750999431682; Thu, 26 Jun 2025
 21:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183757.803890875@linutronix.de>
In-Reply-To: <20250625183757.803890875@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:43:40 -0700
X-Gm-Features: Ac12FXzxzb2F3LJMt-X1SlkA3_Sy6GTLLbGhXFe3WHH7ObEPrc8R9eRDfCgOAI8
Message-ID: <CANDhNCqLST-im8WJXTWPsXmqhq2JM9+nVB6phixxH2PT-tQ3Tg@mail.gmail.com>
Subject: Re: [patch V3 01/11] timekeeping: Update auxiliary timekeepers on
 clocksource change
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> Propagate a system clocksource change to the auxiliary timekeepers so tha=
t
> they can pick up the new clocksource.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  kernel/time/timekeeping.c |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> ---
>
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -119,8 +119,10 @@ static struct tk_fast tk_fast_raw  ____c
>
>  #ifdef CONFIG_POSIX_AUX_CLOCKS
>  static __init void tk_aux_setup(void);
> +static void tk_aux_update_clocksource(void);
>  #else
>  static inline void tk_aux_setup(void) { }
> +static inline void tk_aux_update_clocksource(void) { }
>  #endif
>
>  unsigned long timekeeper_lock_irqsave(void)
> @@ -1548,6 +1550,8 @@ static int change_clocksource(void *data
>                 timekeeping_update_from_shadow(&tk_core, TK_UPDATE_ALL);
>         }
>
> +       tk_aux_update_clocksource();
> +
>         if (old) {
>                 if (old->disable)
>                         old->disable(old);
> @@ -2651,6 +2655,30 @@ EXPORT_SYMBOL(hardpps);
>  #endif /* CONFIG_NTP_PPS */
>
>  #ifdef CONFIG_POSIX_AUX_CLOCKS
> +
> +/* Bitmap for the activated auxiliary timekeepers */
> +static unsigned long aux_timekeepers;
> +

Nit: Would it be useful to clarify this is accessed without locks, and
the related tks->clock_valid *must* be checked while holding the lock
before using a timekeeper that is considered activated in the
aux_timekeepers bitmap?

Otherwise,
 Acked-by: John Stultz <jstultz@google.com>
