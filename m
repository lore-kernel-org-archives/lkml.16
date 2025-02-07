Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D2F1E1023;
	Fri,  7 Feb 2025 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738932985; cv=none; b=FovbCdwpZ6Q3a1ArNMPo2g6+xqxARaqZgIQJOhLy9vnQaW12RYWAP8n+ywh6VY6pRkb/+g5PKHh9ZVnb0LPL4880gov4fuRjbzp0PAoEbUJ4/Hx6AuyXE7pxyOCdRzrExV0lauYZ87elAHFnVjn18BjrlQAsEPFNrfxXxavBOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738932985; c=relaxed/simple;
	bh=mqACu9h0OAQ4CRSazX2X4bX1MXuArhK+5x7TwSckoew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jwj62Acx8Ewbixx0EE6QHHwc9txawkG00VXjPET0OYDJNweMJM7OeADRtZd5qiPxjim9m1dVyhdrV9SG34cbSODxXlwcJu7EC1D/fm7KqSoBsTly1J/fQdgVXvVcZj8mZfagWSvmVjYWP2vJaMxvPnHxkCl7pqHVnG3l9wbwncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Hjlkaiz3; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Hjlkaiz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6Ekvy
	V02O3WxbJ15gIoZ3zQm8U5+cIFYX3HYbe9GxHY=; b=Hjlkaiz33wS+c7HSEPGAC
	AS51WaeifDMhhL6nIvRGZmI6lisQuRe9yhnpPbbstxeD4r3a/0xLFtwk2eccvrEh
	usy1Rs2i1yuagW5uFcpju5t7Mxq+HJSz0jCBr9MyEnBdHeMSFkho1uDuB3kbZM7E
	Sk08ZEEbVxcsLO9smWSm0U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3F4muAqZn8JUPKw--.7159S2;
	Fri, 07 Feb 2025 20:55:11 +0800 (CST)
From: Jiayuan Chen <mrpre@163.com>
To: linux-doc@vger.kernel.org,
	rdunlap@infradead.org,
	corbet@lwn.net
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Jiayuan Chen <mrpre@163.com>
Subject: [PATCH v3] docs/arch: remove deprecated function name
Date: Fri,  7 Feb 2025 20:55:04 +0800
Message-ID: <20250207125504.728688-1-mrpre@163.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3F4muAqZn8JUPKw--.7159S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4fAw18Ar4DAry5WFW8tFb_yoW5KF1Dpr
	ZxJas3Jr4DXFy0vw10vw48ury3Aw4kXF1UGrn7Kr15uwn0qwnFvrW3KF1ayFyUur1rtayY
	vr90vr1DWws8JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zZg4U5UUUUU=
X-CM-SenderInfo: xpus2vi6rwjhhfrp/1tbiWxnsp2emAZIO9QAAsg

The dumpstack.c file has undergone many modifications, and the
print_context_stack() function was removed or rewritten a long time ago,
so it's better to remove the incorrect guidance.

I also want to preserve the original contributor info by keeping email
address and name.

Signed-off-by: Jiayuan Chen <mrpre@163.com>
---
 Documentation/arch/x86/kernel-stacks.rst | 51 +++++++++---------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
index 738671a4070b..45b7a225da11 100644
--- a/Documentation/arch/x86/kernel-stacks.rst
+++ b/Documentation/arch/x86/kernel-stacks.rst
@@ -112,41 +112,26 @@ Printing backtraces on x86
 ==========================
 
 The question about the '?' preceding function names in an x86 stacktrace
-keeps popping up, here's an indepth explanation. It helps if the reader
-stares at print_context_stack() and the whole machinery in and around
-arch/x86/kernel/dumpstack.c.
+keeps popping up. This provides guidance about it. It helps if the reader
+stares at printk_stack_addressk() and its callers and pays special
+attention to the 'reliable' parameter ('?' basically means that the
+address is unreliable).
 
-Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
+The detail about '?' can be found in the comments within dumpstack.c:
+::
 
-We always scan the full kernel stack for return addresses stored on
-the kernel stack(s) [1]_, from stack top to stack bottom, and print out
-anything that 'looks like' a kernel text address.
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
 
-If it fits into the frame pointer chain, we print it without a question
-mark, knowing that it's part of the real backtrace.
 
-If the address does not fit into our expected frame pointer chain we
-still print it, but we print a '?'. It can mean two things:
+You can also get more info from Ingo's original emal. [1]_
 
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
+.. [1] https://lore.kernel.org/lkml/20150521101614.GA10889@gmail.com/
-- 
2.47.1

