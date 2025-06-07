Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985A20CCED
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290622; cv=none; b=tABm4ZoDpoJ9ZIbJoUR0NjJe08ohshyNSA/AePO6sr7OY27aostDmbTOyKMoufbP/q3QcLYnJeBV0Hd5ILZsLORvu2mr+G/uw/rcjhusn+14t99/oLMe0gQq3B4pdoZ7mPycU7Ijd52ulmBddoNWlnw9eZdY65c+rz1TAd0JLdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290622; c=relaxed/simple;
	bh=XHgjdAC2laFSG+IeNK9oonkhCgzlsiBnhP07D4n+jTk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=tDyIUtdwnfD3uVOWFdJB4Ba2MXJ8ffTMkH1nisGKf0q67DHLqtsuH04jifiQZHJGKUe3wG2mXvdOzo2oF2JXvAvgiKSqi+V0PrrSkqXdPMHHiY6eXfAKzy+JziJtswRBElZI9AfIFddAX2mCgIN7P9o8fJxMlq3DU9df5euaxpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E4dZswMr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E4dZswMr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=FsgPCWOPtMXCOiGM5hTLthezRlLHddx6RHfFUZthv0I=; b=E4dZswMr8tfltB9DKc6nvYZWbv
	ypV+ZKQkoxG3uFbW6w4dVhXYk9mUg5nJpxiZmPzFFGrWcxw3OoZZ6sf4T08yzfDwYvg1IhNYAOgCx
	KRSKS7pGAWSCIrv1UBYQq1tdFPaEUAiiMciSQgHNdZTOBVLwYxbDXeNPi7R9n73ChILhyMuW3sA0k
	UwUVVLQlR/7XlpphyHLfTRMXMNd0hE+kqEWBuYJmxb3rTBWxsDH/gB5Bz6H0iDMfSZxQBaeZrJeGt
	nRQprSBijQvQBjAqbgRML3kHOTdYKLUdXbUvARPekq+toHF1hX8OvGxxelE0rWyw6nIPN/qN1eRTv
	nEOXrYXw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOm-00000006HYO-3zI2;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 5D726302E73; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.351055162@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 03/11] bug: Clean up CONFIG_GENERIC_BUG_RELATIVE_POINTERS
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Three repeated CONFIG_GENERIC_BUG_RELATIVE_POINTERS #ifdefs right
after one another yields unreadable code. Add a helper.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/bug.h |   22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -30,26 +30,20 @@ void __warn(const char *file, int line,
 
 #ifdef CONFIG_BUG
 
-#ifdef CONFIG_GENERIC_BUG
-struct bug_entry {
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-	unsigned long	bug_addr;
+#define BUG_REL(type, name) type name
 #else
-	signed int	bug_addr_disp;
+#define BUG_REL(type, name) signed int name##_disp
 #endif
+
+#ifdef CONFIG_GENERIC_BUG
+struct bug_entry {
+	BUG_REL(unsigned long, bug_addr);
 #ifdef HAVE_ARCH_BUG_FORMAT
-#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-	const char	*format;
-#else
-	signed int	format_disp;
-#endif
+	BUG_REL(const char *, format);
 #endif
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-	const char	*file;
-#else
-	signed int	file_disp;
-#endif
+	BUG_REL(const char *, file);
 	unsigned short	line;
 #endif
 	unsigned short	flags;


