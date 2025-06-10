Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2F2D540A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597519; cv=none; b=dwUoS0S2KgT1DbweEfjLQc6i0gbs0wlSeJdppl43DQRc6LMknLmxCfEj7ihnVQ1WhyhCsAIgUFKgqis7IH2CF+pxX822/n2GdlJrjkB6UxatDdB88sdrPNA5ckxrRM/3q9vkdFJI+TUHLYmBFxqXK2uFHO1YvTMupQRuv/uGiyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597519; c=relaxed/simple;
	bh=6wCR/wOF6mnpcOQvAKfddSkIw1hDl8dX/s/2AHpXUDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeCDhaID+EmqI/aQOQbVI4KYgUE7CVD7TiGOd51vrqYd2vxy7QGV2Sz9iAbNs8L2S5tJTPQZI48dUgTTsYqXeYOmqegU7854qoT3q7rxibma0e8m/wOv1dy7wLM9JCZ3dOglTb8sIRLjnXSvrj+wVlqp+rjOUu/mwKaWIsMKNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CUuPaI5K; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CUuPaI5K"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235ae05d224so2991815ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749597517; x=1750202317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtgyGRFsx3W1moknyTRh8eklG3kKIqbE5e8lYnyeAfo=;
        b=CUuPaI5KzUKyJkwoeekCL5Q17GL1lzHiLdCRldr/Bpu2hNzrt1YtPGiXhk7Uq2VGYc
         vYkSu7dxUdcrxhn5cUjnxnvIMU8e15RplLqFzm+3WOWRnW2BRSKPXHePzIxCktrlv0gB
         G53XMLAJby+FJjPFkwprsh8xJIKYWNWqpLrV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749597517; x=1750202317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtgyGRFsx3W1moknyTRh8eklG3kKIqbE5e8lYnyeAfo=;
        b=DTFbBnSSq3LkLyW7iw1ulNs28WRd3o11Tmj1yvll10xSDmkfz6Fz/zyXMcHSkJr8po
         F83t1+lyqRrst32iLOX/zHyFwP6BV1Kzhow34YTOksvWQYD/+PFfmLxhQ+3Q5PeU6isZ
         7YXA5Tie4pE/NyQ932ZbpUlS7gcfEybftObNexivIHI6rLV27F99aT3kj4iya5cOVeTS
         SwEm/0Chkif1qot15VhDUjuhdZfTTc3A4tBq7O0Tf5CDCJg/MsUr6fPhhUfhGU1p3pCl
         ihoziIdG8+9mnAYyWvcDosuz/2uD5KLvcxSzDNh16hFLh72Dx5mVv1UYnPfrh8cY0D4K
         N4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO+V27i834NARML7wVqbymsJxDTz5E3zXLWXMefzEQqbMtNy6P5J7EfBovnE/IxpkpTJBSfv8dBG4N334=@vger.kernel.org
X-Gm-Message-State: AOJu0YylMoHBvOB4ttXeces5D7PWgnq5766oMo3aF/spUhJC+YanYPH3
	4TVn7XV3qK91jFe0ojByQUuHFnixLkumYLb0h2dTD+GpNo7My59vGK7eu/vBvjdunybN//ur1MO
	uaIY=
X-Gm-Gg: ASbGncsscf2+MF6IZpscCn2yAnHIe2fhZPeyNAJy43RCVnkHCI4OIEXmDkBFJ05Watw
	SxY7Vedc5zwshhgqLDXtdpkDpR2k+Jqa8/BOFANTI+d4gZptB8cm3LXYH1h/gVISJJbPiSchLPE
	95Ot9JxoLbIPQ7rkHa+YRU7P3g/LAZB1gjP0JcAClxaSkV6b/TQNMIDvK5YD+sCCHj6TeObYFQp
	30SSehXXmhG0BaCxAuhNsJ7T/UCO90Dx3/pg9svuzpDJdpx95bjV+3Cr7NIwpfG4W7HnohyKWeR
	TV6XfjSUk26+pmF0mR3QEJeR4vALNwsLeFVn37WK15LAmrg1qZap3bOeV+OJgtWYg2BT7HurXEM
	Jx06JFHJf0qbVuDG56wXiDc8Lww==
X-Google-Smtp-Source: AGHT+IHGT7vLRugh8mv2vhKt7Xagw2EQqe2akVY6Nj4XqLrWW4rs0yLYZwoS0MQAUFLRxemZnEy3QQ==
X-Received: by 2002:a17:902:cf10:b0:224:7a4:b31 with SMTP id d9443c01a7336-236416b838emr13753355ad.6.1749597516908;
        Tue, 10 Jun 2025 16:18:36 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059b3sm75566705ad.175.2025.06.10.16.18.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 16:18:36 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so282765a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcBcCcViF/zKInr5xaES8/oo5z070h88ShMQp1sw8k0b22qJlGtIR5u7t2NFP4KcAw3qRjdEzbnOkcrwk=@vger.kernel.org
X-Received: by 2002:a17:90b:3908:b0:311:ab20:1591 with SMTP id
 98e67ed59e1d1-313af9711a2mr1450240a91.15.1749597515737; Tue, 10 Jun 2025
 16:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com> <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
In-Reply-To: <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 16:18:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
X-Gm-Features: AX0GCFt6n77pbmil8IDH9ETyvVBk9GLYcHe7RwT91u86Q2sJf5v-ZMY6TwpptAA
Message-ID: <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: serial: kgdboc: Check CON_SUSPENDED instead
 of CON_ENABLED
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 10, 2025 at 1:03=E2=80=AFPM Marcos Paulo de Souza
<mpdesouza@suse.com> wrote:
>
> On Mon, 2025-06-09 at 13:13 -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jun 6, 2025 at 7:54=E2=80=AFPM Marcos Paulo de Souza
> > <mpdesouza@suse.com> wrote:
> > >
> > > All consoles found on for_each_console are registered, meaning that
> > > all of
> > > them are CON_ENABLED. The code tries to find an active console, so
> > > check if the
> > > console is not suspended instead.
> > >
> > > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > > ---
> > >  drivers/tty/serial/kgdboc.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serial/kgdboc.c
> > > b/drivers/tty/serial/kgdboc.c
> > > index
> > > 85f6c5a76e0fff556f86f0d45ebc5aadf5b191e8..af6d2208b8ddb82d62f33292b
> > > 006b2923583a0d2 100644
> > > --- a/drivers/tty/serial/kgdboc.c
> > > +++ b/drivers/tty/serial/kgdboc.c
> > > @@ -577,7 +577,8 @@ static int __init kgdboc_earlycon_init(char
> > > *opt)
> > >         console_list_lock();
> > >         for_each_console(con) {
> > >                 if (con->write && con->read &&
> > > -                   (con->flags & (CON_BOOT | CON_ENABLED)) &&
> > > +                   (con->flags & CON_BOOT) &&
> > > +                   ((con->flags & CON_SUSPENDED) =3D=3D 0) &&
> >
> > I haven't tried running the code, so I could easily be mistaken,
> > but...
> >
> > ...the above doesn't seem like the correct conversion. The old
> > expression was:
> >
> > (con->flags & (CON_BOOT | CON_ENABLED))
> >
> > That would evaluate to non-zero (true) if the console was _either_
> > "boot" or "enabled".
> >
> > The new expression is is:
> >
> > (con->flags & CON_BOOT) && ((con->flags & CON_SUSPENDED) =3D=3D 0)
> >
> > That's only true if the console is _both_ "boot" and "not suspended".
>
> My idea here was that the users of for_each_console would find the
> first available console, and by available I would expect them to be
> usable. In this case, is there any value for kgdboc to use a console
> that is suspended? Would it work in this case?
>
> I never really used kgdboc, but only checking if the console was
> enabled (which it's always the case here) was something that needed to
> be fixed.
>
> Maybe I'm missing something here as well, so please let me know if I
> should remove the new check.

So it's been 5 years since I wrote the code, but reading that I was
checking for:

  (con->flags & (CON_BOOT | CON_ENABLED))

Makes me believe that this was the case when I wrote the code:
1. Early boot consoles (earlycon) were not marked as CON_ENABLED but
were instead marked as CON_BOOT.
2. Once consoles became non-early they were moved to CON_ENABLED.

...and the code was basically looking for any consoles with a matching
name that were either boot consoles or normal/enabled consoles.

Is that a plausible theory? It's also possible that I just was
confused when I code things up and that I really meant to write:

((con->flags & (CON_BOOT | CON_ENABLED)) =3D=3D (CON_BOOT | CON_ENABLED))

...AKA that I wanted consoles that were BOOT _and_ ENABLED.

In any case, I booted up the current mainline and I put a printout here. I =
saw:

[    0.000000] kgdboc: DOUG: console qcom_geni has flags 0x0000000f

So that means that both BOOT and ENABLED were set. That makes me feel
like it's plausible that I was confused and really meant BOOT _and_
ENABLED. I didn't spend time trying to figure out how to build/boot an
old kernel to check, though.

In any case, given my test then I think your change should be fine.
Given that it does change the boolean logic, it seems like that
deserves a mention in the commit message.

-Doug
