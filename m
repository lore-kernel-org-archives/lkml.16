Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5990D20E03F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290623; cv=none; b=F2nXu5k6Tg+p3goih+fBNIeDdcXUxk+J1BwO9gx7LV8bQyZUkLMeRSr1hPJXVJ98T2YTF6RFxOMKyy9dfASXHmJlQgmitofdLwE3wFWuCKIPY9Ar/uH/brNKR9VAeDWG256sCE5VwPuel37cic7pbOtTJF4f75Z+JTsYOmebhdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290623; c=relaxed/simple;
	bh=bvzPl/K+tGdRuxnSs4jCh9Mtfh9hDwOZoQ9j5n6ecec=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=WwQWqMqxW/8UeVG3CnMAMVAH2b0V28QLXlfdLProa61viefDTpcG0z8+xRVMBx1K8Mtpx9fCdRlxdukjOagvtAJprm31Zg888Lh+Hk6qrpOSdmw2YqJB9GbHLX95I8U9Uy2RX9Q1+5kf07ncUS0tmWR+JCb33JplhGDI+ulx3Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BPDpqhJ7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BPDpqhJ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=4BupnHa0sKslSms4QWZa2Ba2ZbtsDMMo1DuTgRU2pls=; b=BPDpqhJ7yPrRavEYrPht5fxYtn
	X/OEXdDE4zbLO0SrkAhaTV4HzZ8RA38AEGdGlPd6xwmWjdGRn8SmlLcWJCurryAUHJ7OtmW81AhlV
	c/LiFWANaJXnMz44gynNkdMw+wRrqS34+w2ZtFOFFHPYSjtQ4SoU2x6/dT194jY9MhAvBkDE+QIwp
	JOx/pxbS0y6np40LWz3BW8OWMMnDDDILTlR9fNerMMbGglwwOGaCoc/ZFk3LkINYwIYcElhmBkbFK
	Y+y3admdJqkNBz053DVq8GXh+rzn+TVi8hxHs4UK3QJFEOetp3oUWDvgFWLVqQBwLpeW8wiohRlbo
	oa8WK6eg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOm-00000006HYN-3xis;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 61898302E7A; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.472060044@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 04/11] bug: Add BUG_FORMAT_ARGS infrastructure
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Add BUG_FORMAT_ARGS; when an architecture is able to provide a va_list
given pt_regs, use this to print format arguments.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/bug.h |    1 +
 lib/bug.c                 |   17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -13,6 +13,7 @@
 #define BUGFLAG_ONCE		(1 << 1)
 #define BUGFLAG_DONE		(1 << 2)
 #define BUGFLAG_NO_CUT_HERE	(1 << 3)	/* CUT_HERE already sent */
+#define BUGFLAG_ARGS		(1 << 4)
 #define BUGFLAG_TAINT(taint)	((taint) << 8)
 #define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
 #endif
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -163,11 +163,23 @@ struct bug_entry *find_bug(unsigned long
 	return module_find_bug(bugaddr);
 }
 
-static void __warn_printf(const char *fmt)
+static void __warn_printf(const char *fmt, struct pt_regs *regs)
 {
 	if (!fmt)
 		return;
 
+#ifdef HAVE_ARCH_BUG_FORMAT_ARGS
+	if (regs) {
+		struct arch_va_list _args;
+		va_list *args = __warn_args(&_args, regs);
+
+		if (args) {
+			vprintk(fmt, *args);
+			return;
+		}
+	}
+#endif
+
 	printk("%s", fmt);
 }
 
@@ -193,6 +205,7 @@ static enum bug_trap_type __report_bug(u
 	once     = bug->flags & BUGFLAG_ONCE;
 	done     = bug->flags & BUGFLAG_DONE;
 	no_cut   = bug->flags & BUGFLAG_NO_CUT_HERE;
+	has_args = bug->flags & BUGFLAG_ARGS;
 
 	if (warning && once) {
 		if (done)
@@ -212,7 +225,7 @@ static enum bug_trap_type __report_bug(u
 	 */
 	if (!no_cut) {
 		printk(KERN_DEFAULT CUT_HERE);
-		__warn_printf(fmt);
+		__warn_printf(fmt, has_args ? regs : NULL);
 	}
 
 	if (warning) {


