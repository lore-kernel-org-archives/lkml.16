Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9372701B4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525185; cv=none; b=teT1Ft5H2L8wHpDdarXfmZGS+EGxSXPw1Nb2ltgaEPI4mBpnmtavY+qln874WserqT2zjDz45/EUHV0Pmo180LTUZ8S4P5z3RGZD/55aOgLuZCSfVmWEVkRIC4+q47/tzLLc8N0iD9LL3MXaF6uPkpXSZkiIYhfxfv3u2ggRB+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525185; c=relaxed/simple;
	bh=tfnfEL7qOmk4B/7adxtD8s10RKufvLbtkvnkXkzHFtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIENDiytZfbsz/w8kV7HVZOqGZH4vmkR5YCbWf6qw1oyOeDpN12+RCpG9p8yU/mx1yS5FGvOUcZsRG95s0r9KHyr7hNXdZyz5npRJDlNn7TXWC+UpJlb97XCoeNceM+EeRau7JHNOmiDffBVNnT1tjKNVjAkVbmoWUQs3n3yXVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BB0LxXGk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BB0LxXGk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440668acbf3so7143705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525182; x=1747129982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhJcuLA9lc6JwkXlygLvOeNzNKhkGSCKOxEZRRwR2Fk=;
        b=BB0LxXGkB2vTxlxsNSh1+a3ssONuOPaFw8wz8Sl8S7cuFnYZHQSnTnrK7M07LA5woT
         Y8mJGdcBLQ4yQ5FjeISc4rc+XTuT6huymtCoUWjT+GM8S5eFMmKemXXaABkEk9qbvmX+
         gSXNcb2yCHWsCzYia9+4z2t74QZxHtJlZn4gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525182; x=1747129982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhJcuLA9lc6JwkXlygLvOeNzNKhkGSCKOxEZRRwR2Fk=;
        b=mjdBUMkYBLoYmfrvcTZWuQSPw8BRMp0e1RiuSKWyVe+wJndQX0t3+J2ejUNFqca0ge
         XNe+9lEqn9FVo1ybPOLP25RDN4OYw4856owziItKtHqygQslq/DG6sSHDrgyjDtU7rK0
         ND/AkWMQacZxDBMkcFxXRX1QS8w5/IW13mmsjvPP5zqDx+NyTJCRsNjFGyO8N5eQ+1q2
         WszNC2/RZ0Uzbf5F4g2UR8y4Os4lPu8tsyL2IRZe/FJjBWfRUz7tv2A9uzmSgBeC5sfq
         pt5UErFpbzzTXd67HVRyjmIALm63HNfuC0u9FBvWd+KE2cnO3NKc9JdBMjWFX2dMkZmY
         sPsg==
X-Forwarded-Encrypted: i=1; AJvYcCUy5TN8HKF+JrgWHWA2AVjxyRdq0xQXV3Vlwi1toB8QeIjOiUHlFSJs6BypvL3ccvcUCRU6sSx8TtamUpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWPP1yMGTueRZHIVxwanngqJsqtZAQONnQp05kfG5VhuyjOL6k
	hveQYLU5a+MsF0Jh/t8PnbLG38iGI8Wg3F6WDmlSqtwCBkdOF6HMjoekHH08ew==
X-Gm-Gg: ASbGncvjUvJ3wIzhcZfpkuxz7LbINaj05TjW8XSwpcpjFizmOocvqqcbJ2gzKuLthKP
	zz1JHTQ4z1T4lw8DimAyHmhMFG+PjWaAn/r8+YYuFMzjw+b4CQ7geIMPnX1gqDmI8Umpu5seJYP
	lJjaq0zoXMcvihXxc17ohdwd5IKL9TldI8kH6lNIg7eYQCzcDvhHLhIlKxPh6rNbzw39XjJpitN
	9QS2i8Ad19d05XWJz45dWUHx9UfqOKV+JWtPocp2K9+EDvQyerXRNjr7yF0oVE9pDE+bN5ny7NU
	NzTIn9ZKKgNGCDDy8QQzZN2Rk88FrgfXejFABC4nkPcWdnHJzkY0esLa
X-Google-Smtp-Source: AGHT+IHU7272b30JufMiYFqV3ys7N1n90y66VNZEPW3djdWr2Dr7SURgKX3aokdtNYam+3P+w0HERQ==
X-Received: by 2002:a05:600c:3e07:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-441bbec0fdfmr51577235e9.3.1746525181618;
        Tue, 06 May 2025 02:53:01 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:53:01 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH 4/4] mm: consolidate VM_HIGH_ARCH_* macros into parametric macros
Date: Tue,  6 May 2025 11:52:24 +0200
Message-ID: <20250506095224.176085-5-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reduces code duplication and chances of mistakes.

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 50 ++++++++++++++--------------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b12549f0a6dce..6750020d5ea37 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -298,42 +298,22 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
 
 #ifdef CONFIG_64BIT
-#define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
-#define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
-#define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
-#define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
-#define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
-#define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
-#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
-#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
-#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
-#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
-#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
+#define VM_HIGH_ARCH_BIT(i)	(32+i)	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_(i)	BIT(VM_HIGH_ARCH_BIT(i))
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
-# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
-# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
-# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
+# define VM_PKEY_BIT0  VM_HIGH_ARCH(0)
+# define VM_PKEY_BIT1  VM_HIGH_ARCH(1)
+# define VM_PKEY_BIT2  VM_HIGH_ARCH(2)
 #if CONFIG_ARCH_PKEY_BITS > 3
-# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
+# define VM_PKEY_BIT3  VM_HIGH_ARCH(3)
 #else
 # define VM_PKEY_BIT3  0
 #endif
 #if CONFIG_ARCH_PKEY_BITS > 4
-# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
+# define VM_PKEY_BIT4  VM_HIGH_ARCH(4)
 #else
 # define VM_PKEY_BIT4  0
 #endif
@@ -349,7 +329,7 @@ extern unsigned int kobjsize(const void *objp);
  * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
  * for more details on the guard size.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(5)
 #endif
 
 #if defined(CONFIG_ARM64_GCS)
@@ -357,7 +337,7 @@ extern unsigned int kobjsize(const void *objp);
  * arm64's Guarded Control Stack implements similar functionality and
  * has similar constraints to shadow stacks.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(6)
 #endif
 
 #ifndef VM_SHADOW_STACK
@@ -381,8 +361,8 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #if defined(CONFIG_ARM64_MTE)
-# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
-# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
+# define VM_MTE		VM_HIGH_ARCH(4)	/* Use Tagged memory for access control */
+# define VM_MTE_ALLOWED	VM_HIGH_ARCH(5)	/* Tagged memory permitted */
 #else
 # define VM_MTE		VM_NONE
 # define VM_MTE_ALLOWED	VM_NONE
@@ -393,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH(9)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -406,13 +386,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH(7)
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE		VM_HIGH_ARCH_8
+#define VM_DROPPABLE		VM_HIGH_ARCH(8)
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -421,7 +401,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	VM_HIGH_ARCH_10
+#define VM_SEALED	VM_HIGH_ARCH(10)
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.967.g6a0df3ecc3-goog

