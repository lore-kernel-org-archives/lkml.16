Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392121F4E54
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669579; cv=none; b=FPsNRfMQqx5xh24ICH7NVS38d7R7+1z+Eztvkb0lY2o/b6u1ULGv4kBc3xrj2+3e+RzP39cyA+FVS+Dm3/ZtNqQ5eNHx0917EJnDdphDzDpYhAaocVXHVLLiyDiHlcu02vZQHh/ER1A2WFUcECJrERMmB9wWOyD548RkUwmQvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669579; c=relaxed/simple;
	bh=U7cZReZjrr7NKXwZ5XAaa0GQ/TD//bG9K/aKMvyXmis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAT/l88KnFlHBG6WUwq/mVx5QHOav3xDJvHGNuNiGzTO53/YjJydqThoEA9FblqM2wv4wdgQt0OnJuuIs2NCw0GEQV511ufYGByaq9zWxk42wD1Qi+Yk4w97/dO6/HDP3Q+h9/73oVkFYOfhHSqxyZ5DClPpOhs3ZglLHWcG34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QebTuxHA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QebTuxHA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ede096d73so35509795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744669576; x=1745274376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Seffc+yZNHH7nQZK2TccuJe06M8bYwImxNduIh9Hks=;
        b=QebTuxHArlXaGiN6Acymw+YgnysIUQzpfgD2X+9y78O2HAcBQB0283xkg0aPtxbFx6
         r2h4oz8f3QF4+orj2curFfB22zBX5KppSMNClfHhp8Xhr/Qe3mIfLStEqKJZt9jNY+Xk
         CPSGD3EUtQ3zTuOk2EUfHigd+vzRSw3uri7O632YnPAq5QOqjzIIKzwhzSgo5pclht/R
         34UdDZHlD0HUdx30Ka52HkQUQVRYtXkWcoEFqjbt7pVX17sMetQEbF8oq5/12kLlKZmx
         6X9TMZJiDOhyS8yVPmasHWg/h5e08SKdM+2y9OXGODC59tMyF5sI2XRzlyyxig++Zltu
         bLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669576; x=1745274376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Seffc+yZNHH7nQZK2TccuJe06M8bYwImxNduIh9Hks=;
        b=r3gPj18Ap6AopOmGiurltKkRbVjQgdMTTKmG6fxApSuuj9DPJjuTaRXMyAve4FfR0e
         1iYwuBK3x/PIu/ktghs3mseUchu5W533fcRWubUxptNlALGnFSlj/xvOvJkC4mzHgAWD
         6EhJ815ijhBpelS/l5rFlSSzuLUjCxmN1F+hxmP9xJPyDviMkdvK0KK4XeSymqMRjnbx
         RRIYPeiJiWqRG9h2Mqyxd1LVN8UyDtOQJpYOhYehTHIsyMYHUWnTAqT2RtM2DPOvfli3
         VGVjoGpb3ESQGN1B7saauu0Z5ioau5ImOUDsNsP0clbS0o/zyqbVj6qufLadf7nEpcXY
         fkPA==
X-Forwarded-Encrypted: i=1; AJvYcCVkGiQ60FME77KBtdyFtw1AGEoerw/VNnaFaZ96wYKR2IgEv9TsYwSftGxkUQfoTFle7Ev9INMrGjZoVC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5sdDpN6IHPrQfFK1RDYTXV9QPLisinaXizsKb7ahmEc3QjOGw
	M9/KQr5Kme7B/TLHDm+JWoCXisjK1LtQ7FDCEtyLME2dz6izWnTP
X-Gm-Gg: ASbGncuLuAFAhv6hJKlAy5KSKOJmO3h0dJWdwnNA1yl4iH9JMRJ4SrzdErOQ1nvjdTm
	/pHjfksj056piTxYX0X3kN9hynsHFHLxGqB2Cg6TKCUvBXZRbnywKEF59aGsvYZNQZqyQQKz4zq
	W/1B8W7uyYHyPW7npuQc2IkEOQVP+YZSHrzQy7TlcaXRGX0fb4rR018RST9hxtRruWQFqWEX/P3
	+M/u7g7JXHcvv0/go9lqv4o4BxFQRLp3G0dsq8qx7QIIrb2nOBAKLcYWbm/5HHLEmiCqp1W6MoR
	p6oc/iuRor1kiXCYGZ57Nsr3C0B4SlSzv2wd1aeEz0s5EKhjHlQW2kc+7Vg0vyrJ
X-Google-Smtp-Source: AGHT+IGl4JCafq/SyDh3qQGSjEQfpCYf/XEY/8sqQywe6otVD8GhNKZ2Fe8OOwdiYoKHHvDzNEJVxg==
X-Received: by 2002:a05:6000:2212:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-39eaaea67f4mr11937204f8f.33.1744669576284;
        Mon, 14 Apr 2025 15:26:16 -0700 (PDT)
Received: from f (cst-prg-79-34.cust.vodafone.cz. [46.135.79.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c70csm12351447f8f.38.2025.04.14.15.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:26:15 -0700 (PDT)
Date: Tue, 15 Apr 2025 00:26:05 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com, luto@kernel.org, 
	paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org, 
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
Message-ID: <pf2p3ugs3blztd5jtxuwrg3hc3qldc4a7lfpigf24tit5noyik@67qhychq2b77>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414110259.GF5600@noisy.programming.kicks-ass.net>

On Mon, Apr 14, 2025 at 01:02:59PM +0200, Peter Zijlstra wrote:
> This symbol is written as a C function with C calling convention, even
> though it is only meant to be called from that clear_page() alternative.
> 
> If we want to go change all this, then we should go do the same we do
> for __clear_user() and write it thusly:
> 
> 	asm volatile(ALTERNATIVE("rep stosb",
> 				 "call rep_stos_alternative", ALT_NOT(X86_FEATURE_FSRS)
> 				 : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
> 				 : "a" (0))
> 
> And forget about all those clear_page_*() thingies.
> 

I have to disagree.

Next to nobody has FSRS, so for now one would have to expect everyone
would be punting to the routine. Did you mean ERMS as sizes are in fact
not short?

rep_stos_alternative() as implemented right now sucks in its own right
("small" areas sorted out with an 8 byte and 1 byte loops, bigger ones
unrolled 64 byte loop at a time, no rep stos{b,q} in sight). Someone(tm)
should fix it and for the sake of argument suppose it happened. That's
still some code executed to figure out how to zero and to align the buf.

Instead, I think one can start with just retiring clear_page_orig().

With that sucker out of the way, an optional quest is to figure out if
rep stosq vs rep stosb makes any difference for pages -- for all I know
rep stosq is the way. This would require testing on quite a few uarchs
and I'm not going to blame anyone for not being interested.

Let's say nobody bothered OR rep stosb provides a win. In that case this
can trivially ALTERNATIVE between rep stosb and rep stosq based on ERMS,
no func calls necessary.
