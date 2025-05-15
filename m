Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918B2989B3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310515; cv=none; b=N1NLap5MltpXIJryrzZqQiTneJ3Cg5kehK9CZlGI56hexj0ffoUiAw2KUJti4XBZ8rcU94jHpijpz+9XA/lyIK5p+qQP+NAm7mHoHHVQ9AuXCaTio8XgqcWiMIWvGhd4GskyZa68hLEbHE8LtPun5sYfo9r99grdl9fItMNGHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310515; c=relaxed/simple;
	bh=Fdp7xVM18mo3Yqt6zkHyz5SyCalDrq40OIWz1NE2ywo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQwmLUlCaPWnFX//B9Ym4hH9em40VIEVhUKdCDAkgX/vnO5Ie1YfKtHMrQFlN/IS1b22rpYy+g9UZfcNVvoWvw+rNNkFotmmXMM8qXpi2qSUpxuU7skRMUlPfxmN8p1E5aCZUTG5yfqhQRaqWjhxZcL/+c5OOHgCul8sx4VQ/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Er/WQ+yK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Er/WQ+yK"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-326b5dce9ffso4885721fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747310511; x=1747915311; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnTjnlgUmpVWJ6YWjJU//zRxWhIuxh7JMTjWe20f0OY=;
        b=Er/WQ+yKKksi3HJNmUYxf/x8ta4dJK1krUMQ4YpEuFjPoDNtMmUMhvpNTESQK0QNqy
         V6f9xGoO2k7Ht9VutnI9g8YTCFT7WuKaMngCVpE9dJxU1x69iFKoTqZQRo20QdhW3dZs
         ShJij1T6RZagYG5cE4fR9m2lonGIniCBthY4EwocC48NRgb3PO2ptCNzvcgXCdXYodGt
         Inaq4MzrLKQKgS1txA9FrRUGBvTt8moUBxkWaHZEXaaYBtWotVJkGoaScjPRlkAoNgRc
         0Qk0YuFpBHRmG1E2Q4W+PK9wl60MsjYwMcvewoMXApv8fwHCWk5xrQdTJzmJnCK15C/4
         wcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310511; x=1747915311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnTjnlgUmpVWJ6YWjJU//zRxWhIuxh7JMTjWe20f0OY=;
        b=Gq9M9Id9o9N5E5e1PVprDKIsjn+/a2733wKmYekq+EklW/j8lJiDdLsFkP+ToU4myE
         lCJ3KeskvfAsLVznp8YQndlNRDu8u937ASw7nQgjf5/JMHoNEd78bUPoSqFbgcKhbO7A
         MTp+8PB9u9HVhheIqWqhrnVP+smEa7sDkGP7wBrjZhv+klEosRdqcUvld9Powi6cuI92
         +Dasj/HppPrmehvD1z82+ZA34sWwtJjZyf/k+eca8aXZCqh2Ja5aqU4pJCz2KSlkYYeV
         l0Z6YxfT4IZz49uiVc8Gy3xhwVPo+P8HMN9KxTWo03NYYkaYKAH/cngTGMaa1ega3OO9
         Tcug==
X-Forwarded-Encrypted: i=1; AJvYcCVDB9iFXHKfehGQII0ePaAaLIgNsSganbfaMZ9kG0X5bN6YwpwVwb1MS+kba2lIi6QYnAd6u75rpeZveos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgnXsxB9qdyl4iXSGbQ8ziYuD5V2x1RF8E7H++pWX5oQtdeUe
	A1MTV+0FhkGVHDWldc6lFQSJEWFtpx83LpXpjHSycUQ9vu5vgy5hfifsUlIJJZwDTge0TGRvEmO
	jKmu1rJtgOwpX785GHhroMKiEbzL34da/fTzG
X-Gm-Gg: ASbGnctBx6rbqM4psJZE1EKberSqKdWZkNIs85H0GUOePpSTAnFaH7Z2eZaN3JVURi5
	Sd92qbxgaDxCceDzcLkQJnn5ln2tMkgCvielsYRu1ieoKZ1t0hfuQQpwI4HTksQvdJzT2+r5oNq
	At63NA93ORABWZr4xM5c3C+e0zzYN6z+1FhBZ8wni/arR2hMdwOGpg2FLqhz7WlgGCIg==
X-Google-Smtp-Source: AGHT+IEH96IKGmX2cAO3uTh1/QBEiqEJWRHviVXK7nh1F5DrmoVawhFe8JJNtch0htaUl2OJIB1mEZGGUPXNBHxisBM=
X-Received: by 2002:a2e:a542:0:b0:326:c07e:b0a4 with SMTP id
 38308e7fff4ca-327ed0de53bmr28047271fa.11.1747310510182; Thu, 15 May 2025
 05:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
In-Reply-To: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 15 May 2025 14:01:39 +0200
X-Gm-Features: AX0GCFuQowmy9iaNX31ALvCLpL5T4nDokRyS7Qih7uVxXxqrT3ubbzv9Q8-xB8w
Message-ID: <CACT4Y+Yzmd7BtrpqUPrbXAAGzMnO0YKZnhVxLgyyXEftscEUnQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 14:16, Alice Ryhl <aliceryhl@google.com> wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection. The coverage level is set to 3,
> as that is the level needed by trace-pc.
>
> We do not instrument `core` since when we fuzz the kernel, we are
> looking for bugs in the kernel, not the Rust stdlib.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Reviewed-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> I did not pick up the Tested-by due to the changes. I verified that it
> looks right under objdump, but I don't have a syzkaller setup I can try
> it with.
> ---
> Changes in v2:
> - Ignore `core` in KCOV.
> - Link to v1: https://lore.kernel.org/r/20250430-rust-kcov-v1-1-b9ae94148175@google.com
> ---
>  rust/Makefile         | 1 +
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  3 files changed, 10 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 3aca903a7d08cfbf4d4e0f172dab66e9115001e3..80c84749d734842774a3ac2aabbc944a68d02484 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -492,6 +492,7 @@ $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
>  ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
>  $(obj)/core.o: scripts/target.json
>  endif
> +KCOV_INSTRUMENT_core.o := n
>
>  $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
>  $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8efa106e8dffa640 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    += -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   += -fsanitize-coverage=trace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         += -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
>
> +kcov-rflags-y                                  += -Cpasses=sancov-module
> +kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-level=3
> +kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-trace-pc
> +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  += -Cllvm-args=-sanitizer-coverage-trace-compares
> +
>  export CFLAGS_KCOV := $(kcov-flags-y)
> +export RUSTFLAGS_KCOV := $(kcov-rflags-y)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e129effb8846d5b8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
>  _c_flags += $(if $(patsubst n%,, \
>         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
>         $(CFLAGS_KCOV))
> +_rust_flags += $(if $(patsubst n%,, \
> +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> +       $(RUSTFLAGS_KCOV))
>  endif
>
>  #
>
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250430-rust-kcov-6c74fd0f1f06
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
