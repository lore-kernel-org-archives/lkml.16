Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199AE274FC2;
	Thu,  5 Jun 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143039; cv=none; b=kOqZbLHLwZNbp1RkhgeAZyRkus+Gif/Rrh0i9jftCPMTEPlpDDfpPy4FhEsGo0TLjzAqRhugqpcWmiYcdxhwOkg4m8tlnWjfFFWReQhpYNHI6DvRX+k8Rv3VT7rDUe+m9TmWk95iPcJoM3xYbjQNs+d7flW0DEC4TAN+4pInVoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143039; c=relaxed/simple;
	bh=RXJ2bhB++ekpp+g5wU/mlsuiZBxchp5iRzfW6p4lPv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5ZifV7YfEHTabH9CN9peqjEZeW8+PJCaBzLN/hOEf/SP4JAEuEwhpVN0m4iKfcmOd7MmUxx93Y1InhQdEtgTBRn5GVm7JIw4m0ZlJ80ilE83SbO86yc/m/0lCgmRR04o6mjHi6etB6/fL2DcXy5NqklqF8jOWqq8PvNIFnA+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXaFU8lD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXaFU8lD"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad93ff9f714so201234966b.2;
        Thu, 05 Jun 2025 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749143035; x=1749747835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vc9h3N4L8wdtAazwz7x66wCAf7y1keOjKnFs7I8c9Y8=;
        b=gXaFU8lDC+xNiAR488bmjKIJpkFuSqKJdxQQEeEOCXNqz+hrvL8UkzoItu2wWUZwFo
         E60cbMGhA0Jp9mURgI7IeCnhS+RtN6zTtI16yHLnjEqjlx7721v3n71qlXF9iPqGg1RP
         I5BisnrCjnDDO7cPQfiU6wugvLOWAiNgrJiO5+5AcGnGwt1PKIzrMh+E4otlZ16X644W
         HVF8tbfKu1tuicfHiJXqwU1mM8cU3ulxVkRLYfsC5gQRDe6B+jHb86oOvBpwAzc6tgGZ
         BRbneR0IbfwO/w3jtGGAh4MGo8L7QemnYiNJ4xSCKSzj+p7Bflb8kF0prpaRq39lSYyN
         scgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143035; x=1749747835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vc9h3N4L8wdtAazwz7x66wCAf7y1keOjKnFs7I8c9Y8=;
        b=Ftd1iNUb2l9saSz2AkIDKQUUswCuqd7RtVyp/6yrRseM6chUtonUFXMH4i8KumG41B
         95rnxMzKNP/VlYVTf8OU5Q4NDl5gpY5iXoaAnB8bzTjlJKwNv1Hvnn8Z6eejCesbWOph
         aUM4hT+NWR7mJ29yY8EBuNuPLgMjlbcfd7LTCenMxFUPm4n+7uAnutzmi/BVhkxP2jYb
         zo8Xk4+aXdcTNOGPu+l5HhENj7dpwKvGHfPzcRDGKQ22vkvYJ4/t0WkltFeVB4tiN4QC
         83bGXdmVcP6BIWtdJVFqH6rqdUZjn0BrmqxgMZPdH3s8W5vcMJHdZX24wy8hOdsebidH
         KqYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpS/yjNzuJJAHG0CzlmUso9W113Bwmv6RPHlwIWpjkwFCFCWCp3Dc4y2sk9Oe4w2hB1f+W+q3XaVTJMMBivA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdtso5CKK1O2AIdVi+XeUOWjZoEjnCsR28gATbJie9EjquSvq
	0h/RviykypVfqwPaNJhfTSqhjtvLSwz7wTtMR5riQGMTihJVCpWXroAS
X-Gm-Gg: ASbGncs89PYzYG9ny+Ek8gvwZTufGE1BilHLliHheGNu34TZFLNWXC6THVd9QPMVxoS
	VHUgu+pgRvuwEpTcRKfzo1GAJApjmZyJozsuktPVibgA6ZrtOtEYEzhCYOhbWlzaMG/nxpR3SFC
	qXDaG8F+HaY9Jj0PZJu0YQZHSxUe/NV/y3BGio3gO9hO2nrSZKOuOKy09i9frhRROcj7FxgtcAS
	3h7+NKWMHvY29QvwBULaRtIMDjoVYTJAeeKh+NetKyzEWNoV/rHqebc220jFPHjyxf/oaOXmY31
	lQuUTQMdwe1XZN5yyaAoKVAS6f0oNoajn59B1udYl5IzUSPKl5W0WRWf8AjmEgTHVFlr/Hk=
X-Google-Smtp-Source: AGHT+IGrLnLeZBwGuxAvClJF7twaYSOSuOrRWBB4JEpKXwF+Y4tHGOWY+eeHT2vK/tA8JOXrMWFq1Q==
X-Received: by 2002:a17:906:c113:b0:ad8:adbc:bbf6 with SMTP id a640c23a62f3a-addf8ff6f75mr765904766b.58.1749143025633;
        Thu, 05 Jun 2025 10:03:45 -0700 (PDT)
Received: from [10.5.1.144] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade0964136fsm157554766b.180.2025.06.05.10.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:03:45 -0700 (PDT)
Message-ID: <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
Date: Thu, 5 Jun 2025 19:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.05.25 8:21 PM, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with
> C code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
> 
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
> 
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always
> valid and automatic `Drop` is desired.
> 
> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
> as a unstable feature, therefore this patch implements the subset of the
> upstream API for the `UnsafePinned` type required for additional data in
> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
> 
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in the
> documentation and a comment on the `UnsafePinned` type.
> 
> The documentation on is based on the upstream rust documentation with
> minor modifications for the kernel implementation.
> 
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
>  rust/kernel/types.rs               |   6 ++
>  rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546578f2f04cdf615e 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -253,6 +253,9 @@ fn drop(&mut self) {
>  ///
>  /// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>  ///
> +/// In cases where the contained data is only used by Rust, is not allowed to be
> +/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] should be used instead.
> +///
>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>  /// It gets rid of all the usual assumptions that Rust has for a value:
>  ///
> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>  /// [`NotThreadSafe`]: type@NotThreadSafe
>  #[allow(non_upper_case_globals)]
>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
> +
> +mod unsafe_pinned;
> +pub use unsafe_pinned::UnsafePinned;
> diff --git a/rust/kernel/types/unsafe_pinned.rs b/rust/kernel/types/unsafe_pinned.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..315248cb88c089239bd672c889b5107060175ec3
> --- /dev/null
> +++ b/rust/kernel/types/unsafe_pinned.rs
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: Apache-2.0 OR MIT
> +
> +//! The contents of this file partially come from the Rust standard library, hosted in
> +//! the <https://github.com/rust-lang/rust> repository, licensed under
> +//! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
> +//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
> +//!
> +//! This file provides a implementation / polyfill of a subset of the upstream
> +//! rust `UnsafePinned` type. For details on the difference to the upstream
> +//! implementation see the comment on the [`UnsafePinned`] struct definition.
> +
> +use core::{cell::UnsafeCell, marker::PhantomPinned};
> +use pin_init::{cast_pin_init, PinInit, Wrapper};
> +
> +/// This type provides a way to opt-out of typical aliasing rules;
> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a unique pointer.
> +///
> +/// However, even if you define your type like `pub struct Wrapper(UnsafePinned<...>)`, it is still
> +/// very risky to have an `&mut Wrapper` that aliases anything else. Many functions that work
> +/// generically on `&mut T` assume that the memory that stores `T` is uniquely owned (such as
> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrapper` is not immediate
> +/// Undefined Behavior, it is still unsound to expose such a mutable reference to code you do not
> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are needed to ensure soundness.
> +///
> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up in
> +/// the public API of a library. It is an internal implementation detail of libraries that need to
> +/// support aliasing mutable references.
> +///
> +/// Further note that this does *not* lift the requirement that shared references must be read-only!
> +/// Use [`UnsafeCell`] for that.

The upstream rust PR [0] that changes this was just merged. So now `UnsafePinned` includes
`UnsafeCell` semantics. It's probably best to also change this in the kernel docs.
Though it's still the case that removing the guarantee is simpler than adding it back later,
so let me know what you all think.

[0]: https://github.com/rust-lang/rust/pull/140638

> +///
> +/// This type blocks niches the same way [`UnsafeCell`] does.
> +///
> +/// # Kernel implementation notes
> +///
> +/// This implementation works because of the "`!Unpin` hack" in rustc, which allows (some kinds of)
> +/// mutual aliasing of `!Unpin` types. This hack might be removed at some point, after which only
> +/// the `core::pin::UnsafePinned` type will allow this behavior. In order to simplify the migration
> +/// to future rust versions only this polyfill of this type should be used when this behavior is
> +/// required.
> +//
> +// As opposed to the upstream Rust type this contains a `PhantomPinned` and `UnsafeCell<T>`
> +// - `PhantomPinned` to ensure the struct always is `!Unpin` and thus enables the `!Unpin` hack.
> +//   This causes the LLVM `noalias` and `dereferenceable` attributes to be removed from
> +//   `&mut !Unpin` types.
> +// - In order to disable niche optimizations this implementation uses `UnsafeCell` internally,
> +//   the upstream version however currently does not. This will most likely change in the future
> +//   but for now we don't expose this in the documentation, since adding the guarantee is simpler
> +//   than removing it. Meaning that for now the fact that `UnsafePinned` contains an `UnsafeCell`
> +//   must not be relied on (Other than the niche blocking).
> +//   See this Rust tracking issue: https://github.com/rust-lang/rust/issues/137750
> +#[repr(transparent)]
> +pub struct UnsafePinned<T: ?Sized> {
> +    _ph: PhantomPinned,
> +    value: UnsafeCell<T>,
> +}
> +
> +impl<T> UnsafePinned<T> {
> +    /// Constructs a new instance of [`UnsafePinned`] which will wrap the specified value.
> +    ///
> +    /// All access to the inner value through `&UnsafePinned<T>` or `&mut UnsafePinned<T>` or
> +    /// `Pin<&mut UnsafePinned<T>>` requires `unsafe` code.
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn new(value: T) -> Self {
> +        UnsafePinned {
> +            value: UnsafeCell::new(value),
> +            _ph: PhantomPinned,
> +        }
> +    }
> +}
> +impl<T: ?Sized> UnsafePinned<T> {
> +    /// Get read-only access to the contents of a shared `UnsafePinned`.
> +    ///
> +    /// Note that `&UnsafePinned<T>` is read-only if `&T` is read-only. This means that if there is
> +    /// mutation of the `T`, future reads from the `*const T` returned here are UB! Use
> +    /// [`UnsafeCell`] if you also need interior mutability.
> +    ///
> +    /// [`UnsafeCell`]: core::cell::UnsafeCell
> +    ///
> +    /// ```rust,no_run
> +    /// use kernel::types::UnsafePinned;
> +    ///
> +    /// unsafe {
> +    ///     let mut x = UnsafePinned::new(0);
> +    ///     let ptr = x.get(); // read-only pointer, assumes immutability
> +    ///     # // Upstream Rust uses `UnsafePinned::get_mut_unchecked` here.
> +    ///     UnsafePinned::raw_get_mut(&raw mut x).write(1);
> +    ///     ptr.read(); // UB!
> +    /// }
> +    /// ```
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn get(&self) -> *const T {
> +        self.value.get()
> +    }
> +
> +    /// Gets a mutable pointer to the wrapped value.
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn raw_get_mut(this: *mut Self) -> *mut T {
> +        this as *mut T
> +    }
> +}
> +
> +impl<T> Wrapper<T> for UnsafePinned<T> {
> +    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
> +        unsafe { cast_pin_init(init) }
> +    }
> +}
> 

