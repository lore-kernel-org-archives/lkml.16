Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668521D5CF2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000090; cv=none; b=u/Mjef/i/lQCZoZ7WxH+Q+7sG8t+nyucI8o2VfhDKcS6sAKY1kmii10zss/FFOfb7vYdxwQbzI6+nHYnJDVLhKh9svyS21jdrk8DvIMuu55mqmvPDd+C1AkYU+guOG8RPOVB10FBAFvpaoYYoghrRhZcwjp+5jWgL3ax9ZmXyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000090; c=relaxed/simple;
	bh=v35BJ34lgvcP6bUBnuX4G37d0j4fI/MWcYfFOIx0kO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glhTKEtPxGG/rDi31zmo0fRkCoeAQlWjziHQ35vzwdNIMw4PcC8kl0bkP2Vf7Wy1vAIG4xD+NCOb86ON5jQ8yTE8hNHimdb8ehbkB1SZgZZ3B8nllKAkHjlJx+4hxyYHjzEsdOXKiG5AgPaJdHC3PY8SVspKWDtESZ1mKKDnJ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K1iDnaF+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K1iDnaF+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553dceb342fso1544026e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751000086; x=1751604886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MwcYSCU7O2wVwCmP9UL7U8eP3yLNVSRm6pslGgCVSM=;
        b=K1iDnaF+qKBWsSBNqp6JAVI/oDurIrZTpw7ZACPvuljb7herIil72xeW1Lrn42jwf3
         rMFaUBWG6LzQhPKrTJz6WtjZ2s9mL/KrHPgdw0rb9VRrhzd7Ml6h1tg13+bhLiOGGBbI
         /WRLr1Nu8Pxv9bfijcyG1LJmZy/6LgDxRCLScj363rJKhKwQx7Sy5kYhd4d9JNaQmvOS
         SmDCmgGb5QPXAJWhuSRpw/lE4Zz0BlFSed7Ua3dkZ1xm9IciV6jRvvlkvmC/uyiyQWGs
         jIj+bDH5Kv1D+LuPDU/l7ETBMKl+3kcJebjUjKBalIVCbEe8iv8i6zXSh/nG2l2+wFcv
         jx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000086; x=1751604886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MwcYSCU7O2wVwCmP9UL7U8eP3yLNVSRm6pslGgCVSM=;
        b=LzXEHKzpI+yQlV68UrdM8dY9mkpy9VDLsZzxZNvspae9WVFDb+EyvRbFzQ1+991e0a
         vnLaKHwNQAW/FHq0WprG6BxAeXs3NWZ2+euOhv0YM7ttZ73GGIJQ/+iEuof7IGdfA4Dg
         k1QwS6TXpgDtS6Asb+LUAhd83S3R8oEz5TZJ8+JBl0cAKvJmu3F3AWvw6cVTXiaErdmI
         iwyKeAbJoXE17ckp3hKxssEIbgqcg33j4fhGn+gZuRZB+allQ3pMJszto/R5q7fANPQD
         2BJSu3KCF/YboWTtIpR6HLgCwQTiMSoxw0WyKp+mQxa0pgKlwXOvXoh405LN424DHHRV
         XoeA==
X-Gm-Message-State: AOJu0YzVut0badIpjLDOgwmrFfj1EliWfcnOmXDvT95rGmItNd94n8qv
	0J4X8Ky6rpRggFYswqsm9uQ1g8Ttast/P4H2RGpc34uZ4tLVyj5ig6Wdjj2jGJ3jIvF6748nm55
	YfGQh+xaz9+eMGQD6F/YnLDhpzet7GTUWcFPJ9ZM5TH9AcQN34anOl1TeEQ==
X-Gm-Gg: ASbGnctZz2Pmpz94bSYBtrWLjnasJH8tvk35+20198NHOgEeQhbgPGsoW0PuUFZBnVf
	sjBg/2OBcwbTzV2wD3T5ZugH1J9m0VgVC2IltgXtXxu7MnFnAye0fm1zOe2LGW1zDIAx8aLzOH4
	HBc3v1cdZmRlAT3Lt3c+Y+5Waype693pcPzSbRC8TX3csSNuuNIAgqqM5Msb+JYMKOVPo2TeqDT
	FEEjacm1T0=
X-Google-Smtp-Source: AGHT+IFpLSv3KdtEC81mfx9MJueqJy1tKEIWQAG2KaGeBxgKAmIeLcw+2jgK0HvCMltj6Jh83tRtGXnZN4SOR/0Vcrc=
X-Received: by 2002:a05:6512:220d:b0:554:f76a:baaf with SMTP id
 2adb3069b0e04-5550b9ee1c0mr598894e87.56.1751000086251; Thu, 26 Jun 2025
 21:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183758.124057787@linutronix.de>
In-Reply-To: <20250625183758.124057787@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:54:34 -0700
X-Gm-Features: Ac12FXw_Je7fjw68q5uLeLBiIbu4q7GMysmzcodNlFFbo38SspffgCM3lhGSYcA
Message-ID: <CANDhNCqhaezCu=+JiJ0GOMaOAJZN6Cu8FbchW3Fy_8tzXi3K1g@mail.gmail.com>
Subject: Re: [patch V3 06/11] timekeeping: Add auxiliary clock support to __timekeeping_inject_offset()
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
> Redirect the relative offset adjustment to the auxiliary clock offset
> instead of modifying CLOCK_REALTIME, which has no meaning in context of
> these clocks.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  kernel/time/timekeeping.c |   34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> ---
>
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -1448,16 +1448,34 @@ static int __timekeeping_inject_offset(s
>
>         timekeeping_forward_now(tks);
>
> -       /* Make sure the proposed value is valid */
> -       tmp =3D timespec64_add(tk_xtime(tks), *ts);
> -       if (timespec64_compare(&tks->wall_to_monotonic, ts) > 0 ||
> -           !timespec64_valid_settod(&tmp)) {
> -               timekeeping_restore_shadow(tkd);
> -               return -EINVAL;
> +       if (!IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS) || tks->id =3D=3D TIMEKE=
EPER_CORE) {

I feel like this should be in something like:
  static inline bool is_core_timekeeper(tsk)


> +               /* Make sure the proposed value is valid */
> +               tmp =3D timespec64_add(tk_xtime(tks), *ts);
> +               if (timespec64_compare(&tks->wall_to_monotonic, ts) > 0 |=
|
> +                   !timespec64_valid_settod(&tmp)) {
> +                       timekeeping_restore_shadow(tkd);
> +                       return -EINVAL;
> +               }
> +
> +               tk_xtime_add(tks, ts);
> +               tk_set_wall_to_mono(tks, timespec64_sub(tks->wall_to_mono=
tonic, *ts));
> +       } else {
> +               struct tk_read_base *tkr_mono =3D &tks->tkr_mono;
> +               ktime_t now, offs;
> +
> +               /* Get the current time */
> +               now =3D ktime_add_ns(tkr_mono->base, timekeeping_get_ns(t=
kr_mono));
> +               /* Add the relative offset change */
> +               offs =3D ktime_add(tks->offs_aux, timespec64_to_ktime(*ts=
));
> +
> +               /* Prevent that the resulting time becomes negative */
> +               if (ktime_add(now, offs) < 0) {
> +                       timekeeping_restore_shadow(tkd);
> +                       return -EINVAL;
> +               }
> +               tks->offs_aux =3D offs;

I'd also consider moving this else into a aux helper function as well,
but I'm not 100% on that.

Other than the is_core_timekeeper (or timekeeper_is_core() maybe?)
suggestion above:
 Acked-by: John Stultz <jstultz@google.com>

thanks
-john
