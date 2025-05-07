Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C92232367;
	Wed,  7 May 2025 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609556; cv=none; b=Pj6iNx0Iuu4rD/d3h1uLOdn+ssf5rlI+MW/jSu4aO1C8zhaFPGPqffF7im2XsP8eZ/36Vc8uKet7MFFUSJ69kp+UAHPwibziLmfZml1Bna6mLP7jkLwNJeMsQ4zdxcDdg3P5YKtnp0I283UkYNgz6X20LBwgJ4236ZAWDcJ4BAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609556; c=relaxed/simple;
	bh=RHy1p/pe3RnqXeYZsuyEV6sW/JsqFl/6BIAqtHzbpaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=exHtuBpyQPfoT14GOn+I24zu77hM/NoZLsKulCMShojU7OAbzBCTp9BCkjJl+YqHSA9NzHaCf5sK7ZrfCZ2KmDmNQojCroYQBOd2Df6X4gMV9c9LHWY3TqQ6Q3HhJQ4zbqJicpP2xnVmVardJEpB2r/AnW7RdTJVYDN4EK2MSZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5uSrBXN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5uSrBXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A79C4CEE7;
	Wed,  7 May 2025 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746609556;
	bh=RHy1p/pe3RnqXeYZsuyEV6sW/JsqFl/6BIAqtHzbpaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l5uSrBXNLrz2BYMMTXtfn+dPK7t3cthqimXZBsM5Tq+eZM1OdExV4Gs0KY/j8ghVK
	 Pk4h3I2I8hNoYfFedqf9HPsR2SuON9gVzRZZukqY8HSX56GCOepsMzAg7IXI7hEHjt
	 w+6JT8zibVy2UdFZPd/jFoxHe3XJS3L7jWjwDr79kI3MM7+c3+9zmRsgw/hqc2jOjA
	 YXNjS9G5RvJmZ1CaObjneKWhb0naws9oARGkdtHpKIfXKwmT8QqV+mym6T9Zzc7Ny/
	 zdDHJ7efkIXhLBzv+VHhOEGD4e4Kd1gJXm6vN4FB8uDxdwV04RnNY1z5kV8CwiCOrJ
	 6ZAmMXwzNZYWw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Benno Lossin" <lossin@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Oliver Mangold" <oliver.mangold@pm.me>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
In-Reply-To: <aBscvBwCD1o0OC_v@google.com> (Alice Ryhl's message of "Wed, 07
	May 2025 08:41:32 +0000")
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>
	<D9PSH8MJ48JO.3OOA3Z3NSBGC9@kernel.org>
	<P0Vs61xa67BWtC_H9sCVioTN9Eb9G0N6w23IVMhek_I0QzvNsTQYYs269Ud_VBv72bWdMab3i8z8YsOeYkCEvA==@protonmail.internalid>
	<aBscvBwCD1o0OC_v@google.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 07 May 2025 11:19:03 +0200
Message-ID: <87frhgpym0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Wed, May 07, 2025 at 10:35:16AM +0200, Benno Lossin wrote:
>> On Tue May 6, 2025 at 10:29 AM CEST, Andreas Hindborg wrote:
>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> > index 9d0471afc964..52683d686c8a 100644
>> > --- a/rust/kernel/types.rs
>> > +++ b/rust/kernel/types.rs
>> > @@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>> >  /// Implementers must also ensure that all instances are reference-counted. (Otherwise they
>> >  /// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
>> >  /// alive.)
>> > +///
>> > +/// Implementers of this trait must ensure that values of types implementing this trait can never be
>> > +/// owned by value. Instead, values must be owned and used through a pointer type. That is, a type
>> > +/// that implements [`Deref`].
>>
>> I don't think this covers every case, if I modify your example above
>> with Alice's suggestion and using `Box` instead of the stack, I get the
>> same problem:
>>
>>     struct Empty {}
>>
>>     unsafe impl AlwaysRefCounted for Empty {
>>         fn inc_ref(&self) {}
>>         unsafe fn dec_ref(_obj: NonNull<Self>) {}
>>     }
>>
>>     fn unsound() -> ARef<Empty> {
>>         use kernel::types::{ARef, RefCounted};
>>
>>         let data = Box::new(Empty {});
>>         let aref = ARef::from(&data);
>>
>>         aref
>>     }
>>
>> The same should be true if one uses `Arc` instead of `Box`. So, even
>> though we store it in a "pointer type that implements `Deref`", it is
>> unsound.
>>
>> I think that types that implement `AlwaysRefCounted` must only be store
>> inside of `ARef<T>`. So something like "Values of this trait must only
>> be exposed as `ARef<Self>` or `&Self`." I'm not satisfied with the
>> wording 'exposed', maybe you have a better word or can expand the
>> sentence.
>
> I mean, in some sense the problem is that Empty violates the existing
> requirement:
>
> Implementers must also ensure that all instances are reference-counted.
> (Otherwise they won't be able to honour the requirement that
> [`AlwaysRefCounted::inc_ref`] keep the object alive.)

The example holds, even if you implement `inc_ref`/`dec_ref` properly,
right?


Best regards,
Andreas Hindborg



