Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9C17580
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256445; cv=none; b=TPC4xub7lAp9/ENRBhD1RZG1phBiApaFTQOBx9qaT0r6yoPkhl9LqFRpTkdD/tRc5otN+GOzL09DV0PWHQ6Wk/5MwpbvlM8fdt++9wuHJLkPcYDJLkzhbf+gKyMbdIdp7I1Y1oasOWOW5wr8EICYEUEMM0ESGWOlXIQyk/+Ich0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256445; c=relaxed/simple;
	bh=Pwr8KhnAIPUp/bIcOqk7d47OOZuTd8tTkXUp8aY1fEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmVBDYiLafyr+zZQ7dYJFK3x6/rSouGWrzEbbkiS86DSaHPr2Z6ffRIw02glassO4O9IE4UPnxG4CfBGyQXuTL3B84xKojYbriilCIEu6305IV3Zpe96moBOesz9zxh/mijdrX5ZRX/i0wAbCVAkU/EHGYd2ubKMqJzMgcsLStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wRevIiCK; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wRevIiCK"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-308ec50eb3dso19230081fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739256442; x=1739861242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGbBdlP90w+T3JVAYzJi7gDp1tAle4/AZ9lzBH6+O1Y=;
        b=wRevIiCKqc5/geg3xYU7W3jBFGIwGZ7iPtqqJ+ql+4ywb66Lu655Ism1QBStsYfVJy
         ggLC4Kcys/EbV3Bmss0jPId5UUGGNVsOTK9K/zOzSfvZZs1+JkRSmxG8TOnwJ19PfC7m
         lF64yphoizxMwFv3czsXfNKAi7lYe6PMkYDExCjZJmeF+lzWRb+k2yXN5vAQSntrjdSe
         y93D06qmWkc4PKWcEeh5VvWRIFmZOLVPlxu5KwD1EJA11xxestFIPlwywUWeUhsM49FH
         djQRj4XdF2w4+Kh23zwFrc2zNznJPfA5guI5JVG+DyFhymq7NVIjeEXktG3QD6Bz1DUV
         +n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739256442; x=1739861242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGbBdlP90w+T3JVAYzJi7gDp1tAle4/AZ9lzBH6+O1Y=;
        b=kkMAJ1ogFzQRKePhNJJG+zQ3xDt2j2OYNKEnx6pkNZwWdRP+b1LRdbvzTEkKD/aE5+
         ZCbbUKZ+yTNDHCnvViUL+5Q6lfdtz2NiTMjq6WDrpNs58GjfQ7d5KbzSG+ClL5m8YOVy
         uiE1rzcInGswcnOYRvYv3vABouO2mEE1Wm7XdXf4KwUxVbusZsSyMJqf/drYac9swwsU
         b/VN21SZWlGCRUdaemUh+8FJOG7rn6qM+v35tih8xmd4DSN5Fd7A6PkEdNzl0Lkprdxd
         jSFVSJzs1FYpgxzo6M9Jc4vzUDdu+bxrvb/HU1CCnCp+Bep0nrcnppSd5zTE1AyrRWFL
         RuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa8acFh0gUfa1OD/1u0bDU+T6Kux747CypI0zh3ZZaanzPhwYcBblfWW0CCfQx6B6lgPXFtFVFyZnfijM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+HQR8zUKWN0pi1udEEFDs2ZOhaHkUsOTaQpeJYkLXflkhnZD
	ZTU66GGdKOx632hHzhitGqng0fXx7W+3jdt5KaFREqCsE9hI3C7MLAJhPoK3SD8kpjRMXNztbgp
	ARNsW5wwY5eTizYIw+x6MhFXonh4Gu9XEW6cH
X-Gm-Gg: ASbGncv9YtkLRcEmY3NZP00lwZDbgXPAubzvDZYr9uaVKNvZP3Lcw03l5wrr7EUhYcA
	Gs1CaaYfdzIq6Qx6J6ZgG4M12TsEzjI0FsrQpVMVuGopjYShe4Q8hecSB3kUHq0lBISK7MhsAbU
	6WU7EgVZdAQwtYIQ4BSVVbmlg0vpgQ
X-Google-Smtp-Source: AGHT+IFmmtCjIuRuWVB391USVy0RjlwmtwqAQj8domrIkUvOzc5ezcrz1DL9GSbeR4Uyx7Fnkfedpb+7qX5njXzx+uw=
X-Received: by 2002:a05:651c:198a:b0:308:f84b:6b39 with SMTP id
 38308e7fff4ca-308f84b7925mr8863631fa.14.1739256441858; Mon, 10 Feb 2025
 22:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802061318.2140081-4-aruna.ramakrishna@oracle.com>
 <20250204100134.1843654-1-dvyukov@google.com> <CACT4Y+Ziom32P0fWVG_mWM5Vrw9Y6Xem=mqH0Jt21VVVaNEODA@mail.gmail.com>
 <CABi2SkVzvtTwEt1aMQxDGihaMZSuxDTu4cdV-9-krk0a70PBRw@mail.gmail.com>
In-Reply-To: <CABi2SkVzvtTwEt1aMQxDGihaMZSuxDTu4cdV-9-krk0a70PBRw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 11 Feb 2025 07:47:10 +0100
X-Gm-Features: AWEUYZlR2tfk8ZN2hBQsd_W9mYR4XCl6EKxisiNdOz5aqQ60oJ-OItvGRbhHEm8
Message-ID: <CACT4Y+ZYKpZAu0UtZ9N4EjC+qkes5oenwNPceJqkk7XrJD7g=A@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] x86/pkeys: Update PKRU to enable all pkeys before XSAVE
To: Jeff Xu <jeffxu@chromium.org>
Cc: aruna.ramakrishna@oracle.com, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, paulmck@kernel.org, boqun.feng@gmail.com, 
	dave.hansen@linux.intel.com, jannh@google.com, jorgelo@chromium.org, 
	keescook@chromium.org, keith.lucas@oracle.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mingo@kernel.org, rick.p.edgecombe@intel.com, 
	sroettger@google.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Feb 2025 at 23:46, Jeff Xu <jeffxu@chromium.org> wrote:
>
> Hi Dmitry
>
> On Thu, Feb 6, 2025 at 10:06=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com=
> wrote:
> >
> > On Tue, 4 Feb 2025 at 11:02, Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > Re commit 70044df250d022572e26cd301bddf75eac1fe50e:
> > > https://lore.kernel.org/all/20240802061318.2140081-4-aruna.ramakrishn=
a@oracle.com/
> > >
> > > > If the alternate signal stack is protected by a different pkey than=
 the
> > > > current execution stack, copying xsave data to the sigaltstack will=
 fail
> > > > if its pkey is not enabled in the PKRU register.
> > > >
> > > > We do not know which pkey was used by the application for the altst=
ack,
> > > > so enable all pkeys before xsave.
> > > >
> > > > But this updated PKRU value is also pushed onto the sigframe, which
> > > > means the register value restored from sigcontext will be different=
 from
> > > > the user-defined one, which is unexpected. Fix that by overwriting =
the
> > > > PKRU value on the sigframe with the original, user-defined PKRU.
> > >
> > > Hi,
> > >
> > > This unfortunatly seems to be broken for rseq user-space writes.
> > > If the signal is caused by rseq struct being inaccessible due to PKEY=
s,
> > > we try to write to rseq again at setup_rt_frame->rseq_signal_deliver,
> > > which happens _before_ sig_prepare_pkru and won't succeed
> > > (PKEY is still inaccessible, hard kills the process).
> > > Any PKEY sandbox would want to restict untrusted access to rseq
> > > as well (otherwise allows easy sandbox escapes).
> > >
> > > If we do sig_prepare_pkru before rseq_signal_deliver (and generally
> > > before any copy_to_userpace), then user-space handler gets SIGSEGV
> > > and could unregister rseq and retry.
> > >
> > > However, I am not sure if it's the best solution performance-
> > > and complexity-wise (for user-space). A better solution may be to
> > > change __rseq_handle_notify_resume to temporary switch to default
> > > PKEY if user accesses fail.
> > > Rseq is similar to signals in this respect. Since rseq updates
> > > happen asynchronously with respect to user-space control flow,
> > > if a program uses rseq and ever makes rseq inaccessible with PKEYs,
> > > it's in trouble and will be randomly killed.
> > > Since rseq updates are asynchronous as signals, they shouldn't
> > > assume PKEY is set to default value that allows access
> > > to rseq descriptor.
> > >
> > > Thoughts?
> >
> > Another question about switching to pkey 0 and not switching back on al=
l errors.
> > Can it create security problems by allowing sandboxed code to escape?
> >
> Sandbox escape would be bad , we wouldn't want the calling thread to
> get PKRU =3D 0 in any error path.
>
> > Namely, here:
> >
> > +        /* Update PKRU to enable access to the alternate signal stack.=
 */
> > +        pkru =3D sig_prepare_pkru();
> >          /* save i387 and extended state */
> > -        if (!copy_fpstate_to_sigframe(*fpstate, (void __user
> > *)buf_fx, math_size, pkru))
> > +        if (!copy_fpstate_to_sigframe(*fpstate, (void __user
> > *)buf_fx, math_size, pkru)) {
> > +                /*
> > +                 * Restore PKRU to the original, user-defined value; d=
isable
> > +                 * extra pkeys enabled for the alternate signal stack,=
 if any.
> > +                 */
> > +                write_pkru(pkru);
> >                  return (void __user *)-1L;
> > +        }
> >
> > we restore to the original pkru on this error, but there are other
> > failure paths later, e.g.:
> > https://elixir.bootlin.com/linux/v6.13.1/source/arch/x86/kernel/signal_=
64.c#L199
> >
> > on these errors paths we will eventually get here to force_sig(SIGSEGV)=
:
> > https://elixir.bootlin.com/linux/v6.13.1/source/kernel/signal.c#L1685
> > which just sends SIGSEGV and is not fatal.
> >
> > So hypothetically, if there is a SIGUSR1 handler without SA_ONSTACK,
> > which fails, but SIGSEGV handler has SA_ONSTACK and doesn't fail, this
> > will result in resetting PKRU to 0 without restoring it back.
> > Or sandboxed code somehow arranges for the first signal setup for other=
 reasons.
> >
> Can you walk me through the setup and steps that led to this situation?

I don't anything more concrete steps, just the observation that PKRU
is restored only on 1 out of N error paths.

> > This is, of course, a tricky attack vector, and the program must
> > resume after SIGSEGV somehow (there are some such cases, e.g. mmaping
> > something lazily and retrying), but with security you never know how
> > creative an attacker can get and what you are missing that they are
> > not missing. So it looks safer to restore to the original PKRU on all
> > errors.
>
> Thanks
> -Jeff
