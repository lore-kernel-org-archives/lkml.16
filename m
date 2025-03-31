Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C68635B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447242; cv=none; b=g2AKiRj0CsBJ8r22kIZHWFXaJthGEdaYgqqVn7/rne8XDhHoCRmr8izDncR2fJJKAyPLQq5XeczYAkMc4N7VjZgTw1FbFB+oklr0T3L3K4WuhIqiDor4/NFDhmpggfRlSNS0YqTTgL75n/lbda72CGURG2bWggB0l/D7wW+Mo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447242; c=relaxed/simple;
	bh=9XrCqFG/OQ6w7ZCvPR2aXG4ctyiDZ7mLerQnyNH5PCE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTPdAn9hf29dbJocgysjIIJxo4jPZpGKtqc8zr0h7et4Ht0Kj9bB+2m0C/ZXt/eZf3W8YgBIg1xfI04YIydAXIOd3nyAqJ0oWci6V2t0Ntl2gip2zXMnBXzLNSy65dnPUrELMWFydHR8AQGipb8xIGfjiMBEAHjApxteZ2TBQUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mI2WLsl3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mI2WLsl3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1960470f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743447239; x=1744052039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzau0EB90SB5v5DeDMDDJfNaHc19EnbI3C/n+IS/48g=;
        b=mI2WLsl3UfAdA+FtsB7BiePMg/fcrbhUXBb2cNfHiFrtnmSiTbddMqc69GwilZ/hHP
         LUocRhA/s36uYUYLw5nWhD88g8TozHGWHThAsltnAUc/bmQF5XNmwblR2g+QYNHLLNeD
         XR52SrBd9rzYulj57mnd6DFc9s4wGjCz4BiaYR1/bnxD+5LRPUAj/Z/zPpyRbjWd1Ab4
         OGCg39mTs4Sp9I4LlXNSmE1kYjnvVM1xrDQ0UpA2W6x3TZ6+ofytd0kZljjwi9P186AZ
         yrM4KulA9Ds9Mt4U2S186+zFNx/4xKPkwJwgY5JVxqmKu/V6hcGEcwH8pSm/jmol2Sp1
         VPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447239; x=1744052039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzau0EB90SB5v5DeDMDDJfNaHc19EnbI3C/n+IS/48g=;
        b=copa2OBCOHrgPV8Pyn8Y8TGk/qMtuQSgvUDULQjjRDVCYo3pOCearQPYka/HclELvq
         NbHuNp7ruw2lL05NKjBpQT8I705Ufk4ZUtf5xeyL/KpTT2Z8XCxsrFaCgMWg7DE78A4L
         riIRLEZcNnzBoRtGeKe8587ODkloKWkdVfe+Hro1HaXDqsVntyLoV66Mw69eimZWj41K
         EvTHzjhldxoZylcg6rQZkkjyFgmb1zpfDgoVVxgRAVPFyxIEbkhl7IkR9Cp97QaNv1aJ
         kfr5B+qcp09OvPP2YnIahsQKwz/LoV2dfz/deDwlTByzivBoGeF2FzH72vB670kp4eAN
         a6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVRZtkpnltVTD5WspKCYgpXKA1H3K0o00V5+IlePcbYFMcin9ffM1xr/qVsAAMW2M33DdudkqbgYwT/EVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5n/aONmEPFRrSP6r+KGW1vI98rBAyOM2aVfcC82Kr44Dvdbh
	QpBKLCvLXaP5lTM9rG76aOVMfkd5gGUu192Co0hkdoNg5vHUtDHHFI0oug==
X-Gm-Gg: ASbGncvfV4ndwEsRZciV4kRHckrw/kr72gVKKBIZ2Sar6dfUYGkNN4d6NFI/S4sV0/F
	8BOjJ7oKpKhVVh8sVTj5HomtL+8rEE4PISOm8fOk9QDDH1oSKFw/XU5qbmQUW6f3rsLO0BjMiRx
	KXXEAnE05ZWrOye9nSVO5N1dQC/ngER6+AxBJCwb95M5sjvFfog2rJr5AyN0ZUumTYMMTYSx/M3
	aF0Fq73ckwBNDEVQSk04bFz3WLzDXWH3yWqTKHtfo3CEYYRaNNEGEY2eTj2BnSMuKr7cB9Bdres
	oD0rtPGT7PTN53KxAFxn6Qzb+7EM1dvlei84dOhAK+Kje4O3QUN80M/o2r2m7OEhsxKaOJ4cKsM
	WrqsfIfA=
X-Google-Smtp-Source: AGHT+IGUqdpJC0qOY78KYGfbu1Yrau4x6/oOo8N502Qo6AGqknBPQLuLDiwWOCcbNHuDgQXkIiJ/IQ==
X-Received: by 2002:a5d:64ec:0:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39c2366a836mr99546f8f.39.1743447238743;
        Mon, 31 Mar 2025 11:53:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e141sm12022985f8f.77.2025.03.31.11.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 11:53:58 -0700 (PDT)
Date: Mon, 31 Mar 2025 19:53:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <20250331195357.012c221f@pumpkin>
In-Reply-To: <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
	<20250321131813.6a332944@pumpkin>
	<epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Mar 2025 18:14:29 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> Hello,
>=20
> On Fri, Mar 21, 2025 at 01:18:13PM +0000, David Laight wrote:
> > On Wed, 19 Mar 2025 18:14:25 +0100
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
> >  =20
> > > This is needed (at least) in the pwm-stm32 driver. Currently the
> > > pwm-stm32 driver implements this function itself. This private
> > > implementation can be dropped as a followup of this patch.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > > ---
> > >  include/linux/math64.h |  1 +
> > >  lib/math/div64.c       | 15 +++++++++++++++
> > >  2 files changed, 16 insertions(+)
> > >=20
> > > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > > index 6aaccc1626ab..0c545b3ddaa5 100644
> > > --- a/include/linux/math64.h
> > > +++ b/include/linux/math64.h
> > > @@ -283,6 +283,7 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul,=
 u32 divisor)
> > >  #endif /* mul_u64_u32_div */
> > > =20
> > >  u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> > > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 mul, u64 div);
> > > =20
> > >  /**
> > >   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rou=
nded up
> > > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > > index 5faa29208bdb..66beb669992d 100644
> > > --- a/lib/math/div64.c
> > > +++ b/lib/math/div64.c
> > > @@ -267,3 +267,18 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > >  }
> > >  EXPORT_SYMBOL(mul_u64_u64_div_u64);
> > >  #endif
> > > +
> > > +#ifndef mul_u64_u64_div_u64_roundup
> > > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 b, u64 c)
> > > +{
> > > +	u64 res =3D mul_u64_u64_div_u64(a, b, c);
> > > +	/* Those multiplications might overflow but it doesn't matter */
> > > +	u64 rem =3D a * b - c * res;
> > > +
> > > +	if (rem)
> > > +		res +=3D 1; =20
> >=20
> > Ugg...
> > 	return (((unsigned __int128_t)a * b) + (c - 1)) / c;
> > nearly works (on 64bit) but needs a u64 div_128_64() =20
>=20
> Both mul_u64_u64_div_u64_roundup() and mul_u64_u64_div_u64() would not
> be needed if we had a 128 bit type and a corresponding division on all
> supported architectures.

True, but the compiler would be doing a 128 by 128 divide - which isn't
needed here.

But you can rework the code to add in the offset between the multiply
and divide - just needs a 'tweak' to mul_u64_u64_div_u64().

	David

>=20
> So given we're not in that situation, I wonder if Andrew is still
> considering this patch or if someone else would pick up this patch?
>=20
> Best regards
> Uwe

