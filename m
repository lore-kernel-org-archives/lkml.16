Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BB713957E;
	Wed, 30 Apr 2025 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034219; cv=none; b=VnKG1wdCPar6uq2I6tR9nVjjbST3hzvEEIwNT1MOjVJdiRnZU+ItenJDU5YeGy3sP715j1oAh87sDsa/6VfLkfC4Kr+vaF2mdvkvQ7lhQw2lPNmeFOSu6jv0in4WHT2BaaE6sHN9xE1P4kbnTvakpqExKQjB1cITgoeayLypf/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034219; c=relaxed/simple;
	bh=Fcnn9vzgEMQPT9QOLZZGAEjkYX2/SRNIRwXNMifB/qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdJWhMn7InGO9CQSXoxSHGLR7VrFwHBpf0pHVXcs4friq4UrWdt+CHF1kUdzwdjfbZ6sOG2mluMTPa7WsVBpG5sBYepc0CY5Jdm5I1wsiR71dZhW9QN/yQgJh8XQdt1jLk3PjQ4EZL97Elb4SPUT8hif0IEYnUuvjydfFAm+GQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCrjNMHQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCrjNMHQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso344585e9.0;
        Wed, 30 Apr 2025 10:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746034215; x=1746639015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wy+1/Lbl7k4WMpXsEZmhe+H3bBSiMXMQE0j8Vp3BrzY=;
        b=NCrjNMHQiXGpWW8w0CC/AFfIjc3DgLUQobIfH8CKpNzkWP6nxHw5DKpNsWoDAs2N74
         V0mMnH2eCSki/X6ryMI0p1CXokj4vkkt6emCzpLHkOB9tE5IhFDD8VEO4mbpZ8o30fdF
         ebV7yiWQX7nqesByzGtFyOPzPMssrzkvURLxJ6KOvrubnWUWeN1c+8m0FCfBzCE7WPtG
         KQqhzxK+AftpUq4Z/MfCoRWF32f8CIHK9NCm2P+MiBzHbTLgFaXcAjHCb1oYzGYAQN2H
         LGCalrnb5z+cch44JQtFqPq4kpT4OW93HcRwGARAmul6tkbFK5CtWreLyXJNNY8SkUXW
         9dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034215; x=1746639015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wy+1/Lbl7k4WMpXsEZmhe+H3bBSiMXMQE0j8Vp3BrzY=;
        b=Xr4B9cAJydiPSXy1B2So0N+FCaY/7jt5wNC09tjBsvp2aYaJhlC9y2u0iFn7fJASzS
         2CZ3ROC6B9wj/o1haOU8XNn/dA8EdSEJo3t6RwfPoKhTpvH+b9J4eDmctDdadcBb+8WS
         B/6RBXKfCgJ8EEsC/MJJz0w0dG/m8gkvbwdmErVzSuoKWyJVx63Kpqbp7js58e/tszhv
         FO7mGFEee5qbG7FG9hIUddH6Qun5+mcf1CrBcTKkpsuNHa2bejJG8ByI/IN8BGhMde8c
         ZTUslHdrVflcC3I6VjTpXG3Shjl8HbbS96Zt2nPiK7IWJD3thKgk/JuI1rHaFadtafeT
         Z89A==
X-Forwarded-Encrypted: i=1; AJvYcCWf8FR7XDb9tZLXJ/gj1xza05nC4lUxsMPSN93pJzneq9Sa3KrUoxircqpeTV5rX9FnWspR2ACbHSqtOoQSCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2KqUrU8rSptT1kAzu0/4uCSfYZ/grNoBCrPN2p8Rdx1MrDAfa
	14SnDatZpUs7vi4Myr7sWFQJYznVuyFvO1Bp46ya+EZ9rInu3Yqw
X-Gm-Gg: ASbGncs2YEnlSgGV9NUxUg19qgdj0h8CyjFJnb3tUp4cW/zQQpABA0lxYXWjQfadPbx
	tAj5wEvr0V/2/zMATtBWE92lEey4k7KFgdzgFsdmI9rxIg5StDBvL5Vwwzbh2mx3oUv5FVU6mbv
	kR2zKUDbM2dKmoGCzKKTpfEHq8beSNhhGN6u1LOqQyDXpUlPN8Pdk7PbZeY2GkJZC6ZJePpheTB
	rW+34Fm+Zqnt2dnMD1UYwNZDdMyDslJAX2q/lXBEsFBjpik7ZirCQiXvqTlN1+6MwO1b2+tXGc0
	opRRigx1yMg/SCwtlJUxkCYH0tWRCf9BCqa5Z+4v1VfXw2zImhfWpg==
X-Google-Smtp-Source: AGHT+IGtX4DNXIToGGmZk40Cm8/53BJiE64jieqz93RLKO0CQZI8NttAmQHwc9hhZecB5EcNuEYHEA==
X-Received: by 2002:a05:600c:c86:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-441b1f35e4emr48964695e9.10.1746034215093;
        Wed, 30 Apr 2025 10:30:15 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca72sm17205898f8f.4.2025.04.30.10.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 10:30:14 -0700 (PDT)
Message-ID: <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>
Date: Wed, 30 Apr 2025 19:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.25 11:45 AM, Benno Lossin wrote:
> On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
>> `UnsafePinned<T>` is useful for cases where a value might be shared with
>> C code but not directly used by it. In particular this is added for
>> storing additional data in the `MiscDeviceRegistration` which will be
>> shared between `fops->open` and the containing struct.
>>
>> Similar to `Opaque` but guarantees that the value is always initialized
>> and that the inner value is dropped when `UnsafePinned` is dropped.
>>
>> This was originally proposed for the IRQ abstractions [0] and is also
>> useful for other where the inner data may be aliased, but is always
>> valid and automatic `Drop` is desired.
>>
>> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
>> as a unstable feature, therefore this patch implements the subset of the
>> upstream API for the `UnsafePinned` type required for additional data in
>> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>>
>> Some differences to the upstream type definition are required in the
>> kernel implementation, because upstream type uses some compiler changes
>> to opt out of certain optimizations, this is documented in the
>> documentation and a comment on the `UnsafePinned` type.
>>
>> The documentation on is based on the upstream rust documentation with
>> minor modifications for the kernel implementation.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>> Link: https://github.com/rust-lang/rust/pull/137043 [1]
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
>> Co-developed-by: Sky <sky@sky9.dev>
>> Signed-off-by: Sky <sky@sky9.dev>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
>> ---
>>  init/Kconfig                       |   3 +
>>  rust/kernel/lib.rs                 |   1 +
>>  rust/kernel/types.rs               |   6 ++
>>  rust/kernel/types/unsafe_pinned.rs | 115 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 125 insertions(+)
>>
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 63f5974b9fa6ea3f5c92203cedd1f2f82aa468a1..727d85d2b59f555f1c33103bb78698551a41e7ca 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -140,6 +140,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>>  config RUSTC_HAS_COERCE_POINTEE
>>  	def_bool RUSTC_VERSION >= 108400
>>  
>> +config RUSTC_HAS_UNSAFE_PINNED
>> +	def_bool RUSTC_VERSION >= 108800
>> +
>>  config PAHOLE_VERSION
>>  	int
>>  	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index de07aadd1ff5fe46fd89517e234b97a6590c8e93..c08f0a50f1d8db95799478caa8e85558a1fcae8d 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -17,6 +17,7 @@
>>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
>>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
>>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
>> +#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]
>>  #![feature(inline_const)]
>>  #![feature(lint_reasons)]
>>  // Stable in Rust 1.82
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546578f2f04cdf615e 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -253,6 +253,9 @@ fn drop(&mut self) {
>>  ///
>>  /// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>>  ///
>> +/// In cases where the contained data is only used by Rust, is not allowed to be
>> +/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] should be used instead.
>> +///
>>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>>  /// It gets rid of all the usual assumptions that Rust has for a value:
>>  ///
>> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>>  /// [`NotThreadSafe`]: type@NotThreadSafe
>>  #[allow(non_upper_case_globals)]
>>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
>> +
>> +mod unsafe_pinned;
>> +pub use unsafe_pinned::UnsafePinned;
>> diff --git a/rust/kernel/types/unsafe_pinned.rs b/rust/kernel/types/unsafe_pinned.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5a200aac30792bf71098087aee0fd9d2d51c468f
>> --- /dev/null
>> +++ b/rust/kernel/types/unsafe_pinned.rs
>> @@ -0,0 +1,115 @@
>> +// SPDX-License-Identifier: Apache-2.0 OR MIT
>> +
>> +//! The contents of this file partially come from the Rust standard library, hosted in
>> +//! the <https://github.com/rust-lang/rust> repository, licensed under
>> +//! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
>> +//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
>> +//!
>> +//! This file provides a implementation / polyfill of a subset of the upstream
>> +//! rust `UnsafePinned` type.
>> +
>> +use core::{cell::UnsafeCell, marker::PhantomPinned};
>> +use pin_init::{cast_pin_init, PinInit, Wrapper};
>> +
>> +/// This type provides a way to opt-out of typical aliasing rules;
>> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a unique pointer.
>> +///
>> +/// However, even if you define your type like `pub struct Wrapper(UnsafePinned<...>)`, it is still
>> +/// very risky to have an `&mut Wrapper` that aliases anything else. Many functions that work
>> +/// generically on `&mut T` assume that the memory that stores `T` is uniquely owned (such as
>> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrapper` is not immediate
>> +/// Undefined Behavior, it is still unsound to expose such a mutable reference to code you do not
>> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are needed to ensure soundness.
>> +///
>> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up in
>> +/// the public API of a library. It is an internal implementation detail of libraries that need to
>> +/// support aliasing mutable references.
>> +///
>> +/// Further note that this does *not* lift the requirement that shared references must be read-only!
>> +/// Use [`UnsafeCell`] for that.
>> +///
>> +/// This type blocks niches the same way [`UnsafeCell`] does.
>> +///
>> +/// # Kernel implementation notes
>> +///
>> +/// This implementation works because of the "`!Unpin` hack" in rustc, which allows (some kinds of)
>> +/// mutual aliasing of `!Unpin` types. This hack might be removed at some point, after which only
>> +/// the `core::pin::UnsafePinned` type will allow this behavior. In order to simplify the migration
>> +/// to future rust versions only this polyfill of this type should be used when this behavior is
>> +/// required.
>> +///
>> +/// In order to disable niche optimizations this implementation uses [`UnsafeCell`] internally,
>> +/// the upstream version however will not. So the fact that [`UnsafePinned`] contains an
>> +/// [`UnsafeCell`] must not be relied on (Other than the niche blocking).
> 
> I would make this last paragraph a normal comment, I don't think we
> should expose it in the docs.

I added this as docs since I wanted it to be a bit more visible,
but I can replace the comment text (about `UnsafeCell`) with this paragraph
and drop it from the docs if you want.
 
>> +// As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
>> +// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
>> +//      Required to use the `!Unpin hack`.
>> +// - `UnsafeCell<T>` instead of T to disallow niche optimizations,
>> +//     which is handled in the compiler in upstream Rust
>> +#[repr(transparent)]
>> +pub struct UnsafePinned<T: ?Sized> {
>> +    _ph: PhantomPinned,
>> +    value: UnsafeCell<T>,
>> +}
>> +
>> +impl<T> UnsafePinned<T> {
>> +    /// Constructs a new instance of [`UnsafePinned`] which will wrap the specified value.
>> +    ///
>> +    /// All access to the inner value through `&UnsafePinned<T>` or `&mut UnsafePinned<T>` or
>> +    /// `Pin<&mut UnsafePinned<T>>` requires `unsafe` code.
>> +    #[inline(always)]
>> +    #[must_use]
>> +    pub const fn new(value: T) -> Self {
>> +        UnsafePinned {
>> +            value: UnsafeCell::new(value),
>> +            _ph: PhantomPinned,
>> +        }
>> +    }
>> +}
>> +impl<T: ?Sized> UnsafePinned<T> {
>> +    /// Get read-only access to the contents of a shared `UnsafePinned`.
>> +    ///
>> +    /// Note that `&UnsafePinned<T>` is read-only if `&T` is read-only. This means that if there is
>> +    /// mutation of the `T`, future reads from the `*const T` returned here are UB! Use
>> +    /// [`UnsafeCell`] if you also need interior mutability.
> 
> I agree with copy-pasting the docs from upstream, even though our
> implementation already wraps the value in `UnsafeCell`, but I think we
> should include a comment at the top of this doc that mentions this
> difference. So something along the lines "In order to make replacing
> this type with the upstream one, we want to have as little API
> divergence as possible. Thus we don't mention the implementation detail
> of `UnsafeCell` and people have to use `UnsafePinned<UnsafeCell<T>>`
> instead of just `UnsafePinned<T>`." feel free to modify.
> 

I already wrote about this in comments (and documentation in this version)
on the `UnsafePinned` type definition.

I'm not sure where exactly we want to have this, but I think having it
at the top of the file and on the type definition is a bit redundant.

>
> If we add that, maybe we don't need the comment about needing
> `UnsafeCell` in `Opaque` after all (from my other mail).

I think I should still add a comment there.

> 
>> +    ///
>> +    /// [`UnsafeCell`]: core::cell::UnsafeCell
>> +    ///
>> +    /// ```rust,no_build
>> +    /// use kernel::types::UnsafePinned;
>> +    ///
>> +    /// unsafe {
>> +    ///     let mut x = UnsafePinned::new(0);
>> +    ///     let ptr = x.get(); // read-only pointer, assumes immutability
>> +    ///     x.get_mut_unchecked().write(1);
>> +    ///     ptr.read(); // UB!
>> +    /// }
>> +    /// ```
>> +    ///
>> +    /// Note that the `get_mut_unchecked` function used by this example is
>> +    /// currently not implemented in the kernel implementation.
>> +    #[inline(always)]
>> +    #[must_use]
>> +    pub const fn get(&self) -> *const T {
>> +        self.value.get()
>> +    }
>> +
>> +    /// Gets a mutable pointer to the wrapped value.
>> +    ///
>> +    /// The difference from `get_mut_pinned` and `get_mut_unchecked` is that this function
>> +    /// accepts a raw pointer, which is useful to avoid the creation of temporary references.
> 
> You did not include the `get_mut_{pinned,unchecked}` methods, so
> mentioning them here in the docs might confuse people. Do we want to
> have those methods?

I only included the functions that we needed for `Opaque` and my
`miscdevice' patches. I think these functions should only be added
once they have a user. That's why I wrote the next sentence in the
documents.

Should I handle this differently?

It should be a really simple patch to add these functions and I can
do that if someone needs them or I can just include them in this
patch set.

Cheers
Christian

> 
> ---
> Cheers,
> Benno
> 
>> +    ///
>> +    /// These functions mentioned here are currently not implemented in the kernel.
>> +    #[inline(always)]
>> +    #[must_use]
>> +    pub const fn raw_get_mut(this: *mut Self) -> *mut T {
>> +        this as *mut T
>> +    }
>> +}
>> +
>> +impl<T> Wrapper<T> for UnsafePinned<T> {
>> +    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
>> +        unsafe { cast_pin_init(init) }
>> +    }
>> +}
> 

