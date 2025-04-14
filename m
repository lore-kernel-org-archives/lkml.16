Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B5F2F42
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641715; cv=none; b=m+ZNw9RzjiwKX/DKFN7IARvKZLN+98IOZ9LLe7SyXDVso17kjl7gAS3bB1E6Mw/anWn96pc3SUopb4nEuz5yRshQEqLG0egF9ZNbWafD5NgfCHrIQC+C0RS4W+bfjCEDclDwIwbkhprRP0ZukSh9Uz8EgeYWriqNX9qWjXw05PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641715; c=relaxed/simple;
	bh=gAMwK0aKbZXrk1PNTFpUD4wVN12nNjdeCkSKhiWth+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZUS8xMNWDvzFrMzoZwLMhrmZYgRYL73qbxpXsh4K5ADafanSlk1rYaeHuTF829AcOHGIcIHnO0lbSXyOm+1PfnYqVSq/gRrdD2NY5WuKVCCJhO7B2t4jWnsZ9LLr2C2aKnBMH7Y6tnViq25I1xa1tfgArQxc4gfoZG4ldGg5q/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEgqrnMv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEgqrnMv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so6533381a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744641711; x=1745246511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WN2RzEaznytcW3MI6vsn9hoB93QPOIneMr37kCAOmk8=;
        b=IEgqrnMvUgeWBMns3r3kdDPP1cuSCL3bqPIQ/IQusaf9hrnwd294sXm8CtIaR0vfL4
         uA+T5tVtjp3HTolkM08mtwRQB7jULN5bkYRTnhGjRojl0n4kzCZfvm5UR5fu74fyteS5
         aJ2rVmSydCYhXn8YCHmzLbG2FGPQRXix0HyP+ePX3cJVYVVDdY4Kqfm9MuJxsQX5XmcO
         SklwX2OIng9ycnyz/2Jnlw9aIn6jcyY0oeoDNiXObYox/257fR1RSfLTzNkkG9ofR7DK
         HsJn40DyKGL+DUl3Agx24b8duU9Wj2XDZ3cA2El0VIutBs5oDX1G2bUOY25t+EEvwzPl
         ExiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641711; x=1745246511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN2RzEaznytcW3MI6vsn9hoB93QPOIneMr37kCAOmk8=;
        b=WJ+zhZ1QfU51aCnqtVdemsM5mrXPNvQ7+KkjiexeS4C3aGnXK40BRuufQB1wXhEGDX
         d5Aj3O7zazkPZ1FT1SqfPhKVLq5u1zGGVg4CgjL12P4SsYO6v4LeAlwHy3dB83qnHu9z
         H0Zjj6drW/73o7Yrcmse2bQbItWr279je+cFg2D+jokZhO5VlvxhaNWq24Hn+TNBMaxo
         AP9mhtdXfq2Z1DgPLPzfGFG8EpiuCKBlXoROllOdHTdInTNBsZI9Usmy8wdrh+JY62Gn
         zOJ0AUYjABj1daGVoae97fvWsoM4dl7TyCXEgSYFzjnHHwtU2DTxLtF8xIql44Lc9bzn
         6djw==
X-Forwarded-Encrypted: i=1; AJvYcCWRQzVHwFg2xIyKWkIy/dK3Lcf7THIDtNxsDk4Y0SvfwoZk74V4m2rGy3E3YyiYlUbLgii72aNYpf3eO60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrL7bJZpQGy8p4grWG9dbbPKRAmLsxQkLCQNm9bXGekaEaLQE3
	fgfKF4VzjVc8pAnNLOKXynSNf5BBwYuXR2zBO9eGruUVWoUX6/1HlZqEkKPolV0=
X-Gm-Gg: ASbGncvBeqLaFAvIb1hmr7bsIhuErqt25K9uZMZBP3C9oP1yxMPBIYRTnNiqS+SWxSK
	OTRGBRjWgYOTOPw3mvvCSeXsYakl7Bz8D9LwIAw5/Dmg3rnoQJFG+f+eFwhv8p/Gv2r+TDqIl63
	mzPoyzfH2b6Dt7Ivy3cwifP3UoKM+GD1DXl1Fop8BlZ4KvZgKfs9tWXN3CCbqQTHBiAOqDGyuhD
	1lH98DEEje/MizXZcqfEg6lLX8TWX4IJ4NIotDmUgAzQuY5wSbLU3iAoi7njJSEPP8wTti/xe3b
	zMgOrbp0YQNFr6rUjg+a0stODKobHLPrBB3bXpttRaOwy8FIZA==
X-Google-Smtp-Source: AGHT+IGJFsFtMC3Y1rcmye3+P87nsWLJWL7lFUTuwFJoufoXf7SXOnStZwNg5lQ0hKPz/BKFYqTuVw==
X-Received: by 2002:a17:907:3f1b:b0:abf:6ebf:5500 with SMTP id a640c23a62f3a-acad348b863mr1075086566b.16.1744641711195;
        Mon, 14 Apr 2025 07:41:51 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb424fsm907072466b.120.2025.04.14.07.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:41:50 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip] x86/asm: Remove semicolon from "rep" prefixes
Date: Mon, 14 Apr 2025 16:41:21 +0200
Message-ID: <20250414144143.10196-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum version of binutils required to compile the kernel is 2.25.
This version correctly handles the "rep" prefixes, so it is possible
to remove the semicolon, which was used to support ancient versions
of GNU as.

Due to the semicolon, the compiler considers "rep; insn" (or its
alternate "rep\n\tinsn" form) as two separate instructions. Removing
the semicolon makes asm length calculations more accurate, consequently
making scheduling and inlining decisions of the compiler more accurate.

Removing the semicolon also enables assembler checks involving "rep"
prefixes. Trying to assemble e.g. "rep addl %eax, %ebx" results in:

  Error: invalid instruction `add' after `rep'

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/boot/bioscall.S             |  4 ++--
 arch/x86/boot/boot.h                 |  4 ++--
 arch/x86/boot/compressed/string.c    |  8 ++++----
 arch/x86/boot/copy.S                 |  8 ++++----
 arch/x86/boot/header.S               |  2 +-
 arch/x86/boot/string.c               |  2 +-
 arch/x86/boot/video.c                |  2 +-
 arch/x86/include/asm/io.h            |  6 +++---
 arch/x86/include/asm/string_32.h     | 15 ++++++---------
 arch/x86/kernel/head_32.S            |  8 +++-----
 arch/x86/kernel/relocate_kernel_32.S |  6 +++---
 arch/x86/kernel/relocate_kernel_64.S |  6 +++---
 arch/x86/lib/iomem.c                 |  2 +-
 arch/x86/lib/string_32.c             | 17 ++++++-----------
 arch/x86/lib/strstr_32.c             |  6 ++----
 arch/x86/lib/usercopy_32.c           | 18 +++++++++---------
 arch/x86/platform/pvh/head.S         |  3 +--
 arch/x86/power/hibernate_asm_32.S    |  3 +--
 arch/x86/power/hibernate_asm_64.S    |  3 +--
 19 files changed, 54 insertions(+), 69 deletions(-)

diff --git a/arch/x86/boot/bioscall.S b/arch/x86/boot/bioscall.S
index aa9b96457584..cf4a6155714e 100644
--- a/arch/x86/boot/bioscall.S
+++ b/arch/x86/boot/bioscall.S
@@ -32,7 +32,7 @@ intcall:
 	movw	%dx, %si
 	movw	%sp, %di
 	movw	$11, %cx
-	rep; movsl
+	rep movsl
 
 	/* Pop full state from the stack */
 	popal
@@ -67,7 +67,7 @@ intcall:
 	jz	4f
 	movw	%sp, %si
 	movw	$11, %cx
-	rep; movsl
+	rep movsl
 4:	addw	$44, %sp
 
 	/* Restore state and return */
diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 38f17a1e1e36..f3771a6373c7 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -155,14 +155,14 @@ static inline void wrgs32(u32 v, addr_t addr)
 static inline bool memcmp_fs(const void *s1, addr_t s2, size_t len)
 {
 	bool diff;
-	asm volatile("fs; repe; cmpsb" CC_SET(nz)
+	asm volatile("fs repe cmpsb" CC_SET(nz)
 		     : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
 	return diff;
 }
 static inline bool memcmp_gs(const void *s1, addr_t s2, size_t len)
 {
 	bool diff;
-	asm volatile("gs; repe; cmpsb" CC_SET(nz)
+	asm volatile("gs repe cmpsb" CC_SET(nz)
 		     : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
 	return diff;
 }
diff --git a/arch/x86/boot/compressed/string.c b/arch/x86/boot/compressed/string.c
index 81fc1eaa3229..652cde71dfe3 100644
--- a/arch/x86/boot/compressed/string.c
+++ b/arch/x86/boot/compressed/string.c
@@ -15,9 +15,9 @@ static void *____memcpy(void *dest, const void *src, size_t n)
 {
 	int d0, d1, d2;
 	asm volatile(
-		"rep ; movsl\n\t"
+		"rep movsl\n\t"
 		"movl %4,%%ecx\n\t"
-		"rep ; movsb\n\t"
+		"rep movsb\n\t"
 		: "=&c" (d0), "=&D" (d1), "=&S" (d2)
 		: "0" (n >> 2), "g" (n & 3), "1" (dest), "2" (src)
 		: "memory");
@@ -29,9 +29,9 @@ static void *____memcpy(void *dest, const void *src, size_t n)
 {
 	long d0, d1, d2;
 	asm volatile(
-		"rep ; movsq\n\t"
+		"rep movsq\n\t"
 		"movq %4,%%rcx\n\t"
-		"rep ; movsb\n\t"
+		"rep movsb\n\t"
 		: "=&c" (d0), "=&D" (d1), "=&S" (d2)
 		: "0" (n >> 3), "g" (n & 7), "1" (dest), "2" (src)
 		: "memory");
diff --git a/arch/x86/boot/copy.S b/arch/x86/boot/copy.S
index 6afd05e819d2..3973a67cd04e 100644
--- a/arch/x86/boot/copy.S
+++ b/arch/x86/boot/copy.S
@@ -22,10 +22,10 @@ SYM_FUNC_START_NOALIGN(memcpy)
 	movw	%dx, %si
 	pushw	%cx
 	shrw	$2, %cx
-	rep; movsl
+	rep movsl
 	popw	%cx
 	andw	$3, %cx
-	rep; movsb
+	rep movsb
 	popw	%di
 	popw	%si
 	retl
@@ -38,10 +38,10 @@ SYM_FUNC_START_NOALIGN(memset)
 	imull	$0x01010101,%eax
 	pushw	%cx
 	shrw	$2, %cx
-	rep; stosl
+	rep stosl
 	popw	%cx
 	andw	$3, %cx
-	rep; stosb
+	rep stosb
 	popw	%di
 	retl
 SYM_FUNC_END(memset)
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index b5c79f43359b..9cb91421b4e4 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -585,7 +585,7 @@ start_of_setup:
 	xorl	%eax, %eax
 	subw	%di, %cx
 	shrw	$2, %cx
-	rep; stosl
+	rep stosl
 
 # Jump to C code (should not return)
 	calll	main
diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 84f7a883ce1e..f35369bb14c5 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -32,7 +32,7 @@
 int memcmp(const void *s1, const void *s2, size_t len)
 {
 	bool diff;
-	asm("repe; cmpsb" CC_SET(nz)
+	asm("repe cmpsb" CC_SET(nz)
 	    : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
 	return diff;
 }
diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
index f2e96905b3fe..0641c8c46aee 100644
--- a/arch/x86/boot/video.c
+++ b/arch/x86/boot/video.c
@@ -292,7 +292,7 @@ static void restore_screen(void)
 			     "shrw %%cx ; "
 			     "jnc 1f ; "
 			     "stosw \n\t"
-			     "1: rep;stosl ; "
+			     "1: rep stosl ; "
 			     "popw %%es"
 			     : "+D" (dst), "+c" (npad)
 			     : "bdS" (video_segment),
diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index e889c3bab5a2..ca309a3227c7 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -217,7 +217,7 @@ void memset_io(volatile void __iomem *, int, size_t);
 static inline void __iowrite32_copy(void __iomem *to, const void *from,
 				    size_t count)
 {
-	asm volatile("rep ; movsl"
+	asm volatile("rep movsl"
 		     : "=&c"(count), "=&D"(to), "=&S"(from)
 		     : "0"(count), "1"(to), "2"(from)
 		     : "memory");
@@ -282,7 +282,7 @@ static inline void outs##bwl(u16 port, const void *addr, unsigned long count) \
 			count--;					\
 		}							\
 	} else {							\
-		asm volatile("rep; outs" #bwl				\
+		asm volatile("rep outs" #bwl				\
 			     : "+S"(addr), "+c"(count)			\
 			     : "d"(port) : "memory");			\
 	}								\
@@ -298,7 +298,7 @@ static inline void ins##bwl(u16 port, void *addr, unsigned long count)	\
 			count--;					\
 		}							\
 	} else {							\
-		asm volatile("rep; ins" #bwl				\
+		asm volatile("rep ins" #bwl				\
 			     : "+D"(addr), "+c"(count)			\
 			     : "d"(port) : "memory");			\
 	}								\
diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
index 32c0d981a82a..e9cce169bb4c 100644
--- a/arch/x86/include/asm/string_32.h
+++ b/arch/x86/include/asm/string_32.h
@@ -33,11 +33,11 @@ extern size_t strlen(const char *s);
 static __always_inline void *__memcpy(void *to, const void *from, size_t n)
 {
 	int d0, d1, d2;
-	asm volatile("rep ; movsl\n\t"
+	asm volatile("rep movsl\n\t"
 		     "movl %4,%%ecx\n\t"
 		     "andl $3,%%ecx\n\t"
 		     "jz 1f\n\t"
-		     "rep ; movsb\n\t"
+		     "rep movsb\n\t"
 		     "1:"
 		     : "=&c" (d0), "=&D" (d1), "=&S" (d2)
 		     : "0" (n / 4), "g" (n), "1" ((long)to), "2" ((long)from)
@@ -89,7 +89,7 @@ static __always_inline void *__constant_memcpy(void *to, const void *from,
 	if (n >= 5 * 4) {
 		/* large block: use rep prefix */
 		int ecx;
-		asm volatile("rep ; movsl"
+		asm volatile("rep movsl"
 			     : "=&c" (ecx), "=&D" (edi), "=&S" (esi)
 			     : "0" (n / 4), "1" (edi), "2" (esi)
 			     : "memory"
@@ -165,8 +165,7 @@ extern void *memchr(const void *cs, int c, size_t count);
 static inline void *__memset_generic(void *s, char c, size_t count)
 {
 	int d0, d1;
-	asm volatile("rep\n\t"
-		     "stosb"
+	asm volatile("rep stosb"
 		     : "=&c" (d0), "=&D" (d1)
 		     : "a" (c), "1" (s), "0" (count)
 		     : "memory");
@@ -199,8 +198,7 @@ extern void *memset(void *, int, size_t);
 static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
 {
 	int d0, d1;
-	asm volatile("rep\n\t"
-		     "stosw"
+	asm volatile("rep stosw"
 		     : "=&c" (d0), "=&D" (d1)
 		     : "a" (v), "1" (s), "0" (n)
 		     : "memory");
@@ -211,8 +209,7 @@ static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
 static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
 {
 	int d0, d1;
-	asm volatile("rep\n\t"
-		     "stosl"
+	asm volatile("rep stosl"
 		     : "=&c" (d0), "=&D" (d1)
 		     : "a" (v), "1" (s), "0" (n)
 		     : "memory");
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index 2e42056d2306..76743dfad6ab 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -86,7 +86,7 @@ SYM_CODE_START(startup_32)
 	movl $pa(__bss_stop),%ecx
 	subl %edi,%ecx
 	shrl $2,%ecx
-	rep ; stosl
+	rep stosl
 /*
  * Copy bootup parameters out of the way.
  * Note: %esi still has the pointer to the real-mode data.
@@ -98,15 +98,13 @@ SYM_CODE_START(startup_32)
 	movl $pa(boot_params),%edi
 	movl $(PARAM_SIZE/4),%ecx
 	cld
-	rep
-	movsl
+	rep movsl
 	movl pa(boot_params) + NEW_CL_POINTER,%esi
 	andl %esi,%esi
 	jz 1f			# No command line
 	movl $pa(boot_command_line),%edi
 	movl $(COMMAND_LINE_SIZE/4),%ecx
-	rep
-	movsl
+	rep movsl
 1:
 
 #ifdef CONFIG_OLPC
diff --git a/arch/x86/kernel/relocate_kernel_32.S b/arch/x86/kernel/relocate_kernel_32.S
index c7c4b1917336..57276f134d12 100644
--- a/arch/x86/kernel/relocate_kernel_32.S
+++ b/arch/x86/kernel/relocate_kernel_32.S
@@ -263,17 +263,17 @@ SYM_CODE_START_LOCAL_NOALIGN(swap_pages)
 
 	movl	%edx, %edi
 	movl    $1024, %ecx
-	rep ; movsl
+	rep movsl
 
 	movl	%ebp, %edi
 	movl	%eax, %esi
 	movl	$1024, %ecx
-	rep ; movsl
+	rep movsl
 
 	movl	%eax, %edi
 	movl	%edx, %esi
 	movl	$1024, %ecx
-	rep ; movsl
+	rep movsl
 
 	lea	PAGE_SIZE(%ebp), %esi
 	jmp     0b
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index 3062cb3efc44..1d6355227bf6 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -363,20 +363,20 @@ SYM_CODE_START_LOCAL_NOALIGN(swap_pages)
 	/* copy source page to swap page */
 	movq	kexec_pa_swap_page(%rip), %rdi
 	movl	$512, %ecx
-	rep ; movsq
+	rep movsq
 
 	/* copy destination page to source page */
 	movq	%rax, %rdi
 	movq	%rdx, %rsi
 	movl	$512, %ecx
-	rep ; movsq
+	rep movsq
 
 	/* copy swap page to destination page */
 	movq	%rdx, %rdi
 	movq	kexec_pa_swap_page(%rip), %rsi
 .Lnoswap:
 	movl	$512, %ecx
-	rep ; movsq
+	rep movsq
 
 	lea	PAGE_SIZE(%rax), %rsi
 	jmp	.Lloop
diff --git a/arch/x86/lib/iomem.c b/arch/x86/lib/iomem.c
index 5eecb45d05d5..c20e04764edc 100644
--- a/arch/x86/lib/iomem.c
+++ b/arch/x86/lib/iomem.c
@@ -10,7 +10,7 @@
 static __always_inline void rep_movs(void *to, const void *from, size_t n)
 {
 	unsigned long d0, d1, d2;
-	asm volatile("rep ; movsl\n\t"
+	asm volatile("rep movsl\n\t"
 		     "testb $2,%b4\n\t"
 		     "je 1f\n\t"
 		     "movsw\n"
diff --git a/arch/x86/lib/string_32.c b/arch/x86/lib/string_32.c
index 53b3f202267c..f87ec24fa579 100644
--- a/arch/x86/lib/string_32.c
+++ b/arch/x86/lib/string_32.c
@@ -40,8 +40,7 @@ char *strncpy(char *dest, const char *src, size_t count)
 		"stosb\n\t"
 		"testb %%al,%%al\n\t"
 		"jne 1b\n\t"
-		"rep\n\t"
-		"stosb\n"
+		"rep stosb\n"
 		"2:"
 		: "=&S" (d0), "=&D" (d1), "=&c" (d2), "=&a" (d3)
 		: "0" (src), "1" (dest), "2" (count) : "memory");
@@ -54,8 +53,7 @@ EXPORT_SYMBOL(strncpy);
 char *strcat(char *dest, const char *src)
 {
 	int d0, d1, d2, d3;
-	asm volatile("repne\n\t"
-		"scasb\n\t"
+	asm volatile("repne scasb\n\t"
 		"decl %1\n"
 		"1:\tlodsb\n\t"
 		"stosb\n\t"
@@ -72,8 +70,7 @@ EXPORT_SYMBOL(strcat);
 char *strncat(char *dest, const char *src, size_t count)
 {
 	int d0, d1, d2, d3;
-	asm volatile("repne\n\t"
-		"scasb\n\t"
+	asm volatile("repne scasb\n\t"
 		"decl %1\n\t"
 		"movl %8,%3\n"
 		"1:\tdecl %3\n\t"
@@ -167,8 +164,7 @@ size_t strlen(const char *s)
 {
 	int d0;
 	size_t res;
-	asm volatile("repne\n\t"
-		"scasb"
+	asm volatile("repne scasb"
 		: "=c" (res), "=&D" (d0)
 		: "1" (s), "a" (0), "0" (0xffffffffu)
 		: "memory");
@@ -184,8 +180,7 @@ void *memchr(const void *cs, int c, size_t count)
 	void *res;
 	if (!count)
 		return NULL;
-	asm volatile("repne\n\t"
-		"scasb\n\t"
+	asm volatile("repne scasb\n\t"
 		"je 1f\n\t"
 		"movl $1,%0\n"
 		"1:\tdecl %0"
@@ -202,7 +197,7 @@ void *memscan(void *addr, int c, size_t size)
 {
 	if (!size)
 		return addr;
-	asm volatile("repnz; scasb\n\t"
+	asm volatile("repnz scasb\n\t"
 	    "jnz 1f\n\t"
 	    "dec %%edi\n"
 	    "1:"
diff --git a/arch/x86/lib/strstr_32.c b/arch/x86/lib/strstr_32.c
index 38f37df056f7..28267985e85f 100644
--- a/arch/x86/lib/strstr_32.c
+++ b/arch/x86/lib/strstr_32.c
@@ -8,16 +8,14 @@ int	d0, d1;
 register char *__res;
 __asm__ __volatile__(
 	"movl %6,%%edi\n\t"
-	"repne\n\t"
-	"scasb\n\t"
+	"repne scasb\n\t"
 	"notl %%ecx\n\t"
 	"decl %%ecx\n\t"	/* NOTE! This also sets Z if searchstring='' */
 	"movl %%ecx,%%edx\n"
 	"1:\tmovl %6,%%edi\n\t"
 	"movl %%esi,%%eax\n\t"
 	"movl %%edx,%%ecx\n\t"
-	"repe\n\t"
-	"cmpsb\n\t"
+	"repe cmpsb\n\t"
 	"je 2f\n\t"		/* also works for empty string, see above */
 	"xchgl %%eax,%%esi\n\t"
 	"incl %%esi\n\t"
diff --git a/arch/x86/lib/usercopy_32.c b/arch/x86/lib/usercopy_32.c
index 422257c350c6..f6f436f1d573 100644
--- a/arch/x86/lib/usercopy_32.c
+++ b/arch/x86/lib/usercopy_32.c
@@ -38,9 +38,9 @@ do {									\
 	might_fault();							\
 	__asm__ __volatile__(						\
 		ASM_STAC "\n"						\
-		"0:	rep; stosl\n"					\
+		"0:	rep stosl\n"					\
 		"	movl %2,%0\n"					\
-		"1:	rep; stosb\n"					\
+		"1:	rep stosb\n"					\
 		"2: " ASM_CLAC "\n"					\
 		_ASM_EXTABLE_TYPE_REG(0b, 2b, EX_TYPE_UCOPY_LEN4, %2)	\
 		_ASM_EXTABLE_UA(1b, 2b)					\
@@ -140,9 +140,9 @@ __copy_user_intel(void __user *to, const void *from, unsigned long size)
 		       "       shrl  $2, %0\n"
 		       "       andl  $3, %%eax\n"
 		       "       cld\n"
-		       "99:    rep; movsl\n"
+		       "99:    rep movsl\n"
 		       "36:    movl %%eax, %0\n"
-		       "37:    rep; movsb\n"
+		       "37:    rep movsb\n"
 		       "100:\n"
 		       _ASM_EXTABLE_UA(1b, 100b)
 		       _ASM_EXTABLE_UA(2b, 100b)
@@ -242,9 +242,9 @@ static unsigned long __copy_user_intel_nocache(void *to,
 	       "        shrl  $2, %0\n"
 	       "        andl $3, %%eax\n"
 	       "        cld\n"
-	       "6:      rep; movsl\n"
+	       "6:      rep movsl\n"
 	       "        movl %%eax,%0\n"
-	       "7:      rep; movsb\n"
+	       "7:      rep movsb\n"
 	       "8:\n"
 	       _ASM_EXTABLE_UA(0b, 8b)
 	       _ASM_EXTABLE_UA(1b, 8b)
@@ -293,14 +293,14 @@ do {									\
 		"	negl %0\n"					\
 		"	andl $7,%0\n"					\
 		"	subl %0,%3\n"					\
-		"4:	rep; movsb\n"					\
+		"4:	rep movsb\n"					\
 		"	movl %3,%0\n"					\
 		"	shrl $2,%0\n"					\
 		"	andl $3,%3\n"					\
 		"	.align 2,0x90\n"				\
-		"0:	rep; movsl\n"					\
+		"0:	rep movsl\n"					\
 		"	movl %3,%0\n"					\
-		"1:	rep; movsb\n"					\
+		"1:	rep movsb\n"					\
 		"2:\n"							\
 		_ASM_EXTABLE_TYPE_REG(4b, 2b, EX_TYPE_UCOPY_LEN1, %3)	\
 		_ASM_EXTABLE_TYPE_REG(0b, 2b, EX_TYPE_UCOPY_LEN4, %3)	\
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index cfa18ec7d55f..1d78e5631bb8 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -87,8 +87,7 @@ SYM_CODE_START(pvh_start_xen)
 	mov %ebx, %esi
 	movl rva(pvh_start_info_sz)(%ebp), %ecx
 	shr $2,%ecx
-	rep
-	movsl
+	rep movsl
 
 	leal rva(early_stack_end)(%ebp), %esp
 
diff --git a/arch/x86/power/hibernate_asm_32.S b/arch/x86/power/hibernate_asm_32.S
index 5606a15cf9a1..fb910d9f8471 100644
--- a/arch/x86/power/hibernate_asm_32.S
+++ b/arch/x86/power/hibernate_asm_32.S
@@ -69,8 +69,7 @@ copy_loop:
 	movl	pbe_orig_address(%edx), %edi
 
 	movl	$(PAGE_SIZE >> 2), %ecx
-	rep
-	movsl
+	rep movsl
 
 	movl	pbe_next(%edx), %edx
 	jmp	copy_loop
diff --git a/arch/x86/power/hibernate_asm_64.S b/arch/x86/power/hibernate_asm_64.S
index 66f066b8feda..c73be0a02a6c 100644
--- a/arch/x86/power/hibernate_asm_64.S
+++ b/arch/x86/power/hibernate_asm_64.S
@@ -138,8 +138,7 @@ SYM_FUNC_START(core_restore_code)
 	movq	pbe_address(%rdx), %rsi
 	movq	pbe_orig_address(%rdx), %rdi
 	movq	$(PAGE_SIZE >> 3), %rcx
-	rep
-	movsq
+	rep movsq
 
 	/* progress to the next pbe */
 	movq	pbe_next(%rdx), %rdx
-- 
2.42.0

