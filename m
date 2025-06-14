Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41820170A26
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749936401; cv=none; b=hz/G3imOCx2LS6YjihVQ2D3jkgz3/oC4pmO14EDrHc33EgSHUTH1Lfzh73Uac29j2NS7cTSIW3uMFxI9dUafpL2dd4GumLgkgoEkFMzrh9xsUB0g4N5LMHHEn4CDe88IJDlDxWDb6H9tLZl5HO+rtAPLbETgVnNChZOQskboMeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749936401; c=relaxed/simple;
	bh=SNXso9YLpiWdTKrmabKAcER5rNvSL7M7d8z2QcpLXPw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CnqygAJc96CleruMWk0/beM1QJ0g5ncJ916iQB5Jlt4GDfH1bvuTklEBWUpIh/l6lzD4IPRr7ziNNU8WS6dxH8rFsle5UY6d0fyNMiSOITmVebtkAcjEdFQgSweobw4IvohU/GNmN0yiDPhBWUbsoYKz428SQKACRlGXcchFLGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShXP/MKm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShXP/MKm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so17427865e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749936396; x=1750541196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTun28a23b2Ln/w9X02DgjDodJFWVRJ7xbb96Jjf3zU=;
        b=ShXP/MKmpmbXr9iMolmjWHji5KULFX5cR3c6OfYP9+Sw2gfyNzyQgaP51NeYPSkH3n
         Nzsqgrd8I4/eLWIZemmGHMb2H89xLrKNzghQ/Hme+hAV95Hg7kejWKPd8XUO5oVEOPBu
         xjfP1GPII8cticMmH+Y0XvcuExOtNtKtmNx378NA2s4rnkbnNKEZDcoA7+D3cE64vL1a
         aeZPczZcZLCsnaYWGxmu5MrzFb4muBpCT42ZEpSYZoMIbgUUu6jX7fEdd1/g7sWsoZCX
         syAgjVY8SwU3UOnnHF8tX6cK+csFheN2a6p8vvtSi6IImR1tL6xF8/o3Oh9UXczEPmUf
         ujHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749936396; x=1750541196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTun28a23b2Ln/w9X02DgjDodJFWVRJ7xbb96Jjf3zU=;
        b=IXm3aHBsLnLviqlZ/O3GXZkZkgh09C5I9PsoXakKJlw4JjxItJD91wcFKXD+BoXiXU
         Cyhye0lNWvnw5nkfXPiacEOp39EA2Y0VMRQ2QehNUHAtJAn8O39znd5YFmvwbM2P5nBz
         Spc+JOxsuA2h4THcldsCxoudlKnCsInzxXFgKDennGnV7SzAtT2DQB5of6as+m6bdAQ1
         mhodrpVBdwlTZU7VXpsALOyRuXUsRQBTfPz/Y1foj49wWs2tewL4Mqlg/Lsk8N5d/EfL
         9BFhQKz6d9m6oMQatxyPdXfOABxIrs9z/t2nq+uwNRS3dXohklSR1vF5PRJzqnU80O3G
         UKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA0q5d6is0m9GVmxGYZhqzpFlrhAjwZGhN1Xfv5so3XQzuglCBEHjqbYRt4BV1YKJIoG5RL5ECMMuz4jg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8H+7hf2qKQjCIyTSw4cVlbfPdd6ZvuSbVbMF/kEt4Xkr/lgNP
	SrURHpGP/LVatbxcLv2NXP2NMRZg9e//ytfFm5neGY82v9/4isxL3fsn
X-Gm-Gg: ASbGncsiDhI2sA/JFgPJH2ctVh0fz1Yl6GwAPIpU86aK1EqFRWGP+7vQ5hJ53NZKzg9
	Qh+bNPhXNz51ditDzWxGUNR1fQ42i2RpI6LuoVtHIlrOs9ZKi9/lO4ArcGd6V2KEJxo9zACQ3SW
	UrfBESZOjHoR+y7O4Fm5zlTtUxYStIm57wTojQ2xdPGWiyHGTTKVSI6yeVRZ0wukh9m1xxkgdl7
	9DrUjuj6nJH3q0+is3RgwtGye4ItoyftVdXohHgE+l7dfndyGp1crtUXbD7VjA+qTt9Q5vREcCK
	tKYHl18U0MN6w1pz9D+Zff1AI7wnZsQKm8J55IxxLeSENOxebm8vn2FD5wdty0VYxoVgLWyWqqA
	+717xjQvxfVQLRBzc4J3EsZA+
X-Google-Smtp-Source: AGHT+IFAZ1frd1RcKxyjfkGccpXxMFVi36wk1Hd03CebFU1dizb9G66rtG6YapfcRTDWiE3m6dcebQ==
X-Received: by 2002:a05:6000:2284:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3a572371cdcmr4372520f8f.20.1749936396260;
        Sat, 14 Jun 2025 14:26:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5405asm6218271f8f.13.2025.06.14.14.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:26:35 -0700 (PDT)
Date: Sat, 14 Jun 2025 22:26:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH v3 next 02/10] lib: mul_u64_u64_div_u64() Use
 WARN_ONCE() for divide errors.
Message-ID: <20250614222633.77a7d242@pumpkin>
In-Reply-To: <4rp80297-985r-546o-on47-q34rr7po03r7@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614095346.69130-3-david.laight.linux@gmail.com>
	<4rp80297-985r-546o-on47-q34rr7po03r7@syhkavp.arg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Jun 2025 11:17:33 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Sat, 14 Jun 2025, David Laight wrote:
> 
> > Do an explicit WARN_ONCE(!divisor) instead of hoping the 'undefined
> > behaviour' the compiler generates for a compile-time 1/0 is in any
> > way useful.
> > 
> > Return 0 (rather than ~(u64)0) because it is less likely to cause
> > further serious issues.  
> 
> I still disagree with this patch. Whether or not what the compiler 
> produces is useful is beside the point. What's important here is to have 
> a coherent behavior across all division flavors and what's proposed here 
> is not.
> 
> Arguably, a compile time 1/0 might not be what we want either. The 
> compiler forces an "illegal instruction" exception when what we want is 
> a "floating point" exception (strange to have floating point exceptions 
> for integer divisions but that's what it is).
> 
> So I'd suggest the following instead:
> 
> ----- >8  
> From Nicolas Pitre <npitre@baylibre.com>
> Subject: [PATCH] mul_u64_u64_div_u64(): improve division-by-zero handling
> 
> Forcing 1/0 at compile time makes the compiler (on x86 at least) to emit 
> an undefined instruction to trigger the exception. But that's not what 
> we want. Modify the code so that an actual runtime div-by-0 exception
> is triggered to be coherent with the behavior of all the other division
> flavors.
> 
> And don't use 1 for the dividend as the compiler would convert the 
> actual division into a simple compare.

The alternative would be BUG() or BUG_ON() - but Linus really doesn't
like those unless there is no alternative.

I'm pretty sure that both divide overflow (quotient too large) and
divide by zero are 'Undefined behaviour' in C.
Unless the compiler detects and does something 'strange' it becomes
cpu architecture defined.
It is actually a right PITA that many cpu trap for overflow
and/or divide by zero (x86 traps for both, m68k traps for divide by
zero but sets the overflow flag for overflow (with unchanged outputs),
can't find my arm book, sparc doesn't have divide).

	David

> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 5faa29208bdb..e6839b40e271 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -212,12 +212,12 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
>  
>  #endif
>  
> -	/* make sure c is not zero, trigger exception otherwise */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> -	if (unlikely(c == 0))
> -		return 1/0;
> -#pragma GCC diagnostic pop
> +	/* make sure c is not zero, trigger runtime exception otherwise */
> +	if (unlikely(c == 0)) {
> +		unsigned long zero = 0;
> +		asm ("" : "+r" (zero)); /* hide actual value from the compiler */
> +		return ~0UL/zero;
> +	}
>  
>  	int shift = __builtin_ctzll(c);
>  

