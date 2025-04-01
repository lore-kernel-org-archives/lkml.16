Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E021E5B64
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535605; cv=none; b=llq+sEL+gTfziUWF5yqo4FOCNVJ4euldUJhsi1UqTPdlSsQPH3aNhEM/5UABjW4w2orPZ754G7+rB8HgzdIMEMLzkAaWzoCnV/EJCsoZfzoTHL2IisVx6cRqk3PpYqYWmn0A9qGU1X08SXUKl+RESDY9ovFxim25tlfsYJgXN/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535605; c=relaxed/simple;
	bh=pg/TU3p1iqdYnPxroSIl3/N84pCo3mv2KonHcsOoMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSCErVw2StImG37iIeAQVd58MZJbxV3dLEeP7EnqGHpIeqSGc4W/uuDks3M4Mf+il0y+OX/crgatFp/x4Za3NrZS6YFd7op5T9GHi423T9TrwC/HuioALpdESxt5QZgh7tYOQFzDpiPAL0IkLy4e7uPZtfjkkHGbp4azVpiGWuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgpjyLZZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgpjyLZZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so42933375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535602; x=1744140402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1rC5OG+5aPoR2eSpZ8hoAiLt43p5LQ+XcvM2mOF6lg=;
        b=VgpjyLZZfEyCff2FabuE5Q8o+rLSFiqtBtmMJbdxVJge/FtjcNyI1Vw6XGI5pGZy1k
         gOJbUfxjtyttzh9d8+/+/SKSRDU7052H1ZNvh61Ep9jxAaYl+Px36qaFwf2QenBQ8ZbE
         st0J25jsTekpTphIyjFp7nQlhGiHEllwVF2/skEr4vXBsSUTw60pw6gEwpD76y+8x/nc
         QPSuf+EvCNkORIoh7D58Oq7YV4fRHRFFwJiMAITaR5kaVhHnDtcMF3+mw5Zqq3W04zyl
         6vFqibECsaSEh+1DBi/dsNoQJGzTiUbDhGwq3ChM1t9D5duZDLV79YuekUCYxucPqmKq
         eBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535602; x=1744140402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1rC5OG+5aPoR2eSpZ8hoAiLt43p5LQ+XcvM2mOF6lg=;
        b=vQxR3JKFUd2ejEGmr1/yANMjIY+CoIeX1ShImeSoQWqrDFLdjK4MnKS5Z5sD/4+OlF
         bkl+5mcgSb6iz38Qy3wH9DA88wtb3CNJeeAuLI10L8JXf2A2PnSC8bPsjZ4+qMlOzASO
         WQ+Gz8TPDG6FH5ZSthKG090buvLyeacoCLZXeTtRu2MjJWcA02MNIenmVf1i0LsDk5Y/
         Hzff9xOU4/OwisoUJRjhXuVXTu1S3mfvfXXeHdSAqACMQMeEkbUYvpR4YxPhyN2m5ge5
         w4TRecyNbTqMGZN6OZO7Zz4ZCdYqmDQ8SJZFeT8Qx3SXT+d637IxfZtcKo42/ttAZ92Y
         98Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXOIU1EPRNyMw5hgvuktMxPwoJCp6s7BL7dOMl+QdlwrGFThmLqpK8qAj5njkNb0vVRXj7RZwSSQI+6/Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbA6TN/nKEed8bTUJd251zd+PZjlUSTDk0zTY3YM6xhsOhf2FM
	ChbxYGaWwC/iLQwAtmapJnt0fsWC/iht+YLrA70Lms9dBkRUNxCCq0Nndg==
X-Gm-Gg: ASbGncvCKxPBbroP6bppYCWdMfuWg+PNB7Jbyh0MkzTuXUu8abpMyDue5w2mVZ5vKA5
	hG9XTZtQE8kizA41UPmojqkinbQw/rBa+hrpPKaqkz/z32pFvAKbNyUKTM+bjpWmaJEzLL04yTm
	Gg6SYJ/EJIg/K5qEYXrkG1w4DIVFsMjSUB138wxM+4HECCE1qXdNeYATP8HWKPBNs4Rv+zy3FNZ
	perK9XGLcVAjvBOmDnji6Kgyb2HYDm9t9wwZfnKVN9ZsWCQNsMqNyJ7hu2xy5PiQFSoaFPOfxsb
	v1VH8y79j57GN9z7hOwSMnC6e4CRTu85NQ3OW69j0/oUBwclU9wL3G1k8M3FGXc+XUz+1EvFGZL
	1G3RjT/nRNmtkjzAuNA==
X-Google-Smtp-Source: AGHT+IEHEzKvjA9x1OacJ+ZFBBuYKvCqhr9tpVMG7mJgZvWlT8WCw3lMTgAW5DPU5tlSeR7TAsl8Zw==
X-Received: by 2002:a05:6000:2101:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-39c1257dc6amr9109840f8f.56.1743535602191;
        Tue, 01 Apr 2025 12:26:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm163676205e9.19.2025.04.01.12.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:26:41 -0700 (PDT)
Date: Tue, 1 Apr 2025 20:26:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <20250401202640.13342a97@pumpkin>
In-Reply-To: <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
	<20250321131813.6a332944@pumpkin>
	<epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
	<20250331195357.012c221f@pumpkin>
	<mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Apr 2025 09:25:17 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> Hello David,
>=20
> On Mon, Mar 31, 2025 at 07:53:57PM +0100, David Laight wrote:
> > On Mon, 31 Mar 2025 18:14:29 +0200
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote: =20
> > > On Fri, Mar 21, 2025 at 01:18:13PM +0000, David Laight wrote: =20
> > > > On Wed, 19 Mar 2025 18:14:25 +0100
> > > > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
> > > >    =20
> > > > > This is needed (at least) in the pwm-stm32 driver. Currently the
> > > > > pwm-stm32 driver implements this function itself. This private
> > > > > implementation can be dropped as a followup of this patch.
> > > > >=20
> > > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.co=
m>
> > > > > ---
> > > > >  include/linux/math64.h |  1 +
> > > > >  lib/math/div64.c       | 15 +++++++++++++++
> > > > >  2 files changed, 16 insertions(+)
> > > > >=20
> > > > > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > > > > index 6aaccc1626ab..0c545b3ddaa5 100644
> > > > > --- a/include/linux/math64.h
> > > > > +++ b/include/linux/math64.h
> > > > > @@ -283,6 +283,7 @@ static inline u64 mul_u64_u32_div(u64 a, u32 =
mul, u32 divisor)
> > > > >  #endif /* mul_u64_u32_div */
> > > > > =20
> > > > >  u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> > > > > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 mul, u64 div);
> > > > > =20
> > > > >  /**
> > > > >   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor=
 rounded up
> > > > > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > > > > index 5faa29208bdb..66beb669992d 100644
> > > > > --- a/lib/math/div64.c
> > > > > +++ b/lib/math/div64.c
> > > > > @@ -267,3 +267,18 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > > > >  }
> > > > >  EXPORT_SYMBOL(mul_u64_u64_div_u64);
> > > > >  #endif
> > > > > +
> > > > > +#ifndef mul_u64_u64_div_u64_roundup
> > > > > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 b, u64 c)
> > > > > +{
> > > > > +	u64 res =3D mul_u64_u64_div_u64(a, b, c);
> > > > > +	/* Those multiplications might overflow but it doesn't matter */
> > > > > +	u64 rem =3D a * b - c * res;
> > > > > +
> > > > > +	if (rem)
> > > > > +		res +=3D 1;   =20
> > > >=20
> > > > Ugg...
> > > > 	return (((unsigned __int128_t)a * b) + (c - 1)) / c;
> > > > nearly works (on 64bit) but needs a u64 div_128_64()   =20
> > >=20
> > > Both mul_u64_u64_div_u64_roundup() and mul_u64_u64_div_u64() would not
> > > be needed if we had a 128 bit type and a corresponding division on all
> > > supported architectures. =20
> >=20
> > True, but the compiler would be doing a 128 by 128 divide - which isn't
> > needed here.
> >=20
> > But you can rework the code to add in the offset between the multiply
> > and divide - just needs a 'tweak' to mul_u64_u64_div_u64(). =20
>=20
> Yes, that would be a possibility, but I'm not convinced this gives an
> advantage. Yes it simplifies mul_u64_u64_div_u64_roundup() a bit, in
> return to making mul_u64_u64_div_u64() a bit more complicated (which is
> quite complicated already).

Adding in a 64bit offset isn't that much extra.
On most cpu it is an 'add' 'adc' pair.
Clearly it could be optimised away if a constant zero, but that will
be noise except for the x86-64 asm version.
Even there the extra 2 clocks might not be noticeable, but a separate
version for 'constant zero' wouldn't be that bad.

Looking at the C version, I wonder if the two ilog2() calls are needed.
They may not be cheap, and are the same as checking 'n_hi =3D=3D 0'.

	David

>=20
> With this patch applied and drivers/pwm/pwm-stm32.c making use of it we
> have:
>=20
> linux$ git grep '\<mul_u64_u64_div_u64\>' | wc -l
> 56
> linux$ git grep '\<mul_u64_u64_div_u64_roundup\>' | wc -l
> 7
>=20
> where 13 of the former and 4 of the latter are matches of the respective
> implementation or in comments and tests, so ~14 times more users of the
> downrounding variant and I don't want to penalize these.
>=20
> Best regards
> Uwe

