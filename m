Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86E1487C1;
	Fri, 31 Jan 2025 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738366944; cv=none; b=SFbR0/5x0jBLxaWZa2DYWNOATaqyldYQeMxPbO972uNqlhfTDPzFjRrfqzC6Z+Od/rJChMP0WSzYZSUI+iLh8wSQrtf3JsBXlhWb4BtZn4dxpaMyt+knNSh5MD9SFsJcoWUUnaFINPhljfFUPc2ty9sRmE6uHMVZQaILgQL0IOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738366944; c=relaxed/simple;
	bh=Rv6DgWNJ80bCHhZiOZ5j5gvAXtjVDh+duvpszfGCjtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etVbc8b/IIyRHOeNyxW7B16xde2PtpdQzf8VA1dnNESKnpxsTmiK2siVnvOohk+IlP0yjL3bcjExwYESz26Q+j+FQHi6yBXNNFnqOjfEaYw+oZLvHAkv8oBZpq9ElUOrmr9qw42HvEL8pVGByAxIH9UkVX1Q2KfJr7aE/PcmmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT3zF1ho; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT3zF1ho"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so215525466b.0;
        Fri, 31 Jan 2025 15:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738366941; x=1738971741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGwPodq6Q+1QRMhQwzdR87h5olYJe5SMz1YpEKeh/EA=;
        b=UT3zF1hoS2ORWphtm5G85P56JDux74uklvgOLdvKuciEwlk4mqsnVkWaou4xOa5oJt
         rwSjqVtraqiKEPhgUz/yuL4wRjFbOWu1ObxffEpaO1g7koMDBnVyiHl//innzAfXIJGs
         y0v7EVVsmHmFL7M+ufcW4FRMv9dmWM0ZQIV8NpmkLDXyAS2SIWPL9qb5h6yDFMTCQqd6
         /UoehhvKWYt9pETwgCVZh0KBthV3ODRcj4f/2yiMyuX+58wHdr8rflnr0CDkqqMOSDxG
         F4DNbJnzE7lCn6iA18HQDlCAm74XT+4FEoenWlrxv9VlGiv8r1ZZGTQnmS0MshEUNUvg
         pApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738366941; x=1738971741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGwPodq6Q+1QRMhQwzdR87h5olYJe5SMz1YpEKeh/EA=;
        b=kOkfvrHSTcLeACp2tG8Rop1Tp19Pc+LoZ+cf5Xs43In2BcicybBh6f1Lmd8bOa+uTi
         8/6GYwJPYzMqLOtgSBRXkCUsdN5eslZ66vKsr2DIohBVyEhJmfXfg77uRe8gGND0x8KF
         nCqSc9u1cjbTxk/NR7PPUxHPtpcjc0yx5mBxs7TXokFGmf2TH9/zsvJ1BbX5K7OSxFSk
         oDsAX4SM8BoMCPBXq9gFQr3bWlKKKQTQ2WiQclzKV7+SP7Vg418kp4iazsgbwbksaTbj
         dCQ9XnYcCXkOT14YW3HaplH1dRysJBHQa2JAR9gJFTqbGIiFGrqD81E4UoiY8ibpEE8u
         9AGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp9UE/u1AGmkUMa3l+yySuKgUGoxJHvcKQrpHf36l6Lijfx/PqDFzJdgloYAEk36tiMPe6SWnmx933zCANKzo=@vger.kernel.org, AJvYcCWX9mGclBZBObHgqtcQX84EI9pORA9xVaioT8f1LKTyfvHpqN3UVlbPdSIW5z9Wl08Re9pwIMQLGgK6/zEo@vger.kernel.org, AJvYcCWurAhTvAY/jr/tMfk91PgjMjPywC2RlzDJY74oYjS0/7suiQtbfn3wN6XfAPFbXfyiJ3GOgQOzJDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygfK8BsqGmz6Mo2e55ASsLGmYRO1TEtVuB2QEJTYxp6zcMMyQx
	WXtkrv5a2fB09KhRl4oomf5sDUg7gKXn29pOUaGumxBSnXRlznqq
X-Gm-Gg: ASbGncujC6yiMF1IwtpG2Yweur5wxnwchP1yckUxALyfuopHQln5oi8j3FMsQPrCY9P
	LSrXfyByBSoWZtwCLZX7cuKnMXdqfJci4e13oy9966ZIZAIZZUrMFqZl6kn20cMV61dxCoikKW5
	O8aLKqftilehKRTxJ9NYJobV6UQGhSOoAJKidMVpaf3NFHd+CTzOH6KLw9b4A+nLz5UPxVg9L3/
	Rq38VdW3yPeNscNfuObrGAs7vOEFl1RYFBRi0uN4vUjbD4M08+H4qadkrhq7YlAIJNXnCxqwX/R
	wOWqAgZ9GXVSppYvBtTBvYFKGw/1
X-Google-Smtp-Source: AGHT+IER34JxU6wqtw2fn+LJ3Rbu3h28herITddCa9E1l4aKB44zvDpbpqzN330rg7Ayn8xAChRs2A==
X-Received: by 2002:a17:907:7f0d:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-ab6f7443f58mr610676866b.8.1738366940751;
        Fri, 31 Jan 2025 15:42:20 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2f90asm361883266b.129.2025.01.31.15.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 15:42:20 -0800 (PST)
Message-ID: <defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com>
Date: Sat, 1 Feb 2025 00:42:19 +0100
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

After a quick test it seems that (most?) intrinsics are not needed
anymore on x86, but not sure if that's valid for all supported rust
versions and config options.

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

I don't think that we can split it into a different object
file or do some weird redirect in Rust itself.

> Since parse_u64_into seems to be a parsing function that is
> expected to be slow, it should be acceptable to call __do_div64()
> here, while we still prevent calling __aeabi_uldivmod() from
> kernel source code.

`parse_u64_into` seems to be used by Formatting for u128 
and i128 so it would be fine to disable these with a flag.
However `__aeabi_uldivmod` is used by some other parts of
core as well, like logarithm calculation for 64 and 128
bit integers, not sure what else uses is. I would guess 
its fine for these to be slow.

Can someone help me figure out how to get ld.lld to print
every usage instead of just the first three?

Not sure how easy it would be to disable these but it
would probably require some effort and would probably
be pretty hacky, so not sure if Rust would accept these.

> 
> Note that on earlier ARMv7 (Cortex-A8, A9), even a 32-bit
> division is implemented through an expensive software loop.
> Later cores (Cortex-A7, A15, A17) have native 32-bit division
> instructions but still no 64-bit ones.

I would assume that a software implementation is fine.

Cheers
Christian


