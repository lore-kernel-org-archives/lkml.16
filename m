Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E278F4A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744937233; cv=none; b=tVSSnLGK6fzHuEbncSDBiVUEYo+bX7myPme1XdaoN2fDjNKLglTCSNP+5o67qAAck3+cyfnbId2l/0m4TLNsjNoYdEzrVziL6C+tOGUfR3N8TQZDTSo78V0F+/MRZVKtdK2224PDt2dyANM9qm5LtoJmR20FxeEgoqZcVeboVdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744937233; c=relaxed/simple;
	bh=xsUPSKH2+wBYbQgRxfQGdV4PrrjsEBlxP/tdcdmYO8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLkfc9WnfXeny9mwoTwejViUUd78uJDXjtZP8pCU9/OzHJ4MyDRKToiTB6C4FtQxbZGvjyOyeW08xiYEAP+7Bbow4pAET8EUkgxXVPsQLLZ+UZlN8uA34A+BVt6m1Li//5XMeJ+ylaJm/8SPeVi0ljGWm4wMX9nIQ9euSoIqTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JZe0T/U4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JZe0T/U4"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so12838101fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744937230; x=1745542030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWxcfLT2DbM1nYGWqoXqzwBh7pImqNDDTl/6RDx8HAI=;
        b=JZe0T/U4H1QTdWUPX5Gud/VSoharfT/tyAyB+6MwMoLu6w0CrVcxknoFveKhIVlcT2
         oZmVWGVXMcYgoMi5S34FGu6LO3Ohety3uQXHvXNpNoPL98sKAqX/V2QF0w4YwkgEOoG3
         2Y4L+c2Yj1x4TsGzcUm6AJccGdBghivWGc3i1dYYaWvNcQX1UfMc3OfoSySbHtbbOgqf
         DuKCwGgez8rSJJBEqVpBoHmOPZVBK22U4CBbm//mBA/M0wxEamH+jco9uvakz6Iymku3
         dEHmz+j6jsl0ucFNGZL4KA6RRgUa0Za2XatrgwntqIGzRR/SDvCYtWX+e6sZUsijYP7V
         oKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937230; x=1745542030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWxcfLT2DbM1nYGWqoXqzwBh7pImqNDDTl/6RDx8HAI=;
        b=FJF5RrorvbGpG2V/DrnX6UiBoK8UvtWG0MoXoWI4MJNcvu0X4XVyqT90Ol8apMEOPt
         l1UhP2HE6Xk3vhwAGV9zaFUYWzCEwj1nTSxytpghMzE/ViBU+hPZvj1U264HuwvTyVXH
         3peLy3C3mRIXG+Mh2zsiLS7N9XzrfSDlEk+bHJMTxv+gEbcfxV3w+hYK2yij5J4HWD/z
         iTXv57uf5c7DRAaYkCwphbbp5sh0cf3Hr6hbnIgd7MSNLwBypvMzoszlO139UJM0Cpr/
         xpI0MnZsox4nWFZJMA+Nmdc4gfBaDBS5yXQR6FM1vJpwyE3fC7ntl7PdhL0gl9iuZ1f0
         u7lA==
X-Forwarded-Encrypted: i=1; AJvYcCW7rlURmO+KCsX+xZiv5+LoE7e8wHxFdn0B2fg0SzUzQXmoqV6KTOTWnuwpMjHvuOz26Fo5/jdCR6LzWlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyfNbi06JkB3xCdwzEUC/4aEu7kxmeH7yTJ3p7WYdO0TVZ4o69
	u3uDilgyuIbWrCimw8tR0Smt3/hgxxpoUFPPLX8b+U004umKidwLyTSIyXQdJjJO2Vy2rLt8I2P
	5rNuzSRGMoyJ4yeTb3maLwEYvqLI+nqnFv8U=
X-Gm-Gg: ASbGncteWb0yWcRr8zXq0zSqNWgD7cyBSsmeVZ4TNmea9LcmhbkUSbFI5JAPsQ7kLJ3
	BF5X+LTZ3vC+Kv/NfsTzIhbZS84zXj58YLVNsH0zufckqb8yWluffSvbgJ3ki/gmyaXu53oq+Z/
	iXRx6BKuiqOhN6TDWnZeUGRrjJtZl3RiPfc/CULb4qdUhHKeufjRc=
X-Google-Smtp-Source: AGHT+IEc6Im0Zn7F5XRjKpieePwe21f0bhqbHOj4bbX2dB1/4bG9j+wnki57fq++7PlvrNgqgBT5s5fiLzWPCslbQFI=
X-Received: by 2002:a05:651c:b08:b0:30c:b2c:edb6 with SMTP id
 38308e7fff4ca-31090501c0emr2475301fa.18.1744937229514; Thu, 17 Apr 2025
 17:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320200306.1712599-1-jstultz@google.com> <Z-KURRE_Gr72Xv_n@localhost>
 <874izezv3c.ffs@tglx> <Z-Vx8kV4M3khPknC@localhost> <Z-qsg6iDGlcIJulJ@localhost>
 <87o6xgwftc.ffs@tglx> <Z-vL3cVZuQ8XQXhG@localhost> <87iknnwxa4.ffs@tglx>
 <Z-5HlSUEh1xgCi4f@localhost> <877c41wkis.ffs@tglx> <87h632wals.ffs@tglx>
In-Reply-To: <87h632wals.ffs@tglx>
From: John Stultz <jstultz@google.com>
Date: Thu, 17 Apr 2025 17:46:57 -0700
X-Gm-Features: ATxdqUEs1Zbm6oVk1iLDp0vkXSMLyXTQ9GbjqNi-RXG3XiCpK3IVc4PpGrLJTZ4
Message-ID: <CANDhNCrUhZktW=_h9YTZndmyHwe9YbUMG6uVYaEuQyuKsG4AEg@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Prevent coarse clocks going backwards
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Miroslav Lichvar <mlichvar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Lei Chen <lei.chen@smartx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 2:40=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Lei Chen raised an issue with CLOCK_MONOTONIC_COARSE seeing time
> inconsistencies. Lei tracked down that this was being caused by the
> adjustment
>
>     tk->tkr_mono.xtime_nsec -=3D offset;
>
> which is made to compensate for the unaccumulated cycles in offset when t=
he
> multiplicator is adjusted forward, so that the non-_COARSE clockids don't
> see inconsistencies.
>
> However, the _COARSE clockid getter functions use the adjusted xtime_nsec
> value directly and do not compensate the negative offset via the
> clocksource delta multiplied with the new multiplicator. In that case the
> caller can observe time going backwards in consecutive calls.
>
> By design, this negative adjustment should be fine, because the logic run
> from timekeeping_adjust() is done after it accumulated approximately
>
>      multiplicator * interval_cycles
>
> into xtime_nsec.  The accumulated value is always larger then the
>
>      mult_adj * offset
>
> value, which is subtracted from xtime_nsec. Both operations are done
> together under the tk_core.lock, so the net change to xtime_nsec is alway=
s
> always be positive.
>
> However, do_adjtimex() calls into timekeeping_advance() as well, to
> apply the NTP frequency adjustment immediately. In this case,
> timekeeping_advance() does not return early when the offset is smaller
> then interval_cycles. In that case there is no time accumulated into
> xtime_nsec. But the subsequent call into timekeeping_adjust(), which
> modifies the multiplicator, subtracts from xtime_nsec to correct for the
> new multiplicator.
>
> Here because there was no accumulation, xtime_nsec becomes smaller than
> before, which opens a window up to the next accumulation, where the
> _COARSE clockid getters, which don't compensate for the offset, can
> observe the inconsistency.
>
> This has been tried to be fixed by forwarding the timekeeper in the case
> that adjtimex() adjusts the multiplier, which resets the offset to zero:
>
>   757b000f7b93 ("timekeeping: Fix possible inconsistencies in _COARSE clo=
ckids")
>
> That works correctly, but unfortunately causes a regression on the
> adjtimex() side. There are two issues:
>
>    1) The forwarding of the base time moves the update out of the origina=
l
>       period and establishes a new one.
>
>    2) The clearing of the accumulated NTP error is changing the behaviour=
 as
>       well.
>
> Userspace expects that multiplier/frequency updates are in effect, when t=
he
> syscall returns, so delaying the update to the next tick is not solving t=
he
> problem either.
>
> Commit 757b000f7b93 was reverted so that the established expectations of
> user space implementations (ntpd, chronyd) are restored, but that obvious=
ly
> brought the inconsistencies back.
>
> One of the initial approaches to fix this was to establish a seperate
> storage for the coarse time getter nanoseconds part by calculating it fro=
m
> the offset. That was dropped on the floor because not having yet another
> state to maintain was simpler. But given the result of the above exercise=
,
> this solution turns out to be the right one. Bring it back in a slightly
> modified form.
>
> The coarse time keeper uses xtime_nsec for calculating the nanoseconds pa=
rt
> of the coarse time stamp. After timekeeping_advance() adjusted the
> multiplier in timekeeping_adjust(), the current time's nanosecond part is=
:
>
>   nsec =3D (xtime_nsec + offset * mult) >> shift;
>
> Introduce timekeeper::coarse_nsec and store that nanoseconds part in it,
> switch the time getter functions and the VDSO update to use that value.
> coarse_nsec is cleared on all operations which forward or initialize the
> timekeeper because those operations do not have a remaining offset.
>
> This leaves the adjtimex() behaviour unmodified and prevents coarse time
> from going backwards.
>
> Fixes: da15cfdae033 ("time: Introduce CLOCK_REALTIME_COARSE")
> Reported-by: Lei Chen <lei.chen@smartx.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Closes: https://lore.kernel.org/lkml/20250310030004.3705801-1-lei.chen@sm=
artx.com/


> @@ -252,6 +261,7 @@ static void tk_setup_internals(struct ti
>         tk->tkr_raw.clock =3D clock;
>         tk->tkr_raw.mask =3D clock->mask;
>         tk->tkr_raw.cycle_last =3D tk->tkr_mono.cycle_last;
> +       tk->coarse_nsec =3D 0;
>
>         /* Do the ns -> cycle conversion first, using original mult */
>         tmp =3D NTP_INTERVAL_LENGTH;
> @@ -708,6 +718,12 @@ static void timekeeping_forward_now(stru
>                 tk_normalize_xtime(tk);
>                 delta -=3D incr;
>         }
> +
> +       /*
> +        * Clear the offset for the coarse time as the above forward
> +        * brought the offset down to zero.
> +        */
> +       tk->coarse_nsec =3D 0;
>  }
...
> @@ -1831,6 +1847,8 @@ void timekeeping_resume(void)
>         /* Re-base the last cycle value */
>         tks->tkr_mono.cycle_last =3D cycle_now;
>         tks->tkr_raw.cycle_last  =3D cycle_now;
> +       /* Reset the offset for the coarse time getters */
> +       tks->coarse_nsec =3D 0;
>
>         tks->ntp_error =3D 0;
>         timekeeping_suspended =3D 0;


So using the clocksource-switch test in kselftest, I can pretty easily
hit inconsistencies with this.

The reason is since we use the coarse_nsec as the nanosecond portion
of the coarse clockids, I don't think we ever want to set it to zero,
as whenever we do so, we lose the previous contents and cause the
coarse time to jump back.

It seems more likely that we'd want to do something similar to
tk_update_coarse_nsecs() filling it in with the shifted down
tk->tkr_mono.xtime_nsec.


> @@ -2152,6 +2170,33 @@ static u64 logarithmic_accumulation(stru
>  }
>
>  /*
> + * Update the nanoseconds part for the coarse time keepers. They can't r=
ely
> + * on xtime_nsec because xtime_nsec is adjusted when the multiplication
> + * factor of the clock is adjusted. See timekeeping_apply_adjustment().
> + *
> + * This is required because tk_read::cycle_last must be advanced by
> + * timekeeper::cycle_interval so that the accumulation happens with a
> + * periodic reference.
> + *
> + * But that adjustment of xtime_nsec can make it go backward to compensa=
te
> + * for a larger multiplicator.
> + *
> + * timekeeper::offset contains the leftover cycles which were not accumu=
lated.
> + * Therefore the nanoseconds portion of the time when the clocksource wa=
s
> + * read in timekeeping_advance() is:
> + *
> + *     nsec =3D (xtime_nsec + offset * mult) >> shift;
> + *
> + * Calculate that value and store it in timekeeper::coarse_nsec, from wh=
ere
> + * the coarse time getters consume it.
> + */
> +static inline void tk_update_coarse_nsecs(struct timekeeper *tk, u64 off=
set)
> +{
> +       offset *=3D tk->tkr_mono.mult;
> +       tk->coarse_nsec =3D (tk->tkr_mono.xtime_nsec + offset) >> tk->tkr=
_mono.shift;
> +}

Thinking more on this, I get that you're providing the offset to save
the "at the point" time into the coarse value, but I think this ends
up complicating things.

Instead it seems like we should just do:
  tk->coarse_nsec =3D tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;

However, we would need to skip doing the update if we didn't
accumulate anything. This would perserve the coarse clockid only
updating on tick interval boundaries and avoid the potential negative
correction to the xtime_nsec when we do the frequency adjustment.

I've got a patch in testing that is avoiding the inconsistency so far.
I'll try to send it out tomorrow.

thanks
-john
