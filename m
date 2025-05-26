Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A45433B3
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269364; cv=none; b=iEVKtE5aBIdRJ/xAAf4hWl1rjWN2MmUfgFK186IppfBOVz5h/jS7d03tBYSvNSSIPRtMAhGAi+QUYQgy3GnMb75mbEBLaVM38gyvPleJEUoOKHcYmQpz23sBjlZ65hqkQbps82fKxE0c20EDQVTT9zHow8ljA44hMwc01dkYKeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269364; c=relaxed/simple;
	bh=ozdZCu4sbeFf0TUaBG2zQu930/uOGL2LDeITT9iP378=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdkQKcH88cGN4n48Umk8t8gzKphKiW5W3tps1LUyjqquhSc1bup6FUyMZcHLnQ5BNe0sn5g+kZSep4WoEuOa38oJ+gJCkJWCY0x/Ne75pG8IZSAOTX9sGeB0R/iJPObNEYUD9xusrgHuBX1iyRw7xQ1lL9XaIZM9im0ffjy7iW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CbMxnNXp; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CbMxnNXp"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2cc82edcf49so466741fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748269362; x=1748874162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozdZCu4sbeFf0TUaBG2zQu930/uOGL2LDeITT9iP378=;
        b=CbMxnNXpdH7dcuT163alnLe+DLlw9R0OWw1VSkPj3/lZcaEPAdUX+K2zMLv9+6wgy8
         CJvLuCs6msm0CL4MYeEfiyq6fxoM7/dQa7ueXtHGffoLLLCmnGpL7bfDSLnYGQqNWyxi
         4IUzqqF49IoS3OeK/cm+uRANpljL5VyoAaNW02z8cqFilm62ivL+/A2mlz+zt9LVL7A+
         CSZ17Q5iAJ4vup2jJMic+W19M7zf6s9AIgYozGiQn2j6meSIBglgbqYsyqpXtvofMH00
         /0WB8AmwKkJVhxNQqIwDyN+KjROGKIUIHJj09w4goMQMlCCoQqyt+gum6TI6FvYoZ+XP
         fnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748269362; x=1748874162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozdZCu4sbeFf0TUaBG2zQu930/uOGL2LDeITT9iP378=;
        b=QQohzeThtfFu4utUw34LGt/2pVlSZyAM1tJ0chvUQFfs8Uyg1ZH6/GMQUmKq56uXpG
         TPuvi34SHyyCVNb3M5gFSvudgmJdR9dvewJ5RAbFCAAWqmveqHTBR67+/LL2DMjXWl+E
         7OIdb25lEm0h2P3tpROfPLh4u3vrrm/lj6WBP5n90ibCZfapLW1njWOecuVJlzs741Sd
         xQBgeXDkRilnPfZ8wIldEHrEkTH58+JaU+9VV2L6xXCB4/qAWwgpQavk5yIPf0Rgya/P
         eQCi8JJXv7IXziTaakm06Nk7lfDCFNeLa0E5H4vSXSbctVhb6umjnOotwC7UAUsej45b
         5lCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0CKz/ujV6i4+B5WJw86SeEBhOqnmspX8NHB20cJ5dsyqC0cBHXqjwP3ZObBJkwrEfbncwi4/Cuu+CM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBVFUMIrb5TS4Ce4QmMQak3NCyr7+8aWVJrW/LqBHoSmv3F6/E
	wFxCWpAdGGf5xAHM61SHj1G1Dle5X2ZgvwO7tF85T7VToK+F9pydHs2itDXzGY1YqBBG3Yr6bl7
	ST9l8DXP0Mvvx10//2YDBApMFvB9CPygmvqY9G5S4
X-Gm-Gg: ASbGncvl8va+1Sx0/y0lNAkE9F86GJcqZmX/M4ZNhsyEq/rorOY915oCW83hP4sei0B
	8MuVXFI0PbqPZYEx+euvYH1kchrcR2IQF8c8ObN9OKpoX/tjy4SuBo/aa4Wjju7XMrVPlkX+92l
	mUa0hSHBl1xZ5zmYdxwr487RjSLHk39fXiDHoCCBVAkIpuSbUERadOJ4PyodouRDzVDUdM4nU3x
	w==
X-Google-Smtp-Source: AGHT+IGgbU7dY/aYiuMiK0TQSXjmB1sIYr/LZnn+GBvw6EcrTaqiOABq0t//pFIO8AAy4IdCBf27PJqhqe3BHFJ+79Y=
X-Received: by 2002:a05:6870:8894:b0:2d4:d07c:7cb2 with SMTP id
 586e51a60fabf-2e861e5ef24mr4321746fac.11.1748269362074; Mon, 26 May 2025
 07:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
 <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com>
 <682bc528.c80a0220.13f632.9ec0@mx.google.com> <aCvTYHMtuWZZizn9@yury>
 <aC1PQ7tmcqMSmbHc@google.com> <aC3aOHWEGzjjDNgb@yury>
In-Reply-To: <aC3aOHWEGzjjDNgb@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 26 May 2025 16:22:29 +0200
X-Gm-Features: AX0GCFtaK59XKWVw-zjdUPgLjtmA8XtEQrH2zT15JLsncpG05JyCsu31b_JxoI8
Message-ID: <CACQBu=XmC-9OHSHv_9KP88HpV3Ei83gmNmy-B8DAfbtipKmyLQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Yury Norov <yury.norov@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jann Horn <jannh@google.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:50=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Wed, May 21, 2025 at 03:57:55AM +0000, Carlos Llamas wrote:
> > On Mon, May 19, 2025 at 08:57:04PM -0400, Yury Norov wrote:
> > > + Carlos Llamas
>
> ...
>
> > > Carlos, can you please elaborate your motivation to switch to bitmaps=
?
> > > Have you considered rb-trees with O(logn) lookup?
> >
> > Yeah, we tried rb-trees. There was even a patch that implemented the
> > augmented logic. See this:
> > https://lore.kernel.org/all/20240917030203.286-1-ebpqwerty472123@gmail.=
com/
> > IIRC, it just didn't make sense for our use case because of the extra
> > memory bytes required for this solution. The performance ended up being
> > the same (from my local testing).
> >
> > I'm not certain of this but one potential factor is that the rb nodes
> > are in-strucutre members allocated separately. This can lead to more
> > cache misses when traversing them. I don't know how applicable this
> > would be for the Rust implementation though. Take that with a grain of
> > salt as I didn't actually look super close while running the tests.
> >
> > I would also note, this whole logic wouldn't be required if userspace
> > wasn't using these descriptor IDs as vector indexes. At some point this
> > practice will be fixed and we can remove the "dbitmap" implementation.
>
> Yeah, I expected to get this kind of feedback from real-world testing.
> Your reply to the patch you mentioned above answers all my questions:
>
> https://lore.kernel.org/all/ZwdWe_I2p3zD-v1O@google.com/
>
> Let's stick to bitmaps unless someone shows clear benefit of using any
> alternative approach, both in time and memory perspectives, supported
> by testing.

Thanks all for the additional context.

Yury, I've addressed most of the comments.

You also commented on the API. The weirdness of the API is all due to
the separating "request to shrink/grow" from allocation.
Since allocation can happen while other threads may mess with the id
pool, one has to double check that the request to shrink/grow still
makes sense.
Dealing with this situation is required in the Android binder context
where this ID pool is used, my understanding is that one cannot
allocate there while holding the spinlock.

In the next version, I have renamed the operations to make this a bit
clearer, and made the comments a bit more explicit.
If it's ok, let's move the discussion to v9 that I will send in a
moment, I hope it clears things up a bit.

Thanks.
Burak
