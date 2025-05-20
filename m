Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261427A911
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737725; cv=none; b=hvpU+hFsf6IzycIrY/n0NGY6dTceBZDVyIkwi4oFtP7vuC3l72tRIfaQYrKAyyiv2cwnP8kTxOlMLjSudw0nQdyy92Lmx09hM95qnDILEwLHli0Vj2+PAITkxGgeWX3aEIE2vr2C0HCbvJIlnn5Yzzm86TMyOOLf3bcWHu0hLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737725; c=relaxed/simple;
	bh=ASR+jV5TgnZQZ861z46SDezzxeRHr9pTxTTUfsE+mJ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=forxvT7GVtuAuFZ2XIeMFBCjYjLX8HfZPEWd8lPJBk23XLQreDadcrlVbY0lMJjwPEQ1lf2Yl9h5cT9wqlqN7gj9posRLPpsm2zqbj5qKb3Bya9fxB9mbrcnIJv7tevKKgLduKXUdMON3h0KET6Zv5952U7/yxk+KL6q8BjMKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QH5ktQww; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QH5ktQww"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442dc702850so8813295e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737722; x=1748342522; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9mhuFA2bAHGjz8pRwM1FCEnHmd1njh6GkBXwvQOfkdo=;
        b=QH5ktQwwDaR2OjjLvyUhI0eUU2a++EsSqOO1ZOgiAJgbXhyRsVHzPtLYqH1yVb0/Ee
         IgomKhWS5RVx13yT171RD/gvqhXZMsLr9IK+zGfeOz0gWPVvrtkZ2hB0WdL6q85Hcwz6
         2QQ8y4euChHxhbEviqdXAvkaT7Na7YkKALk+9T8IbqYgwI9WyTzdWVj2tfaSRons0vhM
         Em0C1FPi5UyzYPmVrxLECjq236ONG3jqUkcLiY7yiHjHXEE6Uoiar45iLXfbx/d3Tb4/
         CbICpTtSlxP7U060Gei/Up4R+RLekApnZUxm1fAy7L/5+Q8LOB8h3B3PEfW6H62Ud1b3
         m8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737722; x=1748342522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mhuFA2bAHGjz8pRwM1FCEnHmd1njh6GkBXwvQOfkdo=;
        b=IPySVlBj7Pn5WlaF3QT3826FvQ4ev9Bzufxi3VMg+XEN3M1NEKk5SHbosJX4j9AZT6
         Fx0uknuTpG+ZUD38PEjbjv8RayV4aOusYDySXFlFX2cm2wE7+7Nt4sMlmxv2YaDzLYxR
         aOLD49sL+iOCveTjuc/RqR6oxfFMbFJDKrOmM9mV5rWApUt+kfaPRNp9EKSlsK9hJLYJ
         ENyP52ifecndGkhtgKS7DcoBM/jv1tSMJEaqCr56pBXf6waEE6+9VqPB42OE5bA7McUw
         pXejfhxGi+LcDeSWvCN8gm0jiLWLtvSf9JTBE25Q2kyVp9bbOQZ9AX4ywYplyzBF98Xa
         Ajbw==
X-Gm-Message-State: AOJu0YxprEsHP/XJJ3Yhjsi3asUcFRBsQRCijABu69f1kfLJM4+T0fFt
	74mI5gm9dqRqJfEMYu7CaczJaM/s0g9iFRa5BF6TFDAELhPNe6oX42fVBEgVx7W3kwz/3EEtJWS
	RKdMFQ3aBPGS9kS3XJ2jhCXKrm/br/6m30naOTFnDpiJPKiWAVbgDmLS+hj+jDiAfvVA7icZ0oO
	l1dahUzy09Wmb7m3qiHIP2z1Q9LANYDkqnPQ==
X-Google-Smtp-Source: AGHT+IGnFijJmn0CEVd+WMOWzafC9axuO+b9uF5lsaikk3x/FRH/dCjsy1q1cvdDHDEKqhj6/cg35sMi
X-Received: from wmbjh8.prod.google.com ([2002:a05:600c:a088:b0:43c:fe64:2de3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5493:b0:43d:878c:7c40
 with SMTP id 5b1f17b1804b1-442fd618f0dmr185307315e9.10.1747737722313; Tue, 20
 May 2025 03:42:02 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:42 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569; i=ardb@kernel.org;
 h=from:subject; bh=DUkmfhtrvIjpe2gbvWTJxbHzvGFyCsYxLJtY1nh4YRk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnJtPs3h2Dh4ymiTuUHe+t6+985JjzveJJJ0fIBPGbW
 gaHl7Z0lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIl8/M3I8OOx2DqDmttmea0L
 OoybS9yuOUseKYo/1HXpxUyxO0wHpRkZ/v87mqFhLXs3NWBKis3Cc9yn7JiaOF+87UqrEu2MufC ECwA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-12-ardb+git@google.com>
Subject: [PATCH v5 3/7] x86/mm: Define PTRS_PER_P4D in terms of pgdir_shift()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Define the value of PTRS_PER_P4D in terms of pgdir_shift(), which can be
accessed cheaply, removing the need for a global variable that needs to
be kept in sync manually.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         | 2 +-
 arch/x86/boot/compressed/pgtable_64.c   | 2 --
 arch/x86/boot/startup/map_kernel.c      | 1 -
 arch/x86/include/asm/pgtable_64_types.h | 4 +---
 arch/x86/kernel/head64.c                | 2 --
 5 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 97b80d08f03c..3157f2fbc593 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -193,7 +193,7 @@ static inline int count_immovable_mem_regions(void) { return 0; }
 #endif
 
 /* ident_map_64.c */
-extern unsigned int __pgtable_l5_enabled, ptrs_per_p4d;
+extern unsigned int __pgtable_l5_enabled;
 extern void kernel_add_identity_map(unsigned long start, unsigned long end);
 
 /* Used by PAGE_KERN* macros: */
diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index 898a4e66e401..965fca150e68 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -12,7 +12,6 @@
 
 /* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
 unsigned int __section(".data") __pgtable_l5_enabled;
-unsigned int __section(".data") ptrs_per_p4d = 1;
 
 /* Buffer to preserve trampoline memory */
 static char trampoline_save[TRAMPOLINE_32BIT_SIZE];
@@ -122,7 +121,6 @@ asmlinkage void configure_5level_paging(struct boot_params *bp, void *pgtable)
 
 		/* Initialize variables for 5-level paging */
 		__pgtable_l5_enabled = 1;
-		ptrs_per_p4d = 512;
 	}
 
 	/*
diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 06306c5d016f..5d3c6108f1c3 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -24,7 +24,6 @@ static inline bool check_la57_support(void)
 		return false;
 
 	__pgtable_l5_enabled	= 1;
-	ptrs_per_p4d		= 512;
 
 	return true;
 }
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 3ee747f596e3..d8e39c479387 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -46,8 +46,6 @@ static inline bool pgtable_l5_enabled(void)
 #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
 #endif /* USE_EARLY_PGTABLE_L5 */
 
-extern unsigned int ptrs_per_p4d;
-
 #endif	/* !__ASSEMBLER__ */
 
 /*
@@ -61,7 +59,7 @@ extern unsigned int ptrs_per_p4d;
  */
 #define P4D_SHIFT		39
 #define MAX_PTRS_PER_P4D	512
-#define PTRS_PER_P4D		ptrs_per_p4d
+#define PTRS_PER_P4D		(pgdir_shift() & 1 ?: MAX_PTRS_PER_P4D)
 #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK		(~(P4D_SIZE - 1))
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index e2d9e709ec01..fe0770f468c3 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -52,8 +52,6 @@ SYM_PIC_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
 unsigned int __pgtable_l5_enabled __ro_after_init;
-unsigned int ptrs_per_p4d __ro_after_init = 1;
-EXPORT_SYMBOL(ptrs_per_p4d);
 
 unsigned long page_offset_base __ro_after_init = __PAGE_OFFSET_BASE_L4;
 EXPORT_SYMBOL(page_offset_base);
-- 
2.49.0.1101.gccaa498523-goog

