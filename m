Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0157A2139B2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071423; cv=none; b=cl5BJHflEDAjpDlRux0sQcw+yQQlO6LXmBIffZuuWoU/EcgCFlxjHq8JSQC8Z9Hv8FYdjZTMH1Ex4cHU9ACoYnfMbRY0FRztX7u3bea2jDUooYJOgpEHUar4g2l+/BKBQRU5JoCPKy2+xmflG3n5nW9oSKCol4V7QlKzI73uaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071423; c=relaxed/simple;
	bh=UI09yfLxFHOEwRrp5YVkeao7N1IMba4sGY241tm5ILE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cC4nHeggvaTHnM+jR3euM7UYsO1iC02kUWznYZ3l5yC/VE+d7LyrZAJ8Gljj464WeKUjAhg3HsCHxxCGW86dfnz5bcbP5t98V656MNFZsJVXGxvMvXG8G07/hpr5eBvJdqJyOf+c3vXn8zDEpoV8WDB/QmYj52mjZnsyHgI00y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPeIb7XV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPeIb7XV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442E1C4CEDD;
	Thu, 27 Mar 2025 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071422;
	bh=UI09yfLxFHOEwRrp5YVkeao7N1IMba4sGY241tm5ILE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QPeIb7XVX4hiSnMKTW3DiI+jVsm1eaGu4OAz3ZR+Z2YWY363TqTmH1+FZaf38eSGL
	 RCPiq0ZFwdPwlZAUiYnYp3T9I8jT7KkLnCUtcsshb2xOv2yMCrfkai+j2QjmgfkPxR
	 SiDekkafBN5DZt0oeuQRFCwrMCGeHK/A3HeAFJpccRTrk4rY/qNIQuhOMlcUgveZmO
	 k+C0pVEHn5a9ac+Iw0b9AcaI7Zf6KbqsKjWqKdc931B6cC75KA6OAv0cvm0GS4M9Rb
	 yXhe7Afy3Vl0fMk17ohQxb+c1cTTU+Zy3Ej/VG5RGu863UuClEteH5VPtp7V0Cr4rw
	 6lAubRPA3ecmg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 12/14] bugs/parisc: Concatenate 'cond_str' with '__FILE__' in __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
Date: Thu, 27 Mar 2025 11:29:51 +0100
Message-ID: <20250327102953.813608-13-mingo@kernel.org>
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

Extend WARN_ON and BUG_ON style output from:

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to:

  WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410

Note that the output will be further reorganized later in this series.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/parisc/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 1a87cf80ec3c..2d14d6cf21f3 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -61,7 +61,7 @@
 			     "\t.short %1, %2\n"			\
 			     "\t.blockz %3-2*4-2*2\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (cond_str __FILE__), "i" (__LINE__), \
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
-- 
2.45.2

