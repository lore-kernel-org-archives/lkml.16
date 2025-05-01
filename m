Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061BC215191;
	Thu,  1 May 2025 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126685; cv=none; b=YyYXR+nhaPh9OucmPEgo6Lm6lb845rsXxGkdYI6GrM1+3i4b0hw8D8904Priw9paVwh5Z7GdPJIfXx0rakGXk4zJc6NhPTWuq3foWlnSUGYbcU/x0a2a/U2RjFTCvMKUdTgrUewjFGnxSaFhqxKXu3aUhQgIVj5DCso69yAAeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126685; c=relaxed/simple;
	bh=iAT4bVjAA3f20iGOzEIK/Cv7AvdY7kG6Bc21ioPPVhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwDV7QSy68Lie48UfDGe3WlGAi8rwLb1fVFGSfJt1lXBjIpUuVw8bGzDMsimLs3UBKHGvjmclAGRe5H/TlMICL8J0Mxdpx1jgimgoSvXWGUnjI5LN8rNhF4y3zbi6pr/cMQ/Tjd0StCg2HubfyfTBP4pl+LbbuHIwWET7E4hVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYC3O0PY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYC3O0PY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so6171755e9.1;
        Thu, 01 May 2025 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746126682; x=1746731482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzIZTBtSV190H1qEBhvYOhB13RX3qoICNdE4kk6MOYA=;
        b=SYC3O0PYO0pwqbGizshAWmXnbJtDodnKD91LbFtqZPJMkxwmkw1t7zNq+OkeVsV3xm
         MzobO7/Q7mh2E5+fSkJQoWv63R/PF5yOkKPNKJMDuxXR/dBhO3gUiQFfkHrJXg6vF7a1
         3AmRV7Sal6dApQnKxq9xNQk8hopNgfjyl9ur/VfATC6YpdNlefzH/xiHfZnK/Ga17SS8
         vfJEBFWc05Gwyg986nT5UN5Mf1Ebzz41Kabsj6MfdSqKOlRNoc4iC0OqU8r6Zq9fNhkb
         9kS326qP5WExGT1T6szh1l7JHVfzeTmvO0yoCtU30YnSuWE78KZGPwxy3fcZfFTF2x4W
         8H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126682; x=1746731482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzIZTBtSV190H1qEBhvYOhB13RX3qoICNdE4kk6MOYA=;
        b=bgBqsnVR890xtvSVvR5GdZoE5uYpKaLqvzgrvyC74m3oct+rAASvtJIYXMeiajV35l
         TjI0CbzPJrVDXfzo4uhj5zCKVsMR0d0QUr4oA9YBZSNLXjC3Izxq0XAmmqesv312iFH9
         ViWQxTtg753VNDU+DjB2KGHVmcPXgAxtahmhgrFP+oGcFSMwx4hSfYO3ICKr4KgPYlQP
         QPsJ47L4ertd9sRjHHsed57Jszlh82+gSxv08K05xilXbV4WgvKgEErNAOaUMmLthbew
         s4OQdvd45GE37Ggbbt/eXd5XUCIaW9+peVf9i74SsuxV3Ep9z6ub+MNGJwp313eaf14q
         yEtw==
X-Forwarded-Encrypted: i=1; AJvYcCVTSdGvzlXzckN1/L92+gsuQHqVxmQvq9NFsC9OXuKPG+gkw1MQPXg4ZUTUlhgJybMkmYnPKwkzXzFJ4giiVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfwxjmBcSr1b9p+dXegnbGn+stjtRgNMuU9oUJ3NVSnRxgTru
	/v1dtygfeTHxFIASqr1pa+U7iSNQCvwYMbr5ZNBO1qAEsOoWNjIy
X-Gm-Gg: ASbGncsf4TKXReCIdMnwjiqus/THyCEQmXbo8cVj/eCHmieQnevxMB1VCGLVcHGj5Bt
	D7B34g/AEUaMgx3ie+YVdMguiRkdPpI+q/7d6lobRYd1p/a6rVZyTqf4FKwYEleKcPJ89FmyAaW
	eQDbl3JuRfcs6dD7+gbE9IXjb3EVw1MZI3Kd04n67X1iiQcCkNQf3R1e4evquKLtFIwGIai+2Cr
	kKEei4uGAgh6MU+YAj9DoQiE6/r8ZFJXAqyyut6p7IuXvcIZeloPrKbE2Y2BxsuyBNav0XCGEYv
	4KLiLhJXFsRKHl+0mK24ZomL7McFN2pjfcRBhIe0ODkuCYo1W8bWCQ==
X-Google-Smtp-Source: AGHT+IGXnxF+dOyhNCIoHfP6O9RTrvMeXL02lV38RWUrb/V9qwv+c1GjZc1yjMRyHq4+gxPI2WvJmA==
X-Received: by 2002:a05:600c:ccc:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-441bbf2bbc1mr297505e9.25.1746126681933;
        Thu, 01 May 2025 12:11:21 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad781csm66865295e9.8.2025.05.01.12.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:11:21 -0700 (PDT)
Message-ID: <7bc9f839-a69a-4819-ba6d-36eadd8776b3@gmail.com>
Date: Thu, 1 May 2025 21:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
 <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>
 <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.05.25 8:51 PM, Benno Lossin wrote:
> On Wed Apr 30, 2025 at 7:30 PM CEST, Christian Schrefl wrote:
>> On 30.04.25 11:45 AM, Benno Lossin wrote:
>>> On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
>>>> +/// This implementation works because of the "`!Unpin` hack" in rustc, which allows (some kinds of)
>>>> +/// mutual aliasing of `!Unpin` types. This hack might be removed at some point, after which only
>>>> +/// the `core::pin::UnsafePinned` type will allow this behavior. In order to simplify the migration
>>>> +/// to future rust versions only this polyfill of this type should be used when this behavior is
>>>> +/// required.
>>>> +///
>>>> +/// In order to disable niche optimizations this implementation uses [`UnsafeCell`] internally,
>>>> +/// the upstream version however will not. So the fact that [`UnsafePinned`] contains an
>>>> +/// [`UnsafeCell`] must not be relied on (Other than the niche blocking).
>>>
>>> I would make this last paragraph a normal comment, I don't think we
>>> should expose it in the docs.
>>
>> I added this as docs since I wanted it to be a bit more visible,
>> but I can replace the comment text (about `UnsafeCell`) with this paragraph
>> and drop it from the docs if you want.
> 
> I think we shouldn't talk about these implementation details in the
> docs.

Alright, what do you think of:

// As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
//   Required to use the `!Unpin hack`.
// - In order to disable niche optimizations this implementation uses `UnsafeCell` internally,
//   the upstream version however currently does not. This will most likely change in the future
//   but for now we don't expose this in the documentation, since adding the guarantee is simpler
//   than removing it. Meaning that for now the fact that `UnsafePinned` contains an `UnsafeCell`
//   must not be relied on (Other than the niche blocking).

> 
>>>> +// As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
>>>> +// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
>>>> +//      Required to use the `!Unpin hack`.
>>>> +// - `UnsafeCell<T>` instead of T to disallow niche optimizations,
>>>> +//     which is handled in the compiler in upstream Rust
>>>> +#[repr(transparent)]
>>>> +pub struct UnsafePinned<T: ?Sized> {
>>>> +    _ph: PhantomPinned,
>>>> +    value: UnsafeCell<T>,
>>>> +}
>>>> +
>>>> +impl<T> UnsafePinned<T> {
>>>> +    /// Constructs a new instance of [`UnsafePinned`] which will wrap the specified value.
>>>> +    ///
>>>> +    /// All access to the inner value through `&UnsafePinned<T>` or `&mut UnsafePinned<T>` or
>>>> +    /// `Pin<&mut UnsafePinned<T>>` requires `unsafe` code.
>>>> +    #[inline(always)]
>>>> +    #[must_use]
>>>> +    pub const fn new(value: T) -> Self {
>>>> +        UnsafePinned {
>>>> +            value: UnsafeCell::new(value),
>>>> +            _ph: PhantomPinned,
>>>> +        }
>>>> +    }
>>>> +}
>>>> +impl<T: ?Sized> UnsafePinned<T> {
>>>> +    /// Get read-only access to the contents of a shared `UnsafePinned`.
>>>> +    ///
>>>> +    /// Note that `&UnsafePinned<T>` is read-only if `&T` is read-only. This means that if there is
>>>> +    /// mutation of the `T`, future reads from the `*const T` returned here are UB! Use
>>>> +    /// [`UnsafeCell`] if you also need interior mutability.
>>>
>>> I agree with copy-pasting the docs from upstream, even though our
>>> implementation already wraps the value in `UnsafeCell`, but I think we
>>> should include a comment at the top of this doc that mentions this
>>> difference. So something along the lines "In order to make replacing
>>> this type with the upstream one, we want to have as little API
>>> divergence as possible. Thus we don't mention the implementation detail
>>> of `UnsafeCell` and people have to use `UnsafePinned<UnsafeCell<T>>`
>>> instead of just `UnsafePinned<T>`." feel free to modify.
>>>
>>
>> I already wrote about this in comments (and documentation in this version)
>> on the `UnsafePinned` type definition.
>>
>> I'm not sure where exactly we want to have this, but I think having it
>> at the top of the file and on the type definition is a bit redundant.
> 
> Sure.

I'll add the following sentence to the end of the module documentation:

For details on the difference to the upstream implementation see the
comment on the [`UnsafePinned`] struct definition.

> 
>>>> +    /// Gets a mutable pointer to the wrapped value.
>>>> +    ///
>>>> +    /// The difference from `get_mut_pinned` and `get_mut_unchecked` is that this function
>>>> +    /// accepts a raw pointer, which is useful to avoid the creation of temporary references.
>>>
>>> You did not include the `get_mut_{pinned,unchecked}` methods, so
>>> mentioning them here in the docs might confuse people. Do we want to
>>> have those methods?
>>
>> I only included the functions that we needed for `Opaque` and my
>> `miscdevice' patches. I think these functions should only be added
>> once they have a user. That's why I wrote the next sentence in the
>> documents.
>>
>> Should I handle this differently?
>>
>> It should be a really simple patch to add these functions and I can
>> do that if someone needs them or I can just include them in this
>> patch set.
> 
> Then I'd remove the sentence referencing the functions you don't add.

Alright

Cheers
Christian
