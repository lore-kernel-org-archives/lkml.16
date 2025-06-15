Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060F527BF6C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 19:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750016272; cv=none; b=c5k5oo/C2iB2tYGkvLoJPeCSFxPz+R8Y2P7kK8xlmzxCqMJAHA7+7zxDwJgn+wDdQ/1akzVnbMMV64HNJ1Im9eQUlzXnHaEFAdKH/QKh+RVxi0eNxP2F9qSg0TqmtIAlnup4E/RWi/djlFv9XAVXYy7HjHhZgvgsd5CjOrQHts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750016272; c=relaxed/simple;
	bh=+DdLJhNZpkF0mq6V6riPNHi40jkfNk/Fbp6sB9glqNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L71IYCoq0SKhqqmflUv1ues12EfuGNvy9/nv0eKSfLOUMGeLLvA2bzaj5PfmnhtWauKXSaTqZ2xwaDzVSoY9KbxP0dkc6XEQwTnNuazYrXjmSZG7y2xuASkdyPCfQUKzmetCPoElhtCNCl3RKJ41N7YH5aFW8xR/XqQaQpM+NGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XbbBwb9x; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XbbBwb9x"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade30256175so736759966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750016268; x=1750621068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=XbbBwb9x0ravc+f0FvEQyaH6KRw5Ql9+dOM9gOA809dtqSMOXCwW5EvXmP7KOwndAi
         AF+w8TcehqMCjC7Lg/VfoRGzblQxJx/3L/STaEeHvNnZp101vIzLP5RvCtxaH4/FLmi4
         6l6OnahKKWc02zjXcar7rVlr1Y9VzdtjAbPk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750016268; x=1750621068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=AOukvbvo/mXwcmLwl6Waiala/nLnbFdBUfmJSX6uUqHxogdT9KOhh7RpyVgg/yPjhB
         LBmtJRHdvTXeX3c1P7bGJGUHtWgQwC1IGDpfKjb1b36PxgKaqcsUiZDYDZFon9+d6kay
         w7onZObk/w0/DHE6Cx7+rftnbQ0nunMT5JHJBWvPAgLAbdoDg71PF1LFpLS0Q3qZv03S
         MsCNTVtcCjOCrEaJeOx9hSPY2LzrFh/rCcc4ND21q2AIbYLBzwVxxq2aTyr49grgXhbQ
         pjcpzJt8Q1Xs72DU3Lc20mlUghJn2Aoav0lheLXGI2prSJG3Mv6upHpyCKQ8PnSvGgzW
         HZYA==
X-Forwarded-Encrypted: i=1; AJvYcCU223NfzIwq0Mb0o287QaQLUSMNso81mVBdBmLzWz9RYKkh9bAXv0a2gsi00MVnwCI5skF/nw0OHT1PpZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytYMPGhh486xhCAnCPkAKe4sny37akncKH2UI5R3M7vfW2n8xO
	fIHthEiZs/tqZidfzewDYvKFM9bFNhiIWQx9NV+Os2AEKjUxpeBj/r+vzfybiu4k+wnQeAoxGAh
	orTK+KyA=
X-Gm-Gg: ASbGncuT/rcHcm6WZyet9Z73PcMh3E5SlTgSaytyJoAPd9dLOzLEgHpobkw43h/9UwE
	rHMpdwb614wRXQ4ZRbWi4G8V1oFoDhniC+QuiRGh6Xrt+8+kvi3QXWnzB2rRheVu76sFpV6pAnb
	4vc7eMzG82vEojkDpi8ld/qV0GFpllLZmOqmqHKRqRBPikk33ydYKRsXdcQ1zhMXyQ8xUTqWozV
	I9WSyLZxYWtZRgmZtSWzIinqpsAI2I+r8W2m58hHPgusHbyqmAFPrU80K7WO2Yq4jXiMpto50b9
	2FOe+LY0K7eO4eZufCjnba540x2fyhj3wj7+T4TSz70UsAcAEfTyjdLmhGIlOt0CBZHnUyMxOs7
	eLqiZcoImvgh40vwDg5sKue55DVU5I3mBMpIX
X-Google-Smtp-Source: AGHT+IG8QjHt6hI6ecdkQ+sWIwEaGAJDhYbJeuPL9Fsr5uDbJ7VXhiGYY4Glpm7fTv+aCREJ+itfhg==
X-Received: by 2002:a17:907:3c94:b0:ad8:9909:20b5 with SMTP id a640c23a62f3a-adfad4b7cf4mr650276966b.56.1750016268181;
        Sun, 15 Jun 2025 12:37:48 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8929e07sm528504266b.131.2025.06.15.12.37.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso7898772a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgmTzKmNkDnkJ8T+egSihddCqJrIHfCUbWGRUhtqQsryiwqd1nEuHYj7CleUB9/vX6gnFTnrqwBcxeBvU=@vger.kernel.org
X-Received: by 2002:a05:6402:50cc:b0:5f3:26bb:8858 with SMTP id
 4fb4d7f45d1cf-608d09a2d16mr6285703a12.34.1750016266135; Sun, 15 Jun 2025
 12:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aEjo6YZn59m5FnZ_@gondor.apana.org.au> <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au> <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol> <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol> <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol> <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
 <20250615184638.GA1480@sol>
In-Reply-To: <20250615184638.GA1480@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Jun 2025 12:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
X-Gm-Features: AX0GCFsirgA8Ga0u26X0ToUgNd-a86j5gL8Na8fIUJo1Hy2_joO0gogaJwm_iSM
Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Jun 2025 at 11:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So yes, QCE seems to have only one queue, and even that one queue is *much*
> slower than just using the CPU.  It's even slower than the generic C code.

Honestly, I have *NEVER* seen an external crypto accelerator that is
worth using unless it's integrated with the target IO.

Now, it's not my area of expertise either, so there may well be some
random case that I haven't heard about, but the only sensible use-case
I'm aware of is when the network card just does all the offloading and
just does the whole SSL thing (or IPsec or whatever, but if you care
about performance you'd be better off using wireguard and doing it all
on the CPU anyway)

And even then, people tend to not be happy with the results, because
the hardware is too inflexible or too rare.

(Replace "network card" with "disk controller" if that's your thing -
the basic idea is the same: it's worthwhile if it's done natively by
the IO target, not done by some third party accelerator - and while
I'm convinced encryption on the disk controller makes sense, I'm not
sure I'd actually *trust* it from a real cryptographic standpoint if
you really care about it, because some of those are most definitely
black boxes with the trust model seemingly being based on the "Trust
me, Bro" approach to security).

The other case is the "key is physically separate and isn't even under
kernel control at all", but then it's never about performance in the
first place (ie security keys etc).

Even if the hardware crypto engine is fast - and as you see, no they
aren't - any possible performance is absolutely killed by lack of
caches and the IO overhead.

This seems to also be pretty much true of async SMP crypto on the CPU
as well.  You can get better benchmarks by offloading the crypto to
other CPU's, but I'm not convinced it's actually a good trade-off in
reality. The cost of scheduling and just all the overhead of
synchronization is very very real, and the benchmarks where it looks
good tend to be the "we do nothing else, and we don't actually touch
the data anyway, it's just purely about pointless benchmarking".

Just the set-up costs for doing things asynchronously can be higher
than the cost of just doing the operation itself.

             Linus
