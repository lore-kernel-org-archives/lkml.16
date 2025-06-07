Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBE222173F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290627; cv=none; b=avJ0kOEu/z5siaHeXmAWtt9UGG37BSBBCWzavknRwBDS4V+jkJXGEZrRdPbCiZVOzZQ4O6XJMNUmT8uV8CrhJ+rL2E7kNJH3WTA+rlY0zubHVQpCl2HPDXcU3um7pU2VC8GR2WlvF4GM36OOk0HiOUz/UrPU0If8s4yn06zRL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290627; c=relaxed/simple;
	bh=hygQNXQ+xhB4b9/63ywu2opaPSkxb9cfn8zgZzY10U0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=VqdasYL9rWIgHTeqhsKESAriqVMQy6DlS9FUZmpoiulwYYUClfYcMPl3Jg9nnYBTwWMsQBqAI8extYvWem1CtoW2OohNElQ5XKQzEQ0ELP0JMjvJdhoKoGWYqssKvVN0VyLt/vftOJ8z5HC0N7DUwjkI/ete7Ddw+rrVFiZTAko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UNE1h+zY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UNE1h+zY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=o64h18BSiLruIN1YC6ldxQoJNaHV4cyR4p9OeFqd4Ag=; b=UNE1h+zYQay17U+eDLrvRg+Hcq
	GwSPa3utMsXnHIuYOz4DZmV4IiSVt667Bk9uV/rg8OXbn7turNtTjXTOIW4zi/xz10r5V/7+1TO5F
	USAnjMgIWMIH0dthR/h+go7u1dH3x4I3Ek10d3OcU2bJHeU8gltoOfK2MgRTR8dPwanmtnHGysSQo
	lnobTuuQ63leuZRiPAdlKIszsQ3U+6+tSprcrs5tRyGFPxcaz1hB5QWfo4tyn5epZDJGUpJIYtTIE
	MnkfAkNMvNVxPgybOirU6b4jHKoEJ9tDJWT4omT+MgJG/84X/uS5WZeGJCnlmmhN2GSbc+nDjleAo
	O5TRzwGw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOn-00000001N8o-1PU9;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 6616F306573; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.584065098@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 05/11] bug: Add report_bug_entry()
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Add a report_bug() variant where the bug_entry is already known. This
is useful when the exception instruction is not instantiated per-site.
But instead has a single instance. In such a case the bug_entry
address might be passed along in a known register or something.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/bug.h |    1 +
 lib/bug.c           |   32 +++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

--- a/include/linux/bug.h
+++ b/include/linux/bug.h
@@ -42,6 +42,7 @@ void bug_get_file_line(struct bug_entry
 struct bug_entry *find_bug(unsigned long bugaddr);
 
 enum bug_trap_type report_bug(unsigned long bug_addr, struct pt_regs *regs);
+enum bug_trap_type report_bug_entry(struct bug_entry *bug, struct pt_regs *regs);
 
 /* These are defined by the architecture */
 int is_valid_bugaddr(unsigned long addr);
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -183,18 +183,20 @@ static void __warn_printf(const char *fm
 	printk("%s", fmt);
 }
 
-static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
+static enum bug_trap_type __report_bug(struct bug_entry *bug, unsigned long bugaddr, struct pt_regs *regs)
 {
 	bool warning, once, done, no_cut, has_args;
 	const char *file, *fmt;
 	unsigned line;
 
-	if (!is_valid_bugaddr(bugaddr))
-		return BUG_TRAP_TYPE_NONE;
-
-	bug = find_bug(bugaddr);
-	if (!bug)
-		return BUG_TRAP_TYPE_NONE;
+	if (!bug) {
+		if (!is_valid_bugaddr(bugaddr))
+			return BUG_TRAP_TYPE_NONE;
+
+		bug = find_bug(bugaddr);
+		if (!bug)
+			return BUG_TRAP_TYPE_NONE;
+	}
 
 	disable_trace_on_warning();
 
@@ -244,13 +246,25 @@ static enum bug_trap_type __report_bug(u
 	return BUG_TRAP_TYPE_BUG;
 }
 
+enum bug_trap_type report_bug_entry(struct bug_entry *bug, struct pt_regs *regs)
+{
+	enum bug_trap_type ret;
+	bool rcu = false;
+
+	rcu = warn_rcu_enter();
+	ret = __report_bug(bug, 0, regs);
+	warn_rcu_exit(rcu);
+
+	return ret;
+}
+
 enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
 	enum bug_trap_type ret;
 	bool rcu = false;
 
 	rcu = warn_rcu_enter();
-	ret = __report_bug(bugaddr, regs);
+	ret = __report_bug(NULL, bugaddr, regs);
 	warn_rcu_exit(rcu);
 
 	return ret;


