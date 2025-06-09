Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADD28033F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452581; cv=none; b=JYPebQGh4cFR1xGsrTLVoj1qwyVyjG/qGR0RpQNBLpcpXrR5U176ZyroQ1RGb+YoqQJFe3hP4ISn4SdexqIHq2Llpups3SKgSVsLmSvssPgV37OpCIJUfGDA9oYZ+TrPo3nTkzJOP2EEdIYD7GxHc+ZTjtx09yRoJ7Mv2pMyfoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452581; c=relaxed/simple;
	bh=S8fMRb/pNZfo6KEjY8l9YetEwYEAJ2ej7DTgEr3gLDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlX6DZBLDHNGU17CwPgSes3Uyr4cy5W/kgw4jrwuyeUZ52HDQN67KwV5Yar5zke/F+o48Ocjgx6wJQ+MD4ij7UhqO6edHdF41Bi9OkoA8IZ+YBEQua0+J6B1CPWXeQFQrdy6G/dA5hGSVpya6P5rUDdejntEqaxWqY7CpnRY048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fbSfYtIB; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fbSfYtIB"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2da73158006so3084024fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749452579; x=1750057379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8223fsD/IEHnEpRfxR/6JS/tsDBYZuVwnOiA2sfiMIE=;
        b=fbSfYtIBp9k+nJ/RJGFvSKhcLS1KyXRMWgMuY6J4A+N1Q4XpcoUlEkWK2xWBgJo31p
         wPPNTCNq043bnhuY64GPhLjN9Hl/22O120bsGwKhlJQE7bb8d2Rbz8Ax6MEjD0P6MgmE
         YsaNueOcMfww1vBivJWuycYGRAyczLnoVzUchzvei2gN3VUVmIG1CYmi6rZbzs0sHbx9
         JDyeSzUiXKL09Q2hiqNsSxQlDpXQlxxBi9MST9WcNLxVVNc1LFzO1iYbZ+0nnhdiAqls
         HBLvCCYRelvjEEh/k6y6SNrbmWK/qs0BrApFJyx9083w3BQO4BXEk7AihS4KXdJoPDwF
         iLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749452579; x=1750057379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8223fsD/IEHnEpRfxR/6JS/tsDBYZuVwnOiA2sfiMIE=;
        b=Ok2BtBimiHOaJrhzRZZbErvvzd6cTaz778psw+GVgFIArn4sUVkoI2yuLWE2SQAXbw
         8DuwAfCVMVQBPI4rHifBMr9kjsxN2nzX2zvf2J0yEg1WjVj+QYElCC/RC51giHiq1YkA
         TJsFqq6Nx28bBrjvFJk5xx5wfhFx1LTLDgVRGuMuz3AiZjDueVjBhBewvjmefyQPVlxT
         Xv+wZ42h7jY9ozIrjPDQtgqnvs5sKCgfzgy/7iIOIpsWcupYeuqeUgMuMhIQU3t2OCDc
         6tL2yQnwkRg7SdWwN1YKk/2+u93lSW3qZ32+zSQUL57bosUUZzBIfKrBk3VnChemOB+x
         Pl9g==
X-Forwarded-Encrypted: i=1; AJvYcCUch1cKX0/IFwV78TNobzMcxUJkdSQ1vDNjtSpG1VcE7Vs2EAjAMDwGdHHQ5xrus8X5DpwKg6J8njlIZt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwihEfgzT/PFUtiKX25ZdL6vML+h1qh0RShoc/uZfL5H2Q+hRa/
	263DemUg1Mtow03Jmeq4em+CDY++9f+S6NKmCYTZqGSAx94qTEjbHdmj6WGVHBOFVhkHnrIIeby
	2J/VOyz8S2VxmGVBwMV9X4ba+3F5nLjzqFliNAb8gtA==
X-Gm-Gg: ASbGncvyxjfTbbV+CnAh0zrrjUXFRNezbzCl+xov/7OG0IHtFwx2KUiyEpw0g3fImdx
	pT/gADc3XjCZ0EV5d4BUup/REPfeO9+hvTruBC//xmFShAPCNgUNZyrfqRf+kU3+R59NnfEc1hU
	ju8+6KSK2KQDiXU4iwVtsLzeTrBxgl4eoDqiSqVrtPuaQOXg==
X-Google-Smtp-Source: AGHT+IH1nxoI2XvMM7f85vg72xn7IbH1IhOyMv7tTDbpvh3JBSFHmswM2t153ADD6iCcfsT/oKucRb66bfSmRHyAaag=
X-Received: by 2002:a05:6870:1994:b0:2d4:ef88:97bb with SMTP id
 586e51a60fabf-2ea00633f53mr7181695fac.1.1749452578810; Mon, 09 Jun 2025
 00:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528062609.25104-1-cuiyunhui@bytedance.com> <2025060621-hankie-groovy-bad6@gregkh>
In-Reply-To: <2025060621-hankie-groovy-bad6@gregkh>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Jun 2025 15:02:47 +0800
X-Gm-Features: AX0GCFt2g1WWTOdG3if77QeLjjHzxyv5anTnGECTOVqS1-c1TzNIWHg7hGyjWfI
Message-ID: <CAEEQ3w=Xfn=o9idu0KZKEALYvogiJ2fSCjC9jAkKLkCZ5E4hKg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 1/4] serial: 8250: fix panic due to PSLVERR
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, andriy.shevchenko@linux.intel.com, 
	benjamin.larsson@genexis.eu, heikki.krogerus@linux.intel.com, 
	ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, 
	jkeeping@inmusicbrands.com, john.ogness@linutronix.de, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	markus.mayer@linaro.org, matt.porter@linaro.org, namcao@linutronix.de, 
	paulmck@kernel.org, pmladek@suse.com, schnelle@linux.ibm.com, 
	sunilvl@ventanamicro.com, tim.kryger@linaro.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 6, 2025 at 6:40=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, May 28, 2025 at 02:26:06PM +0800, Yunhui Cui wrote:
> > When the PSLVERR_RESP_EN parameter is set to 1, the device generates
> > an error response if an attempt is made to read an empty RBR (Receive
> > Buffer Register) while the FIFO is enabled.
> >
> > In serial8250_do_startup(), calling serial_port_out(port, UART_LCR,
> > UART_LCR_WLEN8) triggers dw8250_check_lcr(), which invokes
> > dw8250_force_idle() and serial8250_clear_and_reinit_fifos(). The latter
> > function enables the FIFO via serial_out(p, UART_FCR, p->fcr).
> > Execution proceeds to the serial_port_in(port, UART_RX).
> > This satisfies the PSLVERR trigger condition.
> >
> > When another CPU (e.g., using printk()) is accessing the UART (UART
> > is busy), the current CPU fails the check (value & ~UART_LCR_SPAR) =3D=
=3D
> > (lcr & ~UART_LCR_SPAR) in dw8250_check_lcr(), causing it to enter
> > dw8250_force_idle().
> >
> > Put serial_port_out(port, UART_LCR, UART_LCR_WLEN8) under the port->loc=
k
> > to fix this issue.
> >
> > Panic backtrace:
> > [    0.442336] Oops - unknown exception [#1]
> > [    0.442343] epc : dw8250_serial_in32+0x1e/0x4a
> > [    0.442351]  ra : serial8250_do_startup+0x2c8/0x88e
> > ...
> > [    0.442416] console_on_rootfs+0x26/0x70
> >
> > Fixes: c49436b657d0 ("serial: 8250_dw: Improve unwritable LCR workaroun=
d")
> > Link: https://lore.kernel.org/all/84cydt5peu.fsf@jogness.linutronix.de/=
T/
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  drivers/tty/serial/8250/8250_port.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8=
250/8250_port.c
> > index 6d7b8c4667c9c..07fe818dffa34 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -2376,9 +2376,10 @@ int serial8250_do_startup(struct uart_port *port=
)
> >       /*
> >        * Now, initialize the UART
> >        */
> > -     serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
> >
> >       uart_port_lock_irqsave(port, &flags);
> > +     serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
> > +
> >       if (up->port.flags & UPF_FOURPORT) {
> >               if (!up->port.irq)
> >                       up->port.mctrl |=3D TIOCM_OUT1;
> > --
> > 2.39.5
> >
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

Okay, update under v8.

>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot

Thanks,
Yunhui
