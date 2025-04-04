Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D141EE7B1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774881; cv=none; b=qA7m/s7pHkKC1SIFt7QjJnvELd09L2aFzOO0xxO4TPGuvCGR6NSVgFDrp8I8ev0BCiawlC313rBm3m/Zq1DA8kMuyxF1SB6zV9OKfIao3jX3j+ryrc7uvOW4z9Q7OYZK2wL+6U7hJAh6D0+b857QIMAe8f/mkLv9iK0IacKj0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774881; c=relaxed/simple;
	bh=mH/oqrx10yvUQJlU2FYdxk0FHyhtYnIDSziZsAdWs70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqquzd/iG5m9TQwq+aKiwz+ZlsyU+7rnlpz/WpFArGWS8GZvE2/K4oULQGhfExGYXgbWKUPbZGQiJreaFN9Kgkr/5eTCnrL6KAiNLi5fsj9++svbV0olfLiUAM7ltFnyfcGjCyfYC0CEGbqchFn9ymfQ47pwXjo49DRYkbJ+G1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTO9QCDx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTO9QCDx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739525d4e12so1843658b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743774879; x=1744379679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8XupPhYtcgvW5/k1ZLQn1jc4P/+RcYSuqaM+or8g0w=;
        b=NTO9QCDxt5FX8ab6lmLT1YrpNCHiA8bmFVSKydbEZCHIdpF+5MKdUH7rbOshAce17k
         I7AI/3RtWBtoO5LIGofiBCFRJrzH43giwhKeOPKA4SAhdnMyFlmH8ohwvZmIEsP6fQIs
         u8/+bt3PCOoprx9AKRJBF8SbM8aj/m1Ule+MTkHpfRuMPkuDhvuUgGbQHvPdvT4LLh1U
         l0w/n8YITAdeX2IBhvWlrtqPOQlGd5QGtWFLZySCynMjb2WLvdJ1Sovn5q86r0cAD3Q6
         iUjOwGz+W9yAIyB7zHlHY9qYv8HLH/wN7JtpWCdIRWCXqbjfOhVjJXeJABiQYv6XN0sL
         6TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774879; x=1744379679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8XupPhYtcgvW5/k1ZLQn1jc4P/+RcYSuqaM+or8g0w=;
        b=vEGfrzVRdv7PqmssQC60JkTEM6+5okUWBfni/YTHBQfc5Sz/gHcOrbaDinqbPOllrM
         rBpb13mbL0NWQmrGDvCo+zBmDIedChvUibRaencKOhEbmmbC6UwwTNFlzTUd61iSN2Hr
         f4yP/HyQX+nEr134YMnKfGJoSgP9fSOTAoKT7PC+Um41KL8gLg5+KryfIzWbj/aZWXci
         Fowl80zc94Co2DAia0L2iVU9AtZM6aJeTjzYVskdDF9DjFa0v8z2pZqJim9eXwv3NWx/
         KU/l8QuTeAoTDKjHXWGuPkP43I7MKpTnNDqRSa+E4sp3+mB3DGjx9ijTPBlEoCkCRcgQ
         7YtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlc0DL+f84vhH/7OYhjC0fET6vdE4RmejGd4B7TfG1Y5wyI+ZyWmCovMiLeKFRRFbOl5Pq8A2NuVG8IDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHs5bVkkhYPBoeeRjl7NvqXGr2bCsfXQzE9n8MgoFYgyzjZYVf
	3sbUtj8dr4DpMcJAusaqCr3WvQV/ub/M7tppUa3V+3udrrMQgAKS
X-Gm-Gg: ASbGnctd84zeWWsAdA3V7rc4fV6JqJvx7I+BAiPQo1zMewcMHze7NiUo0EQjovUw9Xd
	/C3UfO/ZNWlYSRlryMde1QxQbv5FlFei5p6ik+igWYi+jxmPWZk+0h+uBCqL4f6RCBN3W7ot/WW
	9xbFS4ZcXklGprd7+V5xoAqoL63xSP49M8/04F7RaatS9Cp/3rA9rZMQsj91ok2woG+B1DrmJ4/
	ot2FuEyWZ+DCRDqJH1qhTeovd0wHCmAZqnL9ZPoSquhgbrfqwU9pP/hj3uDKiHJguS/tdZ9FBem
	P1tBeB1ZQtn1TenHqPtnJx3COUc+P1fui63wFjcJa5De9v0/BWURwuR8uaadJfh9ssvTRRqG
X-Google-Smtp-Source: AGHT+IFC9N2k/ioIXcpoV0BN/ew7bxsN6dtQL5Sstqa61qFrdL0M2RbG2UttbswEJ6RlGwal0h7JVw==
X-Received: by 2002:a05:6a21:9201:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-20104769bb7mr5348532637.41.1743774878910;
        Fri, 04 Apr 2025 06:54:38 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34e91asm2874206a12.33.2025.04.04.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:54:38 -0700 (PDT)
Date: Fri, 4 Apr 2025 21:54:35 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] riscv: Optimize gcd() performance by selecting
 CPU_NO_EFFICIENT_FFS
Message-ID: <Z+/km3h1ZmnJjyId@visitorckw-System-Product-Name>
References: <20250217013708.1932496-1-visitorckw@gmail.com>
 <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>

+Cc Andrew, since this might touch lib/math/gcd.c

On Fri, Mar 28, 2025 at 03:07:36PM +0100, Alexandre Ghiti wrote:
> Hi Kuan-Wei,
> 
> First sorry for the late review.
> 
> On 17/02/2025 02:37, Kuan-Wei Chiu wrote:
> > When the Zbb extension is not supported, ffs() falls back to a software
> > implementation instead of leveraging the hardware ctz instruction for
> > fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
> > optimizes the efficiency of gcd().
> > 
> > The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
> > With hardware support for ffs, the binary GCD algorithm is used.
> > Without it, the odd-even GCD algorithm is employed for better
> > performance.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
> > instructions, this patch hasn't been tested on real hardware. We'd
> > greatly appreciate it if someone could help test and provide
> > performance numbers!
> > 
> >   arch/riscv/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7612c52e9b1e..2dd3699ad09b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -91,6 +91,7 @@ config RISCV
> >   	select CLINT_TIMER if RISCV_M_MODE
> >   	select CLONE_BACKWARDS
> >   	select COMMON_CLK
> > +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
> >   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
> >   	select EDAC_SUPPORT
> >   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
> 
> 
> So your patch is correct. But a kernel built with RISCV_ISA_ZBB does not
> mean the platform supports zbb and in that case, we'd still use the slow
> version of gcd().
> 
> Then I would use static keys instead, can you try to come up with a patch
> that does that?
> 
Here's my current thought: I'd like to add a static key named
efficient_ffs_key in gcd.c, and possibly call
static_branch_disable(&efficient_ffs_key) somewhere under arch/riscv/
when RISCV_ISA_ZBB is enabled but the Zbb extension is not detected at
runtime.

However, I'm new to the RISC-V kernel code and not sure where would be
the most appropriate place to insert that static_branch_disable() call.
Suggestions are very welcome!

Below is the diff for context.

Regards,
Kuan-Wei

diff --git a/lib/math/gcd.c b/lib/math/gcd.c
index e3b042214d1b..514b8a86b461 100644
--- a/lib/math/gcd.c
+++ b/lib/math/gcd.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/gcd.h>
 #include <linux/export.h>
+#include <linux/jump_label.h>

 /*
  * This implements the binary GCD algorithm. (Often attributed to Stein,
@@ -11,6 +12,8 @@
  * has decent hardware division.
  */

+DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)

 /* If __ffs is available, the even/odd algorithm benchmarks slower. */
@@ -20,7 +23,7 @@
  * @a: first value
  * @b: second value
  */
-unsigned long gcd(unsigned long a, unsigned long b)
+static unsigned long gcd_binary(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;

@@ -44,7 +47,7 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }

-#else
+#endif

 /* If normalization is done by loops, the even/odd algorithm is a win. */
 unsigned long gcd(unsigned long a, unsigned long b)
@@ -54,6 +57,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	if (!a || !b)
 		return r;

+#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
+	if (static_branch_likely(&efficient_ffs_key))
+		return binary_gcd(a, b);
+#endif
+
 	/* Isolate lsbit of r */
 	r &= -r;

@@ -80,6 +88,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }

-#endif
-
 EXPORT_SYMBOL_GPL(gcd);
