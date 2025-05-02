Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD324336D;
	Fri,  2 May 2025 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187292; cv=none; b=e+sHJom2r51lYAHutgxm05pdHgIiasECQKatiiNsKN5Z96ZJkLDfLLbYB1ild5PH1egdMPz3fP6jnPj5t/sIZvKvVerUv7dC12+xjUgSpUUhNHFTh5lwKG+648aNwYcA0xGK/PExKFbrT/jiWgO3xgZIAvUFkk19zO2Put1jPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187292; c=relaxed/simple;
	bh=LCocTjnjID418++BEBg5N/uceuxSWBYVXC5XCu+s4nA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qglsVtf311hX2SOk8vZB8DyCf3W+MU5r3xULgfjs9ekQszT2dlnoIDwJoMP39FlHtvirt6jg23VUJipHYmTxbvh7QW0Ud9q5NetxCBL6r93J1cqA19nfpnPd42m/fwIgJ0j/1fmC/BqeENnsYf5Ed7p+jKmDpxO6HtEVAB535xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feShMfdB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feShMfdB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F193BC4CEE4;
	Fri,  2 May 2025 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746187291;
	bh=LCocTjnjID418++BEBg5N/uceuxSWBYVXC5XCu+s4nA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=feShMfdBsSfQv3QgyGPh0uzcAmZy8pIQdauK+51OtlRhlTTb4CJk4Mvr2H0hbiXFy
	 OltRRwlCr5eoeTMHNJKAGixq/4lFNOcVfg/jGOfT6+Zt5HAJRXzBpUP4oMwp5p+1l0
	 pzqTfoNP+8ptnVzK8QtXEvWdQ9icXOSxvSrqk2+Sr92AeVVAw84D50/EN0ezorkfJy
	 z+Rx2zKaJP9CTqUzdqUQfMaqzritM3q+ha91LrNqvIyQ28gxFuQ6Ls5tx6AreDIOm0
	 CxTw3VJJjvJKLFPQjRlUjTFUuuRVmT+aBQURmiCpo3sk3jr4eIZMMOnyTcf5M+z0t1
	 KwsgSnSZJ4C8A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 3/5] rust: Add missing SAFETY documentation for ARef
 example
In-Reply-To: <aBSofsTTbt4pgsDU@mango> (Oliver Mangold's message of "Fri, 02
	May 2025 11:12:05 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<ih3kqi48IA3vGKmMFL796yktZHuDzsSsrSz1KA_EIHnhlZaeKRQ2dK0FtgmzWTeVNoy9iVs9rNPjAp-ozQO3Xw==@protonmail.internalid>
	<20250502-unique-ref-v10-3-25de64c0307f@pm.me> <87ikmjz45e.fsf@kernel.org>
	<Ku_y8PI3VVq03v1Vz1YJOPR1fMOyOIKO-L4Rtq4t3kTDcJIHaiEuRnb551OrfID8sYsVvxSi-RGBZW9mjnMAqA==@protonmail.internalid>
	<aBSofsTTbt4pgsDU@mango>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 14:01:22 +0200
Message-ID: <877c2zz0fh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> On 250502 1241, Andreas Hindborg wrote:
>> >
>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> > index d7fa8934c545f46a646ca900ab8957a04b0ad34d..33d2b4e4a87b991c6d934f4e8d2c6c71a15b1bcb 100644
>> > --- a/rust/kernel/types.rs
>> > +++ b/rust/kernel/types.rs
>> > @@ -498,7 +498,9 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>> >      ///
>> >      /// struct Empty {}
>> >      ///
>> > -    /// # // SAFETY: TODO.
>> > +    /// // SAFETY: The `RefCounted` implementation for `Empty` does not count references
>> > +    /// // and never frees the underlying object. Thus we can act as having a
>> > +    /// // refcount on the object that we pass to the newly created `ARef`.
>> >      /// unsafe impl RefCounted for Empty {
>> >      ///     fn inc_ref(&self) {}
>> >      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
>> > @@ -506,7 +508,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>> >      ///
>> >      /// let mut data = Empty {};
>> >      /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>> > -    /// # // SAFETY: TODO.
>> > +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>>
>> I still think this applies:
>>
>> >> How about:
>> >>
>> >>   The `RefCounted` implementation for `Empty` does not count references
>> >>   and never frees the underlying object. Thus we can act as having a
>> >>   refcount on the object that we pass to the newly created `ARef`.
>> >>
>
> Hi Andreas,
>
> I agree. Sorry, I just messed up the fix. Your wording landed in the
> previous to-be-fixed unsafe comment, as you can see.
>
> Happens when you are too much in a hurry and didn't touch the patch for
> too long :/
>
> I will fix it in the next version.

Cool! Also check my response to v9: https://lore.kernel.org/all/87cycrz1pa.fsf@kernel.org


Best regards,
Andreas Hindborg



