Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF0325D8FF;
	Wed,  9 Apr 2025 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193898; cv=none; b=LRY+qGVPW0qJ0ykeIDYoABt/Ula6Ks0Ru7CVx4hmW8szSSPopq20vbpF67eCB7kotTE4wq1pxGG4JZ96g/YFtNPBx9Ybhjor2kNbfkTosuF4UTqs/8zFg0Y+46Z5A71mPOzrkMAuAxA2ymomLXfg9RpmEDYBylObaR/ZUqC9NhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193898; c=relaxed/simple;
	bh=6ksrS2ukx8baDR5oexJ+ylv0YSfETRiMQmVoTYYKO+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d1+nXNHO/bOukpPXx0lwV+U6U8VpfAhIiMW1YyYc6kPJh3IIjuyur9+nZTE90oMfx/bf5stNgKcTG3naDw/+BVnG1plWGUYusDwzTuf8xrK61y88aIGSPVTcPQGQjaRwfS02pwH5WlJnXOO0+4pWIhpPHJe+Nf5nv2axgis1Sis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKazUwED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKazUwED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8511AC4CEE3;
	Wed,  9 Apr 2025 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193896;
	bh=6ksrS2ukx8baDR5oexJ+ylv0YSfETRiMQmVoTYYKO+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mKazUwEDITjrCP8v10OLJWD66s96oERJAVdRel9k9zj4em/4y3EiQfqt3eAZ6Mk3f
	 UHqdfD3zwIZTAQYwEEt2AtC0/DUU4r80hKU+SOVnoS8VFucFXWQBMsIo2jtyxTriFd
	 zOIQ4GqKa1Y72VNUKHtUNeGf7XbT/E8XsbWzsaXNDuSf1U8vzasWx3kROuUczIivBW
	 xaMdalUbev4Or76Ih9wXiGHSlSqp/Vgc3Zzq4DxL9en9rlev2cXMqYpLG+elzTFjfM
	 caA2Xmd+HJaILs9NeKva3ndXvn3aSV9FUAXM5oa+MmndTbOkZkIEAz2yD6pSlUcVI2
	 nrxn1zVra3KOg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 3/5] rust: Add missing SAFETY documentation for ARef
 example
In-Reply-To: <20250325-unique-ref-v9-3-e91618c1de26@pm.me> (Oliver Mangold's
	message of "Tue, 25 Mar 2025 11:57:10 +0000")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<BilXj9TIYuQxgQ8GYVKxO0m88NUME1b-jtwrV9ZX3W9GXO-QJGFpb9rChJZarPa4e2AAvgJTm_DINEIW1JINlA==@protonmail.internalid>
	<20250325-unique-ref-v9-3-e91618c1de26@pm.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 11:26:31 +0200
Message-ID: <87a58pd6t4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> ---
>  rust/kernel/types.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index c8b78bcad259132808cc38c56b9f2bd525a0b755..db29f7c725e631c11099fa9122901ec2b3f4a039 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -492,7 +492,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      ///
>      /// struct Empty {}
>      ///
> -    /// # // SAFETY: TODO.
> +    /// // SAFETY: We do not free anything.

How about:

  This implementation will never free the underlying object, so the
  object is kept alive longer than the safety requirement specifies.


>      /// unsafe impl RefCounted for Empty {
>      ///     fn inc_ref(&self) {}
>      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> @@ -500,7 +500,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      ///
>      /// let mut data = Empty {};
>      /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
> -    /// # // SAFETY: TODO.
> +    /// // SAFETY: We keep `data` around longer than the `ARef`.

This is not sufficient. The safety requirement is:

  Callers must ensure that the reference count was incremented at least once, and that they
  are properly relinquishing one increment. That is, if there is only one increment, callers
  must not use the underlying object anymore -- it is only safe to do so via the newly
  created [`ARef`].

How about:

  The `RefCounted` implementation for `Empty` does not count references
  and never frees the underlying object. Thus we can act as having a
  refcount on the object that we pass to the newly created `ARef`.

I think this example actually exposes a soundness hole. When the
underlying object is allocated on the stack, the safety requirements are
not sufficient to ensure the lifetime of the object. We could safely
return `data_ref` and have the underlying object go away. We should add
to the safety requirement of `ARef::from_raw`:

  `ptr` must be valid while the refcount is positive.

That would allow the code in this example, but prevent the issue
outlined above.


Best regards,
Andreas Hindborg


