Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB62561D4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195918; cv=none; b=Vpkh/G3viA9ybI2mAItiYSQeTUkt1aa1nAdbIiR+x0HAVvpAgY1OVwFDs+M2pRThdF+8cPMXc0nCZ4C6GgIcy6LYxnm8gtJ4ODrqH8/krNte2fBjrRW63W6EWO3p/FqIp3GTfJri7yNjj6q+Yocg/7ZwGFOAcEGzs+q3Lna4cig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195918; c=relaxed/simple;
	bh=pZiBNnXScMp3E9/IldgcA1G8EwAbt2ClXdhVjdh0vsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj5vejDJuFEJ0WX8rn0s/SZE/+GoFCtT5WGg8ztz8j6F5U2Nn15y6kJ83GYr05FzlXeEH/8ST4eSXUu8yuqr9Z13/xKiY8zpi5CcSYt37z3fVJP9OuY07mW4y4E4awPsSgVzraKyt4rDT0o8asigDJO5dWx7DGcmhZhsTZ3Vn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F+KQfspf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F+KQfspf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so15400405e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746195914; x=1746800714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu59r6iefeoLBHCzuL/MfPfrNdxjLabvpRWZs+2IYlc=;
        b=F+KQfspf7u77e10lwO/NfAFvUsj8l1OpuHolzF2Vwr9j02YUuJ9MI7iVImyWjfjkqw
         m8pitfCnge2w9jKm+sL/35NqmSPik51PNG9Vm6GgjlTvmsOZWCN2LEFauIFgLlE9hgkt
         Q12S10YGpqoJa3b+me1DWr8zxSet1t/iHlYGzUXKk4S0KCz4KnI/KouM07rwhq73mlYy
         PiE0Eu890l9/FcX1zSGtbeEiKiyTC6p/JGwlqvHn6KFPrYDI4/8RjrTi656tkoEbV+zV
         qTWMf/LOAZa5Tl1kqF+DMLFNNpgtLuUl4WdJROXsDi3z96zpqG5c6Bd4kEaCFnWJh+41
         1Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746195914; x=1746800714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu59r6iefeoLBHCzuL/MfPfrNdxjLabvpRWZs+2IYlc=;
        b=LPHUC3V6H24OpZ5shUcQ76zt+ANNLhds8VwKDKUL5rc7DN8yMaBH3QwrRaKlDgAHeK
         tXJhMlV6W1Wx3gKwCjEe4B2WCMsJTOAhRKw8EZkF0ZOpCNi9aKJdBgNYn40zzIBhPuVN
         37EdYwaevyG+A03cTsL00wHybN0PElqPyZQ0uGpscEDuO1qkMOTQJZ5p6orGElIb5Wb1
         dASDelAwbCVAKxD9AW9iAvQux5HXpDglUd2Qyhik07kXunM+xQ1DrzQlt5LcUI8ZoFUW
         FWhamsg0K4JhHCocSfj84X4FhYkotSoHs9z+/8E24ZD6v2Z5z8OsVvouVogdZ8ydQYn1
         THwg==
X-Forwarded-Encrypted: i=1; AJvYcCVf7ldkUh7G3JN6hXa60GyXEEHYiBqm6Vnx5qZf5H+9x0G+LJ4YqywNZEOTFZFrbie6TRAA4vBYlO9BqPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyojUZ0x3xofC3a2MRrQIMTEAwmIaExieKu/zYb626vXJolcrsx
	JF9aMNeJREi1VMzFHBLQvx74N5uQSMMYI87ZZP48YZGSmbEUvtvWBQHWaun+09NHYz/W+y1Jh+K
	8HK5jiFBTcD7QXRARLmtGnwzrIF0qIEypW2ct
X-Gm-Gg: ASbGncvUdSugWtcC973PdngorMj2psz1LtcmRnEs4m64Qk3s9oisACxMDXHa1lRyjkT
	HkdEL+z7LkQK+X+z6g4kKQetHfvbi217lUjv3qnfDmGQWfDhapIDlmPc8SJWCQ8leI0M/O4Dj//
	qKYKhYsWyd5WTUVcbbJTZh5+9vCbZ5tfKK5cc/9dfS/+b4SdMBpKlX
X-Google-Smtp-Source: AGHT+IFTjZNIP6o7h/dZQijToI2run4ejVfB90Ph5WJVLHThqb5+e9AlNbdGW6bwMuuKoIFPpuw9QOIrNCZ/k2f/Z+o=
X-Received: by 2002:a05:600c:4e94:b0:43b:ce3c:19d0 with SMTP id
 5b1f17b1804b1-441bbf37ee3mr19188215e9.29.1746195913687; Fri, 02 May 2025
 07:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-3-06d20ad9366f@google.com> <2025050215-affluent-repair-3bb2@gregkh>
In-Reply-To: <2025050215-affluent-repair-3bb2@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 May 2025 16:25:01 +0200
X-Gm-Features: ATxdqUHXTqzj3xFcMLp4GpQyeiGgIcTa4-2q6U_k0okz3GEC0avAjIuy-4AVioA
Message-ID: <CAH5fLggG7Af0ZBjhMLuSOX8FNGepeo8eEO77dcN3JSohog0XtA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] rust: alloc: add Vec::push_within_capacity
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:07=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, May 02, 2025 at 01:19:31PM +0000, Alice Ryhl wrote:
> > This introduces a new method called `push_within_capacity` for appendin=
g
> > to a vector without attempting to allocate if the capacity is full. Rus=
t
> > Binder will use this in various places to safely push to a vector while
> > holding a spinlock.
> >
> > The implementation is moved to a push_within_capacity_unchecked method.
> > This is preferred over having push() call push_within_capacity()
> > followed by an unwrap_unchecked() for simpler unsafe.
> >
> > Panics in the kernel are best avoided when possible, so an error is
> > returned if the vector does not have sufficient capacity. An error type
> > is used rather than just returning Result<(),T> to make it more
> > convenient for callers (i.e. they can use ? or unwrap).
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > +    /// Appends an element to the back of the [`Vec`] instance without=
 reallocating.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The length must be less than the capacity.
> > +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
>
> Why does this have to be public?  Does binder need to call this instead
> of just push_within_capacity()?

It does not need to be public.

Alice
