Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8D1EEF9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994768; cv=none; b=ia3MQbx7RW34hJLtgia8issKQmcHoXs8CiRBpHndU3M1sZJ6nNXEJgMzmGkhAGtCPlyIrbt7w6foXeUo9s3mi7Mk1J10a/5cTwvSL7hd7Bi0HphteXzzqpiQQBJwUpQZrTHksTlYN4pkoK8EY0IIU+vZ7CEX2BuCmZIQ3VJ5f9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994768; c=relaxed/simple;
	bh=srIfV6amwCWjGQvI5RWfVyZN+JGL/cYxE0qHJh0jcY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g15Z7ZaXcn26rZBnqEvD9wzKDYDwx45+v6u00evmYNp1xQL+r33VLCecORVnu061KM2wYRFW1i/mF8CBLtvj1a6Fyq9RS6whSqy2JZflNs9MzObFQQW9amyPJlSQOloNWOAasIO/UjKmAGClKOqblnqfYbDkUqhQfURPGyM4E+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DtYCU8Tq; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DtYCU8Tq"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c56a3def84so668224085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745994764; x=1746599564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAbc6YX2BEbygBjJalZAbMTq7w51TuvD5bWRRi5P2r0=;
        b=DtYCU8TqYb767vtn9I0uD3oGsLcvtKAWiIhq/QSX+8mej2ZD7Bqqw2vcwXXvnAb7wy
         geuBz2UMvjMFb6gyaFu8J3uAzKuKT6cvSEcOIRukVhYH49yaxWhxui+VWHNghYBhdaW3
         qB6vfkUMyVJomii59HqYLN07x7v44gzGNd7P0F04u/0kf4PH7lKw2orAr4RjXeOwSepC
         nMvAZcLeUbjmVSJNr6BuDii8fPunwpC4TZKUdyxX+FLDyQ44X2B873HIChQ9Ml0USQ3W
         DlyEbBbCpKiUbM4N689FazgmuFp9B7TbrL4Y1XfdIdTUpURoTYp4/MQPg97UKdFWZkm1
         g27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745994764; x=1746599564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAbc6YX2BEbygBjJalZAbMTq7w51TuvD5bWRRi5P2r0=;
        b=btL//e1bhyDQNs0ldGbYXe9HBmo++MWWYqznp0fyFIIuIx0TV57MtabGJmQ98MDoX+
         mSNdjISwFgqW3b+NU8rL3SsnYeOdDwSjt4ZxUGwFvDaL2HEMLWpIXwCHr/0gQVQIKWtq
         DvV7+6d25yP6RYow4XjiK1ljCcmeFuc0R7qv6lHJLJgQaTK/zKqaKVeTWyrVNJdL8q6Y
         OU/x5WjycB5DtvAHoHhqh3H957l1n0+dEiQ54qBLyGDYAiyOo47zqH08IT6/0JNjI+5E
         bjlRqlHzuVYA7bmgsZM22cfN4wNQyNRgLs16tugq4c2fHbNMc3fg5PJeCOFgid1m9iEb
         NeuA==
X-Gm-Message-State: AOJu0YyxBXSWM6876uYL925z9ZQvtMFjqV07oN4kdF4T8KYYK2TaZJ2F
	oWSSIsiDJRCW/Eis3KkEylh4VPL0H/B7nWBDvAXc+tyz2KtppL/pBZycKAhtJr7xlgJwndmz0d3
	yCKbDh2BsQHECAfYf+SD8JadIA3f1tlu9sYxOdhlC9E6eiBcOgLB8
X-Gm-Gg: ASbGncvIS1I4xs/WC6OisgwPQ3OnqYfq0Uq5HrMuqB9W8GWZ6YFaJo4FqRD1Cs76lfr
	KSGkpkZG2dPNmPjdfWLl/myeekn6cNEnYgup+OM9VuJisZv/FD+TTiHOprFtYhNnHu9znrP2Nm/
	F9p0i6SfJIbmIo4VIwDwG/XxPeMKPd6rAAWiKEdpEC4vx8RoB7w90=
X-Google-Smtp-Source: AGHT+IEsI6KqS4FZXzn77qj8UbcLbY2Fuk+9nrIfLcamksHZhmVU14lSM8LBtxhZcOOhHQAiKCWBffvUNUQSE+yZWY0=
X-Received: by 2002:a05:6214:20cd:b0:6d8:a8e1:b57b with SMTP id
 6a1803df08f44-6f4fcf54668mr42054026d6.36.1745994764028; Tue, 29 Apr 2025
 23:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-6-glider@google.com>
 <aBGJQF8aMfWmz7RI@hu-jiangenj-sha.qualcomm.com>
In-Reply-To: <aBGJQF8aMfWmz7RI@hu-jiangenj-sha.qualcomm.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 30 Apr 2025 08:32:07 +0200
X-Gm-Features: ATxdqUHu1qKH5gcCfA7KsbnTw7kQoM95BYm5aAyVkI445VxwmoYxXFvDOEOIBGM
Message-ID: <CAG_fn=X2wBJAhvwMHesQMH9kpnZFjqRL5RLNBvFT7j9ZC0+GCA@mail.gmail.com>
Subject: Re: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:22=E2=80=AFAM Joey Jiao <quic_jiangenj@quicinc.co=
m> wrote:
>
> On Wed, Apr 16, 2025 at 10:54:43AM +0200, Alexander Potapenko wrote:
> > ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
> > in the presence of CONFIG_KCOV_ENABLE_GUARDS.
> >
> > The buffer shared with the userspace is divided in two parts, one holdi=
ng
> > a bitmap, and the other one being the trace. The single parameter of
> > ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
> > bitmap.
> >
> > Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
> > pointer to a unique guard variable. Upon the first call of each hook,
> > the guard variable is initialized with a unique integer, which is used =
to
> > map those hooks to bits in the bitmap. In the new coverage collection m=
ode,
> > the kernel first checks whether the bit corresponding to a particular h=
ook
> > is set, and then, if it is not, the PC is written into the trace buffer=
,
> > and the bit is set.
> >
> > Note: when CONFIG_KCOV_ENABLE_GUARDS is disabled, ioctl(KCOV_UNIQUE_ENA=
BLE)
> > returns -ENOTSUPP, which is consistent with the existing kcov code.
> >
> > Also update the documentation.
> >
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > ---
> >  Documentation/dev-tools/kcov.rst |  43 +++++++++++
> >  include/linux/kcov-state.h       |   8 ++
> >  include/linux/kcov.h             |   2 +
> >  include/uapi/linux/kcov.h        |   1 +
> >  kernel/kcov.c                    | 129 +++++++++++++++++++++++++++----
> >  5 files changed, 170 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools=
/kcov.rst
> > index 6611434e2dd24..271260642d1a6 100644
> > --- a/Documentation/dev-tools/kcov.rst
> > +++ b/Documentation/dev-tools/kcov.rst
> > @@ -137,6 +137,49 @@ mmaps coverage buffer, and then forks child proces=
ses in a loop. The child
> >  processes only need to enable coverage (it gets disabled automatically=
 when
> >  a thread exits).
> >
> > +Unique coverage collection
> > +---------------------------
> > +
> > +Instead of collecting raw PCs, KCOV can deduplicate them on the fly.
> > +This mode is enabled by the ``KCOV_UNIQUE_ENABLE`` ioctl (only availab=
le if
> > +``CONFIG_KCOV_ENABLE_GUARDS`` is on).
> > +
> > +.. code-block:: c
> > +
> > +     /* Same includes and defines as above. */
> > +     #define KCOV_UNIQUE_ENABLE              _IOW('c', 103, unsigned l=
ong)
> in kcov.h it was defined was _IOR, but _IOW here,

Yeah, Marco spotted this on another patch, I'll fix kcov.h.
