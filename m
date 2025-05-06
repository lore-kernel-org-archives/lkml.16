Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E12459F1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527934; cv=none; b=kKLaN2TbMzfC0v1x0icsPJJTdVqAO40hckniWchJSfCGJuH41wJvrL98CE62en2gndaXBNyPHHJbsu2GdBYZbqVIK0paABpxXw6ZUDFCx8YZPpakPiGotW2SnliMsB18Bp46rZF+Gqt5KIZg1iAOsMiRWPe9EVEhHzwrlXr4SB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527934; c=relaxed/simple;
	bh=Wk/Bq9mVdtHfUb6e5vphF8QQcUvgAWhLMCFOzh4ICmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CM4nJyXcuZtTyWq3yZS8+Atv4RhBty9w+GzHq57GU+mALMz6PuTE2i+/uI8ksKxzCkxjnprejMmWTKM6BGyKKlTz/Ebt36pAhAV/fNq/wayL0ZzO90T1LyW60dC9WFwQwHoSeqSixzgs7BZ0KPL70KOKTDLZPsGDkQfzQaFVCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RyMjEk7o; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RyMjEk7o"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60219a77334so2884440eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746527931; x=1747132731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdS0iTK9Vcceq32q3AIoLs3BITEBAqCSw/rcfLl4/ig=;
        b=RyMjEk7oolkhjx8uTiFzxtamcTFDt2I+ObhwQbgPleAuHrDuqxkyz4H3GocEaUkryr
         JIST5CGKJqyJV96AwG0wWrQrC6U9CahjR7jN46ldFKtS96+y9DXMK0eKK+SBtgK0CaAQ
         64qesqqAuFaTLWr662vY7crf8haa5ZJkN7bz0FeEyoNFkHdVbtAnSyNnJckMrpmwmiYG
         w9NhM1rIsB9oRLgDv1SvdR/gJU/cJ2vxiWm0qzB7yZj8LlHaoVdO2KKoZR7Ms0X12U5c
         nlSDQWN+1StqeBrJXXUx7IxjlNzT/xWRYVnXcwVxJceZ8X2ySFVBwq/fN5GsuPgaz1YY
         RieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527931; x=1747132731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdS0iTK9Vcceq32q3AIoLs3BITEBAqCSw/rcfLl4/ig=;
        b=atKHjFINQNNLxEsdM/I13IWJGzzBiDQfMBkFeLrY7iPqx22vGxYw0x0M1+FZlJH6fB
         RpR5HKiRy0CoQyFmHiWvbySM/UoY17nyihUBfmE6P1H+T4T0cyVJcoI2tV1Ay/hb2IN/
         uBYfkeRlGSzx1bJ8eG/Xw+cfkGvIDBwVPtm5SQia6E9GTIRnptF9SLa0eFYAB7fKUpAf
         4u4/LogguC3XRKSmtI2URQ9jem/WOZ1TUfAXyx+5eg4LS7opzY4Os+CRH/POSJ1JXOqE
         TmoqkNUxBCkkN2EmAClMo/epoKu5cVK2Mz2IO1S7/+0swvTi70poqFBmvKy9NGFnmD8u
         xmzg==
X-Forwarded-Encrypted: i=1; AJvYcCWINgOFZtg2w5UghG5ll46mxAxhuYo51sc6IOErZVYDTNOe7R+sM9Biud/pnTjFFtOLcyPiVghBSQugzeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSNC6tW2ZFVkHhaKUaWYVgzcr8vE89K5+BwlVFo5pFgLoJyBg
	uMjVIKbx+0t2Dv5XkplHXV7A/51qRnYUcAel670J7bMmigMYO6MSGgLLTumiRE1etNSKsnRC0ve
	dgx9Y7jVZypishXdEuOFfzvm9n1zwdBTaW6C1bg==
X-Gm-Gg: ASbGncvfAXfQfx/nRkjO/AP8pf3AH1oKsbO8WO+OrEgeJ8lMrPy0uJ/Uv0tjJGkIidx
	Qz0ENblOdJxPfvfsjydfGgGfyGlgfIjc2JBVviia1tUhwqVgRpsEUo7PZ1EJlTnhu4AeJdoiZtr
	MsGuaa7GYlgVQgMf1Juei+1pg90w1mjM6Szyf6wK8=
X-Google-Smtp-Source: AGHT+IFe5sX85wLXHZU0uwT1FUfZjV33xZUKAlCSBaeAyBkJU0LzTwgNcod4sedmUZ83ZjcgMlPRAfBw4RfJmfMXvO0=
X-Received: by 2002:a05:6820:1a05:b0:602:5856:255c with SMTP id
 006d021491bc7-6080033603fmr6521304eaf.8.1746527931552; Tue, 06 May 2025
 03:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425062425.68761-1-cuiyunhui@bytedance.com>
 <20250425062425.68761-2-cuiyunhui@bytedance.com> <3a24d3ab-9567-4a0c-b904-4225ab4c489b@kernel.org>
In-Reply-To: <3a24d3ab-9567-4a0c-b904-4225ab4c489b@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 6 May 2025 18:38:40 +0800
X-Gm-Features: ATxdqUGpvfTUYGLZj5z6Xj8_RiBVFq2tQ6MuRyPbmhHPgeqmnqc00YWhK_0Qlzw
Message-ID: <CAEEQ3wnizUrMctT17krZNYUszT0n7mgW5cBHkMzOUF+j+ecMJA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/4] serial: 8250: introduce serial8250_discard_data()
To: Jiri Slaby <jirislaby@kernel.org>
Cc: arnd@arndb.de, andriy.shevchenko@linux.intel.com, 
	benjamin.larsson@genexis.eu, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	jkeeping@inmusicbrands.com, john.ogness@linutronix.de, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	markus.mayer@linaro.org, matt.porter@linaro.org, namcao@linutronix.de, 
	paulmck@kernel.org, pmladek@suse.com, schnelle@linux.ibm.com, 
	sunilvl@ventanamicro.com, tim.kryger@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi js,

On Fri, Apr 25, 2025 at 2:49=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 25. 04. 25, 8:24, Yunhui Cui wrote:
> > To prevent triggering PSLVERR, it is necessary to check whether the
> > UART_LSR_DR bit of UART_LSR is set before reading UART_RX.
> > Ensure atomicity of UART_LSR and UART_RX, put serial8250_discard_data()
> > under port->lock.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   drivers/tty/serial/8250/8250.h      | 15 +++++++++++
> >   drivers/tty/serial/8250/8250_port.c | 42 ++++++++++++++--------------=
-
> >   2 files changed, 36 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8=
250.h
> > index b861585ca02a..5a106cf88207 100644
> > --- a/drivers/tty/serial/8250/8250.h
> > +++ b/drivers/tty/serial/8250/8250.h
> > @@ -162,6 +162,21 @@ static inline u16 serial_lsr_in(struct uart_8250_p=
ort *up)
> >       return lsr;
> >   }
> >
> > +/*
> > + * To avoid PSLVERR, check UART_LSR_DR in UART_LSR before
> > + * reading UART_RX.
> > + */
> > +static inline unsigned int serial8250_discard_data(struct uart_8250_po=
rt *up)
> > +{
> > +     u16 lsr;
>
> Is lsr really 16-bit?

The data book I have shows a 32 - bit width, but actually only the
lower 8 bits are valid. Using u16 is fine, and the current code all
uses u16 lsr.

>
> > +
> > +     lsr =3D serial_in(up, UART_LSR);
> > +     if (lsr & UART_LSR_DR)
> > +             return serial_in(up, UART_RX);
>
> Why does a discard function return a value at all?

Update in next version.

>
> > +
> > +     return 0;
> > +}
> > +
> >   /*
> >    * For the 16C950
> >    */
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8=
250/8250_port.c
> > index a913135d5217..802ac50357c0 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> ...
> > @@ -2137,25 +2136,21 @@ static void wait_for_xmitr(struct uart_8250_por=
t *up, int bits)
> >   static int serial8250_get_poll_char(struct uart_port *port)
> >   {
> >       struct uart_8250_port *up =3D up_to_u8250p(port);
> > -     int status;
> > +     int status =3D NO_POLL_CHAR;
> >       u16 lsr;
> >
> >       serial8250_rpm_get(up);
> >
> > +     uart_port_lock_irqsave(port, &flags);
> >       lsr =3D serial_port_in(port, UART_LSR);
> > -
> > -     if (!(lsr & UART_LSR_DR)) {
> > -             status =3D NO_POLL_CHAR;
> > -             goto out;
> > -     }
> > -
> > -     status =3D serial_port_in(port, UART_RX);
> > +     if ((lsr & UART_LSR_DR))
>
> Too many parentheses.

Okay.

>
> > +             status =3D serial_port_in(port, UART_RX);
> > +     uart_port_unlock_irqrestore(port, flags);
>
> thanks,
> --
> js
> suse labs

Thanks,
Yunhui
