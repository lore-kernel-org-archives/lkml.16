Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2738623A57F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875846; cv=none; b=OwbKS/Xgd0WasNqQ6wKjqQxmz8zhY4aL8brldW7g/kmagV19bliAiPbZkIOxy6lGGD8fVWaWmCJwi55ipHrxcnYXhHgIu6+VgVdfN/MOI1q3G786e5i0I9JHtHKKxXaw4XvvFaX1CaQJo4S80BJhgHcAFuwr5I9KvkPIM7HvYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875846; c=relaxed/simple;
	bh=AlHC5/BilzjrDcGhznYccIH8XOD7is6M3CUqPr7wpwE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=A9XJbEcioJTsbo/aHHclutcaBjY02Rv057ZYwV7Qs1k58AkSGJzEpSnbO+4ckRIuVo5a6cjy6NsWR170xOOz8H/jQ35PqCqOj7zkEq24t0bF5oHuwbojm/We2/1lc7QE4ytlYDfxcJTDEp6pjB5tW7Hm9sGTZHU79Ajwx6HwIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YU2tRRqw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YU2tRRqw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=wKrfLqZdE1rdriWF/jTKDOY96xBrQFlV1Ecx9AQ4XD4=; b=YU2tRRqw3bLM2010C4myNyzJgG
	q3en+Yt0lnxvHtZl9zh7g9GdXlAK/2xkCmwLVfmTKEZc7/8KEn5tyxMUEpylMwjQNHjdwosAGPgke
	Mw7NV/RxcWJAnHJpwG9crCDKY5ba0p+JsDKNZlBAaoNpo+IHCPgzDFzqj7bYWKryBJAvdS9JG8r8f
	D+b3YGzcB3HqGVl0gIcz49ePRNZxAewZFeMnbR/BMemsEVVehvkBXDtu922ABHF7DnjE6h6C2+ok0
	7tF8hcScujthX4urqF5qs4sjb+8+EDc0lqjtb5X+rGcrKMQIFGAjawcmfw56w+qcxAyBAY6LbfLrS
	OV/6RCew==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Um-000000011NC-0Rvn;
	Mon, 02 Jun 2025 14:50:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 16161302DF7; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144755.697777039@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 4/8] bug: Allow architectures to provide __WARN_printf()
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

Instead of providing __WARN_FLAGS(), allow an architecture to provide
__WARN_printf(), which allows for optimizing WARN(), rather than
WARN_ON().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/bug.h |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -94,14 +94,7 @@ void warn_slowpath_fmt(const char *file,
 		       const char *fmt, ...);
 extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 
-#ifndef __WARN_FLAGS
-#define __WARN()		__WARN_printf(TAINT_WARN, NULL)
-#define __WARN_printf(taint, arg...) do {				\
-		instrumentation_begin();				\
-		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);	\
-		instrumentation_end();					\
-	} while (0)
-#else
+#if defined(__WARN_FLAGS) && !defined(__WARN_printf)
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
@@ -118,6 +111,18 @@ extern __printf(1, 2) void __warn_printk
 })
 #endif
 
+#ifndef __WARN_printf
+#define __WARN_printf(taint, arg...) do {				\
+		instrumentation_begin();				\
+		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);	\
+		instrumentation_end();					\
+	} while (0)
+#endif
+
+#ifndef __WARN
+#define __WARN()		__WARN_printf(TAINT_WARN, NULL)
+#endif
+
 /* used internally by panic.c */
 
 #ifndef WARN_ON


