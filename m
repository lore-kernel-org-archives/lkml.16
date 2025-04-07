Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434E158545;
	Mon,  7 Apr 2025 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023711; cv=none; b=DzEDC9uyqs4cfLME2+hNnCtZblg2e7ez12/Rb3OoO0dxza6fwjBtraxJmF2HTndbMps3cCKiWuLBeN8H17ToZ0QOqHNsWNTRGHqZyhyTFiH3vc4VYBOq2TytcSnwBVUtC+FwlflP1FhhMZXEREMLkyXwpRObdbrV4cvi87mzzLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023711; c=relaxed/simple;
	bh=oft2eAwFvA68we15ghBrsKaITtHdO9T8S2o+DBqkmNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ammkn4IwxktlB/Qs2pcG+r7F9tYJv6DHhLZ0XMjW1yUsTyZZcS+PW79xgK08EDpD57310W7fRejRwJY5FzwA1ghx7q+Av32RwAEMZpXDKbLYSm9M13LfAA2/SkKxAv4jcTPxOT+9GttTV0zrE8+M53D9VGl0q/I/z8Nf3Ajkt8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nthXxtjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nthXxtjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72D4C4CEDD;
	Mon,  7 Apr 2025 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744023710;
	bh=oft2eAwFvA68we15ghBrsKaITtHdO9T8S2o+DBqkmNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nthXxtjcdEQOk1He84ndqK+RilNcVIx5JlkCx+tEyiTF+lfJgUZvQc6AcLuFc95SQ
	 NsY4s/J430j96muoRXN3p2Um3fuf8rpQ82Izplic2GgaAHjjKKQb2nrxpQ5Per+fS+
	 c4KlwIT6WvKC66lZDcnUEWjhpQ0RSRgAZ2qi2FqP5NVk6hpSpGASZqhGug/zqRsbJc
	 MCTbH2yA35TmV6akoEU3koU/AhLsNGj1UCQkmbD2wFf2DtBsKiXZ6rsEEsUFW8FZf/
	 iLwwU46CIB0LqA0vdd0moU5LD/15yX0VR9VLAKj4FJFxdqzjfMBPg0NVzbamF7/N0k
	 K+O4TpZtlXQKA==
Date: Mon, 7 Apr 2025 13:01:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
Message-ID: <Z_OwmEKHgsZlt2cs@pollux>
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>

On Sun, Apr 06, 2025 at 10:01:55PM +0900, Alexandre Courbot wrote:
> KVec currently has `extend_with` and `extend_from_slice` methods, but no
> way extend a vector from a regular iterator as provided by the `Extend`
> trait.
> 
> Due to the need to provide the GFP flags, `Extend` cannot be implemented
> directly, so simply define a homonymous method that takes an extra
> `flags` argument.

This is the same approach I took with Vec::collect(); I think this is fine for
now. One we attempt to implement more collections, we should implement our own
Extend and FromIterator traits.

> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741cedbb34bed0be0c20cc75472aa53be..b3c4227e232cca3b5c17930abc63810240b9c4da 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -454,30 +454,86 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
>      }
>  }
>  
> +impl<T, A: Allocator> Vec<T, A> {

Please re-use the existing impl block above, i.e.

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index b3c4227e232c..72659b017553 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -452,9 +452,7 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr

         Ok(())
     }
-}

-impl<T, A: Allocator> Vec<T, A> {
     /// Extends the vector by the elements of `iter`.
     ///
     /// This uses [`Iterator::size_hint`] to optimize memory reallocations, but will work even with

> +    /// Extends the vector by the elements of `iter`.
> +    ///
> +    /// This uses [`Iterator::size_hint`] to optimize memory reallocations, but will work even with
> +    /// imprecise implementations - albeit in a non-optimal way.
> +    ///
> +    /// This method returns an error if a memory reallocation required to accommodate the new items
> +    /// failed. In this case, callers must assume that some (but not all) elements of `iter` might
> +    /// have been added to the vector.
> +    ///
> +    /// # Note on optimal behavior and correctness
> +    ///
> +    /// The efficiency of this method depends on how reliable the [`Iterator::size_hint`]
> +    /// implementation of the `iter` is.
> +    ///
> +    /// It performs optimally with at most a single memory reallocation if the lower bound of
> +    /// `size_hint` is the exact number of items actually yielded.
> +    ///
> +    /// If `size_hint` is more vague, there may be as many memory reallocations as necessary to
> +    /// cover the whole iterator from the successive lower bounds returned by `size_hint`.
> +    ///
> +    /// If `size_hint` signals more items than actually yielded by the iterator, some unused memory
> +    /// might be reserved.
> +    ///
> +    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the method assumes that no more items
> +    /// are yielded by the iterator and returns. This may result in some items not being added if
> +    /// there were still some remaining.
> +    ///
> +    /// In the kernel most iterators are expected to have a precise and correct `size_hint`
> +    /// implementation, so this should nicely optimize out for these cases.

I agree, hence I think we should enforce to be provided with a guaranteed
correct size hint and simplify the code. I think we should extend the signature.

     pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), AllocError>
     where
         I: IntoIterator<Item = T>,
         I::IntoIter: ExactSizeIterator,

And implement ExactSizeIterator for IntoIter.

The only thing that bothers me a bit is that the documentation [1] of
ExactSizeIterator sounds a bit ambiguous.

It says: "When implementing an ExactSizeIterator, you must also implement
Iterator. When doing so, the implementation of Iterator::size_hint *must*
return the exact size of the iterator."

But it also says: "Note that this trait is a safe trait and as such does not and
cannot guarantee that the returned length is correct. This means that unsafe
code must not rely on the correctness of Iterator::size_hint. The unstable and
unsafe TrustedLen trait gives this additional guarantee."

Acknowledging the latter, I think we should implement our own trait for this
instead. Our own version of TrustedLen seems reasonable to me.

[1] https://doc.rust-lang.org/std/iter/trait.ExactSizeIterator.html
