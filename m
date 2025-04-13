Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67915350B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744568419; cv=none; b=HH9XMaDR5UayWRZXAjNDd8pUym4RQqsqvGREMX3zJTA1kZ5dNe7O3MDZLrcSGeJGI3e0BClt2/V1nA219qtdqbyqxIm0OsXVr62MOU3wVoEbrBq0Q9Mh2xlg6ZG7iH6Izs20lYCCMZuXUWDWrULKFBbD4Hv15YA/W/sZPB3tteU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744568419; c=relaxed/simple;
	bh=xiJ61fCg/aZD/PagRJs0Ufd+RmjDHT06V5Dj6WoXdfA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fXxykbSTUsAsKDVBpWqMQMRGTBpB8HTa6yAUE6wa6dMn3Q0/TaasJCP2tC4+pcYaAcpiCRH5zoIJAo3R89+k0q15Q24hbk1rU7q155qYwoSquQmg0hnA3JI2SbQrbJCEgZKY6HIwRTAssHZzhobk5+JWJudZT2PTXP8icTnKYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOp+YZnN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOp+YZnN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so39936855e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744568414; x=1745173214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I968Y00v+Pv88CqZXLOugidZjBHNZA1vqpBxecrL3MY=;
        b=HOp+YZnNdoTAeoxbA0nF1ZY5pVo33X1wRpmv32NkDUhwfdSdYrsmFlvPIl12VN5JF2
         IxM/iegQxkfFvOJNnibBml8aybIZ/bUxxqpQcSmHWRkwqU87P059h2cahUChf2gQ+J40
         BTmgR4hSCJ8bY7dnIGMQRWUs3ajrSHE1mORzhq+pbeeIsst+xwKjxxClg4Ne5TIUEJHN
         5J6YAVNwgjIXRouoVun3c0DeeRBRu7oy2TL1spvSgSjdoXtCTPv27Y0ycMcY0O4GZ0EI
         cI0yVuC22d3bY5GcdqNbOMPaJIXwgf/KBntKwyqiFLHk5y136AJFTAudKdtweipeQCVE
         ez8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744568414; x=1745173214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I968Y00v+Pv88CqZXLOugidZjBHNZA1vqpBxecrL3MY=;
        b=k8EvcirUsFsVs18vZySGzF6kc4GYsL0Wlfo7FVgkEIe11cRwe8iNsyHczlB+52CQnO
         bO5YX/vLnF2cEbIuJacuFlBxEGEjgVGGE1GjQ52E3XSTk1uO52eLRVtNHyr3n5nYrtyN
         ANCYWrg/ZHwOJkORZLALLLeQMalqS+nOpCwTD9GTAFMup3LWYMtyb0Kd6rC5h7ZHEkAI
         KsKZKRbCuDNmUGH5zUkxSgI8/zzsLgjoFq8PYp2l9C/ATz8RW2NL6xzrBFeIcqNpAoWV
         1HSiKSHfjxpCcXb+k/GoJehyewNXc0I/drqUHJo4GKbs5+ffEDH1FmNz6+BQy7y5DkNO
         aehw==
X-Forwarded-Encrypted: i=1; AJvYcCWMcgd7EMP5HRtax3CZ99LLoumMrZ4tTF2s6OGcUgrwtfdCyKr7hPZzQDFv0s8VPVK02u86/2B7YSngKHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvp0GTtC4M8/D0BBae2brRvihbM3biA1XC410arj7YoV1p1SD
	cHg696IKS3UFaA0/zrni6BdMaiuGyZXgaAqUyzsnZEU6P7eXtqCY
X-Gm-Gg: ASbGncv+8tTBquA9Yvw0fTFrgUZpgarOBvuU6T0a1OMdMwoY245O5P9wIshnBabKjUB
	CM7tI186f01/yh0k85W1kQi0qmpeYdrV67sIa0IPQqOEPZBM+gDXua9DLaaKlNKvvK4cFDgs02Y
	nJR7LPCvfNrjvXT55BvUO9hPtiCriZQ0fkXDSX980K/892Zhwn0J8arrdxQ4/ieBthQpQBkK2dj
	1r6Y+zbbw4VihZrjbbcbLpJEQtJ6uRsmub255StZDobPQL1F/uxuIrzkdveF36yRU/9qsWZ2cfk
	86hCfjEEgrhKlXvVJPghJ8A5a0tPyv/E+TbEU9yWSrRNaedlbEEgp06jGuA4SLM1by2wOV8EtIr
	9MVQ=
X-Google-Smtp-Source: AGHT+IEWz6pte51MIpBXsWv9iox7I4wYNAzE9JPDgQyelfI9wQosQkbyTXzMObDkrp+gzk3riTf7OA==
X-Received: by 2002:a05:600c:8411:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43f3a95b61dmr95910925e9.15.1744568413613;
        Sun, 13 Apr 2025 11:20:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44579bsm8469296f8f.87.2025.04.13.11.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 11:20:13 -0700 (PDT)
Date: Sun, 13 Apr 2025 19:20:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, mingo@redhat.com,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250413192011.3e083d33@pumpkin>
In-Reply-To: <CAGudoHFvPqE=Sby-ttn1ar8b+abj15X2jX3FvgY3ca_TRqoc-Q@mail.gmail.com>
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
	<CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com>
	<CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
	<CAGudoHFvPqE=Sby-ttn1ar8b+abj15X2jX3FvgY3ca_TRqoc-Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Apr 2025 12:27:08 +0200
Mateusz Guzik <mjguzik@gmail.com> wrote:

> On Wed, Apr 2, 2025 at 6:27=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> =
wrote:
> >
> > On Wed, Apr 2, 2025 at 6:22=E2=80=AFPM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote: =20
> > >
> > > On Wed, 2 Apr 2025 at 06:42, Mateusz Guzik <mjguzik@gmail.com> wrote:=
 =20
> > > >
> > > >
> > > > +ifdef CONFIG_CC_IS_GCC
> > > > +#
> > > > +# Inline memcpy and memset handling policy for gcc.
> > > > +#
> > > > +# For ops of sizes known at compilation time it quickly resorts to=
 issuing rep
> > > > +# movsq and stosq. On most uarchs rep-prefixed ops have a signific=
ant startup
> > > > +# latency and it is faster to issue regular stores (even if in loo=
ps) to handle
> > > > +# small buffers.
> > > > +#
> > > > +# This of course comes at an expense in terms of i-cache footprint=
. bloat-o-meter
> > > > +# reported 0.23% increase for enabling these.
> > > > +#
> > > > +# We inline up to 256 bytes, which in the best case issues few mov=
s, in the
> > > > +# worst case creates a 4 * 8 store loop.
> > > > +#
> > > > +# The upper limit was chosen semi-arbitrarily -- uarchs wildly dif=
fer between a
> > > > +# threshold past which a rep-prefixed op becomes faster, 256 being=
 the lowest
> > > > +# common denominator. Someone(tm) should revisit this from time to=
 time.
> > > > +#
> > > > +KBUILD_CFLAGS +=3D -mmemcpy-strategy=3Dunrolled_loop:256:noalign,l=
ibcall:-1:noalign
> > > > +KBUILD_CFLAGS +=3D -mmemset-strategy=3Dunrolled_loop:256:noalign,l=
ibcall:-1:noalign
> > > > +endif =20
> > >
> > > Please make this a gcc bug-report instead - I really don't want to
> > > have random compiler-specific tuning options in the kernel.
> > >
> > > Because that whole memcpy-strategy thing is something that gets tuned
> > > by a lot of other compiler options (ie -march and different versions).
> > > =20
> >
> > Ok. =20
>=20
> So I reported this upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119596
>=20
> And found some other problems in the meantime:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119703
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119704
>=20
> Looks like this particular bit was persisting for quite some time now.
>=20
> I also confirmed there is a benefit on AMD CPUs.

Is that a benefit of doing 'rep movsb' or a benefit of not doing it?

It also depends very much of the actual cpu.
I think zen5 are faster (at running 'rep movsb') than earlier ones.
But someone needs to run the same test on a range of cpu.

I've found a 'cunning plan' to actually measure instruction clock times.
While 'mfence' will wait for all the instructions to complete, it is
horribly expensive.
The trick is to use data dependencies and the 'pmc' cycle counter.
So something like:
volatile int always_zero;
...
	int zero =3D always_zero;
	start =3D rdpmc(reg_no);
	updated =3D do_rep_movsb(dst, src, count + (start & zero));
	end =3D rdpmc(reg_no + (updated & zero);
	elapsed =3D end - start;
So the cpu has to execute the rdpmc() either side of the code
being tested.
For 'rep_movsb' it might be reasonable to use the updated address (or count=
),
but you could read back the last memory location to get a true execution ti=
me.

I've not tried to time memcpy() loops that way, but of arithmetic you
can measure the data dependency of the clock could for divide.

	David


