Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439A1AA1E0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862835; cv=none; b=eWQjK0jjfx4Mk/8Yg0Pc38mEH8PIaJ7BHYnp3R/p8+CEHJZMzuogcRPckbRsCIMSmLNHHcEtghidvgJoa9AzWOk7mRo8r1LReYuxcytGhfgG+y7c0eNF3JrytRORNnv/0Q9Ojme701poLbmqk3NTNL69b05CnFDaFbHZ3c4QNMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862835; c=relaxed/simple;
	bh=hI9l8kcessfNWDnOCtcAb1CkErwiSLvOks9oZEhZYRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0zO7bJe2SzT7aNj+M4z/Ww58bNomoo3q1PkiMswSZt05JJW9IiQZm8Ko64Hrlee5Z379k2AQAYRSxan+p3G0rjBg9HcbT7ktcrW/8cy4ypgZ8A6l8B5OzlTgf8EXMRI2r4vgNEPWUzvB+JARDeMurz9pQZ3I/pEm7yxHklQFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i+dseRpK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i+dseRpK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso6422131a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862832; x=1746467632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cELG0a2mXl5N6mpi0+RLp319EHg3sGhSPY6U6Zc2/4k=;
        b=i+dseRpKps/CVhb6e6ABuVP1WkjKohtNKcZhf9jXwi2uWzU+fuieM5TFuhVnJSOZEZ
         BAIJQYoqHy5NbVGzrvVSLr9QCmirc8/nMkymOMSy8+cSZHpcnQKC5WztrZGU3olSt0J/
         2CICG6gG8I4aWUjb+f5rbzRmvF1xhfHJ7dq1CzRHZnCPn26p6Nxmyz3nXec6/GgP6Drf
         +MMgC1ES+mtendbnF5YrUlTXcG/y/SfxT9V9L4KEZYj257F90eNNNo/2MLKpIa4J3bGM
         aVhT2nZRSp8PQ6BtfDaJFHutp5BsuegGziu2vBY2UfdsTK2UKBFuYKiLB1ZB089hk3sr
         5SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862832; x=1746467632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cELG0a2mXl5N6mpi0+RLp319EHg3sGhSPY6U6Zc2/4k=;
        b=Uz6P1V504rpX9/gbMvRXD6MrmwRdZwqwZig/jZZfmMk/PXtw0Z229CY7MRGP7QOLZB
         y18Bk7rGmk0rwtja9i1rIDnFaVFbHqWF0r53xqyKx2LHejZv6jLrTowu1UtmojcSJRwp
         S/0zwz0ZGshQ6fm0zm//sG+6LsTjf0hFSq4fev/noEEJ7NUwgBDF9V7X3Pn+z771Mhey
         zQVh4YwJncx1aLwGz0W5YxkCJlbGKltcQ2rYRB/01Hy3uLvoUBl/InpuaiZr7EC2FMGE
         aWISQr3CgvUEoREJj63QcZszxomxNWJcExt1KzMfWsAWQYj0ktcD+nwLM2gsW5o+tLSE
         ACsA==
X-Forwarded-Encrypted: i=1; AJvYcCVXywztLNgq60AqFJuWwux2njyul4DBCN61ONzgdXPm1/PzTmTuXvhm4P2jUTR4kzbDRQwh477fFZqT6QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1igG8BJJS9PuvWiCw/i0VYBUZF/od29X/QpsyxEtP93xZ9H9
	BxD4XPbg2Q2sqkYi4Bv0rJ0eXkFJmda+e5ZwLH2fCA2vZVpUGF/YdMFmz3jvJFuvXqlVaG+g7Rm
	3Ih8NOOCyqPu52Flm2iPo/GcwmGdkEyETpM0=
X-Gm-Gg: ASbGnct5JYiiLO28HSRTkikAe/xwletQi4JBC19KH/puRM5GWk+fGrAu8TddDYpOVhM
	+rXxauvJXrS8MwhOtDvwo8LkAWwU/7OatIaCv/Nq05/klQwbOgXki2KkgGx0F3b3C7b0LFJu2Mh
	iW0f6TKvXVye5egsGfkgA=
X-Google-Smtp-Source: AGHT+IHqIg2Loa+Y0QKSG8YxCDTk31ezU03P7AATW+Z/1ns4Jt8XF4Ad3BTyh3bkX7w/0eQbixiiXnU4rTOZoxrjc1Q=
X-Received: by 2002:a17:907:7d8a:b0:ac6:fec7:34dd with SMTP id
 a640c23a62f3a-acec6c67f34mr8894566b.52.1745862831882; Mon, 28 Apr 2025
 10:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
In-Reply-To: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 10:53:34 -0700
X-Gm-Features: ATxdqUEJVTdPbMJGumIpmgzZbU1wN2Zlt9jaYxbaWMUYvK-iFBpwnq2gM8nUxXs
Message-ID: <CAGG=3QWKQ++Yhh0w8zJobs=C4M7F01doAw9t2h=f2W9wxSG3Mw@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 1:57=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 26 Apr 2025 at 13:05, Nathan Chancellor <nathan@kernel.org> wrote=
:
> >
> >     KBUILD_CFLAGS +=3D -mllvm -trap-unreachable
>
> Hmm. That certainly builds for me, but yeah, it generates new objtool
> warnings, notably
>
>    panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>
> and I *think* that is because that flag makes clang not honour our
> *explicit* "this code is unreachable" annotations.
>
There's also this flag:

  -mllvm -no-trap-after-noreturn

Here's the documentation for both flags:

static cl::opt<bool>
    EnableTrapUnreachable("trap-unreachable", cl::Hidden,
                          cl::desc("Enable generating trap for unreachable"=
));

static cl::opt<bool> EnableNoTrapAfterNoreturn(
    "no-trap-after-noreturn", cl::Hidden,
    cl::desc("Do not emit a trap instruction for 'unreachable' IR instructi=
ons "
             "after noreturn calls, even if --trap-unreachable is set."));


Could you share how you configured your build?

-bw

> So now objtool complains about the fact that clang has generated some
> random code that follows a call to 'panic()' even though objtool knows
> that panic() cannot return.
>
> And those explicit annotations definitely should be honored.
>
> IOW, there's a *big* difference between "the programmer told me this
> is unreachable, so I won't generate code past this point" and "I have
> decided this is undefined behavior, so now I won't generate code past
> this point".
>
> So what I'm asking for is absolutely not "trap on unreachable". That's
> wrong and just plain stupid.
>
> I'm asking for "trap on UD instead of *assuming* it's unreachable".
>
> Because clearly that code *can* be reached, it's just doing something und=
efined.
>
> See? Big big difference.
>
>              Linus
