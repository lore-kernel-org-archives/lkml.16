Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C5AD5E;
	Sun, 22 Jun 2025 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750579890; cv=none; b=GRdMBCukvz4nzKOrn4bR5gHGrHjkZt8ZJ5ddnLkDfNfJUtNSRowBNkNPxSdaQ3vQuyPLyZ/uOs9GPAfYekHdoPNFh5LCbX1njhrrS3prACKgemuAE5dSMuPzY/qUyXXQB6sZabE5+1bx2Q3TGHU8kTa5t0vLvXX9Iv7gY2IV3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750579890; c=relaxed/simple;
	bh=RfKICBXZidiu4OD84YvFGCoQa3tLgCT6Ic2UxiwvK+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r7qYHxNOrfN0O657NL2Uu9Jx2TS9v7NabvyBKVW0ELueZLBufaWq3Jv8Bj2NmXlEckr5A3nPawabOpRS4oz7MOg74yTpSV1zmuhV6GZlxaiaamSTOAEJv0vLJLkMLqGf4w99Mb/wc3aDMJso9rwIMOjbB8pbpvcc0QMXj3lv2yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOzNFqbT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOzNFqbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3BCC4CEE3;
	Sun, 22 Jun 2025 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750579889;
	bh=RfKICBXZidiu4OD84YvFGCoQa3tLgCT6Ic2UxiwvK+c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=gOzNFqbTi7Xenp9f8n/wBpt4QvFlkSIt3B3FJfXe82BThRvDP+A1Git2cXx9CF7bU
	 qKLau8uYvfn2qIXJLXAfPsy+0CRWrN89sOYcNGz5NZ9bRZNa3RjfofdxZ/kFlbsEhZ
	 bFTEmK9Z/y/9MwgNwdthymdTVke1CbpDZkbuWm7uQ9yr9fJcvRpvKPmhXB/ujn+pNp
	 jbKNdou+U0/KoTWGcXjdrgu7w5AqfbJ7vO+j/UR2hFkbwR+gYo/TPY8S3EEWuteutd
	 fK9XoEECcg0Rx7QxIqBzGAtoaflf9Llah6HEK2N3Q0EbQJ7X+NxAgUvlV2BldJhdVf
	 mYVUVSagy6WXA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 10:11:25 +0200
Message-Id: <DASWS1A63LYM.399CKUDL4Z7UC@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>

On Fri Jun 20, 2025 at 3:14 PM CEST, Alexandre Courbot wrote:
> +/// An unsigned integer which is guaranteed to be a power of 2.
> +///
> +/// # Invariants
> +///
> +/// The stored value is guaranteed to be a power of two.
> +#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
> +#[repr(transparent)]
> +pub struct PowerOfTwo<T>(T);
> +
> +macro_rules! power_of_two_impl {
> +    ($($t:ty),+) =3D> {
> +        $(
> +            impl PowerOfTwo<$t> {

I tried to use this type in a doctest like this:

    use kernel::num::PowerOfTwo;
  =20
    fn new(x: usize) -> PowerOfTwo<usize> {
        PowerOfTwo::new(1 << x)
    }

And it doesn't compile :(

    error[E0034]: multiple applicable items in scope
        --> rust/doctests_kernel_generated.rs:4930:17
         |
    4930 |     PowerOfTwo::new(1 << x)
         |                 ^^^ multiple `new` found
         |
         =3D note: candidate #1 is defined in an impl for the type `PowerOf=
Two<u128>`
         =3D note: candidate #2 is defined in an impl for the type `PowerOf=
Two<u16>`
         =3D note: candidate #3 is defined in an impl for the type `PowerOf=
Two<u32>`
         =3D note: candidate #4 is defined in an impl for the type `PowerOf=
Two<u64>`
         =3D note: and 2 others
   =20
    error: aborting due to 1 previous error

The problem is that the function `new` exists 6 times for each of the
integer types. You can write `PowerOfTwo::<usize>::new()` instead, but
that's annoying...

We probably need an `Integer` trait and then do

    impl<I: Integer> PowerOfTwo<I> {
        pub const fn new(value: I) -> Self;
    }

> +                /// Validates that `v` is a power of two at build-time, =
and returns it wrapped into
> +                /// [`PowerOfTwo`].
> +                ///
> +                /// A build error is triggered if `v` cannot be asserted=
 to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify!(=
$t), ">::new(16);")]
> +                /// assert_eq!(v.value(), 16);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn new(v: $t) -> Self {
> +                    build_assert!(v.count_ones() =3D=3D 1);

Why not `v.is_power_of_two()`?

> +                    Self(v)

Missing `// INVARIANT` comment.

> +                }
> +
> +                /// Validates that `v` is a power of two at runtime, and=
 returns it wrapped into
> +                /// [`PowerOfTwo`].
> +                ///
> +                /// [`None`] is returned if `v` was not a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                #[doc =3D concat!(
> +                    "assert_eq!(PowerOfTwo::<",
> +                    stringify!($t),
> +                    ">::try_new(16), Some(PowerOfTwo::<",
> +                    stringify!($t),
> +                    ">::new(16)));"
> +                )]
> +                #[doc =3D concat!(
> +                    "assert_eq!(PowerOfTwo::<",
> +                    stringify!($t),
> +                    ">::try_new(15), None);"
> +                )]
> +                /// ```
> +                #[inline(always)]
> +                pub const fn try_new(v: $t) -> Option<Self> {

Maybe `new_checked` is a better name, since it doesn't return a result?

> +                    match v.count_ones() {

Why not `is_power_of_two()`?

> +                        1 =3D> Some(Self(v)),

Missing `// INVARIANT` comment.

> +                        _ =3D> None,
> +                    }
> +                }
> +
> +                /// Returns the value of this instance.
> +                ///
> +                /// It is guaranteed to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify!(=
$t), ">::new(16);")]
> +                /// assert_eq!(v.value(), 16);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn value(self) -> $t {
> +                    self.0

Let's add:

    if !self.0.is_power_of_two() {
        core::hint::unreachable_unchecked()
    }
    self.0

> +                }
> +
> +                /// Returns the mask corresponding to `self.value() - 1`=
.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify!(=
$t), ">::new(0x10);")]
> +                /// assert_eq!(v.mask(), 0xf);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn mask(self) -> $t {
> +                    self.0.wrapping_sub(1)

Then use `self.value().wrapping_sub(1)` here instead to also propagate
the information.

---
Cheers,
Benno

> +                }
