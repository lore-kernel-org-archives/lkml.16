Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E41FF603
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598822; cv=none; b=OnUL9iBafi/lNeTlLqnXgfoS6up9qz/OoXoeMld1f1eczVPYHiVRVNDvOAIj5WxzX/MItEw+YvPeOHIERCZ36yQ3FvnHztdVIqBTebbqWjhV5aKnf/Iyckx4C7GPruoxKjxqOIBfJEdevG/5ksmUJEAeruqrQwGjo0vIFh8bmH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598822; c=relaxed/simple;
	bh=oVzO12ncyGqg+ZQk7J5TfT09sDCOkhTgdT/AEkH0y2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hizsjzvUOask76L9UzomWIAPV8/tX8S82x02iqbFglw29yAbu8UnbdA6vM6DoE+OnKtFWZXDM+QDVpWpm7v6CcBJ7T1NzTdVA3xnaRNqVaG3cF3NBYfkX+NsblnjrQVe/qMshRwrB8HgVXcjXxCYPRq2QDdJZEu8t/kjj2XicuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3IVb3xl; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3IVb3xl"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so36230095e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746598815; x=1747203615; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ls5MgKciqm6FU9ZD38WWbxuKWTlwn7qiovMV9GCozTM=;
        b=D3IVb3xlGpLqTVvxJbm65CES4pvmk+Rhw3PW1vsM1r2KWM70vyQi3RVGZ3GpYQ9NCu
         KZQ5HIpZmzb+oKWmUI9WirFVd8Xclo0ICBLtdGVlo7kK7uHZQKzZnHMOV2QieIZpaI6r
         EYaeFzk1EseGrbCpU27uuaBpUDOS7+yeyBdRFGp0vIKn/dwa6jKOuE6lQS/h7alXbiOh
         rZTqBpPpUe/9I9l0NTZc6pRy4rs9Jw3//ds5+RFHBi/CqlJy3tLTj69+plAazaQ6I0cG
         QBmHh1qWfZeeLMheYG3ZFsR4tMx3qoTBd8qpRSlsfk7BDf+GbrblbqFssBnAqcjqbBX9
         F1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598815; x=1747203615;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ls5MgKciqm6FU9ZD38WWbxuKWTlwn7qiovMV9GCozTM=;
        b=QO7KbDg47CQioTRcQJk+1iwtEgrrsWujwkiQsyJMFJww6xkNu4mXabAPh1gmdznQVv
         bMEOwP5fxpfLcqniBg2ysQePkKGGcFmOPCivi5iNjcfglo8givnxinPi3x0lQU7usmgk
         Mf/xla3NxwnoyfbDzHsRRSMZ+grX0FkPIzgUvC2STZvOEP9l0qveyUIRSX0JEIwRtwf+
         7wiEK3WidA+jiD2BFfgoXOvTv1pXPp1GsIO4kTsahKO7v2JBMj/c/ehCrKGQraR0JMHD
         FLrexgc8oEU5l+1i70OfZbJPRdKlUgiktNn2uxcZAmMvn7QQXEvOOiQyXnwNJM5WIRIC
         CUJA==
X-Forwarded-Encrypted: i=1; AJvYcCWB3y5Zdvt3T/ShpjplXKNXQ+dz7dadREDjK3J4xhuWqb5fcb331QLV3zWgrydCzZKnxHkAdVkgtp07kGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/oJOchUYZcjppZrfrYvCdZWtiUJdAkNhUZ3wjNEJuBcmTLtt
	BjWF5+H8I+ewLoVMKjhdOdeOq9cyv62Pqjs4ZnSRXE60cwQBw6uWq/2YWNQgtd1pxAgLFwM99sn
	uFdjJNiIR2jAlGA==
X-Google-Smtp-Source: AGHT+IFchIQSs6/uaxnQNTXkJre3kxCjqjKEbsAqhsRKcdwlycwmgb49bF0r1rNpdSe8w8oMvecRmqhQu70oY8g=
X-Received: from wmbei16.prod.google.com ([2002:a05:600c:3f10:b0:440:59df:376a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8283:b0:43d:fa5d:9315 with SMTP id 5b1f17b1804b1-441d44e5195mr10736555e9.33.1746598815766;
 Tue, 06 May 2025 23:20:15 -0700 (PDT)
Date: Wed, 7 May 2025 06:20:13 +0000
In-Reply-To: <87ecx2q93v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
 <ZQ8N85Nd1qwR7qgLQKvl4cyYaCeQPD_ugOpVmYypwTmeLoV6acIhB2WLf3eBT-VUjm6jWF2qQzp2tU0kCqq39A==@protonmail.internalid>
 <aBSsrLGSJgLGTViT@google.com> <87ecx2q93v.fsf@kernel.org>
Message-ID: <aBr7nbI2AScXSjTg@google.com>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 06, 2025 at 01:20:04PM +0200, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > On Fri, May 02, 2025 at 09:02:29AM +0000, Oliver Mangold wrote:
> >> From: Asahi Lina <lina@asahilina.net>
> >>
> >> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
> >> C FFI) type that *may* be owned by Rust, but need not be. Unlike
> >> AlwaysRefCounted, this mechanism expects the reference to be unique
> >> within Rust, and does not allow cloning.
> >>
> >> Conceptually, this is similar to a KBox<T>, except that it delegates
> >> resource management to the T instead of using a generic allocator.
> >>
> >> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> >> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >> [ om:
> >>   - split code into separate file and `pub use` it from types.rs
> >>   - make from_raw() and into_raw() public
> >>   - fixes to documentation
> >> ]
> >> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> >> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> >> ---
> >>  rust/kernel/types.rs         |   3 ++
> >>  rust/kernel/types/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 120 insertions(+)
> >>
> >> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >> index 9d0471afc9648f2973235488b441eb109069adb1..5d8a99dcba4bf733107635bf3f0c15840ec33e4c 100644
> >> --- a/rust/kernel/types.rs
> >> +++ b/rust/kernel/types.rs
> >> @@ -11,6 +11,9 @@
> >>  };
> >>  use pin_init::{PinInit, Zeroable};
> >>
> >> +pub mod ownable;
> >> +pub use ownable::{Ownable, OwnableMut, Owned};
> >> +
> >>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
> >>  ///
> >>  /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
> >> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..52e7a69019f1e2bbbe3cf715651b67a5a5c7c13d
> >> --- /dev/null
> >> +++ b/rust/kernel/types/ownable.rs
> >> @@ -0,0 +1,117 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Owned reference types.
> >> +
> >> +use core::{
> >> +    marker::PhantomData,
> >> +    mem::ManuallyDrop,
> >> +    ops::{Deref, DerefMut},
> >> +    ptr::NonNull,
> >> +};
> >> +
> >> +/// Types that may be owned by Rust code or borrowed, but have a lifetime managed by C code.
> >> +///
> >> +/// It allows such types to define their own custom destructor function to be called when
> >> +/// a Rust-owned reference is dropped.
> >> +///
> >> +/// This is usually implemented by wrappers to existing structures on the C side of the code.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// Implementers must ensure that:
> >> +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that owned reference exists (i.e.
> >> +///   until the [`release()`](Ownable::release) trait method is called).
> >> +/// - That the C code follows the usual mutable reference requirements. That is, the kernel will
> >> +///   never mutate the [`Ownable`] (excluding internal mutability that follows the usual rules)
> >> +///   while Rust owns it.
> >
> > This seems too strong? Or does the exception mean to say that this does
> > not apply to anything containing `Opaque`? By far most structs using
> > this will use Opaque, so maybe directly mention Opaque instead?
> 
> `Opaque` is covered by "(excluding internal mutability that follows the usual rules)".

I guess. But I think it would still be good to rephrase to mention
Opaque for ease of understanding.

> > That C code follows the usual aliasing rules. That is, unless the value
> > is wrapped in `Opaque` (or `UnsafeCell`), then the value must not be
> > modified in any way while Rust owns it, unless that modification happens
> > inside a `&mut T` method on the value.
> >
> >> +pub unsafe trait Ownable {
> >> +    /// Releases the object (frees it or returns it to foreign ownership).
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// Callers must ensure that the object is no longer referenced after this call.
> >> +    unsafe fn release(this: NonNull<Self>);
> >> +}
> >> +
> >> +/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut Owned<T>` Rust reference
> >> +/// may be dereferenced into a `&mut T`.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// Implementers must ensure that access to a `&mut T` is safe, implying that it is okay to call
> >> +/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (meaning: most kernel types).
> >> +pub unsafe trait OwnableMut: Ownable {}
> >> +
> >> +/// An owned reference to an ownable kernel object.
> >> +///
> >> +/// The object is automatically freed or released when an instance of [`Owned`] is
> >> +/// dropped.
> >> +///
> >> +/// # Invariants
> >> +///
> >> +/// The pointer stored in `ptr` is valid for the lifetime of the [`Owned`] instance.
> >
> > This should probably talk about ownership.
> 
> How about
> 
>   The pointee of `ptr` can be considered owned by the [`Owned`] instance.

Sure.

Alice
