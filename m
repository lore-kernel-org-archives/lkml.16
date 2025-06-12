Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236C15C158
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749770189; cv=none; b=i+n3u95s3xiHeFshk2q2CWFZDO3hUz6jj5iDxwSM9gMGlmU1yaZthAzNTtDY0U7bMOW27BoQa/NZgsVKEIQcvuXcAmC8KvZHHcFlTZ78kP/q8Z1IiTxqMHNW6rEeOXCx7V0mFeH/y63gApJNzd7M3pjMaQXlu+4moEuwA1He7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749770189; c=relaxed/simple;
	bh=GVl2AarfDIZ4o7KzER4XK3b0vrUv5ejYJly+UE5yuvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt/5vUWUk0UqWXKw9cGwXdi7VyFMzNHMObFEtPu/3V+oKnujSCw/3pcTgGnkVsPWfzeyy+bbkpLxbcVczIgUTSeUOHzN6DNuyvu/QpQdppivJamMeQX7rJ4QMPdeB5zwH7tO/wkHWqUN/QaKjmCmOpREGAKbS4g+LEdVMsQP1pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W0xvOEUM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W0xvOEUM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2511470b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749770184; x=1750374984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VX2tp7vE9Xc39hTYGYaV6T2gV76j7v4yp4p4MnAvSyU=;
        b=W0xvOEUM+jDmqIsvkaag+Xlz9Pznvo0LHwZjq+MfQom5TmG71yAwF09EYP6ykIWnbR
         +Y9a1ozaaRfXIIp9cZslYoVDBmKabC/y5XK+6cY9S3n6+C1xN3geo3Q+dbYN8N91kxtl
         WcWdqkgMkvtyKSJTFSw66BrGdD7ZRM3hKFs1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749770184; x=1750374984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VX2tp7vE9Xc39hTYGYaV6T2gV76j7v4yp4p4MnAvSyU=;
        b=uQ839//iWkaDxUKd98pJMC5XRbq96QB61iPtGyp7eGXCd218dx8o/ks7EcIds+Ti/T
         OHInw34u8RP1SOYxiW4ccM7p4xMZcU+xJXxOL5ksIcH3WDQONnz9UlvHW5rBH2sCuT2I
         ZQCSBJb6GTRp2WtOV5m/LBwoZUl9aEC6Po56Xk0+NRx0SWFfenip4r+qb0ljKoY19n13
         c94OFd74hnMfRcKaKKwnQueQyKU/t0Os+zPF7nS9NlMbIYApykK+xszp/llbNDBaKcjD
         BY0CU+ol6wIxkM0kEZDepYSBFrsdq++rKQj1UMhUapqOp0n/N71aaPTOKTOSLqzaMGvx
         Yegg==
X-Forwarded-Encrypted: i=1; AJvYcCXqiWVX2g6SHACrJ+DSLYhFRUwUP8xxvmZZ0KY1JoPymHKXW31S7I/ebyQrVQO4C55W3Lf8XXOmoMlSJjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPMrtxT5IQTO+v4kjz/e/laksy4C7IGyYsuN0pRgU6vfNQj46
	jx8te+TrA0rM/4yT6A6BoJMoDH3B+g1O1USmMlBc7Bwf61LfaM0Ma8HVXQlq2Ee5IIe3uybljpx
	jn1I=
X-Gm-Gg: ASbGncvp1ZDte6CMoU+bR4DC2mwQRWY78XVJ+tPDcbilkSDRxNZCCAyPgunQVl/aFMF
	2WFkzQdCTmJcjKRFzBdZ4bCwx48J72xbddfDEStPuEKE1dQczey/wKAZ2aphzMIx2rXPw1rQz0+
	s7Jh3ZUvA7rlTyyET8XR0CD+3d+PPwbZBJJdv+P/Zzp5C+/vlz1hdIemOA/GSOBwn1Pn89d8TVb
	mQCbcfBoTCeNDc94XqNQdihReuXilI8grjm076OrkkDlKycL3pXLmMDpNJPXuJnA0yJQaIdYqfS
	jxXdNTwGaTyIbrNp1fHiLVUi9i4MsjnyiCrdX4Ho7cw2ScGJrfug+5QJ/2TRUuQBFKchWas7iAZ
	ImECjfkPOD8/qh4ppbe0GAagdbFFTQA==
X-Google-Smtp-Source: AGHT+IH5aJVynTlH0zRz7meaVZ9r2y97cXnJCBpLP6fpX5FYrgFvQUTObzVPUFpknb7i6dN7BmpOng==
X-Received: by 2002:a17:90b:3dcb:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-313dc298ab4mr496311a91.10.1749770184035;
        Thu, 12 Jun 2025 16:16:24 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb4f85sm2624715ad.183.2025.06.12.16.16.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 16:16:22 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2c4476d381so1369674a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFnuWQAh2ueJ3sRiYeBKqpNY6Ax02RrhYq+0iJZUNDGUUpZiYq6jcvuYD4o5unXUyn9QD1myMmhOpWYcY=@vger.kernel.org
X-Received: by 2002:a17:90b:588b:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-313dc227afamr497218a91.4.1749770181738; Thu, 12 Jun 2025
 16:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
 <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com> <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
 <aErcrCKcsi9cpANY@pathway.suse.cz>
In-Reply-To: <aErcrCKcsi9cpANY@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 16:16:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
X-Gm-Features: AX0GCFujYjZY5QQA0SHYIPZy8d0O0rad7ID3hPYo1lls7-hp2LxFCT3Du9JnL2k
Message-ID: <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: serial: kgdboc: Check CON_SUSPENDED instead
 of CON_ENABLED
To: Petr Mladek <pmladek@suse.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
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

On Thu, Jun 12, 2025 at 6:57=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> > > > > @@ -577,7 +577,8 @@ static int __init kgdboc_earlycon_init(char
> > > > > *opt)
> > > > >         console_list_lock();
> > > > >         for_each_console(con) {
> > > > >                 if (con->write && con->read &&
> > > > > -                   (con->flags & (CON_BOOT | CON_ENABLED)) &&
> > > > > +                   (con->flags & CON_BOOT) &&
> > > > > +                   ((con->flags & CON_SUSPENDED) =3D=3D 0) &&
> > > >
> > > > I haven't tried running the code, so I could easily be mistaken,
> > > > but...
> > > >
> > > > ...the above doesn't seem like the correct conversion. The old
> > > > expression was:
> > > >
> > > > (con->flags & (CON_BOOT | CON_ENABLED))
> > > >
> > > > That would evaluate to non-zero (true) if the console was _either_
> > > > "boot" or "enabled".
> > > >
> > > > The new expression is is:
> > > >
> > > > (con->flags & CON_BOOT) && ((con->flags & CON_SUSPENDED) =3D=3D 0)
> > > >
> > > > That's only true if the console is _both_ "boot" and "not suspended=
".
> > >
> > > My idea here was that the users of for_each_console would find the
> > > first available console, and by available I would expect them to be
> > > usable. In this case, is there any value for kgdboc to use a console
> > > that is suspended? Would it work in this case?
> > >
> > > I never really used kgdboc, but only checking if the console was
> > > enabled (which it's always the case here) was something that needed t=
o
> > > be fixed.
> > >
> > > Maybe I'm missing something here as well, so please let me know if I
> > > should remove the new check.
> >
> > So it's been 5 years since I wrote the code, but reading that I was
> > checking for:
> >
> >   (con->flags & (CON_BOOT | CON_ENABLED))
> >
> > Makes me believe that this was the case when I wrote the code:
> > 1. Early boot consoles (earlycon) were not marked as CON_ENABLED but
> > were instead marked as CON_BOOT.
> > 2. Once consoles became non-early they were moved to CON_ENABLED.
> >
> > ...and the code was basically looking for any consoles with a matching
> > name that were either boot consoles or normal/enabled consoles.
> >
> > Is that a plausible theory? It's also possible that I just was
> > confused when I code things up and that I really meant to write:
>
> It is easy to get confused by the register_console() code. And
> it has been even worse some years ago.
>
> Anyway, the current code sets CON_ENABLED for all registered
> consoles, including CON_BOOT consoles. The flag is cleared only
> by console_suspend()[*] or unregister_console().
>
> IMHO, kgdboc_earlycon_init() does not need to care about
> console_suspend() because the kernel could not be suspended
> during boot. Does this makes sense?

Yeah, makes sense to me.


> Also it does not need to care about unregister_console() because
> the unregistered console won't be listed by for_each_console().
>
> [*] The 1st patch in this patchset updates console_suspend()
>     to set CON_SUSPENDED instead of clearing CON_ENABLED.
>     It helps to make it clear that it is suspend-related.
>
>
> Resume:
>
> I would remove the check of CON_ENABLED or CON_SUSPENDED
> from kgdboc_earlycon_init() completely.
>
> IMHO, we should keep the check of CON_BOOT because we do not
> want to register "normal" console drivers as kgdboc_earlycon_io_ops.
> It is later removed by kgdboc_earlycon_deinit(). I guess
> that the code is not ready to handle a takeover from normal
> to normal (even the same) console driver.

I'm not sure I understand your last sentence there. In general the
code handling all of the possible handoff (or lack of handoff) cases
between kgdboc_earlycon and regular kgdboc is pretty wacky. At one
point I thought through it all and tried to test as many scenarios as
I could and I seem to remember trying to model some of the behavior on
how earlycon worked. If something looks broken here then let me know.


> To make it clear, I would use:
>
>         for_each_console(con) {
>                 if (con->write && con->read &&
>                     (con->flags & CON_BOOT) &&
>                     (!opt || !opt[0] || strcmp(con->name, opt) =3D=3D 0))
>                         break;
>         }
>
> And I would do this change as the 1st patch in the patchset
> before we change the flag modified by console_suspend().

Seems OK to me.

-Doug
