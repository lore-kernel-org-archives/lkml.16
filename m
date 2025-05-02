Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3241BEF77;
	Fri,  2 May 2025 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185655; cv=none; b=DmqAxK22dUgwfi4JPJ0M3C7t2piFq6Oqu5wX/JahXf+2bIQ2NfRGdXVEB/matE8f8PMMnpC9rXuAHt2RObF33qFeFXQbctVqUeNMxBpokkA53YT5df/csPEKqKhp+8qbCLgiflfvXqLqaNfC+Y/zd+pi8k9vonHqSXrUC2YI49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185655; c=relaxed/simple;
	bh=ezYwlB9fBt/xFiYifIO5qVSNZM/FZ69JnrSopMVLz8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X8aavRI0Kt3Iv4jaW/ByLY3autMaMokRcDjXyQiWJK+Y4IH/vVo/aMqmRkT4PCv7ExxeX85vmD1VcjF8jKxK1qE0vbERSOxphK0M+VRxkgj2MtkPbo4GxC251UeT0P6oqbplGjeTNk0YrLUXygxyqFwmRY/AZqoJia/2sOKYjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q02eNc8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q02eNc8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90300C4CEE4;
	Fri,  2 May 2025 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746185654;
	bh=ezYwlB9fBt/xFiYifIO5qVSNZM/FZ69JnrSopMVLz8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q02eNc8ng9FxM05iwbatgdBbkj0XjGhf65VsdygWKlREwiqdiso2H7/bLenF6NnWD
	 UDoX6osJQJtvqMqxNmgx2CF8Ko7/Tj1D0ae3JHlhaR4a6wDOljf53NXNiwxVqgsYvf
	 wvt5CmA4iC653a4aG8RI+oDdwPBHju6Q2HMfNYiwy5ab73Bdl6Hi98ur5hZ/Bl8Yo/
	 6aOMQ9fZ0sSy0q8MEetrMwDQQgJ7yv4uMKd1k9c9Qkn3irxa2I93EmThVk/cDdr816
	 tPVU5PprEZZi0MK0rwwWTvUExatj++cpOymV55xK2JeKKf3KNWeLYhddM+3bMDDoqN
	 hriStzu43b+dA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Alice Ryhl <aliceryhl@google.com>,  Trevor
 Gross <tmgross@umich.edu>,  Asahi Lina <lina@asahilina.net>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] rust: Add missing SAFETY documentation for ARef
 example
In-Reply-To: <87o6wbz46a.fsf@kernel.org> (Andreas Hindborg's message of "Fri,
	02 May 2025 12:40:29 +0200")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<BilXj9TIYuQxgQ8GYVKxO0m88NUME1b-jtwrV9ZX3W9GXO-QJGFpb9rChJZarPa4e2AAvgJTm_DINEIW1JINlA==@protonmail.internalid>
	<20250325-unique-ref-v9-3-e91618c1de26@pm.me> <87a58pd6t4.fsf@kernel.org>
	<Z_33ntAgpRU_541N@mango> <87o6wbz46a.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 13:33:53 +0200
Message-ID: <87cycrz1pa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Oliver Mangold <oliver.mangold@pm.me> writes:
>
>> On 250409 1126, Andreas Hindborg wrote:
>>> "Oliver Mangold" <oliver.mangold@pm.me> writes:
>>> 
>>> > SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>>> >
>>> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>>> > ---
>>> >  rust/kernel/types.rs | 4 ++--
>>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> > index c8b78bcad259132808cc38c56b9f2bd525a0b755..db29f7c725e631c11099fa9122901ec2b3f4a039 100644
>>> > --- a/rust/kernel/types.rs
>>> > +++ b/rust/kernel/types.rs
>>> > @@ -492,7 +492,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>>> >      ///
>>> >      /// struct Empty {}
>>> >      ///
>>> > -    /// # // SAFETY: TODO.
>>> > +    /// // SAFETY: We do not free anything.
>>> 
>>> How about:
>>> 
>>>   This implementation will never free the underlying object, so the
>>>   object is kept alive longer than the safety requirement specifies.
>>
>> Yes, was rather sloppy wording. Thanks, I will use your version.
>>
>>> >      /// unsafe impl RefCounted for Empty {
>>> >      ///     fn inc_ref(&self) {}
>>> >      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
>>> > @@ -500,7 +500,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>>> >      ///
>>> >      /// let mut data = Empty {};
>>> >      /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>>> > -    /// # // SAFETY: TODO.
>>> > +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>>> 
>>> This is not sufficient. The safety requirement is:
>>> 
>>>   Callers must ensure that the reference count was incremented at least once, and that they
>>>   are properly relinquishing one increment. That is, if there is only one increment, callers
>>>   must not use the underlying object anymore -- it is only safe to do so via the newly
>>>   created [`ARef`].
>>> 
>>> How about:
>>> 
>>>   The `RefCounted` implementation for `Empty` does not count references
>>>   and never frees the underlying object. Thus we can act as having a
>>>   refcount on the object that we pass to the newly created `ARef`.
>>> 
>>> I think this example actually exposes a soundness hole. When the
>>> underlying object is allocated on the stack, the safety requirements are
>>> not sufficient to ensure the lifetime of the object. We could safely
>>> return `data_ref` and have the underlying object go away. We should add
>>> to the safety requirement of `ARef::from_raw`:
>>> 
>>>   `ptr` must be valid while the refcount is positive.
>>
>> Wouldn't this already be covered by the below in the doc for
>> AlwaysRefCounted?
>>
>>     Implementers must ensure that increments to the reference count keep
>>     the object alive in memory at least until matching decrements are
>>     performed."
>
> No, I don't think that is enough. We can implement the trait properly
> with refcounts and still we can allocate an object on the stack and then
> do a `from_raw` on that object without violating any safety
> requirements. I think the `ARef::from_raw` should have the safety
> requirement above. But we can do that as a separate patch.

On second thought, I think you are right. I was trying to implement a
counter example, and I think it is not possible to implement
`RefCounted` while following the safety requirements in a way that would
trigger this issue. Implementers will have to make sure that the the
type that implement `RefCounted` cannot be directly constructed. In
other words the implementation for `Empty` is illegal in this regard.

We can do this instead for the example


    mod empty {
        use crate::alloc::KBox;
        use core::ptr::NonNull;

        pub struct Empty {
            // Prevent direct construction
            _p: (),
        }

        // SAFETY: The `RefCounted` implementation for `Empty` does not count references
        // and never frees the underlying object. Thus we can act as having a
        // refcount on the object that we pass to the newly created `ARef`.
        unsafe impl super::RefCounted for Empty {
            fn inc_ref(&self) {}

            unsafe fn dec_ref(_obj: NonNull<Self>) {}
        }

        impl Empty {
            pub fn new() -> NonNull<Self> {
                NonNull::new(KBox::into_raw(
                    KBox::new(Self { _p: () }, kernel::alloc::flags::GFP_KERNEL).unwrap(),
                ))
                .unwrap()
            }
        }
    }

    let ptr = empty::Empty::new();

    // SAFETY: The `RefCounted` implementation for `Empty` does not count
    // references and never frees the underlying object. Thus we can act as
    // having a refcount on the object that we pass to the newly created `ARef`.
    let data_ref: ARef<empty::Empty> = unsafe { ARef::from_raw(ptr) };
    let _raw_ptr: NonNull<empty::Empty> = ARef::into_raw(data_ref);



Best regards,
Andreas Hindborg


