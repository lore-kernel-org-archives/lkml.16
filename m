Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ACD23A58B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875845; cv=none; b=WQ6/yvujkhlmGzFKM/hwNeeoAJ5vBya5uzWvdFQjhnb/vY3GE6mMHq8y8FdKdLmoi/37aGuojVAU+nUQr4JN/2alsaXDdi5aMU0/y9Lt5cAcZZnVD0I8IdbFLAvZOmlvR1WXvageKVfPAf7dUMqF4/KtH3zUMlSz3Di+/74Ter0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875845; c=relaxed/simple;
	bh=XHgjdAC2laFSG+IeNK9oonkhCgzlsiBnhP07D4n+jTk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dmB0yCDdmjfl18K5IW3BEZprg4Za9DRx15fmW2SfvjLfMmmuOQUym+gd2essLR2eFQcTER+kTYBsXS4jnfqtv8XFji1Xs04CzDMkJpB0j4xMtEJVw90VkQq4R8l2qD+wo9k8U3aFcUtRYI65ivnraBGRqX4FDNgjWBPsRyQsoEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=snYhyp0w; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="snYhyp0w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=FsgPCWOPtMXCOiGM5hTLthezRlLHddx6RHfFUZthv0I=; b=snYhyp0wRMgcdyeu2g/blxn8kP
	C70VpnaYjagDZ4mlVRDmLRv+g3q6d8nscaFmo7LO82Z2Hkt0SC/ptWaFB6gBhjOcSkkfFp6v5YOfD
	3AEibv8IK0KzfwRx6V4mDy3dkmFBpJPjF9EvyinIQOlIfMn0FSLRAJvxgy5EQhZ+abTqUTsFKffIC
	XsKedK3h19aX8x7rNZ4HSjtblyM1EyuHJoloLxuByD0PM/RYGqt8RaxfnK70iX0cbQpYuVQEjCtKc
	vb4wiB/yPHpSNKROAM01HyHQSAUjUUNF1fmWgrT+7y3SgJGic+5awHZCFgUJWRdfSN+nDXy4Cj+XR
	q/Sohjuw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Ul-000000011N8-3VMo;
	Mon, 02 Jun 2025 14:50:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 11EC1301BD5; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144755.587938101@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 3/8] bug: Clean up CONFIG_GENERIC_BUG_RELATIVE_POINTERS
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

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


