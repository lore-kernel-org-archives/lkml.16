Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789613AA2F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000742; cv=none; b=Xe/uOMhfYqHsBy9wb3GSqMnqm1AifJp2SmDxPzEkt5tFN212Z+pf7TW4dcS5OWGjjvDiPNtCP4WGRe5YUaiDX8om3GOwn4HaJGun29WtyfUzyhK1oELx9WAsCWA94TAUeoY2OCDGgjdZDAKBvyV/Og61dPe3WVX7woAXyGLR07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000742; c=relaxed/simple;
	bh=uIye7ffYxRe1aj/nL4Kj9OwVydMQ9C81AyEC1pdrgBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEhY7PFACq+ygzjm31dhYItruqPs1q+7+OHuAe0vt8bzO0VAbvL9pg3jLjunkXhcvruWxzXs0KkuwbGqn3buUPxewsLjKxnEnHfnaN1aHZG9a7VWQVHUEJHgi8Kxwc/plbxVjwMgyE3hYHiXJ0eK9qAtlx8aNyJitvHlcx2Adg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S3y1Ge8e; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S3y1Ge8e"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b16a0e38so1917093e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751000738; x=1751605538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf9/SME+Lnr+OxDNQZdzbpnAWX5mL997K/xhcs2nDIk=;
        b=S3y1Ge8eIVzoqoRFv9Wdkc4tPK6QQcNer/tvvce2skvuLdap9HKwpQruuIcRJKmqQk
         cYljQgH2WNJs8NmyeDlBmFMtqtC6XvsmdrGofwkPQjW4nwSq4jhabPqzEBA3F7KbMoe9
         9FuNeoD/hkH2lAJD4mgLfiYrptF5AzUabc3dRcZ7gASc780trAZbZkEzUp7kaqR+ZBhX
         IV26GYgaNgypSXlmv2+eEAXwgTdyUIW5dirSQRxktv9bWfUrmWq+Tc49IHN6pK+xc9s7
         Qw2cqJceGiFWGl7ddEynMgpO8DjwkJYPYA2uEC5AtFFsIEVL/umXKTjxN8pdpeg/xNLd
         2J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000738; x=1751605538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf9/SME+Lnr+OxDNQZdzbpnAWX5mL997K/xhcs2nDIk=;
        b=hp7tBlYDm7kqxwtKy1caCttrdnarX0fz/k9FfRbN2dH6zBkmBMKqsmkA5Qgz2pPi0A
         KD3wIwla3HkQcq3P1LiNqZ9piamMLr/o0qzwkGhYKYtyzO6pfMQtubiVJaACzd8ns7GH
         XBYKU83AZ3myMOBDLAmkySSjTBs6GwfTSS4LB/U17++7fEO8lXHmgjwr35voeilKfUar
         Qy4qHAe6U4G9jF2JOuDYxw1FTFq/aLMeHf2SkiNHZHW3aUj8Oj/Vz3XW6rPTJGWgqju3
         zoYhIqoOqQVTiEGrzhagNT6oCxGSh1keiac/jWhaS4IzjP2uRqIhZygxcRbQTZpebAZd
         /LHA==
X-Gm-Message-State: AOJu0YwAjdXLWNhKIOSw79YNJmOSNc4QgUkLICTA8T/ZhlkjmpEWcWrC
	p/xbV8mueAHq90JN+VQTzyg1fJ9bkxXreUvyquea/Q9yacGwJiZQLm8dL95bFsUG0FW5FxXRVM1
	urczYClNX4MAJeuZbQhQC81BTvvRl8cL53tjK6jiqUUT+DFmby9gMCMc=
X-Gm-Gg: ASbGnctLbzlKfQuTNjBRiPgXCoRoGaBgIhOkYY7PGP42Czq0SGR/fCljGfRRFAXRH03
	Egyuz+sszV2Oj2IxLcvpmpD7w5lUvrs2VnsNP+bT7GaUJeLWwUQWes8G+CXmrStuia1cKlOYBH7
	0pkI2v9qPqWUXdydwHFM2lKOcIMhvUzvv1APXo51NNn09O+ZyvFVK5h4bUSUDqU7FIXtv9nWAg
X-Google-Smtp-Source: AGHT+IHxMdjZLi5zdWFPxgNJl3H+FXj+B0DtRSD7w9LvBGgi4rorsxPqXascidhMd5oHNu9DiJmvCC4It4bH59cyZ48=
X-Received: by 2002:a05:6512:3053:b0:553:a490:fee0 with SMTP id
 2adb3069b0e04-5550b7ea031mr633573e87.10.1751000738369; Thu, 26 Jun 2025
 22:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183758.382451331@linutronix.de>
In-Reply-To: <20250625183758.382451331@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 22:05:26 -0700
X-Gm-Features: Ac12FXw9hjSNp0HR-ZscbMYiCPvydKhabPLUOL7jmSTHRCYJFisVMbyHu9-jLKU
Message-ID: <CANDhNCoduoTdzN0v59fnJjndu9cOYkSLZg8Sb_csnNx6CaOOJA@mail.gmail.com>
Subject: Re: [patch V3 10/11] timekeeping: Provide update for auxiliary timekeepers
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
> Update the auxiliary timekeepers periodically. For now this is tied to th=
e system
> timekeeper update from the tick. This might be revisited and moved out of=
 the tick.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  kernel/time/timekeeping.c |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> ---
>
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -2762,6 +2766,20 @@ static void tk_aux_update_clocksource(vo
>         }
>  }
>
> +static void tk_aux_advance(void)
> +{
> +       unsigned long active =3D READ_ONCE(aux_timekeepers);
> +       unsigned int id;
> +
> +       for_each_set_bit(id, &active, BITS_PER_LONG) {
> +               struct tk_data *tkd =3D &timekeeper_data[id + TIMEKEEPER_=
AUX_FIRST];

Again, a nit, but I'd use aux_tkd or something just to be super clear
we're using aux ones here.

> +
> +               guard(raw_spinlock)(&tkd->lock);
> +               if (tkd->shadow_timekeeper.clock_valid)
> +                       __timekeeping_advance(tkd, TK_ADV_TICK);
> +       }
> +}

Otherwise,
Acked-by: John Stultz <jstultz@google.com>
