Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638822B8AA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185393; cv=none; b=GTdZO+ifHatg6YpOJEn8ZE9GOvZdO1/d7NXeriVkmCzHTD481FCDKwZasuhN2o8wHatx+PBzJbfShsYBb6AopY1ehDjJbZ5mZOKVxDYCAJMuKNv7/JF+ozUz7tZaLKX/8XdonaSr0DlaDE3QxmzJ8N2iVgHGYiym+kzrephglN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185393; c=relaxed/simple;
	bh=K7FYUCik92QGCe1EXemPYX807oFnT+u9UbAeeptNTxg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CTHlrVVR1BftdRKgRHOb1rNSTwnL5JbRTCtEHQQSymnpQeTKp4fmiCUIRmnLUwbEJ81aFUGMut3xGqwWN7+axAWgqHKfAq6ULGWmT9WZGtNoxdkXL1DHwL7gQgvJu34MN3UWvzUYaS375638FLjeigoQ8ojx5jj9FJthb2imk9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fVdM2+Zo; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fVdM2+Zo"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so8227805e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746185390; x=1746790190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4d8ApGUc/m5siNw2yJnJiebAzNVkN6zwU5JpG7PnXaA=;
        b=fVdM2+ZopltDOqLdnR6T5q+VEoYMr0VtDvlzADndXGVPnhCt7di4+TYpZ2t3Nljt69
         DRq+UNj2x9ww8dDsUYcDHN6RpMoRMYoSoB8kyKWC6ZU3RQXCIvRP7b5KO/z8u6koOR+d
         LVETKmO9Ztr+hfEM80vpn60HAUesIphFcmmWOQM8AhP+GQHW35mFIRPSqGfYVYeTbSkV
         1HA2pnqEn5XK2KYG7aWm7vqbKW3e3tXTrcW5zjPNEXEzzbKX4Q1lqFUimpdsnmsxYRQO
         6V5tzOyNc9iXblDD6MtagW4NJIFJfiTtJdwlbd5zc245RlWHJIhjFoyDehdLX6mlSpNo
         qxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746185390; x=1746790190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d8ApGUc/m5siNw2yJnJiebAzNVkN6zwU5JpG7PnXaA=;
        b=fy5D7slNFI+YRtJkTLZZQKmWsof+5vxCVtnnkQavACrGDjjhZI7zJfTFcNncEQivFM
         NFQkczdeCkvo+92Pre5usCT2WWCMJV3DrU1AsjGW+Gt+JuAYF4AyBBrZMJrBFDHHv+hE
         EFz7NbrXkzpRELW5apsxBbSN+KHjrLDJY+GSD7nrHfpu6FOIQWlkaQKbzS7ArbVtxUgi
         d6S1G+1PwxrQjQQgReKG0RaVu6ArnsOkg0XvFEFk0pfVhFy0Oku2wruetUQQ+EXQBfUu
         2h0FspYgGFS6dYXpRY4ygxmzn+UJJWzLrXuLWDsS51lzOgLWu78pfVp9yDUTBD2M8CKG
         vADQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAkabsw9KR9jYJE3ZQdPeTgrpo7x8wBeHAqRimz+sqGaz8noyScL9fFWCs684A5Vm0PwAuWS87z89zWjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHhWEF1Aq+n4vMI1MvTaMvCjMFhRyAHjzdDschGB/JLkEXz/7
	3TKlHk7FsEMHa0mCU9ceRv9ypilJvoatTLWAyBHZ8jPbf7eacVgizNyk051HdP/8zeO9zpXBgS9
	CaS3GE2ku6Ri/pw==
X-Google-Smtp-Source: AGHT+IFpaSC9XcsOrGjeNxb+/dNB8fE7Dy+DCOaiP2DTJl1qxTdYd3MZatQ3DukBEbwwrU9bfI/pYQILIq7g3GU=
X-Received: from wmbbd9.prod.google.com ([2002:a05:600c:1f09:b0:43d:44cf:11f8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5304:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-441bbea0afbmr24277645e9.4.1746185390250;
 Fri, 02 May 2025 04:29:50 -0700 (PDT)
Date: Fri, 2 May 2025 11:29:48 +0000
In-Reply-To: <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
Message-ID: <aBSsrLGSJgLGTViT@google.com>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
From: Alice Ryhl <aliceryhl@google.com>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 09:02:29AM +0000, Oliver Mangold wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
> C FFI) type that *may* be owned by Rust, but need not be. Unlike
> AlwaysRefCounted, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
> 
> Conceptually, this is similar to a KBox<T>, except that it delegates
> resource management to the T instead of using a generic allocator.
> 
> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ om:
>   - split code into separate file and `pub use` it from types.rs
>   - make from_raw() and into_raw() public
>   - fixes to documentation
> ]
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  rust/kernel/types.rs         |   3 ++
>  rust/kernel/types/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc9648f2973235488b441eb109069adb1..5d8a99dcba4bf733107635bf3f0c15840ec33e4c 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -11,6 +11,9 @@
>  };
>  use pin_init::{PinInit, Zeroable};
>  
> +pub mod ownable;
> +pub use ownable::{Ownable, OwnableMut, Owned};
> +
>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>  ///
>  /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..52e7a69019f1e2bbbe3cf715651b67a5a5c7c13d
> --- /dev/null
> +++ b/rust/kernel/types/ownable.rs
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Owned reference types.
> +
> +use core::{
> +    marker::PhantomData,
> +    mem::ManuallyDrop,
> +    ops::{Deref, DerefMut},
> +    ptr::NonNull,
> +};
> +
> +/// Types that may be owned by Rust code or borrowed, but have a lifetime managed by C code.
> +///
> +/// It allows such types to define their own custom destructor function to be called when
> +/// a Rust-owned reference is dropped.
> +///
> +/// This is usually implemented by wrappers to existing structures on the C side of the code.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that owned reference exists (i.e.
> +///   until the [`release()`](Ownable::release) trait method is called).
> +/// - That the C code follows the usual mutable reference requirements. That is, the kernel will
> +///   never mutate the [`Ownable`] (excluding internal mutability that follows the usual rules)
> +///   while Rust owns it.

This seems too strong? Or does the exception mean to say that this does
not apply to anything containing `Opaque`? By far most structs using
this will use Opaque, so maybe directly mention Opaque instead?

That C code follows the usual aliasing rules. That is, unless the value
is wrapped in `Opaque` (or `UnsafeCell`), then the value must not be
modified in any way while Rust owns it, unless that modification happens
inside a `&mut T` method on the value.

> +pub unsafe trait Ownable {
> +    /// Releases the object (frees it or returns it to foreign ownership).
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the object is no longer referenced after this call.
> +    unsafe fn release(this: NonNull<Self>);
> +}
> +
> +/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut Owned<T>` Rust reference
> +/// may be dereferenced into a `&mut T`.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that access to a `&mut T` is safe, implying that it is okay to call
> +/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (meaning: most kernel types).
> +pub unsafe trait OwnableMut: Ownable {}
> +
> +/// An owned reference to an ownable kernel object.
> +///
> +/// The object is automatically freed or released when an instance of [`Owned`] is
> +/// dropped.
> +///
> +/// # Invariants
> +///
> +/// The pointer stored in `ptr` is valid for the lifetime of the [`Owned`] instance.

This should probably talk about ownership.

> +pub struct Owned<T: Ownable> {
> +    ptr: NonNull<T>,
> +    _p: PhantomData<T>,
> +}

Alice
