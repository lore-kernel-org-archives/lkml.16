Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE11E25F8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227646; cv=none; b=faiERkCPrXRzaYkWZTfB6pUpzv38dupyaNt94GxRqOAZ58P4PMV+E78xBapMqwuazHdXwYipZkLBIyzRQ+wg+zYkeD3B+Sn7jvUMLh5pbwO/umEEqwlhm0fgDr4jpsedPGSVh3NjdylWH/ShbNEp3bt17mU60+g5BUsigWX5nfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227646; c=relaxed/simple;
	bh=r2P/jqnlG8ER5T2kcyLzbg88KxQ1hQIle5v/J/VH4RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvDBeWtZ/dReytx42cvFxpbLRWyxjRTM2FKkJkk0Vp1KBxQFdz7OLC4YQicSllILkVA0rfzZfBMPZGztHL+sCLtLgbR3Xyo+GdLr6GrGsOzwwnjYBr/5sPFvxNRTwJoMRTcZGxKT0ZMmaSvwZqz2Rn2PJvyEXIWBnUljGxuSdLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjqK4vYT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjqK4vYT"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e7967cf67so6691575e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750227643; x=1750832443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIX0DhlfHWBvvUubwltKbzItPX4eDrBzSY0SuHSHILE=;
        b=ZjqK4vYT8yM1XCzbWqGGNSsTvL9/q5OwTnQ5pmnPzH12Dwuf9+oBSjWdeUhfiASRja
         UA1GUTP1ofhcjj9yahz3fBGVeXFcABuY0QOD0PetijTfYJBPNX91TMY0BcPgxpxIAVNk
         XN4XhFyXcTIaE5bEZoSRcpZtZpK4yzLdxMbCr7ja8M5jjiOE/I4prdq9IFvyAX7qIv+c
         HvgEnHeTYEZVOpe+mUYDPQ2CZ1zpZVveK+gUJGMeOw1+82T+2KKo+/oU3NU0RpCr9W7e
         rnCGRGEubigFpOeQ3JO0G0Ncu7Rsjp6kna5szuRYupugeQvvopxSGgwziZWRdq4TuauJ
         7etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750227643; x=1750832443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIX0DhlfHWBvvUubwltKbzItPX4eDrBzSY0SuHSHILE=;
        b=LT+J4s7ri5R5wHEQejJGaG9sR5krhwPXPNpYislaz7wc1m92OREPcESmpLz1KaFQzE
         L7mEsVa26CMFEPnTaTt4zIVlLCkcpLvmnBiX6apJ/6fgiOVrtXTPNGr3aSsR8wNIg3mw
         K6WH9LyawxmVTi/WhjP105d5AU1Vbj/Mh64hMYV/ZnaKT1C/qxJov7jTH0Sfezsq1aoj
         EWjE0bQzK9yTgVjRkW+pQ0Rouo+eiwBaY7UyDaW7DsvB4m4CD4Bifibt/Ogk1WUU7G3V
         FTXb42LebuEtZ/cUZ1FZJKSIQvkqevMUiu+5BwIg6jP9/aaXt9iw6fAcIUKKx6fMNFjS
         j2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUm9AXFgOhTQ8yICWncp/OEzlVKp/zVX53GPpngb4vRIHF39aku+k/qWZiOQ4lI0P2ykkKGm4qVpyTQM64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzifNdAqtfolegxurdqfBI1FM35tqDnxg164gG86AiG8a3Z6QB
	nVfCUYF3L+XFh3ZfLNriGWwm14LJ4EujtLhSp7LFeMTb2emkjtROByg8ywLajE1tVLjUBWMr8DU
	Ax89/Ycbm5bIN7SKndqlVRE+gobZh8Vc=
X-Gm-Gg: ASbGncsnCkMXFhJYxe+dY2h9nBabYkr6IkSK+OwfHvQRscCLiX3ZiJ8Zjj9An3vn0zr
	G+HI+FeXN6HkfDaqYMIHGgeIjdGPwb2gmaN+MgF6Yj1Vy8Ec12J0ChF4UuOfUeQW0oEsIDWOKia
	LMKWRbDGKHUaixyGbzfzMZpB6UncKGURh+yQPsl+R4cDg9u3s10UQ9XEaRFggK4NUXKi2D8RIG0
	WDUmg==
X-Google-Smtp-Source: AGHT+IFDwTlSZDjQACLoP7ljsYhRuDW1C2uoKdnb91cZZMLXrn21OYVXh8RXGHMFWPKcrLuKWobe5N+eLwVuZQ+7gLA=
X-Received: by 2002:a05:6512:31c9:b0:553:28a6:4384 with SMTP id
 2adb3069b0e04-553b6e68a2cmr4807234e87.10.1750227642416; Tue, 17 Jun 2025
 23:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
 <87cybdp7to.ffs@tglx> <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
 <87frg3ss9s.ffs@tglx>
In-Reply-To: <87frg3ss9s.ffs@tglx>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 18 Jun 2025 11:50:31 +0530
X-Gm-Features: Ac12FXxjciqKI82M-DbqXPNhkQ3tfmpyi86Fx9VXoSkenBP_2KlF1yVqsqV4iO0
Message-ID: <CAH4c4j+P2MJWZWv6M2s+wOdfCF6q6Wyq3=VsB=uNCtEH1LMp-g@mail.gmail.com>
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-kernel@vger.kernel.org, jann@thejh.net, keescook@chromium.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 6:38=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 11 2025 at 19:33, Pranav Tyagi wrote:
> > On Mon, Jun 9, 2025 at 3:15=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> > Does the revised version below address the concerns more effectively
> > or does it still need a bit more seasoning?
> >
> > "Currently, sys_get_robust_list() and compat_get_robust_list() perform =
a
> > ptrace_may_access() check to verify if the calling task is allowed to
> > query another task=E2=80=99s robust_list pointer. However, this check i=
s racy
> > against a concurrent exec() in the target process.
> >
> > During exec(), a task's credentials and memory mappings can change, and
> > the task may transition from a non-privileged binary to a privileged on=
e
> > (e.g., a setuid binary). If get_robust_list() performs ptrace_may_acces=
s()
> > before this transition, it may wrongly allow access to sensitive
> > information after the target becomes privileged.
> >
> > To address this, a read lock is taken on signal->exec_update_lock prior
> > to invoking ptrace_may_access() and accessing the robust_list. This
> > ensures that the target task's exec state remains stable during the
> > check, allowing for consistent and synchronized validation of
> > credentials."
>
> That's way better, but it still does not explain what the consequences
> of the racy access are.

"The racy access allows a malicious observer to exploit a window during
which ptrace_may_access() passes before a target process transitions to
a privileged state via exec(). For example, consider a non-privileged
task T that is about to execute a setuid-root binary. An attacker task A
calls get_robust_list(T) while T is still unprivileged. Since
ptrace_may_access() checks permissions based on current credentials, it
succeeds.

However, if T begins its exec() immediately afterward, it becomes
privileged and may change its memory mappings. Because get_robust_list()
proceeds to access T->robust_list without synchronizing with exec(), it
may read user-space pointers from a now-privileged process. This
violates the intended post-exec access restrictions and could expose
sensitive memory addresses or be used as a primitive in a larger exploit
chain.

Thus, the race can lead to unauthorized disclosure of information across
privilege boundaries and poses a potential security risk. Taking a read
lock on exec_update_lock ensures that the target task's exec state
remains stable during both the permission check and the access,
preventing this inconsistent and potentially unsafe access."

I hope this explains the consequences of the race condition. If it is fine,
I'll add it to changelog when I resubmit with the helper function.

> >>
> >> You really did not have a better idea than copying all of that logic
> >> into the compat code?
> >
> > As I=E2=80=99m still learning, I wasn=E2=80=99t quite sure how to avoid
> > duplication there. Would factoring out the common logic into a helper f=
unction
> > be the right direction? I=E2=80=99d be grateful for your suggestion.
>
> Exactly.
>
> Thanks,
>
>         tglx
