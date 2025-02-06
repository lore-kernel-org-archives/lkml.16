Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C0D194A66
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865191; cv=none; b=jn4bUZLMyYxgl8sP0glFW1bAWSDSfS1Yj2g6CBuNObci5zYmfFXNKN7ZG6CV2ch+iCxGtF8k70HtJ1eKh5Zjo3QZZLCcVd5xy/DfQaZLqKs6f93Iav5Qo6vrBc2Z24gIwQuCyEJk/KuCn1m7MrfoYX2lH7EwhpzFZ4YZ+MIn7sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865191; c=relaxed/simple;
	bh=my59ka0KwnOvnoUbiBsCzl/47DihOf9AdMsS1WsHy6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtvkW9jT1HTktCSFEbbOducfePiYAA5fJy0aQcAJU9Q+d2+VZSHz1X4tBzHOskslQRe+chyYKeGrf7O0YBLqtjJrJKQ1+Xjw9h8afv00srAMSwcogg7crSOU6KkVBC2EgUrwG91lbwr1ZrvgqX3FKUxcFLwRg36cmMah4sfIoNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pGuA2xjl; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pGuA2xjl"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30738a717ffso11110251fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865187; x=1739469987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5ijmrv1xMkTxvyrnG0sU8L3dMgDYIgFGyVBUXpmxA8=;
        b=pGuA2xjlVbM2Sa2m1zO6Vo52jYisKWh6bvLjiZVBCNOdysNWt1UifN2Z+j2rrbQw4c
         6ZxtanFeDwIb59z7k41t2RM6gVrHEnRpWMeLXuDnpvnwLQX4Qi8cGJ5xzqqqYomRIboM
         Degf6h1rqRGMkToGq/JwvtVMu1PP6wWZzfKR8jcw8dwlriMB1Nhx16j4R9xK08dYJaYK
         iSGWIIClYb8FXkTEWWBhJNJMYp8yFK2zuy78x8RJ8Ow4RUe5OxflXiHQCBQAOc4aInWB
         gDv2SQVK9SS83YDalcE5T1JJzhzpZ17iJZD85JZUSLeWsTs4VgWpH+PX+tAmMCKjzjy1
         KaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865187; x=1739469987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5ijmrv1xMkTxvyrnG0sU8L3dMgDYIgFGyVBUXpmxA8=;
        b=t64E7fCIk3/yt9/KIkzZ1w9G90f8Uea9ayKQnOr7SZ14DlYv2lmWDLaHfLfLqXFIyZ
         l1bGcHHIt4Y9gi/EsgtYJ27s5y2a4XqXGNIrOvdfB22svKL0/mf9iO7FNBKGxMZg0q8H
         CPWnfdNH2q9B+cDWEcbEdar5UTyo3tKbHS4BtrDQ7TJb1qZ5xZrZb5pqpzsceaoo/svV
         IwwKh8UZGPNdD+yiwXDyqVkgiBQ0sKdwy48//9ofLJOxbqm5tOkvPQoRMY7F3VX/c88b
         xfoZhEyxzWj/egySXPWEJXVkijqqbTPYed702FeCOmGXFW7eLb48vUhv43gWclA4H3Ui
         9KvA==
X-Forwarded-Encrypted: i=1; AJvYcCXCSDGZlYGY5GedTaqVRxr9uB6rF+E5V+sQ2eT7EAqsEAaQcXMqUqFRkVJ8rAGJxylKZ2Ujf9TwF3BezCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybDnwW11/Z0GOKDGMZuzH2kgRxtfV+2YNakrZBMbF2ZC3iQ4Mf
	zR0pPcQJKKG1pdvCpaE7JiFmYaK/pubVBZgu7UCw373tTmrrepghFnxEdDlhShI20SxuqK6lFrG
	EfQ0OajxpGcb9GZ7ehJczgo6E+8UwSY2NghTC
X-Gm-Gg: ASbGncuZmcPf/VDHHlhlUAdIaiKpkiebF0LfNOphV2MRZgcHnT/WR3LWbx5049XkktZ
	ES/zrQ2kxh6NYVEp9oW0zuR2rKB6Vz+F2gLBWdonMu1e8gfCU6Lf+6C8yqFcXL8U2hNJS7aB1Q7
	NKcRmIYpkINse4mMBXUKw8QGtNlhkXzg==
X-Google-Smtp-Source: AGHT+IFtL93N1CSknmLZbso3DBkiWJ+4cACr+iFlv5keotpZRTk0sb8bf1DhZDs2bZqric9fnxEreiNkHX/pOvsRKZ0=
X-Received: by 2002:a05:651c:116:b0:307:95a1:2923 with SMTP id
 38308e7fff4ca-307cf2f6bb5mr24494911fa.14.1738865187231; Thu, 06 Feb 2025
 10:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802061318.2140081-4-aruna.ramakrishna@oracle.com> <20250204100134.1843654-1-dvyukov@google.com>
In-Reply-To: <20250204100134.1843654-1-dvyukov@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 6 Feb 2025 19:06:15 +0100
X-Gm-Features: AWEUYZk6bPEFmdnSpNpNh5rkNyV67hJtJGcgIZZUWBHSj4jnjpP0SWwzLiY7F-A
Message-ID: <CACT4Y+Ziom32P0fWVG_mWM5Vrw9Y6Xem=mqH0Jt21VVVaNEODA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] x86/pkeys: Update PKRU to enable all pkeys before XSAVE
To: aruna.ramakrishna@oracle.com, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, paulmck@kernel.org, boqun.feng@gmail.com
Cc: dave.hansen@linux.intel.com, jannh@google.com, jeffxu@chromium.org, 
	jorgelo@chromium.org, keescook@chromium.org, keith.lucas@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@kernel.org, 
	rick.p.edgecombe@intel.com, sroettger@google.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 11:02, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Re commit 70044df250d022572e26cd301bddf75eac1fe50e:
> https://lore.kernel.org/all/20240802061318.2140081-4-aruna.ramakrishna@oracle.com/
>
> > If the alternate signal stack is protected by a different pkey than the
> > current execution stack, copying xsave data to the sigaltstack will fail
> > if its pkey is not enabled in the PKRU register.
> >
> > We do not know which pkey was used by the application for the altstack,
> > so enable all pkeys before xsave.
> >
> > But this updated PKRU value is also pushed onto the sigframe, which
> > means the register value restored from sigcontext will be different from
> > the user-defined one, which is unexpected. Fix that by overwriting the
> > PKRU value on the sigframe with the original, user-defined PKRU.
>
> Hi,
>
> This unfortunatly seems to be broken for rseq user-space writes.
> If the signal is caused by rseq struct being inaccessible due to PKEYs,
> we try to write to rseq again at setup_rt_frame->rseq_signal_deliver,
> which happens _before_ sig_prepare_pkru and won't succeed
> (PKEY is still inaccessible, hard kills the process).
> Any PKEY sandbox would want to restict untrusted access to rseq
> as well (otherwise allows easy sandbox escapes).
>
> If we do sig_prepare_pkru before rseq_signal_deliver (and generally
> before any copy_to_userpace), then user-space handler gets SIGSEGV
> and could unregister rseq and retry.
>
> However, I am not sure if it's the best solution performance-
> and complexity-wise (for user-space). A better solution may be to
> change __rseq_handle_notify_resume to temporary switch to default
> PKEY if user accesses fail.
> Rseq is similar to signals in this respect. Since rseq updates
> happen asynchronously with respect to user-space control flow,
> if a program uses rseq and ever makes rseq inaccessible with PKEYs,
> it's in trouble and will be randomly killed.
> Since rseq updates are asynchronous as signals, they shouldn't
> assume PKEY is set to default value that allows access
> to rseq descriptor.
>
> Thoughts?

Another question about switching to pkey 0 and not switching back on all errors.
Can it create security problems by allowing sandboxed code to escape?

Namely, here:

+        /* Update PKRU to enable access to the alternate signal stack. */
+        pkru = sig_prepare_pkru();
         /* save i387 and extended state */
-        if (!copy_fpstate_to_sigframe(*fpstate, (void __user
*)buf_fx, math_size, pkru))
+        if (!copy_fpstate_to_sigframe(*fpstate, (void __user
*)buf_fx, math_size, pkru)) {
+                /*
+                 * Restore PKRU to the original, user-defined value; disable
+                 * extra pkeys enabled for the alternate signal stack, if any.
+                 */
+                write_pkru(pkru);
                 return (void __user *)-1L;
+        }

we restore to the original pkru on this error, but there are other
failure paths later, e.g.:
https://elixir.bootlin.com/linux/v6.13.1/source/arch/x86/kernel/signal_64.c#L199

on these errors paths we will eventually get here to force_sig(SIGSEGV):
https://elixir.bootlin.com/linux/v6.13.1/source/kernel/signal.c#L1685
which just sends SIGSEGV and is not fatal.

So hypothetically, if there is a SIGUSR1 handler without SA_ONSTACK,
which fails, but SIGSEGV handler has SA_ONSTACK and doesn't fail, this
will result in resetting PKRU to 0 without restoring it back.
Or sandboxed code somehow arranges for the first signal setup for other reasons.

This is, of course, a tricky attack vector, and the program must
resume after SIGSEGV somehow (there are some such cases, e.g. mmaping
something lazily and retrying), but with security you never know how
creative an attacker can get and what you are missing that they are
not missing. So it looks safer to restore to the original PKRU on all
errors.
