Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC322367B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375953; cv=none; b=WTgma7jo9CfHk7q0RYe4ZEdg+rlrTxanhAI1QpVl75KR9GypDPExiP5XQJHtL1t/DLkSdO8tLzywMXRWvVZTkGhqRc52gcAcysm8YqJzTWKr0VP7fKK9Ra1DocPV0OlQ1EsZRN8DQH1PJt3Z0vkTHmUZte3rveh3s6wpsZWWAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375953; c=relaxed/simple;
	bh=Hlkr+Fr5bIE+JllI2fVPn+Bax58tQEJQDnKpMIuMjeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RxlsnpSjYcyn+CZWHXGAuKjrdySY3EwPx4DIVTifhWV2XC+2UXBAZtUmoD1i22dlOvx8OY+nbhAOB+qWT2bYmPP12CopQeAmsIE5JvYWyMo+LipX374O2CciD5nnohMIdl/i/5xjRRn1wSwOLp8A746i5Rnhy+ByWU+cUhiCA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5707C4CEE2;
	Fri, 11 Apr 2025 12:52:31 +0000 (UTC)
Date: Fri, 11 Apr 2025 08:53:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Akinobu Mita <akinobu.mita@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Petr Mladek <pmladek@suse.com>, Dmitry Vyukov <dvyukov@google.com>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: [PATCH] panic: lib: Add TAINT for FAULT_INJECTION
Message-ID: <20250411085355.118180b4@gandalf.local.home>
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
Changes since RFC: https://lore.kernel.org/20250410144359.526476bc@gandalf.local.home

- Add if () around pr_notice_once() to only set taint once using the logic
  of the print once. (Andrew Morton)

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
index 999053fa133e..cc551ee9c125 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -176,6 +176,9 @@ bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
 	if (atomic_read(&attr->times) != -1)
 		atomic_dec_not_zero(&attr->times);
 
+	if (pr_notice_once("Tainting kernel with TAINT_FAULT_INJECTION\n"))
+		add_taint(TAINT_FAULT_INJECTION, LOCKDEP_STILL_OK);
+
 	return true;
 }
 
-- 
2.47.2

