Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205C78F2B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 22:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749940027; cv=none; b=ig+yvIbPt8pdhnfZHHzEhhXTw6ljVi8Th0tPq6X0y5+SE7MgbB4C2NZexpt1gfuGc4ai9ZNjl0PyHMLAin18xBBRfj9cmkRPX5wNpKkVYrhnLZNYlA7ECxfikRZaDpJEuHPNJr0B+vbDoQebLiou+A2YBbjmSuEvB105BE1JcKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749940027; c=relaxed/simple;
	bh=CcuR+6UyJoT5a6mb+hJimAln5QF8P5BuMyRKAHziH+w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YbywOJJ34iL9CIaYJDm+XtToZ32m+a/1uyhUXcJ4EcXNQYvHGzZS4tBCOkgcqFy12jbo5UJuaCCc9bCKmRDaJMvyJaLbg4iDA09iv0jbYzW/igBNRxJg3lR6pRPY86mIgl9skeDeuLK55W1ieWaiJHyKm9uBkaoRzzamfaPx/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GT9F5229; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GT9F5229"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d38cfa9773so349935585a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749940022; x=1750544822; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KocLcSc1rMNb2hBc8x6wSZPrzRSGIpFLmX6sv1uDTJs=;
        b=GT9F5229M5UoXw2fdq+7M4/VDoQGO8nRU0lHm/W502z5K7toKLBp3ISRjVyTqCQpgp
         fYBPYqe85xQUIgg5EEgXTDyj5VZBqGWmyeL8ojAAIJbPao4DkJGCVQxcjhkSY8IY75Im
         Hq8s/L5XN86IVORQZNDYrXHopP3qAmtW7m3zse0QqVKDOwD5w2PPPmopbFJketttEzrG
         TIg85y5FEIMCsbsrjGrDbUpobQ2by8Ei/k1wSV/YcQOQMMV//pncM7pN0POmI0mjvI7A
         tIol500swqxoVmYD8vAHdLp+yAlRnU/OLH+WSiGUeNtc8+992Zn72pq27RZuA4+i5Zoa
         ac1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749940022; x=1750544822;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KocLcSc1rMNb2hBc8x6wSZPrzRSGIpFLmX6sv1uDTJs=;
        b=GCvs2NhfSutXrn+yHpChjwPkCT6eihsDFSPPky3t1CHcNi9/IOPvm+LtTidndlWmZW
         p/J8o71U0gl3d64SLz62InttcBODAzb6LxYmw2fYLF2GjDgfYKmq2GRk8/LkJwU7S4vh
         Mtc/KCew+GOpJnREr3cDNINcFLpnuybcMMaxLEr2HwpQJX2tMK0XjbVtjN3SE6oO7Rf3
         vez3D7GRW9C2JONLlrBRgnYvjefuTasuHChfCsXMqB99N2CQ3eWp4MyVkUPjeQo27lIj
         BM6PgH+tMFdV028NlFzeFXKBgiCXJkMMHTBwBPKaN9yOs2Z+uUjAW3YnmgZ2X2Jv9gQc
         ORdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0MDxjbhH5m1B9lyMEftuwYgzbCKHQQsODKqsG2+kZyaf5hHViDArti2R8nHtWzo8MtL3DutFHQcDbgDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxypWQR+x6b2vA5Gsxf+1g3rdJyvsIOSgdOsAAaej2cNnliMtd9
	gI/Fuc5Fypmz//L77+Zg49ybMAv6MlQsB2kiMOSRtV02I4kCepsQWrTxbYrJlwMldLI=
X-Gm-Gg: ASbGncugulnJw8inQsiLixcD+ob9B7k6MTOKKGKHr0wTsG4aoNM1271Ut6Gjx3qd04u
	GqjhOLOewzLQxI8nHB+OsXKFdASd8mFXqOKhYRR6fxMtiliZNyDGeXtGJrk6Ixuho14JKAa+Guj
	GyMfQF/3IhGkX5u1RmtIS3ntMnjcF/5JjJbG4YSUf6cjbGWj8XvN8m/qCLVA5Zww19ZbsuO3ba/
	MrVKrJy8WBkxW9/rcm2FbZmjSF1VBGSUErQgYym13iN+xTTqOdQby5IqkFwgxtfQNxXYAgUrI/E
	fnd0FXUunfaYG5CXLzClVPva9S4ueQ0KNvrGzb0JOXNdtGAW6HKYL1adDp9VUEUD2kNt3ffYmEL
	0YzdjDW8v4DIkwApe8aI/OizNuQ==
X-Google-Smtp-Source: AGHT+IHjuXGaVlPYaFX9Rd08g3SZxAEuPEWpaOdrpz+egSHoCINHLQy4074qgr9UeRJGjQ0lm8xH0g==
X-Received: by 2002:a05:620a:40cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3c6c0d376mr791545585a.8.1749940021756;
        Sat, 14 Jun 2025 15:27:01 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eacbd8sm341845685a.64.2025.06.14.15.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 15:27:01 -0700 (PDT)
Date: Sat, 14 Jun 2025 18:27:00 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 08/10] lib: mul_u64_u64_div_u64() Separate multiply
 to a helper for clarity
In-Reply-To: <20250614223006.20c16642@pumpkin>
Message-ID: <sqrr599p-3595-3n22-5s4q-2s552snq32pr@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-9-david.laight.linux@gmail.com> <58porr76-92os-7019-nr00-n68r74202pps@onlyvoer.pbz> <20250614223006.20c16642@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> On Sat, 14 Jun 2025 11:37:54 -0400 (EDT)
> Nicolas Pitre <npitre@baylibre.com> wrote:
> 
> > On Sat, 14 Jun 2025, David Laight wrote:
> > 
> > > Move the 64x64 => 128 multiply into a static inline helper function
> > > for code clarity.
> > > No need for the a/b_hi/lo variables, the implicit casts on the function
> > > calls do the work for us.
> > > Should have minimal effect on the generated code.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---
> > > 
> > > new patch for v3.
> > > 
> > >  lib/math/div64.c | 54 +++++++++++++++++++++++++++---------------------
> > >  1 file changed, 30 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > > index 2ac7e25039a1..fb77fd9d999d 100644
> > > --- a/lib/math/div64.c
> > > +++ b/lib/math/div64.c
> > > @@ -193,42 +193,48 @@ static u64 mul_add(u32 a, u32 b, u32 c)
> > >  	return add_u64_u32(mul_u32_u32(a, b), c);
> > >  }
> > >  
> > > -u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > > -{
> > > -	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
> > > -		      __func__, a, b, c)) {
> > > -		/*
> > > -		 * Return 0 (rather than ~(u64)0) because it is less likely to
> > > -		 * have unexpected side effects.
> > > -		 */
> > > -		return 0;
> > > -	}
> > > -
> > >  #if defined(__SIZEOF_INT128__) && !defined(test_mul_u64_add_u64_div_u64)
> > > -
> > > +static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)  
> > 
> > Why not move the #if inside the function body and have only one function 
> > definition?
> 
> Because I think it is easier to read with two definitions,
> especially when the bodies are entirely different.

We have differing opinions here, but I don't care that strongly in this 
case.

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>




> 
> 	David
> 
> > > +{
> > >  	/* native 64x64=128 bits multiplication */
> > >  	u128 prod = (u128)a * b + c;
> > > -	u64 n_lo = prod, n_hi = prod >> 64;
> > >  
> > > -#else
> > > +	*p_lo = prod;
> > > +	return prod >> 64;
> > > +}
> > >  
> > > -	/* perform a 64x64=128 bits multiplication manually */
> > > -	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
> > > +#else
> > > +static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)
> > > +{
> > > +	/* perform a 64x64=128 bits multiplication in 32bit chunks */
> > >  	u64 x, y, z;
> > >  
> > >  	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> > > -	x = mul_add(a_lo, b_lo, c);
> > > -	y = mul_add(a_lo, b_hi, c >> 32);
> > > +	x = mul_add(a, b, c);
> > > +	y = mul_add(a, b >> 32, c >> 32);
> > >  	y = add_u64_u32(y, x >> 32);
> > > -	z = mul_add(a_hi, b_hi, y >> 32);
> > > -	y = mul_add(a_hi, b_lo, y);
> > > -	z = add_u64_u32(z, y >> 32);
> > > -	x = (y << 32) + (u32)x;
> > > -
> > > -	u64 n_lo = x, n_hi = z;
> > > +	z = mul_add(a >> 32, b >> 32, y >> 32);
> > > +	y = mul_add(a >> 32, b, y);
> > > +	*p_lo = (y << 32) + (u32)x;
> > > +	return add_u64_u32(z, y >> 32);
> > > +}
> > >  
> > >  #endif
> > >  
> > > +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > > +{
> > > +	u64 n_lo, n_hi;
> > > +
> > > +	if (WARN_ONCE(!d, "%s: division of (%llx * %llx + %llx) by zero, returning 0",
> > > +		      __func__, a, b, c )) {
> > > +		/*
> > > +		 * Return 0 (rather than ~(u64)0) because it is less likely to
> > > +		 * have unexpected side effects.
> > > +		 */
> > > +		return 0;
> > > +	}
> > > +
> > > +	n_hi = mul_u64_u64_add_u64(&n_lo, a, b, c);
> > >  	if (!n_hi)
> > >  		return div64_u64(n_lo, d);
> > >  
> > > -- 
> > > 2.39.5
> > > 
> > >   
> 
> 
