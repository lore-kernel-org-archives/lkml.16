Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973A1FF5F9
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290624; cv=none; b=Y3VbqIezws29wmdk4guS6ZXxgwr+R0UH3kXkvpCzP073O0/pNdyXdloYtraCU/+ELFJOER8kWGUsQ1VlrGYBtnNX6z9cPaZtnMR/gsFIvbz0KbWR0PGQfeeTyPctJImZB4Izs/zpsL+wgIYhGdbI7moWkdDr0e+7cioSqiyWnck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290624; c=relaxed/simple;
	bh=5sy30kFCGlSsC+wcNavLpzVxQNtjwE3zUA9dFLSA7SU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Nxu95yElERI6Pzt0K/p32ibCEtDfCRm0fx9UFt5yUWM0BvM32jdLRP6x+7j3CO/qjZxhEhRa2Tl9D3vSnildo438MU2qixrrMgCCTHpTmTPtIBIVjUNRamHEgHH/V1NyOipxcTGZlouwncanvWYVrqgmtUzfkcwcOcHYKyqjKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W3KRxsim; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W3KRxsim"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=/r3tohHa+5hLiNWumHkrIOwUIWZ21d8ljkkGSu3hNUU=; b=W3KRxsim5sdZGqkN5Q2mHKYjyC
	n9Omj0k17av+YRV16hwxyr9oNkfoPcQTtsk+4AuU0T9PTtupIVZl0pVW3sRFSqu9xD8sttt6YYD17
	ezrylgJ8HotfAP8KWFTNoHoICik1bk5JE6+7Jetm5C7/w5roz9gbB/fZPkXWqzqGvHitJTk82xYIb
	1jgYOeqdy9XrRywQbghvFkj1pOqvJDTztDzoridQiXYEMdB8jvxFBKfDAFZvbTF5cPE+Qn132Ty0b
	/naqWfG650cU+WGw58y4zwSh+rA2NyJ0iXywGk657AAc2ln4dsN7TikRane47eTAQjKFoPbsvu908
	cKG6Tffg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOm-00000006HYP-3ucD;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 6EA0F3085FC; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.822433827@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 07/11] x86_64/bug: Add BUG_FORMAT basics
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Opt-in to BUG_FORMAT for x86_64, adjust the BUGTABLE helper and for
now, just store NULL pointers.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -47,22 +47,35 @@
 #define ASM_BUGTABLE_VERBOSE_SIZE	0
 #endif
 
+#ifdef CONFIG_X86_64
+#define HAVE_ARCH_BUG_FORMAT
+#define ASM_BUGTABLE_FORMAT(format)					\
+	ASM_BUG_REL(format)
+#define ASM_BUGTABLE_FORMAT_SIZE	4 /* sizeof(format) */
+#else
+#define ASM_BUGTABLE_FORMAT(format)
+#define ASM_BUGTABLE_FORMAT_SIZE	0
+#endif
+
 #define ASM_BUGTABLE_BASE_SIZE		6 /* sizeof(bug_addr) + sizeof(flags) */
 
-#define ASM_BUGTABLE_FLAGS(at, file, line, flags)			\
+#define ASM_BUGTABLE_FLAGS(at, format, file, line, flags)		\
 	.pushsection __bug_table, "aw" ;				\
 	123:	ASM_BUG_REL(at) ;					\
+	ASM_BUGTABLE_FORMAT(format) ;					\
 	ASM_BUGTABLE_VERBOSE(file, line) ;				\
 	.word	flags ;							\
-	.org 123b + ASM_BUGTABLE_BASE_SIZE + ASM_BUGTABLE_VERBOSE_SIZE ;\
+	.org 123b + ASM_BUGTABLE_BASE_SIZE + ASM_BUGTABLE_FORMAT_SIZE + ASM_BUGTABLE_VERBOSE_SIZE ; \
 	.popsection
 
 #define _BUG_FLAGS(insn, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" insn "\n"				\
-	    __stringify(ASM_BUGTABLE_FLAGS(1b, %c[file], %c[line], %c[fl])) "\n" \
+	    __stringify(ASM_BUGTABLE_FLAGS(1b, %c[fmt], %c[file], %c[line], %c[fl])) "\n" \
 			    extra					\
-		     : : [file] "i" (__FILE__), [line] "i" (__LINE__),	\
+		     : : [fmt] "i" (NULL),				\
+		         [file] "i" (__FILE__),				\
+			 [line] "i" (__LINE__),				\
 			 [fl] "i" (flags));				\
 } while (0)
 


