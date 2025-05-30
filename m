Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0891465A1;
	Fri, 30 May 2025 20:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635865; cv=none; b=bZHlqHA9Om4NmP87Wse1keqDLGZrq/3KybOifDBy9dv9qmFC5njWgTPE2DQ1lkl5sCiktU8Y7bHPZPk/l2AlAeiMwFRVSab7eJydsTZ8npl0NM/YITSQFgYj2XhGyGgejIf1YnB5joht4+jREsvReDbZv3VinvHJdP1V9ksyfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635865; c=relaxed/simple;
	bh=Mjc/fD0yFgLd5RTJw6hDwnsnEqut4Wn0uLPfdec7M24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjgmTxFzO1G7fPz2zJd+VWNH6ojCBqftbwx6t78w7V0b1iA9Av5iv38HTZ6OojW1jCXvCkcBnoRR3zYhk/w+/LkXwmPSBq1g3DYYagLZitzgv4N3pFPBIHmIYygoqLAVGj0RpEGm6GowcXofs9EY1j8Mjix3LJFMdCmM6lYD/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPzHMz/Q; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPzHMz/Q"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a375e72473so1380094f8f.0;
        Fri, 30 May 2025 13:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748635862; x=1749240662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHkw6awC08VKzpHwvnmDwUBFePL2xgE/3JrS0kjGRns=;
        b=TPzHMz/QgGJ40m+ioR7+0xaRpCn4v0J5fFpEUNfTwrQSmoHQIw3X2HuoOPGq/DiY8y
         jA8eV1LwKoQzfTbNHRzdSkhbI1YEAg9obtDBU3abA73WSBj3ws3wf0ggeL3FfojwnC8R
         ewv20mnTPPNy1o4yr0u0taQxb7K1YsL+6y6raki65spHGRaf0Klx3CCTFOm8mBuYcLS2
         CHYzYLHFVXFgIAZoBp6aq8KVxphAR8R9iUs0qUodmOWMcQ0h/4xg4YDzx0Jr/BnQhq3z
         byXXv9RmhMv2YVyG/N3a86H6JSEP0iiaEbYTNaRyYFN8FFbdgNa0fwlVcoXxVWrGMyQi
         h1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748635862; x=1749240662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHkw6awC08VKzpHwvnmDwUBFePL2xgE/3JrS0kjGRns=;
        b=YFx0KCD9R/nbKT8QGvukia3PVOaOjAcYIuFIzXTMpjeI4MiklZXjpz7u6oNZXj7N65
         qZZSc1EG35tZS9edyNm3348LP324xoANl5Mjs3o51h609jaXFlw2phWssQPBCePFea46
         BevPG3BoPl0gF7dxCSLHuJ+Uv6FoxVY2uJaI/gGDepl7uPuIIjnTHIjfDAb9kRocL23j
         07OK5cUOV5OGO7l39O7PRTwD54XBBDe3Nm9bGNhAXBCHLqwb2IxPYuYJ+VE9kkgeD2gC
         eF3Cr4efHh/NeQghdZFh0Y99Y79lsLgPJ5IXIdBhWOMnJKx+kb1myyq88BzrjrEiT6zm
         LxWg==
X-Forwarded-Encrypted: i=1; AJvYcCW60VRIRWeIE8jVd1hZQQ1X1ILKIN8CuvrJYw35OjlSnffvxUpZGKHTiLX0pTIjwywcGE4EvmNcZo1rZ28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPu7WarQT78RIGZXfBW4ZJXwhbjj573r3uS4AgGzqAsvpenw0b
	LoVa+LmYTJSRZOcX4zMltsIpGdS0zkDe9ke9bo5AQS1a/7iN7zvJ7UcD
X-Gm-Gg: ASbGnctyU0oENfVapjv9fqxbU6ffLiLDgrPfwv3ELy6QUDaHtFx9TwFhdnrssP2R2bX
	VDmJamIL5WK9hmHGv+HBvZA5lJ2meKI1Iyy7Zs7lHtd7GHT1gkxkgXhb559HQ8qb9KuGEGBwHGH
	cSsWvaZ83d8uUwt3/eLIBjaGt1/jXGJime4BaWZYBueh/NmGi8TsWCkCnJjvzfaQwrsrOQTTexc
	0wW6GeJTa9xk514ZKjrjAcKEaXtoVVwtpg6338FzlNnxdyM1yFKoy/9YrBp1VbazIiGKPQ/orUo
	DuD7o+fcZELXsCo3IAJwTwW4DbIowl5HKiIZwzMFf2mdIUVC07ZHw5WX9Ml3/3WG
X-Google-Smtp-Source: AGHT+IHbbO+vPN2paBeSNj40h548ttzkqFjyocMZdGD5kvGxrLFajx6wN3mWhP4JSNn5lKocWKp73A==
X-Received: by 2002:a5d:5f93:0:b0:3a3:671e:3b7c with SMTP id ffacd0b85a97d-3a4f7a7bfebmr3864628f8f.48.1748635861924;
        Fri, 30 May 2025 13:11:01 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73ee0sm5606894f8f.46.2025.05.30.13.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 13:11:01 -0700 (PDT)
Message-ID: <6dfafb34-8b85-4f54-9453-c39297d1f851@gmail.com>
Date: Fri, 30 May 2025 22:11:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] rust: types: support fallible PinInit types in
 Opaque::pin_init
To: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-2-dakr@kernel.org>
 <DA9QST4SISFK.37NSCTH594NSF@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DA9QST4SISFK.37NSCTH594NSF@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.25 9:29 PM, Benno Lossin wrote:
> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
>> Currently, Opaque::pin_init only supports infallible PinInit
>> implementations, i.e. impl PinInit<T, Infallible>.
>>
>> This has been sufficient so far, since users such as Revocable do not
>> support fallibility.
>>
>> Since this is about to change, make Opaque::pin_init() generic over the
>> error type E.
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>  rust/kernel/types.rs | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 22985b6f6982..75c99d6facf9 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -354,13 +354,13 @@ pub const fn zeroed() -> Self {
>>      }
>>  
>>      /// Create an opaque pin-initializer from the given pin-initializer.
>> -    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
>> -        Self::ffi_init(|ptr: *mut T| {
>> +    pub fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        Self::try_ffi_init(|ptr: *mut T| -> Result<(), E> {
>>              // SAFETY:
>>              //   - `ptr` is a valid pointer to uninitialized memory,
>> -            //   - `slot` is not accessed on error; the call is infallible,
>> +            //   - `slot` is not accessed on error,
>>              //   - `slot` is pinned in memory.
>> -            let _ = unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
>> +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
> 
> Could you move this function into an `impl pin_init::Wrapper<T>` block?
> (it's the same function, but in a trait that was recently added)

This is then basically this patch [0] from my `UnsafePinned` series.
Just that I did not update the comment. :)

[0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/ 

> 
> Thanks!
> 
> ---
> Cheers,
> Benno
> 
>>          })
>>      }
>>  
> 

