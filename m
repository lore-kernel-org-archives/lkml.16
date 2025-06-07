Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006E221D8B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290627; cv=none; b=U4L8ryZpnT9Ont6OC1nnseRilsbI2GndOJWH/I+pKRSChYr8y7hr/LdgvzI5LUdSdoz7vsKKvWUstQyct50pNt2wdqn41U43otkWwQxJji6GAORm4KQ2cGBPUPMu4KfzEaQWKpQYUOr4Rd7FiANGr+O99uT1YihhJApEMFCVdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290627; c=relaxed/simple;
	bh=AlHC5/BilzjrDcGhznYccIH8XOD7is6M3CUqPr7wpwE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=WJfyo1Ky8sIsaaipNWXBhUklgARPkS5QnYW5lWr5ak88PlsKkMgdkGzp9Laok3mf0sHxL/rJU3SBnw5FVSFiOwzAOC/IsYni9/aTgZjAbYSTUIPl4Qs6VlkAxrSS5Sr19GKTcG0Mq50I5Dh66jJ33C17pHCSXUHhsfFsN4fhjpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J2l+xeXN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J2l+xeXN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=wKrfLqZdE1rdriWF/jTKDOY96xBrQFlV1Ecx9AQ4XD4=; b=J2l+xeXNIS+cTAKejepdqk9hN4
	RzI/B6NAB19F5ANezCsfp32t3lpVloq42pZg35hq9w9mR9HkrSuuG3UDs9zAZpNnzhmsZFi3vpSIV
	EabGzGIap6UB6WMsidhFIreWVdyCtn5rP6Ctmhgy3BjY0DLcZ762yfEC9syTy9FSlcSr8aZ0OHxb1
	WRgha67YCsFaUCwkeVJhItbiVCL7dEO7Sa8FMEOD3ZlhYnPl1YuK9bLpFNiKtSGogzAXu6yX+6N4E
	Qv90NFqWLLim6pl0Gov6iwit63ATepy6MFr4U2WrpqR8Cus53NaB8KrR8ZQCQxMOBCc4cLTLTeGUk
	R8ue32Cw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOn-00000001N8p-1Scs;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 6B0F13080C5; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.693171271@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 06/11] bug: Allow architectures to provide __WARN_printf()
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

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


