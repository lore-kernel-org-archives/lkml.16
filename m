Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E3221DAA
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290627; cv=none; b=WKZIv4bbiI+PNZwk2bK7lGUE0fxFIfTEHhvPoiPiYpls281lFJXeVfBoGKPoXSM4S9IOEXGTb7zG7sunYAGr/RM/dBYZOgg+btwAs/xQW9j4OhwU2IyRPPKVmMH1nwfhc3He7hkR3tjfL2G6lOnzcO8lDJ5PEjNQ6GT6dIHcgeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290627; c=relaxed/simple;
	bh=pzeXDym4rFlxHjUM6lGvSJYOh9Z77wjccIHNhVRkSls=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=El1y/HZfEhbBGnsrdSzrW3igzXaQokcuZxfKCu4S54ZlnQiu3LWBmRMXOGopgaCpb9RBtj/E3z/k2/eC5KvVymnfj/YL5FnqbjvDr3i+C/HQcVL2A4Z6uKSobijfyjYe+hjOjObuPb+/O5mF3RWCW/5TZQs6RGWXXNAbINQxgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P4Uz4zpd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P4Uz4zpd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Ug06c8Cdy3MYSSIJrDSMvpOcTWe0AbJenyAnmifWbVM=; b=P4Uz4zpdUG6I2yEQwojTqCkehf
	pHWVxSh5VoaRtoCNQTpiBd16erIzVVsciXQ6pgkOCG6WRE5Zs5SNb4848MJLQPbl8uylj1hP5Eoet
	76vk8fpiLqBeRANLDluv8Xvo6hvYn0ooQQw/7D/XLdu+GmmKSYpzqPBBw7aoV3ubpVQroeC7tMqTB
	bu6YDOn6n7SpIHPTJ0tE/JgGBQG61cuUbP/YCewVUuQrd53p20tUcVLW51wQYLCbm6ht1ZmL4eGpV
	NASynuCtstkeOAx2pYzME0XiUYxabVKwdnt/u3bwmStmSN503P8y9RKvajyyDVwf5u+wSE/mPlxZy
	l2MUJBKw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOo-00000001N8v-0IKw;
	Sat, 07 Jun 2025 10:03:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id A5E1A308661; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095619.270604632@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 11/11] x86_64/bug: Inline the UD1
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

(Ab)use the static_call infrastructure to convert all:

  call __WARN_trap

instances into the desired:

  ud1 (%ecx), %rdi

eliminating the CALL/RET, but more importantly, fixing the
fact that all WARNs will have:

  RIP: 0010:__WARN_trap+0

Basically, by making it a static_call trampoline call, objtool will
collect the callsites, and then the inline rewrite will hit the
special case and replace the code with the magic instruction.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h    |    5 ++++-
 arch/x86/kernel/static_call.c |   13 +++++++++++--
 arch/x86/kernel/traps.c       |    4 ++++
 3 files changed, 19 insertions(+), 3 deletions(-)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -114,9 +114,12 @@ do {								\
 #ifdef HAVE_ARCH_BUG_FORMAT
 
 #ifndef __ASSEMBLY__
+#include <linux/static_call_types.h>
 struct bug_entry;
 extern void __WARN_trap(struct bug_entry *bug, ...);
 
+DECLARE_STATIC_CALL(WARN_trap, __WARN_trap);
+
 struct pt_regs;
 struct sysv_va_list { /* from AMD64 System V ABI */
 	unsigned int gp_offset;
@@ -145,7 +148,7 @@ extern void *__warn_args(struct arch_va_
 #define __WARN_print_arg(flags, format, arg...)				\
 do {									\
 	int __flags = (flags) | BUGFLAG_WARNING | BUGFLAG_ARGS ;	\
-	__WARN_trap(__WARN_bug_entry(__flags, format), ## arg);		\
+	static_call_mod(WARN_trap)(__WARN_bug_entry(__flags, format), ## arg); \
 	asm (""); /* inhibit tail-call optimization */			\
 } while (0)
 
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -26,6 +26,11 @@ static const u8 xor5rax[] = { 0x2e, 0x2e
 
 static const u8 retinsn[] = { RET_INSN_OPCODE, 0xcc, 0xcc, 0xcc, 0xcc };
 
+/*
+ * ud1    (%ecx),%rdi -- see __WARN_trap() / decode_bug()
+ */
+static const u8 warninsn[] = { 0x67, 0x48, 0x0f, 0xb9, 0x39 };
+
 static u8 __is_Jcc(u8 *insn) /* Jcc.d32 */
 {
 	u8 ret = 0;
@@ -69,7 +74,10 @@ static void __ref __static_call_transfor
 			emulate = code;
 			code = &xor5rax;
 		}
-
+		if (func == &__WARN_trap) {
+			emulate = code;
+			code = &warninsn;
+		}
 		break;
 
 	case NOP:
@@ -128,7 +136,8 @@ static void __static_call_validate(u8 *i
 	} else {
 		if (opcode == CALL_INSN_OPCODE ||
 		    !memcmp(insn, x86_nops[5], 5) ||
-		    !memcmp(insn, xor5rax, 5))
+		    !memcmp(insn, xor5rax, 5) ||
+		    !memcmp(insn, warninsn, 5))
 			return;
 	}
 
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -31,6 +31,7 @@
 #include <linux/kexec.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
+#include <linux/static_call.h>
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/bug.h>
@@ -209,6 +210,9 @@ static inline unsigned long pt_regs_val(
 }
 
 #ifdef HAVE_ARCH_BUG_FORMAT
+DEFINE_STATIC_CALL(WARN_trap, __WARN_trap);
+EXPORT_STATIC_CALL_TRAMP(WARN_trap);
+
 /*
  * Create a va_list from an exception context.
  */


