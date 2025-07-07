Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EB285CB8;
	Mon,  7 Jul 2025 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880826; cv=none; b=odiyNieSlJYl/RjjNbwrG7hQL2HN/Hlk/zuUBFae4ZLG5IlcQNc3ujpO7ukEka/XwIYprJ4EI6tN0eOYG3geyqQ+BQEsKx/XR0pNnji7u2knVLazpw2+SYWeT8AY96YyLOoNUs/1md0jd01MQp4mYDdVuXyRBMqn37FQ8VkTc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880826; c=relaxed/simple;
	bh=kiswASZbpY5UWMvyVnBUg3s9ZvADixZDR11+evJdR9o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ef04yeY8fs/+yR3F0Pg27EDmQgzq2vnbyaMV7i457bHYhf7hfn+V0RUj9DNp7YZD4To6almcoUz+KPB0038avAetKfg9o8+c4h0L7T3A67a1cuKSj6Oud5XwYLhdd6u8PRa4D42jEbtlhBmkZPgnSfKCuZUbvVxzFOdvXhU3n7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUWLnZqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUWLnZqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545AEC4CEE3;
	Mon,  7 Jul 2025 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751880825;
	bh=kiswASZbpY5UWMvyVnBUg3s9ZvADixZDR11+evJdR9o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hUWLnZqrltWqHSw4akA0MajvS+rhSQQMgmGdPOm4acAT9Wsj2o7L5eqLcUlDe7vfF
	 AT+FBV5Xhj9QWupvjcCESyhvtNKkjhgJFJ3J6sjdHWcYOHIuEZDmLrtgdCJOgx08lO
	 lJ7ASrmhMfvbwesTj0oCQLrG7m2mBZcUQfP8ouWgdn/ddQy8KARwa1kV++zWBspuTf
	 A0+vo7QpAUPSzhl/6HlGFnlRZ4FDFGdLVQu3gjQ9QcSj9rfl7cFbN/YwjmeacNwQxq
	 sbHK/jTorBZRpMl3XDj+sv0pukARbRcAXGTOfPTfi+3IWe66cKoJvywff78q1eJmi6
	 p8ZHeMQBi3MGw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 11:33:41 +0200
Message-Id: <DB5PX74OB3DX.1UNT8MIBWNC2G@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Asahi Lina" <lina+kernel@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 4/4] rust: Add `OwnableRefCounted`
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>
 <DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org> <aGuAR7JCrlmzQrx4@mango>
In-Reply-To: <aGuAR7JCrlmzQrx4@mango>

On Mon Jul 7, 2025 at 10:07 AM CEST, Oliver Mangold wrote:
> On 250702 1524, Benno Lossin wrote:
>> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
>> > @@ -132,3 +134,124 @@ fn drop(&mut self) {
>> >          unsafe { T::release(self.ptr) };
>> >      }
>> >  }
>> > +
>> > +/// A trait for objects that can be wrapped in either one of the refe=
rence types [`Owned`] and
>> > +/// [`ARef`].
>> > +///
>> > +/// # Safety
>> > +///
>> > +/// Implementers must ensure that:
>> > +///
>> > +/// - [`try_from_shared()`](OwnableRefCounted::into_shared) only retu=
rns an [`Owned<Self>`] if
>> > +///   exactly one [`ARef<Self>`] exists.
>>=20
>> This shouldn't be required?
>
> Ehm, why not? `Owned<T>` is supposed to be unique.

It's not needed as a safety requirement for implementing the trait. If
the implementation only contains sound code, then `Owned::from_raw`
should already ensure that `Owned<Self>` is only created if there is
exactly one reference to it.

>> > +/// - [`into_shared()`](OwnableRefCounted::into_shared) set the refer=
ence count to the value which
>> > +///   the returned [`ARef<Self>`] expects for an object with a single=
 reference in existence. This
>> > +///   implies that if [`into_shared()`](OwnableRefCounted::into_share=
d) is left on the default
>> > +///   implementation, which just rewraps the underlying object, the r=
eference count needs not to be
>> > +///   modified when converting an [`Owned<Self>`] to an [`ARef<Self>`=
].
>>=20
>> This also seems pretty weird...
>>=20
>> I feel like `OwnableRefCounted` is essentially just a compatibility
>> condition between `Ownable` and `RefCounted`. It ensures that the
>> ownership declared in `Ownable` corresponds to exactly one refcount
>> declared in `RefCounted`.
>>=20
>> That being said, I think a `RefCounted` *always* canonically is
>> `Ownable` by the following impl:
>>=20
>>     unsafe impl<T: RefCounted> Ownable for T {
>>         unsafe fn release(this: NonNull<Self>) {
>>             T::dec_ref(this)
>>         }
>>     }
>>=20
>> So I don't think that we need this trait at all?
>
> No. For an `ARef<T>` to be converted to an `Owned<T>` it requires a
> `try_from_shared()` implementation. It is not even a given that the
> function can implemented, if all the kernel exposes are some kind of
> `inc_ref()` and `dec_ref()`.

I don't understand this paragraph.

> Also there are more complicated cases like with `Mq::Request`, where the
> existence of an `Owned<T>` cannot be represented by the same refcount val=
ue
> as the existence of exactly one `ARef<T>`.

Ah right, I forgot about this. What was the refcount characteristics of
this again?

*  1 =3D in flight, owned by C
*  2 =3D in flight, owned by Rust
* >2 =3D in flight, owned by Rust + additional references used by Rust
       code

Correct? Maybe @Andreas can check.

>> > +///
>> > +/// # Examples
>>=20
>> If we're having an example here, then we should also have on on `Owned`.
>
> Yes, maybe. I mostly felt the need to create one for `OwnableRefCounted`
> because it is a more complex idea than `Ownable`.
>
> If I remember correctly, I didn't create one for `Owned`, as it should
> probably more or less the same as for `ARef` and the one there has even
> more problems of the kind you are pointing out. So maybe it would be best
> to wait until someone fixes that and have the fixed version copied over t=
o
> `Owned` in the process?

Wait which problems on `ARef` do you mean? I disagree that `Owned` and
`ARef` have the same example. `Owned` should expose operations that
`ARef` can't otherwise there would be no value in using `Owned`.

>> > +///
>> > +/// A minimal example implementation of [`OwnableRefCounted`], [`Owna=
ble`] and its usage with
>> > +/// [`ARef`] and [`Owned`] looks like this:
>> > +///
>> > +/// ```
>> > +/// # #![expect(clippy::disallowed_names)]
>> > +/// use core::cell::Cell;
>> > +/// use core::ptr::NonNull;
>> > +/// use kernel::alloc::{flags, kbox::KBox, AllocError};
>> > +/// use kernel::types::{
>> > +///     ARef, RefCounted, Owned, Ownable, OwnableRefCounted,
>> > +/// };
>> > +///
>> > +/// struct Foo {
>> > +///     refcount: Cell<usize>,
>> > +/// }
>> > +///
>> > +/// impl Foo {
>> > +///     fn new() -> Result<Owned<Self>, AllocError> {
>> > +///         // Use a `KBox` to handle the actual allocation.
>> > +///         let result =3D KBox::new(
>> > +///             Foo {
>> > +///                 refcount: Cell::new(1),
>> > +///             },
>> > +///             flags::GFP_KERNEL,
>> > +///         )?;
>> > +///         let result =3D NonNull::new(KBox::into_raw(result))
>> > +///             .expect("Raw pointer to newly allocation KBox is null=
, this should never happen.");
>>=20
>> I'm not really convinced that an example using `KBox` is a good one...
>> Maybe we should just have a local invisible `bindings` module that
>> exposes a `-> *mut foo`. (internally it can just create a KBox`)
>
> The example would become quite a bit more complicated then, no?

Just hide those parts behind `#` lines in the example.

---
Cheers,
Benno
