Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB6209F2D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043614; cv=none; b=BOSCHlzHuvCBWge3kRU1Cbt3iHCRjmKKjJXwpov+UH7admMQRWhVH6vdDfc/Q3IyTPfVI8/l2c9Kx0CzooE077OK43tGUXyMAG79VM0eTZIPuGCy2++XluPzvc+eiM+mXXyyBIAKeteBoAIWmgaUxMbAQ1EyYUVNbGbKGUj6ku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043614; c=relaxed/simple;
	bh=YXRWwW4vlzu8WA5a88I8BNiS3h5BN0NTX2i2xJHNRJs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pxriSok59J0Mlka6AuwjYmkBylIcA7aISQ1pM7fRRreRrypxRukUOIyt1RvbGNwNNcxbhSLcScgFwR49mLdON8UMkRoJtv/GfiO2s5HJh2j8Zt9AO7pkR7gz5f/6h9WuXdkOQ8wHmnvC1MV+J9L+HR1SgtnWQEiehl90bDZTkXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KstR5fEK; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KstR5fEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744043609; x=1744302809;
	bh=eGhpFSfp8IDtOcU8Vt56NnogzL2MpRZJSwnCmPQzDsI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=KstR5fEK4d0RH6h+pb5SHzihbXZejTpO/Fz/8hxQPkLdhRb7yCkioDvmEp4bxK/Gt
	 6i8pZLCG9MixMnDMwjUF3wJ2rDu9MUduCojME0Ibr917Z6r2YHHjw0fDgkWU5v79sI
	 5q168watwnSI6YZ+Tpyfg8luqAdmyib9U0zmD4YHc7HImISpmBg9+6z+eJQFoCt7Rb
	 rVJME7KnbK0NFBd9MNVzTE2/C1Q9ubYdrq3ZKG7SjA99WoaH/kZCp29aeuk+wZyz9b
	 gb8si3YUiMWpEK5Y0tz2GVIJ7ME+kqrgINna3cjf1+qs1bj6MM/n9XM7VWzRMBYGZa
	 nJ9H7zpK0ksHQ==
Date: Mon, 07 Apr 2025 16:33:25 +0000
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
Message-ID: <D90JUX1YE0MR.25XH5EZLUCDBM@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 5e2a0271e4b9da2f0d02b6d83a9321af56701945
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Apr 6, 2025 at 3:01 PM CEST, Alexandre Courbot wrote:
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741cedbb34bed0be0c20cc75472aa53be..b3c4227e232cca3b5c17930ab=
c63810240b9c4da 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -454,30 +454,86 @@ pub fn reserve(&mut self, additional: usize, flags:=
 Flags) -> Result<(), AllocEr
>      }
>  }
> =20
> +impl<T, A: Allocator> Vec<T, A> {
> +    /// Extends the vector by the elements of `iter`.
> +    ///
> +    /// This uses [`Iterator::size_hint`] to optimize memory reallocatio=
ns, but will work even with
> +    /// imprecise implementations - albeit in a non-optimal way.
> +    ///
> +    /// This method returns an error if a memory reallocation required t=
o accommodate the new items
> +    /// failed. In this case, callers must assume that some (but not all=
) elements of `iter` might
> +    /// have been added to the vector.

I would add that items that haven't been added to the vector remain in
the iterator. Do note that some iterators drops the items when the
iterator is dropped. But if not, one can still access them later:

    let vec1 =3D vec![...];
    let mut vec2 =3D KVec::new();
    let mut iter =3D vec1.iter();
    if let Err(_) =3D vec2.extend(&mut iter) {
        // can access remaining items:
        for item in iter {
            pr_info!("item: {item:?}\n");
        }
    }

> +    ///
> +    /// # Note on optimal behavior and correctness
> +    ///
> +    /// The efficiency of this method depends on how reliable the [`Iter=
ator::size_hint`]
> +    /// implementation of the `iter` is.
> +    ///
> +    /// It performs optimally with at most a single memory reallocation =
if the lower bound of
> +    /// `size_hint` is the exact number of items actually yielded.
> +    ///
> +    /// If `size_hint` is more vague, there may be as many memory reallo=
cations as necessary to
> +    /// cover the whole iterator from the successive lower bounds return=
ed by `size_hint`.
> +    ///
> +    /// If `size_hint` signals more items than actually yielded by the i=
terator, some unused memory
> +    /// might be reserved.
> +    ///
> +    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the method=
 assumes that no more items
> +    /// are yielded by the iterator and returns. This may result in some=
 items not being added if
> +    /// there were still some remaining.

Why do this? Can't we just call `next` and see if that is `None` too?
You could use `Peekable` [1] to call `peek` instead, then the logic
below shouldn't be too complex.

[1]: https://doc.rust-lang.org/core/iter/trait.Iterator.html#method.peekabl=
e

> +    ///
> +    /// In the kernel most iterators are expected to have a precise and =
correct `size_hint`
> +    /// implementation, so this should nicely optimize out for these cas=
es.
> +    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), All=
ocError>
> +    where
> +        I: IntoIterator<Item =3D T>,
> +    {
> +        let mut iter =3D iter.into_iter();
> +
> +        loop {
> +            let low_bound =3D match iter.size_hint() {
> +                // No more items expected, we can return.
> +                (0, Some(0)) =3D> break,
> +                // Possibly more items but not certain, tentatively add =
one.
> +                (0, _) =3D> 1,
> +                // More items pending, reserve space for the lower bound=
.
> +                (low_bound, _) =3D> low_bound,
> +            };
> +
> +            self.reserve(low_bound, flags)?;
> +
> +            // Number of items we actually added.
> +            let added_items =3D self
> +                .spare_capacity_mut()
> +                .iter_mut()
> +                // Take a mutable reference to the iterator so we can re=
use it in the next
> +                // iteration of the loop if needed.
> +                .zip(&mut iter)
> +                .fold(0, |count, (dst, src)| {
> +                    dst.write(src);
> +
> +                    count + 1
> +                });
> +
> +            // SAFETY:
> +            // - `self.len() + added_items <=3D self.capacity()` due to =
the call to `reserve` above,

In my mind this precondition holds, since

    self.spare_capacity_mut().len() + self.len() =3D=3D self.capacity()

and

    added_items <=3D self.spare_capacity_mut().len()

But I guess we haven't written the first one down anywhere.

> +            // - items `[self.len()..self.len() + added_items - 1]` are =
initialized.
> +            unsafe { self.set_len(self.len() + added_items) };
> +
> +            // `size_hint` was incorrect and our iterator ended before i=
ts advertized lower bound.
> +            if added_items < low_bound {
> +                break;
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +}
> +
>  impl<T: Clone, A: Allocator> Vec<T, A> {
>      /// Extend the vector by `n` clones of `value`.
>      pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> R=
esult<(), AllocError> {
> -        if n =3D=3D 0 {
> -            return Ok(());
> -        }
> -
> -        self.reserve(n, flags)?;
> -
> -        let spare =3D self.spare_capacity_mut();
> -
> -        for item in spare.iter_mut().take(n - 1) {
> -            item.write(value.clone());
> -        }
> -
> -        // We can write the last element directly without cloning needle=
ssly.
> -        spare[n - 1].write(value);
> -
> -        // SAFETY:
> -        // - `self.len() + n < self.capacity()` due to the call to reser=
ve above,
> -        // - the loop and the line above initialized the next `n` elemen=
ts.
> -        unsafe { self.set_len(self.len() + n) };
> -
> -        Ok(())
> +        self.extend(core::iter::repeat_n(value, n), flags)

`repeat_n` is not stable in 1.78.0, so you need to add `iter_repeat_n`
to the allowed features.

---
Cheers,
Benno

>      }
> =20
>      /// Pushes clones of the elements of slice into the [`Vec`] instance=
.
> @@ -496,18 +552,7 @@ pub fn extend_with(&mut self, n: usize, value: T, fl=
ags: Flags) -> Result<(), Al
>      /// # Ok::<(), Error>(())
>      /// ```
>      pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Re=
sult<(), AllocError> {
> -        self.reserve(other.len(), flags)?;
> -        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), o=
ther) {
> -            slot.write(item.clone());
> -        }
> -
> -        // SAFETY:
> -        // - `other.len()` spare entries have just been initialized, so =
it is safe to increase
> -        //   the length by the same number.
> -        // - `self.len() + other.len() <=3D self.capacity()` is guarante=
ed by the preceding `reserve`
> -        //   call.
> -        unsafe { self.set_len(self.len() + other.len()) };
> -        Ok(())
> +        self.extend(other.iter().cloned(), flags)
>      }
> =20
>      /// Create a new `Vec<T, A>` and extend it by `n` clones of `value`.
>
> ---
> base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
> change-id: 20250405-vec_extend-4321251acc21
>
> Best regards,


