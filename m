Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070421D3E9;
	Wed, 30 Apr 2025 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032879; cv=none; b=cTOuPefWVAnpkK8RWHlVhaISBd4mzMZ9XN60vJOQhGwSOo2fIZWLD2g8bDv7PWxc+4bwJmgs7nDBsbCkBAmjMmEy0/j66u1U0FjYxAMuRfzn9PRsiE4t3B56DDWlisz9aYh/hP+zV3/ghFrvH9DHQb8gNNZfzzZQfJ5Esso2cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032879; c=relaxed/simple;
	bh=aSXXgWGd7chNCgymfV8MFhuX0N/as2DSWP+hVD8qsns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWbXDyGAzVX9MtuSAXSaZMTAYPlKxa5dHTSgIrpx0cnfhpCJcAZCtbQZiGaHPupxtJJ8q0yZXKXVOnYu6V3bUEtR4nBzz0Gko+ovXOXyQTXGOfB+aE0de5LjRWwYizb57vyG0cGrH2k9wQXtgdZBHujNyn9dXEA/uMBH/Mac82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BotM+WlC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BotM+WlC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso5898951f8f.2;
        Wed, 30 Apr 2025 10:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746032876; x=1746637676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMXusxI0QZW/lWCkYNQNMWgJXnZSo5ysaTOr6uqV3aE=;
        b=BotM+WlCdgJTW5eL1f2hcj4Vas7V3xlThkttvNA0BIlVyr7y4+ZZnQgX7TzzgjEM23
         cZwqe+s7nrilxQdV0udGmb31WSYQAeuSMQrtE7Fwtpaccwu3CerTMX5vuxkxntA3Rldb
         E8/YywW4xBTng7ZU84qLU74R+g3yYbrlfwE0PTQL3WnLtmgHpObRtRaOGY8L9JS+AVuy
         vVnsl5XhJ4ZZkDvMzrqIVekVqSMDysS8KsTuvadA8WBg+7jaCndI1b3fgFMGF5uXPuE6
         dMUdvq1N9iz8VnBlxWe+29r0NmOHHyN2BEhfY4DkFQpZMagTPpboght99d7bSNmIjcKw
         y0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032876; x=1746637676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMXusxI0QZW/lWCkYNQNMWgJXnZSo5ysaTOr6uqV3aE=;
        b=lvSJUr4l8soctOgeF7IRS+Hx1Me8F6DwjV5fqqe9boaipVe3sLGdZmYXldlELuyDQd
         RZGNPdapfxUhCZNZ36vyl3P3zV9iW0dBs8pqMsgPFdIx4aAHNDQmTVSRMdAL97aO5LCt
         AVWUvvMNod2SVRPAZHcQRKw66cHT9HU8kovOVWNX8pmHpJOyMAfAB3Riyh6rBUHEBqeE
         GegKz81UeFukL+6XFhL8FCg2zxI7FCtOJ35MPBmfxS+B9ErWkyzN9NIX79KDyzAYKdYv
         mcFHqoYXTthCK/qjdRSCxT/H34km3hkolry/2ucJCU3p1Nl1mZayGsV4ss9PxzUZ6h+k
         NbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdsV2HnC6DdxzYMLMscLGUqY0V01Z7/LNYcjSCjMFWW7YxZ0qFKZH+ZX9HFqi4O8gc13CRz0wmj0NKYjE=@vger.kernel.org, AJvYcCXgCJvuX7eRS2yEPT0+rxRBGL0M+S7FH814xJzvzEy0FYwJdQCBmK7P3bP9xg33oxxQsMtMVWyFFCnmdLqV4VY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7sq5iwi77WTuLs9a37nB7J5nYmY0s39vreqtCZr/CkwDOcPJ
	aE1xYYn7B3/81ndwboNZrMF/hZ2E4rfaPfWfYaZRXNVnIi8XxjXc
X-Gm-Gg: ASbGncv0/lAUboD4B6/oQ3dvFRpX6SYiCH+55EadSx0YPz/XeU9t3xexyIGCyjXuQow
	LQHuzg3I1lmwPjyAvAMiOTo8HY+h70RCrQu26bLiEV8TrkanpAAA+1Qx8IS0tBJ136rJskxdeB3
	/kbfw6TrvO13aTOoYUSKtFzeLvwqB+jLFcnrcPujMtRV8SfX2hDCcUb5qW2xWVF2cgeETa8krxY
	/Joi5Hn95a7tlHv9aSFVGlIyCe0tJ1doP/F9t5cNjI9HaNZK6S6ABSuXxwWiIIJ0pTmGsBeFs+8
	IIjpMA6g4ErEosV5gCoCiiFM36mPV3NTCpLgnaAOE5PZhxjUolm+7w==
X-Google-Smtp-Source: AGHT+IH9ON5OdEYGvzDXPnphlXNlbl4IdRIrP3RNJ6K9oDio5eu/bDJWTx8CrzimR+bWbt1MryIbWw==
X-Received: by 2002:a05:6000:2284:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-3a08f7d456dmr3771333f8f.52.1746032875786;
        Wed, 30 Apr 2025 10:07:55 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4f88sm17103108f8f.29.2025.04.30.10.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 10:07:55 -0700 (PDT)
Message-ID: <9683fcd6-4fdc-41f7-bfc6-78a44d7360e8@gmail.com>
Date: Wed, 30 Apr 2025 19:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rust: use `UnsafePinned` in the implementation of
 `Opaque`
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Ralf Jung <post@ralfj.de>
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>
 <aBJTVWsrqzuasx7W@Mac.home>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <aBJTVWsrqzuasx7W@Mac.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.25 6:44 PM, Boqun Feng wrote:
> [Cc Ralf]
> 
> On Wed, Apr 30, 2025 at 10:36:13AM +0200, Christian Schrefl wrote:
>> This change makes the semantics of the `Opaque` implementation
>> clearer and prepares for the switch to the upstream rust UnsafePinned`
>> type in the future.
>>
>> `Opaque` still uses `UnsafeCell` even though the kernel implementation
>> of `UnsafePinned` already includes it, since the current upstream
>> version does not.
>>
>> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
>> ---
>>  rust/kernel/types.rs | 29 ++++++++++++-----------------
>>  1 file changed, 12 insertions(+), 17 deletions(-)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index f06e8720e012102e5c41e79fd97b0607e927d71c..44d96423a8a6c358bb7ebf12c24fad98e5c2cb61 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -4,12 +4,12 @@
>>  
>>  use core::{
>>      cell::UnsafeCell,
>> -    marker::{PhantomData, PhantomPinned},
>> +    marker::PhantomData,
>>      mem::{ManuallyDrop, MaybeUninit},
>>      ops::{Deref, DerefMut},
>>      ptr::NonNull,
>>  };
>> -use pin_init::{PinInit, Wrapper, Zeroable};
>> +use pin_init::{cast_pin_init, PinInit, Wrapper, Zeroable};
>>  
>>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>>  ///
>> @@ -308,8 +308,7 @@ fn drop(&mut self) {
>>  /// ```
>>  #[repr(transparent)]
>>  pub struct Opaque<T> {
>> -    value: UnsafeCell<MaybeUninit<T>>,
>> -    _pin: PhantomPinned,
>> +    value: UnsafePinned<UnsafeCell<MaybeUninit<T>>>,
> 
> What's the Rust upstream opinion on `&UnsafePinned` vs `&UnsafeCell`?
> Does `&UnsafePinned` provide the same noalias behavior as `&UnsafeCell`?

From the upsteam rust docs [0]:
> Further note that this does not lift the requirement that shared
references must be read-only! Use `UnsafeCell` for that.

I at some point there was discussion about possibly needing to use
`UnsafeCell` internally (because of `pin::deref`). But since the
current upstream documentation explicitly mentions still needing
`UnsafeCell` I assume that it will stay this was. If the upstream
implementation changes I can add a patch that removes the
unnecessary `UnsafeCell` and changes the documentation.

I asked about this on the `UnsafePinned` rust tracking issue [1].

Link: https://doc.rust-lang.org/nightly/std/pin/struct.UnsafePinned.html [0]
Link: https://github.com/rust-lang/rust/issues/125735#issuecomment-2842668816 [1]

Cheers
Christian

> I'm wondering whether we should just do:
> 
>     pub struct Opaque<T> {
>         value: UnsafePinned<MaybeUninit<T>>,
>         _not_sync: PhantomData<UnsafeCell<()>>,
>     }
> 
> , instead.
> 
> Regards,
> Boqun
> 
>>  }
>>  
>>  // SAFETY: `Opaque<T>` allows the inner value to be any bit pattern, including all zeros.
>> @@ -319,16 +318,14 @@ impl<T> Opaque<T> {
>>      /// Creates a new opaque value.
>>      pub const fn new(value: T) -> Self {
>>          Self {
>> -            value: UnsafeCell::new(MaybeUninit::new(value)),
>> -            _pin: PhantomPinned,
>> +            value: UnsafePinned::new(UnsafeCell::new(MaybeUninit::new(value))),
>>          }
>>      }
>>  
>>      /// Creates an uninitialised value.
>>      pub const fn uninit() -> Self {
>>          Self {
>> -            value: UnsafeCell::new(MaybeUninit::uninit()),
>> -            _pin: PhantomPinned,
>> +            value: UnsafePinned::new(UnsafeCell::new(MaybeUninit::uninit())),
>>          }
>>      }
>>  
>> @@ -371,7 +368,7 @@ pub fn try_ffi_init<E>(
>>  
>>      /// Returns a raw pointer to the opaque data.
>>      pub const fn get(&self) -> *mut T {
>> -        UnsafeCell::get(&self.value).cast::<T>()
>> +        UnsafeCell::raw_get(self.value.get()).cast::<T>()
>>      }
>>  
>>      /// Gets the value behind `this`.
>> @@ -384,14 +381,12 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>>  }
>>  impl<T> Wrapper<T> for Opaque<T> {
>>      /// Create an opaque pin-initializer from the given pin-initializer.
>> -    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> -        Self::try_ffi_init(|ptr: *mut T| {
>> -            // SAFETY:
>> -            //   - `ptr` is a valid pointer to uninitialized memory,
>> -            //   - `slot` is not accessed on error; the call is infallible,
>> -            //   - `slot` is pinned in memory.
>> -            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
>> -        })
>> +    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        let value_init =
>> +            UnsafePinned::pin_init(UnsafeCell::pin_init(MaybeUninit::pin_init(value_init)));
>> +        // SAFETY: `Opaque<T>` is a `repr(transparent)` wrapper around
>> +        // `UnsafePinned<UnsafeCell<MabeUninit<T>>>` so the memory representation is compatible.
>> +        unsafe { cast_pin_init(value_init) }
>>      }
>>  }
>>  
>>
>> -- 
>> 2.49.0
>>
>>

