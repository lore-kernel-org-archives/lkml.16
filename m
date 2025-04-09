Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB5213245;
	Wed,  9 Apr 2025 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181967; cv=none; b=Licq5r6fQeikQx2mmBFzuBr3/1VuKKRRc0Fjv8jyQky2kliwiQZd6/OswHq5Ne/GSS57n8ynWi9ckX9TP+WVkI/9Nv5P5hTsnIR8jp9ebPF2F+8MMnZ8TOLvupI7+pYe6SYHy2BUqy/lQczalsfVfl6QfQPJ1Mfexq/jjzQQQC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181967; c=relaxed/simple;
	bh=bS8Ebl8McHMwQRP2b9+9bPhRqECSzCU5b02fcngqsqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tf2WTuFyy0Zx0eRptUSYlsW8jEV3i0jr89Ud12tMkDlsNsNZC3xkiQ68WMblVZIh4EFvE5S2a9YDWW4VPMj3CgVUrGjehNfGb3bbIjw52+hpQczTYuD5hMmdjk2mWfleUJk0l2eM/pWTr7wzja1j9++ecVfsRiyXz6xt33z8WII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZ++LZ7a; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZ++LZ7a"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224191d92e4so60807035ad.3;
        Tue, 08 Apr 2025 23:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181965; x=1744786765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=JZ++LZ7aTSDrZ/1ggSOGaz7L48YUMqxuBTwPga/dwg+QGXHUUgwCY2s9YL7dJV4XCY
         yPJDihfiF8GHEObs5+vjRKGne5rR4lvWt/BXscicgLXqBusN3EAKbjDWNZPR0HxlznSu
         CzjwpKxdKEJ+3WZwIeEcMQXq2E5GdoTVYEiarFnfaujD6XsGXpez/uhyyymm9BQaE84E
         Gv2NQccT1UtWoZM7A/HLyb/VNpVqe55dvhQhIjnuDypgAyRaBDZ3+30ZOSCopIH/g704
         +kCDAGoGK+DzjyGYAjBNUAOLM60qLoZUJoaE4PhKwcKzvaNvTvrlwPTcPOH621Y8HHDj
         vBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181965; x=1744786765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=tUeFNStu+eyCV0zH4UlU5Jhj4BarXJ5RRLMkVDQhMWNajpeEw3pttdWG+PGf2qjFEw
         SCm+wvZU/+P18fKzGApV6QMxCF2r8atN3yVdTx5aZkV0+g/NHM2xnkR0ddtuJKKqb5Vn
         /o0w67x14rlRmdqXbXw6hu1+elyLpI7zkPJaxBW6v9Ipc9UuOO1K+yB90vAUnHxJD3AV
         m83HXv/z1G8xW0Dz/ABEUR2HbHaLxj4rkOcck7YkB50cDDvQRw0SOrffHO/VqN960lfU
         QPCZIGml/Gra/FqRjwaJFjYNtGYqzTSwuS0lI+cgblz7MfRoYFHizOFdeTgCgSDyXfX2
         jM3A==
X-Forwarded-Encrypted: i=1; AJvYcCXUxSIYLya801RuMHKMsvNIHEXp+gxLw5Ag/f1Ewo7gPeeylBHLIcqwKhve9gRUM851jfzrlBc+DHbu+RjLeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysu9UtDxLRVYoamRI67Jo+d7PuZ4X38htXSJgEKPFjolVPHw40
	IX09aUlQ7hJQ1Dfmw5+MDtj0JTzjhcvgdpugOyc/a5AyniPFWPs3k5fXTm62
X-Gm-Gg: ASbGncubB9SBRJWVKC6309zlEj0h/7zY1Wu5HqaBCCVceYVmND6+etnEL/taZFOfVGa
	T4/fnRJq7COyMp3gMhO8wDOE7y/WpoK7VxBGfSH9G3sZpM8TX5QkP5C5HZCvjgEV6ZcFu6JBzRn
	xCGz2jfTwKtzCb3dGvSG01do1wFfQXRbBi3DVtLiK7PX+YgyOwCz1zEEthCvmlR+LOi5Lj4B1Kh
	RMTm2soWKH7dqfjWI+vCD12KwPSRPJyhuSX3OeY+XH3OJdqLnhH4hTbuCpGHSM1+0/c1pG7K5Mz
	GSN8nvlxiWthU37Ib7R5jPpNh6BGa0nqXJ4w/cpz+ShdPsbAu3usKBWMMAP18l8jGlWuSVHmeeE
	DS51EdStNHfcMIhq/42rvCe5HupcF
X-Google-Smtp-Source: AGHT+IH3bX9bz4NSeffRNUm1cA4jaTwLt7BuSbxQGS6DHGZ0kp+vhH5H4LqkKJt7qc/lkXgGcXJQYg==
X-Received: by 2002:a17:903:1c4:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22ac3fefc81mr20504865ad.34.1744181965015;
        Tue, 08 Apr 2025 23:59:25 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:24 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
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
Subject: [PATCH v5 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:57:58 +0900
Message-ID: <20250409065802.136971-2-fujita.tomonori@gmail.com>
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

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index f0e9acf72547..be5aef1aff9e 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -32,45 +32,42 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+# define __BUG_REL(val)	".long " val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+# define __BUG_REL(val)	".long " val " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_ENTRY(file, line, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+	"\t.word " line        "\t# bug_entry::line\n"			\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#else
+#define __BUG_ENTRY(file, ine, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#endif
+
+#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+	"1:\t" ins "\n"							\
+	".pushsection __bug_table,\"aw\"\n"				\
+	__BUG_ENTRY(file, line, flags)					\
+	"\t.org 2b + " size "\n"					\
+	".popsection\n"							\
+	extra
 
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
+	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+					   "%c1", "%c2", "%c3", extra)	\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
-
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
-
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
+#define ARCH_WARN_ASM(file, line, flags, size)				\
+	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
 
 #else
 
@@ -92,11 +89,14 @@ do {								\
  * were to trigger, we'd rather wreck the machine in an attempt to get the
  * message out than not know about it.
  */
+
+#define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(1b)
+
 #define __WARN_FLAGS(flags)					\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	_BUG_FLAGS(ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.43.0

