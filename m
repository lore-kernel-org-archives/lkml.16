Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78B23184E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875846; cv=none; b=A9TRSXWbdNI0yXJUXL9JejXrzyTELnzz9J8Ty599na74Mg9q+7Mcu0pOAPNnASNB0gqNjICC+Tmyh2VisHGcHC81KwPZHywxAxxWG4WDkt+aH5NtrY0HCVtD8feIzew6WbUZNRxGayVpn1P/Wb68JmGc3U1Si2OcXaU8d/ZZLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875846; c=relaxed/simple;
	bh=6kJOAUMsc8HMgjMagf9vgDotplayYfY4AFfDZsHcSmY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=H8NJT0Gr+Cjn7dSzCpdXCQJaJzH+vJK47wxzcfgkS8b4doyQ9Zg6OUmKjv+UGHfGaLrgV/tZ2j18u45ARwwCfFoulO0TOXO8j2xl/zpoY2x0r3OzuwS7qcuA3Ena6klj9oQG5MW+wN1zODauoqydHTbiIhp8S0FTjWk5hQqrRs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bvSCWL3r; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bvSCWL3r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=DvFqRm8nJWnpEZYnj31LHs5A6jeWMzNqCfexDa7UTTg=; b=bvSCWL3rbcP/5zrmeJK5+LopSU
	FX/UoL5CFwgr+ssrNks2ylCATPfZYSGOY7xq/FTvwAnr7fYhx7D5wIvGRYw7yAFdepB4ArYY9Nqr0
	fYPfTrEQKR8sn0qIdsEVZF11CmO0V977hop8oOO6Q6yEcGtQVhspdVNNtqSQqk0N7mLCmUYZ9xlHG
	bRW9uqvwi0x1/+6tchmDI3m4eYrH5K7lHyyDThXY3D7KmElFjX7OLw9KFrCeCCy88404QJueVq9qW
	MYVWtLU/xY0wO1DNDIrxwTpYoP2umZLSKgfyGaEJRdM6jJWOPb9X1NrH4AyOby7zzC8iSES8nAY4d
	8MQI8jng==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Um-000000011NH-1W48;
	Mon, 02 Jun 2025 14:50:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 19ADA302E73; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144755.811500537@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 5/8] x86_64/bug: Add BUG_FORMAT basics
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

Opt-in to BUG_FORMAT for x86_64, adjust the BUGTABLE helper and for
now, just store NULL pointers.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |   22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -31,6 +31,7 @@
 
 #ifdef CONFIG_GENERIC_BUG
 
+
 #ifdef CONFIG_X86_32
 #define ASM_BUG_REL(val)	.long val
 #else
@@ -47,22 +48,35 @@
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
 


