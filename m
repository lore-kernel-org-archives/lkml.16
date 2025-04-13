Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B81F2BA1;
	Sun, 13 Apr 2025 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578647; cv=none; b=XN6hgl7OBBLKaxfeKdJTdNjq1soHef5WEe49ssMKz2/5mRcs6gHML52tNWyfZP+0YtEd2fm0F9TtQDa8TDoMRO4S/9kf0ZJZlSaNDFU7ZBwa+xb3uxmbi7sIVXjXtkxkwf0cy7ASxqOzIkRUOHI/vKv7eyMRYEY9YY0oF1DD/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578647; c=relaxed/simple;
	bh=jDSWSnjx3ALxAD3xBZHKCgbB2WWyM9Jk7NMmASTtENo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2pzYXLgxc8ihXSlFmabv28N6+h92Ie+BQ2MTV9YBxBJ+3z+8EqXoOQIWi/XxWBv0Bxg1VG6SAUnMbBRXctvj0HtKiGwuyHudSaEuA8EhqTM8owl/cHvSAkVVk440e2EmKfzN6AdTsnuCJ2LPWaOKDb8QL4BlzESCl0y6S+EebQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icK/XaF2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icK/XaF2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac289147833so738938466b.2;
        Sun, 13 Apr 2025 14:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744578643; x=1745183443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=icK/XaF2L6DbJ7Bb3zwal2+m5lGV8LhhGDy4rmSLGeu+5JF3va1/wxJ60DyMLDsp2W
         LXgm29I6UCvkf4QO6WhdqAMftHMWn4wSzy6TZpKIhSNWeox/Bdx+DA9GNwtvowIhlhuf
         6WoVoopgqqNueya+3NuLV/z+ctELTUPAHa8Owf/3DMHtVwVADP6pNqh+lSzorONP1d9F
         9cyaK3C4ZuF9k8m2P7P87Y2dEGWTjDp8eLykmakpgRW5/UBrDALenvJ/nRpWbq5YxsSg
         bmmQ5VIOocPRJfT8NcvQcMmmgX8bEBEdx6YGvQt41fSsnAavBf/cms4LtbSVu2jYXVT9
         OosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744578643; x=1745183443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=FP2cVm9ptaQRQ7MVCIL9dtN97S9iTB6Bwn2kMv8qN0NU45Mwb0gQtPRiyZY/4YIjG2
         PSTYeSj5lpmdugZ+Sy9A6qxpJBnAiPuQmNuwdfi3a8y2kwVyCcBDGw7GaiF/ZGOFSTEa
         atZS29JXM5SExl9j+Ohn0am+d1CZffP6KHIrNx/dxKFrdqM1SZQGWXtyICcCDlMMC9kG
         Xcr/vCHijwUMWzV6Z9vQV3oHyuE8x+E4f1rVyfvhlrK3qpVdh2q1jAey0tCHRXq0Oh2r
         W7Ag+WZ3tS9xV+O3a6sP/PAxVKNYwV4AfZR2Ecn8DuY9E7+74JP8jnygMMexjXEfOxtP
         aMNA==
X-Forwarded-Encrypted: i=1; AJvYcCU+FqPSQ+CwNNGHhK2h5vcw5vOzmc36XABAyyl70i8kR4KX7c8UzhWtQqARmoSdfmXTpB8G9TOh1jw=@vger.kernel.org, AJvYcCUISiZdy24yXv+RE1u3g896YgIBG2p4I+jwwwqyRNY1ULNJqt3CZXK0y6CZ6B/sH7sH8kTuOUpyTt28A+a2@vger.kernel.org, AJvYcCWuEbc03JC78z2tR0xLvBG/TWjUOlu/+5eTKMZiXCUipS8KZbt/vIbJ5UMyyCR0JeNQMeMOdFy/mVNqd3YgDdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ApIDbTigif2nXN7jjGJeRiod8A5le03aajfVax6hoHnGQ/8T
	+s7hSam8NhQy9By7pGdRR7NE/aBJj079EO8XzkWTtL0e+/f3VQEaV2jA+dI/
X-Gm-Gg: ASbGncszSOmXVffm1OwnQ9LUmhL1k/B8OaSbsMne80SuU4+f5SmHWp72TuIY43mU5QV
	wq+URQxZlu9+bh0MbfydZ07gtdtxdjgVYqGmBnJ0v3pSMzFX7bhf+9RPhXh9V2L5O1VND+gkix0
	KOgIvWjH+i+mSoCSiR0YIAiSu7oKXrJeVk3pEnt8qG+KjZjsFdRoR1LfO/13umioBN4ByIqvv2M
	pWpI1zLOqc6yVWZhmJLPUbzcTNNf+mYg/uXHQJCEafBLRk+DnJW1xkqTWs0/eyFggM42K4pt0ez
	6rlkktKTmCTrmBJfyLYIv+3jiOLXnGdEUp2NBNCteLZST+zGbKaTfQ==
X-Google-Smtp-Source: AGHT+IHERt8l6p5mjOOazl62Cb2bwcwzax2tmer6+wi2AUBjvbcbumYa40ODMo+swIjwf+dyHbUsAg==
X-Received: by 2002:a17:906:f5a9:b0:aca:a1d7:a830 with SMTP id a640c23a62f3a-acad349a005mr966701466b.13.1744578643064;
        Sun, 13 Apr 2025 14:10:43 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb41besm789238466b.118.2025.04.13.14.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 14:10:42 -0700 (PDT)
Message-ID: <b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com>
Date: Sun, 13 Apr 2025 23:10:41 +0200
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
