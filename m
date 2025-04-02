Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8622376F7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598344; cv=none; b=dgxYJuFzo3ygnHpaOZGmX8Ya784rwaoOjKB36YFWVNW2+JDRIdziX5BMlHyICE/SEKGHrH9aJeAgmZZClotOg+O04l3acbI1FNYEcIQ/mwx3+RXpuEQTmACAQPYKhBWIbiJJFeDrsNeU+Fkxy9Bzv3LE2NCZvaS98QDkAyQsnJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598344; c=relaxed/simple;
	bh=89doMQQqTUXXMsk02oDFiQQEN9CjVR0H9vwo89xlW4A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYO0MFybO5X1Zjc41PEX6lKmTEKmJLPP6dbYxEsHrGORMSVpflXMZPswlLloUGRiEI5SKYosk20adwNMRKc3yb4AuA3SMWR8pqJeZPvULRZ2OpHI3n1Mn8/Pr1vus7NZAhkwvLoiZgJjy2AAsokA2Yk8M/o0aQcS9M4ipa5LuEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaVyva+f; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaVyva+f"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1731743f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598341; x=1744203141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nef0ixQU1wmsLTpO1b+Z0WKnVoF/EZ475EXUb+E8QY=;
        b=XaVyva+fL4KTso/SDJp2RWax/RAjfElApgfjl6BhSuh5/z1NEVaV36HyIGMbNhq/Uz
         i54RtNh5sKJc3j0/AHKjZasVkFkmbakkLlVABUCALXKKcpPAS82ecaNVJeEE6dF58y0f
         FCR5DUVHDXJ2pAtYAkXZhfVjMfRdMdIym0fonCF6czkLWjOKuWpl0coI5+QyFLBEhwRg
         9fSeJTrOGG6gHUUn/F4DSgdhEHoVKlTQjQ+t2bLiTnxWLft6YGDwnWIWDzk8wBaXa+eX
         MaomuvHuONhm1R86/6bbYJth8pD+5mXGicaQFGzJpuN17/7qhljPyhjDTApZmyY9j4t0
         EsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598341; x=1744203141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nef0ixQU1wmsLTpO1b+Z0WKnVoF/EZ475EXUb+E8QY=;
        b=OV//FP+02AxGeKcGKxhev6PEzR5pmpnuNvmfXHfzNojWuy0T3I3Vlwj+DQxgIQqx7s
         bC7wbf94Mf/KK5VemPB0OhHNKr+gjqzbzfVeE0hndgS9L1YKWC5WOdtaV8W49P4Lnmmg
         azqSQxDWF9GOx2UmgLTICaPdScBgfwjKMYRnK4WDVkCWZqz0KsmJdLEIwXbJOXX+LW8I
         JE3KkUiItbjSN/3QpLRjUs0JktM4UQTMIdjygSNwqXUJujKRfBq809jANH9jsxjHWVKI
         QyJM05OqxrPTf9AF72SOX+nnKfBHwuB7gEUAI8D/LoP6BuQ6W+5lwrp15YOo3luz2Psu
         r6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUyVUcMwyTSuNLZpPVsn2GB5mJCYLO7DiumowZ2Fagbh+Pm0MrlAZiyeMZTe17zbsXuY/wk9g3B+goDMag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYe5jOyqtPwKnG67cvkTuj0FTBehHUAfYNMv9NjPFO8TdeaE1t
	wNzcRS4yzMYa7RjjVbB/q6OJRqu6eqlDFBzoXP4cqN1j7jcKEQyY
X-Gm-Gg: ASbGncsVF7m5NEduk4Q1KJ9+i9oItlBRc+WoaoAJ42nqB+a4V6sQrZqMnFPvakWzygf
	VTfyDRMb97yTUFAwM/d0tbbOUGF1GXVbJhvin9rE7PY3Z51H6VSGZu/OnN3kXCO2rk4RmAxxC/Z
	hvJceZ9he/uP/zfxxQIej3GJsvvxeyikRr8FQn4Rcp+WuPdSloQxIkYIQ6zF/VcE99GRWv1ws2M
	IPIh7tsMazKBqQDCU29A7BirCYGubzdimzpLoEunDp3rbNfsRJG3/H39RZwbsBJqiO/2cn+M24A
	5fqkXUPwe5tCjvbDmu20HB0t5gYuImlD8TXu4JOy2IYFf0jGEKYhd3ApKkFZWqN799aZLfh+1UB
	339Y/jPW7m5cJQ9+ZUA==
X-Google-Smtp-Source: AGHT+IFn02P1ukvJ8y/QRJMuhLrjtzdIpEcbiaPHVb4vw4w0ZAKBrYX5UbrSJMPI6LA4r05gYUSbyA==
X-Received: by 2002:a05:6000:1889:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-39c1211beabmr15544458f8f.46.1743598340981;
        Wed, 02 Apr 2025 05:52:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4498sm17307668f8f.99.2025.04.02.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:52:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:52:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <20250402135219.28b24e94@pumpkin>
In-Reply-To: <2wwrj6aid2elnnotzfkazierqmzmzpfywyf33ahqs36xh5xz32@rszeetrztsiz>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
	<20250321131813.6a332944@pumpkin>
	<epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
	<20250331195357.012c221f@pumpkin>
	<mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
	<20250401202640.13342a97@pumpkin>
	<15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
	<46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
	<20250401223731.7102103d@pumpkin>
	<2wwrj6aid2elnnotzfkazierqmzmzpfywyf33ahqs36xh5xz32@rszeetrztsiz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 10:16:19 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> On Tue, Apr 01, 2025 at 10:37:31PM +0100, David Laight wrote:
> > On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
> > Nicolas Pitre <nico@fluxnic.net> wrote:
> >  =20
> > > On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> > >  =20
> > > > On Tue, 1 Apr 2025, David Laight wrote:
> > > >    =20
> > > > > Looking at the C version, I wonder if the two ilog2() calls are n=
eeded.
> > > > > They may not be cheap, and are the same as checking 'n_hi =3D=3D =
0'.   =20
> > > >=20
> > > > Which two calls? I see only one.   =20
> > >=20
> > > Hmmm, sorry. If by ilog2() you mean the clz's then those are cheap. M=
ost=20
> > > CPUs have a dedicated instruction for that. The ctz, though, is more=
=20
> > > expensive (unless it is ARMv7 and above with an RBIT instruction). =20
> >=20
> > The code (6.14-rc6) starts:
> >=20
> > u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > {
> > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > 		return div64_u64(a * b, c);
> >=20
> > Now ilog2() is (probably) much the same as clz - but not all cpu have i=
t.
> > Indeed clz(a) + clz(b) >=3D 64 would be a more obvious test. =20
>=20
> Ack, the more intuitive check might be
>=20
> 	if (fls64(a) + fls64(b) <=3D 64)
>  		return div64_u64(a * b, c);
>=20
> then, but maybe "intuitive" is subjective here?

Depends on whether you grok 'clz' or 'fls' :-)

>=20
> > On 32bit a check for a >> 32 | b >> 32 before the multiply might be san=
e. =20
>=20
> Not 100% sure I'm following. `a >> 32 | b >> 32` is just an indicator
> that a * b fits into an u64 and in that case the above check is the
> better one as this also catches e.g. a =3D (1ULL << 32) and b =3D 42.

That is to optimise the multiple as well as the divide.
It is also a very cheap test.

>=20
> > > > And please explain how it can be the same as checking 'n_hi =3D=3D =
0'.   =20
> > >=20
> > > This question still stands. =20
> >=20
> > 'ni_hi =3D=3D 0' is exactly the condition under which you can do a 64 b=
it divide.
> > Since it is when 'a * b' fits in 64 bits.
> >=20
> > If you assume that most calls need the 128bit product (or why use the f=
unction)
> > then there is little point adding code to optimise for the unusual case=
. =20
>=20
> n_hi won't be zero when the branch
>=20
> 	if (ilog2(a) + ilog2(b) <=3D 62)
> 		return div64_u64(a * b, c);
>=20
> wasn't taken?

Right, but you can remove that test and check n_hi instead.
The multiplies are cheap compared to the divide loop.
(Especially when uint128 exists.)

I also think you can do a much better divide loop (for many cpu).
Shift 'c' so that clz(c) is 32.
Shift 'n_hi/n_lo' so that clz(n_hi) is 1.
Do a 64 by 32 divide and remainder (probably about 32 or 64 clocks).
If bits of 'c' were discarded multiple and subtract (with overflow check).
'Rinse and repeat' with the remainder.
Build the quotient out of all the partial values.

	David

>=20
> Best regards
> Uwe

