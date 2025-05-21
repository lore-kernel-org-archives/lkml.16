Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295D230D0A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822048; cv=none; b=f3TfLAY8RwxhJT1QFXMemTB4GNkWc5i2YV//RnFLYGaeHKpn3P0CQGb+HYmr4KdUaYGZNroUx+csks7H+ACsJkX6YQGvuJ3Yt1qQ7kjULtqKeX8a3ZtNLXNPH7jXGOR+Jjim84/hDAdLdXdEGW8PbXAz6/6+6U5ouArPBySsWoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822048; c=relaxed/simple;
	bh=s70l0RzgckCjo3mnTRJ4NRxVGh71GKYFGpMyc2nLVCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MocgDW1ngVFseq+fL8zPwPHfQPJjeVtYJikiTaVAg1e+2iCScK37c861rqvffjlY4XiObjUGvSdx3FYZF1irlCa2tsuGwODMdzuGsVUCUglGUDQOjSLuP9NDdfLZTlWo6X5M4Ferr022SEjjiQqFolsVv59HNiNnswqMwCN5s60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEqb53yr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEqb53yr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fe540b74so1788231e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747822045; x=1748426845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg3KxafjaR6S+uofCX5Tlv+8Ue5WhF8d1zNhWCIK12U=;
        b=tEqb53yr71rZCsjfcfVQjPO2fTi2FSvIIpn5EByRRl0ZlJ2VU92jSSMXXHbrSL+5/2
         najy8gMEG7diyFF/o58kHt3ihDMpWzkZWTdA4OKNEYZ/la1fvgYb1hG3bd2Dcs8gQeNz
         H1HJ0e0mN5jipP1yWql5t0OC4Y1m7iirQ0M9leLCneTH5W/y1Rjasz4kWRBqkv0RWjLX
         FB6rKafcDgwslbAUeLDRVGF0KJ5e5RoclP0/LmVmYhzgj6rA/juEbLPQctu0xSwgejN7
         kqErZmjlKv8tvvxGWt0j3h8kK/hzlaLdnaOgOu5dVwAz0CUAudYmraiA8JMYx7J2uJWa
         Xa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822045; x=1748426845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bg3KxafjaR6S+uofCX5Tlv+8Ue5WhF8d1zNhWCIK12U=;
        b=GVv8FLiaArHzUJazxWLf0o80Vhb3hg2jXocI9LmBW33ChmoIVrVRxC8UHEBFWLvN4C
         9dCrhy0IM1kZ9BmA0rZJSDFwLu7wkJ535aMzBuOSFG1F+J8o7glr6aFZwWCj/Hi1+kZg
         4wj2JDbTXTRu8VbNkibeo4LqojRE/x8jELwc5/reRVbJqNRR/xugCDX95FVekZHkykA6
         /L3i57AKDd1TOIt9X3wN4tQenulPwG8Zm5Cnc5raH2Kr/XsSEI/3Vw2Tgz7g20IXHykV
         gjos6IORD9GLKmwjtC14GfeEmlcaFm4QIK8wJdxxwoeAXu9fk4B9LonDAS2laFo1KLv/
         xAeg==
X-Forwarded-Encrypted: i=1; AJvYcCX6xn+4y9/jyozFStcQROMiV7EU7qyHF9dOUBfDd4kpyixdAzf3YA/cM5TRqxxx0ihCxeGxhRW+Ikm+CaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpgVnLisCLg03uQ0jjzgEU4MjtwVbiSpHWdqiFafyPcac4tIw
	E0xGrAIC4MpzixSTWqOqC5HFGeYBZMPO7VawXfDNCYupRfwKS1Q9+kaoxemW8e6fQlPapDoUVk2
	ho4pAdeMVwsdOvKFVsdskK7rp8XBnQ6CSpUF8HHn+
X-Gm-Gg: ASbGncv1zlT1c6+o14lARPk4vHpO8MRtT1RbSKKFocfkty1qk4GjngrILKLn5O1gaE1
	Nfsa5uCYXoFiZ29DofXbNnx+GS09TTnM4K6M5afl2emxFTkkcgpVUpOCz61VR+iyX7L378stSWf
	A7mefohMqWx4ftedVwVY5Sg2vXDk3gA14DEIqEqs2UIWvOVz4dYH42pmNrs7axmw0gYqj4uXFs5
	1s=
X-Google-Smtp-Source: AGHT+IEpQHiVRQXYCzR8oB85uk38anT7Ra5PRP9jwe38F+43aa4a/dJJUntY/14RO3Yp1ZmYTfCS4kQUVGSALXsIcYg=
X-Received: by 2002:a05:6512:2601:b0:54f:c580:af96 with SMTP id
 2adb3069b0e04-550e990732emr4994286e87.50.1747822044609; Wed, 21 May 2025
 03:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740386567.git.dvyukov@google.com> <d11d91e0c27ef78affcef06e00d1cf4cd8747fcc.1740386567.git.dvyukov@google.com>
 <87v7sj3dlx.ffs@tglx>
In-Reply-To: <87v7sj3dlx.ffs@tglx>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 May 2025 12:07:13 +0200
X-Gm-Features: AX0GCFvertoxlIfbHZN9m4OCQuVInznAUpxCLCYXbH3wgOYemmFcG0el6ki3YYU
Message-ID: <CACT4Y+a3EPcAS4yB8c2d65+T3zXoTYwN6-G4G0C_JDWBEo6EOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] selftests: Fix errno checking in
 syscall_user_dispatch test
To: Thomas Gleixner <tglx@linutronix.de>
Cc: krisman@collabora.com, luto@kernel.org, peterz@infradead.org, 
	keescook@chromium.org, gregory.price@memverge.com, 
	Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Mar 2025 at 13:34, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Feb 24 2025 at 09:45, Dmitry Vyukov wrote:
> >
> > Also use EXPECT/ASSERT consistently. Currently there is an inconsistent=
 mix
> > without obvious reasons for usage of one or another.
> >
> > Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
>
> As Gregory said, this should be the first patch in the series with a
> proper Fixes tag.
>
> >       /* Invalid op */
> >       op =3D -1;
> > -     prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &sel);
> > -     ASSERT_EQ(EINVAL, errno);

> > +     EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &sel)=
);
> > +     EXPECT_EQ(EINVAL, errno);
>
> Seriously?
>
> Something like:
>
> static void prctl_invalid(unsigned long op, unsigned long offs, unsigned =
long len,
>                           void *sel, int err)
> {
>         EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, offs, len, =
0, (unsigned long)sel));
>         EXPECT_EQ(err, errno);
> }
>
> static void prctl_valid(unsigned long op, unsigned long offs, unsigned lo=
ng len,
>                         void *sel)
> {
>         EXPECT_EQ(0, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, offs, len, 0=
, (unsigned long)sel));
> }
>
> ....
>         /* Invalid op */
>         prctl_invalid(-1, 0, 0, &sel, -EINVAL);
>         /* offset !=3D 0 */
>         prctl_invalid(PR_SYS_DISPATCH_OFF, 1, 0, NULL, -EINVAL);
>         ....
>         /* The odd valid test in bad_prctl_param() */
>         prctl_valid(PR_SYS_DISPATCH_OFF, 0, 0, NULL);
>
> But that's not enough macro uglyness sprinkled all over the place and
> too readable, right?

The EXPECT* macros unfortunately can't be used in helper functions,
they require some hidden _metadata variable that is present only in
TEST/TEST_F functions:

sud_test.c: In function =E2=80=98prctl_valid=E2=80=99:
../kselftest_harness.h:107:45: error: =E2=80=98_metadata=E2=80=99 undeclare=
d (first
use in this function)
  107 |                         __FILE__, __LINE__, _metadata->name,
##__VA_ARGS__)
