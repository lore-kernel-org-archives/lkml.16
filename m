Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83282135BC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833074; cv=none; b=PomsTUUuhYUgJnmBmTd92QpFmYg+10BkxViZL2Vb1DLjfdyUFSKs84Lf3y4fr53SbuFDjkx8C+Nc59P4Nr42q9qv4T0aVR2YNNsc1+RIUUjjfy3oB+2TMPdNCrUdy1f8k0whBR9yhSC+kKFodHFuhnJ5ByXCuo/Uf3ha2v1cG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833074; c=relaxed/simple;
	bh=xfwOxsDgYunx//JZHasoSCroD3+r4OvjrSj4RQ3NaR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObJiraQ8sObOdXkzdTnxdO24BA4cBO2/Ocyk8LBFV2ZRvH1v0hTCjcGVXQInYhEL/PE74xMZU17AGJm59FsmR1LfaLCo4JgydtLM2cgEAmJZCl3IhwcdAMv3UPbtJtvue0WwOJdKBZzGC28AvmC3nFJLe6ZGq+MpMra1SYJ9Zaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YC+R8j3N; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YC+R8j3N"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3294724b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749833071; x=1750437871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFsHs2L6+8EBoJ/ILRzyWwmWoJe5zrU0k/YrygGMeNA=;
        b=YC+R8j3NF8nZ74DBbo2H4YE/g6+wREQVqpk7Ksfw+IbQpMDrk7+qr4bEHB7Zwib/09
         7HT7QNfpqhN20tltPqld5knkYk9+3tG+kFpKxp8Zq1zvPKJEvg7SORggAk8v8rJYLiM8
         0yEl+y7XQC+bYRE4T8yxbr9khIh9YSkpilKV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833071; x=1750437871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFsHs2L6+8EBoJ/ILRzyWwmWoJe5zrU0k/YrygGMeNA=;
        b=XrIXI8POECxiho+9CMzn1aIXJNRf8UF/kog5XJj/jkFxTahY0rLW3H8dzQ255k8CZB
         BU2RF24Exw2sohzirAhR9s5QxAI3wSGfonYLZ8p7H34cIAqxXf4Y9fzjzb9yzGsvrcO1
         kXN8fJp4hyXzmerddqTflADBzl10Kckk9ul9v1IH8LQUvKJMkNIwB12d/zxDI0QgUJ38
         NoeNb1QAafaKnzvBCuDjbJe1GZjSRYBudVxY7CMdu79qmiz8LRi43uQuYrpuqameGkLb
         /3rTQDI5YZOx6Mnv4h+BAn4dAUpTIN4urn44lu+77X4LZcqDTl/5MtUpkSzbcWitHMKl
         By+g==
X-Forwarded-Encrypted: i=1; AJvYcCX8woGzsqv1F3VI5ObAZvHFEqCLhIlt0U6X9G6yAq3qX5kZbKBvNva55M81iGMz0D25q2zp5cWMma6BWfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1tK6LGWy/dLgztlelVs8S2CEMrG+/71gBl/T4wBi/c4nPdYa
	IikgW4fNzThFIAnj9Xcdry/7C9G5KLG7lbQyEYxMCBv/8lCHFOQHk7bRNMwNaunGnMGpaXe34y2
	YXJk=
X-Gm-Gg: ASbGncuDwmhqTroH9PWt1+legXdsNDWu+o9RUmS8gJs6j0VLpWlhVNCxZoqZyfItHnh
	+MUKOikuS7VVTocz+JWuhUd45ilSlfOAkqZJzIeOkOIZtVcabRbGpI6zbiOHCMR4/DxSCMjIh4N
	w4NcaZ4kjEk/1L8MMWTFh1QZE+erFzGbaJp5Lvb/h7ywWudcx5Y+7cRqiVaGapR7+zUcWn7ykAB
	Wn4lt/aWCbmBipMM0tb9JQtwYi7pg6YPNTwl/1Er9jaGyRJRaLkPMHD4sW2mpeB9YQTMzWz0gVN
	qUTu50eFhPPa3h+l92Ex6XvX4qBFk/NJM3i4SOmlUAjhM6EXLH+b3twinxFuQWfjxNPoWj6g1l5
	Tj8BtqUlZAyCjnS5GgXPAM8qGIlh7Xw==
X-Google-Smtp-Source: AGHT+IF7Qm4Yu+9MMLAYgiQSpUXRqm258b20JLXkVlWjc9L2lPxkzikEWgDPctgRthNxwf1nSI13lA==
X-Received: by 2002:a05:6a00:a450:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-748982baf5emr1491353b3a.3.1749833071034;
        Fri, 13 Jun 2025 09:44:31 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900062cesm1878151b3a.57.2025.06.13.09.44.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:44:30 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2f645eba5dso2559328a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDt6ydAvTpViJzuBeZxz9/Gbc6buY7iy1Ye1VZDVv957WiIg5sWynW3dBnhqzwlzmCIUMs7hUbMD73Cso=@vger.kernel.org
X-Received: by 2002:a17:902:fc84:b0:234:9fe1:8fc6 with SMTP id
 d9443c01a7336-236678a6caamr20933585ad.18.1749833069252; Fri, 13 Jun 2025
 09:44:29 -0700 (PDT)
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
 <aErcrCKcsi9cpANY@pathway.suse.cz> <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
 <aEwC81RhvveGP73Y@pathway.suse.cz>
In-Reply-To: <aEwC81RhvveGP73Y@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Jun 2025 09:44:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwJ8b2Qd52dUG7DrbkVz2XdjCgXoThh2i3gi=+vGqFAw@mail.gmail.com>
X-Gm-Features: AX0GCFsbz4DtEeKeZs4XLMlp6WpvZqtedSANACGhbS0pNgSY94ZUMPk-yfpPG_M
Message-ID: <CAD=FV=XwJ8b2Qd52dUG7DrbkVz2XdjCgXoThh2i3gi=+vGqFAw@mail.gmail.com>
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

On Fri, Jun 13, 2025 at 3:52=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2025-06-12 16:16:09, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jun 12, 2025 at 6:57=E2=80=AFAM Petr Mladek <pmladek@suse.com> =
wrote:
> > >
> > > > > > > @@ -577,7 +577,8 @@ static int __init kgdboc_earlycon_init(ch=
ar
> > > > > > > *opt)
> > > > > > >         console_list_lock();
> > > > > > >         for_each_console(con) {
> > > > > > >                 if (con->write && con->read &&
> > > > > > > -                   (con->flags & (CON_BOOT | CON_ENABLED)) &=
&
> > > > > > > +                   (con->flags & CON_BOOT) &&
> > > > > > > +                   ((con->flags & CON_SUSPENDED) =3D=3D 0) &=
&
> > > > > >
> > > > > > I haven't tried running the code, so I could easily be mistaken=
,
> > > > > > but...
> > > > > >
> > > > > > ...the above doesn't seem like the correct conversion. The old
> > > > > > expression was:
> > > > > >
> > > > > > (con->flags & (CON_BOOT | CON_ENABLED))
> > > > > >
> > > It is easy to get confused by the register_console() code. And
> > > it has been even worse some years ago.
> > >
> > > Anyway, the current code sets CON_ENABLED for all registered
> > > consoles, including CON_BOOT consoles. The flag is cleared only
> > > by console_suspend()[*] or unregister_console().
> > >
> > > IMHO, kgdboc_earlycon_init() does not need to care about
> > > console_suspend() because the kernel could not be suspended
> > > during boot. Does this makes sense?
> >
> > Yeah, makes sense to me.
> >
> > > Resume:
> > >
> > > I would remove the check of CON_ENABLED or CON_SUSPENDED
> > > from kgdboc_earlycon_init() completely.
> > >
> > > IMHO, we should keep the check of CON_BOOT because we do not
> > > want to register "normal" console drivers as kgdboc_earlycon_io_ops.
> > > It is later removed by kgdboc_earlycon_deinit(). I guess
> > > that the code is not ready to handle a takeover from normal
> > > to normal (even the same) console driver.
> >
> > I'm not sure I understand your last sentence there. In general the
> > code handling all of the possible handoff (or lack of handoff) cases
> > between kgdboc_earlycon and regular kgdboc is pretty wacky. At one
> > point I thought through it all and tried to test as many scenarios as
> > I could and I seem to remember trying to model some of the behavior on
> > how earlycon worked. If something looks broken here then let me know.
>
> Later update: The code is safe. The scenario below does not exist,
>               see the "WAIT:" section below.
>
>
> I am not familiar with the kgdb init code. I thought about the
> following scenario:
>
> 1. kgdboc_earlycon_init() registers some struct console via
>
>         kgdboc_earlycon_io_ops.cons =3D con;
>         pr_info("Going to register kgdb with earlycon '%s'\n", con->name)=
;
>         if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) !=3D 0) {
>
>    and sets
>
>                 earlycon_orig_exit =3D con->exit;
>                 con->exit =3D kgdboc_earlycon_deferred_exit;
>
>
> 2. Later, configure_kgdboc() would find some "preferred" console
>    and register it via
>
>         for_each_console_srcu(cons) {
>                 int idx;
>                 if (cons->device && cons->device(cons, &idx) =3D=3D p &&
>                     idx =3D=3D tty_line) {
>                         kgdboc_io_ops.cons =3D cons;
> [...]
>         err =3D kgdb_register_io_module(&kgdboc_io_ops);
>
>    , where kgdb_register_io_module would call deinit for the
>    previously registered kgdboc_earlycon_io_ops:
>
>         if (old_dbg_io_ops) {
>                 old_dbg_io_ops->deinit();
>                 return 0;
>         }
>
>    , where kgdboc_earlycon_deinit() might call the .exit() callback
>
>                 kgdboc_earlycon_io_ops.cons->exit(kgdboc_earlycon_io_ops.=
cons);
>
>
> BANG: If both "kgdboc_earlycon_io_ops" and "kgdboc_io_ops" pointed to
>       the same struct console then this might call .exit() callback
>       for a console which is still being used.
>
>       But I am wrong, see below.
>
> WAIT:
>
> I have got all the pieces together when writing this mail).
> I see that the code is safe, namely:
>
> static void kgdboc_earlycon_deinit(void)
> {
>         if (!kgdboc_earlycon_io_ops.cons)
>                 return;
>
>         if (kgdboc_earlycon_io_ops.cons->exit =3D=3D kgdboc_earlycon_defe=
rred_exit)
>                 /*
>                  * kgdboc_earlycon is exiting but original boot console e=
xit
>                  * was never called (AKA kgdboc_earlycon_deferred_exit()
>                  * didn't ever run).  Undo our trap.
>                  */
>                 kgdboc_earlycon_io_ops.cons->exit =3D earlycon_orig_exit;
>         else if (kgdboc_earlycon_io_ops.cons->exit)
>                 /*
>                  * We skipped calling the exit() routine so we could try =
to
>                  * keep using the boot console even after it went away.  =
We're
>                  * finally done so call the function now.
>                  */
>                 kgdboc_earlycon_io_ops.cons->exit(kgdboc_earlycon_io_ops.=
cons);
>
>         kgdboc_earlycon_io_ops.cons =3D NULL;
> }
>
> It calls kgdboc_earlycon_io_ops.cons->exit() only when
> unregister_console() tried to call the original con->exit()
> which was reassigned to kgdboc_earlycon_deferred_exit()...
>
> Updated resume:
>
> It looks to me that even normal console can be used by
> kgdboc_earlycon_io_ops and we could remove even the check
> of the CON_BOOT flag.
>
> My expectation:
>
> If a "struct console" is registered then the driver is used
> by printk() and it should be safe even for kgdboc_earlycon,
> as long as it has both "con->write" and "con->read" callbacks.
>
> So the check in kgdboc_earlycon_init() might be:
>
>         for_each_console(con) {
>                 if (con->write && con->read &&
>                     (!opt || !opt[0] || strcmp(con->name, opt) =3D=3D 0))
>                         break;
>         }
>
> Heh, I hope that you were able to follow my thoughts and I did not
> create even bigger confusion.

I didn't go back to the code and trace through every step you made,
but it sounds like the code looks OK even if it's a bit convoluted
(sorry about that! at least it's commented!).

I agree with your final suggestion for the check. That has the side
effect of also being less of a change from what we had before. Because
of how the code was written before, it would have allowed any console
because it checked for "enabled or boot" and all consoles were
enabled. So just getting rid of the check for flags seems reasonable
to me.

-Doug
