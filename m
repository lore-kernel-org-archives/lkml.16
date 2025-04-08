Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6341C5F23
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120555; cv=none; b=fM7n/z4SOanjxJUDoZZejg+0lG6+UYjVtgJo09WL1BWpK8t8FP//Cwyw7XWjDf8oEQkGNUrHOtZvinJjSzp/gy7zt9OH9UYaof8qSyeaMCRfWa8AVBQhClmpGoTGJVe1KRtiwu/UR2oToYwdLoNw2hE4pczIYwL340T2tflRD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120555; c=relaxed/simple;
	bh=A6oBXcNkDqEcBwguJfqIOppUobE7Rt7ruRENVRB7a+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/ruwzgSvDpeQYWGppyQd1W+MtZMNWySYbdFof+weJ6o/dU6L9hblkui93cZoEoD938/KzspQOJlpvGLwLDfilB2Xmz3Bguoc1PLQUHh/afltbHNnEslEPeZuRP4U5dRQAa9PfCXnWVIUTSAivGgZ77OCCDha4Nr72yILuDDB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3u3lANWR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3u3lANWR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso6114786f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744120551; x=1744725351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=3u3lANWRG9CDM5B+Btj8eJdU1g69ucJyGj+bXKZ7aKsq8kPiO5FfTdkI6qAbBP/rFr
         uFTXfYV9s7UR6hTnAXLgcGkb7srrNcZVDfH21oELCMlDyTNkPkXTsAB6xJCQ+X1PtGKM
         ttO7C9biJYLT1Hw2CTSf3tI3mTAER9hPA9gHppl/9nkw/nOW7o4UfKxYp6IAo6goK6t2
         ORZhaB7jKaZjmGpY9+Q1Vi63QnnIDsY36v8qpQLeIPoapZezF4xUD8zUdZ8opeFFS1yG
         WliT33pkmC0B+e3u6TIFGg7x/KMvXiR0XlEIrqHMiCTU9eM95YOr6ycMun8chXwZ/Ry/
         IkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120551; x=1744725351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=RKQOdUMVPCDlkYRtGZw+MMUUw/Js6bvkSKkZ/yFRjrIRk64HxFgfTe3Ug4lz4oGffx
         shT2YOe0md5uBSuSZtRCorjRZjxEuhxsj3AllJ2RXWmy458vFzBvzjdQQcuDU6wWXfph
         c3QettKxJk28k14Z+fw1AQJRoaZwofVY7QZEwHR1ozStBGXISUbW66f/7CI3nRZ+P7g9
         wA0gfkU5OFny6fq+Avn1SH+f9WGKqlKQbYbYgkWrGDdFB2xfiXlEQeBXt4BHBW5CH1Uf
         7tJvfNoo1ryGPW/Gw4Pyh9sh0URdjfuaZXj+VPabD7hNMADM1HK6UlE9n0e5+x76648P
         +buw==
X-Gm-Message-State: AOJu0Ywim3A/FyyjqTKsi1kjWw6VtjoVnHJ/ARJuh0KA39v/xHLbqLwP
	+46+fhX62R6R69dO5qKnkyB2efaGHuRlbU3RMW7Ay4sHLUVlJT+3ARYDrbDssfJCqWLX8WDaMfH
	8vtVSFC7hJhBwvncw6AFXT+p+2oyiWSIMS0Gm
X-Gm-Gg: ASbGnctPMJcoBypol55KhD0/NMKHWNgzBSqcjdHDWu7TGHLevck2BSElxFKq0tyEPo3
	FQLjGtrJ89qX/iqzI6Knr9Jq+psnn6LtnNYYX8pBfua4d6NkIVK1BJt77bBQbyX6hOc+j3YrOJn
	POJTjDqNNGqEgGWtAHq4zb4Fle7vJlswiAyd339yKltuy0roVnLWEs94es
X-Google-Smtp-Source: AGHT+IGe1he6VcB1HjanCrhxVAfQjIesMa6esygphkYmjhBdMP180Rn3O9/cuFUiPeqzOl258PSQo96dNzHqinw3Rqo=
X-Received: by 2002:a05:6000:1888:b0:39a:c80b:8288 with SMTP id
 ffacd0b85a97d-39d6fc83ac7mr10495756f8f.33.1744120551236; Tue, 08 Apr 2025
 06:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305110814.272792-1-fujita.tomonori@gmail.com> <20250305110814.272792-5-fujita.tomonori@gmail.com>
In-Reply-To: <20250305110814.272792-5-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Apr 2025 15:55:38 +0200
X-Gm-Features: ATxdqUHiYJtkNt0G-spjemExiwLroDOvAjC-UywxGL0GYlMeas4Df-5aHcFmNEQ
Message-ID: <CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] rust: Add warn_on macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 12:10=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
>
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
>
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
>
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. It's
> used for only architectures that use objtool.
>
> For now, Loongarch just uses a wrapper for WARN macro.
>
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Overall looks reasonable. A few nits below:

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        const _FILE: &[u8] =3D file!().as_bytes();
> +        // Plus one for null-terminator.
> +        static FILE: [u8; _FILE.len() + 1] =3D {
> +            let mut bytes =3D [0; _FILE.len() + 1];
> +            let mut i =3D 0;
> +            while i < _FILE.len() {
> +                bytes[i] =3D _FILE[i];
> +                i +=3D 1;
> +            }
> +            bytes
> +        };
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_reachable_asm.rs")));
> +            file =3D sym FILE,
> +            line =3D const line!(),
> +            flags =3D const FLAGS,
> +            size =3D const ::core::mem::size_of::<$crate::bindings::bug_=
entry>(),

The indentation here is odd. Shouldn't the arguments be indented one more?

> +            );
> +        }
> +    }
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
> +#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_reachable_asm.rs")));
> +            flags =3D const FLAGS,
> +            size =3D const ::core::mem::size_of::<$crate::bindings::bug_=
entry>(),

Same thing here.

> +            );
> +        }
> +    }
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::bindings::warn_slowpath_fmt(
> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::cor=
e::ffi::c_uchar,
> +                line!() as i32,
> +                $flags as u32,
> +                ::core::ptr::null() as *const ::core::ffi::c_uchar,

Why unsigned char? I think this should be ::kernel::ffi::c_char to
utilize the custom integer type definitions in kernel rather than the
faulty ones in core.

(Maybe $crate rather than kernel)

Alice
