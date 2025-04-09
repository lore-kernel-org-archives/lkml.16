Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAD214814;
	Wed,  9 Apr 2025 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181973; cv=none; b=qoMNMxGIpa8teeVPSga2Phpm6INRc712mrZEPt6Sm5wjwvkK0Zop3O6iytX71mR27j6qvQV/yhoRFUFIWSAgyiqqyh7Rd3mD6tCnmFjI7YeGZ35o17veQhZjMTI4UGcA68bPsEv0zJ6D1XQ6kE615f4M1eO3ru++8qTj+pqxv38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181973; c=relaxed/simple;
	bh=+7XITjewWSl80gT0zr6uyJXg8p1d67Yg7lRhbz4DBTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMNRhTOR5AHgYwEOzlwvP0yDC9ZTTy0Lrtz7E4vxMdjivmteZb+HMYg9omYYPYVdkine633rILHWprMFr+AHzqaEVUD4p1yr2LMoDdx5/zdOBmwt2x3r1R6eD7cv1sw5bZX0ftI49EKCZDGeWH1IyRYCKhKKN/0FPo9BBK5zjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS1585OA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS1585OA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2264aefc45dso82019595ad.0;
        Tue, 08 Apr 2025 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181971; x=1744786771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=RS1585OAbzYtHApNpm7Brvx9P8pmJGMXfkg4cpTRviSWosVUWQIeOiCRi03mKyS101
         BLOKd84YD4v3TL11QW+u3hZ8FrTHHaWejqD4TzqfCmZrN/5w1moFWhWSU0r4ZSIeOe6q
         DrKPnb6rMlDcduMhbRwgUCqXxTaQq9VFhqj0qJVgLTsPaY/ui2nZY43OldKX5ZTXs6/k
         g4rA3bLBwhg/udARX7q+hnt9Xq1OUP6JXwvvSlXQFnyZQz70v1jIV1q4OGoUkML5KRc9
         ZZwLxyLpyJcgObHqo74OGYZaZb2K4yDK5bIpXWc/rk+ZVE5RHneOJmV/pvojk8CmaHkV
         JjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181971; x=1744786771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=STu1HcY31XO2+5b3ebNA/Ym1deqXU2zu0hIQRc6b81CKQH4KHgZV6TkMKtTLaxvVuV
         SDSYBp8UE3Vtrcnclt5ae9WaLUscLUgA3GN9o4ORRsZK1Pxg0YPOLEsLCHHFJAhNCWYl
         U0ce7Bo7NGsqgDq0thTHj7/7GgJHVe3hkrTA5cW0xZr8qmbYaqC1s328tYcJBIXvFXVv
         KfvDhMdZuhLepNV08xhHYzKsxyH/oGYCJXG+ecmeWEcBownBaey9sXX+/Hoi/HM8pFV8
         bYn3PLar8uEXaZDvOj1GhmvM1cgNGPrZ+PTia3X8gK3DB+MxKx3C+rTPA4iSDWmDXMNN
         W9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUwOr5jPohcndl0DNSfTUgOuZXNVagCIXbX2+u28D8YrOAXmQV0591KmawIBHKeLhQk13E2H01wz4eOdCgt1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC105/rSrKJNlg9fj6SXwCJOBa2QcVGQIwAuC37uldMiLt7kW5
	+8dOMUA+FYNrGKe9NNTgdOMm9TfrV1c2yOsbohr/Szg40xhjSUrPGzhUIF29
X-Gm-Gg: ASbGncuWoPe8DLRBrFZykup0En/KEzs8cxCPrDNGFafqOt9zMsx3E455io17kZmyH18
	HcJ78Oo8rJYQ/3mt6cfKVb8Wy0TRafIgA7EG5u1T/Nfb1TfjXug2h0fg9W3fK9vLmaF2xp3WFSz
	j3ynDPQm0z5vj/PfP5NsW/Wd7M5HZZIr2ZE/S6cdr+cRaL7HyhkzdZgUHyAwTg7mNsJYIq3x2XM
	PjkcgaqWzXC/uNvNLphLBXk1DpcdU4SWanIu6UTgiMXNQjimLIZCF4p3OzoRPQFDzNYpoeoNJqd
	wNvUQAn+/0GRx/ciLRyGwXOCnXiQdTRHcqFaA4GaPl/8GGJxxPwfv559hyJnWLAogS1UHzZ2r/G
	JQS5yeLMIhDvYCyoFvA==
X-Google-Smtp-Source: AGHT+IEZwYUbsTySsEIFtv1t72KELbYqxAXDutiQgzwO8B7QSQ1bxP4LPNczP+kdX8pWrESjGbTSiA==
X-Received: by 2002:a17:903:2b0c:b0:223:52fc:a15a with SMTP id d9443c01a7336-22ac2a1a9c8mr28742785ad.33.1744181971392;
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v5 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:57:59 +0900
Message-ID: <20250409065802.136971-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409065802.136971-1-fujita.tomonori@gmail.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/riscv/include/asm/bug.h | 37 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6ab13b56feb0 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
@@ -78,6 +83,8 @@ do {								\
 
 #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
 
+#define ARCH_WARN_REACHABLE
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0

