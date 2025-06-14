Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864117462
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749936790; cv=none; b=UaJ2GvM7AoREl3SbzyWP1sn89/70os6P3inG/gMhmxH5P6SboH5JOdScHSHnQSWWuyWbZsHJqywfUXeYrID7XsWNawXnHVcPTv0DJWQ9mSWP5TdEIqIJx7EmLYOHlGe+kxA1tF+sSrtysJlPlVqgjLVIW0mXQ2iHUKUTKI0V0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749936790; c=relaxed/simple;
	bh=Y5w78cvgamv0Dj0NKUKDziwZnFdQqR7Nep6qV62d5dI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRZTTnBMftIQJiszwgqs1MNngrhkT//HP72GPc1cMz0zpGvrud9RhqZAK7y51tONs81fWx8ZrWvRi0pk63YW9/l3VeWzVN7D3OeU4eP7ddMxfWYhVixHZx8mgL0oOiTdNiCL0n6umvYdDgu5eudjMM1m80lSsg/HlATxp54qLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSxUKM9v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSxUKM9v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so1788565f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749936787; x=1750541587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dEKzcBhpakvz7JfJKuqzS94eT+Erin8X868OAONCNc=;
        b=YSxUKM9vJaDAXLS/LmXUW5nw0CNwwP4zpeQoXZgZyB3F0XUpdjm9ITmiRN6Bxzdk8m
         fyEUAyYfPOWTaikZRzXFMGXrILSsp3XFkemEaB/0e9RHgRjhVb8p/P8AFfQ5cEym51yn
         I7+PCbFWPT9nsl3jGaV1jPRIme0I+/pQXvbFnXQD7hI8Ss/kxY7DhItFileIX+wcGCRB
         TTkPs7EMUhIL0lM7vFjaNsNY5EpYU8FQPP7yZSyQNEE8Hdbko6q+MUZrgp6ME9vKjcIG
         1vGEUB4rouYLe+mflrrlTRBioN2WHRY3ixx06yPePquNfxDXAc4K3ae3h9ow9vHlqmSZ
         i5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749936787; x=1750541587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dEKzcBhpakvz7JfJKuqzS94eT+Erin8X868OAONCNc=;
        b=dbZPO5r8Dw05IdzGZLvrmgQZnXOwH1wAqqfnCM5RPIdptYTidv7Cw/V9mSURF2Ne3P
         MohNllSpK+16Mhd7RxdazASSHLoJbvn3Cw96O+OqbRkC/VFbTgucwiheEfoqnNzov3OQ
         8laIi0dpSgYO85QuY1TJgBRz387gyh/51c4KIlG1uObm/krNKT95aWJDwXGrNMu2Pr1J
         2KTVj2bu3j/UjrqpA5iT9zRtWiUMkMtz2qLo6TboxkVAKmIjpxOCMfzzGNmqBICOAwjr
         cYN5cSVvPue1dujQk74yeHZY4J/dEGbljy1zP1mcUBDS8VEcU+/uiqBoKvfk5TVHi9Ze
         p0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeb1YfGyRb36vxDJdCiC/VldtMdD9mqHZpyN4YcTWUepZWn+qL3EawFiNN3Obiw4drpdg8zjK3Q1Hg0rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkpxPEGvYFZDiS7llowyPDVhve2WRizxGyn2qMzU6Q5gL+W6h
	1+9+c8s3TYUjFOm5bWAm7twCbLMfJnyuPF3ZTPrXKZcqt5yp13klrPFY
X-Gm-Gg: ASbGncsdzKH4jEukmTJ7CaefaicZIOWjnvkMUsoaAUKzyUwIZyGgQsIlxygE0PjMkkU
	AZ2kUVXXwzp1+ag9Ji7A5G/UfN8q7zyA8P0FqqKVZxeSGMmMPN5hGPPZM/VDgImYvqRc3Rzv/ov
	OkfU7BLBBYfN57ZncQfn7MeQh5C4zWLEpXmaAITi83b6dUMBEX40yc2NMAmjyHE35w2ea3BP7/S
	+dXAXNe7DaCHf6OnA2ds9t+FOLpTGHaldwdqRuM42ZMetHz0FpK/Fgxwj9E6Mg9htV3CS5yc/Y+
	wYk4wkJFuF53tw/eW/rWa3QjZJQHcisXlQrh7BIMUKslTeDp8K5bb8gpyjJ/AjD4Jhjfyit2R3r
	ZNWLs0qaJbBmV1kJgTL0uTGbX
X-Google-Smtp-Source: AGHT+IHiubCjkW0rhseTDiSu95iKmDNjdBKKAGi4gqZa5riDH8Sd4o1j1gf8IBP1deQVLgkaF2nGnQ==
X-Received: by 2002:a05:6000:18a5:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3a57237db54mr3822983f8f.23.1749936786605;
        Sat, 14 Jun 2025 14:33:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm6249980f8f.33.2025.06.14.14.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:33:06 -0700 (PDT)
Date: Sat, 14 Jun 2025 22:30:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 08/10] lib: mul_u64_u64_div_u64() Separate
 multiply to a helper for clarity
Message-ID: <20250614223006.20c16642@pumpkin>
In-Reply-To: <58porr76-92os-7019-nr00-n68r74202pps@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614095346.69130-9-david.laight.linux@gmail.com>
	<58porr76-92os-7019-nr00-n68r74202pps@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Jun 2025 11:37:54 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Sat, 14 Jun 2025, David Laight wrote:
> 
> > Move the 64x64 => 128 multiply into a static inline helper function
> > for code clarity.
> > No need for the a/b_hi/lo variables, the implicit casts on the function
> > calls do the work for us.
> > Should have minimal effect on the generated code.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> > 
> > new patch for v3.
> > 
> >  lib/math/div64.c | 54 +++++++++++++++++++++++++++---------------------
> >  1 file changed, 30 insertions(+), 24 deletions(-)
> > 
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index 2ac7e25039a1..fb77fd9d999d 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -193,42 +193,48 @@ static u64 mul_add(u32 a, u32 b, u32 c)
> >  	return add_u64_u32(mul_u32_u32(a, b), c);
> >  }
> >  
> > -u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > -{
> > -	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
> > -		      __func__, a, b, c)) {
> > -		/*
> > -		 * Return 0 (rather than ~(u64)0) because it is less likely to
> > -		 * have unexpected side effects.
> > -		 */
> > -		return 0;
> > -	}
> > -
> >  #if defined(__SIZEOF_INT128__) && !defined(test_mul_u64_add_u64_div_u64)
> > -
> > +static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)  
> 
> Why not move the #if inside the function body and have only one function 
> definition?

Because I think it is easier to read with two definitions,
especially when the bodies are entirely different.

	David

> > +{
> >  	/* native 64x64=128 bits multiplication */
> >  	u128 prod = (u128)a * b + c;
> > -	u64 n_lo = prod, n_hi = prod >> 64;
> >  
> > -#else
> > +	*p_lo = prod;
> > +	return prod >> 64;
> > +}
> >  
> > -	/* perform a 64x64=128 bits multiplication manually */
> > -	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
> > +#else
> > +static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)
> > +{
> > +	/* perform a 64x64=128 bits multiplication in 32bit chunks */
> >  	u64 x, y, z;
> >  
> >  	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> > -	x = mul_add(a_lo, b_lo, c);
> > -	y = mul_add(a_lo, b_hi, c >> 32);
> > +	x = mul_add(a, b, c);
> > +	y = mul_add(a, b >> 32, c >> 32);
> >  	y = add_u64_u32(y, x >> 32);
> > -	z = mul_add(a_hi, b_hi, y >> 32);
> > -	y = mul_add(a_hi, b_lo, y);
> > -	z = add_u64_u32(z, y >> 32);
> > -	x = (y << 32) + (u32)x;
> > -
> > -	u64 n_lo = x, n_hi = z;
> > +	z = mul_add(a >> 32, b >> 32, y >> 32);
> > +	y = mul_add(a >> 32, b, y);
> > +	*p_lo = (y << 32) + (u32)x;
> > +	return add_u64_u32(z, y >> 32);
> > +}
> >  
> >  #endif
> >  
> > +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > +{
> > +	u64 n_lo, n_hi;
> > +
> > +	if (WARN_ONCE(!d, "%s: division of (%llx * %llx + %llx) by zero, returning 0",
> > +		      __func__, a, b, c )) {
> > +		/*
> > +		 * Return 0 (rather than ~(u64)0) because it is less likely to
> > +		 * have unexpected side effects.
> > +		 */
> > +		return 0;
> > +	}
> > +
> > +	n_hi = mul_u64_u64_add_u64(&n_lo, a, b, c);
> >  	if (!n_hi)
> >  		return div64_u64(n_lo, d);
> >  
> > -- 
> > 2.39.5
> > 
> >   

