Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C933215F6E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085125; cv=none; b=WcssxyuqaWqlSEmlmVSjKUeufQcfc0cYOOVdVoWVuIQ0pK3eeJzFhMbGzV2PLcwLAu0/x/HZX2ECJrL/TRjhgnE7oqTkuznA19/4GW+mmaq+j8FYxE0Mynv5plESQJUA96Hod8429iWaPYCtzAPFStlxHWJCHdrmYBSSJGxhfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085125; c=relaxed/simple;
	bh=n0O4NxlJaneBbGrIgexWIcP3/BoCTTRrgPHZdTQhQY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4HoFUbsxQLk4uC1fHq/L5+1Tt6Zv6FJh5dpQvfXaenrVRNw5cbu/L6OS3ht4kBWue6EIm1+W5b6igvPuHnNLjLpfRQLJF54+k0G3t7eX3W/aGzJuH0Lc+ZcJk70HQA2eRkhYJN7x4Ue/1ZVA0WS2E8zTqCMn1pXghwMW/1Cy3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JmdWc9b8; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JmdWc9b8"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f8df49e75fso258504b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743085121; x=1743689921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbaBmLwTZnRtYnCmSq+Y7j2ZPi0uJBRAG9lkRDYFO/U=;
        b=JmdWc9b8SnIMC5CTrZw1grUUqQ6WDKSOysbWjs+urax3vSs0yLqf/IjZBmZ7VGqCdB
         DwFS0j9PLLybvka2N6QZttsgDkYAfoCHc1czsjQkTBZ+JQyLLLVxvuwjFEIfc1K7TgIt
         Dlh53sXiXRXgk9PFgGJy+dd2+r/K0OCof80RMHPNf/5SXM8T2CZv+5HdBNXPKqMB38iG
         WxHzoDW6VhzEnqpe4lGp1mZE4mrDweg+GFKgEqu+Z7rg+AVBhxJGMusGRq1lJ4yij29M
         +/LrgYd6RU+dAytt41kXCYqZWlBRHzl1hWfYQe7Zkb/kBQemc/RyctR+fdR9roJyaI+n
         VAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085121; x=1743689921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbaBmLwTZnRtYnCmSq+Y7j2ZPi0uJBRAG9lkRDYFO/U=;
        b=ZE32G1jc1hBkcdPoEV+MMTFqZXQ1btzA35QyR5gBWmMpT2qkBr9Um0lQCTkPhNVmUM
         rU+wbc9BPw8gPNv7CHncdzmVaJZmWciDwbWBw5mffnTefTKdZVQKQlsNkNUtgEyngtM7
         KZ9gBI65iZwWBn6o0ZYMo9bdLpDUxdLnF/JQwAj3pxih6pycrAdqpAws8zaap8Mx11io
         pYQjJCetgtdnQRHkn+WLTJbn88vMu1uq9GG6fe5f1KvW5spXyVuHtgMB3lnS+UElq6Od
         lX+7WW2QTo0OxguAzS7I1SPVrs9mb2REI0mS851sEyGu60+s/2+dpGUHLnv55dDnZD8K
         NuCA==
X-Forwarded-Encrypted: i=1; AJvYcCXrkIWz9/vxP5/A0Df5GyOFYsFr9Eb5M1mgCUEYOipVyqG97/zk7iKPq/pUsilL9YSsHpws0WV3DbLOKOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Rs/AFQ32dMRirbA7nKDA1MM3y4ichTsUQj2nbOuPhZHDNB29
	mi3GvwB3jtegfVCqJP/BPM9WfTqSUT5pgK6rbkuCV7L/hTY59n6xViOEhg3QIpA5R90JNhI2Tiu
	YCIkR6qaWRhvyBnEWfIIaFdbm/zo3ukub/Msg
X-Gm-Gg: ASbGncuVtTEKsaC12UJfS+q8vGYNECbkdO5mfK2N4hgWm+C6y64/FuQkAxkzflvAMd4
	RKVqbbzCgnjVm431ABfHGJQ4OOU0YMGRKVw+4gGlhpo6GvBU4teXOKjSjoR8gKoZvFetqrTCBnl
	ACUAMWU1pcCQWPKci2oYXww6BDebPV2noRQqDXNA/CEtbVKrX9/4/iKM1dBZ+V7W11vaQ=
X-Google-Smtp-Source: AGHT+IGIzoJ0ZKNYX4k7yv2IvpQTrAf8sJffpi8d8/GAe1dgrPH7nhCwJ05VS3YkC7t6iLEEF63SjR0fzQPTg+gNofI=
X-Received: by 2002:a05:6808:1456:b0:3f8:150b:f558 with SMTP id
 5614622812f47-3fefa53c556mr2433597b6e.10.1743085121007; Thu, 27 Mar 2025
 07:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <20250321111535.3740332-5-bqe@google.com>
 <Z92U_odgJztRik2o@thinkpad>
In-Reply-To: <Z92U_odgJztRik2o@thinkpad>
From: Burak Emir <bqe@google.com>
Date: Thu, 27 Mar 2025 15:18:29 +0100
X-Gm-Features: AQ5f1JpVKTE5wV_4absAUU-BXlJBZCzzhMJ6V61kUKQD0br-l87_v7XFY6pzXK0
Message-ID: <CACQBu=XwZKphiQd0rrfdC0OMMG+mHSQ=ie2MO06n=Vq51TGA9A@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: add dynamic ID pool abstraction for bitmap
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

On Fri, Mar 21, 2025 at 5:34=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Mar 21, 2025 at 11:15:32AM +0000, Burak Emir wrote:
> > This is a port of the Binder data structure introduced in commit
> > 15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
> > Rust.
> >
> > Like drivers/android/dbitmap.h, the ID pool abstraction lets
> > clients acquire and release IDs. The implementation uses a bitmap to
> > know what IDs are in use, and gives clients fine-grained control over
> > the time of allocation. This fine-grained control is needed in the
> > Android Binder. We provide an example that release a spinlock for
> > allocation and unit tests (rustdoc examples).
> >
> > The implementation is not aware that the underlying Bitmap abstraction
> > handles lengths below BITS_PER_LONG without allocation.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Burak Emir <bqe@google.com>
>
> Before I'll dig into this, can you describe the usecase? Is this just
> a dynamic array of bits, or something more unusual? What's your desired
> complexity for an acquire_id() - O(n) strictly, or amortized? Are you
> going to use it in IRQ or similar restricted contexts?

Alice is probably the better person to answer. My rough summary of the
id pool use case is:
- In binder, there are these objects called nodes. Each node is owned
by one process.
- Nodes can exchange messages. This exchange can happen across
processes. There is a "first node" that sets up connections.
- Every process needs to manage ID to node mapping, which it does by
assigning (process-local) IDs.
 - In order to not exhaust ID space, ID numbers get reused.



> > ---
> >  MAINTAINERS            |   1 +
> >  rust/kernel/id_pool.rs | 201 +++++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs     |   1 +
> >  3 files changed, 203 insertions(+)
> >  create mode 100644 rust/kernel/id_pool.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bc8f05431689..61ac5da0dfbf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4120,6 +4120,7 @@ M:      Burak Emir <bqe@google.com>
> >  R:   Yury Norov <yury.norov@gmail.com>
> >  S:   Maintained
> >  F:   rust/kernel/bitmap.rs
> > +F:   rust/kernel/id_pool.rs
> >
> >  BITOPS API
> >  M:   Yury Norov <yury.norov@gmail.com>
> > diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> > new file mode 100644
> > index 000000000000..8f07526bb580
> > --- /dev/null
> > +++ b/rust/kernel/id_pool.rs
> > @@ -0,0 +1,201 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +//! Rust API for an ID pool backed by a `Bitmap`.
> > +
> > +use crate::alloc::{AllocError, Flags};
> > +use crate::bitmap::Bitmap;
> > +
> > +/// Represents a dynamic ID pool backed by a `Bitmap`.
> > +///
> > +/// Clients acquire and release IDs from zero bits in a bitmap.
> > +///
> > +/// The ID pool can grow or shrink as needed. It has been designed
> > +/// to support the scenario where users need to control the time
> > +/// of allocation of a new backing bitmap, which may require release
> > +/// of locks.
> > +/// These operations then, are verified to determine if the grow or
> > +/// shrink is sill valid.
> > +///
> > +/// # Examples
> > +///
> > +/// Basic usage
> > +///
> > +/// ```
> > +/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> > +/// use kernel::id_pool::IdPool;
> > +///
> > +/// let mut pool =3D IdPool::new(64, GFP_KERNEL)?;
> > +/// for i in 0..64 {
> > +///   assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
> > +/// }
> > +///
> > +/// pool.release_id(23);
> > +/// assert_eq!(23, pool.acquire_next_id(0).ok_or(ENOSPC)?);
> > +///
> > +/// assert_eq!(None, pool.acquire_next_id(0));  // time to realloc.
> > +/// let resizer =3D pool.grow_alloc().alloc(GFP_KERNEL)?;
> > +/// pool.grow(resizer);
> > +///
> > +/// assert_eq!(pool.acquire_next_id(0), Some(64));
> > +/// # Ok::<(), Error>(())
> > +/// ```
> > +///
> > +/// Releasing spinlock to grow the pool
> > +///
> > +/// ```no_run
> > +/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> > +/// use kernel::sync::{new_spinlock, SpinLock};
> > +/// use kernel::id_pool::IdPool;
> > +///
> > +/// fn get_id_maybe_alloc(guarded_pool: &SpinLock<IdPool>) -> Result<u=
size, AllocError> {
> > +///   let mut pool =3D guarded_pool.lock();
> > +///   loop {
> > +///     match pool.acquire_next_id(0) {
> > +///       Some(index) =3D> return Ok(index),
> > +///       None =3D> {
> > +///         let alloc_request =3D pool.grow_alloc();
> > +///         drop(pool);
> > +///         let resizer =3D alloc_request.alloc(GFP_KERNEL)?;
> > +///         pool =3D guarded_pool.lock();
> > +///         pool.grow(resizer)
> > +///       }
> > +///     }
> > +///   }
> > +/// }
> > +/// ```
> > +pub struct IdPool {
> > +    map: Bitmap,
> > +}
> > +
> > +/// Returned when the `IdPool` should change size.
> > +pub struct AllocRequest {
> > +    nbits: usize,
> > +}
> > +
> > +/// Contains an allocated `Bitmap` for resizing `IdPool`.
> > +pub struct PoolResizer {
> > +    new: Bitmap,
> > +}
> > +
> > +impl AllocRequest {
> > +    /// Allocates a new `Bitmap` for `IdPool`.
> > +    pub fn alloc(&self, flags: Flags) -> Result<PoolResizer, AllocErro=
r> {
> > +        let new =3D Bitmap::new(self.nbits, flags)?;
> > +        Ok(PoolResizer { new })
> > +    }
> > +}
> > +
> > +impl IdPool {
> > +    /// Constructs a new `[IdPool]`.
> > +    #[inline]
> > +    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError>=
 {
> > +        let map =3D Bitmap::new(nbits, flags)?;
> > +        Ok(Self { map })
> > +    }
> > +
> > +    /// Returns how many IDs this pool can currently have.
> > +    #[inline]
> > +    pub fn len(&self) -> usize {
> > +        self.map.len()
> > +    }
> > +
> > +    /// Returns an [`AllocRequest`] if the [`IdPool`] can be shrunk, [=
`None`] otherwise.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> > +    /// use kernel::id_pool::{AllocRequest, IdPool};
> > +    ///
> > +    /// let mut pool =3D IdPool::new(1024, GFP_KERNEL)?;
> > +    /// let alloc_request =3D pool.shrink_alloc().ok_or(AllocError)?;
> > +    /// let resizer =3D alloc_request.alloc(GFP_KERNEL)?;
> > +    /// pool.shrink(resizer);
> > +    /// assert_eq!(pool.len(), kernel::bindings::BITS_PER_LONG as usiz=
e);
> > +    /// # Ok::<(), AllocError>(())
> > +    /// ```
> > +    #[inline]
> > +    pub fn shrink_alloc(&self) -> Option<AllocRequest> {
> > +        let len =3D self.map.len();
> > +        if len <=3D bindings::BITS_PER_LONG as usize {
> > +            return None;
> > +        }
> > +        /*
> > +         * Determine if the bitmap can shrink based on the position of
> > +         * its last set bit. If the bit is within the first quarter of
> > +         * the bitmap then shrinking is possible. In this case, the
> > +         * bitmap should shrink to half its current size.
> > +         */
> > +        match self.map.last_bit() {
> > +            Some(bit) =3D> {
> > +                if bit < (len >> 2) {
> > +                    Some(AllocRequest { nbits: len >> 1 })
> > +                } else {
> > +                    None
> > +                }
> > +            }
> > +            None =3D> Some(AllocRequest {
> > +                nbits: bindings::BITS_PER_LONG as usize,
> > +            }),
> > +        }
> > +    }
> > +
> > +    /// Shrinks pool by using a new `Bitmap`, if still possible.
> > +    #[inline]
> > +    pub fn shrink(&mut self, mut resizer: PoolResizer) {
> > +        // Verify that shrinking is still possible. The `resizer`
> > +        // bitmap might have been allocated without locks, so this cal=
l
> > +        // could now be outdated. In this case, drop `resizer` and mov=
e on.
> > +        if let Some(AllocRequest { nbits }) =3D self.shrink_alloc() {
> > +            if nbits <=3D resizer.new.len() {
> > +                resizer.new.copy_and_extend(&self.map);
> > +                self.map =3D resizer.new;
> > +                return;
> > +            }
> > +        }
> > +    }
> > +
> > +    /// Returns an `AllocRequest` for growing this `IdPool`.
> > +    #[inline]
> > +    pub fn grow_alloc(&self) -> AllocRequest {
> > +        AllocRequest {
> > +            nbits: self.map.len() << 1,
> > +        }
> > +    }
> > +
> > +    /// Grows pool by using a new `Bitmap`, if still necessary.
> > +    #[inline]
> > +    pub fn grow(&mut self, mut resizer: PoolResizer) {
> > +        // `resizer` bitmap might have been allocated without locks,
> > +        // so this call could now be outdated. In this case, drop
> > +        // `resizer` and move on.
> > +        if resizer.new.len() <=3D self.map.len() {
> > +            return;
> > +        }
> > +
> > +        resizer.new.copy_and_extend(&self.map);
> > +        self.map =3D resizer.new;
> > +    }
> > +
> > +    /// Acquires a new ID by finding and setting the next zero bit in =
the
> > +    /// bitmap. Upon success, returns its index. Otherwise, returns `N=
one`
> > +    /// to indicate that a `grow_alloc` is needed.
> > +    #[inline]
> > +    pub fn acquire_next_id(&mut self, offset: usize) -> Option<usize> =
{
> > +        match self.map.next_zero_bit(offset) {
> > +            res @ Some(nr) =3D> {
> > +                self.map.set_bit(nr);
> > +                res
> > +            }
> > +            None =3D> None,
> > +        }
> > +    }
> > +
> > +    /// Releases an ID.
> > +    #[inline]
> > +    pub fn release_id(&mut self, id: usize) {
> > +        self.map.clear_bit(id);
> > +    }
> > +}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 9f675c0841e6..d77a27bee388 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -51,6 +51,7 @@
> >  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
> >  pub mod firmware;
> >  pub mod fs;
> > +pub mod id_pool;
> >  pub mod init;
> >  pub mod io;
> >  pub mod ioctl;
> > --
> > 2.49.0.395.g12beb8f557-goog
