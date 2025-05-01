Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25A224B12;
	Thu,  1 May 2025 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119582; cv=none; b=VClkQqEFGMVQQ2EiY1NmTq2NFh8jS4PF/b8+Ld1JMrLFsP5DMUSKojTWfnBNzC41l6+bshUnbzP3Epw5DkLeTkxN/POd6urbhDvzCn3FxrgLB6wc7+6YhNoj5mfZCgcdSSOPQ7RN8Ew9N+Ij1Fh9XeP+TSD97+2DHRmCvMpFOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119582; c=relaxed/simple;
	bh=QDoeIx3cj12+oYgTT+5jfbH8MrY186jvvXKAi3a3HsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Glcap/WViCQCHvumdtsNTXkHX68Xc5u5SJm8HL4wqCbKEt31FDEFMl4vcqF2fpgNIr/HBHybfbf/G2CdtCm2UqAH9/OQdx8ZhVJoNdP0hyH6Coi1/9k+aTMd75CfZfWPKkp3tYkEB+AVfxyR11EAN5u0okLXie5X5qrMU2iCLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvpNdMQF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvpNdMQF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf680d351so12364225e9.0;
        Thu, 01 May 2025 10:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746119579; x=1746724379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlHHbc5+ml6sPmEKiUUZJGlD/QUxB9ALkFtouoIfjNg=;
        b=AvpNdMQFCmzTo5WArM1CesKy2eprWQCWvddmxm6vJXWTXbKCOFw2PnhcdFgfXivghD
         9+SJmHPvFHCLqRzDkKOyjGMhXWUVru4l2rB5cgZqAmdf4x3a0MCtXIpHaGjtL8NNWGiN
         337pD/NqCUMQWwJArRuEmtYqCsjZyO6MlHrHZfTKQA4hOiCR9e2xzVl5WZ0DqK0wR2NA
         WXAddFuCiEOI2IGQbMShgiv1ZKysF3nS2FS+2E/0CQuQT5iCSvth3OZUUYH3/acuXKwn
         ST4eyQ12bxWGR+5d1MoTOjWw7Bmw0Ar8PKlGiqnYteyjab/LJ9obUMPA90VZXY13xfJB
         +ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746119579; x=1746724379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlHHbc5+ml6sPmEKiUUZJGlD/QUxB9ALkFtouoIfjNg=;
        b=Qk2i4RTYIDW+gRbT0N1UwuzWOzw7SaoDPbyKPnHCYkqtwjgCZCYnMnY8cO0fOmKwzI
         dOvewCfqa0fMvEZLRxVMgCxb3yGgWtOdarhWOQasQ4jyoPftGey3EkLRlB2PF+o5UqcT
         sozyJaGg9+9sDPmZbDqk2Z+H1cvqGqU4qPvdx9+IWUf/U+4XTxq/JbAIWiuAJjW2UlZL
         25BtxqFIsegajSL95ND1teCmEW+lL2lsQ8uYyPI3WMT+psHbsdLLtqFHQiPGF8JWpMR1
         drG9PcqvbWNVTtJPluNoqqpuO5qbuGr09ouQue53kowtXVUOEqrxACIai+7kFMO1HAu9
         sGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVYFyXGbozfZZTdtuGkwzD+Qnq707EI2o74pk7lFwrUh7uJNFYxYkktKb8YJgJOSzQhPx3Q3/PHzJFB8dlQ3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCl785PlkjMmU4vONIJaqFU0XiVMjrvaXMQHizDdkz3tKKq8K7
	Y9E1YhSU8G3+hmMwiKZnNjj9dIpxeS2xt4ueTRvXanL//z99BvRJ
X-Gm-Gg: ASbGncsAc/dbUDnYIu6/IGZDXhB0mOeRo9etbbuR6r1zi1PrWk3xTbUUbIKOWCiSFZ/
	SO0u6xF/E9omxCHdrMnZQ7GNT6AQPF3uKMx3cO231kJHs5ZunXJAKxIPEz89pHmbAyhQ9SNfGPk
	qRQMhTNGrpVvTbzezwlWzB1z1CollOD0hBVAdUhVnZa9ISoKBspPnfQfuBvekgEHe+yVaL8VYV8
	takUi+7YyV18vzYRrUXWhTw9CV/A3T4KqwjXarA3qSrmZPukno+StDkmBwQXhRLNMmHjVCr6a9L
	1d7Wqfc8jommnTulAkZZk4rQYDDiKxok1CUv+umhk7USAoln7aBzvg==
X-Google-Smtp-Source: AGHT+IGcXSdHg2HJQYNHP6oKCpJrNvY9UmPbAbusOzRBHoxuieydlL/Krp09qHR9skqPF4gt/PYS9g==
X-Received: by 2002:a05:6000:438a:b0:3a0:7c91:4aaf with SMTP id ffacd0b85a97d-3a094058b54mr2496196f8f.19.1746119578675;
        Thu, 01 May 2025 10:12:58 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3e04asm1340788f8f.18.2025.05.01.10.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 10:12:58 -0700 (PDT)
Message-ID: <22f6f12b-d002-4ada-834e-00ef0073bd9e@gmail.com>
Date: Thu, 1 May 2025 19:12:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Ralf Jung <post@ralfj.de>
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.25 10:36 AM, Christian Schrefl wrote:
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
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
>  init/Kconfig                       |   3 +
>  rust/kernel/lib.rs                 |   1 +
>  rust/kernel/types.rs               |   6 ++
>  rust/kernel/types/unsafe_pinned.rs | 115 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 63f5974b9fa6ea3f5c92203cedd1f2f82aa468a1..727d85d2b59f555f1c33103bb78698551a41e7ca 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -140,6 +140,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>  config RUSTC_HAS_COERCE_POINTEE
>  	def_bool RUSTC_VERSION >= 108400
>  
> +config RUSTC_HAS_UNSAFE_PINNED
> +	def_bool RUSTC_VERSION >= 108800
> +
>  config PAHOLE_VERSION
>  	int
>  	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index de07aadd1ff5fe46fd89517e234b97a6590c8e93..c08f0a50f1d8db95799478caa8e85558a1fcae8d 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -17,6 +17,7 @@
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
> +#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]
>  #![feature(inline_const)]
>  #![feature(lint_reasons)]
>  // Stable in Rust 1.82
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
> index 0000000000000000000000000000000000000000..5a200aac30792bf71098087aee0fd9d2d51c468f
> --- /dev/null
> +++ b/rust/kernel/types/unsafe_pinned.rs
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: Apache-2.0 OR MIT
> +
> +//! The contents of this file partially come from the Rust standard library, hosted in
> +//! the <https://github.com/rust-lang/rust> repository, licensed under
> +//! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
> +//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
> +//!
> +//! This file provides a implementation / polyfill of a subset of the upstream
> +//! rust `UnsafePinned` type.
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

[CC Ralf]

Ralf has replied to me on Github that this will most likely change [0]. How should this be handled?

I would fine with submitting a patch once it changes on the rust side (possibly waiting until the
feature is close to stabilization). I think it is better to only add this guarantee later as it
will be easier to remove unnecessary `UnsafeCell`s than it would be to later add them back in ever
case where they would be needed (in case rust doesn't change `UnsafePinned` to act like `UnsafeCell`).

Also see to the tracking issue [1] for the reason why `UnsafeCell` behavior is most likely required.

[0]: https://github.com/rust-lang/rust/issues/125735#issuecomment-2842926832
[1]: https://github.com/rust-lang/rust/issues/137750

Cheers
Christian

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
> +///
> +/// In order to disable niche optimizations this implementation uses [`UnsafeCell`] internally,
> +/// the upstream version however will not. So the fact that [`UnsafePinned`] contains an
> +/// [`UnsafeCell`] must not be relied on (Other than the niche blocking).
> +// As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
> +// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
> +//      Required to use the `!Unpin hack`.
> +// - `UnsafeCell<T>` instead of T to disallow niche optimizations,
> +//     which is handled in the compiler in upstream Rust
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
> +    /// ```rust,no_build
> +    /// use kernel::types::UnsafePinned;
> +    ///
> +    /// unsafe {
> +    ///     let mut x = UnsafePinned::new(0);
> +    ///     let ptr = x.get(); // read-only pointer, assumes immutability
> +    ///     x.get_mut_unchecked().write(1);
> +    ///     ptr.read(); // UB!
> +    /// }
> +    /// ```
> +    ///
> +    /// Note that the `get_mut_unchecked` function used by this example is
> +    /// currently not implemented in the kernel implementation.
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn get(&self) -> *const T {
> +        self.value.get()
> +    }
> +
> +    /// Gets a mutable pointer to the wrapped value.
> +    ///
> +    /// The difference from `get_mut_pinned` and `get_mut_unchecked` is that this function
> +    /// accepts a raw pointer, which is useful to avoid the creation of temporary references.
> +    ///
> +    /// These functions mentioned here are currently not implemented in the kernel.
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

