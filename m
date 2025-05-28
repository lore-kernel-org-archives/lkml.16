Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78C212FA2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464344; cv=none; b=BoByTn6sV3xymRMLG6VnwlHVA0TxYmPZAeP/1E16+CNzj59ZrbKcF1r/0RYSfQWWx1kSbOTsHLonGbIf+lRrVhpUmDXotykk7v6yAikP7YQsTGHGolbCHWYrcAEj53+5Z0Q9jeR9EdP0BxAnIMGMYNVaXRQpj6wt9PmGV6jBgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464344; c=relaxed/simple;
	bh=cqzg8Nrs2RZmTh//Eb9TZWrUR64FfEAGu16wIkkYdAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFX7MIC0lLZnqsoPRzXH/6ab3mwjw4gY+gfyIsPygLJH8XyNLZ0d0DSbFewjk6N1uquTifpzvudi3LqMmeBfN9I+pNu03z8w0q6lp6iv/UmHnhP3ytfz+Rfvq/dzm0IOtDf7/SxdVY+zRGeTY/V9868Fh8gaX8h4xCzRB1mQGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDyg0zd9; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDyg0zd9"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so6455ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748464342; x=1749069142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ArJMZMVl2LGkS46qbZimujHcHlerzQiWnjpA0Sru5c=;
        b=EDyg0zd9WoMAXGYqL44CIGrO2Nfy6tslK/NTrvGJ28wx7zUjSgX/D4gxJ67b0Narz7
         RIC78+wW5UkRzwZnSoIYcpG4QYVwU9CKIlwQAOTxJTfRJQerBxgECpEVRk4HRrljCqZL
         a0mW1KWEZwqr7KShAfwkUKQ+JAuJCTRvtM6KW0wVa2loXaC/0rzozgSC/sjMpMuMvlu2
         0QemHv0SSRiFw9FbkPUC+ZWp4lS+KgdzFNicHrU839fSedOmjcMLR0Angqy0hbhiNNYi
         YLxnpvV1Xe5fGz3d2WMWJ0p73SnhIYSqDlgVBznWrVJoAKh4Md3Mm6HxXcNPOdZw24OH
         snzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464342; x=1749069142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ArJMZMVl2LGkS46qbZimujHcHlerzQiWnjpA0Sru5c=;
        b=SpD0JEDtWWm+EKl8DcoCsxCupB2h/uUYefnLFMz3UKgbyIcEKlkutgMRylOuhR/aPx
         NShPEqw35Oy3FJSLgi/cLDi61M9FRI/2UF6y/MRBUcY9XHXkNi9uJqqv6QVRdX7fIcWD
         MGWjQKm16oZIY3OyyV8MeaLnX1e/uMRMNb4NCG/4h7nLCdF6o7wsG3rQZ4QXrQClT58G
         0oAW7cnDcR0mDNhGqtL4NDMnz0UU1S4KAYZrRN9B5U4xydUkyvP59bQqXFvzCDiUmMNK
         Nzjh5EbZiI7RvscvZMdL7kDqpbc+rlHAghqx3sXmlgONjxchW5VxE2fFt/U0IDoPEQvu
         kyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/HnOLDeySibktPB1OkYGEPqoKO01irTKymY25W6u4BCCWBSORZ86ylcoGb3YAMnMOMfajZfEJWn4IQB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/FcoHb002YD33Oof6bkKJIlVKUKNDnk9qq2cEjuKq81KDACKh
	WQAMQM+fKzOeKETPoZp74tNZYjAfv4FitPXsz73Gv6Et7s53G+Ffvjx3mh45HBf7eG0vrwRXfKf
	vgZA8HIDnuWXCITaUvva8c5hHu+4zMqlQGksuULOd
X-Gm-Gg: ASbGncvKyPa4FEDUfUFPUrLpUUGLLflso4pfAKsqJnIRE/wvVUUzB51NQ2pX7VqLzJ8
	VfN84TaA5FS71q+4gc9EkTPChQqyc2OJbGac01/4EtMUibnW6Hnte6mlqh3rwlOI8OATc6iePLb
	cgevUlwDEQM3b7QYndaTBonuZ4Z4cC3R6vCo/eIiN76WXBfQP8RyFpSd2xdofESVquKGa4CLWW
X-Google-Smtp-Source: AGHT+IFxbYf/KKgtCHgkR2g2hC0aOo7l94jOkHSdvspLVMHrtQQvMGCJs9feaLc4Sb7/kUdAI99/uigeUUrlItn6an0=
X-Received: by 2002:a05:6e02:3e90:b0:3dc:7350:b0c with SMTP id
 e9e14a558f8ab-3dd91cc5c41mr800305ab.16.1748464341947; Wed, 28 May 2025
 13:32:21 -0700 (PDT)
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
 <aDdqcfuAuk78eKXD@google.com>
In-Reply-To: <aDdqcfuAuk78eKXD@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 13:32:10 -0700
X-Gm-Features: AX0GCFurQFzXfvz3EqLi-jVNrcInm9hsA2oagIcDmbIRIUFQSZV7VWoEaX9DxkU
Message-ID: <CAP-5=fUX-gSv0q_j59bG19=dnaCPMeATtFgM0bPMSP8DKZWRJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1] perf build: Fix build for clang's -Wunreachable-code
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:56=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, May 28, 2025 at 11:35:00AM -0700, Ian Rogers wrote:
> > On Wed, May 28, 2025 at 11:24=E2=80=AFAM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > >
> > > On Tue, May 27, 2025 at 01:53:37PM -0700, Ian Rogers wrote:
> > > > On Fri, Apr 11, 2025 at 3:14=E2=80=AFPM Ian Rogers <irogers@google.=
com> wrote:
> > > > >
> > > > > On Fri, Apr 11, 2025 at 2:34=E2=80=AFPM Namhyung Kim <namhyung@ke=
rnel.org> wrote:
> > > > > >
> > > > > > Hi Ian,
> > > > > >
> > > > > > On Thu, Apr 10, 2025 at 01:26:47PM -0700, Ian Rogers wrote:
> > > > > > > Clang's unreachable code warning is able to catch bugs like t=
he famous
> > > > > > > "goto fail" which gcc's unreachable code warning fails to war=
n about
> > > > > > > (it will complain about misleading indent). The changes here =
are
> > > > > > > sufficient to get perf building with clang with -Wunreachable=
 code,
> > > > > > > but they don't really fix any bugs. Posting as an RFC to see =
if anyone
> > > > > > > things this is worth pursuing.
> > > > > >
> > > > > > I'm not sure if it's useful and don't see what kind of bugs it =
can
> > > > > > address.  The proposed changes don't look like an improvement.
> > > > >
> > > > > The goto fail case was in OpenSSL the code from a bad merge:
> > > > > ```
> > > > > if (...)
> > > > >   goto fail;
> > > > >   goto fail;
> > > > > ```
> > > > > Meaning the fail path was always taken and checking on the non-fa=
il
> > > > > code never executed. Newer GCCs will warn of this because of the
> > > > > "misleading indent" but  clang won't. It is easy to imagine simil=
ar
> > > > > mistakes creeping in, so using compiler warnings to avoid the bug
> > > > > could be useful.
> > >
> > > It doesn't look very convincing to me but it might be valuable in som=
e
> > > rare cases.  But the proposed changes - basically replace exit() to
> > > __builtin_unreachable() - seem weird.  Why is calling it a problem?  =
I
> > > guess it already has some kind of annotation like "noreturn"?
> >
> > Yep. The exit is incorrect (depending on your notion of correct, I'd
> > go with clang's notion as they've had to consider this for a while) as
> > it can never be executed. I've added the __builtin_unreachable() to
> > document that you can never get to that statement, as otherwise it can
> > make the code readability harder with the code looking like it will
> > fall through after calling something like usage_with_options (which is
> > noreturn). In unoptimized builds __builtin_unreachable() will fail if
> > executed, so it is a bit more active than just a comment.
>
> Oh I see, usage_with_options() calls exit() inside so any code after
> that won't be executed.  Hmm.. isn't it better to remove those codes
> then?

Not sure I follow. The patch does remove the code but it replaces it
with __builtin_unreachable() to basically state that the code here and
below can never be reached. Do you mean remove the exit from
usage_with_options? Then we'd need to fix all the callers, which would
be a larger patch. Perhaps it should be usage_with_options_and_exit()
to make it clearer that the code doesn't return. I was after doing
what was minimal for -Wunreachable-code but while trying to keep the
code clear.

Thanks,
Ian

> Thanks,
> Namhyung
>
