Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DDE275100
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655959; cv=none; b=YwMOQoVIcRa14ggVT7PxEreXwkH69fG2YDJfA27RR2PStgyvPH1cpl4I5jC8ven13+BaXK3IJ47ZuqW6FuUAY7iwVIzUwW0fmRuyOuE2NUH70MIAQ9u2kkfoyVtI2F7gmQS/m2oCiPrsaUIn9MjuKvLi3cCTOKm6wlSQNnSHJwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655959; c=relaxed/simple;
	bh=bRYT56zZYzOp1Rpbd9TXTIgvn4vDki1smv7D/jgYAvA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcHId0VMDq0AYdDFqq+DOOD5Af4CaYOx/wrQqLrKiEwfIIY2RTEqn5/HYTRy8xJ41Af0c8QmqXq6v83+AbLkJJWD/1dFia+ZAusFtNo2SAfQ9IAQIppl1uSYXncpOPiKSLJtnS3KtP5tjKt/t60SnkDb5/GOpTapPULatMKUjsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeN1K0UP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeN1K0UP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edb40f357so34755425e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747655954; x=1748260754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXfYmfi/WEOaiByaLbf7dQVSkjtApOY77X2HAhpEEm4=;
        b=aeN1K0UPv0FSNbfUsmNLPf/rVdpoyxaTTcqvT99/hRjm2h3pwo7GP6OJY2Gwymp1mg
         3k9QQHjh0d17CMbXfYuX6lm5FfYo+pcbOXuewH/6Ies8AClZoQ6aqDO7X5Fy+78+bJRP
         ZlUVOtEh0pIGyGh1EPTI5JxPvmi8FZ0+j5p+0kxvQ/9oJYLbQ8tFpFqiw01pTfW/o2iK
         n9zt2Pp2f58/1YTt/XaHMMgu4O94yF6OUaQxEeiaLmj9PY2FRrYyoACePBFh5x12/CRO
         i/jF0AdDeKvSGDbrSdwLQTVUtLbFpAo1MU5M65PxCLa5Qunt/46gcLEs2x7kRz3bHoCv
         qdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747655954; x=1748260754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXfYmfi/WEOaiByaLbf7dQVSkjtApOY77X2HAhpEEm4=;
        b=ZffAQK2AiW47OjpOLralOCiw1Kqe6PSQXs1bjJvTVTYBrU4nrZ2joLZB+Q+8E/y3IW
         pyxXU4gMC25yBFWCWvl0BSopnqOmfk4DhiUY8ypBSO8gsEbE7tDtqOCiBVsFLywEIm0F
         bOGnLDIUggSsb9hpKtgmn5oii3/IrpVJh2tQxcdRoxYlnMpB6/CgVugBn6T9TYXAOZrf
         1hKJV9stohSn3BtCEyrWvlLD0eaY0B0z9+cqvEgUzSrUdttY8ky1wGQBbgQRvtcKuwq2
         g4R2AMUuKDHoZgxPU+ukKhauPfVu0VToouxKFE+YCp398UFrIWLoMgqqQlkPH9KELLZl
         34Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWJL5Sf50RI43QvSwyWJrQlNt0fkn6TdQRsDlgRQ3Z2Ua7IzrfAMn1GwrhVTM6UYMLm8On2Rt5V6S58LMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbW8u1d/TUkq39HFG94usVWTQ6EL+DD+z5Oi2hbr7vc3nq/v5R
	LoAWBmSa6mkbyKShNybxRWyb4/O9KKoqc0b3A+9ymXk/9XLceSnJ8FeOpaUGqw==
X-Gm-Gg: ASbGnctvz5CtOumgDXfObXVWSqWJvyjDxCnOTLP+J2mIWTqKKg4DurgUvmlJWK33zaW
	VVusFKtRD0mVbBks3J3PI0971FNdhk6y1KWCXapQaRK0FTcxTUsd0Dgc2KIUsudx5g5ynOoTdCa
	tBKKLOGZ5Sb/rKzKISh3pzXW27MZOSkVxiEUG14NPCnHzgOMNtdnnmXGu05hOZCGxZ+Gt2638M4
	LkyYkQKSN32j672anbMdNjF1xgrW5UApnLoeEcBrC7uTjqk0q9RM+hnPvr3OGsiBb3CBrRwAcgb
	7/I6cU8GabQkq1SLhBGDah6z1lHMYCghsD5nOii0O9J1WApKuRPREyqtmCITk4D3p+q47tp/Ahk
	xDF9dXZVK0VHTEg==
X-Google-Smtp-Source: AGHT+IEcpr3H7CGxkWDsHr0Qqt5zQJxjkeyJhkvtXgOyOQNf7AFIujxUxbXHGqh62iVN/nkYkdUKzg==
X-Received: by 2002:a05:6000:1883:b0:3a3:5c05:d98b with SMTP id ffacd0b85a97d-3a35c8220bemr9002085f8f.5.1747655954166;
        Mon, 19 May 2025 04:59:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6254bsm12818568f8f.52.2025.05.19.04.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:59:13 -0700 (PDT)
Date: Mon, 19 May 2025 12:59:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
Message-ID: <20250519125912.79e09cb2@pumpkin>
In-Reply-To: <uc3g3fgwirwczxjbh5qxgz3pzqmlmiymdeh7m2dzznx2fap4vc@6hvvrgpbyg5q>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
	<20250518133848.5811-3-david.laight.linux@gmail.com>
	<uc3g3fgwirwczxjbh5qxgz3pzqmlmiymdeh7m2dzznx2fap4vc@6hvvrgpbyg5q>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 May 2025 08:10:50 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> On Sun, May 18, 2025 at 02:38:46PM +0100, David Laight wrote:
> > Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
> > behaviour' the compiler generated for a compile-time 1/0 is in any
> > way useful.
> >=20
> > It may be better to define the function to return ~(u64)0 for
> > divide by zero.
> >=20
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >=20
> > A new change for v2 of the patchset.
> > Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
> > continue and generate 'random' results for any 'undefined bahaviour'.
> >=20
> >  lib/math/div64.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index a5c966a36836..c426fa0660bc 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -186,6 +186,9 @@ EXPORT_SYMBOL(iter_div_u64_rem);
> >  #ifndef mul_u64_u64_div_u64
> >  u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> >  {
> > +	/* Trigger exception if divisor is zero */
> > +	BUG_ON(!d);
> > + =20
>=20
> I'm unsure if I should like the BUG_ON better than return 1/0. My gut
> feeling is that mul_u64_u64_div_u64() should behave in the same way as
> e.g. div64_u64 (which is just `return dividend / divisor;` for 64bit
> archs and thus triggers the same exception as `return 1/0;`.

You need to execute a run-time 1/0 not a compile-time one.
clang is likely to decide it is 'undefined behaviour' and just not
generate any code at all - including removing the 'if (!d)' condition.

For x86 gcc does (sometimes at least) generate 'if (!d) asm("ud2")'
but BUG_ON() adds a table entry for the fault site.

> If BUG_ON should be it, I'd prefer
>=20
> 	BUG_ON(unlikely(d =3D=3D 0));
>=20
> which keeps the unlikely() that is already in the check removed below
> and is more explicit that checking for !d.

IIRC there is an 'unlikely' inside BUG_ON() - so the call site doesn't
need one.

	David

> >  	if (ilog2(a) + ilog2(b) <=3D 62)
> >  		return div64_u64(a * b, d);
> > =20
> > @@ -212,13 +215,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> > =20
> >  #endif
> > =20
> > -	/* make sure d is not zero, trigger exception otherwise */
> > -#pragma GCC diagnostic push
> > -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> > -	if (unlikely(d =3D=3D 0))
> > -		return 1/0;
> > -#pragma GCC diagnostic pop
> > -
> >  	int shift =3D __builtin_ctzll(d);
> > =20
> >  	/* try reducing the fraction in case the dividend becomes <=3D 64 bit=
s */ =20
>=20
> Best regards
> Uwe

