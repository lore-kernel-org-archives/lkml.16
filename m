Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08F1F5825
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689660; cv=none; b=dKvTe6g9Cy2ecXC+EqfB6KwXqyihtGsGRRQdgWpH9kGByNk1+Fry5xOosNM2vYNSwBDOrL1ZsdcLS8LrWwpCUwdD5cy9oVr6SCNWcrbNm6PPyLQuE1Euo0+v9On7+Tzxj3lyaVooqFaQw5kJpv9mOQWXGnJKTqxqi4iJBHEnbVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689660; c=relaxed/simple;
	bh=Dwzx87w8EtvbAkXcWgx2YvgPMNEUBDqrUT38s8IWuSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBXwtan7TmOr/XIbkIlUScEc8+tb9VnFxWMEQirA/VlDBtrUjDwCGj4DnZTI0ye6M0rGP1uv+Fo285BYw9B0sXmIWyPZnezCf0hoNhsSCI9St3JHvtAkQ/74O9p37xD2NGQYZhJo1g50TLmb8OCWQBg7SqIt3OQX74xN+FC0UU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WFmPq58Z; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WFmPq58Z"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6021e3daeabso464447eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743689657; x=1744294457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kck1Cl+HJBYNvP9X5x5v2o9+GYId7MzkAZKah4xkyC8=;
        b=WFmPq58ZZKu112AlldP+mOWdcETto2xYwqkFEFlZG+Hl2FnQ1UgUxFzGe8B33u0nO3
         GyOK5tqtUhtN/YJrbAmt4u1dkKR3TEsAANvs7CxeTODau9suSo00B2UtHAXVhgSLvTok
         n1q4v28v3M76Ci4SJtSXGElrSh0awAtTrCefOTQaXNq6nEqem9jmtalMXNMEp7dPZfka
         Brnt4GBuxocQEGmemMTL69z+xPnE3GgrZrKa37dZY4tnRuQO3hZ7wWMEvhySn6kpZVwc
         UWDmB54MvZBFPC3CslRScAMgcfxUanLEMJGTkeCeb7qdvb6HufpckN0MPtF7jwtoWvRx
         1m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689657; x=1744294457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kck1Cl+HJBYNvP9X5x5v2o9+GYId7MzkAZKah4xkyC8=;
        b=VIduXFAH9DwdRfzHXsQYWN3YL/g0iHv4wMAICwSB/8pE/GX+aZImYziBHWIeC7z5kK
         vflTFytKiLBUi9IgKiES8LlbrrWyOQ/s8J8hP9HacziBhh+JNA4nDQxse80soG7I8eoh
         V0FhRkVSG7UmthWLu8dop3H6IS37SSGrtNr7o1lYH7x4Ha7N84VGeV4QpUJLzWO+CAMC
         qTYJ2hQGhfMyILr1PrEu1f94t6ap/hGlqDl1L9xqGL7UdBN5v2LvrmzGw8BAb7UxU0iu
         BVlGks9g30TLvV8FYNkqPKW1GiexWY2M5Nz14W9lO1asyCwF6cjEhp/GdBtL8rc3dkVt
         VhMA==
X-Forwarded-Encrypted: i=1; AJvYcCWKSCd+/rpaVG+8qCH5peJbL+yEvCbcWn1bepyPbvmBH6vs8ScTiR7jon+/BVruQmn0BDKdhNxaFZg/BJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuQLwlBxXkM3SWX1ShzPax9dZDb3aurKo1uCN590KjKv42I6d
	CeFwaaXNKjmBkjulv/106jmWvdjT6GjDkTChBkNHmr04hva3jBKIBO7wz6hiteOHfYX5StesU3F
	02/11TwIRNqHkbGQclTS83i1wFnotWFZsM1bVyQ==
X-Gm-Gg: ASbGncuaeUsK7FNplyKtNhPtwir8EcoUUmQiICaISH8qJCE9xPr5j2U+Q7/pkUGo9Ca
	+vK5ptmPLjyZrz78EE1gZHSn0K/dKTxJzvbc/5LbQvR2DF1OuLo7c9oz+zSrZ6erIpWBx5UeuMp
	AiTvFg4WACH12D0s98vP5uqgm+IUTU
X-Google-Smtp-Source: AGHT+IGX5KdsVkdyCcGAAVIGt94/fElHG9XoZOO7zDHLRiXppj/8z3JsXluRyGAYsTNTxSjatXvhKZhwGYzPgahAa3k=
X-Received: by 2002:a05:6820:160b:b0:603:ff71:aef9 with SMTP id
 006d021491bc7-60400227113mr2706914eaf.4.1743689657251; Thu, 03 Apr 2025
 07:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403090336.16643-1-cuiyunhui@bytedance.com>
 <84iknl5uex.fsf@jogness.linutronix.de> <CAEEQ3wkOQUh03Ggpf=mBWzNt1_Qtcv53gNXm7JH5Nban3tOtvQ@mail.gmail.com>
 <84cydt5peu.fsf@jogness.linutronix.de>
In-Reply-To: <84cydt5peu.fsf@jogness.linutronix.de>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 3 Apr 2025 22:14:05 +0800
X-Gm-Features: AQ5f1Jq2zgr86N_n3aGrsrAxWOISOU-dCYKO2Zmrl-cxu0OJKD3hOBpTrrWnfO4
Message-ID: <CAEEQ3w=GnSF2Ka+nVM+HNZOmFxzcomPf9uDqOJZV=RU17OZijQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] serial: 8250: fix panic due to PSLVERR
To: John Ogness <john.ogness@linutronix.de>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, pmladek@suse.com, 
	arnd@arndb.de, andriy.shevchenko@linux.intel.com, namcao@linutronix.de, 
	benjamin.larsson@genexis.eu, schnelle@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Apr 3, 2025 at 9:46=E2=80=AFPM John Ogness <john.ogness@linutronix.=
de> wrote:
>
> On 2025-04-03, yunhui cui <cuiyunhui@bytedance.com> wrote:
> >>> When the PSLVERR_RESP_EN parameter is set to 1, the device generates
> >>> an error response if an attempt is made to read an empty RBR (Receive
> >>> Buffer Register) while the FIFO is enabled.
> >>>
> >>> In serial8250_do_startup, calling serial_port_out(port, UART_LCR,
> >>> UART_LCR_WLEN8) triggers dw8250_check_lcr(), which invokes
> >>> dw8250_force_idle() and serial8250_clear_and_reinit_fifos(). The latt=
er
> >>> function enables the FIFO via serial_out(p, UART_FCR, p->fcr).
> >>> Execution proceeds to the dont_test_tx_en label:
> >>> ...
> >>> serial_port_in(port, UART_RX);
> >>> This satisfies the PSLVERR trigger condition.
> >>>
> >>> Because another CPU(e.g., using printk) is accessing the UART (UART
> >>> is busy), the current CPU fails the check (value & ~UART_LCR_SPAR) =
=3D=3D
> >>> (lcr & ~UART_LCR_SPAR), causing it to enter dw8250_force_idle().
> >>
> >> Didn't this[0] patch resolve this exact issue?
> >>
> >> John Ogness
> >>
> >> [0] https://lore.kernel.org/lkml/20220713131722.2316829-1-vamshigajjel=
a@google.com
> >
> > No, these are two separate issues. This[0] patch is necessary, as
> > expressed in this comment:
> >
> > /*
> > * With PSLVERR_RESP_EN parameter set to 1, the device generates an
> > * error response when an attempt to read an empty RBR with FIFO
> > * enabled.
> > */
> >
> > The current patch addresses the following scenario:
> >
> > cpuA is accessing the UART via printk(), causing the UART to be busy.
> > cpuB follows the CallTrace path:
> > -serial8250_do_startup()
> > --serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
> > ---dw8250_serial_out32
> > ----dw8250_check_lcr
> > -----dw8250_force_idle (triggered by UART busy)
> > ------serial8250_clear_and_reinit_fifos
> > -------serial_out(p, UART_FCR, p->fcr); (enables FIFO here)
> > cpuB proceeds to the dont_test_tx_en label:
> >    ...
> >    serial_port_in(port, UART_RX); //FIFO is enabled, and the UART has
> > no data to read, causing the device to generate a PSLVERR error and
> > panic.
> >
> > Our solution:
> > Relevant serial_port_out operations should be placed in a critical sect=
ion.
> > Before reading UART_RX, check if data is available (e.g., by verifying
> > the UART_LSR DR bit is set).
>
> OK, now I see. The problem is the explicit reads of UART_RX near the end
> of serial8250_do_startup().
>
> >> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/=
8250/8250_port.c
> >> index 3f256e96c722..6909c81109db 100644
> >> --- a/drivers/tty/serial/8250/8250_port.c
> >> +++ b/drivers/tty/serial/8250/8250_port.c
> >> @@ -2264,13 +2264,16 @@ int serial8250_do_startup(struct uart_port *po=
rt)
> >>       * Clear the FIFO buffers and disable them.
> >>       * (they will be reenabled in set_termios())
> >>       */
> >> +    uart_port_lock_irqsave(port, &flags);
> >>      serial8250_clear_fifos(up);
> >> +    uart_port_unlock_irqrestore(port, flags);
>
> Can you clarify why serial8250_clear_fifos() needs to be in a critical
> section?

There are two aspects. Firstly, if the lock is not held, the following
situation may also occur when serial8250_clear_fifos() is called:
---dw8250_serial_out32
----dw8250_check_lcr
-----dw8250_force_idle (triggered by UART busy)
------serial8250_clear_and_reinit_fifos
-------serial_out(p, UART_FCR, p->fcr); (enables FIFO here)
This in itself goes against the semantics of clear_fifo.

Secondly, if a CPU is accessing the UART normally and the current CPU
suddenly clears the FIFO, it may cause problems.

>
> serial8250_do_shutdown() and do_set_rxtrig() also call
> serial8250_clear_fifos() without holding the port lock.
>
> >>>     /*
> >>>      * Clear the interrupt registers.
> >>>      */
> >>> -   serial_port_in(port, UART_LSR);
> >>> -   serial_port_in(port, UART_RX);
> >>> +   lsr =3D serial_port_in(port, UART_LSR);
> >>> +   if (lsr & UART_LSR_DR)
> >>> +           serial_port_in(port, UART_RX);
>
> Do we care about the unchecked UART_RX in serial8250_do_shutdown()?

I understand that it is required.

>
>         /*
>          * Read data port to reset things, and then unlink from
>          * the IRQ chain.
>          */
>         serial_port_in(port, UART_RX);
>         serial8250_rpm_put(up);
>
>         up->ops->release_irq(up);
> }
>
> Otherwise all other UART_RX reads are either checking UART_LSR_DR first
> or are under the port lock.

Agree

>
> John

Thanks,
Yunhui
