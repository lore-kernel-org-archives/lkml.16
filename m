Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53B14831E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138266; cv=none; b=oTnV9fT1muqaXl9SRZ3YQLIQOdVXXgp4sYXZchCgWOMtXey/55OiWc8zPfSSmlb6ZkfRq8ZC1Nr/LdlRIlWnJqdEn5JYx1rd3+Vsxt2fOFMTat3++ZkUPpE9C3pG6joptIh2TjCW2M9xQjbDYM3BXSFFNofM93Bb9Llq74pNs+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138266; c=relaxed/simple;
	bh=1+PgwKYMyy1Uyiun2YPAegNy7jG9rxa8lMWSf+KF3FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogN0XlUUzJlif3CQqrEDNiU8nFFaKwRDAURLINhfWWKungm0bEdegtocOzEJzpDd7cYXwlXwld7ph8u/nVCy1e8WAYmzltvHiECt+hHwv5zXLESos+OdFbYbpaD2490ZAqkrvXRyxFURpDGsjKr5aoHNkst5jFIdBRTj46taPog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F70eEiOv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F70eEiOv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab795ebaa02so355640766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 13:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739138263; x=1739743063; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A2PLT/XZrOM9Aa/16QfAGDi7D1uHeStXqgrW7NE/z7I=;
        b=F70eEiOvWAYhYMI4F9q4NK/oinSroZ8hPrXWN+2epoCKi8yMoZx/esJpphQFUQ7b1t
         8oo6mkUA6R/QG10SwrGq2d4vaNDx6ZKCUsd8OFjJUX2PnaQIpPU6Z650ui/zYx27vRcW
         jGwYG3x/uKxmMPEyqiFHBiV9PZqtkL055ETtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138263; x=1739743063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2PLT/XZrOM9Aa/16QfAGDi7D1uHeStXqgrW7NE/z7I=;
        b=q10NcZ6iQrfj62raFcuCu5nDmm/16/Xg71XHZtTVpaWStlAaMHsCZ95C/s0S3axYPx
         IB873OOnZOPrlZkxDiqWDSan2GOdAHr/PKpQDeFW7tIydu8kqkIOaSy9uoK8Hds8aw+T
         NnC4zUsLsBY6xho+17OMkrCl05kh4D/6XGWJN9wNiSq2DMgXF8/MlM/bu0qqE4pm5kvH
         DOalpnGXMrlJc6dTh7affV0ke660lXPyves5uBohBJ2gikmTV+hVDZTn5j5IBhPIKLkU
         QseKvvNl3jZaYn8895dyVCd3BQBY+lELXTtakeRgCj1w0kLAhlR9GDKt5kscFOidp5YL
         jEtw==
X-Forwarded-Encrypted: i=1; AJvYcCXEP0qQdNDSpB9VQvTECA6hk9k+Nn2o6vWPH7w8KN3qxhMD3iRUyeXZdVb403b4Wm+dN54ax80ZA+qPxQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXbAbaoGSSKUZrlZ/UCjCM3PXU4Q1FdQK9kUwP8HVurTQI62j0
	3AJN2GI4hGMX1zzax+P/yjQyZVnwn4mKfoAdzIRTNOFuc2/f2SnxBrACHAYZF3rsNw9iGK+g9ic
	aPTQ=
X-Gm-Gg: ASbGnctymgxtBpcjB/nEhXqJShEo8McPrGPR31tfUCJm/wMI3tejmJ25sW678yBDA11
	n9Jxd5TCU2LDY7AiCPT9oUMz5rrAM0W/vvK49PY+Cb/jyQNbYvQl3szH72tUR6oag0hGzuUpRHI
	mK7UwjD3mZJvdIHdgkUEADkgot8hAgY9eWUUTOTY0+YiDPHxZB/tFRgzke/fKnNbj52ifBkTKdE
	7LLeM6/hFJESwZqWSx3b2T3dgKZ30JssWrKaIKxryTYVMJCRDFMZfrIV2cq/JRZyLzaab9anTaw
	9WjNCiwgxwNJc4nIMkTD5j+ifNHKq8MVqOvMvUvk5U0kOjna7bsM+ckGLVFwGeAcQQ==
X-Google-Smtp-Source: AGHT+IHIgAtqJ6QfwZaMPoqxIFlDpaUQBPN1m6mI9gBGKC8YrPPvSGkVl7Zh25faauPtU0nA0zNqDQ==
X-Received: by 2002:a17:907:94d2:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab789c7735bmr1154319866b.56.1739138262696;
        Sun, 09 Feb 2025 13:57:42 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7736439bbsm733808366b.162.2025.02.09.13.57.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 13:57:41 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5de51a735acso4131288a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 13:57:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZMCjG5wyMwnNYGVo61T3yJ7OlnYsUbmQgaZMitKODp+12zNnQLo/E4hnApfIzrETci6UY4LUsH6dIWTw=@vger.kernel.org
X-Received: by 2002:a05:6402:4608:b0:5de:42f5:817b with SMTP id
 4fb4d7f45d1cf-5de450b1c5dmr11409992a12.31.1739138261105; Sun, 09 Feb 2025
 13:57:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209191008.142153-1-david.laight.linux@gmail.com>
 <CAHk-=wiQQQ9yo84KCk=Y_61siPsrH=dF9t5LPva0Sbh_RZ0-3Q@mail.gmail.com> <20250209214047.4552e806@pumpkin>
In-Reply-To: <20250209214047.4552e806@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 13:57:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSnNEWsvDariBQ4O-mz7Nc7LbkdKUQntREVCFWiMe9zw@mail.gmail.com>
X-Gm-Features: AWEUYZlCxkYto5CUq_vVIa6_VQHZVTdppz3dRgjcGRBwEP6eBd4ulJsXEl4hnJA
Message-ID: <CAHk-=wiSnNEWsvDariBQ4O-mz7Nc7LbkdKUQntREVCFWiMe9zw@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86: In x86-64 barrier_nospec can always be lfence
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Andi Kleen <ak@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	kernel-hardening@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 13:40, David Laight <david.laight.linux@gmail.com> wrote:
>
> Any idea what the one used to synchronise rdtsc should be?
> 'lfence' is the right instruction (give or take), but it isn't
> a speculation issue.
> It really is 'wait for all memory accesses to finish' to give
> a sensible(ish) answer for cycle timing.

No, even that is actually very different.

What happened was that 'lfence' was designed and documented - and
named - as a memory fencing thing, but the *implementation* of it was
basically about the front-end pipeline.

IOW, ignore the name or the documentation. Think of "lfence" as a
"this stops the pipeline until all previous instructions have
retired". Because that is what it *is*.

So it's basically a synchronization instruction *regardless* of memory accesses.

Which is why it was then used for the rdtsc serialization - it
basically says "don't *actually* read the TSC until you've finished
everything you've started".

And which is why it ended up being used for speculation control, even
though the instructions it serializes are *not* necessarily memory
accesses at all, but things like the address conditional that precedes
it.

So the speculation control use is literally "wait for the previous
conditional branches to retire before continuing". Yes, the
"continuing" tends to be a load, but that's almost incidental.

> And on old cpu you want nothing - not a locked memory access.

Well, back in the day, those locked instructions did the same thing.

> I couldn't work out why __smp_mb() is so much stronger than the rmb()
> and wmb() forms - I presume the is history there I wasn't looking for.

So on x86, both read and write barriers are complete no-ops, because
all reads are ordered, and all writes are ordered. So those only need
compiler barriers to guarantee that the compiler itself doesn't
re-order them.

(Side note: earlier reads are also guaranteed to happen before later
writes, so it's really only writes that can be delayed past reads, but
we don't haev a barrier for that situation anyway. Also note that all
of this is not "real" ordering, but only a guarantee that the
user-visible semantics are AS IF they were actually ordered - if
things are local in cache, ordering doesn't matter because no external
CPU can *see* what the ordering was).

So basically the only memory barriers that matter on x86 are the full
"smp_mb()" that orders reads vs writes, and the ordering for
non-ordered accesses used for IO.

And then lfence is basically used for non-memory ordering too.

                Linus
