Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BAF186A;
	Sat,  1 Feb 2025 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738368218; cv=none; b=UipF9fezqnIE8x1UfTogLEkhPHwOodx389lvg0tTejJsx6I+iBVB7vI8rU2VhZg4bkjP9cnmKD1CdVS19yh65zKqf9Y40tesor2cAqBuQ92G7GUiN1RdgD+luhCvZRTwJQW9IL6ayhvRi8IkQgsHbGDBDWjXe3H74pXNXLYNiOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738368218; c=relaxed/simple;
	bh=uEtr2pGJ75x8/pn66h6Jb/4R0kwWYSKjsMngfpMVJx0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rtD2DH481K2JlVzqbfh3lyQRNEunnO2iua7xrKrBATDwC2RPVQmkPhII+C/yyDYq9g3qXXKo/t3xGm/MKH5G0p0mz2aUiDRiL1WeKLI7ttHQuubkzPseaWv/Zsdu2UhZTFgcUV65qI9aVwxgBntSq98uVEMW11duke4i+qgOgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPI6dw1M; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPI6dw1M"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso1470662f8f.0;
        Fri, 31 Jan 2025 16:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738368214; x=1738973014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dIW5mxw1d5fGh/+9frfvuDB0rZsAyYbrsw3Hm15dSnk=;
        b=LPI6dw1McKSUbhGnCDDn3jZheAa+qgY2EB/Woqp8a6ZDV91Xq3auaNF96PXbxzECqb
         BKuKZ/M+VC57kvT+cGWpCvZariWmuONw3wHpq/GOo8isEAlNEYaOAy/hZuBmyl8wLv5A
         AvwFWfjv/RP9eZeBg91m2z8zAElzHp7WLM1OQ4ex3+akCdSCzqZcubRXz6LQLaaSErjf
         2od74jbFZi2+Fbfd3zEQAUbhGkXwwTV0IUV/yjj/WnEIRPMUCohY6jYnDbtWxrzY19CT
         P9f5Kh/6t8Mgo/xuRL5l21Sd8r+7K/Qz9UJvgnFbq9aU/YwT/uFS7rIlWi5CAq3YysOs
         afEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738368214; x=1738973014;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIW5mxw1d5fGh/+9frfvuDB0rZsAyYbrsw3Hm15dSnk=;
        b=NVBsDE2YmdCOmbHXZHeG/7JIA7A0EgGGjmHxHqij+19OI5nh8EHbNYOmYHw8LnHJfW
         K4GNdemOlGv4pX4AmHt9/qHAkgtH7AZRZ5EhY3QHTxjTFjmo1FqTwT3v9BbUDYos5g9m
         pqQuUt0fGDa4Zr5qJEVP7eagVIGodpilopBZjWjNs15hLaVVpaFu71BMnRXQybo9rYrT
         7Cok4I8dvndvFP3alW+CUe6qt0kJ48ClhddUuEA9odLlv4/JmuO5DypUwDV64hsZci1l
         lNm/nXcXUyZEQB215u2cupXEc/YQ41Ph3GnJNb5tR5IpmjwmVSDjvZJOnaZmTGHiKo8j
         YpXw==
X-Forwarded-Encrypted: i=1; AJvYcCWPbhTwlcNZSausqaFlQ1uMaXwFFdB/LkGd+jWYsnNlZOpX5y5ZW2TMmbvMPhFnwB+tjwIN7eOCYnU=@vger.kernel.org, AJvYcCX/ROhW4STW0LxJowBF4/bC5nFJSSs27NofEkW5tbz4v0eMNocu8xVv/7MyDnTxwLNoX5co7/8exay9BD2K@vger.kernel.org, AJvYcCXFgWJY+xZdUyrponcWm6iGm4dYuMQS/H9sBAjYk1rD+W9of6tsx878YZ0Hq7PzG79ivf5XwmsvHRp2dc86tlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXadWSJaNIhlWGZY7Zd8P/jaW3HiL2s7jVHOQEV/fNJUq74em
	9ZuCOhaobNKRo/nwvtSE6cKDWK3+6xvhA46fgAYM1J3Ml7DvfXmi
X-Gm-Gg: ASbGncvWnERznVXruD6gfseXe5l7lNUe9ExefuI0ZUsg8tL2/yOZTqmXjCDzGEg8Kr4
	P70zqhVxptqLeUt5ZrqWxDYdxUr7UrG2y8ZcALC97DLe1tA3pbBDTYlk/+JE/Ogn8KzjuYx6Zkv
	sCU7HL1bgpFEijhcu9buK+DJ4hByeB7nXRjLPoLt1F/NxbWOVI+yfYt003hboGHkEMo34qwXQY9
	DnP2kvDre017cIXavFmMIu+YUn74+OJ8pG2CK88VN3UcMksWoXHKUAEbDUn1SNXw3MTaTljjMLo
	adMdI8q6UW/Y4wtuM2wRUBFOndAP
X-Google-Smtp-Source: AGHT+IEAmQ/3lwR59zHcY7DNEmyqeOVzzb9TWIVcnVUkllN5W5Fsd05H2UVJoIRw4vEWdM/qGbZ3jA==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id ffacd0b85a97d-38c520bdb45mr8608136f8f.46.1738368214370;
        Fri, 31 Jan 2025 16:03:34 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c125f77sm5942943f8f.56.2025.01.31.16.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 16:03:33 -0800 (PST)
Message-ID: <621a5bd9-ec51-46eb-8d8e-c463085f92e2@gmail.com>
Date: Sat, 1 Feb 2025 01:03:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
From: Christian Schrefl <chrisi.schrefl@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
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
Content-Language: en-US, de-DE
In-Reply-To: <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.01.25 7:58 PM, Christian Schrefl wrote:
> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>> To fix this Rust would have to provide a way to build the core
>>> library without float support. I don't know if there is a plan
>>> already to allow this.
>>
>> Floating point is banned within the kernel, except for in very narrow
>> conditions, because the floating point registers are lazy saved on
>> context switch. If the kernel uses the floating point registers, you
>> can break user space in bad ways.
>>
>> I expect this has been discussed, since it is well known kernel
>> restriction. Maybe go see what happened to that discussion within RfL?
> 
> After checking again, it seems the float intrinsics are actually not
> needed anymore at least for my config. Only `__aeabi_uldivmod` is still
> required for `parse_u64_into` since [0] allows disabling float formatting.

Seems like Rust 1.78 still needs at least __aeabi_fcmpeq __aeabi_fcmpun
__aeabi_dcmpun and __aeabi_uldivmod.

> 
> Link error without the `__aeabi_uldivmod` symbol defined:
> 
> ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced 34 more times
>>>> did you mean: __aeabi_uidivmod
>>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
> 
> Not sure if we should just implement `__aeabi_uldivmod`, keep the 
> panicking intrinsic for it or somehow fix it in upstream Rust?
> 
> Miguel do you know how this is best handled?
> 
> Link: https://github.com/rust-lang/rust/pull/86048 [0]
> 
> Cheers
> Christian

