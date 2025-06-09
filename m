Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4ED4A21
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487107; cv=none; b=GobWSbzYbj5SQli600zZFzb6hy4b1AKKp0b/+7zt7JknFeUvwpspePk5eo//86CJa/clqWjLxK3tqXrAIp32h2bNk6+1yy92f1dQnzRC5QzNyUi8Oej9PhEnRCPtTH5NDZ7VEghpySPe4G/k+tXVGukV8PeP/4vlKjPRcy3Uw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487107; c=relaxed/simple;
	bh=R83GAZXbYebeXeOzBBTIrG+suD8xyCVGEj+liBcKoKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAMUDvZuwGCDqVi8xy6vNTJ68ge8gW41rDf1KJCR0uX31NoXqqa19H6RjAsw6XMpVtnwPi1s1oXect8sN6R47AVRBNSQXBJoMsKiXnkLu0TGEqvcA6eeP2Rec4lGvdmISEBGhiF7JBx1R5Y9cnnuBJMXhnVBqOnfxcz3E9tGzs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C+g7Sq/k; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C+g7Sq/k"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad574992fcaso674769666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749487102; x=1750091902; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMn6PIriqde4zBc6oB0n06bh+yvKwYkED4yNQ2KAPKY=;
        b=C+g7Sq/k77dbPaXhOKt0Qm5+1zRmxiX66i1SjowtT3w7WIpoPoQdShzNCqjqEBsT2N
         OObyd25i2bzzvZgnx+YHouEq+mHvSl3Chrpy6EtC6rolhZ5IGqO170KvtEZbd1mtnqer
         n0/IP6JV96KjkxpCdG4UoZ/pxMmPaJWnT2ODQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487102; x=1750091902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMn6PIriqde4zBc6oB0n06bh+yvKwYkED4yNQ2KAPKY=;
        b=DabqRfnCavsjVdh1i2tr2usKCp0Dt0ApD5L8sOOj+47bq1B5+o7eX5+fYZ+Z9fA8TN
         6uLCUPY75yyG/mR+6kw4fmOT+TGk3baeaQiW2bxvZycIPlwcUywzGyOj65cc61XWl1Qn
         i5QzMYSJXe2kj+uqsLkXGxIA+mBqTah3DxumYsj6pJ+QwR4IbzW/inQOfvDvM2u6hhwy
         YaQ9rYOpn3r+zFe0LeBI7vyF07ozMtOwi8HGVOUPoV0y4y3fOglrHYc+gx+8LIbqGmnH
         ZRShjSP6gYZ4XZKBEyy1bvdFKWhKPErT/Uhd/LIM8sBrn8eZri02zgeXsSg+NITHTJAA
         5ZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGdp+imKws7g70n17AB/dDulYjoy/BNlQIuc/tebHY/QAwSr86hKUdmh4IViQiSDyCz9QcVQeHCJX6Ook=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBNj1BL/K2+IrvjA57eWfqUkveM2yqoBnGv7Hjrt+96LMfWmxA
	mgQQwyfWvLn0ypbANP19vOhnU/3cA4frFKb0a1THvPq7mXcwwlGgPfGfvuQCiS7biVEsZUCfCPn
	nYfZSA/8=
X-Gm-Gg: ASbGncshNCSzqFnQI7P7DBBBk1r73nCNSk3pXgY7yrW/f/gM3VNIuGyFknv9mb0Smqd
	eZKzjDFYpiOJbRAbiupgae21COUb4QAGkNmWOLktZTsM7VEs9crORF1uh/pQIxouZPktHKLIUpP
	85MpNibLORs73338TCsdA+ChZTzuQmQZUtJx6M82TGKkIwMZE5ao6xK7NbWABOBA1w8dTn//oUY
	LV7vGPBTajxuwF+TYKvXXtRUpfqJ6+QqUq6HailwluzorUVmjYCa7MHQVdJjsFoqADuinToMgjE
	3yAwpeC6VZntXRgPzQdHWCjfaZaN1pxIideu5OWxJigRaqr10TZedMxpdOPKJGFzt3r+r7PhBiW
	fGxJlpzfd3CVPgM3xU0W2JbyQLVgqCoBfwlnE
X-Google-Smtp-Source: AGHT+IEwVp0thazQeunCDDtBwWIbMmBlStmj6LSduuXjccDAi1ktmc+CVKDL+8LXRpCAWMr6UhDPpA==
X-Received: by 2002:a17:907:c27:b0:ade:8a6:b877 with SMTP id a640c23a62f3a-ade1a916cd9mr1231553166b.5.1749487102202;
        Mon, 09 Jun 2025 09:38:22 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade38c11d28sm452167166b.12.2025.06.09.09.38.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 09:38:21 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-addcea380eeso627398166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNw4iEeZL+G6GzAkWMoELITnP5f9wB+6EEWORQ7Hqn+T6tPAYbiRXBujGTscLljpR5YHnxk9hV2vQQrP0=@vger.kernel.org
X-Received: by 2002:a17:907:9813:b0:adb:2bb2:ee2 with SMTP id
 a640c23a62f3a-ade1aa0c2bfmr1244402366b.41.1749487100522; Mon, 09 Jun 2025
 09:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
 <20250608215127.3b41ac1d@pumpkin> <CAFULd4as4U96E17qDhpOKpxxVkcTjNq6=7O3y0Wq3XhFxhavag@mail.gmail.com>
In-Reply-To: <CAFULd4as4U96E17qDhpOKpxxVkcTjNq6=7O3y0Wq3XhFxhavag@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Jun 2025 09:38:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg1qQLWKPyvxxZnXwboT48--LKJuCJjF8pHdHRxv0U7wQ@mail.gmail.com>
X-Gm-Features: AX0GCFtR0JnIfWByijzqqZwN2P1bOJd5-w4guZ8awirUETlP8MJx_X4NvSA74N0
Message-ID: <CAHk-=wg1qQLWKPyvxxZnXwboT48--LKJuCJjF8pHdHRxv0U7wQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Uros Bizjak <ubizjak@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Jun 2025 at 23:04, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> Please note that the instruction is "rep movsQ", it moves 64bit
> quantities. The alignment is needed to align data to the 64-bit
> boundary.

On real code, the cost of aligning things can be worse than just doing
it, and that's particularly true when inlining things.

When you clear 8 bytes on x86, you don't align things. You just write
a single 'movq'.

For the kernel, I$ misses are a very real thing, and the cost of
alignment is often the fact that you made things three times bigger
than they needed to be, and that it might make you uninline things.

Function calls are quite expensive - partly because of all the horrid
CPU bug workarounds (that are often *MORE* costly than any microcode
overhead of 'rep movs', which some people don't seem to have realized)
- but also because nonlinear code is simply a *big* hit when you don't
have good I$ behavior.

Benchmarks often don't show those effects. The benchmarks that have
big enough I$ footprints for those issues to show up are sadly not the
ones that compiler or library people use, which then results in fancy
memcpy routines that are actually really bad in real life.

That said, I at one point had a local patch that did a "memcpy_a4/a8"
for when the source and destination types were aligned and the right
size and also had the size as a hint (ie it called "memcpy_a8_large"
when types were 8-byte aligned and larger than 256 bytes iirc), so
that we could then do the right thing and avoid alignment and size
checks when we had enough of a clue that it's likely a bad idea (note
the "likely" - particularly for user copies the type may be aligned,
but user space might have place it unaligned anyway).

And honestly, that's what I'd like to see gcc generate natively: a
call instruction with the "rep movsb" semantics (so %rsi/rdi/%rcx
arguments, and they get clobbered).

That way, we could rewrite it in place and just replace it with "rep
movsb" when we know the hardware is good at it (or - as mentioned -
when we know the hardware is particularly bad at function calls: the
retpoline crap really is horrendously expensive with forced branch
mispredicts).

And then have a simple library routine (or a couple) for the other
cases. I'd like gcc to give the alignment hint and size hints too,
even if I suspect that we'd just make all versions be aliases to the
generic case, because once it's a function call, the rest tends to be
in the noise.

What gcc has now for memcpy/memset is complicated and largely useless.
I think it has been done for all the wrong reasons (ie spec type
benchmarking where you optimize for a known target CPU, which is bogus
garbage).

               Linus
