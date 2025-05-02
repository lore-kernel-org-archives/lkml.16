Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BF01DB127;
	Fri,  2 May 2025 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179212; cv=none; b=ajwp8f3fM8uVB+E2h96uullXGaVk0ocksdm/Rag0UbX59KzIHJhF2iQZILgb0ZmLsxTis6YkkWhC4yYFJSf4YGhcYgLwFYEA3VfvcuNTlnCHJZwfvt4miLGzv+I8YqxOD4+vM5tDl2TmywRAKUD29Lln4VAtpDtci9Oz6oggaCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179212; c=relaxed/simple;
	bh=bS8Ebl8McHMwQRP2b9+9bPhRqECSzCU5b02fcngqsqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glhil5KrY9K33y/KbTs56rvpyeCOHK7ElBnFQ/wAjUWBVyOaXmRrC9pIYg3XJr2q8aXz444CBM3Uf31OkFctS2WtzY44EPl9SO/vjtM24YHr3PyBQ9vLMx1mZF0E3zGWE+TXSS9oU6DSoeoNYH+IYjBYmdA2qvcqSEFX8HTz++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fN5s9ElW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fN5s9ElW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224100e9a5cso24444585ad.2;
        Fri, 02 May 2025 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179210; x=1746784010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=fN5s9ElWI/WGJu4wUclfCdAdMTRoJ38GkEkVscLWTkI7pEQXDOptXvmNlluM166+w2
         aZGhFQkcR4Oq4ZRr3jatjq8R3/FfT60hjiqYGtMOqYMWpJP0MKHZJLFEOANeM0U2ydXy
         I4L+OQQuO09K6VYgzOGsz4xyK0rgiK375y8/2v/cu6lFY2Fl0g0nU/PW1OShb8HOwJTI
         eNpPAha9QwLHdcvkkI1SktA1iCcQUcP20nUdSSA0OhnwKqqeC+9ljKGb8gVS0oaaR734
         Bv8P7+yZ8WYNGcXhDSEWiwqfinWcaTlzwJudI4iOIcompBon/IZ+XkEGOZzm1JaWQ5Di
         bdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179210; x=1746784010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=lFLkNdye/eyTezitXGgWhxdAucVtjtRfYEDknhsCn6pizGpmj1lA9OZcVEDKWNttbK
         wmTq0vA59cSrLkmWDJMl16vdDiOk1rTPpjnHEhHzgWEbTLgvZPraZp8TWpdlVqr/ISY+
         OFZZ1p9o83yvAe+zGY6qhJ4VaFr0qvH3W8Ekqs3y/vtUAuBMhHlk7iWOH6hggaoQXDNW
         XWiFd6AHnuVW8uqIOW5jhVzEQ1qYa2JjaLQHzfgWAw+HXOxKNyIc1M+Lk6LfKkjepyya
         bMsnJET4JAgjCpspenTh28W9RvlT+9ukZ9dBSCST6MG2fItnRTu2FxynfYQL/6LQN/Uf
         JJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv9B74rEikBil++1PmsFDxlumL6hiYX/hVFmVZ39QfZSV6sONhuDms2k1S1vjlsAWAp4ZGXpxpoG+v9yx+Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkw1OsOMvx35VCxLFUNgK2WLzOtnc3FFGJN07CMMuGBcsgs/iD
	3CR1OA5Ic8A4iGN9RVEQ/vJb+Cc6mvNT93iVSnU3pzGXaXXUJZPDE1BPmtVH
X-Gm-Gg: ASbGncvOmiRH2o56+3vh5nS/Pdq0bO9CJXVT+zEuXdFg/cpny7ugD3BEo2+dZYu/jJW
	pT0OqtsrbMQxdOxliDAPOYhrvtAOEG8X9aVpGpegdxrl3k+/Y6wMO2tGuOHAE4aGVHS6H4fDOI4
	wDx5Dv2pUKePrdC2MlS9KUQq/i66QBOu3eA77xRiVJdJ0LCBDu1mjXQI4pDIOus1nZduUYRs4v7
	iM88a8sopiZs2QStSDld6p/3yllUHiCNQyrZrZb/ofmuI+MGIPhKN6SpVfDIfpWYJ29ltNc7A3k
	KfG2i4isbZYGjTtfI8sqWeAw4BCVakTN14/9btZrDNJfgs2uTsG2/7nr7v9h5HDHj3q+MdBrTV7
	XtHbYXUfK/QkfjoYHTw==
X-Google-Smtp-Source: AGHT+IGNrYRWFIFxS/SMvu1kN7DhVaABG7vkSf2FsbbxwbcCnEdTvQrlp1ORF1H2Cyveec3KLO5zKw==
X-Received: by 2002:a17:902:f608:b0:223:432b:593d with SMTP id d9443c01a7336-22e1039ef34mr38688315ad.42.1746179210153;
        Fri, 02 May 2025 02:46:50 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:49 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:33 +0900
Message-ID: <20250502094537.231725-2-fujita.tomonori@gmail.com>
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

