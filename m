Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565C1AC44D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835717; cv=none; b=b2U0THifxXbUGXQpEElYHKOYf+PVXIIkDO1FmoE//t5iqQBxO3RHnIREqggujiI4w9dQZAxlFV29SgrzLw064A6AqVVHStmDzqJfQSbMxZ4fcgClSsC2pDDopxeqGcfiMT9zCg8iLvaGei6zUGIk23aTsVbvlkeAg+KV8MFldaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835717; c=relaxed/simple;
	bh=u2FSLsCB3A4fJWVoj+5kQ0jgKhEFe32eSp6XHofRZzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5xd7dUfEwYAoLn0Apwc1B2xblFcxdXnrWNPW83hidfMzzO3ynRtmvFvew3C36RlV+Q8qHcZC4Aq5D+bbC+td6Zov0i0d1ZvU4BjEbS0J+bkKF9RrRjBFGsviIsCu2gehDbD75HVdAYYtxWzsEDcTKPYAk4s/wmvlOtGN8lQfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AduobvpF; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AduobvpF"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-400fa6eafa9so3457830b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745835715; x=1746440515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jbI9ciy9Vn6xR4JtLky4McErFUG8R91ldVXVx/kisk=;
        b=AduobvpFkJAbFLPgi4VCl9/1TUr+jFmvrYQMS9CfSMyGYFw1Ft4Qeg8TMl7fyH62ws
         7E3W42/JInAuN6KA2ZC+mIed8CYFTPIm6UnlTPjqc85kRpomFTp1+Yk+KaIjBtkM6q4A
         imRa/ift9GkHqHXDeQImEnY7WjP44bDVkEH2wRmxvYvRRhZrEFgNGJ0G6d9C/xHhezFy
         2iNSd/kdTIZbuU9jMaAvYMxbiVlhYqPKuHjv3PViKKkF0YNR3wU6Qj4gLhjtD4pPY8/2
         YxHS4jxxKDgTceJWItsOARxfeZvwPUi+gd27eecJQ6ej+1kzRxvV2eTCgnoZhFaE1tBr
         j3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835715; x=1746440515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jbI9ciy9Vn6xR4JtLky4McErFUG8R91ldVXVx/kisk=;
        b=Mtndj2fzWnN04f6N/0bNOmLdvSjgxoBy+ZmzNP6Uskg1/8P98xg7xIATV/Tjwxh9oz
         HzzbVPN8lzJEaah2QtJh1AYRGHyutCUBR6VJzQ5j7ZiZwfz8c8v+BQZVRz4x+JEKwVrp
         qAtJ7R0VWi60ontRRxj4hDAAs2M/+pX7BzCoK2VYsS9QiJ8Z2cIDAdR+PfZV1AclyGU+
         BywC9hvflETeVMHRJ69KzTxb23KdKV8xY2I4WOB1PLOa8xDlOKPNTOUDhNyxgK2qk1rj
         st9MI6kNO26Hu27F2Kn5WtVs9gITX3TJPeBYfNo4LukSzus5qsxfiQgeMhSk6CQYS/NG
         7/8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTzvZcRFh9xPuK4DuI5GVsFCyuuVgv1wKJAY+3vKk1THhRKiDLtjmSkFrHGt0c6/Myo0jGaYAfTbLzLy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJo0WDM/snxcHRQvE6AtxQM45vi9ctw+HJssOiORt9hkr3MXv
	ybsPABk8rEucrWPr3nPJKOvoQct0Y0oeY7dHNYRHhnDa9Sr9LN6jj1iDwxBDeM6hc4duRgREfrV
	Na5uOkryRsE6T4CCGwOpLfnN4xuPVkusrLbs5
X-Gm-Gg: ASbGncuE9looAaGn01/cRp1al+vFZiIjfU6uqPTXqlXiEFXnu4I2WKLRMb6n/v8dAZE
	3barbQcFfsv9snhADGCDVzUNJJVt9taACx/Cl99j+TB85HqBEkqH8XO+nMCB+diXmTmqufVjgC3
	lZNFPPScYaJQzZWUPjHeMoDnU+ORZm3WI6toCHJYrQdvClnrwLxo3N
X-Google-Smtp-Source: AGHT+IGj3Exgsxm3rRebRdaVBypLCiV4iNylnkVfLJBMXpFpf9Ow4ZNo5JdtIkIzXwPsd7cgweVmv3Mif+G+uFxC0Ic=
X-Received: by 2002:a05:6808:6a98:b0:3f9:43dd:a031 with SMTP id
 5614622812f47-401f28cb3e7mr6423598b6e.27.1745835710305; Mon, 28 Apr 2025
 03:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-5-bqe@google.com>
 <aAkZZd8QRXKejVV0@yury>
In-Reply-To: <aAkZZd8QRXKejVV0@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 28 Apr 2025 12:21:38 +0200
X-Gm-Features: ATxdqUHJWxUZkueRhnE83ItOCbm4yQKlF2iZnrGfX5q-ft-JahPeuSfU-OHeLAI
Message-ID: <CACQBu=VBvxyNvwSV8_gMuqNv49Ht+7aiUZwHD9Xh-TGoMTQQsw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] rust: add bitmap API.
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 6:46=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Wed, Apr 23, 2025 at 01:43:35PM +0000, Burak Emir wrote:
> >
> > Provides an abstraction for C bitmap API and bitops operations.
> > We follow the C Bitmap API closely in naming and semantics, with
> > a few differences that take advantage of Rust language facilities
> > and idioms:
> >
> >   * not all operations are exposed yet, to avoid dead code. This commit
> >     includes enough to implement an Android Binder data structure that
> >     was introduced in commit 15d9da3f818c ("binder: use bitmap for
> >     faster descriptor lookup"), namely drivers/android/dbitmap.h. This
> >     is part of upstreaming the Android Binder driver.
> >
> >   * API uses Option types where appropriate
> >
> >   * bound checks are used to treat out-of-bounds access as bug
> >     (hardening). The C operations treat out-of-bounds parameters
> >     as a default case e.g. "not found" which is safe (avoids UB) but
> >     may hide bugs.
>
> Few paragraphs later you say:
>
> > It enables Rust
> > code to be a lot more similar and predictable with respect to C code
>
> If you want to make Rust similar to C (which is good), you need to
> make all that Panic'ing stuff configurable, right?

Yes, I agree with this reasoning in combination with BUG_ON.

> This is what I suggested originally, and this is the right way to go,
> to me.
>
> There was a long discussion few years ago regarding BUG_ON()s in the
> kernel, and the bottomline for it is simple: the kernel has many nice
> isolating and self-debugging features that help to resolve (hopefully)
> non-fatal errors like out-of-bond access, so we should let it try.

In my own words: using BUG_ON to prevent undefined behavior is almost
always going to be more useful than panic.

> Just halting the kernel helps little, particularly it prevents from
> collecting syslogs and other debugging info. You can check git history
> and see how many BUG()s were demoted to WARN()s, or simply dropped.
>
> So, this is again my suggestion: it's OK to have a hardening feature,
> but the panic should be configurable for the reasons:
>  - robustness;
>  - compatibility;
>  - debugability.
>
> To me, this should end up with something like:
>
>   fn bitmap_assert(bool, msg)
>   {
>   #if CONFIG_RUST_HARDENING_PANIC && CONFIG_RUST_BITMAP_HARDENING
>         assert(bool, msg)
>   #elif CONFIG_RUST_BITMAP_HARDENING
>         if (!bool)
>                 pr_err(msg)
>   #else
>         // do nothing; for the best performance.
>   #endif
>   }
>
> This doesn't look difficult anyhow right? But if you find it
> impractical, you can just replace the panic with printing an error.

There are several things at play:
- for the C methods that tolerate out-of-bounds access, the
bounds-check is redundant for safety
- but it is not redundant in terms of API: tolerating out-of-bounds
access is the spec, someone may rely on it
- if we would like a Rust API that is stricter (hardening), it is an
API change (or: a Rust and C API difference).

I will go with your suggestion and do a local (bitmap-specific)
configurable assert (=3Dpanic).
This could then later be changed to use a BUG macro.

> After all, this # Panic simply breaks your own coding rules:
>
>   Please note that panicking should be very rare and used only with a goo=
d
>   reason. In almost all cases, a fallible approach should be used, typica=
lly
>   returning a ``Result``.
>

Bitmap operations are so basic and the API that fallibility does not
make sense to me here.
The Rust API is also constrained by what the C API provides: if C
handles out-of-bounds arguments gracefully, then Rust should, too.
And panicking has the problems you described, so I have come around to
think that Rust needs a BUG_ON macro.

> >   * better naming convention to distinguish non-atomic from atomic
> >     operations: {set,clear}_bit vs {set,clear}_bit_atomic.
> >     The Rust type system ensures that all non-atomic operations
> >     require a &mut reference which amounts to exclusive access.
> >     Using the atomic variants only makes sense when multiple threads
> >     have a shared reference &bitmap which amounts to the interior
> >     mutability pattern.
> >
> >   * optimized to represent the bitmap inline if it would take the space
> >     of a pointer. This saves allocations which is relevant in the
> >     Binder use case.
> >
> > The underlying C bitmap is *not* exposed. This would lose all static
> > guarantees.
> >
> > An alternative route of vendoring an existing Rust bitmap package was
> > considered but suboptimal overall. Reusing the C implementation is
> > preferable for a basic data structure like bitmaps. It enables Rust
> > code to be a lot more similar and predictable with respect to C code
> > that uses the same data structures and enables the use of code that
> > has been tried-and-tested in the kernel.
> >
> > We use the `usize` type for sizes and indices into the bitmap,
> > because Rust generally always uses that type for indices and lengths
> > and it will be more convenient if the API accepts that type. This means
> > that we need to perform some casts to/from u32 and usize, since the C
> > headers use unsigned int instead of size_t/unsigned long for these
> > numbers in some places.
> >
> > Adds new MAINTAINERS section BITMAP API [RUST].
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Burak Emir <bqe@google.com>
> > ---
> >  MAINTAINERS           |   7 +
> >  rust/kernel/bitmap.rs | 396 ++++++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs    |   1 +
> >  3 files changed, 404 insertions(+)
> >  create mode 100644 rust/kernel/bitmap.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1f162f64eded..7d107dc91390 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4135,6 +4135,13 @@ S:     Maintained
> >  F:   rust/helpers/bitmap.c
> >  F:   rust/helpers/cpumask.c
> >
> > +BITMAP API [RUST]
> > +M:   Alice Ryhl <aliceryhl@google.com>
> > +M:   Burak Emir <bqe@google.com>
> > +R:   Yury Norov <yury.norov@gmail.com>
> > +S:   Maintained
> > +F:   rust/kernel/bitmap.rs
> > +
> >  BITOPS API
> >  M:   Yury Norov <yury.norov@gmail.com>
> >  R:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > new file mode 100644
> > index 000000000000..79ddbef2b028
> > --- /dev/null
> > +++ b/rust/kernel/bitmap.rs
> > @@ -0,0 +1,396 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +//! Rust API for bitmap.
> > +//!
> > +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitmap=
.h).
> > +
> > +use crate::alloc::{AllocError, Flags};
> > +use crate::bindings;
> > +use core::ptr::NonNull;
> > +
> > +/// Holds either a pointer to array of `unsigned long` or a small bitm=
ap.
> > +#[repr(C)]
> > +union BitmapRepr {
> > +    bitmap: usize,
> > +    ptr: NonNull<usize>,
> > +}
> > +
> > +    pub fn last_bit(&self) -> Option<usize> {
>
> [...]
>
> > +        // SAFETY: access is within bounds.
> > +        let index =3D unsafe { bindings::_find_last_bit(self.as_ptr(),=
 self.nbits) };
> > +        if index =3D=3D self.nbits {
>
> Here and everywhere, can you please:
>
>         if index >=3D self.nbits {
>
> I know that bitmap documentation says that index would be exactly
> nbits, but really it was a bad decision. If one day I'll find a safe
> way to relax this to >=3D, your code will stay untouched.

Done, going to be in v8.

Thanks,
Burak

>
> Thanks,
> Yury
