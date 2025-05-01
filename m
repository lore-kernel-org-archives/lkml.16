Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DA1C1F22;
	Thu,  1 May 2025 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746125473; cv=none; b=shhiLZaG2O+A/6wf2SEEjYqlB9TesoKXbsJVTW6SrbMi4AWe7RfRgdHeJBX260gWoeuRey4ropZeermKkFssEHTjQNuNoB+TQoaGVherlfPrWdhAu1BsOXU6pWlUyMa8I6jm50BmNFTSrYvy8cpaQDGEvugEGJTjSsGpeOFl9nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746125473; c=relaxed/simple;
	bh=pY62LaNG/jEiXSZIEwff6FA5Ipo7tqFe2HThJ681Fyo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fC+weV9jG9m50JX+3/ydfeFr9mrQ3BmdUmfoZuvdeZ/3rK7JFRmqG7Wb/oIjH36c5HEFgvP9dr5dPIQ+mDMlR0wLfechxjK8u8TG83ZjNkGxnzF/RNfxJdJEb+At6FEXlhVMqfNkFymgyiLTCqeVNTo58QChnhkzleAv4+tgdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Chg2yfZp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Chg2yfZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518EDC4CEE3;
	Thu,  1 May 2025 18:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746125473;
	bh=pY62LaNG/jEiXSZIEwff6FA5Ipo7tqFe2HThJ681Fyo=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Chg2yfZp3TMgG8pC2CUoaPyLrj35TsBj1WgBukQxtnPW7WsXhxgWfzXsLjP7LPu6k
	 rU+SABWMfF3k++SxQmrGfrGxNmJyWNhsDi+4z6uZbBISYciXYz7PVXSNgLgntuzo0R
	 kL4fNe934FrYaN6RLDXyFReuK99hqaOnULXtz4mVqp8sMACHii+0M0zd7yidzWZ2QB
	 +sQ/ooMW4cZyow+5e3zd0MjwjYmteC7bM4RDl+VfTlqpWEE3V++k7CNhmlwUMJbz+v
	 tCzN+Jo66xars08ojJ0qfaTit6NckqY7cp9D2JWGdj4b+i2bRwU69/GszIq8PUYhaj
	 4Vh8zKgo36raA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 20:51:08 +0200
Message-Id: <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
 <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>
In-Reply-To: <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>

On Wed Apr 30, 2025 at 7:30 PM CEST, Christian Schrefl wrote:
> On 30.04.25 11:45 AM, Benno Lossin wrote:
>> On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
>>> +/// This implementation works because of the "`!Unpin` hack" in rustc,=
 which allows (some kinds of)
>>> +/// mutual aliasing of `!Unpin` types. This hack might be removed at s=
ome point, after which only
>>> +/// the `core::pin::UnsafePinned` type will allow this behavior. In or=
der to simplify the migration
>>> +/// to future rust versions only this polyfill of this type should be =
used when this behavior is
>>> +/// required.
>>> +///
>>> +/// In order to disable niche optimizations this implementation uses [=
`UnsafeCell`] internally,
>>> +/// the upstream version however will not. So the fact that [`UnsafePi=
nned`] contains an
>>> +/// [`UnsafeCell`] must not be relied on (Other than the niche blockin=
g).
>>=20
>> I would make this last paragraph a normal comment, I don't think we
>> should expose it in the docs.
>
> I added this as docs since I wanted it to be a bit more visible,
> but I can replace the comment text (about `UnsafeCell`) with this paragra=
ph
> and drop it from the docs if you want.

I think we shouldn't talk about these implementation details in the
docs.

>>> +// As opposed to the upstream Rust type this contains a `PhantomPinned=
`` and `UnsafeCell<T>`
>>> +// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinn=
ed<T>`
>>> +//      Required to use the `!Unpin hack`.
>>> +// - `UnsafeCell<T>` instead of T to disallow niche optimizations,
>>> +//     which is handled in the compiler in upstream Rust
>>> +#[repr(transparent)]
>>> +pub struct UnsafePinned<T: ?Sized> {
>>> +    _ph: PhantomPinned,
>>> +    value: UnsafeCell<T>,
>>> +}
>>> +
>>> +impl<T> UnsafePinned<T> {
>>> +    /// Constructs a new instance of [`UnsafePinned`] which will wrap =
the specified value.
>>> +    ///
>>> +    /// All access to the inner value through `&UnsafePinned<T>` or `&=
mut UnsafePinned<T>` or
>>> +    /// `Pin<&mut UnsafePinned<T>>` requires `unsafe` code.
>>> +    #[inline(always)]
>>> +    #[must_use]
>>> +    pub const fn new(value: T) -> Self {
>>> +        UnsafePinned {
>>> +            value: UnsafeCell::new(value),
>>> +            _ph: PhantomPinned,
>>> +        }
>>> +    }
>>> +}
>>> +impl<T: ?Sized> UnsafePinned<T> {
>>> +    /// Get read-only access to the contents of a shared `UnsafePinned=
`.
>>> +    ///
>>> +    /// Note that `&UnsafePinned<T>` is read-only if `&T` is read-only=
. This means that if there is
>>> +    /// mutation of the `T`, future reads from the `*const T` returned=
 here are UB! Use
>>> +    /// [`UnsafeCell`] if you also need interior mutability.
>>=20
>> I agree with copy-pasting the docs from upstream, even though our
>> implementation already wraps the value in `UnsafeCell`, but I think we
>> should include a comment at the top of this doc that mentions this
>> difference. So something along the lines "In order to make replacing
>> this type with the upstream one, we want to have as little API
>> divergence as possible. Thus we don't mention the implementation detail
>> of `UnsafeCell` and people have to use `UnsafePinned<UnsafeCell<T>>`
>> instead of just `UnsafePinned<T>`." feel free to modify.
>>=20
>
> I already wrote about this in comments (and documentation in this version=
)
> on the `UnsafePinned` type definition.
>
> I'm not sure where exactly we want to have this, but I think having it
> at the top of the file and on the type definition is a bit redundant.

Sure.

>>> +    /// Gets a mutable pointer to the wrapped value.
>>> +    ///
>>> +    /// The difference from `get_mut_pinned` and `get_mut_unchecked` i=
s that this function
>>> +    /// accepts a raw pointer, which is useful to avoid the creation o=
f temporary references.
>>=20
>> You did not include the `get_mut_{pinned,unchecked}` methods, so
>> mentioning them here in the docs might confuse people. Do we want to
>> have those methods?
>
> I only included the functions that we needed for `Opaque` and my
> `miscdevice' patches. I think these functions should only be added
> once they have a user. That's why I wrote the next sentence in the
> documents.
>
> Should I handle this differently?
>
> It should be a really simple patch to add these functions and I can
> do that if someone needs them or I can just include them in this
> patch set.

Then I'd remove the sentence referencing the functions you don't add.

---
Cheers,
Benno
