Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414F3BBF2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063277; cv=none; b=ZZI4/6k/dkbLfdLkvvFApDsa6VDIaITjoUKEkbO3RQJYjzY4S3scUIhRZYOmx+CHIsPm+aDMYObyb5tzDZLd2yW57S3ZW1H4DUvp0EXfkp8zacuXZ9Ea5I2EoWMSJ33VhxCOgTmKQdbNF949RzuLQhWK4m1DdWlXolxjClefj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063277; c=relaxed/simple;
	bh=hrm1XoHYPmcIOxTaq5acqqaiDDgL93uNCIUXl5UuXww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NObY8i0vv+4VdoAUEQCCQ5gVDD+aw0RCP6Vpqc9bMQs+KXGiH5O8IiwUNODo7awNNFVXW7NZXRe/X7yAeRP7ayEwK0JRRsWPGp7xGuOAvSgqEDLW7npoHmAFSmfA87RGOjsNcwLWWlJTMi4ReXWH43BCu4/g5vyzM5+gHZ1WZB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk0o+7ea; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk0o+7ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F21C4CEDD;
	Thu, 27 Mar 2025 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743063276;
	bh=hrm1XoHYPmcIOxTaq5acqqaiDDgL93uNCIUXl5UuXww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sk0o+7ea3jwRyHYTj4gK7t7OK+K+9A1ZIgIMSg4kw2YoUQslE/7URc75N775R6qvg
	 BxJV+l0HfDfOsJi9mL/mfdz/8mWymUcU2vAWELyF4hA3YJODClgkMXcUZtOsU/GSSs
	 MpGuZlJVjsqJUuavNpFmxjK+xFI7WyMhAwgGyi1al/udpeGwYAxh4ZC+zl2WRw6fsP
	 b2E5SMwq1udEhZnwLmboICYBO99DUe0+fHtKNdWcG6JmqwceeJ9HX5ezHMn5SPELpV
	 BqJVBTANF0CXjAACis3CmFbn/0kCe8mupIBESuk9FjQ0we8MUKHcdyjNy+2X+ENNpR
	 hS/7NCxvKLFUg==
Date: Thu, 27 Mar 2025 09:14:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [COMBO PATCH 6/5] bugs/arch: Wire in the 'cond_str' string to the
 WARN/BUG output machinery of PowerPC, LoongArch, S390, RISC-V, PA-RISC and
 SH
Message-ID: <Z-UI6KGxZyw4hsej@gmail.com>
References: <20250326084751.2260634-1-mingo@kernel.org>
 <20250326084751.2260634-5-mingo@kernel.org>
 <20250326085343.GB25239@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326085343.GB25239@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Mar 26, 2025 at 09:47:49AM +0100, Ingo Molnar wrote:
> > This allows the reuse of the UD2 based 'struct bug_entry' low-overhead
> > _BUG_FLAGS() implementation and string-printing backend, without
> > having to add a new field.
> > 
> > An example:
> > 
> > If we have the following WARN_ON_ONCE() in kernel/sched/core.c:
> > 
> > 	WARN_ON_ONCE(idx < 0 && ptr);
> > 
> > Then previously _BUG_FLAGS() would store this string in bug_entry::file:
> > 
> > 	"kernel/sched/core.c"
> > 
> > After this patch, it would store and print:
> > 
> > 	"[idx < 0 && ptr] kernel/sched/core.c"
> > 
> > Which is an extended string that will be printed in warnings.
> > 
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > ---
> >  arch/x86/include/asm/bug.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> > index aff1c6b7a7f3..e966199c8ef7 100644
> > --- a/arch/x86/include/asm/bug.h
> > +++ b/arch/x86/include/asm/bug.h
> > @@ -50,7 +50,7 @@ do {									\
> >  		     "\t.org 2b+%c3\n"					\
> >  		     ".popsection\n"					\
> >  		     extra						\
> > -		     : : "i" (__FILE__), "i" (__LINE__),		\
> > +		     : : "i" (cond_str __FILE__), "i" (__LINE__),		\
> >  			 "i" (flags),					\
> >  			 "i" (sizeof(struct bug_entry)));		\
> >  } while (0)
> 
> Sneaky :-) Do we want to touch up all the other archs? I mean, you
> already touched them anyway earlier in the series in order to push this
> argument through.

Sneaky how you make it sound so simple ;-)

... some time later:

 c9bb718f4d8a bugs/sh: Use 'cond_str' in __WARN_FLAGS()
 6fd6983325f7 bugs/parisc: Use 'cond_str' in __WARN_FLAGS()
 cc6f8cdc5438 bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS() and use it
 b2becbe8b469 bugs/s390: Pass in 'cond_str' to __EMIT_BUG() and use it
 8d1deb72c07f bugs/LoongArch: Pass in 'cond_str' to __BUG_ENTRY() and use it
 f4a1a3f7f1bb bugs/powerpc: Pass in 'cond_str' to BUG_ENTRY() and use it

There were like 5 separate variants of how architectures make use of 
__WARN_FLAGS(), and the 6 patches above are totally untested. Combo 
patch below.

Thanks,

	Ingo

============================>
 arch/loongarch/include/asm/bug.h | 22 +++++++++++-----------
 arch/parisc/include/asm/bug.h    |  2 +-
 arch/powerpc/include/asm/bug.h   | 12 ++++++------
 arch/riscv/include/asm/bug.h     | 10 +++++-----
 arch/s390/include/asm/bug.h      | 10 +++++-----
 arch/sh/include/asm/bug.h        |  2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 51c2cb98d728..b8b4d9f569c1 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -20,39 +20,39 @@
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(cond_str, flags)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(cond_str, flags)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
-		.short flags; 					\
+		_BUGVERBOSE_LOCATION(cond_str __FILE__, __LINE__) \
+		.short flags;					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(cond_str, flags)				\
+	__BUG_ENTRY(cond_str, flags)				\
 	break		BRK_BUG;
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS("", 0)
 
-#define __BUG_FLAGS(flags, extra)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
+#define __BUG_FLAGS(cond_str, flags, extra)					\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(cond_str, flags))	\
 			     extra);
 
 #define __WARN_FLAGS(cond_str, flags)				\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	__BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
 	instrumentation_end();					\
 } while (0)
 
 #define BUG()							\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(0, "");					\
+	__BUG_FLAGS("", 0, "");					\
 	unreachable();						\
 } while (0)
 
diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 1a87cf80ec3c..2d14d6cf21f3 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -61,7 +61,7 @@
 			     "\t.short %1, %2\n"			\
 			     "\t.blockz %3-2*4-2*2\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (cond_str __FILE__), "i" (__LINE__), \
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 34d39ec79720..a2120fbedd09 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -51,11 +51,11 @@
 	".previous\n"
 #endif
 
-#define BUG_ENTRY(insn, flags, ...)			\
+#define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (cond_str __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
@@ -67,12 +67,12 @@
  */
 
 #define BUG() do {						\
-	BUG_ENTRY("twi 31, 0, 0", 0);				\
+	BUG_ENTRY("", "twi 31, 0, 0", 0);			\
 	unreachable();						\
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(cond_str, flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
+#define __WARN_FLAGS(cond_str, flags) BUG_ENTRY(cond_str, "twi 31, 0, 0", BUGFLAG_WARNING | (flags))
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -80,7 +80,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(#x, PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +90,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(#x, PPC_TLNEI " %4, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index b22ee4d2c882..6278523dd2d1 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -50,7 +50,7 @@ typedef u32 bug_insn_t;
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
+#define __BUG_FLAGS(cond_str, flags)				\
 do {								\
 	__asm__ __volatile__ (					\
 		"1:\n\t"					\
@@ -61,22 +61,22 @@ do {								\
 			".org 2b + %3\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (cond_str __FILE__), "i" (__LINE__),	\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
 #else /* CONFIG_GENERIC_BUG */
-#define __BUG_FLAGS(flags) do {					\
+#define __BUG_FLAGS(cond_str, flags) do {			\
 	__asm__ __volatile__ ("ebreak\n");			\
 } while (0)
 #endif /* CONFIG_GENERIC_BUG */
 
 #define BUG() do {						\
-	__BUG_FLAGS(0);						\
+	__BUG_FLAGS("", 0);					\
 	unreachable();						\
 } while (0)
 
-#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
+#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags))
 
 #define HAVE_ARCH_BUG
 
diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index ef3e495ec1e3..e3d839517c17 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,7 +8,7 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#define __EMIT_BUG(x) do {					\
+#define __EMIT_BUG(cond_str, x) do {				\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section .rodata.str,\"aMS\",@progbits,1\n"	\
@@ -20,14 +20,14 @@
 		"	.short	%0,%1\n"			\
 		"	.org	2b+%2\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (cond_str __LINE__),			\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
 #else /* CONFIG_DEBUG_BUGVERBOSE */
 
-#define __EMIT_BUG(x) do {					\
+#define __EMIT_BUG(cond_str, x) do {				\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section __bug_table,\"aw\"\n"			\
@@ -42,12 +42,12 @@
 #endif /* CONFIG_DEBUG_BUGVERBOSE */
 
 #define BUG() do {					\
-	__EMIT_BUG(0);					\
+	__EMIT_BUG("", 0);				\
 	unreachable();					\
 } while (0)
 
 #define __WARN_FLAGS(cond_str, flags) do {		\
-	__EMIT_BUG(BUGFLAG_WARNING|(flags));		\
+	__EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags));	\
 } while (0)
 
 #define WARN_ON(x) ({					\
diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 834c621ab249..20d5220bf452 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -59,7 +59,7 @@ do {							\
 		 _EMIT_BUG_ENTRY			\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
-		   "i" (__FILE__),			\
+		   "i" (cond_str __FILE__),		\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
