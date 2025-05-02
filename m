Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80B19D07B;
	Fri,  2 May 2025 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182473; cv=none; b=rKZzhkESQ5WQQRDkFiZQ5XoVjtcFBK9GvM32J8M6YRgBZjLceKAcBS5iroXUIMuT0yzEtJGE2pbctksRft/AFNFWJkPu/p/rWshzcAf4wayr91rRigzbCHzrgwUdr7uAVs7ckbwln1FYJbFCq+NrBXJ9JLQmIeu52I4GWKC6NZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182473; c=relaxed/simple;
	bh=ZyYWJPCQUHZnSDU+Iz6X/jMLxpc9IPShn2Pd7w+PeXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WmTPG+1uioUwEjBDLrI+/NX7D3wZDt6jpOUoYIo1iKDOWKOoqgy4ve/xm+G9IMJwiR59X1Nt8ZeBCRPoMU/aXisPoJNTwJj9JNncsgr1kmmOIE/qvM/TndsGXhiBZNkfxs1Q+0Cxv9QhV88EFHJhob3Jh7N+UqBYWyWaF6neEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InyZVM+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InyZVM+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F2BC4CEEB;
	Fri,  2 May 2025 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746182473;
	bh=ZyYWJPCQUHZnSDU+Iz6X/jMLxpc9IPShn2Pd7w+PeXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=InyZVM+iDu5F9YPetBcqqLI52MFAiXXEeWeN5VjDqJ9L4lo5j5wix0b4Zy+fhWcJt
	 ZN1cU0vmaeocse+aBjTtDlhKwhv0ionOrl1l9XmJCh8N9WbTzVD55A7Pe8O4GVn99n
	 B3NhmqW4Mz7PJjh3vqnh8ADFMi88FuFNfvrpsg41PB9nRXMsaWRhkDwtkbICpnkzRr
	 wTeuXnIbSOY2VT1wSelxQ4ts8gSy/C9EVlzn00obwplw10XdGJOZn/N2xnu+idC9aA
	 SrHrBLjWd8a0bnZW0B14bKX5Uo7PB20+G+xOnlWSINeoy7FcrFfw9/78oGCL7Zhmr4
	 HTNEE2lMa0ffg==
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
In-Reply-To: <20250502-unique-ref-v10-3-25de64c0307f@pm.me> (Oliver Mangold's
	message of "Fri, 02 May 2025 09:02:46 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<ih3kqi48IA3vGKmMFL796yktZHuDzsSsrSz1KA_EIHnhlZaeKRQ2dK0FtgmzWTeVNoy9iVs9rNPjAp-ozQO3Xw==@protonmail.internalid>
	<20250502-unique-ref-v10-3-25de64c0307f@pm.me>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 12:41:01 +0200
Message-ID: <87ikmjz45e.fsf@kernel.org>
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
>  rust/kernel/types.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index d7fa8934c545f46a646ca900ab8957a04b0ad34d..33d2b4e4a87b991c6d934f4e8d2c6c71a15b1bcb 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -498,7 +498,9 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      ///
>      /// struct Empty {}
>      ///
> -    /// # // SAFETY: TODO.
> +    /// // SAFETY: The `RefCounted` implementation for `Empty` does not count references
> +    /// // and never frees the underlying object. Thus we can act as having a
> +    /// // refcount on the object that we pass to the newly created `ARef`.
>      /// unsafe impl RefCounted for Empty {
>      ///     fn inc_ref(&self) {}
>      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> @@ -506,7 +508,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      ///
>      /// let mut data = Empty {};
>      /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
> -    /// # // SAFETY: TODO.
> +    /// // SAFETY: We keep `data` around longer than the `ARef`.

I still think this applies:

>> How about:
>> 
>>   The `RefCounted` implementation for `Empty` does not count references
>>   and never frees the underlying object. Thus we can act as having a
>>   refcount on the object that we pass to the newly created `ARef`.
>> 

>      /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
>      /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
>      ///


Best regards,
Andreas Hindborg


