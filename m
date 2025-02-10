Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F53254AE3
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227612; cv=none; b=BBbMGMerKZf3PoZ9pz6y18yX9S194rj4BEiaMB1ugWOsn7I+ND5t6CQEA3dgNomcHouNFpfp8eBV36zLHg00/jolF1sMxEK3JAkXfE3J787yZDAqJXE+jzlr9e285aAeGBEfklSQ1xJvQ2iqnDiA9l8IvPX0rehr15scvkZsIIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227612; c=relaxed/simple;
	bh=c1tINcPBnNR7GvvFeU2NrPIodaZR8aZ+og/vb6lZL34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0WOHhjlSjlrd/WXYT/1sMCOEkrqsYVp8XcVwlHhnv1CoEcv9EFTM+jfWGX5DEcZerclzK1jWNWRie3pWiY1sJv6Vue17QO0s3opCeYI01MzMlcSZnQxxCtC5EIs1qpe1QkOww1e0pcQhtX+VLZlAIZUf3Jyy1CrGv92H5JU5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H+T91Dxr; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H+T91Dxr"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5fc8ea31dedso148424eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739227609; x=1739832409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpi31Ud1twFyFDNt4Eoy+6zvp4+YTfbaSRsSEdozPiw=;
        b=H+T91DxrlF9cLQyiafZ6Twc92sOZAVUZazogQfx4rC2Rz4uDMhwT1GuTtrPeMDc7zT
         FiYMV4uMDrpiqRK8qoNj0oTSPNHSSA7XD8lHo6eSUGAaZP4S3k62522FYXd9+SsfBQt7
         3u02TARinbPhtY+zmwB94dW7yDP6Sr/aLja1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227609; x=1739832409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpi31Ud1twFyFDNt4Eoy+6zvp4+YTfbaSRsSEdozPiw=;
        b=tzi0sgAUxwM4iTdfJTcxW9EzeYPn5iP2Cpgm5pcWa2LUgqSOlyYlkou1o3b7VSBjHB
         DslrpYutSEk11ZJRMYVJjhOdw5Hs04BX8aH8fERS5G8D0+TPndaQzG2ORExkUig9IBQP
         DYJARY1e+3eE1fBJBCeCkN7yiZZc6ub9gEhHjRzgmne3hrGqOFdhZFMbELvDiaOsfjZn
         SxnhOvSU9z14nBKCQJ/64s8pbg5c57oWP481Ed4FfHtz7SgfzHd1oFRUP833ALBrlSrv
         NmaudWlSeE81Z2Na8k17t+H5UhOu/DRqFF9a5BntVFt8GYrROp8TYvmSFg2/k4OS0WUa
         sKCA==
X-Forwarded-Encrypted: i=1; AJvYcCWhwzM0AjPs9Z1eh/lfgwlX4GbMOr6GMfoA2uIMtCDi20+N7zEUCT/dfCveBOU28a3tms0d65M7aP1Xvk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNVv9LvNTN4C++oDRgIfiDWW4x+IXl25L++3asZmMMCz4CiI1
	BMCDAvL17iLrS33v8myyS9MJmGuu2WPp0c7CmmRNO7BX8g/uh2XcaL1Pdmq6PSEDN31cuKyoaI9
	FDlX5aPeRMben6/0puJRHrm9yB/x2JHeLmJLP
X-Gm-Gg: ASbGnctBvv7ZgODdVx+jCmlajXR7bPHuAxzxF+/dtB5Z1KN188p/WKYAQ9rOZEIzYd+
	+LkwpBqgGgX8lCBn7cALDgHjh5HxszPD8QAXow5BNiqs2WfFLfhvVbJm+QCNjPc3h+dVR6XrfUq
	DNZiQcPJC+vHxHTmQcKjoFuFAjyg==
X-Google-Smtp-Source: AGHT+IFtA/W8uueNibT5y90F75LKgRqO5D9NS/P6j1tawK7CKIyxBJJM/Bw9ALTDQM8crHcoP8Q4aYrWl3fdSQSm+vE=
X-Received: by 2002:a05:6808:14c6:b0:3f3:bda5:572b with SMTP id
 5614622812f47-3f3c41d8305mr94661b6e.1.1739227609577; Mon, 10 Feb 2025
 14:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802061318.2140081-4-aruna.ramakrishna@oracle.com>
 <20250204100134.1843654-1-dvyukov@google.com> <CACT4Y+Ziom32P0fWVG_mWM5Vrw9Y6Xem=mqH0Jt21VVVaNEODA@mail.gmail.com>
In-Reply-To: <CACT4Y+Ziom32P0fWVG_mWM5Vrw9Y6Xem=mqH0Jt21VVVaNEODA@mail.gmail.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Mon, 10 Feb 2025 14:46:37 -0800
X-Gm-Features: AWEUYZnITYhOFN9BQHrNDIgJCmfEUxNfF-rj4qgty8D8FH8th5Xh_MGYgrLTHgg
Message-ID: <CABi2SkVzvtTwEt1aMQxDGihaMZSuxDTu4cdV-9-krk0a70PBRw@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] x86/pkeys: Update PKRU to enable all pkeys before XSAVE
To: Dmitry Vyukov <dvyukov@google.com>
Cc: aruna.ramakrishna@oracle.com, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, paulmck@kernel.org, boqun.feng@gmail.com, 
	dave.hansen@linux.intel.com, jannh@google.com, jorgelo@chromium.org, 
	keescook@chromium.org, keith.lucas@oracle.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mingo@kernel.org, rick.p.edgecombe@intel.com, 
	sroettger@google.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry

On Thu, Feb 6, 2025 at 10:06=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
>
> On Tue, 4 Feb 2025 at 11:02, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > Re commit 70044df250d022572e26cd301bddf75eac1fe50e:
> > https://lore.kernel.org/all/20240802061318.2140081-4-aruna.ramakrishna@=
oracle.com/
> >
> > > If the alternate signal stack is protected by a different pkey than t=
he
> > > current execution stack, copying xsave data to the sigaltstack will f=
ail
> > > if its pkey is not enabled in the PKRU register.
> > >
> > > We do not know which pkey was used by the application for the altstac=
k,
> > > so enable all pkeys before xsave.
> > >
> > > But this updated PKRU value is also pushed onto the sigframe, which
> > > means the register value restored from sigcontext will be different f=
rom
> > > the user-defined one, which is unexpected. Fix that by overwriting th=
e
> > > PKRU value on the sigframe with the original, user-defined PKRU.
> >
> > Hi,
> >
> > This unfortunatly seems to be broken for rseq user-space writes.
> > If the signal is caused by rseq struct being inaccessible due to PKEYs,
> > we try to write to rseq again at setup_rt_frame->rseq_signal_deliver,
> > which happens _before_ sig_prepare_pkru and won't succeed
> > (PKEY is still inaccessible, hard kills the process).
> > Any PKEY sandbox would want to restict untrusted access to rseq
> > as well (otherwise allows easy sandbox escapes).
> >
> > If we do sig_prepare_pkru before rseq_signal_deliver (and generally
> > before any copy_to_userpace), then user-space handler gets SIGSEGV
> > and could unregister rseq and retry.
> >
> > However, I am not sure if it's the best solution performance-
> > and complexity-wise (for user-space). A better solution may be to
> > change __rseq_handle_notify_resume to temporary switch to default
> > PKEY if user accesses fail.
> > Rseq is similar to signals in this respect. Since rseq updates
> > happen asynchronously with respect to user-space control flow,
> > if a program uses rseq and ever makes rseq inaccessible with PKEYs,
> > it's in trouble and will be randomly killed.
> > Since rseq updates are asynchronous as signals, they shouldn't
> > assume PKEY is set to default value that allows access
> > to rseq descriptor.
> >
> > Thoughts?
>
> Another question about switching to pkey 0 and not switching back on all =
errors.
> Can it create security problems by allowing sandboxed code to escape?
>
Sandbox escape would be bad , we wouldn't want the calling thread to
get PKRU =3D 0 in any error path.

> Namely, here:
>
> +        /* Update PKRU to enable access to the alternate signal stack. *=
/
> +        pkru =3D sig_prepare_pkru();
>          /* save i387 and extended state */
> -        if (!copy_fpstate_to_sigframe(*fpstate, (void __user
> *)buf_fx, math_size, pkru))
> +        if (!copy_fpstate_to_sigframe(*fpstate, (void __user
> *)buf_fx, math_size, pkru)) {
> +                /*
> +                 * Restore PKRU to the original, user-defined value; dis=
able
> +                 * extra pkeys enabled for the alternate signal stack, i=
f any.
> +                 */
> +                write_pkru(pkru);
>                  return (void __user *)-1L;
> +        }
>
> we restore to the original pkru on this error, but there are other
> failure paths later, e.g.:
> https://elixir.bootlin.com/linux/v6.13.1/source/arch/x86/kernel/signal_64=
.c#L199
>
> on these errors paths we will eventually get here to force_sig(SIGSEGV):
> https://elixir.bootlin.com/linux/v6.13.1/source/kernel/signal.c#L1685
> which just sends SIGSEGV and is not fatal.
>
> So hypothetically, if there is a SIGUSR1 handler without SA_ONSTACK,
> which fails, but SIGSEGV handler has SA_ONSTACK and doesn't fail, this
> will result in resetting PKRU to 0 without restoring it back.
> Or sandboxed code somehow arranges for the first signal setup for other r=
easons.
>
Can you walk me through the setup and steps that led to this situation?

> This is, of course, a tricky attack vector, and the program must
> resume after SIGSEGV somehow (there are some such cases, e.g. mmaping
> something lazily and retrying), but with security you never know how
> creative an attacker can get and what you are missing that they are
> not missing. So it looks safer to restore to the original PKRU on all
> errors.

Thanks
-Jeff
