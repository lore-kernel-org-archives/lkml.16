Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30BA19AD89;
	Wed,  2 Jul 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455440; cv=none; b=VBUOzs0QOIgMwuZF46NiUJlh48PAiU07zOO0OzeWXxwfzqIEsk8epZ5Iu0/Z2IXxRGcnjgh/5CuFBtzeHa5SdQb+WxTKJNwBifQfscVd8SRjxgwenu7flELglTi+4rJ17fFxLQbz6fKb9Tm4OHK2BxXtJZY4pbXP1lL2MPDN6BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455440; c=relaxed/simple;
	bh=vZ0JC8AmuIuaPuZVYOvDU8RiMysiHyIQYp9F09r95Go=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iHpTYiDeLBvAPimPavcXeeZsN4j/wULwgGfrLqZiVHpKvmFCG4e8XT1CoEwuXYk3h0Dqg8jUqKQpbms6pb84BTXwPpTb7+WKjG3UTc/ECscit/uXt6vFYEJI0FWyJzKCdm/2G960IVQx3h4KMMtY+13h8Akk+vQGBf08n207vJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzlzdXYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzlzdXYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA11C4CEF0;
	Wed,  2 Jul 2025 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751455440;
	bh=vZ0JC8AmuIuaPuZVYOvDU8RiMysiHyIQYp9F09r95Go=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZzlzdXYHK/ZaFUzq22Q2vNxYAl6AQlgG0D9U1QwYiw0ariXwX9nASIAKULd6aHAGK
	 o4DL55zdS6Ax5UkVAZJs0Nqaa/Rg16y0//Kt8Xe46NDqVpp2VC7BdCSBmV99geor6w
	 IyoVan6NnJP06C1pLwX0EcWw3mbowuPB2mL3UAt31RqUNkz7ri7nMrPUxS/KISxL5j
	 E4GG75r3x3ZFyJn8cWv7NCoJaqAH3R+ysBGh3BJuAtkoJ0DL7NsvrSN/0aF4OqbQUh
	 hRYok7tQ5P2lND/0KnTwGNWmqFw0JR5tVgq4vkIbeQVgxXdFo8s0uPLOhS2fATOxQi
	 /bE4q51whaLLw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 13:23:54 +0200
Message-Id: <DB1J4UQLG76V.69HKATSZZVNO@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 2/4] rust: Split `AlwaysRefCounted` into two traits
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Asahi Lina"
 <lina+kernel@asahilina.net>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me>

On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index c12ff4d2a3f2d79b760c34c0b84a51b507d0cfb1..40c0138bd336057e7d3a835a9=
e81391baa2fd2b1 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -418,11 +418,9 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>      }
>  }
> =20
> -/// Types that are _always_ reference counted.
> +/// Types that are internally reference counted.
>  ///
>  /// It allows such types to define their own custom ref increment and de=
crement functions.
> -/// Additionally, it allows users to convert from a shared reference `&T=
` to an owned reference
> -/// [`ARef<T>`].
>  ///
>  /// This is usually implemented by wrappers to existing structures on th=
e C side of the code. For
>  /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to=
 create reference-counted
> @@ -438,9 +436,8 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>  /// at least until matching decrements are performed.
>  ///
>  /// Implementers must also ensure that all instances are reference-count=
ed. (Otherwise they
> -/// won't be able to honour the requirement that [`AlwaysRefCounted::inc=
_ref`] keep the object
> -/// alive.)
> -pub unsafe trait AlwaysRefCounted {
> +/// won't be able to honour the requirement that [`RefCounted::inc_ref`]=
 keep the object alive.)
> +pub unsafe trait RefCounted {
>      /// Increments the reference count on the object.
>      fn inc_ref(&self);

This seems a bit problematic for `Owned`, since now I can do:

    fn bad<T: Ownable + RefCounted>(t: &Owned<T>) {
        t.inc_ref();
    }

And now the `Owned<T>` is no longer "unique" in the sense that the
refcount is 1...

Similarly, we should probably make this an associated function, such
that people don't accidentally call `.inc_ref()` on `ARef<T>`.

> @@ -453,11 +450,21 @@ pub unsafe trait AlwaysRefCounted {
>      /// Callers must ensure that there was a previous matching increment=
 to the reference count,
>      /// and that the object is no longer used after its reference count =
is decremented (as it may
>      /// result in the object being freed), unless the caller owns anothe=
r increment on the refcount
> -    /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then calls
> -    /// [`AlwaysRefCounted::dec_ref`] once).
> +    /// (e.g., it calls [`RefCounted::inc_ref`] twice, then calls [`RefC=
ounted::dec_ref`] once).
>      unsafe fn dec_ref(obj: NonNull<Self>);
>  }
> =20
> +/// An extension to RefCounted, which declares that it is allowed to con=
vert from a shared reference
> +/// `&T` to an owned reference [`ARef<T>`].

This is a bit too long for the first sentence... How about

    Always reference counted type.

    Allows the creation of `ARef<T>` from `&T`.

Feel free to add more information.

> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that no safety invariants are violated by u=
pgrading an `&T` to an
> +/// [`ARef<T>`]. In particular that implies [`AlwaysRefCounted`] and [`O=
wnable`] cannot be
> +/// implemented for the same type, as this would allow to violate the un=
iqueness guarantee of
> +/// [`Owned<T>`] by derefencing it into an `&T` and obtaining an [`ARef`=
] from that.
> +pub unsafe trait AlwaysRefCounted: RefCounted {}

It's a bit sad that we can't just say `: !Ownable` (or rather a
blanket-implemented marker trait, since that might land earlier). Anyone
aware of progress in this area?

---
Cheers,
Benno

> +
>  /// An owned reference to an always-reference-counted object.
>  ///
>  /// The object's reference count is automatically decremented when an in=
stance of [`ARef`] is
