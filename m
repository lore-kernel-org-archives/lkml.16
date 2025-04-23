Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B9288C8C;
	Wed, 23 Apr 2025 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426803; cv=none; b=gKrR7MvR8ieSn614BF1H76qPP6jqQFmdKZfzJJKpNgQpARaxSf+TI7cydZIq/eeDN1prYxQRfUJKcrkRB+cC45bUBS/HC9z0puOKqJm5h61x9op/3+F67LiemkOFMWWmQGXns1ALfaPgOev0qxARO59kpG4EPvEVR12W6OTmn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426803; c=relaxed/simple;
	bh=wiFJ793Wnu9Lov6l//YMxINYe6XWlbwpVqBwV5uHa9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUh2rGFpDPRrt2yVySP70hkFnm33o8vMGskomb/Q0wdzuMd7sAhSiorJkHq+LDcmObv7kConHN4DA+v4c0wM5lvQha3T60QL1QUlssWf1hfUBY/m8kvMeJRxhClcg2EmmbBCM3i5AQjFOQTjfQ6NmP/+BsmBun5WCAoT200+iEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfDkJGUW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfDkJGUW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso8129203b3a.2;
        Wed, 23 Apr 2025 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745426801; x=1746031601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVT+rsq7u5oPOFTHY3CgYIi+sPXsVCdah/RCqBk3XIU=;
        b=dfDkJGUW7InkOWg8YwhD/xlFoZ1dPztlal/4M92eLI8QzngELu3iFS0RQ3GY6zLaxz
         XtQKGOBKVf3yAyiKkE6bXVMl76lzxJywbHssbNkz2s6Zy/QpZUhgaIzYL+l1ug3UmKDT
         YVE/X0GwMkC1dIsoytLwM0QGADK6Hz3t+mDVigP+gD/Y2dhSazIrCSvH2UErgxJsp47D
         EmFGrxqAj3sZLkq/w7Y9B/Kt7aNefYC+Iz9cJgdzW+5dywDc+gOMGK+F6xTlrRBn4M6q
         BjF3vpPIkmBsT8fE4VS0nSJGCdVL3MYlAJUgfAk9rni1wpXOgWEA3/7d+DAWBaAcuBUg
         nmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426801; x=1746031601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVT+rsq7u5oPOFTHY3CgYIi+sPXsVCdah/RCqBk3XIU=;
        b=A5e4ELSAFTFH9B03jUJvtZ9aTQif4IpTfgH5M9pm5RjxDoO4k7bGvOjQ2GRJLfXXTE
         ynSGF0rYvyfRMACBvzAJpoNZ+ik7gMmD3csPE/IR3SVJT35DVZ04CBHzKLTQOxsbV/ff
         SmsPLoFRddU9nhTJ3/O153InXrFI2qztRdNsEuGN27UAV15TKsj2YHzxFenOCzadFovy
         27HAAaEKP4UAQvEuQYPPGxQVe1i/goM8FckU+gPc5mjJodn/AaQhf1ixlm8c/BFz0R9u
         OrawlUpJF0nxSGxlQgXgJqOVgY6PTbF7UaxvGDVh5imASBCViBz1ZJIL4fOjZiPSxXa+
         lgNA==
X-Forwarded-Encrypted: i=1; AJvYcCVQQ95B7PFpGXtHpuN0L9vtiTVgwhL6cQF7fdzhe82A6BZIC4xutbmUZn1jO0jBLIoi5PFs0DexMjqk3d4=@vger.kernel.org, AJvYcCWINTb6yr4Q7Zjc5cbIXMdn8yIEbo0n54cbUvAJAid/tOhweVrXVedPFUIy+f69uYaAO5t6h93eFOcERoTTKlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvbUH662uIPkaPGvLNszbUvkqzTgysl9R83vQaey5Ts1pMq3EJ
	AcMMtpIwAOMp2gHl730RF+Bp7dsU7QLyy++rkGqjiQrkKfTEQT1K
X-Gm-Gg: ASbGncs9ERl4bOsQVW2t6aJMwSrL2CLDt1rE13hP1Kox7s6vVWrbVtJQo4CnyLp0dyZ
	i4HW4tQTI/dh1hIEjAu63P/PzkUU7sGBPm4sD7dUI8miGuMsv2dl/z057PYv80EO0pBiExkxLI0
	xeGbFEV2nxlJpJnyNLUzobw/ZiiOY9UNi+mi7rJQSOEalLd3yCw5qs5/UvHSVmgPI4QkuG9teoU
	YlfSh9lfRm52etG9lBi6uJMs7wgL85ES9vCaK3I5qZw+dZVBdC7mb7p1NbO4h1w2jco6mnur9YP
	jt0ItlRNkWk2lkkhsn3ggMRU1V/kSQ3GPwpReTUQ
X-Google-Smtp-Source: AGHT+IFjVnlLUmCgSZW8+dFj8PsA2OEylU3Ah1LfifaIsIAM53X2HSa9pVU0mAFegu5Cf/0i7dwv2Q==
X-Received: by 2002:a05:6a21:392:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-204410572cemr275442637.7.1745426800967;
        Wed, 23 Apr 2025 09:46:40 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bed02sm10762449b3a.29.2025.04.23.09.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:46:40 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:46:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/5] rust: add bitmap API.
Message-ID: <aAkZZd8QRXKejVV0@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-5-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423134344.3888205-5-bqe@google.com>

On Wed, Apr 23, 2025 at 01:43:35PM +0000, Burak Emir wrote:
> 
> Provides an abstraction for C bitmap API and bitops operations.
> We follow the C Bitmap API closely in naming and semantics, with
> a few differences that take advantage of Rust language facilities
> and idioms:
> 
>   * not all operations are exposed yet, to avoid dead code. This commit
>     includes enough to implement an Android Binder data structure that
>     was introduced in commit 15d9da3f818c ("binder: use bitmap for
>     faster descriptor lookup"), namely drivers/android/dbitmap.h. This
>     is part of upstreaming the Android Binder driver.
> 
>   * API uses Option types where appropriate
> 
>   * bound checks are used to treat out-of-bounds access as bug
>     (hardening). The C operations treat out-of-bounds parameters
>     as a default case e.g. "not found" which is safe (avoids UB) but
>     may hide bugs.

Few paragraphs later you say:

> It enables Rust
> code to be a lot more similar and predictable with respect to C code

If you want to make Rust similar to C (which is good), you need to
make all that Panic'ing stuff configurable, right?

This is what I suggested originally, and this is the right way to go,
to me.

There was a long discussion few years ago regarding BUG_ON()s in the
kernel, and the bottomline for it is simple: the kernel has many nice
isolating and self-debugging features that help to resolve (hopefully)
non-fatal errors like out-of-bond access, so we should let it try.

Just halting the kernel helps little, particularly it prevents from
collecting syslogs and other debugging info. You can check git history
and see how many BUG()s were demoted to WARN()s, or simply dropped.

So, this is again my suggestion: it's OK to have a hardening feature,
but the panic should be configurable for the reasons:
 - robustness;
 - compatibility;
 - debugability.

To me, this should end up with something like:

  fn bitmap_assert(bool, msg) 
  {
  #if CONFIG_RUST_HARDENING_PANIC && CONFIG_RUST_BITMAP_HARDENING
        assert(bool, msg)
  #elif CONFIG_RUST_BITMAP_HARDENING
        if (!bool)
                pr_err(msg)
  #else
        // do nothing; for the best performance.
  #endif
  }

This doesn't look difficult anyhow right? But if you find it
impractical, you can just replace the panic with printing an error.

After all, this # Panic simply breaks your own coding rules:

  Please note that panicking should be very rare and used only with a good
  reason. In almost all cases, a fallible approach should be used, typically
  returning a ``Result``.

>   * better naming convention to distinguish non-atomic from atomic
>     operations: {set,clear}_bit vs {set,clear}_bit_atomic.
>     The Rust type system ensures that all non-atomic operations
>     require a &mut reference which amounts to exclusive access.
>     Using the atomic variants only makes sense when multiple threads
>     have a shared reference &bitmap which amounts to the interior
>     mutability pattern.
> 
>   * optimized to represent the bitmap inline if it would take the space
>     of a pointer. This saves allocations which is relevant in the
>     Binder use case.
> 
> The underlying C bitmap is *not* exposed. This would lose all static
> guarantees.
> 
> An alternative route of vendoring an existing Rust bitmap package was
> considered but suboptimal overall. Reusing the C implementation is
> preferable for a basic data structure like bitmaps. It enables Rust
> code to be a lot more similar and predictable with respect to C code
> that uses the same data structures and enables the use of code that
> has been tried-and-tested in the kernel.
> 
> We use the `usize` type for sizes and indices into the bitmap,
> because Rust generally always uses that type for indices and lengths
> and it will be more convenient if the API accepts that type. This means
> that we need to perform some casts to/from u32 and usize, since the C
> headers use unsigned int instead of size_t/unsigned long for these
> numbers in some places.
> 
> Adds new MAINTAINERS section BITMAP API [RUST].
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Burak Emir <bqe@google.com>
> ---
>  MAINTAINERS           |   7 +
>  rust/kernel/bitmap.rs | 396 ++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs    |   1 +
>  3 files changed, 404 insertions(+)
>  create mode 100644 rust/kernel/bitmap.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f162f64eded..7d107dc91390 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4135,6 +4135,13 @@ S:	Maintained
>  F:	rust/helpers/bitmap.c
>  F:	rust/helpers/cpumask.c
>  
> +BITMAP API [RUST]
> +M:	Alice Ryhl <aliceryhl@google.com>
> +M:	Burak Emir <bqe@google.com>
> +R:	Yury Norov <yury.norov@gmail.com>
> +S:	Maintained
> +F:	rust/kernel/bitmap.rs
> +
>  BITOPS API
>  M:	Yury Norov <yury.norov@gmail.com>
>  R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> new file mode 100644
> index 000000000000..79ddbef2b028
> --- /dev/null
> +++ b/rust/kernel/bitmap.rs
> @@ -0,0 +1,396 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! Rust API for bitmap.
> +//!
> +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitmap.h).
> +
> +use crate::alloc::{AllocError, Flags};
> +use crate::bindings;
> +use core::ptr::NonNull;
> +
> +/// Holds either a pointer to array of `unsigned long` or a small bitmap.
> +#[repr(C)]
> +union BitmapRepr {
> +    bitmap: usize,
> +    ptr: NonNull<usize>,
> +}
> +
> +    pub fn last_bit(&self) -> Option<usize> {

[...]

> +        // SAFETY: access is within bounds.
> +        let index = unsafe { bindings::_find_last_bit(self.as_ptr(), self.nbits) };
> +        if index == self.nbits {

Here and everywhere, can you please:

        if index >= self.nbits {

I know that bitmap documentation says that index would be exactly
nbits, but really it was a bad decision. If one day I'll find a safe
way to relax this to >=, your code will stay untouched.

Thanks,
Yury
