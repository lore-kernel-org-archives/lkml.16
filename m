Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E6179BD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204119; cv=none; b=fEIAkJuMmaNkRf4aVZl0bX7O++fSdLSvg86cZKyDgrqBorv1JxbhnxsJx0fVsl3nu2HG6ItBclR+XxAsgoanNeWHd3nmtXaNSmkmrEdxchM6PF9qzJXQCCPlpxPmoIHyoYBuYBOUXtxwnHv6N96nMhVNzEW7RtR7Ecwmo6wjJug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204119; c=relaxed/simple;
	bh=AQb46CQkwv8QeUadsbrclWLA6h/SnySMlq4iBKKvV98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ow9YnbWUgKmKx5Xd/zkQAUYDOOe4oaHj4Z8MsT1Te0c7aPIG+Iz1Zz8R268PkFGl0JTT9nrfeoQxElggmP0clOfz2hALDpiKMTr3bGI0+Kkg1PAME7AVzHQi9b0d0w7Uo5wDYWsClnk4BLWpW0jn4AF5FhTi+2ZxNmz/EBcnVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=g3kJj5mP; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="g3kJj5mP"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-400b64ac5fcso1930311b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 19:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745204116; x=1745808916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24kp0DtFzqPBLQcVjtgOgftKsl0Wykg9m8M9N67arVY=;
        b=g3kJj5mPxaVapP9jB4aB11DG9J77pBj+tI3XHzVR/27Z72oA0pBngGiH/91cP63Qeu
         I9KEI/bB8RMsInXLwIPfBJ5xRjdublLjf1C5aYUDuFd4kMflpTvjFkZhoGOrrOp/Bcm8
         YuK7ZJCuSR4h5Q43uhDDfM80la8x03UM7HK/h0kQ1Sb8YsMhtxA+n9A8te5QINGg25yb
         0aVXgkCTLipafFg4Z7ayoCVr/aIH4YVVlujAptSXx/j8V1I1XfHR8fqaCraOYJ9u8HyY
         wDpp54UucPINavtLhKLSEoa6QTiODBCUCPneKIa7cVcymkujBIXI2j7Eptj8AaMZq8SI
         H7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745204116; x=1745808916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24kp0DtFzqPBLQcVjtgOgftKsl0Wykg9m8M9N67arVY=;
        b=jFJhF6OWmpcTzxsDeouyqjwQ/+0JgQMLfSUmSjnPBOo5o4Bf4pTCeD9tQwIqHabXEV
         z/6726GblJmg4ufbwWlD35W31vwRKBZWeU2XrMrz3w7p/MZzvTlimy2z3SiJ2dbgEyIB
         e58q+OpdusrtMXFSo+Ua+2gEbhgDPSU3piQo00X6RZxyLcxKCOdvM6Ld8bQuqa2FG8fs
         JL32hATQacdtIUxGOZEJvuJczlmn9itsyQmR6Ux1+jjC2tfigIsKq7KGCDEg6kb+S6/t
         zz2S1f0QsXsI5RvmrFakPdWy+hlU8W4vAUjrx3KNPB6D6cKaCzPvJbt5IeaVX6PDHbjm
         KddQ==
X-Forwarded-Encrypted: i=1; AJvYcCVryklUhYhq56+r+VEZJVEOtd4ubMrUlonsoIajkKYRrrMjQ4pXnC4G54rkGiU7EyEV4Cp/FH2bStpBzBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFG2cvGvQbbj6I7L6yS9NEi+amn/BUyBCuCMs5DyLH9glgUjE
	pRGSKjkfN0ue3dpLursw8mPQw8aSPkLUcYUqB2IZY5EF71DqteOtXz/EWXkDxDhmMkPn8YkxnPq
	Mh/4GoPU5RxcEGo171zj/vYfWJm7FZggH50eONw==
X-Gm-Gg: ASbGncsC9X9a6BhQWTa3kIpyzWGYeySa7HCR283+4sb5I6yQRbHoQrQZ62wcrFCWbim
	rZ910+Yp989kuDprYgIkivkVog7rbuHjR/q8Dm0E5VrpDk1QyX6WC59ag/fkzAIC/ennaO9buy4
	XYxhiVCsk8DyMiHD3iIatk/3Sb
X-Google-Smtp-Source: AGHT+IGQ/1pe/rx0vrdN1Mljx1yTkRDFB1HBkKKgbmiaqdr/zlWVkn9kXF032wYtBsFK7PAaKvKtp0o7of3PH+VyeuU=
X-Received: by 2002:a05:6808:6b96:b0:401:188e:caa2 with SMTP id
 5614622812f47-401c0c6c149mr6020709b6e.35.1745204116301; Sun, 20 Apr 2025
 19:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414031450.42237-1-cuiyunhui@bytedance.com> <Z_zLqH1Moavhi52x@smile.fi.intel.com>
In-Reply-To: <Z_zLqH1Moavhi52x@smile.fi.intel.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 21 Apr 2025 10:55:05 +0800
X-Gm-Features: ATxdqUER1LqipBsEUKZFgk1sLE_mXfx3MuJPEsX2epvsl4H0rYMzEmZGhAcjimA
Message-ID: <CAEEQ3wnEu2o+h2RY4rTGYR0yMX2EcX+7SdciqfzV3VLGWFyG3A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] serial: 8250: fix panic due to PSLVERR
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, john.ogness@linutronix.de, pmladek@suse.com, 
	arnd@arndb.de, namcao@linutronix.de, benjamin.larsson@genexis.eu, 
	schnelle@linux.ibm.com, heikki.krogerus@linux.intel.com, 
	markus.mayer@linaro.org, tim.kryger@linaro.org, matt.porter@linaro.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Apr 14, 2025 at 4:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 14, 2025 at 11:14:50AM +0800, Yunhui Cui wrote:
>
> You forgot to rebase against latest tty-next or, if there is something
> in the latter (but I don't see right now), even tty-testing.
>
> > When the PSLVERR_RESP_EN parameter is set to 1, the device generates
> > an error response if an attempt is made to read an empty RBR (Receive
> > Buffer Register) while the FIFO is enabled.
> >
> > In serial8250_do_startup(), calling serial_port_out(port, UART_LCR,
> > UART_LCR_WLEN8) triggers dw8250_check_lcr(), which invokes
> > dw8250_force_idle() and serial8250_clear_and_reinit_fifos(). The latter
> > function enables the FIFO via serial_out(p, UART_FCR, p->fcr).
> > Execution proceeds to the dont_test_tx_en label:
> > ...
> > serial_port_in(port, UART_RX);
> > This satisfies the PSLVERR trigger condition.
> >
> > Because another CPU(e.g., using printk()) is accessing the UART (UART
> > is busy), the current CPU fails the check (value & ~UART_LCR_SPAR) =3D=
=3D
> > (lcr & ~UART_LCR_SPAR), causing it to enter dw8250_force_idle().
> >
> > To fix this, all calls to serial_out(UART_LCR) and serial_in(UART_RX)
> > should be executed under port->lock. Additionally, checking the readine=
ss
> > via UART_LSR should also be done under port->lock.
> >
> > Panic backtrace:
> > [    0.442336] Oops - unknown exception [#1]
> > [    0.442343] epc : dw8250_serial_in32+0x1e/0x4a
> > [    0.442351]  ra : serial8250_do_startup+0x2c8/0x88e
> > ...
> > [    0.442416] console_on_rootfs+0x26/0x70
>
> This patch seems need split to three. See below.
>
> ...
>
> First of all, while everything looks better now, there is a chance in the
> future to miss the same issue again. In order to avoid that I suggest to
> introduce a new helper where you made this check _and_ add a comment why.
>
> (Note that currently you have a mixture of serial_in()/serial_port_in() i=
n
>  some cases.)
>
> static inline unsigned int serial8250_discard_data(struct uart_8250_port =
*up)
> {
>         u16 lsr;
>
>         lsr =3D serial_in(up, UART_LSR);
>         if (lsr & UART_LSR_DR)
>                 return serial_in(up, UART_RX);
>
>         return 0;
> }
>
> And this can be one patch (patch 2).
>
> ...
>
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
>
> Changes here deserve the separate patch (patch 1).

Splitting into a patchset is fine. What does "patch 1" refer to here?

>
> ...
>
> > +     /*
> > +      * Serial_in(p, UART_RX) should be under port->lock, but we can't=
 add
>
> serial_in()

Okay.

>
> > +      * it to avoid AA deadlock as we're unsure if serial_out*(...UART=
_LCR)
> > +      * is under port->lock.
> > +      */
> > +     lockdep_assert_held_once(&p->lock);
>
> ...
>
> > +     uart_port_lock_irqsave(port, &flags);
>
> And one patch (patch 3) about locking.

Okay.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks,
Yunhui
