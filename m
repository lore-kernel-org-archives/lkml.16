Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ECB5FDA7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749869514; cv=none; b=SeOMregrFZl9Hii++EPYXUriVa90VS4Xe41qeaGH87d3Mgnpxf6p0rsn9DSgQ4I8dGic6ueKIXA4D1flib+PoZIWbltyNLPdgCxwOAQbXeBmpQuSmsAEI05/EDv55D7p5Hp0M+Bb9Y2Xg3lfbdAl2Ca8zlpYJr8CpgmOnGvf9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749869514; c=relaxed/simple;
	bh=aXDglcz57/l7syozb6LCO2vY6bQm7WqGnrphZJUdi1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/T4hzQmKFSccSOQEWCD4VEWNF3LjEFnBPq4lGwVoOmcULaSH3w66TJz6vDyDBVx40CfJPuVi5WcdY6dogZlq6UvGICL2TfAi+rkPk3NcurF1WxwH1gGMGnMc/aDI73IMvV0TFH+LpcF/RbKTM+QJXrQKwUiN+yQitapsICe7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gnOG9KKb; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gnOG9KKb"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b5165cf5so922648e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749869511; x=1750474311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/ZW56K2sKz/4q+T+akY8ydx9AmS9HHlf+ZA0ZZdo8s=;
        b=gnOG9KKbLPELylH9hPxjsLSa+VnET3cP8wspNumSK12jh1YdpPA8X9Axhtx7rQD1Xx
         AH+DFT5MBiPneJa3v5qygQZt6I4UpDq1raS6aw3x+fZB7B2pXXv7WwYv33KxqifeFG21
         d5bNalbhqTqd69zkzXCM5SVGsj/7lAw8u1++u0NuSYyGp7c2fz+HTZSayMIIaVH7b9XM
         a3AtD+48Mr6BIgTFgE6rrufaOkR6UKZF3ObtcY2lWURdo7s5ugUfnwf5GkrKfGBry29F
         n3unWpFqNhh8GzmVBHRjSwy+LKZt+/dGoFBRv/twTCBgEd458U2WO/5HoxxR+Csj/UbC
         hfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749869511; x=1750474311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/ZW56K2sKz/4q+T+akY8ydx9AmS9HHlf+ZA0ZZdo8s=;
        b=oUKjd7ml4e2W5jLRm5uqbgwhAWNqTio8vgcNyXn/P0ZY5883YhzA/Yee0WIJSl8240
         tSN4aW8M4NvVAd3v67H/cYT+bsKOQG8ln4XUrHRSBI7K8E3sDs8F61eSVBjkx8xpWzXP
         6lhLggFKMb7K3Qou7imLWV67Skdkpucaijp4Opug45gNbMV0pX/z7S7zrxd8duE0xX8v
         flL+OMAbQzP5jUOLirsrYo3+emTb0dwMwt5utNp5MwDegHfCuJPYl6U6S0uvuhEVEAv0
         3xmBe6ouqAeDjZnDqL+YtyYEiBTkIc3lu07s0BabmzZ8BK3rrAWEiDikB6m4AhK0QW07
         0e7Q==
X-Gm-Message-State: AOJu0Yw3fTcw8BEZKsJcLu9hx8dChFCpowefLv5aFP48hvId4QvmeGqr
	yD2eHgPqjlp5i3zyhSDXzx5V/AsXW7M8u9hgLAHiHsqtvIFnMJwQ9+0aVDcHvH7F9rxUI16GZX5
	3IKc9jDVEYPMvJBMQ6HAm0nLSUR8bSZ2+Q3VZnzc=
X-Gm-Gg: ASbGncvTVUXk7YZyM7SU07DTq1vheFJ8L7f7Rb7fNFFE+7HXe/v8K9/LlSL5YOa/TC4
	dNFwaASHd8P10Y1b/wF+qEs5QxzOrAvdc2p766JWcPwFjWC/uxCx+u74jCTvJljccBMZTnPo1yp
	KRaJVhtouwkBHgkYbgpkuIoYne0y5BokOPNtnL03xdQ1IDCpDRbgBcZMMySiHMXpzihcYBBtA=
X-Google-Smtp-Source: AGHT+IEf5/VoxzfjdU3IXBK8P4RWHUgGmypibA4RM/Exbxx7zFV2FOeSrEVNvAmCpK7VbXpZAQSfCnk1KbJjNVzelVQ=
X-Received: by 2002:a05:6512:1285:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-553b6e732b1mr310868e87.2.1749869511054; Fri, 13 Jun 2025
 19:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083026.655171665@linutronix.de>
In-Reply-To: <20250519083026.655171665@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Jun 2025 19:51:38 -0700
X-Gm-Features: AX0GCFsxBpRjOjXZmRH4u101nXoMqj7nDtxm4Llv9cdxOT0IQBi3NFHLZrtv69w
Message-ID: <CANDhNCoW3whgp1ZW=Fpw6mFgbYowue2H_RR_Y9UYCTLstLJDrA@mail.gmail.com>
Subject: Re: [patch V2 17/26] timekeeping: Provide time getters for auxiliary clocks
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

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Provide interfaces similar to the ktime_get*() family which provide acces=
s
> to the auxiliary clocks.
>
> These interfaces have a boolean return value, which indicates whether the
> accessed clock is valid or not.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> ---
>  include/linux/timekeeping.h |   11 +++++++
>  kernel/time/timekeeping.c   |   62 +++++++++++++++++++++++++++++++++++++=
+++++++
>  2 files changed, 73 insertions(+)
> ---
> --- a/include/linux/timekeeping.h
> +++ b/include/linux/timekeeping.h
> @@ -263,6 +263,17 @@ extern bool timekeeping_rtc_skipresume(v
>
>  extern void timekeeping_inject_sleeptime64(const struct timespec64 *delt=
a);
>
> +/*
> + * Auxiliary clock interfaces
> + */
> +#ifdef CONFIG_POSIX_AUX_CLOCKS
> +extern bool ktime_get_aux(clockid_t id, ktime_t *kt);
> +extern bool ktime_get_aux_ts64(clockid_t id, struct timespec64 *kt);
> +#else
> +static inline bool ktime_get_aux(clockid_t id, ktime_t *kt) { return fal=
se; }
> +static inline bool ktime_get_aux_ts64(clockid_t id, struct timespec64 *k=
t) { return false; }
> +#endif
> +
>  /**
>   * struct system_time_snapshot - simultaneous raw/real time capture with
>   *                              counter value
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -2659,6 +2659,23 @@ EXPORT_SYMBOL(hardpps);
>  /* Bitmap for the activated auxiliary timekeepers */
>  static unsigned long aux_timekeepers;
>
> +static inline bool aux_valid_clockid(clockid_t id)
> +{
> +       return id >=3D CLOCK_AUX && id <=3D CLOCK_AUX_LAST;
> +}
> +
> +static inline unsigned int clockid_to_tkid(unsigned int id)
> +{
> +       return TIMEKEEPER_AUX + id - CLOCK_AUX;
> +}
> +
> +static inline struct tk_data *aux_get_tk_data(clockid_t id)
> +{
> +       if (!aux_valid_clockid(id))
> +               return NULL;
> +       return &timekeeper_data[clockid_to_tkid(id)];
> +}
> +
>  /* Invoked from timekeeping after a clocksource change */
>  static void tk_aux_update_clocksource(void)
>  {
> @@ -2679,6 +2696,51 @@ static void tk_aux_update_clocksource(vo
>         }
>  }
>
> +/**
> + * ktime_get_aux - Get TAI time for a AUX clock

Is this actually the TAI time? Wouldn't it be the MONOTONIC time for
the AUX clock?

> + * @id:        ID of the clock to read (CLOCK_AUX...)
> + * @kt:        Pointer to ktime_t to store the time stamp
> + *
> + * Returns: True if the timestamp is valid, false otherwise
> + */
> +bool ktime_get_aux(clockid_t id, ktime_t *kt)
> +{
> +       struct tk_data *tkd =3D aux_get_tk_data(id);
> +       struct timekeeper *tk;

Nit: Just to be super explicit, would it be good to name these aux_tk
and aux_tkd?
So it's more clear you're not working with the standard timekeeper?

thanks
-john
