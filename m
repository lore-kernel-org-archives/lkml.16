Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2741DE891
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839961; cv=none; b=Qbc8Om3BG9ewg0WF98JaOzeU/U1axrbF8sIhnk8bfHIJhiq7ilMHhM84ygPExGFZ9+wFlZu6WHjFS7HgASa7oqgk7XZHC+MzfOCJoOVN84grA6Khey/7tGrOghlOBhe1BY7vdpjpz4fhrLCHnr4gu8wXu48C3eR1eHxBU2QHwnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839961; c=relaxed/simple;
	bh=t/hNx4QalVHff6YRnNaEnWsq4whex6lDDimLZjRgiVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgX10k9oOQWWdklgTpVqjchsn0yhlat08Vvk9Suzs+39qKpZ7f8PgRDnTkep04lSgU3qZ1TrF5xeBRMIheiYLHGIookN4+FkOtBA1y9WhsVH4RVkwU6dCkk6bdRheOWXo/rZg3rnkjaQlchIy170n5o68JGWtre5NhOa81IW8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eff4Y2dx; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eff4Y2dx"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32803984059so34910601fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747839957; x=1748444757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fgtATkkMoYB6W3PQNjfHmndwjINL8bUu6n/jgjecn3E=;
        b=eff4Y2dxy6+OlzdYEJF6BDIemKER8zJXcPNx7bDMpZDlVdlecfO4hsK99dNGlW2mwF
         r/iBkLBBu3y1VqNePL19sixEYT6lKW5dDGShJxdDcrgAodgb8VUQdo5JErAYxf4pvJ+9
         p+T4WrAIALwzMfmVl0cXhLS3DaPpgI3e3wIAXi/cjO69GmBka/VZRdfQoO1VY3yOpRso
         /JWTNFdwoJXhx+Vu8ayB84L5+fQGBjCQkpvRG3CucyYe/ENLWaYYJb/8c4Kv22jHQ/mQ
         TMPyOkiEBXpl4rvz5ofrEqnIngQ0sAplTtqLYCWBSMWjXZIRO4yojftuHgxLqx5Q90X+
         Dx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839957; x=1748444757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgtATkkMoYB6W3PQNjfHmndwjINL8bUu6n/jgjecn3E=;
        b=gMlczZEtf38rvZV2vBJ69btujbMrmzc4XheL8J2y629bSE8Wk7YRRG3ZqGgamPwd1Q
         4Ia7obevpgFp9+CK/waxD4X1YitnLWJgYpTnBpSEL4hNru1kV/MSir/Aa5ugwlKvX/Y0
         0e3zp/4Y2s6Xm83eUpHOdZjQ16ahgbJXjB7WzlQ2oQdh2syGdKtmud2I/cSkHHuTZTAK
         CkJ1DZLB83y9nf+Np79oe/Szf3DiMrdg5bptzYO5JmomOdMmRc5iYGq6VbmEnEi++RU7
         t9yYS0y7QszxET6KnnziUvD0ktMr2yV3AIhMecAWv4Q/pvvnzyJN1d1jfGXaG0I82lOg
         Qohw==
X-Forwarded-Encrypted: i=1; AJvYcCWjWNPzpYzJFA/q22DiuYNg+baotY+ou/TMxD0HkZhyhkd2wAdEkJ4oPP/x9vnbTFPlJxGoBVDsocgF7cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCZkbP9nCMioF2hq7YI5v9F3cLPGTxr1rNalA9JqeN5FZzbv2
	bL0bUWYt60dPDGxYWJSfFc+IHS+/Ywd/iMPZ1OlULsbrYhxa7z6KIA4YkUTGWaxv4SuNUFoenm0
	GYK0lwIxNoUBSVejz7XmUBljLjDNKambIYNdEobGW
X-Gm-Gg: ASbGncsJj8xligBiKMqHFaiKppUdPKpf5WzOePFnI5MEVvy/abxYs2BA5W8/6q3beNZ
	WKf3YI6iruQ9BN5e2Mwvv0lIKOTus4+FTbeBWGagNbHu65xgb1V/Zkk7ovdSQ6icWv4X3u724lr
	m1qL3dH52tzmY6J3wmwHtPUez8KQRnDpmnRWVozQ1McTLGq5r8sNTBbolY1ihtEPgdQbFSmrffA
	yLc
X-Google-Smtp-Source: AGHT+IH0304dOhCdu+sanvp564LHTSr3O1pCJfJouacvoSxf1Pzlylr5aFj6lhaGPTE9T8Se4tGWQAo08R3f2UYD2S0=
X-Received: by 2002:a2e:bccf:0:b0:327:e0ac:bd8c with SMTP id
 38308e7fff4ca-328077c61b3mr75575951fa.37.1747839956771; Wed, 21 May 2025
 08:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740386567.git.dvyukov@google.com> <de940218d0a59fd930ec244d87f2375b16a7815a.1740386567.git.dvyukov@google.com>
 <87y0xf3h3e.ffs@tglx>
In-Reply-To: <87y0xf3h3e.ffs@tglx>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 May 2025 17:05:33 +0200
X-Gm-Features: AX0GCFsuBiztl3tqBcNoiQeNwF83SceRvZrLt6Zy-EnKhcUZvuXUD1yLVrVhFys
Message-ID: <CACT4Y+YCSk8P-5gh06pSRzLDT7m+L_4wj_yuj4hcwupjk_b=Ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] syscall_user_dispatch: Allow allowed range wrap-around
To: Thomas Gleixner <tglx@linutronix.de>
Cc: krisman@collabora.com, luto@kernel.org, peterz@infradead.org, 
	keescook@chromium.org, gregory.price@memverge.com, 
	Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Mar 2025 at 12:19, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Feb 24 2025 at 09:45, Dmitry Vyukov wrote:
> > There are two possible scenarios for syscall filtering:
> >  - having a trusted/allowed range of PCs, and intercepting everything else
> >  - or the opposite: a single untrusted/intercepted range and allowing
> >    everything else
> > The current implementation only allows the former use case due to
> > allowed range wrap-around check. Allow the latter use case as well
> > by removing the wrap-around check.
> > The latter use case is relevant for any kind of sandboxing scenario,
> > or monitoring behavior of a single library. If a program wants to
> > intercept syscalls for PC range [START, END) then it needs to call:
> > prctl(..., END, -(END-START), ...);
> > which sets a wrap-around range that excludes everything
> > besides [START, END).
>
> That's not really intuitive and the implementation changes the prctl()
> behaviour in a non backwards compatible way.
>
> Can we please keep the current behaviour and have a new mode. Something
> like:
>
>  # define PR_SYS_DISPATCH_OFF            0
>  # define PR_SYS_DISPATCH_ON             1
>  # define PR_SYS_DISPATCH_EXCLUSIVE_ON   PR_SYS_DISPATCH_ON
>  # define PR_SYS_DISPATCH_INCLUSIVE_ON   2
>
> That keeps the current mode backwards compatible and avoids the oddity of
>
>      prctl(..., END, -(END-START), ...);
>
> i.e. this is clearly and obvious distinguishable for user space:
>
>      prctl(..., PR_SYS_DISPATCH_EXCLUSIVE_ON, END, END - START, ...);
>      prctl(..., PR_SYS_DISPATCH_INCLUSIVE_ON, END, END - START, ...);
>
> Which makes a lot of sense because these two modes are distinctly
> different, no?
>
> PR_SYS_DISPATCH_INCLUSIVE_ON will fail on older kernels and both modes
> have a sanity check. PR_SYS_DISPATCH_INCLUSIVE_ON should at least check
> for a zero length dispatcher region.
>
> Aside of the better user interface this avoids the in_compat_syscall()
> hack. Because then set_syscall_user_dispatch() does the range inversion
> and that works completely independent of compat.
>
> > kernel/entry/syscall_user_dispatch.c | 9 +++------
> > kernel/sys.c                         | 6 ++++++
> > 2 files changed, 9 insertions(+), 6 deletions(-)
>
> This clearly lacks an update of
>
>      Documentation/admin-guide/syscall-user-dispatch.rst

I like this!

I've just sent v3 with this interface.
