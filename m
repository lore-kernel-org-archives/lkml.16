Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2B3C0C;
	Sun, 22 Jun 2025 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614549; cv=none; b=NV+0M968SkJkbOlEYq+vzN1N2YISHuYSMQYiUzVfLGLBYtMqrO+V9iIdKRW7yWjP3nhyyLBp7nnSt188zH3JlGNQ85Ng4ZWKe6LHcB29n4Ch4mPHY3UM+v3+k0FU/5pai3HwxQNKP5mITSObFSy4+SXAB+yBYL65AHmJYLcDLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614549; c=relaxed/simple;
	bh=MiIhk1lJ/smOXSAgzqsoAlrky2zGHGKkSRt+I1InojQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGVcO43sYgzGEalDuC8zq5qDJCAxtqtHHjKss1vivGZEyYMisg5P2OnUuUARIM2QMLn9qapdsUzkllwLeJ5k/OkRooZ4ISPaCQRVozFCKbjoa+yuluKQJW93nEwMkJ09UPBxHl0+0sCMKnRvJ5jBGKJ45JgYQnEYqEU5dOO8ZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcIxSGXc; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcIxSGXc"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so36861091fa.1;
        Sun, 22 Jun 2025 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750614546; x=1751219346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzmeehA5lQTLgvc8ARVJ5h/x37pM5IS3JJEp3oVKKu0=;
        b=JcIxSGXcLjBq/soZtaSoi0T2A8ZczyvS52xx92wacGrVp/eJj4wmq7l7UhlaSSbnR3
         F/3Ykc3EnMqkkQOFHt5/2axaRontVgfh0S2tGOUulXuWcjgKb7OnWG/Njw/HqITmToTu
         oTuW9oVkQUT3BnY+llbqY3AUPVRZTPdb7MEGy7DBf7oj5i5QxjSN7RBQuoBnpFJkzbNG
         dNsU8XZ4JiTcTUgm2mjp2LiQ21ILJAgNyRVh9uN6/QzkPY/E2fJUzGKObKPsl2fHs3jF
         iXs7T/2JFFtWOiGOaWp1LXCTADvAYu47HPgeqhTy6MAY+jH0yowNoqPVo2JtGswQiov9
         M0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750614546; x=1751219346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzmeehA5lQTLgvc8ARVJ5h/x37pM5IS3JJEp3oVKKu0=;
        b=BvLcCdJ4E12cUZTwWsXIDEq3gc42vWHnxwve+wlHcTN5SpWhAt+UfBu99lBg9CEs5P
         yzFvgrbmM4m+GQ5PrYKJZfhbaH0EPyS3vmdjaASuznUEq2L5EgnvcLSx+pR8axbG+mQF
         qLeXVkfQ02+WdzxbA2KCJOba/hu07U0piqB8PYXN1MBBNNtwkaSw/sZa0Pdd48sGqSEG
         GCF+g17xXkstqGb+o0d0Rr/OKJw2wU54FKZmedI4+KbeLQa0R3vUBtwvN2Zl7xp3wiMX
         iceELvU0tDFu3ya9XZX9W//ZQzlxEuK0yACu8TdjK66cGLRP3rGnF4ssW9LXPetcANcP
         HGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYdY85EUIzLRnkn3FSJeCw1rc1aL2Aa2Cw0GiUgGhZzTmYYx7sT+XOykTvcmeM6+GS7Zavvua6awgNFuGDItY=@vger.kernel.org, AJvYcCXfpmchwBcQAsj6HwqkAX8mItmjuyXh6eY8mLxEkjA3dE/thc6WhMs8VhJ3ABh3xw1IwvbfHtC/O3K+unI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwanEjy1W+NjJ+wQhm3D5VviTt1cmKA3yfQZ5knFdUprMgGCRv4
	7azRVLN8fofXvfzTURl1TsOlAHdGR/nB/yGphlHYAtFqZyIO5DYwecUuFk5GUsl8FRk7a8zMTyH
	bG8r1L2qjmZ4HetGEYug69BxQ04eIXz4=
X-Gm-Gg: ASbGncs+w1SQL5DVvWvTWUH5YVfPlOhMYt50pDSF+Ge84OsH8y1ge92WW2V29r8e4B5
	lktc1bXjVBh+sNEyNwPBCiutOr6wjTJ97lmV4f4KgIFb+UReEGUIcVwRTfKP99jJc2RdBu4xmNm
	OZ9GMjUVan1Uc3/VRPE+3hfmxu6W4YU6hoT1e2YLIORdwQ1G7QYO42ZnlqCfYyPRJB4oDMk19JI
	CeRaA==
X-Google-Smtp-Source: AGHT+IHpjqokKopjJ1dwq1zxhH9Du1Zqu9pTdxoLYJjNWOAKtFTH4NcN4QMKRJsrOyQAx30ElNPnwFbJvkUhuh3lP94=
X-Received: by 2002:a2e:aa8a:0:b0:32a:7315:fff3 with SMTP id
 38308e7fff4ca-32b9900369cmr22180941fa.35.1750614545782; Sun, 22 Jun 2025
 10:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621230231.100181-1-contact@antoniohickey.com> <20250621230231.100181-2-contact@antoniohickey.com>
In-Reply-To: <20250621230231.100181-2-contact@antoniohickey.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 22 Jun 2025 13:48:28 -0400
X-Gm-Features: AX0GCFsP1GIMaN_JBwqL0o78W67f7wAGFiQX-ds5CYK7fjg8szB3P2bOJwZbsnQ
Message-ID: <CAJ-ks9n1SqM_1xAstHQpp8Z7-2JSTkp9zUn8kwZA7OAAqWxQ6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kernel: create `overflow_assert!` macro
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 7:06=E2=80=AFPM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> This commit creates a macro for overflow assertions. The use of this
> macro will avoid local `#ifdef`s by encapsulating the conditional
> behavior (like `#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]`) to the macro.
>
> In addition this macro allows us to document the intent of the assertion
> more clearly.
>
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/lib.rs             |  1 +
>  rust/kernel/overflow_assert.rs | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 rust/kernel/overflow_assert.rs
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c3..e395adb6b293 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -92,6 +92,7 @@
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> +pub mod overflow_assert;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
>  pub mod pci;
> diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert=
.rs
> new file mode 100644
> index 000000000000..cc5f60611ba2
> --- /dev/null
> +++ b/rust/kernel/overflow_assert.rs
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Overflow assert.

s/assert/assertion/

AFAIK the standard library always uses assertion where a noun is
needed, and assert where a verb is needed.

> +
> +/// Verifies at runtime that an expression is within an expected bound.
> +///
> +/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is enab=
led.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// overflow_assert!(3 <=3D 10);
> +/// overflow_assert!(5 <=3D 5);
> +///
> +/// const X: u8 =3D 5;
> +/// overflow_assert!(X + 3 < 10);
> +///
> +/// const fn f(x: i32) -> i32 {
> +///     x + 1
> +/// }
> +/// overflow_assert!(f(40) < 42);
> +/// ```
> +#[macro_export]
> +macro_rules! overflow_assert {
> +    ($cond:expr) =3D> {
> +        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
> +            ::core::assert!(
> +                $cond,
> +                concat!("overflow assertion failed: ", stringify!($cond)=
)

Can we still allow the caller to pass additional arguments to the
macro, so that the overflowing value can be emitted? Alternatively if
the expectation is that this macro is always used with a comparison
operator perhaps we could have `overflow_assert_lt` and
`overflow_assert_le` which provide panic messages containing the
operand values?

> +            );
> +        }
> +    };
> +}
> --
> 2.50.0
>
>
>
