Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47727A455
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285614; cv=none; b=gUcERNKoqSy1MXb9SfSLzJYDGeDk+0AQsxx0VJ0O7X6jWzsuwBb10CbW0dBDMnvjdwafiMuyXRUlJ9ndFEHVyy0+6m1vIbpX6ZSVWHjEiKxCiNPYPeEijy8VpcJBhkzh2yTSUWCpqYV3hviE6e9jmyitriMYUA1XCvSCwL3nFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285614; c=relaxed/simple;
	bh=FtThxekNP2y8dU4ssBHrWh43SmNUy3wRRAKnrAl4pOA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgoDx2jNv1Jr+mx0x30CYe84zkHttHDwvuDis6pNZesS2BwIot56VTjNDWUXe4wIVfmarul+TM/448Nii+noKKXEY3U3C9ZP0/gnSB+rIOSR0aqHL2Ju/yvqh6GACmkHc66oMuFthvdiSmv50MVWBgX3ZEQaZExqiq2SYlDedyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtBTEzJM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtBTEzJM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a582e09144so118737f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750285611; x=1750890411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDSoJMdelc3nm0jCMjPGuBj+uGofQaPOz5SpVMxJSxI=;
        b=GtBTEzJMqU29FoyuaOMDVNMrOoWqNOlHMy2wp1CxOz7BgxJ/TzzEL5SrguHP7pBMkM
         pjwXYGQW3yoVip2I0S1Z1/VqjL999HbjAfy2sgCb+Hu5HHgtGbiG8zjLRSKDTXIQMPJx
         wTSpDSBPX4X1teQdZoR6B+tLSWbdCDvizXyPFyrivwugWQaap2xa9sngIJoEefc17cL5
         EK+FpPec7yiH97VzHE/NXH4IeSttMXBDQ1PN03mG10A/14awt2/TST4LWUpCqF5yKTO3
         ClO1l4Cv1+t3DkvfzzkVEbRs2OqPg2KmkWOGa3yU8Yh+kudsXkT9wSo73jgXWnf+czg+
         49JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750285611; x=1750890411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDSoJMdelc3nm0jCMjPGuBj+uGofQaPOz5SpVMxJSxI=;
        b=g4JLw5g56sUG8na3tzxgNAbHBjcVqwoQxkiFbDlrNdQZfjZhJo/x/9ujbSl2PmiGrN
         HUIeC3WqI0oUzIsRwfeVnC9yAjs+1jwOiPL+RCmc+bC5FjFwiz/ASb+btObClWp2hJ6p
         wwc/2YT5t2n58iN6fGCaahraAzR9OBny/Z4EoPOpCaer6ST/0IiFjaxN3meP+FjE6+gN
         JKu6RbQaHHvuZOex+fLKU8A1o7N9zQfn4mu81DIp/dFFFUWNAHy/ubPYe0rZvMvEdm2R
         9FcL5WYSOI6R+FSotvAQwdlfeQ3+l9hpSbwBJazb648MKdhujBXEHfuEpwKqsU74wWPN
         sbMA==
X-Forwarded-Encrypted: i=1; AJvYcCUAcEc3wvDGC0G45hgu94bN7Yw6v+aPGYyUL+MyYj3O1l/3bI88Rs43iYmwEGaj94aOfj1Fq023pyHd46U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6GY8Eld7cNjCRqLTN7rBTLo9EACxex+5A35SnhT22JQ/eIMS2
	LdwTSQJgNjNURRHvBcTkkgaTjpFszX3fQ39KyO2K+8dZNyMh0boZ68Sb
X-Gm-Gg: ASbGnctWXbUol90InabZgmsCL2k3NRwIcQ3oyjJMPw6j/U2SiUkmjq+2lVOoZNiR5PC
	RvIaNqpMiQO/brJ1/ECdpO1bOIudDJxGNgANrESQrvJcYTmVr/SzJoYf8BJs1X1WOHwMknAA7D7
	lmqRGvEyLesAIsoZPUrL0OzEAw2QNGOv/Fc3NJHpXGiU7pVLMEshrtkfFOi54PsKq6CVJ5P0Rqw
	rdm2s445+qVKnJ3LPpdoAwWXbFzJj5WhLQCVnWwSV0FuCCsDQXPQM0mqUerriGyI2AmRiL/cQe3
	omSlbEW980WoC/tJ4cvT8lYOHUPKREGqF4QI+UMdzMsn0bYBlKDre+TCfsiuxmEGmOioPo9BO5r
	KE77y62bt9PPApdfcE/bBiH1i
X-Google-Smtp-Source: AGHT+IEO/nR3cwhZwCIFU1k7mNgXEbTi42tqvM2Y/hNzGJwBezgGe32Hq4mcvFE+7M+W4YMcitUiIg==
X-Received: by 2002:a05:6000:2504:b0:3a4:f435:5801 with SMTP id ffacd0b85a97d-3a572371781mr15372958f8f.17.1750285610459;
        Wed, 18 Jun 2025 15:26:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm17838888f8f.42.2025.06.18.15.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 15:26:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:26:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
Message-ID: <20250618232648.0f58a27f@pumpkin>
In-Reply-To: <0143891q-ssp6-83on-4o61-nrp2qn3678o1@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614095346.69130-10-david.laight.linux@gmail.com>
	<os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
	<7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg>
	<20250618101620.26533aca@pumpkin>
	<s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
	<20250618185432.5ce80e0d@pumpkin>
	<0143891q-ssp6-83on-4o61-nrp2qn3678o1@syhkavp.arg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 16:12:49 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Wed, 18 Jun 2025, David Laight wrote:
> 
> > On Wed, 18 Jun 2025 11:39:20 -0400 (EDT)
> > Nicolas Pitre <nico@fluxnic.net> wrote:
> >   
> > > > > +		q_digit = n_long / d_msig;    
> > > > 
> > > > I think you want to do the divide right at the top - maybe even if the
> > > > result isn't used!
> > > > All the shifts then happen while the divide instruction is in progress
> > > > (even without out-of-order execution).    
> 
> Well.... testing on my old Intel Core i7-4770R doesn't show a gain.
> 
> With your proposed patch as is: ~34ns per call
> 
> With my proposed changes: ~31ns per call
> 
> With my changes but leaving the divide at the top of the loop: ~32ns per call

Wonders what makes the difference...
Is that random 64bit values (where you don't expect zero digits)
or values where there are likely to be small divisors and/or zero digits?

On x86 you can use the PERF_COUNT_HW_CPU_CYCLES counter to get pretty accurate
counts for a single call.
The 'trick' is to use syscall(___NR_perf_event_open,...) and pc = mmap() to get
the register number pc->index - 1.
Then you want:
static inline unsigned int rdpmc(unsigned int counter)
{
        unsigned int low, high;
        asm volatile("rdpmc" : "=a" (low), "=d" (high) : "c" (counter));
        return low;
}
and do:
	unsigned int start = rdpmc(pc->index - 1);
	unsigned int zero = 0;
	OPTIMISER_HIDE_VAR(zero);
	q = mul_u64_add_u64_div_u64(a + (start & zero), b, c, d);
	elapsed = rdpmc(pc->index - 1 + (q & zero)) - start;

That carefully forces the rdpmc include the code being tested without
the massive penalty of lfence/mfence.
Do 10 calls and the last 8 will be pretty similar.
Lets you time cold-cache and branch mis-prediction effects.

> > Can you do accurate timings for arm64 or arm32?  
> 
> On a Broadcom BCM2712 (ARM Cortex-A76):
> 
> With your proposed patch as is: ~20 ns per call
> 
> With my proposed changes: ~19 ns per call
> 
> With my changes but leaving the divide at the top of the loop: ~19 ns per call

Pretty much no difference.
Is that 64bit or 32bit (or the 16 bits per iteration on 64bit) ?
The shifts get more expensive on 32bit.
Have you timed the original code?


> 
> Both CPUs have the same max CPU clock rate (2.4 GHz). These are obtained 
> with clock_gettime(CLOCK_MONOTONIC) over 56000 calls. There is some 
> noise in the results over multiple runs though but still.

That many loops definitely trains the branch predictor and ignores
any effects of loading the I-cache.
As Linus keeps saying, the kernel tends to be 'cold cache', code size
matters.
That also means that branches are 50% likely to be mis-predicted.
(Although working out what cpu actually do is hard.)

> 
> I could get cycle measurements on the RPi5 but that requires a kernel 
> recompile.

Or a loadable module - shame there isn't a sysctl.

> 
> > I've found a 2004 Arm book that includes several I-cache busting
> > divide algorithms.
> > But I'm sure this pi-5 has hardware divide.  
> 
> It does.
> 
> 
> Nicolas

