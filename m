Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1628C2C4;
	Mon,  7 Jul 2025 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880221; cv=none; b=DX6E0U65ZQpgd1MYzngqMJoGlC+cjEzvaueCzQ9OukIUEKQWQsvDfItAxM9/OtIcvt/Q7k6+s+Bb1UDCSyef9lrCS0jRMwNMuecDDx7V1J7VMhkNKoamWRQh+I0gTaZwa8Ss+i2EKQg0zrPVULCxG+DByFt7uDa2JNk89+zxMRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880221; c=relaxed/simple;
	bh=+KASChTcoQ47phcIh1NySTu90by2mpX9tu57u3X7ooU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HLCGvQUuCf4iFnDkfQotKatNU7mYpazCPzCIxGs1aRMxLuBQNL6Cg9eGOGQGn/4nUzvmuX+WkWLGeaf3mDqNsE8Ag1PWitwuLNuq+h7mOt1KPJDP6VQnudSE0UM5yqH7rhEMEZJ+oBVAAANTShFKYJ+4hh2Wk+/I8RZF+uuLoq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/CslROb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/CslROb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025A5C4CEEF;
	Mon,  7 Jul 2025 09:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751880221;
	bh=+KASChTcoQ47phcIh1NySTu90by2mpX9tu57u3X7ooU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=l/CslROb7rGL35egZyGWsLNJpI5SCrfUDMugo/7qtHcvfOKRScNLjuvz6qTEMzYJP
	 E/U8FKRhdr5HEPCQ3I+GMqbA8WNEWXBj9PRZQ0vFpEWcgln9urPCJY0uizaz7RIdYY
	 4Zb64bQve25oFeabYa7wNm9jq9unOgSoAN7NUanHd55zgdJGuFZXHdNLoT6cGE7+Eq
	 XPpr79GyZ0b0du8UC0IaYV2F9rjScuwCLoWGTJfntpJczVsdlAasYQCZ+/oXGmjzsK
	 erLmeiqPcxsJqYAnHEhFT/4wveqLsCkU9w0XduFHZCMQzWjzE9chcLLr5GK272PN+u
	 mE3pxt8UzSFRg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 11:23:35 +0200
Message-Id: <DB5PPGOWNW4K.2C5A4UE9V9IEF@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Asahi Lina" <lina+kernel@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 1/4] rust: types: Add Ownable/Owned types
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me>
 <DB1IPFNLFDWV.2V5O73DOB2RV6@kernel.org> <aGtv9qs682gTyQWX@mango>
In-Reply-To: <aGtv9qs682gTyQWX@mango>

On Mon Jul 7, 2025 at 8:58 AM CEST, Oliver Mangold wrote:
> On 250702 1303, Benno Lossin wrote:
>> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
>> > From: Asahi Lina <lina+kernel@asahilina.net>
>> >
>> > By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
>> > (typically C FFI) type that *may* be owned by Rust, but need not be. U=
nlike
>> > `AlwaysRefCounted`, this mechanism expects the reference to be unique
>> > within Rust, and does not allow cloning.
>> >
>> > Conceptually, this is similar to a `KBox<T>`, except that it delegates
>> > resource management to the `T` instead of using a generic allocator.
>> >
>> > Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e=
@asahilina.net/
>> > Signed-off-by: Asahi Lina <lina@asahilina.net>
>> > [ om:
>> >   - split code into separate file and `pub use` it from types.rs
>> >   - make from_raw() and into_raw() public
>> >   - fixes to documentation and commit message
>> > ]
>> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>> > ---
>> >  rust/kernel/types.rs         |   7 +++
>> >  rust/kernel/types/ownable.rs | 134 ++++++++++++++++++++++++++++++++++=
+++++++++
>>=20
>> I think we should name this file `owned.rs` instead. It's also what
>> we'll have for `ARef` when that is moved to `sync/`.
>>=20
>> Also, I do wonder does this really belong into the `types` module? I
>> feel like it's becoming our `utils` module and while it does fit, I
>> think we should just make this a top level module. So
>> `rust/kernel/owned.rs`. Thoughts?
>
> I don't have much of an opinion on on that. But maybe refactoring types.r=
s
> should be an independent task?

But you're adding the new file there? Just add it under
`rust/kernel/owned.rs` instead.

>> > +/// - It is safe to call [`core::mem::swap`] on the [`Ownable`]. This=
 excludes pinned types
>> > +///   (i.e. most kernel types).
>>=20
>> Can't we implicitly pin `Owned`?
>
> I have been thinking about that. But this would mean that the blanket
> implementation for `Deref` would conflict with the one for `OwnableMut`.

Yeah we could not implement `DerefMut` in that case (or only for `T:
Unpin`).

>> > +/// - The kernel will never access the underlying object (excluding i=
nternal mutability that follows
>> > +///   the usual rules) while Rust owns it.
>> > +pub unsafe trait OwnableMut: Ownable {}
>> > +
>> > +/// An owned reference to an ownable kernel object.
>>=20
>> How about
>>=20
>>     An owned `T`.
>
>     A wrapper around `T`.
>
> maybe?

"wrapper" seems wrong, since a wrapper in my mind is a newtype. So it
would be `struct Owned(T)` which is wrong. The `T` is stored elsewhere.

>> > +///
>> > +/// The object is automatically freed or released when an instance of=
 [`Owned`] is
>> > +/// dropped.
>>=20
>> I don't think we need to say this, I always assume this for all Rust
>> types except they document otherwise (eg `ManuallyDrop`, `MaybeUninit`
>> and thus also `Opaque`.)
>
> Hmm, it is an important feature of the wrapper that it turns the `*Ownabl=
e`
> into an object that is automatically dropped. So shouldn't that be
> mentioned here?

I would expect that that happens, but sure we can leave it here.

>> How about we provide some examples here?
>>=20
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// The pointer stored in `ptr` can be considered owned by the [`Owne=
d`] instance.
>>=20
>> What exactly is "owned" supposed to mean? It depends on the concrete `T`
>> and that isn't well-defined (since it's a generic)...
>
> "owned" means that access to the `T` is exclusive through the `Owned<T>`,
> so normal Rust semantics can be applied.

Okay, in that case just say that `ptr` has exclusive access.

>> Maybe we should give `Ownable` the task to document the exact ownership
>> semantics of `T`?
>>=20
>> > +pub struct Owned<T: Ownable> {
>> > +    ptr: NonNull<T>,
>> > +    _p: PhantomData<T>,
>> > +}
>> > +
>> > +// SAFETY: It is safe to send `Owned<T>` to another thread when the u=
nderlying `T` is `Send` because
>> > +// it effectively means sending a `&mut T` (which is safe because `T`=
 is `Send`).
>>=20
>> How does this amount to sending a `&mut T`?
>
> Good point. That documentation hasn't been updated since `&mut T` access
> has been split out into `OwnableMut`. Not sure how to phrase it now.

I'm also unsure, also for the correct trait bounds on this impl.

---
Cheers,
Benno

>> I guess this also needs to be guaranteed by `Owned::from_raw`... ah the
>> list grows...
>>=20
>> I'll try to come up with something to simplify this design a bit wrt the
>> safety docs.
>>=20
>> > +unsafe impl<T: Ownable + Send> Send for Owned<T> {}
>> > +
>> > +// SAFETY: It is safe to send `&Owned<T>` to another thread when the =
underlying `T` is `Sync`
>> > +// because it effectively means sharing `&T` (which is safe because `=
T` is `Sync`).
>>=20
>> Same here.
>>=20
>> > +unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
