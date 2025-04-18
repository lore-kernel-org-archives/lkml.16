Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8901925A2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985658; cv=none; b=VpF7yiQ8ObVcUkE3U3fMrnpvRXJTqVYjuWVdMwaMiER0wKFTAioiyGbcHETPp5xRQdhUQQvwVKHTB8cDdMYv3+jwStxTN8lhAJxvLTomXCSYT/BMlU+cvNeoiA/J+1QRSdi/BU2C/WFU/WVBNy6kewKAOkgUXPsOShRjA3yUa18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985658; c=relaxed/simple;
	bh=7KW1MA75CA/KauhN0nHPzECShpbQ3n1/ZA/5yvl3k1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FwX38qjh/h6ojvAcCXgMtrAr2fIxQ4B5qhWEelzwwW17Htw0LBkZcE0Eciu4aM1ZNZ3C8Q94+Nh+SZmZCoE8zN2hS8XDt4NNOr5ZkrfxBeasmtjmpzlpBgA/8ci/GBTVVW77po62wqF/fZUN1mcG7JMPZcTCftx6Pm+8zgSvklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z4axJ8u2; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z4axJ8u2"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so9192895e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744985653; x=1745590453; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHhe4J2kf97grySB1dghcoGwgwMgdWDWarBIG3W8Zrs=;
        b=Z4axJ8u2+r/noJOjHDXs87luiU336OO6XJIC1HqDKAsQzVhTxfUrLBOC83QriYOKUt
         IdeRItHpKjzKnHdL0FAT+d4ArtH3e7DlMvqr9rXsUFFTBa4pkfR7aV2KTKhbhTryxqZu
         yyzAFlXPzcSv7IrXX/o3hrcMPyrsq/kyoSIZsjA3x2WwfVKH9WHslfL99uBTLBmexRsT
         3OPE43F/9LVBgId9Z57b6HsRMpNAU3EYJBJA8du//wXrynaozgGwZmmR5HDTqz6SwIH5
         Yr1G5QjqhEArBI2ps3P7EPZUvx/w2BwAQFGxTPYRidKfFn0+pSUNN1iekhQwJOm9fQfL
         AszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985653; x=1745590453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHhe4J2kf97grySB1dghcoGwgwMgdWDWarBIG3W8Zrs=;
        b=ftsb+6AkhVaoxxOVj6JsHVsj74jnvdILhrxn4unSZBu+aHWlTM691k+spf/rFEAc7j
         dI6r+hIObVNGFgNM6Makc3ZQbp0upVV4nbNRugZaY21Xq46exypyequ0fuEkR+jit02/
         KcWubZkl4PZpRtPtheEQPT37rb9xaOciZ9dbonFXfgapUM3bZFh4z6RDXkN+k3+355Ej
         2dJRd/4LQtj09PRtGqOsE4u78iAz5zey5nk2WTdowME6yx7olcvTfyy02mi60ZCyZnVj
         aiE/uKFuh6JqCiLaATbiR8TlvHXAvHVgsPLkkumnk7pQJKvf1A4FxS2Yxg0dn8NzTkA8
         9nWQ==
X-Gm-Message-State: AOJu0Yx4PT7RTQNrRES4gECH41KS+p6k3aJQCIIWcRziv59wP7z26qGa
	nHsVuEHXYhdKN5L2dd9FQE+6rEm9JrUn0/+Y3EcahKnIK7QGOazTFQbzx26nIRVFfby/CY+slU4
	Ifo2rJmz/AceMJ3i5f59ClGo029r4PIZRfsE+kQ3/MgY+EHj1pJr4Y94HQEPcysiV9DjzEY3Kl5
	Mh5/5XklKHKVmr8TAsX++1Ps1PxxIbfQ==
X-Google-Smtp-Source: AGHT+IH2fs985NL9syEJxmzfaYzLtkZ8+tgwTx0XfOUAbx2HPO9MARD8qBLS6xHwxCgPFrviPb5dIaP1
X-Received: from wmbes11.prod.google.com ([2002:a05:600c:810b:b0:440:5d4e:87])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1990:b0:43d:4e9:27ff
 with SMTP id 5b1f17b1804b1-4406ab679famr21119115e9.7.1744985653442; Fri, 18
 Apr 2025 07:14:13 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:12:58 +0200
In-Reply-To: <20250418141253.2601348-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418141253.2601348-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=ardb@kernel.org;
 h=from:subject; bh=bksQ60B3uxdkOeoY7TfN+ieztWUBJigc7E5EyOzeidw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYMp9rXhoj0JLUvYM38Ua5euSBarYl3AJ8NUNun23fcVc
 Y0x/L4dpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIndzD8lVz/XuL4i+JnG/7f
 T7+ZX8cy3aN1Cbf6m3LX0C1c7UGnuBj+JzCu4BcKKc4RZfYV6JxydaHuN+HGV56l13uP3+V09/P lBgA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418141253.2601348-12-ardb+git@google.com>
Subject: [PATCH v5 4/6] x86/boot: Move SEV startup code into startup/
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, mingo@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Move the SEV startup code into arch/x86/boot/startup/, where it will
reside along with other code that executes extremely early, and
therefore needs to be built in a special manner.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/sev.c                              |  2 +-
 arch/x86/boot/startup/Makefile                              |  2 +-
 arch/x86/{coco/sev/shared.c => boot/startup/sev-shared.c}   |  0
 arch/x86/{coco/sev/startup.c => boot/startup/sev-startup.c} |  2 +-
 arch/x86/coco/sev/Makefile                                  | 20 ++------------------
 5 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 714e30c66eae..478c65149cf0 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -144,7 +144,7 @@ int svsm_perform_call_protocol(struct svsm_call *call);
 u8 snp_vmpl;
 
 /* Include code for early handlers */
-#include "../../coco/sev/shared.c"
+#include "../../boot/startup/sev-shared.c"
 
 int svsm_perform_call_protocol(struct svsm_call *call)
 {
diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index bb7c826e586c..21d911b61459 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -17,7 +17,7 @@ UBSAN_SANITIZE	:= n
 KCOV_INSTRUMENT	:= n
 
 obj-$(CONFIG_X86_64)		+= gdt_idt.o map_kernel.o
-obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sme.o
+obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sme.o sev-startup.o
 
 lib-$(CONFIG_X86_64)		+= la57toggle.o
 lib-$(CONFIG_EFI_MIXED)		+= efi-mixed.o
diff --git a/arch/x86/coco/sev/shared.c b/arch/x86/boot/startup/sev-shared.c
similarity index 100%
rename from arch/x86/coco/sev/shared.c
rename to arch/x86/boot/startup/sev-shared.c
diff --git a/arch/x86/coco/sev/startup.c b/arch/x86/boot/startup/sev-startup.c
similarity index 99%
rename from arch/x86/coco/sev/startup.c
rename to arch/x86/boot/startup/sev-startup.c
index 9f5dc70cfb44..10b636009d1c 100644
--- a/arch/x86/coco/sev/startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -422,7 +422,7 @@ static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
 }
 
 /* Include code shared with pre-decompression boot stage */
-#include "shared.c"
+#include "sev-shared.c"
 
 noinstr void __sev_put_ghcb(struct ghcb_state *state)
 {
diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
index 57e25f946663..2919dcfc4b02 100644
--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -1,25 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y += core.o sev-nmi.o startup.o
-
-# jump tables are emitted using absolute references in non-PIC code
-# so they cannot be used in the early SEV startup code
-CFLAGS_startup.o += -fno-jump-tables
-
-ifdef CONFIG_FUNCTION_TRACER
-CFLAGS_REMOVE_startup.o = -pg
-endif
-
-KASAN_SANITIZE_startup.o	:= n
-KMSAN_SANITIZE_startup.o	:= n
-KCOV_INSTRUMENT_startup.o	:= n
-
-# With some compiler versions the generated code results in boot hangs, caused
-# by several compilation units. To be safe, disable all instrumentation.
-KCSAN_SANITIZE		:= n
+obj-y += core.o sev-nmi.o
 
 # Clang 14 and older may fail to respect __no_sanitize_undefined when inlining
-UBSAN_SANITIZE		:= n
+UBSAN_SANITIZE_sev-nmi.o	:= n
 
 # GCC may fail to respect __no_sanitize_address when inlining
 KASAN_SANITIZE_sev-nmi.o	:= n
-- 
2.49.0.805.g082f7c87e0-goog

