Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55132267392;
	Wed, 21 May 2025 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829787; cv=none; b=NewhscYzHKKzXQer+LLmxgAZ8FI0XXlWPOdWRSf/biRHdTqbq5cxYxYQXabtoXZTgZL4eFZp4M53U9IcgV2oJQgJ2ykJ/O/+1CkiEabiXUWGyXSzvOByZb8J/IBalwNdUwn0/UHj3+FVeA5j9MfhonrTyexdTCNmUN8LeXJhO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829787; c=relaxed/simple;
	bh=ElWSwnfR+3I4yOSdtEFdPeSnwV8fWmLey2NyfZhvn0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rA51zdqiBTcisPhPgiHTaXb5SCbWavfQ4muNc0jRcQK8fz90lveeNvaXz28HrilJtq4kKIHBNPfrrfxf4wVfX+5JMdKxPy37CMf4/Lcd4dj42WdDxEcQR3esdFAM9aoh5MFApH9lXcQnORzQWv61A47Hk79i4rfBbh89eoMIHho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpUnXEOF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpUnXEOF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso41690175e9.1;
        Wed, 21 May 2025 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747829783; x=1748434583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wj7VpMGLFyBW5Dsv1HmJ+sNVfvRubH9VM1E5jqOZ1ho=;
        b=BpUnXEOFvI6ZuTzFhxUN/7ejDG3nvHWURGM1iPfUPP9vuBrURzFA8bVbZd4Sqn11Ox
         2ZVEE3FFEmY5LcgxD2zmfDfYbaOPRcL1whvXHV7CG96qo8AU6XzkRlcsDkFO226V8cHa
         vwueFIbOM/jFLz6+snARz99t30BcWqXImUQgsb9h1bd9Qi1JaIKK7ekggPfie5gWPKNJ
         gD5XWXGx3DwHVt3lmZ3k9TRPKDhzVEbpxHUVXqg9DZW0T8/6dwHUxSGlIf1Ju4kyR2jH
         mD0INixTQGOkriou+Z/1MFcziXS4r/v7j+dC/Uui+3c0lcAUM/u8dqlkV9va1k8GFO5F
         6bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829783; x=1748434583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wj7VpMGLFyBW5Dsv1HmJ+sNVfvRubH9VM1E5jqOZ1ho=;
        b=gNQN38k2uztCU6VZ69qCUSprOh8Ptp7S0uPdSjXhaHpyIaSRaCnm0govBc2hyhRoP5
         cft+Wn8HdmLKj9UYY8i9G9OE8kOajyV8iidqJFlwxz8RZDz6JNBuUxOr12jV8yMcNU5w
         dKudqxVTOmXmduj/tAOGo+SPuxXjhHGyYhirh6Ex2i7rq1HS5bymPA/tCmoDqJonvr/b
         O+4qboQ62ZWyOdwtuLNFLDK6dUUVfhlzFtmaBh+NxTdKDQ64YGH72QC85gaH1AQcTzOj
         AHmXLsJ4+SEk+Ll3TJIcFVm01yKkKdg2KnApYcNJy94Kzvo8CXo+wvpETW6+7ZEnzvhR
         HygQ==
X-Forwarded-Encrypted: i=1; AJvYcCULhXhHEqT5BHF/vPvZv31FeTSQaGtoRmmw54mh3x2Of+Hbjql1WuxDFSj5vDiGjBPUD3Uai/4ltF32owc=@vger.kernel.org, AJvYcCXwe+umpjwHpZgWZkzsh1zKAMkDkiuyQZFsu64XyZ9WTL6gaDQXfTs4y2Nb59NrOeTi7xpqVitdJgd1cfJGDP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbiuzt/tU5GF1+ZTp2q3eLgQyEj9uAScBDVyIfzNvrQMVZEhMU
	RA7x+3n8s/2J6/WZcvBa6MuDqe6guAFAr0NYYKEY3lEX6p4dQwWNqYqT
X-Gm-Gg: ASbGncuNHPcAcL9q6qalfNlOy4ctEUl30urUlDdoVdl7o7xR9lhRNAr+xf8OtfxBFek
	/Rpq6tGrwaKybl6TSd7DcrQoYLF/ErlMfhPjFkjdRJBj6ksvpwuiUnJKTUVaQ5S1mR9PB9lLJeN
	82h8o4b70GwRff+JNNMw6AotO9NGvZUiTd/+Nw/PyXInDNIYPGrOAqFg6rxY1B760A6PhhZKUxN
	S4tIFXfxW4KEAJatgCwRkXvKOxn8br7a95Lz7u8giet/MXa7NdUOGni1Knv2XxSeO6izVASRoHQ
	MMxToX0HAMk0pU0ze/2T1HMwTSEZF2HDiNSLF8a+r1q8/+kXi/0sFPVgw+tL0JA=
X-Google-Smtp-Source: AGHT+IEHyXJT0VoqQ23BQnIQld/p9YC2EXVbaFsCV2yVYGn9TN5orQJ6MCi5Jp9L+uYmPnFw/1XxJg==
X-Received: by 2002:a05:600c:3c82:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-445229b431cmr120011375e9.8.1747829783250;
        Wed, 21 May 2025 05:16:23 -0700 (PDT)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29619sm72319885e9.7.2025.05.21.05.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:16:22 -0700 (PDT)
Message-ID: <4616772d-0052-4c2f-afec-69ae32f908aa@gmail.com>
Date: Wed, 21 May 2025 14:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux> <2025052107-awhile-drainer-38d0@gregkh>
 <2025052104-mockup-dupe-2573@gregkh>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <2025052104-mockup-dupe-2573@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Greg,

On 21.05.25 2:04 PM, Greg Kroah-Hartman wrote:
> On Wed, May 21, 2025 at 01:55:36PM +0200, Greg Kroah-Hartman wrote:
>> On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
>>> On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
>>>> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>>>>      #[pin]
>>>>      inner: Opaque<bindings::miscdevice>,
>>>> +    #[pin]
>>>> +    data: UnsafePinned<T::RegistrationData>,
>>>>      _t: PhantomData<T>,
>>>>  }
>>>
>>> I recommend not to store data within a Registration type itself.
>>>
>>> I know that this is designed with the focus on using misc device directly from
>>> the module scope; and in this context it works great.
>>>
>>> However, it becomes quite suboptimal when used from a driver scope. For
>>> instance, if the misc device is registered within a platform driver's probe()
>>> function.
>>>
>>> I know this probably isn't supported yet. At least, I assume it isn't supported
>>> "officially", given that the abstraction does not provide an option to set a
>>> parent device. Yet I think we should consider it.
>>
>> It's going to be a requirement to properly set the parent device, and
>> as you point out, this really should be in some sort of scope, not just
>> a module.
>>
>> But, we have two types of users of a misc device, one like this is
>> written, for a module-scope, and one for the "normal" device scope.  The
>> device scope is going to be tricker as it can, and will, get
>> disconnected from the device separately from the misc device lifespan,
>> so when that logic is added, it's going to be tricky as you point out.
>>
>> So I'll take this now, but in the future this is going to have to be
>> cleaned up and modified.
> 
> Nope, can't take it, it breaks the build from my tree:
> 
> error[E0432]: unresolved import `crate::types::UnsafePinned`
>   --> rust/kernel/miscdevice.rs:20:37
>    |
> 20 |     types::{ForeignOwnable, Opaque, UnsafePinned},
>    |                                     ^^^^^^^^^^^^ no `UnsafePinned` in `types`
> 
> error[E0432]: unresolved import `pin_init::Wrapper`
>   --> rust/kernel/miscdevice.rs:23:5
>    |
> 23 | use pin_init::Wrapper;
>    |     ^^^^^^^^^^^^^^^^^ no `Wrapper` in the root
> 
> error: aborting due to 2 previous errors
> 
> :(

This requires my `UnsafePinned` [0] patches (& with that pin-init-next) like I wrote
in the cover letter.

[0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com/

Cheers
Christian


