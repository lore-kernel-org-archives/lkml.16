Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831DD19258E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497131; cv=none; b=Wbc+93PXN+ikYkgba+PrZJYgdw7DBsmCmAxBb/ifeTN+FjszPs6DeXgYFQEF2Z6JtWbuSWSDG5dys6FNLcQiE6HFMTfkeyEAoVyll+4W6DrvUq96F3jy5qbtP340yOct5DZ58D3bVaWQM5Q/BfTBa714NPZUGwpPxpXq3aZTb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497131; c=relaxed/simple;
	bh=ROGIqkGSA549481hDr5LI22bGKpsRWUOLhXZ3I/L+M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLKGA7CUwu/AOqmeew/Z+QHCOaIvFeeSOuh8w2U6i/t565qW/foXiWdcTZKoPJm8P7yjo1z6sAh9/hogXkZA+tTO+GcZBuuaTPyHeGXdueLjyDn9KgqSO+Xo6JdeZ/KrMJRfCZNYPrY061QW3lSGgxmKVaXsQwr0mw42ikKPFGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NrgRQGU7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NrgRQGU7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so8027112a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749497126; x=1750101926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezq94UHtUBBmYl0PCGyD1gg5hJmPe/S0PMCstXDo0fM=;
        b=NrgRQGU7/Q43uUWR0AdhWPxYGcI9DazdwbMP7VH4lm+mdCqV94Tdkn3SvAavXn0ViE
         aAHYj7HCHTn1iB5HCPWmT7ptJGIS5LDXwEumE5DAm6I96z4PJAn+vT3xQXWuzy8e0l5b
         /MAGZBu8BCsuz+nlg6Dssu/Y2zxUlnFnDvzSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497126; x=1750101926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezq94UHtUBBmYl0PCGyD1gg5hJmPe/S0PMCstXDo0fM=;
        b=W5JqCXEMmEjwkvgrQNxLES8yovUyeq5JUIoMIjWeKWnSbMZQALODohJv4+umLi8KZC
         nwZV3y+o1UhcxWyxrhK53EL1CqbXbKJ10ses+D8qUOxwDhfYCvBGJizgK+rPJ2zIrWbz
         e28srcTt7NTfIugurximSjDVWwGOqA1tB0/aPkfWx6gwkMCcnEwAKi0maPdH1UV3Wk9M
         xmWSRerOclZLsSBhJoVe1euKdp0sZbB7cCk1tSr4GMKKWsRRF8QzQ60G9pkhM+lr6x4s
         pSoGFYUT3lxOhxRZ/0ijRK7FCzoLw9TphqRmOQUk9F31v+IiLY4pUgb/YBxKslVQm2ov
         cu6w==
X-Forwarded-Encrypted: i=1; AJvYcCWnW4NW6O/f4gzTDOoZDEdvEsYlqD0tdmDzaOvBlDeGhl4wnvRdnBNEzYfiIgg53SsQjkf43w1TTKP726k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXmIvpf06rpDw3R92sReRafjKzZSYrmOkyHmWh9mgNh4XG4ud
	oPqsdtNh/9EDZnAk7ifevUG6gX4sIFcUlA2BkIVs6g4uXtE9dUU9yBQUjqRrG8k6sKvx2G4+CvV
	jFz/83zY=
X-Gm-Gg: ASbGncvPGUNJuGvtHov8j7z+y5hT6wmyomlD83uFS/elb6dBPe1JZULySIMs3s8g0xn
	zgy7pAtc3m8dXaKkHdeAvY/40xXmsWdRSaQkazYZIXwR111OTzM6zkeeFpBTiboGr5Kz2bsaZqx
	cgkCLJK1s5NCusiWPYCIrgRcqkILjw23n6ILpRKmuZgKjwJn0I1ZjcpEeozY6tuDiraVMR34tUn
	B2S8eS3RIhzspCuxXwD0WRKc/yOHpJb2VooL9yIo8L/jDSsmG2Y1Vc15B6iuTuLSxxcNzF0zrOy
	o1vSotr62Z4OOQx53Z/osflr9VOj3ueDoILwmdWvUYB7whsQgVOyQONX+h0ZqVwvvSuaXgV8tXt
	wnsSng/Z+AQfKxh/7XnBf3A1KzHCt0wdAfjDV
X-Google-Smtp-Source: AGHT+IEfHQzUNqzL5njD5QiFEjntZn9mnyDRiATEXzz9yc7S9Mk2ZpuHRIao9h4j/IZrkHWi85XERA==
X-Received: by 2002:a05:6402:1ed4:b0:602:10b6:c982 with SMTP id 4fb4d7f45d1cf-607735137b9mr11641342a12.12.1749497126426;
        Mon, 09 Jun 2025 12:25:26 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607ef848c27sm1748552a12.38.2025.06.09.12.25.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 12:25:25 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so8027061a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:25:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDhLwd0GpYQIOiGU4OQ7ygSYNvHp0BVSzuVMo5LpvMvEg0X4hRi4WgNnWRQqtwcAKsLH+m2ZMnn7RbhKk=@vger.kernel.org
X-Received: by 2002:a05:6402:1e8a:b0:607:6fd3:374f with SMTP id
 4fb4d7f45d1cf-60773ecd254mr11408520a12.20.1749497124908; Mon, 09 Jun 2025
 12:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
 <20250608215127.3b41ac1d@pumpkin> <CAFULd4as4U96E17qDhpOKpxxVkcTjNq6=7O3y0Wq3XhFxhavag@mail.gmail.com>
 <CAHk-=wg1qQLWKPyvxxZnXwboT48--LKJuCJjF8pHdHRxv0U7wQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg1qQLWKPyvxxZnXwboT48--LKJuCJjF8pHdHRxv0U7wQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Jun 2025 12:25:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_XHkR93Kx8dKrC7797nZECooAbwg0XjvjDeT1_jTohw@mail.gmail.com>
X-Gm-Features: AX0GCFu_6hgSBw3ZjExfJAsPLjCLSE5GklHTE3wZbn2Jys2ksy5XhewHAkaGWkw
Message-ID: <CAHk-=wg_XHkR93Kx8dKrC7797nZECooAbwg0XjvjDeT1_jTohw@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Uros Bizjak <ubizjak@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 09:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What gcc has now for memcpy/memset is complicated and largely useless.

Just to clarify: I'm talking about the "pick between rep movs and
library call" parts of the gcc code. That's the part that then ends up
being about very random choices that can't be done well statically
because the exact choices depend very much on microarchitecture.

What is absolutely *not* useless is when the compiler decides to just
do the memcpy entirely by hand using regular mov instructions.

That's the main reason we end up no longer having our own memcpy
inlines and helpers - that and the fact that structure assignments etc
mean that we can't catch 'memcpy()' in the general case anyway.

So the whole "I'm turning this small and known-size memcpy into just X
pairs of 'mov' instructions" is a big deal. That part I love.

It's the "call to library routine or use string instructions" that I
don't like, and that I think the kernel would be better off picking
dynamically at boot time with instruction rewriting.

But to do a good job at that, we'd need that memcpy call to have the
string instruction semantics (including, very much, same clobber
rules).

And I do think we'd want to have hints as to size and alignment
because the whole "compiler knew about those, but then turned it into
a single special library call so that we can no longer optimize for
small/large/alignment cases" is sad.

So what I'd love to see is that if we have a

        large_struct_dest = large_struct_source;

then gcc would generate

        leaq dest,%rdi // or whatever
        leaq src,%rsi // again - obviously this will depend
        movl $size,%ecx
        call rep_movsb_large_aligned

so that we can take that target information into account when we rewrite it.

For example, on *some* microarchitectures, we'd decide to just always
replace all those calls with 'rep movsb', simply because the uarch is
known to be good at it.

But in *other* cases, we might only do it when we know the copy is
large (thus the need for a size hint).

And we might even be able to then turn that

        movl $size,%ecx
        call rep_movsb_large_aligned

pattern into

        movl $size/8,%ecx
        rep movsq

on older architectures that do better at 'movsq' than at 'movsb', but
have slow function calls due to retpoline crap.

Admittedly I don't think anybody has the energy to do those kinds of
bigger rewrites, but I think it would be good to have the _option_ if
somebody gets excited about it.

              Linus
