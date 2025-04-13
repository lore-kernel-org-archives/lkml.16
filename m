Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD27522F;
	Sun, 13 Apr 2025 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744579909; cv=none; b=gUlnxMVa/GXXZ0SM1d96hxSF0amG2ZSjjteGqxLGWGKU9ySOn/diXGVm4cLd6Vq5ZBvddoG91TPob7wC6emJeyLXRZ4IYk/5AO2mEvvrALrA3HttttC/x+vffhXpPKAL4AVv0sjbCMHzICexFiShdJRrFWdDnxgFqz8jc9/4NM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744579909; c=relaxed/simple;
	bh=RiM1cw3yXv8YN1O1TjkbZc1n9el2jThWyL2IsUF79Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjiDqxdTF5aA652Z73UxUd36JxZr2nNBv6mtNUJg1RpjZyJOOZUmXGBHupw1Urtky932Ti+xuNSh7/tXljLaSI1ueZQ2I/ZM6C4jfjiaM0Y/LsKS0BGEobph0lJzaiefJtzQQ/TujwYHD/UkfzspdS8mkLs1rITPW0unRaXEnoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFpKzFKw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFpKzFKw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so6727240a12.2;
        Sun, 13 Apr 2025 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744579906; x=1745184706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=dFpKzFKwALf2OYvJQhJ8L21xElShIS2QtQ8NAxLIuEnO3P3u+ePBE+SU3oZw4EREst
         5RHSCupITzSfT9LezzDocBWX/LMCM31ack4UqbOgp4GjWMBfWAvFmYTgj2hq/q+HqGxp
         l5XwAzJsrLc3a35ITfPhf3W6YKAadUebstGME7FQ9uZDkQVDIyMSZ5ptKqpN0bBGI2j6
         ytlxxIwrRoa4ksFwNwqSljuUF/FycDtoyMZRzRiZ+Scc5eJd++zIIo6WCqApsgen11qC
         7wmIhI3jYTvJxfdH8twM6lyQBHuwbhgd4+hK4H1qehWKFctDAeleCODwdnxfnt2uAH6q
         7yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744579906; x=1745184706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=iGv2bucZzHBC36sWQW0rk2FVx0bvueABqKEHq+hHWjvmQM+xZiLZ+SO/iUVw0X/XHS
         ofT1Oh67bvk1Px1BzCx0HIVSNfSB2hwif0QCMAjxlNH4fn/N2V/WUhcdX52xr+7UVxTO
         t9vdTAsjI50Sg7EVZpa6DNSPSuxUa84EWiQo5f4Zf4NwuX3DEhRCn6jdE2M2pXNJso9j
         KuR7pvr6HW0VvdOcwnM//O+Y2JKhmHo+n7NkGWXJCLmjc++TEq+WxSie6d6EOj7uvbcq
         k1XfWNC0TKsn9BmWbwB1H7lIBy7Tb3CglKXyF93xCm2VdeE27jZryONlz5EVcn+FZeRj
         43rA==
X-Forwarded-Encrypted: i=1; AJvYcCV/8MKpWv+qY5kjgUljM8cRFiUV1v9bgkX+qK/kbkAJ0pev1OLbp0TXVjzFtrdWiGN4suKqhk2p9lE=@vger.kernel.org, AJvYcCVd1ig8SGF69lDDDf8BjPA6L5/H8zud/hR9deLmAppSSElmbY3tnPXREXL4hGfSCSkwHHnmyLdeM393zhxW90Q=@vger.kernel.org, AJvYcCWPo6uJtsuV+34jIJK0my4P1Ko4RXZR9fJFduBu6ORncXfn15mzqyJ4DNbsaQ5p69Uc2vauQYWekrOaqKuP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wRYyc/lHayhYA0N8qubGj9OXKwTAbgBqg0Sln+AAp56yDTVN
	goP/E3lhZj9XbIDxoJz9dXe+Hu3pyY1aYhhtzqlvJSMGJ93p3F9e
X-Gm-Gg: ASbGnctuLrOd4YiH3bkT8znDxMuBHC3aKsyNHZCLmmwIB2BnIicTbHOIOYHQEJwvxlE
	c7JUfj0iN0s1LtdnGJ1NaMKg5I+T6rTtL8AQoyOv59aLVnFE0TUoVmferi91mQb+rEGEKckifMa
	f2SmtG5+3izcwZjKgzCvX/1jUMeYowHvSdLvvJ0gmJasYr/Fb/uGWkXYSWnl7RWqqxk4dQle49e
	2YOsJtrgfC7mvz2pdjRLakOHAOs5NghgOIQwen3oYNQFrmChnM+GR7OWioplPoWCR/NE3xczrNB
	W0hlb5g74aF9fiaZ+gb9JZvF2X0fQKxRwNlIx/DbhwyEM2584VhJxA==
X-Google-Smtp-Source: AGHT+IHlo8hLp7rlYj2GXP7jYUaAGh5el9EWXgy8ypyB9DxHl3+B048jo8az5jI2O4Hbkz7D8aF8CA==
X-Received: by 2002:a17:907:7da0:b0:ac1:dd6f:f26c with SMTP id a640c23a62f3a-acad36a601amr814934366b.46.1744579905498;
        Sun, 13 Apr 2025 14:31:45 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1c4sm801345666b.148.2025.04.13.14.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 14:31:45 -0700 (PDT)
Message-ID: <ac855a23-3f16-4793-8bd6-3da7814ea64f@gmail.com>
Date: Sun, 13 Apr 2025 23:31:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.25 8:24 AM, Linus Walleij wrote:
> Hi Christian,
>
> thanks for your patch!
>
> Sorry for being late to the show. I missed this very nice patch
> that was actually on my personal TODO but I have to much
> to do and also I'm not smart with Rust, but I'm a big supporter.
>
> On Thu, Jan 23, 2025 at 11:40 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>
>> +       select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
>
> Nothing in the patch series really explains this restriction, so it
> should be in the commit message. Arnd mentions some atomics
> etc, but we really need to know exactly why this is in the patch.
>
> I'm a bit surprised by this since the rustc LLVM backend nowadays
> support all old ARM ISAs. I would have expected:
>
> select HAVE_RUST if AEABI
>
> Ideally this should work on any ARM core, but it's fair to require
> EABI.
>
> The big reason: I think we want to be able to use Rust in kernel
> core components sooner than ARMv5 goes away from the kernel.
>
> If testing is the only issue, I can provide testing on ARMv4, v5,
> ARMv5 BE etc, just tell me how to test. (But I guess it's more than
> that...)

I've done a quick test on armv5 with the `armv5te-none-eabi` rust 
target and it needs some atomics (`AtomicU64` type and for 
`AtomicBool` the `compare_exchange` and `compare_exchange` 
functions) to build:

```
  RUSTC L rust/kernel.o
error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
  --> rust/kernel/block/mq/operations.rs:15:33
   |
15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
   |                                 ^^^^^^^^^^^^^^---------
   |                                 |             |
   |                                 |             help: a similar name exists in the module: `AtomicU8`
   |                                 no `AtomicU64` in `sync::atomic`

error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
  --> rust/kernel/block/mq/request.rs:16:20
   |
16 |     sync::atomic::{AtomicU64, Ordering},
   |                    ^^^^^^^^^
   |                    |
   |                    no `AtomicU64` in `sync::atomic`
   |                    help: a similar name exists in the module: `AtomicU8`

error[E0599]: no method named `compare_exchange` found for struct `AtomicBool` in the current scope
   --> rust/kernel/list/arc.rs:518:14
    |
517 | /         self.inner
518 | |             .compare_exchange(false, true, Ordering::Acquire, Ordering::Relaxed)
    | |             -^^^^^^^^^^^^^^^^ method not found in `AtomicBool`
    | |_____________|
    |

error[E0599]: no method named `swap` found for struct `AtomicBool` in the current scope
   --> rust/kernel/revocable.rs:130:30
    |
130 |         if self.is_available.swap(false, Ordering::Relaxed) {
    |                              ^^^^ method not found in `AtomicBool`

error: aborting due to 4 previous errors

Some errors have detailed explanations: E0432, E0599.
For more information about an error, try `rustc --explain E0432`.
```

When gating all the modules that need these linking fails because
of missing __eabi__* intrinsics:

```
ld.lld: error: undefined symbol: __aeabi_memcpy
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::str::RawFormatter as core::fmt::Write>::write_char) in archive vmlinux.a
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::str::Formatter as core::fmt::Write>::write_char) in archive vmlinux.a
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::page::Page>::read_raw) in archive vmlinux.a
>>> referenced 29 more times

ld.lld: error: undefined symbol: __aeabi_memclr8
>>> referenced by bindings.4cab29b7397d35cb-cgu.0
>>>               rust/bindings.o:(<bindings::bindings_raw::module as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::module as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::thread_info as core::default::Default>::default) in archive vmlinux.a
>>> referenced 86 more times

ld.lld: error: undefined symbol: __aeabi_memclr4
>>> referenced by bindings.4cab29b7397d35cb-cgu.0
>>>               rust/bindings.o:(<bindings::bindings_raw::fp_hard_struct as core::default::Default>::default) in archive vmlinux.a
>>> referenced by bindings.4cab29b7397d35cb-cgu.0
>>>               rust/bindings.o:(<bindings::bindings_raw::iwmmxt_struct as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::fp_soft_struct as core::default::Default>::default) in archive vmlinux.a
>>> referenced 95 more times

ld.lld: error: undefined symbol: __aeabi_memset
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(<core::num::fmt::Part>::write) in archive vmlinux.a
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(core::fmt::num::fmt_u128) in archive vmlinux.a

ld.lld: error: undefined symbol: __aeabi_memcpy4
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::of::DeviceId>::new) in archive vmlinux.a
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(<core::char::ToLowercase as core::fmt::Display>::fmt) in archive vmlinux.a

ld.lld: error: undefined symbol: __aeabi_memclr
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::page::Page>::fill_zero_raw) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::__kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1 as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::sockaddr__bindgen_ty_1 as core::default::Default>::default) in archive vmlinux.a
>>> referenced 16 more times

ld.lld: error: undefined symbol: __aeabi_memset4
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(core::fmt::num::fmt_u128) in archive vmlinux.a
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
make[1]: *** [/home/chrisi/Documents/code/rust-arm32/Makefile:1242: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2
```

With define_panicking_intrinsics! for these an empty sample works
(not yet tested as module), but even printing a non formatted
string (with `pr_info!("Hi rust\n");`) fails because rust tries
to use __adddf3:

``
Hardware name: ARM-Versatile (Device Tree Support)
PC is at __rust__adddf3+0x0/0x4
LR is at _RNvXsg_NtCs3KHxpmQFgFb_6kernel3strNtB5_12RawFormatterNtNtCs8DPF7ip8WBQ_4core3fmt5Write9write_str+0x34/0x40
pc : [<c028950c>]    lr : [<c028b5ec>]    psr: 20000193
sp : c8811a78  ip : c8811ae8  fp : c058e44e
r10: 00000000  r9 : c058e450  r8 : c07ac118
r7 : 00000000  r6 : 00000000  r5 : c07ac120  r4 : c8811adc
r3 : c07ac120  r2 : 00000008  r1 : c0667f60  r0 : c07ac118
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
```

I'm not sure how to proceed from here and I most likely won't
find time to continue working on this anytime soon.

My very hacky changes are available on Github at:
https://github.com/onestacked/linux/commit/edddb388267ab1afe5255bea4d84f96cbdb37978

Cheers,
Christian

