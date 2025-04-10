Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656028A408
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310559; cv=none; b=aNzLUetCytFnYzQ09vuj2/Itn1i9Zq25rTzy+I21lkFc4A+Sxr94QrNAhsUTi9DD+4zqr0nMIBEzuo9WkRwCEMy4i6hTWR6MsnhfN6BU5N/vNmbpz5t8/l+76RhCS3ECJNGYLMxgforclNzjJzoGAJhiZgfc3zAMGnpYBCW2I5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310559; c=relaxed/simple;
	bh=cCjU0u5FLGWS5wodXQ9H/+8YnyisWfHTYC2sJInL8pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KY68g14e21AlOFdbWFe3Gi/ZJNtly/iZuJhbKSBHw6tgeQxbcAGhzRbRgJGHoYpIfcfA9cW2LlVgaHAqXS9hXJMGhETinUZjq9FLr76CulJrNFgvnAeVN4Vh18GMfoPCQQ624azXQSJp1V82wCq+LOk7Y+gJ4IbSOO4RVkW/Zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFD2C4CEDD;
	Thu, 10 Apr 2025 18:42:37 +0000 (UTC)
Date: Thu, 10 Apr 2025 14:43:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Akinobu Mita <akinobu.mita@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Petr Mladek <pmladek@suse.com>, Dmitry Vyukov <dvyukov@google.com>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: [RFC][PATCH] panic: lib: Add TAINT for FAULT_INJECTION
Message-ID: <20250410144359.526476bc@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Steven Rostedt <rostedt@goodmis.org>

There's been several times where syzbot reports a bug that was caused by a
fault injection, but it doesn't report this fact in its email reports.
The bug report could happen in code that wasn't involved with the fault
injection due to the code that faulted not cleaning up things properly,
leading to an unstable kernel, which in turn can trigger issues elsewhere
that doesn't have a bug (much like a proprietary module could do).

It would be very useful if the syzbot report notified the developer that
the test had injected faults into the kernel.

Introduce a new taint flag 'V' that gets set when a fault injection takes
place. (Note, there's not many taint flags left, so 'V' looked as good as
any other value).

This will let the syzbot see that the kernel had a fault injection during
the test and can report that it happened when sending out its emails.

It may also be useful for other bug reports.

Link: https://lore.kernel.org/all/67f67726.050a0220.25d1c8.0004.GAE@google.com/
Link: https://github.com/google/syzkaller/issues/5621

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---

[
 Currently this keeps lockdep enabled. Should lockdep be turned off too?

 Also, I'm surprised that fault injection didn't already taint the kernel.
]

 include/linux/panic.h | 3 ++-
 kernel/panic.c        | 1 +
 lib/fault-inject.c    | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 2494d51707ef..2d9048af6f89 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -75,7 +75,8 @@ static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
 #define TAINT_RANDSTRUCT		17
 #define TAINT_TEST			18
 #define TAINT_FWCTL			19
-#define TAINT_FLAGS_COUNT		20
+#define TAINT_FAULT_INJECTION		20
+#define TAINT_FLAGS_COUNT		21
 #define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
 
 struct taint_flag {
diff --git a/kernel/panic.c b/kernel/panic.c
index a3889f38153d..fec561f07ca7 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -512,6 +512,7 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(RANDSTRUCT,			'T', ' ', true),
 	TAINT_FLAG(TEST,			'N', ' ', true),
 	TAINT_FLAG(FWCTL,			'J', ' ', true),
+	TAINT_FLAG(FAULT_INJECTION,		'V', ' ', false),
 };
 
 #undef TAINT_FLAG
diff --git a/lib/fault-inject.c b/lib/fault-inject.c
index 999053fa133e..2dac4c20adc1 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -176,6 +176,9 @@ bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
 	if (atomic_read(&attr->times) != -1)
 		atomic_dec_not_zero(&attr->times);
 
+	pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n");
+	add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);
+
 	return true;
 }
 
-- 
2.47.2

