Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B10213236
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071417; cv=none; b=O60eWNHzny7auyvBt+vBx78Ox3zD3SAEk3JHHmrPTm4McbVLVZQCH49BkliOe3GJW4zvu3mjvPMtXakwW2ASiTiNweznYr0C/aiNBGxxQ2XIlD78d4uyvbQXVTLlEYqIh9tjvdjTUwJYp3UQv826bts2TxKqxucLUqYeJMdHh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071417; c=relaxed/simple;
	bh=D0EBAcu5h+E8B+tSkeOpT9HaAEV4VC97bQRYTcVTptc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1Jaxlw8id0Zr/k6qiFf0hvvRRcjsD7wqHTR85iwaw0YSs7GZGZzGl7YQhPUOJQtNky802FM48J+WTpty939ODhm3llQbs5vwQACfcVQoZCjfEanZHiGhcEQJDo1jEUV3LZ8AWTeqQ8qr1Ra72aFtRvmrgvVpRCVyk0mJHJstho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzDu2Qv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzDu2Qv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A630C4CEEA;
	Thu, 27 Mar 2025 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071417;
	bh=D0EBAcu5h+E8B+tSkeOpT9HaAEV4VC97bQRYTcVTptc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pzDu2Qv2Ne4ETr45QNd/lejf5XS8AsdaB+5e/DnVUb84LXYboqIYSRxNVzK1KOh+7
	 48RZjO3bmLtk3g85wyCGOxr/xNsw4ljOS3Y/VcS73MtJi+RWht52DUrv9XmLhd8brI
	 9ddtjHDIsSJEHlcNdTphsmmYoaV2hy7T1wmeynrsu1UDaXnJzuzqG29Og9NsQnYaBs
	 Ubh+HE8VDAfT/6jQ+5yGc5lgjo/kvLKLSWqyBeZonhhdN+IoejO5T1KkQgyHppDNZS
	 Llvr3eT4m37/H+4N0wvVExZsVXvLOA/z3Ks4x3yc/hxAOd9oo/pi3pECnIIse0LqNy
	 Q8hIAMRKDj9zg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 09/14] bugs/s390: Pass in 'cond_str' to __EMIT_BUG()
Date: Thu, 27 Mar 2025 11:29:48 +0100
Message-ID: <20250327102953.813608-10-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass in the condition string from __WARN_FLAGS(), but do not
concatenate it with __FILE__, because the __bug_table is
apparently indexed by 16 bits and increasing string size
overflows it on defconfig builds.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/s390/include/asm/bug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index ef3e495ec1e3..30f8785a01f5 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,7 +8,7 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#define __EMIT_BUG(x) do {					\
+#define __EMIT_BUG(cond_str, x) do {				\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section .rodata.str,\"aMS\",@progbits,1\n"	\
@@ -27,7 +27,7 @@
 
 #else /* CONFIG_DEBUG_BUGVERBOSE */
 
-#define __EMIT_BUG(x) do {					\
+#define __EMIT_BUG(cond_str, x) do {				\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section __bug_table,\"aw\"\n"			\
@@ -42,12 +42,12 @@
 #endif /* CONFIG_DEBUG_BUGVERBOSE */
 
 #define BUG() do {					\
-	__EMIT_BUG(0);					\
+	__EMIT_BUG("", 0);				\
 	unreachable();					\
 } while (0)
 
 #define __WARN_FLAGS(cond_str, flags) do {		\
-	__EMIT_BUG(BUGFLAG_WARNING|(flags));		\
+	__EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags));	\
 } while (0)
 
 #define WARN_ON(x) ({					\
-- 
2.45.2

