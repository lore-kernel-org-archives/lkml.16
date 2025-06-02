Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26323A98D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875847; cv=none; b=t29j4Qi3TGP26q/UtmYZ+StP3R2z72/mYBZEFNyF6oCq1X7KixujmhzAAcmnLQ7nzbt6wwYrRSKRQhz6Rpse5ezaJQzdGhwdeqf/72BJ+GSRvJK+EtwhX2FYCQzoMs6h7KpbhYgEjRSRRVru2B4EURO+wNH6Gh6LOOxK4o/H4R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875847; c=relaxed/simple;
	bh=M1wLJ1U2IZQ/RGJmUXq4UWuL9Ig+iV4SJMa9/urbS4Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=YGApS6aBbVZRd4vqdZ2eP5yYjxBNPyG61uqM+aa/R9ZBl5DzG3gd74Dc5F3As254oEZ+l1m1T6ArEy/OOs2umjfh9s/EAOJ0RIeSsrUGma8+MFd6Fx79Nymbn/5cOz7NE4jTXHbHjjqxL6ab74iqQT+obJ/HcniFdCw9JslbTJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i8+o/+Sk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i8+o/+Sk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=KP9pjzaD1fczEPNzXY+jMudoniTkbuwzTKsHu5JGUxM=; b=i8+o/+SkQ7eZP5OV3+dbLM4jGd
	SPuVnoxfbkAHop3/jqAPfTlzNo24bL2t03Mbphu5r8Df1ZBj8zUptSJSkwm160oEOyazMhmls5ruL
	L+1DS8CP1UfM0rvnL1kYYkDsNeBZoHKSFj0p6YwB9zVtXpzQEzKNrLP847hCtgzDQufMMKYXt2ExH
	4lsM+4uCaRfLdbJKyKJXyboOwsKl4vCSMQMKda+IWIFpQU6fEq7yOR4Ia7jmB/HAiX8hA3V3LfdXB
	V4cafA/C5byk+zTZQnUHv/d7vyceMVZU5Gh4szBen7BmHrHL+ttIkSUwuxUkoer6ZW12nIL5sv9HW
	A6Yuxyxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Um-000000011NI-1Sg6;
	Mon, 02 Jun 2025 14:50:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 20EA7306573; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144756.054408110@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 7/8] x86/bug: Implement WARN_ONCE()
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

Implement WARN_ONCE like WARN using BUGFLAG_ONCE.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |   28 ++++++++++++++++++++++++++++
 include/asm-generic/bug.h  |    2 ++
 2 files changed, 30 insertions(+)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -221,6 +221,34 @@ do {									\
 #define __WARN_printf(taint, fmt, arg...) \
 	CONCATENATE(__WARN_printf_, WARN_ARGS(arg))(BUGFLAG_TAINT(taint), fmt, ## arg)
 
+#define __WONCE_printf_0(flags, format) \
+	__WARN_printf_0(flags|BUGFLAG_ONCE, format)
+
+#define __WONCE_printf_1(flags, format, arg1) \
+	__WARN_printf_1(flags|BUGFLAG_ONCE, format, arg1)
+
+#define __WONCE_printf_2(flags, format, arg1, arg2) \
+	__WARN_printf_2(flags|BUGFLAG_ONCE, format, arg1, arg2)
+
+#define __WONCE_printf_3(flags, format, arg1, arg2, arg3) \
+	__WARN_printf_3(flags|BUGFLAG_ONCE, format, arg1, arg2, arg3)
+
+#define __WONCE_printf_n(flags, format, arg...) \
+	if (__ONCE_LITE_IF(true)) __WARN_printf_n(flags, format, arg)
+
+#define _WARN_ONCE(cond, format, arg...) ({				\
+	int __ret_warn_on = !!(cond);					\
+	if (unlikely(__ret_warn_on)) {					\
+		CONCATENATE(__WONCE_printf_, WARN_ARGS(arg))(0, format, ## arg); \
+	}								\
+	__ret_warn_on;							\
+})
+
+/*
+ * Make sure WARN_ONCE() arguments get expanded before trying to count them.
+ */
+#define WARN_ONCE(cond, format...) _WARN_ONCE(cond, format)
+
 #endif /* HAVE_ARCH_BUG_FORMAT */
 
 #include <asm-generic/bug.h>
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -155,8 +155,10 @@ extern __printf(1, 2) void __warn_printk
 	DO_ONCE_LITE_IF(condition, WARN_ON, 1)
 #endif
 
+#ifndef WARN_ONCE
 #define WARN_ONCE(condition, format...)				\
 	DO_ONCE_LITE_IF(condition, WARN, 1, format)
+#endif
 
 #define WARN_TAINT_ONCE(condition, taint, format...)		\
 	DO_ONCE_LITE_IF(condition, WARN_TAINT, 1, taint, format)


