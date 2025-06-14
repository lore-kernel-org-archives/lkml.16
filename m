Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194ED1E8320;
	Sat, 14 Jun 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928800; cv=none; b=sits5ETD7N2l1EmUDoPUoNt6cgwAZc8MVHidQGA3TN5DXF7eiEW73lGPNHEg6dGq5ahiMP0BbwMYqeXb9bIvzHP34+H0F9oRxL2CQOoWNEQrZye2cr849QPOB234xay+3XBBVNyeL5MYSLvkzNEEeWapU5yZGGsOFp9OtEppYKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928800; c=relaxed/simple;
	bh=y8wvN7Ze41xq4819gNmA1YqK19V+uOiKkEvHcd8/b8w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lFrSE/0f8FPlXrm/wnewDssSNFIa+2k/1Gz+XIu6WlidMq/GNCJjRS7mXtN8ibE4qeRs4sGqBf1ys9oVSsv4WE6KWCRXDZthJrF4LOsp3sfozMq5fpzKPoO4EbBLt0GQK1Yo+KOzGbSREwBwfWSnuVVG/0z1/JsP3Q1M/TI9dRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV8GX80o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV8GX80o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547F6C4CEEB;
	Sat, 14 Jun 2025 19:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749928799;
	bh=y8wvN7Ze41xq4819gNmA1YqK19V+uOiKkEvHcd8/b8w=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=EV8GX80oaZhYAQqhKuRFGMGKyfQQbb97D0q6I8fv+VkEO5Hw+UHjeqEUw78z7AIXM
	 f/lStb3DGLnwW7aGQ5jBJ2kIPB+2M2T0XHjcn7b4bwuDtTY2YdxJKzEN4UUXjUSZNy
	 JsflvpSpOZCZAiDiIfVZJuFvhKC1lcaGgH/iTOtvquwwcNY7g0DS3cEBgpNkHCoOJS
	 sn4fRMc7WV2PQdXYNMmaY0dTNHfpEuVX/i8ofX7R85LaZIG1i3AvE69/d1UapMmITo
	 GBdhMXwDEhqI3bAgbdWb45LlyNk2eLjLiPEgnCJ1nJtJ8Hu2Hhur+cUErk9NEKmGsU
	 Tl2FqGqryTuRA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 21:19:55 +0200
Message-Id: <DAMHZIN35QQ9.3N5WSB58J4WG9@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] rust: alloc: implement `Borrow` and `BorrowMut`
 for `Vec`
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-1-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-1-6120e1958199@nvidia.com>

On Fri Jun 13, 2025 at 3:46 PM CEST, Alexandre Courbot wrote:
> Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
> `Vec<T>` to be used in generic APIs asking for types implementing those
> traits. `[T; N]` and `&mut [T]` also implement those traits allowing
> users to use either owned, borrowed and heap-owned values.
>
> The implementation leverages `as_slice` and `as_mut_slice`.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

One comment below, with that fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/alloc/kvec.rs | 57 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..3f368d4a67683ac5a0ff87d7d=
f33a3bb640ced59 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -8,6 +8,7 @@
>      AllocError, Allocator, Box, Flags,
>  };
>  use core::{
> +    borrow::{Borrow, BorrowMut},
>      fmt,
>      marker::PhantomData,
>      mem::{ManuallyDrop, MaybeUninit},
> @@ -890,6 +891,62 @@ fn deref_mut(&mut self) -> &mut [T] {
>      }
>  }
> =20
> +/// Allows `Vec<T>` to be used as a `Borrow<[T]>`.

I personally would vote against this first line description here. I
don't think that it will show up in a summary view of rust doc (since
trait impls don't appear in searches or module overviews). Additionally,
this first sentence seems like this kind of comment:

    // call `foo`:
    foo();

So let's just remove it and directly start with the examples :)

Also for the other cases.

---
Cheers,
Benno

> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use core::borrow::Borrow;
> +/// struct Foo<B: Borrow<[u32]>>(B);
> +///
> +/// // Owned array.
> +/// let foo_array =3D Foo([1, 2, 3]);
> +///
> +/// // Owned vector.
> +/// let foo_vec =3D Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
> +///
> +/// let arr =3D [1, 2, 3];
> +/// // Borrowed slice from `arr`.
> +/// let foo_borrowed =3D Foo(&arr[..]);
> +/// # Ok::<(), Error>(())
> +/// ```
> +impl<T, A> Borrow<[T]> for Vec<T, A>
> +where
> +    A: Allocator,
> +{
> +    fn borrow(&self) -> &[T] {
> +        self.as_slice()
> +    }
> +}
> +
> +/// Allows `Vec<T>` to be used as a `BorrowMut<[T]>`.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use core::borrow::BorrowMut;
> +/// struct Foo<B: BorrowMut<[u32]>>(B);
> +///
> +/// // Owned array.
> +/// let foo_array =3D Foo([1, 2, 3]);
> +///
> +/// // Owned vector.
> +/// let foo_vec =3D Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
> +///
> +/// let mut arr =3D [1, 2, 3];
> +/// // Borrowed slice from `arr`.
> +/// let foo_borrowed =3D Foo(&mut arr[..]);
> +/// # Ok::<(), Error>(())
> +/// ```
> +impl<T, A> BorrowMut<[T]> for Vec<T, A>
> +where
> +    A: Allocator,
> +{
> +    fn borrow_mut(&mut self) -> &mut [T] {
> +        self.as_mut_slice()
> +    }
> +}
> +
>  impl<T: Eq, A> Eq for Vec<T, A> where A: Allocator {}
> =20
>  impl<T, I: SliceIndex<[T]>, A> Index<I> for Vec<T, A>

