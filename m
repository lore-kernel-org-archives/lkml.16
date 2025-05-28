Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED91482F5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474310; cv=none; b=TKR6+40o82n89rDdwzIGXdaEXO/iahCwg4AFoxwodW9STUwG6E048S5CbOm5xJD7hBxdBq/1TWRk1wYj7r3C0dadVzby7vR/7TbNI1I2WK65YKJNmz3bFSnkpWS38ynhhaMV+uci+6KyLnDUMHEQSnxBJwQsXCwdv1yREEv3iJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474310; c=relaxed/simple;
	bh=ZgE0DI9a9mTY9wmrJHg8S+HRBGUE/t4iMybPPy30adI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/UW/9jwe20kk80/BcE69nWQMCCXpm4zTqCEoioFWjCxe0k4u7VMPTWz23jx5bU562iT3VRkv4/XJp/D0mjPsk68zvaCp+wuJTRwDc1aQAg0LuUFj7X0xWSMEXTFRXvi7KPzePafZkRuZVtl6SEr5pnaM9VPStm1/BZR7JIn6ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OP9mTUWR; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OP9mTUWR"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dd745f8839so51575ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748474307; x=1749079107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr2SmmHn7WpXqUnHpYTLasaORThVlUKjDBWWjtMe31g=;
        b=OP9mTUWR8KJ3IIkAbjpt2rr4dxi4qOq46iwDRhZZAdoR43NVbO45mUZVugEirlHzUw
         CxL5Xxga2CApsdNkm0tqi7xn1fVoM/g7GnmAJeZMgbvG67DUBCWsrttIjuSfwTeHYt4V
         TgwEWm31aM2eR1t7Ogsi9B5x3hsc+NcEfQw90vxUwdJYfCris4l9CD6f6lJ7cTUjBaI5
         QYFMS5wO2NdaxgnAJpqYawZyedTUEHDXW1CMd8ASLND4fZxK1RGi60U1rCOykODKFUzy
         S5du6BwDyAAkROWpQh+ZDNioM9YKPwM8oWDTkGd4RcKNgH+SOyvBlrWIVWmvWbTKutHa
         Z+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474307; x=1749079107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wr2SmmHn7WpXqUnHpYTLasaORThVlUKjDBWWjtMe31g=;
        b=mL8RSrBGurFYezlFzhCVqdQ1UVpd09m2Ne4VIGzf66g3g9KHorp3ui9PcKXqreBQNW
         nxQ4rlxCT9Q/p/m3tFQb8iy4iIKWLo3Ld6jbQ9RkajQAqt7qCyp/U64NY1Hy4JnstT+e
         L1MgyH1TfkJVWd21/z1VEbMXuI5MabR2wnsCY0Nbfovq3FzWZm6UG68GLskegRaHV/dd
         fby2IIBFzx72hvyGgEMUzsyzLqQ6lPBbMgQB5yk0q17J3JY6DWkP/PlYz49pcsZk2+Ag
         it603+QirmG6bE+QyBj+wjBDYjKqC3N81gYqNCE9fKB+e6cym1rzEq98zt3IBM1WaZ29
         VOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9nP14sPhLh3pA24EJvBh8M2lgAeHtH2ZOrrCsHC75ciWAmReJnQcGHK/cSQvvYVeXD6afxnhjvkZjDnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7/eJZn3HYSUyjJ4Zxm3aHbQ7ug/lnoAHYdGxOkq9Sr29pWVv
	n74gAxNEq+iNVKdQoW2ap+7qLwxeC/5evXCuimH3HQo68WnZjWUIRrXmYx7EAyMLvPs9Ui1c/95
	Ns7+Qn2/HVERIb/EOTMdf5tBqsb3V0ndcm1TDjPKc3P7+orwl+whoDhDxz5I=
X-Gm-Gg: ASbGncta2WiuUD0kJg1lmqvVcHx6ahwmrLPcB4/ov3PopzRFrGqD0pAh5mTG9VRTs50
	qr3rZhCSTxVNKbOZ2Vf8Q8HMZ5lALgHC7WQ9c2Ahs7UtqpL5eIccGCF8NBCDCwsXg3Vpruq5OZh
	Vl0ZMglrux6C1OR+PYXMOLzctrSWEpMrVZFwTO5P6OQL6vYVmGf28ah1m0B8Ievji/fUheXrG/
X-Google-Smtp-Source: AGHT+IHrQWnT1aoYjY0oeHltTf6GRFTqzvL9Q6WkxaAVD9sE+2fe2FKMHZRU2QBoTogMaiGikEG1uch6LTDxqqo2cNo=
X-Received: by 2002:a05:6e02:3cc1:b0:3dc:832f:61cb with SMTP id
 e9e14a558f8ab-3dd9190accdmr1484855ab.0.1748474307353; Wed, 28 May 2025
 16:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410202647.1899125-1-irogers@google.com> <Z_mK9BVv16MT7shL@z2>
 <CAP-5=fWykL-01S=35zz-6JASbM_cQkx6PHdKS7pJAX0=JBTuNQ@mail.gmail.com>
 <CAP-5=fWFYS7-FcbyJ5Z5U2rqA7eYwwJ4dMf90TUzwJ0Shh2yxA@mail.gmail.com>
 <aDdU1npHL2Vczhsa@google.com> <CAP-5=fUycjUUWW=hoSSvxfUVPXcqAk5KHnknFuUDOr7+Zf=M2A@mail.gmail.com>
 <aDdqcfuAuk78eKXD@google.com> <CAP-5=fUX-gSv0q_j59bG19=dnaCPMeATtFgM0bPMSP8DKZWRJQ@mail.gmail.com>
 <aDeHN4DeYS3i-5jY@google.com>
In-Reply-To: <aDeHN4DeYS3i-5jY@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 16:18:16 -0700
X-Gm-Features: AX0GCFsZnSL7nf1_A2btN6O7rfFVnUd3sZXE1H_YbANsSDeLH4pIccP91VNCf3w
Message-ID: <CAP-5=fW0g_bhmHm-uyVRja7dhkw47K-PLAx5iubQEm4X+vTSAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1] perf build: Fix build for clang's -Wunreachable-code
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 2:59=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, May 28, 2025 at 01:32:10PM -0700, Ian Rogers wrote:
> > On Wed, May 28, 2025 at 12:56=E2=80=AFPM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > >
> > > On Wed, May 28, 2025 at 11:35:00AM -0700, Ian Rogers wrote:
> > > > On Wed, May 28, 2025 at 11:24=E2=80=AFAM Namhyung Kim <namhyung@ker=
nel.org> wrote:
> > > > >
> > > > > On Tue, May 27, 2025 at 01:53:37PM -0700, Ian Rogers wrote:
> > > > > > On Fri, Apr 11, 2025 at 3:14=E2=80=AFPM Ian Rogers <irogers@goo=
gle.com> wrote:
> > > > > > >
> > > > > > > On Fri, Apr 11, 2025 at 2:34=E2=80=AFPM Namhyung Kim <namhyun=
g@kernel.org> wrote:
> > > > > > > >
> > > > > > > > Hi Ian,
> > > > > > > >
> > > > > > > > On Thu, Apr 10, 2025 at 01:26:47PM -0700, Ian Rogers wrote:
> > > > > > > > > Clang's unreachable code warning is able to catch bugs li=
ke the famous
> > > > > > > > > "goto fail" which gcc's unreachable code warning fails to=
 warn about
> > > > > > > > > (it will complain about misleading indent). The changes h=
ere are
> > > > > > > > > sufficient to get perf building with clang with -Wunreach=
able code,
> > > > > > > > > but they don't really fix any bugs. Posting as an RFC to =
see if anyone
> > > > > > > > > things this is worth pursuing.
> > > > > > > >
> > > > > > > > I'm not sure if it's useful and don't see what kind of bugs=
 it can
> > > > > > > > address.  The proposed changes don't look like an improveme=
nt.
> > > > > > >
> > > > > > > The goto fail case was in OpenSSL the code from a bad merge:
> > > > > > > ```
> > > > > > > if (...)
> > > > > > >   goto fail;
> > > > > > >   goto fail;
> > > > > > > ```
> > > > > > > Meaning the fail path was always taken and checking on the no=
n-fail
> > > > > > > code never executed. Newer GCCs will warn of this because of =
the
> > > > > > > "misleading indent" but  clang won't. It is easy to imagine s=
imilar
> > > > > > > mistakes creeping in, so using compiler warnings to avoid the=
 bug
> > > > > > > could be useful.
> > > > >
> > > > > It doesn't look very convincing to me but it might be valuable in=
 some
> > > > > rare cases.  But the proposed changes - basically replace exit() =
to
> > > > > __builtin_unreachable() - seem weird.  Why is calling it a proble=
m?  I
> > > > > guess it already has some kind of annotation like "noreturn"?
> > > >
> > > > Yep. The exit is incorrect (depending on your notion of correct, I'=
d
> > > > go with clang's notion as they've had to consider this for a while)=
 as
> > > > it can never be executed. I've added the __builtin_unreachable() to
> > > > document that you can never get to that statement, as otherwise it =
can
> > > > make the code readability harder with the code looking like it will
> > > > fall through after calling something like usage_with_options (which=
 is
> > > > noreturn). In unoptimized builds __builtin_unreachable() will fail =
if
> > > > executed, so it is a bit more active than just a comment.
> > >
> > > Oh I see, usage_with_options() calls exit() inside so any code after
> > > that won't be executed.  Hmm.. isn't it better to remove those codes
> > > then?
> >
> > Not sure I follow. The patch does remove the code but it replaces it
> > with __builtin_unreachable() to basically state that the code here and
> > below can never be reached. Do you mean remove the exit from
> > usage_with_options? Then we'd need to fix all the callers, which would
> > be a larger patch. Perhaps it should be usage_with_options_and_exit()
> > to make it clearer that the code doesn't return. I was after doing
> > what was minimal for -Wunreachable-code but while trying to keep the
> > code clear.
>
> No, I meant we may not need the __builtin_unreachable() at the callsites.
>
> Would it complain this code?
>
>   if (some_bad_option_use)
>     usage_with_options(...);
>
>   /* normal code path */

Right that would fix -Wunreachable, but the existing code would be:

  if (some_bad_option_use) {
    usage_with_options(...);
    exit(..);
  }
  /* normal code path */

Letting you know that "normal code path" couldn't be fallen into after
usage_with_options(...). To make the behavior more obvious we could
rename usage_with_options():

  if (some_bad_option_use)
    usage_with_options_and_exit(...);

  /* normal code path */

What I've done is:

  if (some_bad_option_use) {
    usage_with_options(...);
    __builtin_unreachable();
  }
  /* normal code path */

My reasoning is that usage_with_options() doesn't obviously on the
face of it call exit and never return. To make that clear we could add
a comment:

  if (some_bad_option_use) {
    usage_with_options(...);
    /* usage_with_options never returns as it always calls exit */
  }
  /* normal code path */

But my preference is to use __builtin_unreachable as that is the same
as the comment but is also something the compiler can trap on were it
not true.

Thanks,
Ian

>
> Thanks,
> Namhyung
>
