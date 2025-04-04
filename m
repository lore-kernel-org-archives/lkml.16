Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF3DF49
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778172; cv=none; b=lN+4zA4ruEHwd7VhceccIvJNre5t88HeVaVnK8TLHhZ4dwPIzPscXIxzXQ4y4lGZEj6jaf+xVwlRVFs9Kq30odUcikcbsO0FTCAK5Xtg5bhF6VaJ6+FNtMVPKPdCEAnAUIQP9sOH+gENYLl91mAKuMJLlW7E+8CWJjIIMus4xTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778172; c=relaxed/simple;
	bh=HWEwvlns1Ly/r8WD4RQwDUQgwHBMsKXMWgoveY3P+zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrqEFobUBBI6y5OHhny13MKJiLiwlozdbRMyYXhcLTFaGVP6E+IBYEOYNyEI25jQpk8st4+db+tY4ulbtQn5cpwO9tcamMauYQ9Qt2ASENfkMPuBiNRy2gArkjSY28BJmt+HOuQg08yLG/7iVanq4euyTxZKfwTuIIbMTWNkmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9YdINPw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9YdINPw"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5497590ffbbso2231303e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743778169; x=1744382969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leY/xg6XC3NyUz7dkUGCTjCK0i+9QqtbvMPeRWQQtmA=;
        b=R9YdINPwH9Nx99Te3qYcew4odrAUBmY0rWoKFdiqgMad4pdttcQeyj5s4wOuRk2D9j
         R9gK3Pm3E/8+C7XOD6Kj4MEyDkuwwUrTwmWcbclbYwTAMSAMfXK4WbNPHVY1QfWmaREL
         KRqZ4FP6wAsu3T3YAuh6tAt7t8jtAJAGgJnGeL5RAd7mW7SHWETpvRL9A+SgtV8c97PA
         LI2tx6Zeo2wegrUbBdHieRfwaZHN7J9TcBpax0bMmZ6vo5MhnpqbtjK8kGBAehexiHvJ
         tT1h1hYHJi859WFJca5rxKsvSTvO+YhOjgNhPa7BlW+gGwnlbvhcu+4v5LrKaXCUsNYM
         AJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743778169; x=1744382969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leY/xg6XC3NyUz7dkUGCTjCK0i+9QqtbvMPeRWQQtmA=;
        b=bZC8EdA3D44PN6uj6eMMNBP/Mc+lM6tg2MxN4mpizOq0vyJjDyhiN61lW+qysJGd86
         8nLe1pa5iiP3tQnr8MZpZIU79SWVMWNxrAuFkvz20sozbD+mD9NADDcylV8tw3d50jEK
         lZZ/iddlGqShJtk8xWJOoRFQ7zzfbjYkRGxqN19H2H7l7m9EwdJWTvYsSu+shc/+q0Z8
         BZlzkbc2UID/6k/kI1oXxTnx5cGarPdLED5+KaLXh2Alu5VPydNvzSytSFm40zpUACB5
         Qd1PQsvKMKcc+YuVb/6p4AeUMJ6TeVgthucP62gA4ktWnrpSnM9FtqkP+3yQ2waeVBUh
         bTbA==
X-Gm-Message-State: AOJu0Yz7/3cLoz1YIaBdjj0ZY5R+CUJUO4YawBVUKFzxluyRuTuFZt5V
	REMtQ1q6vYHPtZAn9TByDP/6CvmvINN2ITY04yQKaIxcVhYsHKVLTR44c9RlJzqgn0spt+cCRHd
	37RzEH26Xh7SjJ2pswnaIf3cgnWDQwyaI
X-Gm-Gg: ASbGnctmDviGm0+L/q7wfgWqLbgOUlXBW2GBYEExyncf6HJQ5CdzZAipsZt2JJPcFG6
	AtwiEVrSfkeCH+RhX0nu3QLfAEavunyEPC7eyK32G80jo5muJefOpwYtr0pSR6JAjh8uu7PIv3f
	kcMzaAlH5SscP9Ywy/YZOBnsE7wA==
X-Google-Smtp-Source: AGHT+IGeO3deHz7Z6lu4AEXP+KsNpdpo9V7f2PDANKBVAbV7lF+kQ5yvv7kmZqcFHD7O3LRpuxHbf+VCOTQ/Cvvr500=
X-Received: by 2002:a2e:a58e:0:b0:30d:b25d:72d0 with SMTP id
 38308e7fff4ca-30f0bf4711bmr8504741fa.17.1743778168597; Fri, 04 Apr 2025
 07:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
 <1640cf43-8125-a562-91f9-9b306b863dc7@gmail.com> <4fff7dd0-70e4-4ec8-9ca7-7f7c52382d51@citrix.com>
In-Reply-To: <4fff7dd0-70e4-4ec8-9ca7-7f7c52382d51@citrix.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Apr 2025 16:49:16 +0200
X-Gm-Features: ATxdqUGnUnv8zBITkxZYp6w4nZu6zljDnB_q6pNBr12X9VQ0Ae64Z2mLh78w08k
Message-ID: <CAFULd4bYr1dMxFypc_kMfQMo8EReUO+0SmyDrOQEcUu3tzvqvg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 4:16=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 04/04/2025 3:14 pm, Uros Bizjak wrote:
> >
> >
> > On 2. 04. 25 19:24, Andrew Cooper wrote:
> >> Commit 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
> >> workaround, add barriers") adds barriers, justified with:
> >>
> >>    ... and add memory barriers around it since the documentation is
> >> explicit
> >>    that CLFLUSH is only ordered with respect to MFENCE.
> >>
> >> This also triggered the same adjustment in commit
> >> f8e617f45829 ("sched/idle/x86: Optimize unnecessary mwait_idle() resch=
ed
> >> IPIs") during development, although it failed to get the
> >> static_cpu_has_bug()
> >> treatment.
> >>
> >> X86_BUG_CLFLUSH_MONITOR (a.k.a the AAI65 errata) is specific to Intel
> >> CPUs,
> >> and the SDM currently states:
> >>
> >>    Executions of the CLFLUSH instruction are ordered with respect to
> >> each
> >>    other and with respect to writes, locked read-modify-write
> >> instructions,
> >>    and fence instructions[1].
> >>
> >> With footnote 1 reading:
> >>
> >>    Earlier versions of this manual specified that executions of the
> >> CLFLUSH
> >>    instruction were ordered only by the MFENCE instruction.  All
> >> processors
> >>    implementing the CLFLUSH instruction also order it relative to the
> >> other
> >>    operations enumerated above.
> >>
> >> i.e. The SDM was incorrect at the time, and barriers should not have
> >> been
> >> inserted.  Double checking the original AAI65 errata (not available fr=
om
> >> intel.com any more) shows no mention of barriers either.
> >>
> >> Note: If this were a general codepath, the MFENCEs would be needed,
> >> because
> >>        AMD CPUs of the same vintage do sport otherwise-unordered
> >> CLFLUSHs.
> >>
> >> Furthermore, use a plain alternative, rather than
> >> static_cpu_has_bug() and/or
> >> no optimisation.  The workaround is a single instruction.
> >>
> >> Use an explicit %rax pointer rather than a general memory operand,
> >> because
> >> MONITOR takes the pointer implicitly in the same way.
> >>
> >> Link:
> >> https://web.archive.org/web/20090219054841/http://download.intel.com/d=
esign/xeon/specupdt/32033601.pdf
> >> Fixes: 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
> >> workaround, add barriers")
> >> Fixes: f8e617f45829 ("sched/idle/x86: Optimize unnecessary
> >> mwait_idle() resched IPIs")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Thomas Gleixner <tglx@linutronix.de>
> >> CC: Ingo Molnar <mingo@redhat.com>
> >> CC: Borislav Petkov <bp@alien8.de>
> >> CC: Dave Hansen <dave.hansen@linux.intel.com>
> >> CC: x86@kernel.org
> >> CC: "H. Peter Anvin" <hpa@zytor.com>
> >> CC: linux-kernel@vger.kernel.org
> >>
> >> v2:
> >>   * Fix the same pattern in mwait_idle() too
> >>   * Expand on why we're not using a general memory operand.
> >> ---
> >>   arch/x86/include/asm/mwait.h | 11 +++++------
> >>   arch/x86/kernel/process.c    | 10 ++++------
> >>   2 files changed, 9 insertions(+), 12 deletions(-)
> >
> > There is another instance of the same sequence in
> > arch/x86/kernel/smpboot.c:
> >
> >         /*
> >          * The CLFLUSH is a workaround for erratum AAI65 for
> >          * the Xeon 7400 series.  It's not clear it is actually
> >          * needed, but it should be harmless in either case.
> >          * The WBINVD is insufficient due to the spurious-wakeup
> >          * case where we return around the loop.
> >          */
> >         mb();
> >         clflush(md);
> >         mb();
> >         __monitor(md, 0, 0);
> >         mb();
> >         __mwait(eax_hint, 0);
> >
> > Should this also be converted to the new sequence?
>
> Yes, it ought to.
>
> I'm OoO for a while though.  If you fancy doing a patch, please go
> ahead.  Or a maintainer could fold a 3rd hunk into this patch?

Heh, I learned the hard way not to touch the code I don't understand. ;)

Uros.
