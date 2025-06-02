Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DA23A563
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875846; cv=none; b=mnDV6jJ/ueTHZ02kniRygpualPlr//Gg0nC41/gP8xVddhJPBPPXnNfWY3TpxQrdg+hkP/37drwkOOWqbyHwop0gXSZ5QrER00TzuMDyIjIWNNzgyLgzmU0sHK8ZRIdH8QYFGsoyjQ+PArn12PwVFa0X2pU28fcmXUXgWCxeOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875846; c=relaxed/simple;
	bh=ZBz5QvEz+12dQjO6oD9ugRiWPAe9RqXA9VqmCk3NIZA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=UlvVoHIG2uC3mrVOVheMlcN4uPRd82B+CAbxFKczRC3lKf6ziIPpNOJC/3+il/sgryeNzcgTxm7Is+uCCkrRkIt2lXV6m6r7ECA+nv6VYdlihHdLYJH8S0SMPbOeCjhN02ZpzTakQ++YKGE81dLD49KyF/9ZjEh8G1oqeAGbTeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=swj7ZRcS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="swj7ZRcS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=/BnzbZewuJowStjNBBWDV4qAQq+n+zc+/95pnGIzIL0=; b=swj7ZRcSogAfSES7mGimNVmXGB
	Itg/w2bwFsgTDdu/7v/PjuCx/Zs52PAeEyDJ3he2DUoe9Jxy2Z4fVmXxVI1r+RWHH2SqPt4D6FAeY
	JjszsoueoXJK8O7LtY+jw0dM4BkhhUOBETK6w3QOeWo6y2uoXWdsGFPoUCZcO62sFrQXh7r5LKSFl
	Y9JOfFtfGx+ViiWM1QLGc4TYVgjwYD05cFMQuTf3Rv1Z6Ck+qWJjwcKN7YCc/Aa27q82Q8x829Kz4
	XRR8lvWLr6O1xhx+XHWgURxPYw9uHN45/ad76cgMxrw6NYK4NVn3LIX/01IooKu/1hzdp0N5c6DQc
	s/pzc4zA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Ul-000000011N9-3Q4Y;
	Mon, 02 Jun 2025 14:50:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 0A63E300F1D; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144755.319275437@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 1/8] x86: Provide assembly __bug_table helpers
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

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


