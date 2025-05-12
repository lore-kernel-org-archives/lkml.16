Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B92AF07
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031863; cv=none; b=H8FmsU3lRHvm27cawyXDbA6rOET9/V+prKhvYxguDtjE6k3p3PckwABFaphOYc7J0Ic5caOKGvd40Xm5P8Ynf4iamfMyRQ99xg6f6doR65A1ch6fd8hrzE8U3e0zCP8GVryZ/8Xsn9tIi7/8VHNI6XNhrlKLTWzqR2Nk8WMsn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031863; c=relaxed/simple;
	bh=/MrXUsCjprq2LujjsV6LrGMH1VQyEoJA/gjEMDHE858=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnIGwenxA/EFgjruyXFh5e32qHiH+ftjavIfVOdZe+Klb7ckVunxiE2CsBeW5qrtyfQjC3cv2Yurj0sxsmshVS+97sV+F46oStR/k5xb01K9bC7IVXp4K4+Anw2zOjIo5vG7SbbhvbqbGz+eHxgyhwzJib5bZ7oxwfg4q2ZJ2Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SKR9JaOo; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SKR9JaOo"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f8df49e75fso1075607b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747031861; x=1747636661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsZm7oiLFyp6MLfLavMYUdpcZeQanRCtLC4mhO+NNsU=;
        b=SKR9JaOo5ZfWFEGL+o0FiM9QASJ1IrQYsVyLrPI9+2d7ILWLYKI7fja4gO/A4vgaDA
         uHvolj4Mz/bIT+99r1b2jzCbil4+7+t9ETp/9zN6JK3JtpPcr9XlH8ZDj+7AXHk/JN+X
         epIaNywnX5m5cV+xDvMqDPFJ9bBAyNTjU4LINDmRYPEcinc8XX96wgi6iGxQeyvVOLch
         W+5cnosbyk3CdRNcDichSAoSumBGA4L8zy83q5I++32sLcvkQyrcbK3+aSWkULY+IJ4n
         +0lb+uxb1h/fFTg7NYGZ2eXMR4mBCXN5/b7kytLEy21fYqE+eRoPgFJQr6XY0YVAnnZg
         aNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031861; x=1747636661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsZm7oiLFyp6MLfLavMYUdpcZeQanRCtLC4mhO+NNsU=;
        b=JMYuXKnXfrD2ry4e9I2AWPgc6RkyrPRT2WKjZB4YcZhsMCmKQMDPxzDXtqrIfcbn7C
         wOorjmd0dsRBHdjzwEETtCbZheSFQkS0C7Z1Q/W0iHkpCQaTXznOo5bO35UpcxlpahM/
         sIoWwzKUKiPMyiYFIWIal7xvlZwUngdbIR/8/OI699CCApHQweZeE5iXWlgAQpf5tojH
         McFjQ8Ne7R5wmt9wl8+6jjqmc2TZCXMW3PH5kGARtE3CdidS10KbzapMWFXsq9AJyyis
         VKrH/lII3oZ57DbkhNLSrct7y32FluVCQhYnFNRvQ51ij5KoS0tau6V5Kz0Tl/Df1nqX
         qAjA==
X-Forwarded-Encrypted: i=1; AJvYcCUHxc9KR3/spDZaksqOqTSDiS7jKQjtlISNCCnVMK4FOVyQ349jyvoeQT3NfBqhlbWXww7OJ8ek0wQz8hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSZWfNAY40omPN/bCUACACw+TQ6BmL9raYUKnTv0CpYNGYNWw
	vPJ9TVrsBB4nTDDJbumIflftLLSQSB3BWQb3RYxFByY1ywJFzGNL4Zf1a8aST3YizbMINXXO3Sr
	eqRLmDhpuSTwAnKmOYnMLSZsVkcn4iXrvWzTlAg==
X-Gm-Gg: ASbGncvxSttpQKAp7hsd72fP4dB8kyv1GXWM9RmNPLZVIyq11VI9MX+d9Eue8Yh9JcY
	xl4WsCHv4qm9A78tiEAmRfz/ywzyxGbkWKujOKDtUA5X4RL3nhU/rbsMDZhkkjMlbfiMMd/fxmD
	+8L+Vpnx/O3WA94ATaRDV6aADSbWXM8ioSEQEkoIIRIoMyFqr8CA==
X-Google-Smtp-Source: AGHT+IGwUoOmEgIaTi+7ftJAc9cd/EVilNMsONtdW18ZcPCCgWEoKybxqkHG1RY8TEzmNkcO5IydYzUH81bnYPsN8pU=
X-Received: by 2002:a05:6808:1409:b0:3f6:ab0d:8dc0 with SMTP id
 5614622812f47-403800d6897mr6997776b6e.24.1747031860706; Sun, 11 May 2025
 23:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506112321.61710-1-cuiyunhui@bytedance.com>
 <20250506112321.61710-2-cuiyunhui@bytedance.com> <6801686d-a0b3-7093-1293-cdac6ad055e4@linux.intel.com>
In-Reply-To: <6801686d-a0b3-7093-1293-cdac6ad055e4@linux.intel.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 12 May 2025 14:37:29 +0800
X-Gm-Features: AX0GCFtHwBFbAybIu_a8tCTlxPEIo-prlanJwip0bPfYsQSXbUF2-xL_6KzZsTk
Message-ID: <CAEEQ3wnouWbVvkvhV1oB8MrOADNhN6BQB4-epUXa6cLYkKFRiw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/4] serial: 8250: avoid potential
 PSLVERR issue
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: arnd@arndb.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	benjamin.larsson@genexis.eu, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	heikki.krogerus@linux.intel.com, Jiri Slaby <jirislaby@kernel.org>, 
	jkeeping@inmusicbrands.com, john.ogness@linutronix.de, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	markus.mayer@linaro.org, matt.porter@linaro.org, namcao@linutronix.de, 
	paulmck@kernel.org, pmladek@suse.com, schnelle@linux.ibm.com, 
	sunilvl@ventanamicro.com, tim.kryger@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Tue, May 6, 2025 at 8:00=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 6 May 2025, Yunhui Cui wrote:
>
> > Failure to check the UART_LSR_DR before reading UART_RX, or the
> > non-atomic nature of clearing the FIFO and reading UART_RX, poses
> > potential risks that could lead to PSLVERR.
>
> Don't expect reader to know the condition how PSLVERR is triggered. I kno=
w
> it's worded out in the other patch but also explain it here.
>
> You're only explaining problem and missing what this patch does to solve
> the problem.
>
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  drivers/tty/serial/8250/8250.h      | 13 +++++++++
> >  drivers/tty/serial/8250/8250_port.c | 43 +++++++++++++++--------------
> >  2 files changed, 35 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8=
250.h
> > index b861585ca02a..6f97ff3a197d 100644
> > --- a/drivers/tty/serial/8250/8250.h
> > +++ b/drivers/tty/serial/8250/8250.h
> > @@ -162,6 +162,19 @@ static inline u16 serial_lsr_in(struct uart_8250_p=
ort *up)
> >       return lsr;
> >  }
> >
> > +/*
> > + * To avoid PSLVERR, check UART_LSR_DR in UART_LSR before
> > + * reading UART_RX.
> > + */
> > +static inline void serial8250_discard_data(struct uart_8250_port *up)
> > +{
> > +     u16 lsr;
> > +
> > +     lsr =3D serial_in(up, UART_LSR);
> > +     if (lsr & UART_LSR_DR)
> > +             serial_in(up, UART_RX);
> > +}
> > +
> >  /*
> >   * For the 16C950
> >   */
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8=
250/8250_port.c
> > index a913135d5217..1666b965f6a0 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -1357,9 +1357,8 @@ static void autoconfig_irq(struct uart_8250_port =
*up)
> >       /* Synchronize UART_IER access against the console. */
> >       uart_port_lock_irq(port);
> >       serial_out(up, UART_IER, UART_IER_ALL_INTR);
> > +     serial8250_discard_data(up);
> >       uart_port_unlock_irq(port);
> > -     serial_in(up, UART_LSR);
> > -     serial_in(up, UART_RX);
> >       serial_in(up, UART_IIR);
> >       serial_in(up, UART_MSR);
> >       serial_out(up, UART_TX, 0xFF);
> > @@ -2137,25 +2136,22 @@ static void wait_for_xmitr(struct uart_8250_por=
t *up, int bits)
> >  static int serial8250_get_poll_char(struct uart_port *port)
> >  {
> >       struct uart_8250_port *up =3D up_to_u8250p(port);
> > -     int status;
> > +     int status =3D NO_POLL_CHAR;
> >       u16 lsr;
> > +     unsigned long flags;
> >
> >       serial8250_rpm_get(up);
> >
> > +     uart_port_lock_irqsave(port, &flags);
> >       lsr =3D serial_port_in(port, UART_LSR);
> > +     if (lsr & UART_LSR_DR)
> > +             status =3D serial_port_in(port, UART_RX);
> > +     uart_port_unlock_irqrestore(port, flags);
> >
> > -     if (!(lsr & UART_LSR_DR)) {
> > -             status =3D NO_POLL_CHAR;
> > -             goto out;
> > -     }
> > -
> > -     status =3D serial_port_in(port, UART_RX);
> > -out:
> >       serial8250_rpm_put(up);
> >       return status;
>
> Not a problem that originates from you, but IMO calling this variable
> "status" is quite misleading when it is the character (or NO_POLL_CHAR
> is no character is present).
>
> >  }
> >
> > -
> >  static void serial8250_put_poll_char(struct uart_port *port,
> >                        unsigned char c)
> >  {
> > @@ -2264,13 +2260,17 @@ int serial8250_do_startup(struct uart_port *por=
t)
> >        * Clear the FIFO buffers and disable them.
> >        * (they will be reenabled in set_termios())
> >        */
> > +     uart_port_lock_irqsave(port, &flags);
> >       serial8250_clear_fifos(up);
> >
> >       /*
> > -      * Clear the interrupt registers.
> > +      * Read UART_RX to clear interrupts (e.g., Character Timeout).
> > +      * No data on UART_IIR_RX_TIMEOUT, UART_LSR_DR won't set.
> > +      * FIFO disabled, read UART_RX without LSR check, no PSLVERR.
>
> I don't understand what the last two lines mean and I don't see the
> connection to the code that is below the comment either, could you try to
> rephrase the comment.

The original intention was to check UART_LSR_DR first when reading
UART_RX. However, the purpose of serial_port_in(port, UART_RX) here is
to clear the interrupt, such as the interrupt caused by RX_TIMEOUT.

The logic for clearing the interrupt in the interrupt handling
function of RX_TIMEOUT is !UART_LSR_DR. And to avoid PSLVERR, we need
to check UART_LSR_DR first. To meet the requirements of both, the FIFO
needs to be disabled.

Therefore, we should put serial8250_clear_fifos() and the execution of
serial_port_in(port, UART_RX) without checking UART_LSR_DR under the
port->lock.

>
> >        */
> >       serial_port_in(port, UART_LSR);
> >       serial_port_in(port, UART_RX);
> > +     uart_port_unlock_irqrestore(port, flags);
> >       serial_port_in(port, UART_IIR);
> >       serial_port_in(port, UART_MSR);
> >
> > @@ -2429,15 +2429,14 @@ int serial8250_do_startup(struct uart_port *por=
t)
> >       }
> >
> >  dont_test_tx_en:
> > -     uart_port_unlock_irqrestore(port, flags);
> >
> >       /*
> >        * Clear the interrupt registers again for luck, and clear the
> >        * saved flags to avoid getting false values from polling
> >        * routines or the previous session.
> >        */
> > -     serial_port_in(port, UART_LSR);
> > -     serial_port_in(port, UART_RX);
> > +     serial8250_discard_data(up);
> > +     uart_port_unlock_irqrestore(port, flags);
> >       serial_port_in(port, UART_IIR);
> >       serial_port_in(port, UART_MSR);
> >       up->lsr_saved_flags =3D 0;
> > @@ -2519,7 +2518,6 @@ void serial8250_do_shutdown(struct uart_port *por=
t)
> >               port->mctrl &=3D ~TIOCM_OUT2;
> >
> >       serial8250_set_mctrl(port, port->mctrl);
> > -     uart_port_unlock_irqrestore(port, flags);
> >
> >       /*
> >        * Disable break condition and FIFOs
> > @@ -2527,6 +2525,14 @@ void serial8250_do_shutdown(struct uart_port *po=
rt)
> >       serial_port_out(port, UART_LCR,
> >                       serial_port_in(port, UART_LCR) & ~UART_LCR_SBC);
> >       serial8250_clear_fifos(up);
> > +     /*
> > +      * Read data port to reset things, and then unlink from
> > +      * the IRQ chain.
> > +      * Since reading UART_RX clears interrupts, doing so with
> > +      * FIFO disabled won't trigger PSLVERR.
> > +      */
> > +     serial_port_in(port, UART_RX);
> > +     uart_port_unlock_irqrestore(port, flags);
> >
> >  #ifdef CONFIG_SERIAL_8250_RSA
> >       /*
> > @@ -2535,11 +2541,6 @@ void serial8250_do_shutdown(struct uart_port *po=
rt)
> >       disable_rsa(up);
> >  #endif
> >
> > -     /*
> > -      * Read data port to reset things, and then unlink from
> > -      * the IRQ chain.
> > -      */
> > -     serial_port_in(port, UART_RX);
> >       serial8250_rpm_put(up);
> >
> >       up->ops->release_irq(up);
> >
>
> --
>  i.
>

Thanks,
Yunhui
