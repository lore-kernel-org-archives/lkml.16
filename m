Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08383BA45
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749415892; cv=none; b=ml2u5Mk0Xme5WxHVOYgF7iVCZqvjbgEDOACLFbwyMs113+0sBpWIlarwMeArvSJyB1S64Q/ha6QiX4+yxLzB3V7cAmi/cX3sapHX+InErgAHeHLENLFIC02QICBxr+db7XiApKq4HGSYZmCcYRdvRVmu7vSnbxc8EH0+D8tiqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749415892; c=relaxed/simple;
	bh=Px/0YFFfQgAp30uBoSemkeCnWbqWdso70tivvs4AZV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aEbHEOHa58spOMDdVkab3cMSb6p4XUK/MEAeQyvpM05pc+vweI0c04CtZ3/rDE8kLMH0KLVn47ziyMyCublUJFQUhZp7XnryZZDYAcNWNAN3TiQ++3ly/tbI7pg6WfQM7bywg09f4957ixuwKEm6g0DoXbXWmsCoP0f712yzXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkLTsX4R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkLTsX4R"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3243974f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749415889; x=1750020689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZL2agAs0w4h8Qs0E9WxTiUlnuBLzdLqPYeCaLtTnuk=;
        b=KkLTsX4RpjANiBmnxhB7khvSWC/pq8XVcWOH1/B7jAHPJSMHBTfqGnfKs7QaFxMvlW
         QHQUWiBOzsgXcVlj3fOGU5Yuevg4gwxN30Pf5dTOhbQ7Pz8o0rATfdsQb+z9hVlv67Zs
         BFIrdEhYvmEQF+sT6AiLhwoJ2jkOTHA+Y51bY2lJ+vzP9pMSnDbFVGnZavkbVy+3vMA5
         kp9CXQGBjaltBfcaIjIi0pXvhrd+jVuTB+8yFy4ZxNKYzB8JPS1ALvSGECPk7dabkFrj
         otN+wgtolnymBNY5cXHLqAipDNsE1S3MFXyfjI2CnqvIbOiwTp2WvlfexfnEJEutdJXo
         QEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749415889; x=1750020689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZL2agAs0w4h8Qs0E9WxTiUlnuBLzdLqPYeCaLtTnuk=;
        b=GfNm1omoIvnXwbcC8krD+cmFDXcyfmBSMGip6z6+TUJ8evDDFqr7qdwGMxsjUvTN84
         Uox7W6v3u9QPa853SM+k1lCN2jsXQpppnDhLIwTTutXCcehdF0OJFJBX5YAKS2yGKCl2
         am5eSV48i4eYnW30Z0dMuFE3KbnQ6/jcbUf4lN/tsq46AmV/jCafraSTnvE3zxRKtQXQ
         H0BiMuZpACKpm4o7cfrP4L5KNAjd1XLLvHdrb/KHuglsIZrqSMBxbbA6JV+0yKgjMHER
         V7D5mTo8nbPsccOvHmSTDH0CmGsKZzU+6OFpen2JBBdX6Nk3ZBK/hIryy7Jk50U3WTPE
         4U1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVehzWgiuMMIVdCnP44xfmTQsK54YYpOfDP/7lCuyXo/FavQJBSHykxsYluVf5OYAYN7jmspld+Vcifo28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6d6qHnS6BugmoPBvKbcSXGFphWBiN28bKq9wQE2Lk/QOmlK/f
	su2IPoF8T4mmlrbSBqRd9ejqnzx3xYuzjyw7KtZsVUO5c5Zm8wEuMGLQ
X-Gm-Gg: ASbGnctuiyIZq9ov3SrRLV16wqUTcc0UQAqx/lEi7zVhl7dIKtnnWTNVhfaie3Nndv7
	87z8NPfPNQkarFBigVdsl0Ribf88O+Hk1Mj9HyjKOpKeK23JpsY7QS935MFlYnMhKa0FCUtpLfr
	PgM1AcL//IjA/lGpEOphF+XmjwxQM28ZruwtlkVLv5dvDAeDGHtfCR5LiuRfApQS/GUIgTilsWR
	ToWnpjlwSIXIHAriDaE8xZND2Yzibogx5YjNdjbCZLqQbpmwkiwU8vvotcvd73mM2E3UdQ+UDKJ
	RIfQ+fxRVU91Y/FXPnHTNBpoQSsHHkhtfDwPZURkzFA8up5R47ilUVxXzK4rmrLTyEF6e4gI4NK
	K9INFjM+RPsJreA==
X-Google-Smtp-Source: AGHT+IGj5EYWggnjYu7fm7eBZ41riqiowTD9DYcYGljwyKfKd+sTFhb3Nu10gVXzDU6Lq/VyjqIITg==
X-Received: by 2002:a05:6000:40c9:b0:3a4:e0f4:e455 with SMTP id ffacd0b85a97d-3a526dcdee2mr12375938f8f.11.1749415888918;
        Sun, 08 Jun 2025 13:51:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ab845sm7813959f8f.24.2025.06.08.13.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 13:51:28 -0700 (PDT)
Date: Sun, 8 Jun 2025 21:51:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mateusz Guzik
 <mjguzik@gmail.com>, torvalds@linux-foundation.org, mingo@redhat.com,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250608215127.3b41ac1d@pumpkin>
In-Reply-To: <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
References: <20250605164733.737543-1-mjguzik@gmail.com>
	<20250605190054.GH30486@noisy.programming.kicks-ass.net>
	<CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Jun 2025 09:27:07 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> >
> > On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote: =20
> > > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), whi=
ch
> > > comes with a significant penalty on CPUs without the respective fast
> > > short ops bits (FSRM/FSRS). =20
> >
> > I don't suppose there's a magic compiler toggle to make it emit prefix
> > padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
> > right?
> >
> > Something like:
> >
> >    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
> >
> > because if we can get the compilers to do this; then I can get objtool
> > to collect all these locations and then we can runtime patch them to be:
> >
> >    call rep_movs_alternative / rep_stos_alternative
> >
> > or whatever other crap we want really. =20
>=20
> BTW: You can achieve the same effect by using -mstringop-strategy=3Dlibca=
ll
>=20
> Please consider the following testcase:
>=20
> --cut here--
> struct a { int r[40]; };
> struct a foo (struct a b) { return b; }
> --cut here--
>=20
> By default, the compiler emits SSE copy (-O2):
>=20
> foo:
> .LFB0:
>        .cfi_startproc
>        movdqu  8(%rsp), %xmm0
>        movq    %rdi, %rax
>        movups  %xmm0, (%rdi)
>        movdqu  24(%rsp), %xmm0
>        movups  %xmm0, 16(%rdi)
>        ...
>        movdqu  152(%rsp), %xmm0
>        movups  %xmm0, 144(%rdi)
>        ret
>=20
> but kernel doesn't enable SSE, so the compiler falls back to (-O2 -mno-ss=
e):
>=20
> foo:
>        movq    8(%rsp), %rdx
>        movq    %rdi, %rax
>        leaq    8(%rdi), %rdi
>        leaq    8(%rsp), %rsi
>        movq    %rax, %rcx
>        movq    %rdx, -8(%rdi)
>        movq    160(%rsp), %rdx
>        movq    %rdx, 144(%rdi)
>        andq    $-8, %rdi
>        subq    %rdi, %rcx
>        subq    %rcx, %rsi
>        addl    $160, %ecx
>        shrl    $3, %ecx
>        rep movsq
>        ret
>=20
> Please note the code that aligns pointers before "rep movsq".

Do you ever want it?
=46rom what I remember of benchmarking 'rep movsb' even on Ivy bridge the
alignment makes almost no difference to throughput.
I don't have any old zen cpu though.
On zen5 pretty much the only thing that matters is cache-line aligning
the destination buffer - but there are some strange oddities.

I need to revisit my 'rep mosvb' benchmarks though.
If you make %cx depend on the initial timestamp (cx =3D cx + (timestamp & z=
ero))
will do it, and then make the final timestamp depend on a result of the copy
(easiest if using the performance counters) you should get a pretty true
value for the setup cost (pretty impossibly if you try to synchronise with
lfence or mfence).

	David
