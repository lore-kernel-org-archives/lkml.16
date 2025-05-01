Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF27522652E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746101798; cv=none; b=FngLDGaiox9gBHXrgUaf/qyAsnycCZTROg8d8Jgcb2e52LTPGtPyDcqWGUTtqLEslFq7gi0A+2H2lChGfqUOykLUHC3Ze8YkNEwEZUTyjx9Hh7taDye6XrwI7hVtdHdRyB2LQYlt2vkLI5ej4E8OYYSbA2fjsVhCqpJiK8FKPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746101798; c=relaxed/simple;
	bh=IyknQ/1KxQ4jy7cl/9HHS98hqktVwXtxDa2ScsUKzik=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SAoIF6VTJMsRjOjf973BfUZmG6urfbwviaErOt25mEAwLxEKW8l5X01k1+ym9/jBzUFXyrTKWDuxK2CJxTPzpYNmm+eOR3emV2/Z7KM1+y7k0czAdX6XB5Sy7niqFPdzr0pdo/3hp0f6kKjyuxg2aVl28D+JGrEsdGzwwK24Qxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SBOWmZyy; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SBOWmZyy"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5f4d2e9cdbdso650004a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746101795; x=1746706595; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/0A3i0y7AEXGrVw5WCxmIfPgVwLI2iY2Vm/Il51dpo4=;
        b=SBOWmZyyaOrGXV/KZAEgc+Pl9sELwGS56PevUJfcPjfrw+VD8jcdu4bphQPoGipedh
         bmDmR74jnByecSA1wg1sR6ER74cFqlu+MrhSWaA3xISnWTdnQ84iMu8lPMyFxF/bi1rd
         v23aKVypdpCVVMzcbTCCCkph+mN1Ph7kCSgKiaci2jJD3tLdoVBnYEfEenFB+lPMNlWL
         MReK2Xb4OzzwtOUoQw4GJdZFhmiymlv9q4LS19awWK8a9KxaUBmhUuSDBMEyYl3RMGhf
         sW2iJtKKUc9L+TnQykN0a6fJzWsRLmwx/cf7fr8ZgVQknGAVwakfxZlg69qs8jhAR029
         UTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746101795; x=1746706595;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0A3i0y7AEXGrVw5WCxmIfPgVwLI2iY2Vm/Il51dpo4=;
        b=c4gfcKq4IcQkogXl7wkHebLBwfco7BuzYsWZolqVJLmGz0y0HhqxGH5XKzj8cOBd+b
         GAya2xRIemSuOoz9ZBxNA23CzH6FNPyw//L/kboiNNEpXQ/nwiuMAibcvlz1+KIFC+PW
         /StbfaxkI7md/s/zQt2RjlIJ6iQGmBhRQ1Ai6Wf9whEUWYEPAyY8exLf34D54J8FE9Ba
         Zt225nBj99tFCnUssMP//hVO8cAE7tCP3u629hHm+fICSC87teWtZqhIv8nEsTDIQcnj
         uMJc2QAniX8xcA+vmMrdxXusIBrD3UjU8VWO/iTsG0Vv4oQLvZTf9nQhm1pKzer0LtE6
         Paqg==
X-Forwarded-Encrypted: i=1; AJvYcCUAyxZvXRY4X7WGeHuNc3m987/PG09IleqFOlw/fX5590UGneSym1J0McmTKP9e39A8icre0NZt4ugiHiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0fJSXZDVkxE2EG+zLIb+7L3sX4mrO/nfeLFIkqHVherm9Fsg
	sqVR/gR8CKZoU/5Ifweaz/YRwiKbChR7WFLlubZnNd43d58Q/gGxIEA8/kK99l87I0yHNUED1uE
	ejhRWyULa9HJFLA==
X-Google-Smtp-Source: AGHT+IHPX/PFUHy/B5MO7ne7F95HMGksgkzZCkh09JGriq4Dil8oYGmEhlEKL/ontfKDHtVmoGpFcCN9QJjYhiI=
X-Received: from edi23.prod.google.com ([2002:a05:6402:3057:b0:5f8:f539:d6d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3549:b0:5f7:eafe:76d5 with SMTP id 4fb4d7f45d1cf-5f89ae69fdbmr5712393a12.8.1746101795323;
 Thu, 01 May 2025 05:16:35 -0700 (PDT)
Date: Thu, 01 May 2025 12:16:16 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA9mE2gC/23MQQ7CIBCF4as0sxbDIG2tK+9huqh0oETtGKhE0
 3B3sWuX/8vLt0Kk4CnCqVohUPLR81xC7Sow0zA7En4sDUqqWuqDFOEVF3EznERjWm1HadHKBsr /Gcj692Zd+tKTjwuHz0Yn/K3/lIQCxbUbqNOoj9jWZ8fs7rQ3/IA+5/wF2Ne1B6MAAAA=
X-Change-Id: 20250430-rust-kcov-6c74fd0f1f06
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IyknQ/1KxQ4jy7cl/9HHS98hqktVwXtxDa2ScsUKzik=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoE2Yc1seMwVTR5LqQgHftFKn3mcU9oBGoTAYMA
 XywZQOUJWaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBNmHAAKCRAEWL7uWMY5
 RruED/41KjyEBSNGnCAlbC4pSd6vvUYRCa5IqugILNA8EWWtm5XV9HG03IkpVx9l+WPGCL4raW7
 bT2QtGi8GeAZbwMap6yw8UgVvZiY28Lij+WpnY2OVdsJF/K2HbjEdk4JEHNYj2C9+i+ASxTwG69
 A/X717LIJcJ4EXFsfO3TVIafKmpqbCgonlQuaio5BGKsE1UzRW0+SpM6s7LTkNi6aNu/9wmKpnb
 8tq+mESF2tJgKjOiFddb2iHUR3Rx3lR4XQYNN38JC73fjMfW7t6CPEsLwQscoS/3u60zajicOS5
 lZQoWisQNarEmFfngt6PDpK91WJJDjrIHWH0KPdiJ2FHWjVP1XTXY4d5nBgk9NCOl39TmerwCYW
 M59Id7N74zcvrA6sVIrOGB73JiWdYpZcnCxYBH3kvTTErHZvtqM7KMBPl5WWhbimVOnY1WYMXv+
 6bg/rZjLhQwVgsdVcjUEKk901szchGmin0XreBHwnx9KZEGkCtW8+rfROMpkliIP1HLl/dMTxAN
 drQr4WXpIrbkME5OIUtsW03u3HqG4iW1x9cmNXhtQb44r0TDoEKS23in3hEfqarJ/he4hxMhumA
 WtZWUY5kI7tm+uZaFe1e2preFMcwNYTTbkTcobH0Yuv1OdUEtfltjYFn69OMriD0xJc3aVcMnYi HWr3YoEPbjHxiNQ==
X-Mailer: b4 0.14.2
Message-ID: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
Subject: [PATCH v2] kcov: rust: add flags for KCOV with Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Aleksandr Nogikh <nogikh@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust code is currently not instrumented properly when KCOV is enabled.
Thus, add the relevant flags to perform instrumentation correctly. This
is necessary for efficient fuzzing of Rust code.

The sanitizer-coverage features of LLVM have existed for long enough
that they are available on any LLVM version supported by rustc, so we do
not need any Kconfig feature detection. The coverage level is set to 3,
as that is the level needed by trace-pc.

We do not instrument `core` since when we fuzz the kernel, we are
looking for bugs in the kernel, not the Rust stdlib.

Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
I did not pick up the Tested-by due to the changes. I verified that it
looks right under objdump, but I don't have a syzkaller setup I can try
it with.
---
Changes in v2:
- Ignore `core` in KCOV.
- Link to v1: https://lore.kernel.org/r/20250430-rust-kcov-v1-1-b9ae94148175@google.com
---
 rust/Makefile         | 1 +
 scripts/Makefile.kcov | 6 ++++++
 scripts/Makefile.lib  | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08cfbf4d4e0f172dab66e9115001e3..80c84749d734842774a3ac2aabbc944a68d02484 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -492,6 +492,7 @@ $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
 ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
+KCOV_INSTRUMENT_core.o := n
 
 $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8efa106e8dffa640 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
 
+kcov-rflags-y					+= -Cpasses=sancov-module
+kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-level=3
+kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-trace-pc
+kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -Cllvm-args=-sanitizer-coverage-trace-compares
+
 export CFLAGS_KCOV := $(kcov-flags-y)
+export RUSTFLAGS_KCOV := $(kcov-rflags-y)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e129effb8846d5b8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
 	$(CFLAGS_KCOV))
+_rust_flags += $(if $(patsubst n%,, \
+	$(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
+	$(RUSTFLAGS_KCOV))
 endif
 
 #

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250430-rust-kcov-6c74fd0f1f06

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

