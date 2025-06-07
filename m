Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597EF20B808
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290622; cv=none; b=PtsnPAF0PoA5zXQZBK11x7O7YzXPy/t3xatKlX+f2M1E/vy2oF/IaSA7STDTkYdJ53joMszq5Goitz2sbF5FN1WtL70KBOb8mYuvYZ7rpY/GgLwMoohKL2aWmRG78aDBkLW/nPbOBEoo5wT6w5P9vY/KCLVTkmmj6GobAunDkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290622; c=relaxed/simple;
	bh=T+JvWQ7WmFVrrgrlaW8MxVqV6Y+CruIRIU2dHq7dkiA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=LqFQ9iGc9+lIPuQSflQ/qQGf1FcDoD1xTEF0VoGHuarGB0l4ls6oJ5yTR5slASgq6WU+tYpq5eT2AYw734Wb53NvwFqMZBjK2YdohQ6YZqAeRdbPYa9cHvfcq48dhmjWtNuDkFQQFwO3Lo3luZhGdQv4H2rWj4BweTLoCcNRw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RQIvIcmE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RQIvIcmE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=edbwZNaA+PdxQdP5/vR9WRKtGIl8nSjLytqfD3kWk4U=; b=RQIvIcmE4j7lMOw4h1jA5bl8EO
	f0bynYEarV+Th6B/8KP7dLPM4H+uf+V6l3xslklpc2wOxtae0aB8TnArJ9TDAJ4M1zhctLfhMpCm3
	pXkGyo0R6GbmuGXPVMsOzunZYmKkcn9iHEXGzArS2xF6DTXQRQm6rlx5KrEOge4z4ZEfTlj/dcaoR
	I1/MaGWfBNV4I3SVmaWMlMujUrkKGyxjf2IU3oxsaRfKoQuyVsozqPfx3JZguhmFoXdyQFyB+KUBQ
	2xwT/6Br2h5pCSKmZBglB6nwtFkCyBtmLq+NKn/HgMYHQQ4JIL18CP1WY9UMsHh/gwVB2APAwHJa/
	x/M2m7NQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOn-00000006HYU-2COt;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 771CE308630; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095619.043649140@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 09/11] x86/bug: Implement WARN_ONCE()
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Implement WARN_ONCE like WARN using BUGFLAG_ONCE.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |   14 ++++++++++++++
 include/asm-generic/bug.h  |    2 ++
 2 files changed, 16 insertions(+)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -152,6 +152,20 @@ do {									\
 #define __WARN_printf(taint, fmt, arg...) \
 	__WARN_print_arg(BUGFLAG_TAINT(taint), fmt, ## arg)
 
+#define __WARN_ONCE(cond, format, arg...) ({				\
+	int __ret_warn_on = !!(cond);					\
+	if (unlikely(__ret_warn_on)) {					\
+		__WARN_print_arg(BUGFLAG_ONCE|BUGFLAG_TAINT(TAINT_WARN),\
+				format, ## arg);			\
+	}								\
+	__ret_warn_on;							\
+})
+
+/*
+ * Make sure WARN_ONCE() arguments get expanded before trying to count them.
+ */
+#define WARN_ONCE(cond, format...) __WARN_ONCE(cond, format)
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


