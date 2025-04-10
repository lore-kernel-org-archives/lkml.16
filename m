Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646C20127A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270794; cv=none; b=MIKb5BXNQAFI+E0xi0R939ljBzUbjicKY97JAHMtvId0TG6PmsvAruxrmKJY0SXYalUT9GmHPMBYtFKAlrhcY1ZFEVKBvkZavKQz8jMj0jkpz2e+y1XR7K008vymz/qru9s5O/IE2TZ1vQsg5ldlx6F0n3UvJ1j4fbToaEExuR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270794; c=relaxed/simple;
	bh=90MdqMTv2wKUDJa9ptKTpbNjKDGDht+G12XHObwq5/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mpSaCA+FZtmBKZFSr4hssyyeqJ49xRJsGE+Fwhg4eplCyDiPbqiSwk5yC5uUkUY1WGiNXOXIuPxRZZTx1VaXDqKHoDgaomD/Ky1I3eragVXx/mfVXEO0GxIqRAnfKAd8DmthhbH5vEAxRYzCmbqIohXUz2uKp9nsWGdZqQhVbgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b6NtETX6; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b6NtETX6"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so3007455e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744270791; x=1744875591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=;
        b=b6NtETX6svTaefaZTVjcAlL++V3dt5ZSH0YHx+G7icmjyXBm+9q0VinmVest4Melmh
         sql7cV6eL2pAk8Ls7sfXkJr4gwhw7NaKB6vGn77YO9OsXfJXprZ60JMUemuvnyCiC8PD
         wABTHUZXjbDWPTid3lHZrPrgnURaHz5A0875LYc5XNbDD0ZAxgCXXHZTdazL+epgmUdf
         hHCyakL4QE6oPH0qNEUajzvpiMJ8n16rrSYfZ3jv4QBtb/UZ8fV4iX3LzLEUFsuLMK/w
         awb5YodkuFbpF46KpAj5q8oe0wSQ+yH+pEFfKrTeBgFHyyWK6EEvpysztJpAxCpTE8v5
         uW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270791; x=1744875591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=;
        b=TMS8YWi4zBkFnMS6NgQYmINqbft1W/L87vtvTs/OWUFam/49p4XIiu652G3keZvtAU
         lr5HGTlA4G/Oi08xUHVqv27RL//34kpO1IHZRLh6X0pdG2o8zCXmp5IGlCKnGiQ9+G55
         BHYInBD7EKcrOTpkLO5jOGXOClEhDBmiNVcxHtkV9pCWhXGnTY3FRunhuerUxNLIzf6t
         hxtOmjCsD7nK7JkaJ1BQaJ4NfetWVf43SiAH/ymb5rgJIH6Oq/Gg83OVCG0ThyrgHfBR
         rGZCFiQ+pdkgEgK+ATkgnNaZSO7m02wcOuTBB9II5Uk7KogFxRKNPW7ip8ZsaM2+TD+U
         MR3g==
X-Gm-Message-State: AOJu0YxXziCWSOPYievEdVH5FugCUqyf1D7YZEc6U4TcjPv62n0tmXJL
	YSFg72J1pnQTnKeBUiDGieOsiZR0ZQL12vUQZTnmfjBrAymPOGrC0Pzr5SGzmI+bMZo1pfa17Qr
	OlPcncbfm6pPkyA==
X-Google-Smtp-Source: AGHT+IHlkpBGJEWBW3cHYQJGmG67relPMhD9NvzbuRhqbRBizGar1eZ7vJOB4Vl1S32BZGUFqnryZcgjcRbEP1Q=
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0b:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43f2d97d4c7mr15493055e9.29.1744270790968;
 Thu, 10 Apr 2025 00:39:50 -0700 (PDT)
Date: Thu, 10 Apr 2025 07:39:48 +0000
In-Reply-To: <20250409065802.136971-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409065802.136971-1-fujita.tomonori@gmail.com> <20250409065802.136971-5-fujita.tomonori@gmail.com>
Message-ID: <Z_d1xAAptnfzqg1l@google.com>
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: Alice Ryhl <aliceryhl@google.com>
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
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
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
> For now, Loongarch and arm32 just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                                 |   8 ++
>  rust/helpers/bug.c                            |   5 +
>  rust/kernel/.gitignore                        |   2 +
>  rust/kernel/bug.rs                            | 114 ++++++++++++++++++
>  rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
>  rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
>  rust/kernel/lib.rs                            |   1 +
>  7 files changed, 144 insertions(+)
>  create mode 100644 rust/kernel/bug.rs
>  create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
>  create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index fa0eea8a9eca..25f498607d1b 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
>  
>  always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
> +ifndef CONFIG_UML
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
> +endif
>  
>  # Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
> @@ -536,5 +539,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
>  ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
> +ifndef CONFIG_UML
> +ifdef CONFIG_BUG
> +$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
> +endif
> +endif
>  
>  endif # CONFIG_RUST
> diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
> index e2d13babc737..a62c96f507d1 100644
> --- a/rust/helpers/bug.c
> +++ b/rust/helpers/bug.c
> @@ -6,3 +6,8 @@ __noreturn void rust_helper_BUG(void)
>  {
>  	BUG();
>  }
> +
> +bool rust_helper_WARN_ON(bool cond)
> +{
> +	return WARN_ON(cond);
> +}
> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f636ad95aaf3 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> new file mode 100644
> index 000000000000..761f0c49ae04
> --- /dev/null
> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
> +
> +//! Support for BUG and WARN functionality.
> +//!
> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        const _FILE: &[u8] = file!().as_bytes();
> +        // Plus one for null-terminator.
> +        static FILE: [u8; _FILE.len() + 1] = {
> +            let mut bytes = [0; _FILE.len() + 1];
> +            let mut i = 0;
> +            while i < _FILE.len() {
> +                bytes[i] = _FILE[i];
> +                i += 1;
> +            }
> +            bytes
> +        };
> +        // SAFETY: Just an FFI call.

Safety comments could be improved. This being an FFI call is not the
reason why it's okay. Furthermore, it's not an FFI call.

Otherwise, this series LGTM.

Alice
