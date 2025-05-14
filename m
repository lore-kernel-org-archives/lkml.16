Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C21FF60E;
	Wed, 14 May 2025 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215144; cv=none; b=pmY7BnFPiALntB4bwxNOreMAI7t3dXBJIqVo9RmCKKQD5fVEq3huLszw8g8IjaJBTfQRZ8Fg7JddWh5tmo1fzeIuamUsnRlHFSaAT23JfYW23RgGgVh+7fVxBWVa9bkv9PF8SHjjOSjaVZ6RwNhx/+Y+9PDfwTjO2+DeJZiKODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215144; c=relaxed/simple;
	bh=OsCI+SEfMW/es4yIxIl67MqpGQd1arTAgfmC5tthM/o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qd1k/2LXI0SnN/uGEN4xutktUO6hSuZILs8QytsTgFsRbiCZnXpQw/CiPte5ZpFmvy3Rt713X7voEjCX6hWdO+D1zUZFqm4voVaSJymutL8xypVGiqSI1dPJVB7dLOEMoh8fTY6ua1AsgaM9B0SKFm1WhmicWY085V4bXn4x6tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOYq9BuH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOYq9BuH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22583C4CEE9;
	Wed, 14 May 2025 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747215143;
	bh=OsCI+SEfMW/es4yIxIl67MqpGQd1arTAgfmC5tthM/o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IOYq9BuHy+XUHlHP9+BfK9AEUSgQWF/kgBjJLWyXIFqg2kWAcd+HYj0q2Y79hI20O
	 GA3H6TYlRDjcm/J+FbNpr/hEQjdwUfeBET+RNWSLI6xNEW3JmzzoZ6q/ty9I/7Hoph
	 Lg3e9gAdKXMkVyDZt7FjqYFxVvp7xl8LdiPPIldcECwwlmQvTm2wb+RIf2dTvimuRF
	 vAcvVyMPe1IWRudxByjLlFrDQ+4wkzWJ+GfLqbCcDLDGgAQGZFqX8Q3wat8vJgSINK
	 PrRVJ+Yy+WX+mskIeeraESU4s8dXzu+Ky+tX6CTVI6mSHqQ0Lb3UgcAPWiGRrukaz9
	 9sHAClmj5slFA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 11:32:19 +0200
Message-Id: <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Asahi Lina" <lina@asahilina.net>
X-Mailer: aerc 0.20.1
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
 <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
In-Reply-To: <20250502-unique-ref-v10-1-25de64c0307f@pm.me>

On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
> +/// Types that may be owned by Rust code or borrowed, but have a lifetim=
e managed by C code.
> +///
> +/// It allows such types to define their own custom destructor function =
to be called when
> +/// a Rust-owned reference is dropped.
> +///
> +/// This is usually implemented by wrappers to existing structures on th=
e C side of the code.

The docs should mention `AlwaysRefCounted` and when to use it instead of
this trait. We should probably also backlink from `AlwaysRefCounted` to
`Ownable`.

> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that ow=
ned reference exists (i.e.
> +///   until the [`release()`](Ownable::release) trait method is called).

I don't immediately understand what this means. How about "Any value of
type `Self` needs to be stored as [`Owned<Self>`]."? And then ask in
`Owned::from_raw` for a pointer that is valid indefinitely (or at least
until `release` is called).

> +/// - That the C code follows the usual mutable reference requirements. =
That is, the kernel will
> +///   never mutate the [`Ownable`] (excluding internal mutability that f=
ollows the usual rules)
> +///   while Rust owns it.

I feel like this requirement is better put on the `Owned::from_raw`
function.

> +pub unsafe trait Ownable {
> +    /// Releases the object (frees it or returns it to foreign ownership=
).
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the object is no longer referenced afte=
r this call.
> +    unsafe fn release(this: NonNull<Self>);
> +}
> +
> +/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut Own=
ed<T>` Rust reference
> +/// may be dereferenced into a `&mut T`.

The "A subtrait of Ownable that asserts" sounds a bit clumsy to me, how
about "Type where [`Owned<Self>`] derefs to `&mut Self`."?

> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that access to a `&mut T` is safe, implying=
 that it is okay to call
> +/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (me=
aning: most kernel types).

I don't like that we put this requirement here, since it's actually
something that should be asserted by `Owned::from_raw`.
The reason for that is that anyone can call `Owned::from_raw` with a
pointer pointing to `Self` and there is no safety requirement on that
function that ensures the correctness of the `DerefMut` impl.

> +pub unsafe trait OwnableMut: Ownable {}

I don't like the name, but at the same time I also have no good
suggestion :( I'll think some more about it.

---
Cheers,
Benno
