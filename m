Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E8C28F92C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745539209; cv=none; b=dOl5rtQRBlXi6yqgK9gheUmK4RO0Rb/A9Rp/SCRK27byA8UMCcYLOXL4Oy/i+Hvfr+7DJMCPCl9askTiLekmdIzUAsLy8YEijeRBosYdPulojDWQg2BqZmCVvJ+w9mtqJ91i0iNWIqE4mVtT3uoBM83uOkqRCs/Sl/KQ4Hye9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745539209; c=relaxed/simple;
	bh=vHC2Fialn+RBwWADCJLgjxlhFgP4qJcPI6wMRIGgl6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avTQUed7oGSYGl44WXjKWFbUAOpGBtuXC22GjCsd19HXIpuGCLlmbEUlQbjgy2Dxuu1D0WNBu3MyNWFX2P2ZDm62rNBiUmHRDoujO+DiycvxcLnmMUodKTSMyKGDwtIKkGa6eF6I1t7JU9AgLbnRpw5VeLWpZAy3fdJ6CIm3gnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b9IjnDkP; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b9IjnDkP"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso17682621fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745539205; x=1746144005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FftYyfnx4PhBWIFq9zmRpoZav7WGa4elGHeCCecG/Q=;
        b=b9IjnDkP2jpDZ2X4ZcEoHdyyDdL33mw4GZkAjyG2N0UluxMUkKKE1Obh8nhtmthzRL
         28f1VDEjDtPheUpmQlF8SL6bcFSFEqrj60kOwrTRJzLfynU45WOOhInYx5XRObr7VpXU
         o6pwHnTy4ceTJLyTczPQ2Yqwz0iICwKjzZqeuWE1xgTwB2G0dyMVQNG9gW7+DnyO8Gd0
         HqUunZ1Sdz4c3rPZsNJRLIxn0CCTe2a3NZT6ogTIuq1gSANwlN05LRWIjf+n4OxRr1VB
         X/rXGXJbpVPTltapSo437AIVXX51pdD4+PgYz6g0f9Vm3uYiL+u//UW8SA/WSogOXJ8u
         Bvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745539205; x=1746144005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FftYyfnx4PhBWIFq9zmRpoZav7WGa4elGHeCCecG/Q=;
        b=vS4wFgHlX3qr8a2OrwNpRe8kIh8Xrn1OGitJZQogjlBTu3f14If4XE/8vZUAAEJKTI
         Ps56Tu+0/xZqHv9i6MDDEF3MWi7GkWtmm17iTboa9KhbbjwcXV92HISmRxEGoOlqbEAu
         8TPNSYgtVGg/UntY5bQmo7uYOxKI5WV4COodr5hSYeVk8fgR86VsfWiL+IyPDUhwi124
         w7OtSVt73frYMIHsFEsZfltd9+l426W6ffHmvJVFSegVKFQrIdyNPMx7HLEx5bMl527C
         bAxpaaApOGMLqD61itEyIpH9K+F8Ivvaz19u+EkPoD/ITm+jF+n9j0KZOlJNuc7q+9fR
         GttA==
X-Forwarded-Encrypted: i=1; AJvYcCWCdXCOLlaCvWhEBJZ+9fdyph5CSTVqB2dbMww4lKC9bdydN1yHjVHGgjEIuAA5pEhTReymZAksw04gbc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCsOmHxCAeOmxQmrGrYsJgpqFnjmJYQUVkUYM3Zx5cZlAXL4y
	sGWYnM+jEvK4SMzor766ZpemWepTECBv5knojMwpUptvcT2OKvGdqPMgDV8ZnL8PB49Z8lh2R2S
	1U4kUNI3dXDeZmOWYFBQR0CpcaEG66bZlQxM=
X-Gm-Gg: ASbGncviebQQQvt7WEooibS52hhn19gp9Qii+J2cNDEKaEAPO3y+ALzfLv/VCQ4KNwj
	oZdGBZe01SHEjKBNn5+1EY0vQGKnlF1BsNRLjBC5T540bkaktlH5hAEs1XcWGlLoxTjlLRq4Sq5
	kK/J8LtDM7LgsAkWh0wKt7xxXKjLwxSzsS7Ok4+uZ3TXz+yf7rfX1x
X-Google-Smtp-Source: AGHT+IHUb+9DHnpQWMtMnEQsoR8OYlUukdfalcYgiX5ksOFAvXojCtQlbyhOXYh7owCIQqLcMO2uIVabYUBJc6/xzWI=
X-Received: by 2002:a05:651c:12c8:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-317cc3b4babmr14466291fa.3.1745539205361; Thu, 24 Apr 2025
 17:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424144819.24884-1-suhui@nfschina.com> <20250424144819.24884-4-suhui@nfschina.com>
In-Reply-To: <20250424144819.24884-4-suhui@nfschina.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Apr 2025 16:59:53 -0700
X-Gm-Features: ATxdqUHrZ1NYkjLcXJ3ZYhkIKgdJRAIjPkmrIN_DeEv_VI-YVwb7mz1hJuTvYEM
Message-ID: <CANDhNCq0yOXRF+6_JaMYo98o5uKP_af+UXJcJmzuFvX63RdTaA@mail.gmail.com>
Subject: Re: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to guard()
To: Su Hui <suhui@nfschina.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:48=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> There are two code styles for the lock in alarmtimer, guard() and
> spin_{lock,unlock}_irqsave(). Switch all these to guard() to make code
> neater.
>

Thanks for sending this out! A few comments below.

> diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
> index e5450a77ada9..920a3544d0cd 100644
> --- a/kernel/time/alarmtimer.c
> +++ b/kernel/time/alarmtimer.c
> @@ -70,12 +70,10 @@ static DEFINE_SPINLOCK(rtcdev_lock);
>   */
>  struct rtc_device *alarmtimer_get_rtcdev(void)
>  {
> -       unsigned long flags;
>         struct rtc_device *ret;
>
> -       spin_lock_irqsave(&rtcdev_lock, flags);
> -       ret =3D rtcdev;
> -       spin_unlock_irqrestore(&rtcdev_lock, flags);
> +       scoped_guard(spinlock_irqsave, &rtcdev_lock)
> +               ret =3D rtcdev;
>
>         return ret;

This seems like it could be simplified further to just:
{
    guard(spinlock_irqsave, &rtcdev_lock);
    return rtcdev;
}

No?


> -       spin_lock_irqsave(&freezer_delta_lock, flags);
> -       min =3D freezer_delta;
> -       expires =3D freezer_expires;
> -       type =3D freezer_alarmtype;
> -       freezer_delta =3D 0;
> -       spin_unlock_irqrestore(&freezer_delta_lock, flags);
> +       scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
> +               min =3D freezer_delta;
> +               expires =3D freezer_expires;
> +               type =3D freezer_alarmtype;
> +               freezer_delta =3D 0;
> +       }

I'm not necessarily opposed, but I'm not sure we're gaining much here.

> @@ -352,13 +347,13 @@ EXPORT_SYMBOL_GPL(alarm_init);
>  void alarm_start(struct alarm *alarm, ktime_t start)
>  {
>         struct alarm_base *base =3D &alarm_bases[alarm->type];
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&base->lock, flags);
> -       alarm->node.expires =3D start;
> -       alarmtimer_enqueue(base, alarm);
> -       hrtimer_start(&alarm->timer, alarm->node.expires, HRTIMER_MODE_AB=
S);
> -       spin_unlock_irqrestore(&base->lock, flags);
> +       scoped_guard(spinlock_irqsave, &base->lock) {
> +               alarm->node.expires =3D start;
> +               alarmtimer_enqueue(base, alarm);
> +               hrtimer_start(&alarm->timer, alarm->node.expires,
> +                             HRTIMER_MODE_ABS);
> +       }

Similarly, this just seems more like churn, than making the code
particularly more clear.

Overall, there's a few nice cleanups in this one, but there's also
some that I'd probably leave be. I personally don't see
straightforward explicit lock/unlocks as an anti-patern, but the guard
logic definitely helps cleanup some of the uglier goto unlock
patterns, which is a nice benefit.  One argument I can see for pushing
to switch even the simple lock/unlock usage, is that having both
models used makes the code less consistent, and adds mental load to
the reader, but there's a lot of complex locking that can't be done
easily with guard() so I don't know if we will ever be able to excise
all the explicit lock/unlock calls, and the extra indentation for
those scoped_guard sections can cause readability problems on its own
as well.

thanks
-john
