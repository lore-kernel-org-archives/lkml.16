Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E3522A4CD;
	Fri,  2 May 2025 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179219; cv=none; b=DxSlKOK1jdURQHk1t2dpDPA6s+SNwVTRjJI1aOIpmT6fA4QzZB8Bbnqhu8j6nkNnjgTj5TH8jSFG8GsbUTQlFYKeAiV6ysFNyA0LTeNR0FyzTnLyyqQcnL1LH4OpxV5Xw44Yd6nGDSzYPsdt1/1hibd/NRtsnq9EmTDdIE0OkGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179219; c=relaxed/simple;
	bh=+7XITjewWSl80gT0zr6uyJXg8p1d67Yg7lRhbz4DBTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVa5qpYoSgjrxa28QITn0VyjhRZPGrklx8ul7xfrLrh9t135jRMJmDHAf7keBnC9kE7Sp4vJAftHZGzNxrnXA/yhfgArbaZLXJr1lF/wlvgXW4sUlSzYurcu5gQFwgiayYTsYjdmQqRSXVuNrCM5qblzNO4NLweVMd4qgyfrI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZIXOho+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZIXOho+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so27533665ad.3;
        Fri, 02 May 2025 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179217; x=1746784017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=IZIXOho+OMZPO1ErWSYQrt909bFHk0eww5yRS7TI22/ZrOHayoDNuBbZjI5IRmbNVK
         Wmtna5cL8KBlmabyIOtMYTKgC8BlhgsqG4VUvLc5vF/MwcG7BnIt9HNqEyHYHwtrp7WO
         ahyEhO58r8AtSUuHUF/wOdHB5qBe7m4/kqLYuwHD/FnRKIp60PlGONIAe0rwSIPJF6PO
         2qVu3ZRbME5myeX9rovlVhCKfpDPhQR+xvDIEfmPTFrQlDK9HvqQ40nLle/TEq2yIQlM
         cTQQHMphvonljQ48XC+Ik2fclWlO39A63LDQVPIg/o9o3hVpJuQnf/2SYFlym5IDw4MY
         egkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179217; x=1746784017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=GlfCkofxSB7fSCZ4EuMC/KuH+rBEdWvLdCGhlgHXCD2VnTAU1RlHzal6sML6r8Stdw
         goiEHuPIgHFRLk0eVEANwxgAA6+rfdGdRExhykV9YuNRKu8QQcBjqsiI6yJ14YqK3/+b
         mch5K7UO4a8a0Vf3u/qGrdBiJzLLaHD8l8A3t8vHWYrILx7qGI+/SKnrLmZA60MRtQ4z
         G6K5nQFIBG3P2rViSNaej1Uy7PbdrenRmr9c+zmChh4TRwAq0e4bLw6iyqvHKx8BNVUd
         H836Lb1+OSXYqSSZ9K5/4bLZ41vXCCTdFpFaIwqOzXVcFEfwFXt+YajKNaHMyY6HHUe9
         d5KA==
X-Forwarded-Encrypted: i=1; AJvYcCU4z8ioupqtUhcvTCvEOw8Xs32MYht1BUbz4THitsnk2rFVEjDAH3WkOS38nhS7qBXTCLmyhPuNEPxt/p+9rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wcleNEHSDxgQPJ29bzOiYLThW26xKiraw29BUwddsY5EmH8B
	TdhAoQOwua7UTu598bNjMFFYbb/s1Xihx+FSa039qp+Z02hAvWlkhMUpmSWC
X-Gm-Gg: ASbGnct4s9hpwBMdBzD58rsyO0EIGkEf+ITBnbSPP7p1V+ErCDhnwhnVqi8DGbRiS21
	GUwD3pq4s2QSPzZt91EJ+h0IK3WgKy3MvXCqWgu5RosVYBpopudi7voRx9l3TqCH3G4bZ0Gy1Rb
	oOJCubXR772bkIDYQbS+IZUV6iNhU5W8XpcDyfumldr5fzaJWpJFivVh3PO+6s2crtq6MLjl7G1
	cUy/aquX/NFMkPwRU/vcgsb/yUxkbvLMlMgXEXHGtDVgv8FsqYG1PzTmCEWH/YbKFF2YrGy5d9v
	QKrPO+K1uU/xvwtE+kz9NiSIHCasuO0y3CtbL+I7DaoGe1OXe0rLcBvSo4jsvIc6SuVhvyj74bO
	tDWck6okKiyen5foI5A==
X-Google-Smtp-Source: AGHT+IEhuS4VGYIBGVglTshr93vZldL1f6oYsKTf904LeEzffsUEpPtdIRnpOF3hALskrUWmu2hnrQ==
X-Received: by 2002:a17:902:cec8:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22e102f707dmr33312405ad.30.1746179216668;
        Fri, 02 May 2025 02:46:56 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:56 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:34 +0900
Message-ID: <20250502094537.231725-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
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

