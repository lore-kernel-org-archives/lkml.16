Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20DD286417
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546551; cv=none; b=eYZuaEwbtWjM5wXbYcC9F5mRQanfEGvv8whrLSCZAxdPlfQkSvAxXG20WF4vPYxYCOrOh5/QvFKuFqbIYpzGbqWi7IcALYDZXZYmDliWsJFDu32OLlvcsDgadq8og/lV1CbDHa4OnayuPpWQg+b9T1ZJwIMsNSKiQ/mcG3LmDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546551; c=relaxed/simple;
	bh=ytOsO0/Eygb1v1VAyO7loK/5ETk9vkr9e1iEY9+MnjQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q/nfMJ2OKRn35+o2AaPafHhsKdbJKVJx/1uPohTZa9Rq1HllN6R6PGB1ZShMdBq/7pk62Jtl4JFt5+Ijeao0Z2JRWkHEfcww7pyppBZVLGlq8ZgQ6rKEHLVCj3yHX0S5+ZL1Xc558IeART0iNudtOI2OFhFfJP/j73isioynZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lVY8lNo3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lVY8lNo3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441c96c1977so18037255e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746546548; x=1747151348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzX1NlgT/KBOGdnClxyp8776oeF/qisXFeRu7/C2O0E=;
        b=lVY8lNo3nLNcKIh9hq1QqRdM3pFP3W2o7LpkMLGm6ng/6e7RQPORKdJYh5TZPn1/7P
         8rfMunN59JjJzmzyq0wkHTEymA8lwKTho3eM3XX2X7szBoPZHX92k76VI6jHWzxUtUjk
         Fh9emsSICPCTyd4fzLli+i/UC+anSoP1t0fTttcWx5Ef0ilaBqMxSy68SW/BN5Op6SwF
         YYBwbN6I8ErOtelNXRD+taCsKF1PiDLoe+OA3Nh9pCSRnGTmHeazjVo1RWqJZelDQVJd
         1tlhgATHwFLzvCxFLGdU18f+Zlt6ODK2Vx52eGOH1MWFYIFi0QrmvDcpGa/SqnB2kORg
         m8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546548; x=1747151348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzX1NlgT/KBOGdnClxyp8776oeF/qisXFeRu7/C2O0E=;
        b=Gsem7V1pxtUZVjP0C2+2gvUAjL8WNJQC7HjhBPWD4DY8IdSdI2qN9X9vy/S6YboZfW
         ennsiOhff6wyUzGxEULasAK4R3eJHChlxUxoBaUXWGdggDFlVwyE2v6z0hp6rlwqhVRP
         +UN8lb8htWTcjXjWTHoqvErNbyFJzLM85MzSrHIKyiwSA5JLkrDBrLMSSCVgvofTHHl9
         VpNqgkzMYMl4r8k13tUwBaMA1ntPDBI328oLtoAF5GWMjYxWqgs2XhYzDan0JEMElkLu
         1Id8c0gnW3UNDZqjV1zgNs1nL+3GgAGTq0BltpYMrsHWY4JNCcXOiZxq84E9yPFo7HjF
         iT5Q==
X-Gm-Message-State: AOJu0YyxDfkvf/Gy4o3r0CI39IqdLeIsIZW8ONXYO2+nSckGFAUttthh
	PwjKE84Sd0KI/n/913xQbTllD3YyRT029MhuA1bDVmGgiJt61ibe3UmhWpcyHyOum5g4Ti1O+IJ
	y0ISDhVCm5O8SMfNVYJKG84Id/JZ+ibKC+yYKdlbXfknNv6zoMAVstuKTqwCmX5M/6v/q+q9bFd
	CXxe2cJ2m4R7fqfCK1DB/s70bNwa3jHg==
X-Google-Smtp-Source: AGHT+IGa3DqBc2MZCI3aGVCA0v7htY4afpO5suddzCoEhewsCtknTgpT9xgTF+2YioMuleycQU4E+8BQ
X-Received: from wmsd13.prod.google.com ([2002:a05:600c:3acd:b0:43c:eba5:f9b3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ed0:b0:43c:ea36:9840
 with SMTP id 5b1f17b1804b1-441d05430d7mr29435325e9.22.1746546547971; Tue, 06
 May 2025 08:49:07 -0700 (PDT)
Date: Tue,  6 May 2025 17:45:36 +0200
In-Reply-To: <20250506154532.1281909-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372; i=ardb@kernel.org;
 h=from:subject; bh=U4da3pe3bayT4rcjjKJgvtQ0xfj6r7owSlhpuJafX3c=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNKb2HD/ZvhzAv3vPySeXGuVVOLg9tElXsBb/u+GiopP
 7z17IxERykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhIzXyGf4qTzh+/p2r0Y82X
 8P2rVsy4WKd0pXReyxHt/463bKynNagzMvx/tlGkOnn7m217Uxb4xTv9E131NNpYIFTiX1yPsBU nGycA
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250506154532.1281909-8-ardb+git@google.com>
Subject: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for 5-level
 paging constants
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

There are a couple of cases where pgtable_l5_enabled() is not used for
control flow, but for selecting the value of a global constant. There
are some other occurrences of such constants where the value is stored
in a global variable that needs to be assigned sufficiently early.

To make this more robust, base all of these on a new helper that uses
alternatives based code patching to select one of two immediate values,
based on whether 5 level paging is in use.

Base this on __pgtable_l5_enabled, which is guaranteed to be set to the
right value before C code ever observes it. This allows the helper to
have the 'const' attribute.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/page_64_types.h    |  2 +-
 arch/x86/include/asm/pgtable_64_types.h | 28 +++++++++++++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index 1faa8f88850a..c5631dc4ab16 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -54,7 +54,7 @@
 #define __PHYSICAL_MASK_SHIFT	52
 
 #ifdef CONFIG_X86_5LEVEL
-#define __VIRTUAL_MASK_SHIFT	(pgtable_l5_enabled() ? 56 : 47)
+#define __VIRTUAL_MASK_SHIFT	(choose_l5_enabled(56, 47))
 /* See task_size_max() in <asm/page_64.h> */
 #else
 #define __VIRTUAL_MASK_SHIFT	47
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 2c498d16609c..bb4f54ac2e62 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -43,6 +43,28 @@ static inline bool __attribute_const__ pgtable_l5_enabled(void)
 t_no:
 	return false;
 }
+
+static inline int __attribute_const__ choose_l5_enabled(int yes, int no)
+{
+	int ret = no;
+
+	asm_inline(ALTERNATIVE_TERNARY("jmp 6f; 8:", %c[feat], "movl %[yes], %[ret]", "")
+		"	.pushsection .altinstr_aux,\"ax\"	\n"
+		"6:	pushfq					\n"
+		"	testb	$1, %a[l5en]			\n"
+		"	jz	7f				\n"
+		"	movl	%[yes], %[ret]			\n"
+		"7:	popfq					\n"
+		"	jmp	8b				\n"
+		"	.popsection				\n"
+		: [ret]  "+rm" (ret)
+		: [feat] "i" (X86_FEATURE_LA57),
+		  [yes]	 "i" (yes),
+		  [l5en] "i" (&__pgtable_l5_enabled));
+
+	return ret;
+}
+
 #else
 #define pgtable_l5_enabled() 0
 #endif /* CONFIG_X86_5LEVEL */
@@ -59,7 +81,7 @@ extern unsigned int ptrs_per_p4d;
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
  */
-#define PGDIR_SHIFT	pgdir_shift
+#define PGDIR_SHIFT	choose_l5_enabled(48, 39)
 #define PTRS_PER_PGD	512
 
 /*
@@ -67,7 +89,7 @@ extern unsigned int ptrs_per_p4d;
  */
 #define P4D_SHIFT		39
 #define MAX_PTRS_PER_P4D	512
-#define PTRS_PER_P4D		ptrs_per_p4d
+#define PTRS_PER_P4D		choose_l5_enabled(MAX_PTRS_PER_P4D, 1)
 #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK		(~(P4D_SIZE - 1))
 
@@ -138,7 +160,7 @@ extern unsigned int ptrs_per_p4d;
 
 #ifdef CONFIG_DYNAMIC_MEMORY_LAYOUT
 # define VMALLOC_START		vmalloc_base
-# define VMALLOC_SIZE_TB	(pgtable_l5_enabled() ? VMALLOC_SIZE_TB_L5 : VMALLOC_SIZE_TB_L4)
+# define VMALLOC_SIZE_TB	((unsigned long)choose_l5_enabled(VMALLOC_SIZE_TB_L5, VMALLOC_SIZE_TB_L4))
 # define VMEMMAP_START		vmemmap_base
 #else
 # define VMALLOC_START		__VMALLOC_BASE_L4
-- 
2.49.0.987.g0cc8ee98dc-goog

