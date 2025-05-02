Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913222E40F;
	Fri,  2 May 2025 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179229; cv=none; b=NhQ5QyPTy112kg3xGwB3AaKq+b8WjttK+dtVQSln4KiP43dkdSpqUDoG7I5S+NyVIAWeq8hF1iezeQ8mGb/WjjzuemQEDpcJ41eM/gPlDHFcdCuQ/2flE/gGIyFT5o/LIqnsvLimzaEysQrECqmW1P/N3AH5ofBOsNbaRUsYin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179229; c=relaxed/simple;
	bh=mdMjqDgKLmfSj3Eltmr/eklydzSfhT7tfE+JI7T4puc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1QMVL/ufUOIy49YfS6OAspfpXQdABWkqmtgptxt026xzqTxADa/nOPZmj9HdK9d3jxCLzSU2FvwQaBAc+24+/iN3uOPUjDYQdlkkWAOKWuCXZnow/FElRAz/uIuDrao9eAbyby7B4ZX+0Fk+DxJlKdJPvWOIk7AkTjs6v4VJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkxk201Y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkxk201Y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de12bso29820195ad.2;
        Fri, 02 May 2025 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179223; x=1746784023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=bkxk201YH3Uut5tb+1fPuBIHz3CUr7XZD2WJpzZdQY0XWOQCUbghYi6+URTmlsraOG
         XSSl/WP5a6V2lrcWF+qPguFnne4/8GzSloH0xafSZanixseUV31iQKSwtyMIRi+5ibdg
         o8/s2JYokGz5nZr9P5AQ5jdhAp4onY2kNU/CzpxA25Dj7IzrdWKIRUABCu39JLGVGmU3
         Mz4xMU6j5r8HUI1gI6TuMYaNR0SehwSrizbscOxToPnk5c/tATUtRTb+Q5UFP9PVfnTg
         YpXM6lSFXyOMieHd/Tj1xbeCpmkxvdjAmgeXtmAsnEPWG7SFYU3WQ2DIIpJbyc4Bqx+X
         v3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179223; x=1746784023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=Bs5awnuDcnr0eRpcxv2mxgZAuAXL9RKZyrQ9zBmriVDWwBCwq82IR3COObgByloRq/
         CU4mor19nZdMe9Ev8tnO51JV5zAZB1naQ0FlESPKaOl1dG8Iax1anm5BssZeiuCNNaI4
         RR1EMWXH6wfGvVxacxiL0p2Cg7uHWkXTZ97uigRLTRyRkkbzB8zvfJ23xyp/q7SNXHRZ
         WZhmJGhoKjCYCQNwr87ktWI8N25Qw/uvyO4s15FzTeBzXbi29PPo/7P+/xFoV1hYQGjS
         jlfXiYQuuZIZPT6Jp3ypQBXQkO1WtRFh1NIXnPIiM3cLH415FI+wLwUdEqvCy8Yv4b4p
         a3+g==
X-Forwarded-Encrypted: i=1; AJvYcCWENypMhtsplhkQGPjex7HUCnUOy3fbmLGnTk1d4uyIondpD76pW0zExK4zTEJQR05GkAtA+13lSpONHF8byw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/g5R3kA0isMbNMT7P+k9pDEvU6SwDJguyXh/w9KsosnKTlNt
	xxdLAu5JkS5Zm2RUS0brXPYtY0ysGJyvcq1Py5YEtGLlKHz4GOGXm6iTg0sA
X-Gm-Gg: ASbGnctWsB8DJDC7g6xAS2MbALsnQULwZjAG6jpsOtD7QeQ+wBYvw5Cf0XkDkB6tpkk
	zB4R6T+O1Fkza06FRG4NvjLgQj8ubQBqZunIUfgbj+BiP5ssLPvrmFG/jRN1KuE5qZ9Ek7zo5n5
	bJxd0V/tgyxF8bLf/uoxhD4rnfioUS3VrYtIJqUH6tJId3UK2fFfwKK0BqOyGTU1nsGMTyRwr5x
	FqE0QejQUBGgmF1OrA83OzqMMT+bQ0gF2fCuTbI7UyZ2SUlrBBnIjk9dB02zu1jHWPSZZkdSyzH
	ExtbXF1ku7nbYmp45e2tU2smnaHWrXwBffhEj8PLHb11tewwduhPqDGQxsv+VBMqQC8U3oCo/YZ
	7TrI2aVeMaMmzydhB9eguJkhd1DaR
X-Google-Smtp-Source: AGHT+IG7SpxC9CYERKlra1NSwOhm+ZnosVtJEMd3hhbHfc+fF/GyvZa2L0kJpSrWYrENqsswlrl6UQ==
X-Received: by 2002:a17:902:f70a:b0:22d:e4b8:7186 with SMTP id d9443c01a7336-22e102dc24bmr40114995ad.22.1746179222992;
        Fri, 02 May 2025 02:47:02 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:47:02 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: [PATCH v6 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:35 +0900
Message-ID: <20250502094537.231725-4-fujita.tomonori@gmail.com>
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0

