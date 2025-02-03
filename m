Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96F126F0A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574051; cv=none; b=teUCDf/EPGQ74xjLuovVGUQnRssS+aK6NtBEoJzPVPfRKaXhWETaIYYPNP+vbJs5sHODzu4bKIc4iDg3o/sxgtKfpPJqnBp+Z3AIhEiBwGxbxfsAObism9uod4441Xj4l4VmgLnQyZuk/OBZ8hOHGD7XAovcH51KlU4tfi5P6XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574051; c=relaxed/simple;
	bh=iccEFWWq1/laF9ZrE7GMGMBPOq0ZacXGhExO1udHdrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0zMQ0mH6FgepzfKR1PBwFzGnmh5gRVoIP+n9d8Gw1X5Cjof3WrdAXnnv+/N9DAN+8w8PmM+EJsX1FLnIPpsLk+ckIF3fJ+tfICT+ozWMESGijtbWgOyT7nhuT5+JvemrUdvfhQkxEWg5ZnwCOHztcmk+F1TCRm3BW9OsesHmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ode+AWzX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ode+AWzX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso28065415e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574048; x=1739178848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTigYTji7snmwZ76B8KAzY+h5eJthq2lyVwSFYmcfo0=;
        b=ode+AWzXzaSzy0b2N6dLJVYkCaeoAPhSm6ms57MQ8GIVrcWzrTudnETwrPeWNLLddq
         ICt6xb8zd7M6Sa0ANiQaEUvRZwB+25v9RnV/lp0EOnWviJbJsLso/KnPeP9pveroFxt3
         cLFXvLI8lU0s3jr1kxjoVVM7c4jghPZYQ+9QdZA1zmyqkPJQqcOatmFuuEOgJlzCg730
         UbmNtfS/qt11vqqAe1iNpNZoDulAQ9p8v7LihH5RtANpZS/kus4MesDiYeXro7EC8Ic7
         SIJUYP1s/ZFLWwROLrKyep4WxCs/DfQj1TSAgeNGXniuM0QIprLY6qsEJYsyPe/cNggS
         xLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574048; x=1739178848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTigYTji7snmwZ76B8KAzY+h5eJthq2lyVwSFYmcfo0=;
        b=GfpOtXokHsV71vC/NwN0dBGNyK4c+RUKoMwpymJgT+9F10R66SgqQNzwOazZq2/LoM
         Faz8Lw98HnLgmyRscB19PiJn0pdJJVkXXzbOOLXb8DklPE8JCJTxEpHOiwb+SamUclM0
         3iA/BhqTgVadPedi+ryj1OZ1sEgJduaOq8nElZ7euz0Mr3uWwbN2M4AvzLRgYpqRwoHU
         X+lo/EglMv0JOatKcf9mvQbq2RjKH5Ry73c+ooaUBAMfl86iUjdFAIGNhhPMJxGMXM6N
         kiSLt5dBp0MuCXreBvqzR8Er6a0Dtro/uAPKEFMZwrffRzvpRbnhHbXlHkKl9psXCGBr
         gkWw==
X-Forwarded-Encrypted: i=1; AJvYcCXwdZF0ImNBJu56T/pkgKTeZDGtKNNbk2IuhfxGEKYRLyiz2BZB8KFmTsrSnKHvXtfO/xb+mvyqkGGbXEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HyAiQSa1ZOwZjjS2dExAg16nYeAH7zd02QI6/ueldrCu4u7W
	KS+zxFCHuI0D8SCEX40hSURKDIuxOcnIqVLG7R2sWtMbI15KEU1hu2pZo8XuGWwbBtzZ/VuRzmC
	yA4myIpHpVoc4A3h9YAxxTZ0si8+ALlOTKwvW
X-Gm-Gg: ASbGncuPjZ5/HphT4gzpfVghGHjuapGOjCJAqx5V+C0aTSZg1p3P9SxA18oJK+u6bWK
	4F/5wuucSfhHMXxN6ZD3mxPzS+rNuaXr7RvBqDpbcK+78UiBMjf643Gg9f+eJmtIv+j41C6z3rs
	35QiCAAhm/9C5+FqFSw8Sz/U1n
X-Google-Smtp-Source: AGHT+IHWLWAheWBxDTzneWVhDeDHu4iI6ZSKajtVpaOuk8Iz68fBhZfpC7OkVmaSh79YpfnCMc7hqeCMjDs76NrY250=
X-Received: by 2002:a05:6000:2ac:b0:38c:5cd0:ecd4 with SMTP id
 ffacd0b85a97d-38c5cd0f0f5mr12252107f8f.6.1738574047978; Mon, 03 Feb 2025
 01:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:13:56 +0100
X-Gm-Features: AWEUYZmohLxz7yr6HsBu7wP0vZHEbxTNHW_DFOP7aKlEhrQya1tqMhpQ9Fx3RtI
Message-ID: <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: types: Add Ownable/Owned types
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
> C FFI) type that *may* be owned by Rust, but need not be. Unlike
> AlwaysRefCounted, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
>
> Conceptually, this is similar to a KBox<T>, except that it delegates
> resource management to the T instead of using a generic allocator.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Overall LGTM.

> +/// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference=
 is not only unique
> +/// within Rust and keeps the `T` alive, but also guarantees that the C =
code follows the
> +/// usual mutable reference requirements. That is, the kernel will never=
 mutate the
> +/// `T` (excluding internal mutability that follows the usual rules) whi=
le Rust owns it.
> +///
> +/// When this type is implemented for an [`Ownable`] type, it allows `Ow=
ned<T>` to be
> +/// dereferenced into a &mut T.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that the kernel never mutates the underlyin=
g type while
> +/// Rust owns it.
> +pub unsafe trait OwnableMut: Ownable {}

Giving out mutable references allows users to call core::mem::swap on
the object. We must require that this is allowed.

> +impl<T: Ownable> Owned<T> {
> +    /// Creates a new instance of [`Owned`].
> +    ///
> +    /// It takes over ownership of the underlying object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the underlying object is acquired and c=
an be considered owned by
> +    /// Rust.
> +    pub(crate) unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> +        // INVARIANT: The safety requirements guarantee that the new ins=
tance now owns the
> +        // reference.
> +        Self {
> +            ptr,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Consumes the `Owned`, returning a raw pointer.
> +    ///
> +    /// This function does not actually relinquish ownership of the obje=
ct.
> +    /// After calling this function, the caller is responsible for owner=
ship previously managed
> +    /// by the `Owned`.
> +    #[allow(dead_code)]
> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {

I would just make these methods public, like the ARef ones. Then you
can drop the #[allow(dead_code)] annotation.

Alice
