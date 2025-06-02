Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B6723A578
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875846; cv=none; b=Jfll/rl1/2MbI5dqpeKUT54kdKAehHpZm9ojj0eXV1ojJiqHhOyEwqwgrSXUcIdlX99Kj5mEmO8YnFXEVsJXX7aBpONK+dDxu450HEORqAr4JoaSu8S/NxxIQac/RF44DptaFpNdhCf2r10gUPSoRWmR5TYoAexoQjYHAqj2B3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875846; c=relaxed/simple;
	bh=iws5S7pat0zz/LR9v/TjCKdALYQwvsfWLSEuW0M8rMk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HfPw7HOb3U2RKKuSWYHPsVhNE85EBnxCmYd31jxtaR4XAkDQRpvN6eNNkvjpkyS6DYiWdn4gCfD/Oz3YBHuYUyMUaS5ZLqIIlCcXv/6cqvUxszZo6zJw2Lsdxj5KPsibCx1GZYHReSzd54XT+4tfMbjhgXnmH/nvkFAPgdQbhbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GRyYtFVj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GRyYtFVj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=OStL3zggcD6pgJqSYbkKyooYuBuqpBbUVM9TPqFQoVQ=; b=GRyYtFVjzR/0aeMSUTkAItNGSO
	AqMTbWVHnZb/4G6d1Wly6LRJC1Jb8+j9M2VCRW/TSvZwFU0YgrBrf2+byK0KygcJ5PtdruXqSdC0c
	4HvrPO6mibsbX20DZ0+C0BnarUSwFiypSk0M5gBuLMWf9KeP7nO6S5K+boMJJ0zHqlJGyVeXnodSv
	4Cduo1trG9oYXED2lmX+lxi1W/atuwbzGs0Usd9/63uQEqJkE3AqW1lJInKRx7Fl8NtbAX45vRCsa
	yuPWQqUGIvsZYbd2SntADvBRuwTdjSEu7MWoyi8kth0/mljYO9hX8xo1ApQsgcPP99sLZhbSTZU/w
	ApbqQxoA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Ul-000000011NB-3WpN;
	Mon, 02 Jun 2025 14:50:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 0E7CF301150; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144755.436183368@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 2/8] bug: Add BUGFLAG_FORMAT infrastructure
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

Add BUGFLAG_FORMAT; an architecture opt-in feature that allows adding
the WARN_printf() format string to the bug_entry table.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/bug.h |    8 ++++++++
 lib/bug.c                 |   20 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -13,6 +13,7 @@
 #define BUGFLAG_ONCE		(1 << 1)
 #define BUGFLAG_DONE		(1 << 2)
 #define BUGFLAG_NO_CUT_HERE	(1 << 3)	/* CUT_HERE already sent */
+#define BUGFLAG_FORMAT		(1 << 4)
 #define BUGFLAG_TAINT(taint)	((taint) << 8)
 #define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
 #endif
@@ -36,6 +37,13 @@ struct bug_entry {
 #else
 	signed int	bug_addr_disp;
 #endif
+#ifdef HAVE_ARCH_BUG_FORMAT
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	const char	*format;
+#else
+	signed int	format_disp;
+#endif
+#endif
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	const char	*file;
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -139,6 +139,19 @@ void bug_get_file_line(struct bug_entry
 #endif
 }
 
+static const char *bug_get_format(struct bug_entry *bug)
+{
+	const char *format = NULL;
+#ifdef HAVE_ARCH_BUG_FORMAT
+#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	format = (const char *)&bug->format_disp + bug->format_disp;
+#else
+	format = bug->format;
+#endif
+#endif
+	return format;
+}
+
 struct bug_entry *find_bug(unsigned long bugaddr)
 {
 	struct bug_entry *bug;
@@ -150,6 +163,10 @@ struct bug_entry *find_bug(unsigned long
 	return module_find_bug(bugaddr);
 }
 
+#ifndef __warn_printf
+#define __warn_printf(...)
+#endif
+
 static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
 	struct bug_entry *bug;
@@ -190,6 +207,9 @@ static enum bug_trap_type __report_bug(u
 	if ((bug->flags & BUGFLAG_NO_CUT_HERE) == 0)
 		printk(KERN_DEFAULT CUT_HERE);
 
+	if (bug->flags & BUGFLAG_FORMAT)
+		__warn_printf(bug_get_format(bug), regs);
+
 	if (warning) {
 		/* this is a WARN_ON rather than BUG/BUG_ON */
 		__warn(file, line, (void *)bugaddr, BUG_GET_TAINT(bug), regs,


