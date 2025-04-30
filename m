Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78241DFE22
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987268; cv=none; b=psEGbj2Ce4EExc9ELaFjdb9oYO3KB6LAAkBNeMAsJJYq0AX5HVdy42lh4vW6O+fleRsUyEQcgBDKlydVGNn3VQZeiRJuDJ8j3/pm8ZgUeBzpzfEqF/vQNrSYs2vzsSJbOPOvoNtc7NTETF/nlPMSVgcbsTSApHVqz3+2lF/zJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987268; c=relaxed/simple;
	bh=97Z7HY04S7W0oRfvQvmeek+Uhxqh6sKGJFbTY+DAs+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMuW5OF2PyU7IP0HU6pKC9vbQ+lquQA3tJeaOlz48yMsIt7sngOFkwbjqpKoFDvVuX1v1JRCikt7piKOYb3w8UmO0DZeM2aY/3b1kqK5WlFK1qP2GPaZo9XdpejZe5PDa0FihlQtcLk1BPNuNa5o2wfgXR5L+uwpHQev26vHzYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gm2D2MRg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gm2D2MRg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736a72220edso6882837b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987265; x=1746592065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCuYr2KP3wBxDodLMaPRY+onEFYkqYFG8HFmFD5AH3Q=;
        b=Gm2D2MRgmDKixiUEtEClRCC3c4g+A1Ov4iTsUUJrbep0GVLVOCYj2fyXu2UhNACDQm
         PK7UioXI8x32++6jcjfopaxBlEiwjR8xH2bN9ijuo1R87W96Zf+0aWsOzAJ3MnzmuAyu
         B5LUI0OiZQu/G+UV6CMfpKA8WLA/O4yrmO6eyua0P30VGPSNIusEC+6nQssCa6XTti1k
         FqMNEkK/aiq+OkWxlYCiTThkDPjLsZ0rMpNXB5RvqKEPx/NUfF5LUnXpd5yCk2d+sBDf
         LRb7EyiyAQvVzJSM1U8CERhiylSQkFWS8IYbHwUfbvDr+dZrdrQlt0hiWw86Ayfup+/x
         0PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987265; x=1746592065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCuYr2KP3wBxDodLMaPRY+onEFYkqYFG8HFmFD5AH3Q=;
        b=O1vepf55aZJY6Hac1b8tfH3A8YsMIIsnSCw5KWsEd3N7k1uFNFboM98m+WlX/UJ5ze
         77rlvUhh2buup8IA7B5n1nCsv0Fu732oAlXr7yELC0w5AUJeSzh/2GNzEHpAmL4z6Loo
         Hfj6e85YFr3zH8GZnM8wED0fvH9GB7vRLiW77qVKfcQVXmxJCEIA3Lly2AhSxcsJDsKN
         hSswlpd+MJo2FIAsrWLk1Od2Fb+CzPZeub4g4Fv5/ndXnoIUGL/0xnTDE8ecGAk1Oj6b
         QL5kJmSQ0LU5KgcJt+KDaidm1WezA7doYCKzLQRD54mDbK8MwDaAYLEPdGnkUtAVFsV4
         4UMA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSODdxLApuMeg8KCrY7z0bfBe0hGvGHqwDrFhWL0DCG/1wl+Po8EtKcfBz0PIrQDYvr+cIXzeBabVU6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIu5JS4MS9VmYK6Pw9tPaqeXUhumOdt/AKevfDIMnNn5+AmzhK
	ViDDM8bCE9OhxpSHLP0Z5Uqqpv+vfAltf3GTjosZrWirHW+exFlP
X-Gm-Gg: ASbGncupJ9fCFNUWGSyC1bkYb005r0/bFgxb2iPdRYuRK5790c4Pmx4AoV+akhg7MZQ
	S8yzW3TbwRlTpv4i6b9Ko/aHlrF/OTm6R25KEzojA3n5xD3J7m1AoYA3tV/XYLpPR1dz/5/2Ba6
	CAbeP20L8G0e9LKp+TOBkk8viy0IB6eWmRy69sTj+RqUqvq30vOW2P/edFwjsm9F4BGG5CKABaP
	dxemjTIb2km4C5Y6hzIxewtdThVsaar+9n8fGrwWqQiOYkzQ+GIWy2NzxEUXsZhTgXMnk0hWbdm
	N24fq3OJg8P9WxZchg95IEjQ/F6jVsawz3Zwmol3eH7gS9rmpc3cZFUgIgFSE9x62Bqcuw9XyB5
	Efp3PG5h/YnU=
X-Google-Smtp-Source: AGHT+IH0FbwVRr3MAmvHuDKfwKvFcYAl32DVyoxymDr2Jear3LyL+Hz5Wp7hXom+GZQca10gjxHCUA==
X-Received: by 2002:a05:6a00:130e:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74038a85c28mr2474451b3a.19.1745987264935;
        Tue, 29 Apr 2025 21:27:44 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62bfdsm628293b3a.142.2025.04.29.21.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:27:44 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 2BA51E94818; Wed, 30 Apr 2025 13:27:42 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/12] um: nommu: memory handling
Date: Wed, 30 Apr 2025 13:27:09 +0900
Message-ID: <2598e5207a53e4ec1f2077b5c5a9f03fc3782506.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
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
index 1d36a613aad8..fcf4bb915a31 100644
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
index 01422b761aa0..d4087f9499e2 100644
--- a/arch/um/include/asm/mmu.h
+++ b/arch/um/include/asm/mmu.h
@@ -15,10 +15,13 @@ typedef struct mm_context {
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
index 3a08f9029a3f..eb9b7d577062 100644
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
@@ -68,5 +66,8 @@ do {									\
 	put_unaligned(*((type *)src), (type *)(dst));			\
 	current->thread.segv_continue = NULL;				\
 } while (0)
+#endif
+
+#include <asm-generic/uaccess.h>
 
 #endif
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index cbe8b9d03d8c..1e18384381e2 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -64,7 +64,8 @@ void __init mem_init(void)
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
index 2331e32c4898..8a615875d1a1 100644
--- a/arch/um/os-Linux/process.c
+++ b/arch/um/os-Linux/process.c
@@ -70,8 +70,8 @@ int os_map_memory(void *virt, int fd, unsigned long long off, unsigned long len,
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

