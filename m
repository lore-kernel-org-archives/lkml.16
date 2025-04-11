Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695B238C29;
	Fri, 11 Apr 2025 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374389; cv=none; b=APlCTmq4YJHD6MqD+IjUiyPsa1entMtGGy8TiPsVq71cs7OE5UOFv2l36+PazGkt8GQE/wsMG1L4Frg3V8fimNX/ApnHmm3q06T+puyU/p9k6OixUUjY6BzfD+GwYgcF1rv5jBQOptlCOGbhqz74tIkNNr+H2GV9UV+qWNJNFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374389; c=relaxed/simple;
	bh=23FaKcm93+0OymMKAv6oJ9knMnGvXsA8plzvi/c+m7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqwTk9hbfDcQwyp3Tna6YD772wmYhutUOysgjURy0mY4gHwPAN9gQqUj38D5yeXM/NAlLK4hHxTPbXWZkMsOL8sVzUvBddlx+Kq8FrKmJQrQCLv1ALSjwDioOzppFwA7LVdLIkp+CH42E+OcC7r1laabJKDuJJJ2u2Kqfbh5jS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTlaFdT7; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTlaFdT7"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso18464591fa.0;
        Fri, 11 Apr 2025 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744374385; x=1744979185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN/JI81BMTB6bPzJCvOGhiTJQ9G+R6jWgLCB/Ensjo0=;
        b=lTlaFdT75cRcStqXKweW+RtToFFC1aXJ5SMRDtA9Gie1xTPivVT+frxkzMYWlKDxPF
         /19ESpps2S/Gcz95VMMm+4nDXRkaH74NoZPRCyupIXeXmSLfxT2deg0MXLJC5E9n9wT3
         oLb9SfV7WatmfEJWaomXVwSHkYL1c5/Zg9PVvsRY85CCZ6Z+DDF0E2mUtJvGsVdy1tzW
         qNu8nPWGVFJFL5MNBdmoM7xtVI6sie2ywUFRr5cIrS/wRbuyrjJyq1SEOi01jDmYesON
         dmKlwB9M4qYlQzQ1/OIAazNO0uXqvVsUzye47XKb9hb516yj9PxKjiZRwxPQ/Zu+dzAa
         S0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374385; x=1744979185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN/JI81BMTB6bPzJCvOGhiTJQ9G+R6jWgLCB/Ensjo0=;
        b=djnfpp6HSknXoDk8uRpaact5szJqd/Q/UY6yjY9pn22pq8wsmi2FzbSGQKjblbKAau
         Qn4Uoe7Z8hZEWyLMwK96XU8NUuaXV9PYtcaBO3cBucuN/61R7PRDLtlEcYeOpgAWChGq
         y4MVYA+7Q32RsQWI/qlOcWO0lFjgR6ODQeP8CKlScnyklJtINbp79V6H57Je99IrA7Y7
         ightXmN6gEO9jPYTL7imk2QbbkO+XoToBPaKpAeyzP5T1/ShGYAt68IZ54lIKT2inAvx
         OWHu1cBamr6x4XLLwUD9kyrZECIpvLZW0G+gZ8nyM8xFblBmCtR4Z+mCapcmKrICdI+R
         BmUA==
X-Forwarded-Encrypted: i=1; AJvYcCVz2S1QndCWuZUblrP+B/mCQu4tRQY8BOikvsv9aCzcLRtuATOPtXMhOUfUPwGJ9IYHTuw02uVauWIXfa0XFs8=@vger.kernel.org, AJvYcCX6l5mjSVll/7/rN7gOJHLXoKLayo3pswac61YYc6c5HyCTf516HBLMWIr6ZYBwnLxrwOw97vJpQHL6ufM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwafGV961Cch/tPDtR3X1x6SycyVmP362zonYH5jCPmCKSaOO9H
	xmacjznT4cVthKKKhNllxqkXLQOX9SSenCEHIUNhmUFpjJnnLZ92co9fmrNpkyBH0289OlLQwo2
	7M7Tt9bGccu8WLyX1OCiWP0s7mLI=
X-Gm-Gg: ASbGncsxwr+Jz8ItYmE1LgE9llOwxMnFwu0GemCiDOA3j0PAmff7fGtA2FAwjiakOi3
	7ktHzbz7TumjVQRIV1wJkzc5Nd+ipCSgDJMq8h7m6zLKdJb/Y5TaL/2xSmqlenPpI5CBFQ+ox+N
	7PSyy3P1npVvZzr6T57imwZA+WoVKVB8X6RWqPAqH10QTtDDLPQOVHKcs=
X-Google-Smtp-Source: AGHT+IHul1gtOY4SlPWbnCUhT/btOBzezsLi9cmo5mp8Nqtzn+1HDhDRlgZZKvowK7cQmjg+M3mHzdCqLwXPNFgtz/s=
X-Received: by 2002:a2e:ad07:0:b0:30c:aae:6d61 with SMTP id
 38308e7fff4ca-31049a80156mr7890111fa.30.1744374385154; Fri, 11 Apr 2025
 05:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com> <Z_jakOS8mciIpxy0@google.com>
In-Reply-To: <Z_jakOS8mciIpxy0@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Apr 2025 08:25:49 -0400
X-Gm-Features: ATxdqUFX8PlGtGC5DEFSYzzgQY3gfj1Tnheg9MQghvjw_naHFwwTai1f4q0NQT4
Message-ID: <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 5:02=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
> > Avoid casting the input pointer to `*const _`, allowing the output
> > pointer to be `*mut` if the input is `*mut`. This allows a number of
> > `*const` to `*mut` conversions to be removed at the cost of slightly
> > worse ergonomics when the macro is used with a reference rather than a
> > pointer; the only example of this was in the macro's own doctest.
> >
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> > This patch is extracted from 3 other series to reduce duplication.
> > ---
> >  rust/kernel/lib.rs    |  5 ++---
> >  rust/kernel/rbtree.rs | 23 ++++++++++-------------
> >  2 files changed, 12 insertions(+), 16 deletions(-)
> >
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index de07aadd1ff5..1df11156302a 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -190,7 +190,7 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> >  /// }
> >  ///
> >  /// let test =3D Test { a: 10, b: 20 };
> > -/// let b_ptr =3D &test.b;
> > +/// let b_ptr: *const _ =3D &test.b;
> >  /// // SAFETY: The pointer points at the `b` field of a `Test`, so the=
 resulting pointer will be
> >  /// // in-bounds of the same allocation as `b_ptr`.
> >  /// let test_alias =3D unsafe { container_of!(b_ptr, Test, b) };
> > @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> >  #[macro_export]
> >  macro_rules! container_of {
> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > -        let ptr =3D $ptr as *const _ as *const u8;
> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> > -        ptr.sub(offset) as *const $type
> > +        $ptr.byte_sub(offset).cast::<$type>()
> >      }}
> >  }
>
> This implementation does not check the type of `ptr`. Would we not want
> it to have the type of the field?

I might be missing it but ISTM that the current implementation doesn't
check that either.

It's not obvious to me how you'd implement such a check; given `$ptr`
and `$f`, how do you get your hands on the type of `$ptr->$($f)*`?

Perhaps you could send a separate patch implementing this.

Tamir
