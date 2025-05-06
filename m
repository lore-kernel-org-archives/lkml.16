Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE02D278750;
	Tue,  6 May 2025 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530413; cv=none; b=cMwO0SgzJsqekvocLEgNKZVOoTwHrqiAxFS25oy3MU1FINPUpIjNlkeMowJyqIVrYHyPitLy6V6paXwkd0yIBUb1mfS/GlMelk+H5ywF68+qskhwzFSmzL4Crlm89P0ONhmZbCS1YTPWWimY5DTPDi3b1x1ravciwtLP9D1RTSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530413; c=relaxed/simple;
	bh=ZbB0EaCRjnK9zJ95214Hqv/d5l3ocR0XiDjkDTXwTzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e8Lgwts33WXm/yElffFWoaz1GXF/sjypfaaSybvrFTQcqism0qS0JOim8oBDVv5fUiKcT1bKuEodrQGS+OCRM5vO8T2FZt3b84RronWBCKMqCJ1cusmIERHHQiFISz/5/fPhnn8KwpBCDfWLx/dclo555mEEzBQgBhPBoEdQuKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzGncVAa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzGncVAa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC637C4CEE4;
	Tue,  6 May 2025 11:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746530413;
	bh=ZbB0EaCRjnK9zJ95214Hqv/d5l3ocR0XiDjkDTXwTzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lzGncVAagPXGfMlDLb799dK2aMqWN4K+q22IowgDUMyFve6BaaFNzvdJWsZW7FjRQ
	 UWJWux4NrghIqUIplSH5V3XYUYHp7chsydOcGJWYwV75kz/hSa3y2PhZSUm/cMfWRd
	 /5qDq3O9QdNA125jBqly97dTJOOQy6hj5igZ0XXHxKqr/YpDGX+BmvwJ/0VoTmJ0KY
	 GpUKryS6KteMeaPahDJs4+/BhACdO6ddwLE9at+pmyifR6bHf1UYi/pBlFGy5NZ62P
	 Pd2M5ed+QlCBA688k62bb0rJ21z1ug2cciSBEHD2notIicy178AVWlhHTWwhkHgLQS
	 mZ3TsLMuj2kCw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Oliver Mangold" <oliver.mangold@pm.me>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
In-Reply-To: <aBSsrLGSJgLGTViT@google.com> (Alice Ryhl's message of "Fri, 02
	May 2025 11:29:48 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<20250502-unique-ref-v10-1-25de64c0307f@pm.me>
	<ZQ8N85Nd1qwR7qgLQKvl4cyYaCeQPD_ugOpVmYypwTmeLoV6acIhB2WLf3eBT-VUjm6jWF2qQzp2tU0kCqq39A==@protonmail.internalid>
	<aBSsrLGSJgLGTViT@google.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 13:20:04 +0200
Message-ID: <87ecx2q93v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, May 02, 2025 at 09:02:29AM +0000, Oliver Mangold wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>
>> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
>> C FFI) type that *may* be owned by Rust, but need not be. Unlike
>> AlwaysRefCounted, this mechanism expects the reference to be unique
>> within Rust, and does not allow cloning.
>>
>> Conceptually, this is similar to a KBox<T>, except that it delegates
>> resource management to the T instead of using a generic allocator.
>>
>> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> [ om:
>>   - split code into separate file and `pub use` it from types.rs
>>   - make from_raw() and into_raw() public
>>   - fixes to documentation
>> ]
>> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>> ---
>>  rust/kernel/types.rs         |   3 ++
>>  rust/kernel/types/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 120 insertions(+)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 9d0471afc9648f2973235488b441eb109069adb1..5d8a99dcba4bf733107635bf3f0c15840ec33e4c 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -11,6 +11,9 @@
>>  };
>>  use pin_init::{PinInit, Zeroable};
>>
>> +pub mod ownable;
>> +pub use ownable::{Ownable, OwnableMut, Owned};
>> +
>>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>>  ///
>>  /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
>> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..52e7a69019f1e2bbbe3cf715651b67a5a5c7c13d
>> --- /dev/null
>> +++ b/rust/kernel/types/ownable.rs
>> @@ -0,0 +1,117 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Owned reference types.
>> +
>> +use core::{
>> +    marker::PhantomData,
>> +    mem::ManuallyDrop,
>> +    ops::{Deref, DerefMut},
>> +    ptr::NonNull,
>> +};
>> +
>> +/// Types that may be owned by Rust code or borrowed, but have a lifetime managed by C code.
>> +///
>> +/// It allows such types to define their own custom destructor function to be called when
>> +/// a Rust-owned reference is dropped.
>> +///
>> +/// This is usually implemented by wrappers to existing structures on the C side of the code.
>> +///
>> +/// # Safety
>> +///
>> +/// Implementers must ensure that:
>> +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that owned reference exists (i.e.
>> +///   until the [`release()`](Ownable::release) trait method is called).
>> +/// - That the C code follows the usual mutable reference requirements. That is, the kernel will
>> +///   never mutate the [`Ownable`] (excluding internal mutability that follows the usual rules)
>> +///   while Rust owns it.
>
> This seems too strong? Or does the exception mean to say that this does
> not apply to anything containing `Opaque`? By far most structs using
> this will use Opaque, so maybe directly mention Opaque instead?

`Opaque` is covered by "(excluding internal mutability that follows the usual rules)".

>
> That C code follows the usual aliasing rules. That is, unless the value
> is wrapped in `Opaque` (or `UnsafeCell`), then the value must not be
> modified in any way while Rust owns it, unless that modification happens
> inside a `&mut T` method on the value.
>
>> +pub unsafe trait Ownable {
>> +    /// Releases the object (frees it or returns it to foreign ownership).
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must ensure that the object is no longer referenced after this call.
>> +    unsafe fn release(this: NonNull<Self>);
>> +}
>> +
>> +/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut Owned<T>` Rust reference
>> +/// may be dereferenced into a `&mut T`.
>> +///
>> +/// # Safety
>> +///
>> +/// Implementers must ensure that access to a `&mut T` is safe, implying that it is okay to call
>> +/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (meaning: most kernel types).
>> +pub unsafe trait OwnableMut: Ownable {}
>> +
>> +/// An owned reference to an ownable kernel object.
>> +///
>> +/// The object is automatically freed or released when an instance of [`Owned`] is
>> +/// dropped.
>> +///
>> +/// # Invariants
>> +///
>> +/// The pointer stored in `ptr` is valid for the lifetime of the [`Owned`] instance.
>
> This should probably talk about ownership.

How about

  The pointee of `ptr` can be considered owned by the [`Owned`] instance.


Best regards,
Andreas Hindborg


