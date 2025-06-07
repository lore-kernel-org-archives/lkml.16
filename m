Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717A9221D92
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290627; cv=none; b=BwF2yeROch5x+FNC+Ux/wcHFyXDQ6uUhvMuBPJ8Ho8bSWEC/oc3m2wz6gpkR3AQ7xKA8VrFf9jJqAxjcDPqhZS3SlfaKRoCZs/cjg5SDgTwLp5qT2/yydCDnQXtcofouQCgW6AjJIQyWCKxHzwohHgSwWeTM+HvxIn56k7Etad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290627; c=relaxed/simple;
	bh=v8zMrrx+Vd9rz29sYzyrTFcl+yNwirp1jzZuIPvgIiA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=B1mXz21dNASSL35Fax9YD1PD+tTAMYC4lUUPFsfHRiUDIVBVr3w3EYvJHpTbJK36qm3OuyaFis7Juon7YbZt+xkWVvGjHWybVnNN4aw0NvYye+vT6kBO1ln55xM6sN43aetHnV8Ws1OuBQ9C6N0UevzTzHcjvlE55Qgzr8MT4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TOGJsj3H; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TOGJsj3H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=43gEQOf5Sh+lovVXtaC9R0dz67eHKXNxBmPliUUAKWs=; b=TOGJsj3H7YZ5jRZHTNAbkry/3a
	lT23fbL24SYbhDlIBqComY6cRuvcDpue0l8AS95tE3jnHkadKWJ6xBXwmUHlyHH6c7jxPAcMgm+8m
	uAnN91fhSWXd/gClYm2yIYrCi+umci4ACkWoyoq/vjhCYdjB6u/CY4Kbf4VTyRrVy4vGrY/80NybD
	thar5WJQna3/eVQjRTCcR56c+VfU/uDMG35tC8c3YDhqlqBRzUyi551sO1r2y1tWHEaGKNMW8aELS
	n2y1bKy+IY2w8lqnhC0TnECThMaILP66J8NmYPRUF/5phBXiOm9jhCXJOCgfUz3GSJBrFnLw45yyX
	CdWnFPdg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOm-00000001N8k-20SA;
	Sat, 07 Jun 2025 10:03:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 597AB301CEB; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.242161830@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 02/11] bug: Add BUG_FORMAT infrastructure
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Add BUG_FORMAT; an architecture opt-in feature that allows adding the
WARN_printf() format string to the bug_entry table.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/bug.h |    7 +++++++
 lib/bug.c                 |   39 ++++++++++++++++++++++++++++++++-------
 2 files changed, 39 insertions(+), 7 deletions(-)

--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -36,6 +36,13 @@ struct bug_entry {
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
@@ -150,11 +163,19 @@ struct bug_entry *find_bug(unsigned long
 	return module_find_bug(bugaddr);
 }
 
+static void __warn_printf(const char *fmt)
+{
+	if (!fmt)
+		return;
+
+	printk("%s", fmt);
+}
+
 static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
-	struct bug_entry *bug;
-	const char *file;
-	unsigned line, warning, once, done;
+	bool warning, once, done, no_cut, has_args;
+	const char *file, *fmt;
+	unsigned line;
 
 	if (!is_valid_bugaddr(bugaddr))
 		return BUG_TRAP_TYPE_NONE;
@@ -166,10 +187,12 @@ static enum bug_trap_type __report_bug(u
 	disable_trace_on_warning();
 
 	bug_get_file_line(bug, &file, &line);
+	fmt = bug_get_format(bug);
 
-	warning = (bug->flags & BUGFLAG_WARNING) != 0;
-	once = (bug->flags & BUGFLAG_ONCE) != 0;
-	done = (bug->flags & BUGFLAG_DONE) != 0;
+	warning  = bug->flags & BUGFLAG_WARNING;
+	once     = bug->flags & BUGFLAG_ONCE;
+	done     = bug->flags & BUGFLAG_DONE;
+	no_cut   = bug->flags & BUGFLAG_NO_CUT_HERE;
 
 	if (warning && once) {
 		if (done)
@@ -187,8 +210,10 @@ static enum bug_trap_type __report_bug(u
 	 * "cut here" line now. WARN() issues its own "cut here" before the
 	 * extra debugging message it writes before triggering the handler.
 	 */
-	if ((bug->flags & BUGFLAG_NO_CUT_HERE) == 0)
+	if (!no_cut) {
 		printk(KERN_DEFAULT CUT_HERE);
+		__warn_printf(fmt);
+	}
 
 	if (warning) {
 		/* this is a WARN_ON rather than BUG/BUG_ON */


