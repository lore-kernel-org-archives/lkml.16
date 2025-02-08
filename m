Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3743F14D2A0;
	Sat,  8 Feb 2025 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002788; cv=none; b=hSWgUVfN+wchxFAbyE95/unPw+evj8Z+4bcw0c3wk8spZqqUzNi9hgN4ePFrx7wrNhCGcU2LnGfcbqWOBXqiyaH0+fb91p/uy6+gYVcSCsxMJZb+VTuIhIN9t6tH2eEuNB8nUAf1lpNQtEGHbZuCZIM4BQvsP632gE98PZWIw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002788; c=relaxed/simple;
	bh=D2KnIHQ35G0H8tfTbdtvlSGwvd26273FdqwPQ2qiruk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGiMTFWm/FDU/283zL9bt5N4Usf6IxRsgHX8y+Kbn4oGtB2qsYafiv7CGlZr8Yo3KlBznQDzGOgLu/sbcVARa2SqiE6aXcxx/QaJScGigEdRnx8APre73Vvvglg12aR6xXHMVDHc+tR9E6SjkhOv/nyQtMMMMm32gDF2fC4iDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lp+MHX/X; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lp+MHX/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=hTnYo
	CbtAHJuj+1pZO3ETrOF4oFMJtTo1AW6yi1Oyx0=; b=lp+MHX/Xgtvc+9j8XlU9V
	kAwtapYwiO7IFBoxc2cvE9B+ytuSx8kAmLenWZDFjK1qNI7emmDa/xPslhs9h8Sg
	DlH6RUuL9eGQL6S/yjyh23XrfkN0smJMseH2L5OrTkgYk8bN/OumC95ST2cUbsIY
	yTu7j1K4LHeLvT8j0tQGqI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCn+j1bE6dnLGKVKw--.38986S2;
	Sat, 08 Feb 2025 16:18:40 +0800 (CST)
From: Jiayuan Chen <mrpre@163.com>
To: rdunlap@infradead.org,
	bagasdotme@gmail.com,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Jiayuan Chen <mrpre@163.com>
Subject: [PATCH v4] docs/arch: remove deprecated function name
Date: Sat,  8 Feb 2025 16:18:32 +0800
Message-ID: <20250208081832.121337-1-mrpre@163.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn+j1bE6dnLGKVKw--.38986S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1DGry3CryfXw1DKFyfZwb_yoWrGFWfpr
	ZxJF93Jr4DXryIv34jvw4xury3Ar4kX3W3Jw1kGr15u3Z8Xw1avr43KF12va4Uuw1rAayY
	vr90vr1DJan0y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX4S7UUUUU=
X-CM-SenderInfo: xpus2vi6rwjhhfrp/1tbiWxLtp2em+wcgPAACsg

print_context_stack() was removed in 2016 by commit c8fe4609827ae
("x86/dumpstack: Remove dump_trace() and related callbacks"). Remove
the now-inaccurate guide.

While at it, also link to Ingo's explanatory message.

Signed-off-by: Jiayuan Chen <mrpre@163.com>
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Jonathan Corbet <corbet@lwn.net>
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>

---
V3 -> V4: Made changes based on Bagas's suggestion.
V1 -> V3: Made changes based on suggestions from Randy and Jonathan.
---
 Documentation/arch/x86/kernel-stacks.rst | 60 +++++++++---------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
index 738671a4070b..4cb68433272d 100644
--- a/Documentation/arch/x86/kernel-stacks.rst
+++ b/Documentation/arch/x86/kernel-stacks.rst
@@ -112,41 +112,25 @@ Printing backtraces on x86
 ==========================
 
 The question about the '?' preceding function names in an x86 stacktrace
-keeps popping up, here's an indepth explanation. It helps if the reader
-stares at print_context_stack() and the whole machinery in and around
-arch/x86/kernel/dumpstack.c.
-
-Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
-
-We always scan the full kernel stack for return addresses stored on
-the kernel stack(s) [1]_, from stack top to stack bottom, and print out
-anything that 'looks like' a kernel text address.
-
-If it fits into the frame pointer chain, we print it without a question
-mark, knowing that it's part of the real backtrace.
-
-If the address does not fit into our expected frame pointer chain we
-still print it, but we print a '?'. It can mean two things:
-
- - either the address is not part of the call chain: it's just stale
-   values on the kernel stack, from earlier function calls. This is
-   the common case.
-
- - or it is part of the call chain, but the frame pointer was not set
-   up properly within the function, so we don't recognize it.
-
-This way we will always print out the real call chain (plus a few more
-entries), regardless of whether the frame pointer was set up correctly
-or not - but in most cases we'll get the call chain right as well. The
-entries printed are strictly in stack order, so you can deduce more
-information from that as well.
-
-The most important property of this method is that we _never_ lose
-information: we always strive to print _all_ addresses on the stack(s)
-that look like kernel text addresses, so if debug information is wrong,
-we still print out the real call chain as well - just with more question
-marks than ideal.
-
-.. [1] For things like IRQ and IST stacks, we also scan those stacks, in
-       the right order, and try to cross from one stack into another
-       reconstructing the call chain. This works most of the time.
+keeps popping up. Here's the explanation, that helps when the reader
+stares at printk_stack_addressk() and its callers and pays special
+attention to the 'reliable' parameter ('?' basically means that the
+address is unreliable).
+
+The answer can be found in the comments within show_trace_log_lvl() body
+in arch/x86/kernel/dumpstack.c::
+
+    /*
+     * Scan the stack, printing any text addresses we find.  At the
+     * same time, follow proper stack frames with the unwinder.
+     *
+     * Addresses found during the scan which are not reported by
+     * the unwinder are considered to be additional clues which are
+     * sometimes useful for debugging and are prefixed with '?'.
+     * This also serves as a failsafe option in case the unwinder
+     * goes off in the weeds.
+     */
+
+For more information, see also Ingo's email. [1]_
+
+.. [1] https://lore.kernel.org/lkml/20150521101614.GA10889@gmail.com/
-- 
2.43.5

