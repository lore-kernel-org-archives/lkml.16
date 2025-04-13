Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FA1F30BB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744570700; cv=none; b=n4Ucyjjn19L+GdIFsW0C9l0+CnEEyAdyVkzRAq/5lYz9Lf9uG9aiujrJ0Zcvx8NPFwHwB1MiMgHnmTVtFNtKQ0/hRNtzCp9XOnZTimMZqXFsY+cpOOnnH30f9ZK7JO5EnQN3D9WU9jxAQOo8QZhUAarGn1Wojvyysh3KZCtgEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744570700; c=relaxed/simple;
	bh=J5sz41YjSH7pnZKXch903HESt3zkaVc79lPb9gIm5cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqPTENd13QAdhLgVvb0ASBGcGK7fY4pyjIufHnrENFosvzxyvHd8VSqlpuk357Q4k6bbObwwG1Wg+GcTuaLKTX4eUH6Yxg6uUZqd1jeqdlM6XavXYtyE4VFbejycz6aMj1nk/S/9l2S2ojq9bhWtfUmkeXHppwPeZY1hXNwUXx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFUZTSc8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFUZTSc8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso694459266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744570696; x=1745175496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMOzEUbxURYcvhcIN7s4npIflGfs1vs1f9p5XwExJN0=;
        b=eFUZTSc8pLBjeeeuczpXcIMtbbZo+r03Z3Qh1DTUwMiF7uUBU/GaGtgW+0zTAyuJiW
         tzaWgAjzoAiLuzhUz8j/xxPLMbRS2nMH9zvY0ExSn1OPglxh4sTXao41G3eOd8TfSlyX
         xUAPnQBRxkryulrECG//xet1xGiWuC9Bz8cQaq2nkiseNb4iK1oH/HzWdUsdKv1UAeVt
         beTrob2x1BCDDaDG/XT6zpZlRHasUsSeY6Da7pasWd4lQCefAN6zqlv8sk+mir5xLvIg
         E/ouSz5k9B+3O+yC6ApOapWLPtDA3v/qil0L35QZWB1CT67oZ6Jm+iDlrFji3RkJFxA1
         hIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744570696; x=1745175496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMOzEUbxURYcvhcIN7s4npIflGfs1vs1f9p5XwExJN0=;
        b=fmfqRAdElkFz073WTHb+IYzDBJBSaCmD1v0SU0T6aZqLGscxuPbENZelZ2fnsfTDsC
         38oklR1l4bzXtXKwCga7+fP3suEgI1zqHP0xhEynKlB0Tt9WPxFwZ3NaETo+uL5/t/ZI
         lJOZ1tW5tWazA5W28QvnyOne+V7RDiw2d7f1h23PQtx31DVE+4y22wHoSIOuxkRFpVxi
         qEifAwjKHRZUxUb8DtKmqGXtcWGLLQSaC+rvEEI13fYZjy319o+MupL2x2Sz8Mu2pmNC
         wxnLMpHYLOhs61kiMBZl32NPCWCpQl3O4BsW+7r9Fr+X6xNwWFKcfQjggCIl4dSOyXP4
         EAFg==
X-Forwarded-Encrypted: i=1; AJvYcCWUS5leTL16LPkJ/0nipKlLG5+kkqk7CCl1SjG+VzSG2YjhK7gcJetQyZkHb2uKmb4MXe9llZc6GTB9HNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WxvXHHLV/NcZbm3Xir8C4+LXDAvloFurl1Ha5sGUjPHxI2T7
	zrTxiD+5WOQXRtmjc3iM+LmbsKUjnxEith0OHu0h4KmodZ4IlKSnEOmJr5yDCNbiaWDo4UZMXzF
	KH86zY4BzXT7etUsHxz+Yx9mLjtnlZA==
X-Gm-Gg: ASbGncuC+PqnJo8LP881MuDot/0PRq42gBVwFICnBPj8oJ5mLKfxDswhdyo0ff9jYYQ
	e0cnHcL7o/zW59SMgNVCr7Nj7+A4xA4XRviep/2/UQqMh3bwsrmP1VNNMj+/4OpQlTUaL5Tw/uq
	UFTq3+vwej7NypNzD7FRGB
X-Google-Smtp-Source: AGHT+IEox/J4tgLU3ACFHadtQXIqWTu1fgXqaADj+nKrnzW8gFtrW79ndSFoUXxrJu485mWfFtS/B+5kpO/3dCgEmoA=
X-Received: by 2002:a17:907:7e9a:b0:ac2:9ac:a062 with SMTP id
 a640c23a62f3a-acad34a1c3emr749288566b.23.1744570696027; Sun, 13 Apr 2025
 11:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
 <CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com>
 <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
 <CAGudoHFvPqE=Sby-ttn1ar8b+abj15X2jX3FvgY3ca_TRqoc-Q@mail.gmail.com> <20250413192011.3e083d33@pumpkin>
In-Reply-To: <20250413192011.3e083d33@pumpkin>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sun, 13 Apr 2025 20:58:04 +0200
X-Gm-Features: ATxdqUHjQwc88Hbskk45pLbgKQLuy3qVZ5jDrKwK94eKZzim_lBMoqMSENgnQKw
Message-ID: <CAGudoHEm76QGqit76QAx00Pp=19iXbMCiYJeUsftP41bvZV1Rw@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 8:20=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sun, 13 Apr 2025 12:27:08 +0200
> Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> > On Wed, Apr 2, 2025 at 6:27=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com=
> wrote:
> > >
> > > On Wed, Apr 2, 2025 at 6:22=E2=80=AFPM Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > >
> > > > On Wed, 2 Apr 2025 at 06:42, Mateusz Guzik <mjguzik@gmail.com> wrot=
e:
> > > > >
> > > > >
> > > > > +ifdef CONFIG_CC_IS_GCC
> > > > > +#
> > > > > +# Inline memcpy and memset handling policy for gcc.
> > > > > +#
> > > > > +# For ops of sizes known at compilation time it quickly resorts =
to issuing rep
> > > > > +# movsq and stosq. On most uarchs rep-prefixed ops have a signif=
icant startup
> > > > > +# latency and it is faster to issue regular stores (even if in l=
oops) to handle
> > > > > +# small buffers.
> > > > > +#
> > > > > +# This of course comes at an expense in terms of i-cache footpri=
nt. bloat-o-meter
> > > > > +# reported 0.23% increase for enabling these.
> > > > > +#
> > > > > +# We inline up to 256 bytes, which in the best case issues few m=
ovs, in the
> > > > > +# worst case creates a 4 * 8 store loop.
> > > > > +#
> > > > > +# The upper limit was chosen semi-arbitrarily -- uarchs wildly d=
iffer between a
> > > > > +# threshold past which a rep-prefixed op becomes faster, 256 bei=
ng the lowest
> > > > > +# common denominator. Someone(tm) should revisit this from time =
to time.
> > > > > +#
> > > > > +KBUILD_CFLAGS +=3D -mmemcpy-strategy=3Dunrolled_loop:256:noalign=
,libcall:-1:noalign
> > > > > +KBUILD_CFLAGS +=3D -mmemset-strategy=3Dunrolled_loop:256:noalign=
,libcall:-1:noalign
> > > > > +endif
> > > >
> > > > Please make this a gcc bug-report instead - I really don't want to
> > > > have random compiler-specific tuning options in the kernel.
> > > >
> > > > Because that whole memcpy-strategy thing is something that gets tun=
ed
> > > > by a lot of other compiler options (ie -march and different version=
s).
> > > >
> > >
> > > Ok.
> >
> > So I reported this upstream:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119596
> >
> > And found some other problems in the meantime:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119703
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D119704
> >
> > Looks like this particular bit was persisting for quite some time now.
> >
> > I also confirmed there is a benefit on AMD CPUs.
>
> Is that a benefit of doing 'rep movsb' or a benefit of not doing it?
>

It is a benefit to issue regular stores instead of rep movsq, at least
up to the range I tested.

I make no claim this is the fastest thing out there for any uarch,
merely that regular stores beat what gcc is emitting now.

> It also depends very much of the actual cpu.
> I think zen5 are faster (at running 'rep movsb') than earlier ones.
> But someone needs to run the same test on a range of cpu.
>
> I've found a 'cunning plan' to actually measure instruction clock times.
> While 'mfence' will wait for all the instructions to complete, it is
> horribly expensive.
> The trick is to use data dependencies and the 'pmc' cycle counter.
> So something like:
> volatile int always_zero;
> ...
>         int zero =3D always_zero;
>         start =3D rdpmc(reg_no);
>         updated =3D do_rep_movsb(dst, src, count + (start & zero));
>         end =3D rdpmc(reg_no + (updated & zero);
>         elapsed =3D end - start;
> So the cpu has to execute the rdpmc() either side of the code
> being tested.
> For 'rep_movsb' it might be reasonable to use the updated address (or cou=
nt),
> but you could read back the last memory location to get a true execution =
time.
>
> I've not tried to time memcpy() loops that way, but of arithmetic you
> can measure the data dependency of the clock could for divide.
>

I'm rather wary of ubenches of the sort as they detach the actual op
from its natural environment (if you will).

The good news is that the page fault ubench I added has a specific
memcpy as one of the bottlenecks (in sync_regs()). Improvements one
way or the other for that size can be measured without any
disturbances like the above.

--=20
Mateusz Guzik <mjguzik gmail.com>
