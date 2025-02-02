Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFCE1D5154;
	Sun,  2 Feb 2025 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738515435; cv=none; b=KqgKEMA6ombsINAbAPdPKggu/ua6cA3oAJ36Y9DQm8h75nRJSX9BFLtZv1oYJRHYl+dRB0KYlUKg7rczDBLxLhxwooI3Jahyulp3+x/9X53brZrusw8A21sTum3RASLWDzn8OPyaDy1XczUfR5mCV9GBH+5BLoKUEiAPNMeiQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738515435; c=relaxed/simple;
	bh=IGZw/c3qoMTFDdDCKwKPpgTwowB027sw2XXCX8Op4Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOBXC9VIMyuVpiJL+6UU03U8rSFfe6Krpk+G+nTiZTWTdoFsF/PlWrQhPSJI3edS3p3gRFohrVddypn8XCDhDFowRjSGLpAwyPfz8ZHnJfT+S8x/hxcAD6VywwkKiUpnHKWG0IZpgr4GrwbhsAxRtRgYWatWPGeD3+tGTMUOgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVGLTD5m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVGLTD5m"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436345cc17bso26798435e9.0;
        Sun, 02 Feb 2025 08:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738515432; x=1739120232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uwqe3wO2h1KhchbSQpJtyc0xUluXC5oEhfomc15Iqy0=;
        b=YVGLTD5mHDVVG4gD+424u1a+NFbLAp5KzeJX5pBklDJuZiqzhZ7Ft9KCDSsTU3IR6+
         hJn5uUSSFqb+qBAIYAqSYeEVMd53ps00OJkYgWlzqCuPTKbLs67OqZjXYMWRG7v4UfIi
         tILlRNuLzL6zWWMV9U8pT2c3mr13FHrsBUePwe8moHcoYBR3lN3/x5medF/tVRR8AtIe
         5cQE0IyUawfesIve/ruPfRAGNMSGdH39VEpofSC1t689bosIxrM3s/jniGG4O5yK7edB
         kBZyA9fvWDGl86PVSinjMbT7nYRmuh827dqpCcPabM6SmCyD4saF+6dswuPjL2COmmuZ
         12zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738515432; x=1739120232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwqe3wO2h1KhchbSQpJtyc0xUluXC5oEhfomc15Iqy0=;
        b=e+kx3QWXSQ16x01y/txnXc9Mt2+uBISXjHYoHbgEcdyBn4CRpjQXJc00+OFgDr0I1u
         ROi7uNM+8DVRScgaYrnDEwOnIyN1CUKkK5zbeZRuTBZyEVaOB2+jrRspMz3lQn11x5PF
         pRu/uVBE0kX4IX2uqPLLCkbqrSEhSUTdNZSTSBhsBwJf1A2VQvHTdBEXrJxaTMHp+NcZ
         JmCm7RciWGKhfZjvp8TchgP7/EYxlbuiPc+ovryfxfXSd8V+FbGtJ2yY/mgtyNpgilTn
         69n0Ey+yPBI5LyilxRKB4VgoWm+ZyFKKOgg8qvJaUsYFZ2D7TeZYBpC7cEiGPOSqBhj3
         ORLg==
X-Forwarded-Encrypted: i=1; AJvYcCVLvnni19ui9WSuXfQuiveELK3IIUce6GBep3qi+DoPFQ8UmG/vbQiIVipb37iJeznyEIKns0AOPdaBulkNR1o=@vger.kernel.org, AJvYcCWbdWFcWBv90mJ1tinAF7hqVjeaPtJTX9x2C7fsQELbR76nKH0tpzV6/Wlj9GYVni5k7dr2OX4dmQRFf7IF@vger.kernel.org, AJvYcCXSc67bazd9dxRiZb6lFgSNt8H3FzW70ewVpatts+N6JE5Nd4GPmbXncfUaSIlmue+PQbmAuTAIp94=@vger.kernel.org
X-Gm-Message-State: AOJu0YynlNLWG7cK1dB5bgUotuxsurAQaajuhT6+/IYqcSVB5FUJUwUQ
	TfO007Lm7QJD3m1J/2XMQh6Zzy8uysLX3lGsO0Ysk8KVNbhogpXq
X-Gm-Gg: ASbGncv9wRk3HU6Hj57Hk8N8J9bM7ntqR5iEIFMxWqsTDhUdUTWe5wViESE+jlR3fXA
	Jl+UXb/n/oJoaIP892WCp3B8Jz4qmNPxX0nwDioU4TrtMkK3owEP2sXG4ueYvGmt6LHWa/HdH98
	R0xnRAcWOYF2UPklHZVJtG9+029KwUiBooAgQ6JhDFn0smIt5TavwunqjLUc0BJ8QFOc8NGyOhw
	cZHuxZNprT806jlr8FMI0xKfyG8818uIGjpJW8cnwZaBbje/JflUPACg3YExIIkeFfGvp5/opWb
	6nXt9qH+0OdbexbzJ/NpyCMlODAg
X-Google-Smtp-Source: AGHT+IHGI4vuDKmxm2ggxLHqDVzd9rJXWTNLOaDrF/1kFKr5pLWjbelTJUrlum0Weyhom1nxQpYfcA==
X-Received: by 2002:a05:6000:1ace:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38c51970003mr13999601f8f.32.1738515431517;
        Sun, 02 Feb 2025 08:57:11 -0800 (PST)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11b71asm10539536f8f.39.2025.02.02.08.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 08:57:11 -0800 (PST)
Message-ID: <72feff7d-a305-4ca3-9c28-9040c791d3c5@gmail.com>
Date: Sun, 2 Feb 2025 17:57:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
 <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
 <e14cfb34-308f-4797-afe7-4e7e2d470fe3@app.fastmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <e14cfb34-308f-4797-afe7-4e7e2d470fe3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.01.25 8:37 PM, Arnd Bergmann wrote:
> On Fri, Jan 31, 2025, at 19:58, Christian Schrefl wrote:
>> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>>> To fix this Rust would have to provide a way to build the core
>>>> library without float support. I don't know if there is a plan
>>>> already to allow this.
>>>
>>> Floating point is banned within the kernel, except for in very narrow
>>> conditions, because the floating point registers are lazy saved on
>>> context switch. If the kernel uses the floating point registers, you
>>> can break user space in bad ways.
>>>
>>> I expect this has been discussed, since it is well known kernel
>>> restriction. Maybe go see what happened to that discussion within RfL?
>>
>> After checking again, it seems the float intrinsics are actually not
>> needed anymore at least for my config.
> 
> Ah, nice! If this is true for all architectures using the current
> rust compiler, it would be great to remove the FP stubs entirely
> and have link errors instead of panicking, to make it consistent
> with C.
> 
>> Only `__aeabi_uldivmod` is still
>> required for `parse_u64_into` since [0] allows disabling float formatting.
>>
>> Link error without the `__aeabi_uldivmod` symbol defined:
>>
>> ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>>> referenced 34 more times
>>>>> did you mean: __aeabi_uidivmod
>>>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>
>> Not sure if we should just implement `__aeabi_uldivmod`, keep the 
>> panicking intrinsic for it or somehow fix it in upstream Rust?
> 
> The 64-bit division is particularly easy to introduce by accident
> on 32-bit architectures, so ending up in a panic here is clearly
> a problem. From the message above it appears that there is only 
> a single calling function (parse_u64_into()) in the rust library,
> so I wonder if it might be sufficient to split that out into
> another object file that then doesn't need to get linked into
> the kernel, or for the kernel to override it with an implementation
> that does not rely on __aeabi_uldivmod() but calls __do_div64()
> instead.
> 
> Since parse_u64_into seems to be a parsing function that is
> expected to be slow, it should be acceptable to call __do_div64()
> here, while we still prevent calling __aeabi_uldivmod() from
> kernel source code.
> 
> Note that on earlier ARMv7 (Cortex-A8, A9), even a 32-bit
> division is implemented through an expensive software loop.
> Later cores (Cortex-A7, A15, A17) have native 32-bit division
> instructions but still no 64-bit ones.

It seems be possible to implement `__aeabi_uldivmod` like this [0]:

#[naked]
#[cfg(target_arch = "arm")]
#[export_name = "__rust__aeabi_uldivmod"]
pub unsafe extern "C" fn __aeabi_uldivmod() {
    unsafe {
        core::arch::naked_asm!(
            "push {{r4, lr}}",
            "sub sp, sp, #16",
            "add r4, sp, #8",
            "str r4, [sp]",
            "bl __udivmoddi4",
            "ldr r2, [sp, #8]",
            "ldr r3, [sp, #12]",
            "add sp, sp, #16",
            "pop {{r4, pc}}",
        );
    }
}

However that requires the `naked_functions` unstable feature.
Or it should be possible to just implement in a asm file.

I think it would be very difficult to entirely build core 
without needing `__aeabi_uldivmod`. 

Link: https://github.com/rust-lang/compiler-builtins/blob/6f96bccc5d4aa3ba4c4cebdf23a3ccc3bc7fe77c/src/arm.rs#L64-L77 [0]

Christian
