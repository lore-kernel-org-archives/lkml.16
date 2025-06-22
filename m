Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD27D21FF58
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628011; cv=none; b=HoG/GoD/g2b3dveGDfchupjWCa0lmo84N8h8FLsAMm06RHgFOVVqM7PWRI9U2Zt90bggOhqLShzoc25pzBUUC1ucvM2RUFa2ZhTqTg/kiz92cKKek7i1E0pXAiWlYYn8G0jx9JBGVgBgo0cZ8TSfwb2aplsgvElEKOFM/DaLj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628011; c=relaxed/simple;
	bh=PrnDkOztux8Lftfz3cRwSL8F1uSiVMGY60W6duSht4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bwsd+sMP3Bj6MDVQXWpIOeldSmSMPzPGM94XzNDCTN/3ckAjksed3V8qC/jMzxQpJKAk1SihAo1lJnVEQe6XeNSZ0wQBJl2UwWC0n0y7ZyOWicsNd56u0OP9PAh18Vj3FauDysYooqMnBWBzEr1rPcBo4sAvtcrnUZTIiYqhHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDTdasgd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDTdasgd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2363616a1a6so26989705ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628009; x=1751232809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJZY7fSdjsRmE94xDQ9kPtMR3Ats2B2OoNFvSkK6k9U=;
        b=gDTdasgdSjU2QFfORV6yg/WXwbdXv4+6oSR5QwMcNBfE4HQUV1zrKrL7PX0dUWjcQm
         OpcfO0seZ3FjdGBX8okXnglhK1NO9kEkKoii6gawcPCfnqFK6noqW2u+kNwKHRBmMYsW
         rwxARiaIF6exnx0+6JcoyVDiQX269wUdrtqVj94BCdzhh7cvXdIh6W8A4rGe6/HxJIw7
         pmg8t6uHD395CIvJ6qp2GS36qoJezscl76V/48kg+ja6h5w+8qXBAKHkHQvio0TcPVQc
         l3bnu0Vvq1n5iUb+V9SFGo/QWH6m9g/OGk0x6Hdf5S8X7Rj01fwZ9c+uihzdO8F0mL4J
         udLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628009; x=1751232809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJZY7fSdjsRmE94xDQ9kPtMR3Ats2B2OoNFvSkK6k9U=;
        b=bScMaU9MK2zBt95nMJ3KXcaNw7At7rjhhsc85RX60HFyDNx7TLTzfG4JwZahIcY8AL
         KfTdr6RBEZmD/fjaGoQ/7k/TpKGsJRSvVCnehQxHAK6Wx2YLKpQ4kyzHyKPgBG6hX/Zh
         WNfLFjEN32uIIQ4sfV/jWHBXldf5GyJeT2z9kmZXaK1Fg9tJnHNBU7tJYrXafFhVIgDh
         1BUSbULNslybqY2c5xmLwKwe4rVyt/UEioHAVCteBDq+tiQDgR9CRfT0a1KyT7955dDj
         c4Z8EG+zwEeZq08JttjwQctjrPdMtpgbXHs3Gwki2C7Z1up1gobhiAcWExmqh2IpHyuW
         gU4g==
X-Forwarded-Encrypted: i=1; AJvYcCX+pZYXbDcWaQGiyuQ9Yo71JfuF7ni9e6QWUEgGmk23A4jxo0BH+c69ICH+DBE020+olUZC/ddSWr4En7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwOOzF3I+qIIajFYoca67uGlZtvaceqNWVVnaG1310osvgDUXo
	lilXr5pN0U5bBLj4BcucIFHcih7L7rQeMAHSaF9z7yWvLrfcy0SuVO1O
X-Gm-Gg: ASbGncu66qD4860zTUgpnSQJXhD15spMq9F3P2ENQ6lkCHGyowPcDxqp4fbWHxSl0+t
	MNzwRzQ7DNdUGzcEKwhxE+VzJeJgx7DtbqQ0jq/vCjjd2qx9wAHlftCMyYJXq30OohQuLvmVy66
	FT1VYDVj3SJ7hKPcqZKVVANWwoKhz+ApKCh+G1QyJHbH9nws1qCU21Xi7D5KhrSV7nD9DaznGxk
	3lUhjLwDDT2QJeVOVSLgmdBaFijzs9hL0FAijBkYbEgV54aRB/c6MbtBExtIy4+ZvrvAwpRT1N3
	u83gqOfbcBubxbPsHiD522lBWh95SQaS0UW034YjCeWuGXe9B0ExhKty2YB1P9ok0SGjQn4L/ZX
	tHOkDr+XAmNmXngLGdziEUupwZ+AdmGBx
X-Google-Smtp-Source: AGHT+IE+C6TqiI6itKxfIEkY9onlcQ1YuOUVxXsgpsSghi9Pc7uabtrgYH9aXbzxZQRAffufgmsfkQ==
X-Received: by 2002:a17:902:ce8c:b0:235:880:cf8a with SMTP id d9443c01a7336-237d97fbc21mr155530705ad.15.1750628009187;
        Sun, 22 Jun 2025 14:33:29 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393227sm67844035ad.24.2025.06.22.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:27 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id D0078EF1EAA; Mon, 23 Jun 2025 06:33:21 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 03/13] um: nommu: memory handling
Date: Mon, 23 Jun 2025 06:33:01 +0900
Message-ID: <c2fd350b2bb88b28c75f552e7335594e101e9dea.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
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

