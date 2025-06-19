Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5572A19E97C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295083; cv=none; b=RZ+CZRirw2pMGg1GyzWcKsc7rCBljQ0fcEfqIJxkF0TKKxFZpnQYB9jvObMSJBqwN6qtHcqvl/dGrjBiE3nIjk5xSPfb6Nfg2kFe7f7lOoBCU9s6oe8mslkdlV/fvH1nGwY7bK2mL3OiMYAjQFgS6/UefPOS6JoZ2MGuMD2AGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295083; c=relaxed/simple;
	bh=PrnDkOztux8Lftfz3cRwSL8F1uSiVMGY60W6duSht4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWrD63ptxaxe2mL2uzJO2RGRpkmZBfBP3l0WU8T1ldXu7PW3tvON2Z45HGuUFKcaf5z4DP0++BnT4EUO7itNEmdiFchaq6GbnKpyMHpTUrZoy4M4CNBv5nAfwEe76Ae+9qUnmOvn+fyzurpGZfFEPDcfCrNobXXqrj1vu7ZSJp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVBv1IDe; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVBv1IDe"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3122a63201bso121759a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295081; x=1750899881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJZY7fSdjsRmE94xDQ9kPtMR3Ats2B2OoNFvSkK6k9U=;
        b=UVBv1IDe1hZLpk5V4gK1O+QsHZE76EiO4YiH7TF9mR1lQxMLB0muDZSdJqipcu3w+c
         dnuxnotgw4GYO0nJf7qVuXzIm05jvYOTlamvWB7TSFQCUfwuLZTUMednfGnQ6HYk995E
         N/bhDWbrFK8O79XO8PoEtvZX0kuzE3UQwRgacM+sG1LyPEweVRNwAOf41nWWy/W6JXds
         mRAuLfC8xVoxJnWgfYR6bzKvXNRjN6L2wHd9ncRr21ujHaCFffnNcWo7PEvjJa+dhbXT
         ll0/Uc4n+IGI4JlMLFVzBmiyBKw2nefJwcMmV2HoH+u+Vo1C8X9L++7Oz7CNArdDH4V/
         porQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295081; x=1750899881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJZY7fSdjsRmE94xDQ9kPtMR3Ats2B2OoNFvSkK6k9U=;
        b=TH5DTc29Q+if3lH6ka2EajPhh0cLyDUdc916jyycw4lT1D0SDUj7E4a3NKI2sgxNsL
         tYtBEkVifJAmwKOB7JwFSHekpL+V07Cvr8J6d6r0PnmnVjRmCGIWadJODY6PLa1VYNMk
         lrMovrNrYOZnrW2Ws90EJ7eJNJVrLPn8PlmF7u+w+kEz8nX6UgOlyIkm6BWzLTQH7EN5
         jKDNScxKtGrJmacAgauIMbOkdTYBSh+t9H59DcuOltXKoizOWM+4/mn4EJzzCDUK4lli
         Y/vCaHkfoZJ5nSbf+wzMLWSNMcKdo1vL5HHa6fMMxDlM4OsnJeyc6T6lVeUhgX6IDKuQ
         xPDg==
X-Forwarded-Encrypted: i=1; AJvYcCXAPbktBHaXzvexYvzqaPhMOT79z39+E00oCBeu6gZbO+/6Cv3L82X/SE39m02rYRcOm7kCM5CnRSh39YU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe2jEQMBkyZbv+rjnDi+LU3g2mkManoHARMwOPebjqMPmLHFzP
	X3nyJlDKKGNA7fMG7TKBdOHLzB9KFsaU26Ww+cjLWlKSfjv500/+Fc3C
X-Gm-Gg: ASbGncsWSlyqnvHgiRLnD//jdXocPtMxNaqMl4m43Ze953z+HV+OhO9yB9DH02AzbCN
	UfSNxmqnhaskikFYJMSaYQa6rGuZMMgDRtgxwXbJdZASDtBi9o+32gP60iSodlShJt69GRumn3X
	EXqyS6rptheVgWm9FC++SX7/DSjnrm1sc6jva2EsbS/CXh2bPvk5UX09AZcVCqAJnTGLiCFQIWj
	BzOAxX04s1aUV/r6swqzR0JReSTNZgPsYYV5OkhraC/9r6ZX2PQKx6RtkkvDUK2CSOMpkRCtBFM
	dLbHUJwCCfLdlby68Q1pZZYg6I53sA9CkQfvcvupS68OeqauNkPc5BWHCxTmE3qefEAImKaVOsl
	7/y/ccc2/on+Dn4gmwkYCBXiv1x5HX2B9
X-Google-Smtp-Source: AGHT+IH4uU1pGplG19mmCzAP1mwEmJG8BFCTlYV0YGKJFwD9XSBO3JUptsHATvAeeZW9CGCCDm0fGw==
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id 98e67ed59e1d1-313f1d50e08mr27014989a91.20.1750295081409;
        Wed, 18 Jun 2025 18:04:41 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a318673sm821989a91.34.2025.06.18.18.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:40 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id D7147ED652E; Thu, 19 Jun 2025 10:04:35 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 03/13] um: nommu: memory handling
Date: Thu, 19 Jun 2025 10:04:07 +0900
Message-ID: <c2fd350b2bb88b28c75f552e7335594e101e9dea.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds memory operations on UML under !MMU environment.

Some part of the original UML code relying on CONFIG_MMU are excluded
from compilation when !CONFIG_MMU.  Additionally, generic functions such as
uaccess, futex, memcpy/strnlen/strncpy can be used as user- and
kernel-space share the address space in !CONFIG_MMU mode.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 arch/um/Makefile                  | 4 ++++
 arch/um/include/asm/futex.h       | 4 ++++
 arch/um/include/asm/mmu.h         | 3 +++
 arch/um/include/asm/mmu_context.h | 2 ++
 arch/um/include/asm/uaccess.h     | 7 ++++---
 arch/um/kernel/mem.c              | 3 ++-
 arch/um/os-Linux/mem.c            | 4 ++++
 arch/um/os-Linux/process.c        | 4 ++--
 8 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 7be0143b5ba3..5371c9a1b11e 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -46,6 +46,10 @@ ARCH_INCLUDE	:= -I$(srctree)/$(SHARED_HEADERS)
 ARCH_INCLUDE	+= -I$(srctree)/$(HOST_DIR)/um/shared
 KBUILD_CPPFLAGS += -I$(srctree)/$(HOST_DIR)/um
 
+ifneq ($(CONFIG_MMU),y)
+core-y += $(ARCH_DIR)/nommu/
+endif
+
 # -Dvmap=kernel_vmap prevents anything from referencing the libpcap.o symbol so
 # named - it's a common symbol in libpcap, so we get a binary which crashes.
 #
diff --git a/arch/um/include/asm/futex.h b/arch/um/include/asm/futex.h
index 780aa6bfc050..785fd6649aa2 100644
--- a/arch/um/include/asm/futex.h
+++ b/arch/um/include/asm/futex.h
@@ -7,8 +7,12 @@
 #include <asm/errno.h>
 
 
+#ifdef CONFIG_MMU
 int arch_futex_atomic_op_inuser(int op, u32 oparg, int *oval, u32 __user *uaddr);
 int futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval);
+#else
+#include <asm-generic/futex.h>
+#endif
 
 #endif
diff --git a/arch/um/include/asm/mmu.h b/arch/um/include/asm/mmu.h
index e9661846b4a3..9f30c69e5278 100644
--- a/arch/um/include/asm/mmu.h
+++ b/arch/um/include/asm/mmu.h
@@ -18,10 +18,13 @@ typedef struct mm_context {
 	unsigned long sync_tlb_range_from;
 	unsigned long sync_tlb_range_to;
 
+#ifndef CONFIG_MMU
+	unsigned long   end_brk;
 #ifdef CONFIG_BINFMT_ELF_FDPIC
 	unsigned long   exec_fdpic_loadmap;
 	unsigned long   interp_fdpic_loadmap;
 #endif
+#endif /* !CONFIG_MMU */
 } mm_context_t;
 
 #endif
diff --git a/arch/um/include/asm/mmu_context.h b/arch/um/include/asm/mmu_context.h
index 23dcc914d44e..033a70166066 100644
--- a/arch/um/include/asm/mmu_context.h
+++ b/arch/um/include/asm/mmu_context.h
@@ -36,11 +36,13 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	}
 }
 
+#ifdef CONFIG_MMU
 #define init_new_context init_new_context
 extern int init_new_context(struct task_struct *task, struct mm_struct *mm);
 
 #define destroy_context destroy_context
 extern void destroy_context(struct mm_struct *mm);
+#endif
 
 #include <asm-generic/mmu_context.h>
 
diff --git a/arch/um/include/asm/uaccess.h b/arch/um/include/asm/uaccess.h
index 1c6e0ae41b0c..b9677758e759 100644
--- a/arch/um/include/asm/uaccess.h
+++ b/arch/um/include/asm/uaccess.h
@@ -23,6 +23,7 @@
 #define __addr_range_nowrap(addr, size) \
 	((unsigned long) (addr) <= ((unsigned long) (addr) + (size)))
 
+#ifdef CONFIG_MMU
 extern unsigned long raw_copy_from_user(void *to, const void __user *from, unsigned long n);
 extern unsigned long raw_copy_to_user(void __user *to, const void *from, unsigned long n);
 extern unsigned long __clear_user(void __user *mem, unsigned long len);
@@ -34,9 +35,6 @@ static inline int __access_ok(const void __user *ptr, unsigned long size);
 
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
-
-#include <asm-generic/uaccess.h>
-
 static inline int __access_ok(const void __user *ptr, unsigned long size)
 {
 	unsigned long addr = (unsigned long)ptr;
@@ -70,5 +68,8 @@ do {									\
 	barrier();							\
 	current->thread.segv_continue = NULL;				\
 } while (0)
+#endif
+
+#include <asm-generic/uaccess.h>
 
 #endif
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 106a2f85ab5c..4be1cf240d71 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -64,7 +64,8 @@ void __init arch_mm_preinit(void)
 	 * to be turned on.
 	 */
 	brk_end = (unsigned long) UML_ROUND_UP(sbrk(0));
-	map_memory(brk_end, __pa(brk_end), uml_reserved - brk_end, 1, 1, 0);
+	map_memory(brk_end, __pa(brk_end), uml_reserved - brk_end, 1, 1,
+		   !IS_ENABLED(CONFIG_MMU));
 	memblock_free((void *)brk_end, uml_reserved - brk_end);
 	uml_reserved = brk_end;
 	min_low_pfn = PFN_UP(__pa(uml_reserved));
diff --git a/arch/um/os-Linux/mem.c b/arch/um/os-Linux/mem.c
index 72f302f4d197..4f5d9a94f8e2 100644
--- a/arch/um/os-Linux/mem.c
+++ b/arch/um/os-Linux/mem.c
@@ -213,6 +213,10 @@ int __init create_mem_file(unsigned long long len)
 {
 	int err, fd;
 
+	/* NOMMU kernel uses -1 as a fd for further use (e.g., mmap) */
+	if (!IS_ENABLED(CONFIG_MMU))
+		return -1;
+
 	fd = create_tmp_file(len);
 
 	err = os_set_exec_close(fd);
diff --git a/arch/um/os-Linux/process.c b/arch/um/os-Linux/process.c
index 4eb7e137ef4b..8a1ab59a089f 100644
--- a/arch/um/os-Linux/process.c
+++ b/arch/um/os-Linux/process.c
@@ -99,8 +99,8 @@ int os_map_memory(void *virt, int fd, unsigned long long off, unsigned long len,
 	prot = (r ? PROT_READ : 0) | (w ? PROT_WRITE : 0) |
 		(x ? PROT_EXEC : 0);
 
-	loc = mmap64((void *) virt, len, prot, MAP_SHARED | MAP_FIXED,
-		     fd, off);
+	loc = mmap64((void *) virt, len, prot, MAP_SHARED | MAP_FIXED |
+		     (!IS_ENABLED(CONFIG_MMU) ? MAP_ANONYMOUS : 0), fd, off);
 	if (loc == MAP_FAILED)
 		return -errno;
 	return 0;
-- 
2.43.0

