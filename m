Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5979A20A5F2
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290622; cv=none; b=afJaSZDDSawLiJqCGTdg7tQM0zmZ7HEbeoJ1FdXOASqeURVVeMw2/zpwCBaNeR91g5reuUWQs+v+fJEiDdLeBIUgpwFch+wzgfMCxh87sEHL/QzFFB7TeRK8gbXc5WprNcfkSpmf3anX6bRq2oSEm5imiQoU+gFrbak29aNW2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290622; c=relaxed/simple;
	bh=ZBz5QvEz+12dQjO6oD9ugRiWPAe9RqXA9VqmCk3NIZA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Wvs1oP6vTE8EIVSmGR+JJRu8KIuGZp3/j4khxdN/kRbE8a1ENFRBmYZbwGDnlI+gpgPGkZJ67oyhTCMJqhdYRt6ixNpDrpNqGOP2gOBEvbfTawL4QYmxVR+ExRsdSA7KagAC/5iGoMtYnYW2Ja4WbVi+92YNTJEOqjU8hT05Sxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IgbMJ8t/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IgbMJ8t/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=/BnzbZewuJowStjNBBWDV4qAQq+n+zc+/95pnGIzIL0=; b=IgbMJ8t/Knibv7fPlZsAKW0LCY
	cnSv4xH7O2tTUWoFoRhDmc+ggXjSRSR6U76yXEL5nO4TgeD5eFwNNJ6lUDr045qcCx2+SJPDObkDd
	yZGCmapkotYl62WkvpoveKtIFOV/yeM9C6Ahm6QSany8+nQUCWaSclgIjFy3ulCACcZbtfEgMUXHo
	sHGfjrZxSmW1KYP0zOM0xfnK85QfbbmA6Q1B9NOwuVkCNsM8MSR6wXbDkEHX4XaP4O/no2e3N/Pc6
	TVBgIJZqMQuEdwDYkOA1SXjKudRExauG/KTEanCvaT0tvzmg0DL7dH/EuqH+T8kGD2s2SiS047q/I
	hratTBcA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOm-00000006HYM-3w6z;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 55A0B301C9B; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.117023224@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 01/11] x86: Provide assembly __bug_table helpers
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Rework the __bug_table helpers such that usage from assembly becomes
possible.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |   54 ++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -32,46 +32,40 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+#define ASM_BUG_REL(val)	.long val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+#define ASM_BUG_REL(val)	.long val - .
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define ASM_BUGTABLE_VERBOSE(file, line)				\
+	ASM_BUG_REL(file) ;						\
+	.word line
+#define ASM_BUGTABLE_VERBOSE_SIZE	6 /* sizeof(file) + sizeof(line) */
+#else
+#define ASM_BUGTABLE_VERBOSE(file, line)
+#define ASM_BUGTABLE_VERBOSE_SIZE	0
+#endif
 
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
-			 "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
+#define ASM_BUGTABLE_BASE_SIZE		6 /* sizeof(bug_addr) + sizeof(flags) */
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
+#define ASM_BUGTABLE_FLAGS(at, file, line, flags)			\
+	.pushsection __bug_table, "aw" ;				\
+	123:	ASM_BUG_REL(at) ;					\
+	ASM_BUGTABLE_VERBOSE(file, line) ;				\
+	.word	flags ;							\
+	.org 123b + ASM_BUGTABLE_BASE_SIZE + ASM_BUGTABLE_VERBOSE_SIZE ;\
+	.popsection
 
-#define _BUG_FLAGS(ins, flags, extra)					\
+#define _BUG_FLAGS(insn, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
+	asm_inline volatile("1:\t" insn "\n"				\
+	    __stringify(ASM_BUGTABLE_FLAGS(1b, %c[file], %c[line], %c[fl])) "\n" \
+			    extra					\
+		     : : [file] "i" (__FILE__), [line] "i" (__LINE__),	\
+			 [fl] "i" (flags));				\
 } while (0)
 
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
-
 #else
 
 #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)


