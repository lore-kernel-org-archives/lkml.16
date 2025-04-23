Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED01A257D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425174; cv=none; b=u00sKvl5oiTrfx0fYxda7yNAKG2dtt8rGdAiTyudnDi+ZBaxp2VSH9RjJK3aS52QXX8UTn7WR0OgTvymZtQFt99oDGreRS+4377hycdJIkdFtSfuQX7qOyaYiYLfk35d+EdHJrBDeTjpjHLiKqXDGbJ/3mcYUQEar1iB/WLmbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425174; c=relaxed/simple;
	bh=XmZEkn0ul5hNXEmlOHIpqhwTFOLqsm7420yfmjeIlTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMDa5V5r+E9XDYH+Kj5WBUtYHrxPhg2x3072Ph8jeHLNSXhudM8eZJNKWn2UFwIRlpr3Q1d28eMzW6gfiYct0kEft4vQGsnXPwpvubPiPp2gO0K07+Gw9gZwN8QiFdSvgWKeGP5p/NUfNpSD0bvgpRWd4mMJkdb0ZmCMNLqf5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sR/qlrQ7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sR/qlrQ7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so17105f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745425171; x=1746029971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4rFgjxIharj9Xc8JlBDotrcNv24G6/zveAQBUamBQU=;
        b=sR/qlrQ76MsEaJULuF0nZ/pxVCA7t0aoWiXckdoLX+k2t/t6HH9iXS2bD38avoSv5N
         gSVcWXUHJIVQ63El0LCwDlR/qcCjPJK0MGknque/qXZCsp+kzoiL6K08A0H/B39Cc/tx
         XWKzOKmaQBl4bxMUKJ9Q6kw4ymXVzKWSE2NqzNqV/DjNUIuqT1gsg/bUM/1NZXAOj51V
         o9jdUeZW6Pjmzf033yP/kWKzJhQDNJT+w7QgVX0abyRl8VTlHM8WW/ieFnMBSuI24BF2
         mKIQ54P/rBFFo+ukXJ1jQVgPyfxaJ9BJogzQbK74O48GXarn204lIIYMYT1W6znVb8Pw
         UHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425171; x=1746029971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4rFgjxIharj9Xc8JlBDotrcNv24G6/zveAQBUamBQU=;
        b=Pxhfp0xNWiD5ksJnVbcC/HZGsd2e6ifEiKOV9NL3muwcNUaI/3PjPcMmsQHOSa3ypS
         Cy23Wi4S/KnNI/1c3D6euH1y8KYqVchZMHs6g3CIidAI+6pJkRIr4/KO76+IUrvyiWtS
         STZzjjqI+fHjy2IHc29Gj43b3hkiE7q9+xWAJnbS0DgPldhwIeSUO5aCUuhL8L0n053m
         UpPBeBMaBDZNCnVvcLIQA0e5LiyLphJynAebZOoJxAX+fVLd1NKMOKIvRu6tlh1kuUU8
         nGn99bTL/RXChgd+26Yy9SGCNjBgA0nZEZ6rk8eTr+T4V/OqbmOJhI/4BT8DyYm9EjT7
         leCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUjc+QVF6eId4xTzIFRKy9QxKkWo/ZR1VhFq/yGszbg8C/hYCWLRskSC0+13yYjaskoGKB1AyrzpZYjII=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRsyyq5zec6/SP4tnunxCaYBp63o5Z3PSm3CKhd/GvXMA5KrB
	lYngTz49WYzmJwQNfkwckBND1T1qXlkp+Kv6UmbEb7yKXphPzgdm75+R1+PY6T/L9/tGnbUBCFa
	2KyvhanHcfB4ZR/B3v4XcSx9372UPDr2MVNwE
X-Gm-Gg: ASbGnct4VWnyPRCOi6iIRLqmRkZ7q/HRvAl6WWVwD8VQz7+qaxSFmlX4wLaZw320p22
	ulhFtaLUBvFuxQUtsgilHttDfGptbKX0+jYLssa/l6VRlJFBgEeDekLDItN5xkPGA6FGShACctA
	t2+OQvabgqc24oeEzBc/sNISF/mTjya+29Cu0b7BWfNkWQptktqQ==
X-Google-Smtp-Source: AGHT+IG590+y01b0chDZEA4yAMJcZGcW1CBs38QddUTsn4DfNyPryXxPtu0XdvVkqBdNDyISz4KjtAWk95eMAqYYBUM=
X-Received: by 2002:a5d:47c9:0:b0:39e:e588:6746 with SMTP id
 ffacd0b85a97d-39efbb240e7mr16410516f8f.57.1745425170663; Wed, 23 Apr 2025
 09:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <aAkKoQQH0t9KtIxD@yury>
In-Reply-To: <aAkKoQQH0t9KtIxD@yury>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Apr 2025 18:19:18 +0200
X-Gm-Features: ATxdqUGRSubP1f-9UI5OiVJeVeWHASWxdC0lfG-4i7MjMjV_XFa5zz5CjPxUsys
Message-ID: <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 5:43=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> identical, and ignoring the former.
>
> On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > This series adds a Rust bitmap API for porting the approach from
> > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> >
> > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > and bitops operations. For now, only includes method necessary for
> > dbitmap.h, more can be added later. We perform bounds checks for
> > hardening, violations are programmer errors that result in panics.
> >
> > We include set_bit_atomic and clear_bit_atomic operations. One has
> > to avoid races with non-atomic operations, which is ensure by the
> > Rust type system: either callers have shared references &bitmap in
> > which case the mutations are atomic operations. Or there is a
> > exclusive reference &mut bitmap, in which case there is no concurrent
> > access.
>
> It's not about shared references only. One can take a mutable
> reference, and still may have a race:
>
> CPU1                            CPU2
>
> take mut ref
> bitmap.set() // non-atomic
> put mut ref
>                                 take mut ref
>                                 bitmap.test() // read as 0
> data propagated to memory
>                                 bitmap.test() // read as 1
>
> To make this scenario impossible, either put or take mut ref
> should imply global cache flush, because bitmap array is not
> an internal data for the Bitmap class (only the pointer is).
>
> I already asked you to point me to the specification that states that
> taking mutable reference implies flushing all the caches to the point
> of coherency, but you didn't share it. And I doubt that compiler does
> it, for the performance considerations.

The flushing of caches and so on *is* implied. It doesn't happen every
time you take a mutable reference, but for you to be able to take a
mut ref on CPU2 after releasing it on CPU1, there must be a flush
somewhere in between.

I can try to find docs for it ...

Alice
