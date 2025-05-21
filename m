Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18715264A95
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832431; cv=none; b=ONBg4qgo+FNhlFNTXn2SF/acqjVgc5hbzyh8zUcqBzEUQR7/4G0bJOjqgFbuwpKyGpLRJEFsScw1LVnLii8oN1/eusLCq45MYRruA1IlEp7QZqE2riNGFhPrmXk3MprKwTe8QhSfPjzM/QieuRXC5gqcvAJE8t+lO7T3NouooHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832431; c=relaxed/simple;
	bh=qADv6ziM8BynGP0Frd3QYCagZF4zh/hj/3MAkN1hMIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kryCk8z5l7HceFqr8D+xDastaPkVnyWUiqSftYWSHrGtgsYr6c4AIlnL0Pt3QS+KyiEnxKtK3o0LD9lDngKhi4KxNKoO4NS5Mk9p3My+jBVLoMx6PdvQBYU0PyyVcsxNgm+asxsyeoI+CUQVL2idQOPIEpRVqyV8BwdFJp0qhL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xxETPoT6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xxETPoT6"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso61954551fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747832428; x=1748437228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G73EKvuw4a7mUkaWcq9LcxdhnViFJcFqKeikiaQy7e0=;
        b=xxETPoT6aG0lxVTQck1TuZgq6NdU+sbjsqCy8AkD6WfOJsp6Bv06grzz+C+E2BQlj8
         Uo8LgMC3CwUGcX5MPBMjwKuvRw0nUubss74HcY45ucfqC2mPTTiQRmUG8jXfNKmCjqSg
         Xi6jjKOmdni8Y1KEF7udrW6w4YdjS0L6i6LHZL5SE6U7RavGOHOS8R62YWfhyKVZ64kO
         MFsJetqNC61hMYHRpakCpKS1t/u3Rgu0C04ChIzYLPz5nWOSSAR2pRPvdXzO+9WIyZgG
         JGyy+gZNfjqPwHCIBiJGrxFzIQhUvMgPC7Lknj7skxaHAafPkVJhCfYDpPLKcKmwEho2
         VWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832428; x=1748437228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G73EKvuw4a7mUkaWcq9LcxdhnViFJcFqKeikiaQy7e0=;
        b=RCbMvkHvzhzZKDraJwqlx2PyiPROY98ycZyECoMqSdrRmweIH/nY39o6j7yFqfpVhX
         g5awycymtJTqClq0mIBN3LU/2MjgiHxjaIA2ux5k5nx8ncAi8W9vsOtpumtiPD3m065R
         EtJSYngN9w5DM+eOqcWZCW0TgvGF8PZ/J/4x800fenGLRWROLUngVrVKwF8dEe5xXiTh
         zSnU38I/RYnIO9zzpYMRvGYR8UYbvW7RV5ZjAT0cmS+eiPBNWG1dFDHQtNmM2LxVsFqK
         B/sryrh/rJP4ex1GIq7IjwN/cPjG6tH4sVnQZ2IGhsdUBc4MKc2BlP1c29oAuZSibm34
         hxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRmDHZeBERrV8CPdb7RDxC1GXg2zSjIsftNtKsTUl6gKp/wCeUPIc/2mKPQTIT3cVYT/P6fEi5L2wyeWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmkHYo8fFLpvgiT7CHJYsUl3fPVbvCN2J83eKHEo13qJLCYj4
	hiJFC3hSu2zPgwHGz1B3+3vmwWUN6EkwbhR4K2I0qp2wTjwzkNXP6Y+CFPmuY9CkIzYP/658nF4
	huWyKyrcPA6+9M6De2Cp8hSJnyt/c3JUWMOcK8nat
X-Gm-Gg: ASbGncv97C8KdhrWt+UmeAaOjbPdC46/C1c8SiXrHEa21ANAzljQ8zhG78P/N/BmG7+
	WGDoOdp47N5CjzHwkbDStx0gEmiK17tbzg16h+Lfa4x8o08OGyizSMbFgh5sG46v4IAD3M0fYxp
	T+k5X03Vkox16amaimkQftZaMJfQVXblOMgaNIZiQdRUHfFHpk2Hbc7ylOMKmUi9TNHsOi2HhGc
	HaY
X-Google-Smtp-Source: AGHT+IFooYcYEExduBcnYQFbDug+Lni3ZVNCR6ZHlHaKU/h4Xs4wtm2a8Y2njLddvgAcEGxJeMXcnCkb2rQtevCDeMA=
X-Received: by 2002:a2e:be20:0:b0:329:3690:5c60 with SMTP id
 38308e7fff4ca-32936905decmr9238831fa.38.1747832427890; Wed, 21 May 2025
 06:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740386567.git.dvyukov@google.com> <d11d91e0c27ef78affcef06e00d1cf4cd8747fcc.1740386567.git.dvyukov@google.com>
 <87v7sj3dlx.ffs@tglx> <CACT4Y+a3EPcAS4yB8c2d65+T3zXoTYwN6-G4G0C_JDWBEo6EOA@mail.gmail.com>
 <ac23d886-8b9b-463c-91e4-aa541351976e@t-8ch.de>
In-Reply-To: <ac23d886-8b9b-463c-91e4-aa541351976e@t-8ch.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 May 2025 15:00:15 +0200
X-Gm-Features: AX0GCFvUEBNrK3JNS5dg8pRzJ-F3gzdBOQwU-amQhe_Pjy7oF6GB7qmsBoX0wIU
Message-ID: <CACT4Y+ZFMGdvO8e5TenNKNCwBJYtY-kB=uB-CLBEe2vrr3TWdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] selftests: Fix errno checking in
 syscall_user_dispatch test
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com, luto@kernel.org, 
	peterz@infradead.org, keescook@chromium.org, gregory.price@memverge.com, 
	Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 May 2025 at 13:10, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
>
> On 2025-05-21 12:07:13+0200, Dmitry Vyukov wrote:
> > On Sat, 8 Mar 2025 at 13:34, Thomas Gleixner <tglx@linutronix.de> wrote=
:
> > >
> > > On Mon, Feb 24 2025 at 09:45, Dmitry Vyukov wrote:
> > > >
> > > > Also use EXPECT/ASSERT consistently. Currently there is an inconsis=
tent mix
> > > > without obvious reasons for usage of one or another.
> > > >
> > > > Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> > >
> > > As Gregory said, this should be the first patch in the series with a
> > > proper Fixes tag.
> > >
> > > >       /* Invalid op */
> > > >       op =3D -1;
> > > > -     prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &sel);
> > > > -     ASSERT_EQ(EINVAL, errno);
> >
> > > > +     EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &=
sel));
> > > > +     EXPECT_EQ(EINVAL, errno);
> > >
> > > Seriously?
> > >
> > > Something like:
> > >
> > > static void prctl_invalid(unsigned long op, unsigned long offs, unsig=
ned long len,
> > >                           void *sel, int err)
> > > {
> > >         EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, offs, l=
en, 0, (unsigned long)sel));
> > >         EXPECT_EQ(err, errno);
> > > }
> > >
> > > static void prctl_valid(unsigned long op, unsigned long offs, unsigne=
d long len,
> > >                         void *sel)
> > > {
> > >         EXPECT_EQ(0, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, offs, le=
n, 0, (unsigned long)sel));
> > > }
> > >
> > > ....
> > >         /* Invalid op */
> > >         prctl_invalid(-1, 0, 0, &sel, -EINVAL);
> > >         /* offset !=3D 0 */
> > >         prctl_invalid(PR_SYS_DISPATCH_OFF, 1, 0, NULL, -EINVAL);
> > >         ....
> > >         /* The odd valid test in bad_prctl_param() */
> > >         prctl_valid(PR_SYS_DISPATCH_OFF, 0, 0, NULL);
> > >
> > > But that's not enough macro uglyness sprinkled all over the place and
> > > too readable, right?
> >
> > The EXPECT* macros unfortunately can't be used in helper functions,
> > they require some hidden _metadata variable that is present only in
> > TEST/TEST_F functions:
> >
> > sud_test.c: In function =E2=80=98prctl_valid=E2=80=99:
> > ../kselftest_harness.h:107:45: error: =E2=80=98_metadata=E2=80=99 undec=
lared (first
> > use in this function)
> >   107 |                         __FILE__, __LINE__, _metadata->name,
> > ##__VA_ARGS__)
>
> You can pass the _metadata parameter to your helper functions.
> While it's a bit iffy, many selftests do this.
> Also the upcoming harness selftests will make sure that this pattern
> keeps working.

This works, thanks. I will include this in v3.
