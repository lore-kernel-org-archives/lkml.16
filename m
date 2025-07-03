Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E98028688E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583134; cv=none; b=iJGo49d2tkpAHpv6UAeCxwrLyV1+oTO92iWKqwoqLgZDJS3CepVRYxJUpuGYk5xEeac7iNGoVQ1vlNflq+T1EmVN0r84yk4i3UPuZfRjUNP3/pk7IgZeC3P//Bl8ecn5ZxVtSNgw6rOqaFJwpMmb2rxtAjSqfkd/Unc79skbBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583134; c=relaxed/simple;
	bh=SrbSgR8z7VAFvgNtPOHjzyUA0i8Iy37C/quNnt5Y7sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GM0FBlTKsSaCnIlNNXaalRib448mgf+Pf6hLJtTGg2QgWFnGCTeXyqkeV4ZOMNopJXrxgr3K4mX/1ElhoQlOvP+znvW5Zq9b8wCUK8V3UsIqcSvbbpt+KLvXLCCFWbXW0qtJA2s2n30sB7qbbZvdmN1QQtPLyfo2KLYgSMPt7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=sbpVjUub; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="sbpVjUub"
Received: from gem-name-lb-02.localdomain (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id C97C52112234;
	Thu,  3 Jul 2025 15:52:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C97C52112234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751583133;
	bh=hkN8L9xgqGTz5SjbY2lKznqJQajE7JkxLsFT/BgDVSM=;
	h=From:To:Cc:Subject:Date:From;
	b=sbpVjUub2Vsk1TkQ1ZGCLm706D8CpRnhbjwpwNJjcBSBcuJrcxd74qVAgZ/GzgiIL
	 Q/StG9Dr330EVko5xEjZugWVNVG1lwSRcJb8GkAmS/NwN5+dl3LnhyTU7Ot7fOXs1q
	 Oiz1spIN8L6+adLRfiB8BT4WQ/1yICoN1EeFDeWA=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	cocci@inria.fr (moderated list:COCCINELLE/Semantic Patches (SmPL)),
	linux-kernel@vger.kernel.org (open list)
Cc: Jakub Kicinski <kuba@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [RESEND PATCH] coccinelle: misc: secs_to_jiffies: Implement context and report modes
Date: Thu,  3 Jul 2025 15:51:32 -0700
Message-ID: <20250703225145.152288-1-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As requested by Ricardo and Jakub, implement report and context  modes
for the secs_to_jiffies Coccinelle script. While here, add the option to
look for opportunities to use secs_to_jiffies() in headers.

Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Closes: https://lore.kernel.org/all/20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org/
Closes: https://lore.kernel.org/all/20250221162107.409ae333@kernel.org/
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 scripts/coccinelle/misc/secs_to_jiffies.cocci | 49 +++++++++++++++++--
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
index 416f348174ca..f3241ce75a7b 100644
--- a/scripts/coccinelle/misc/secs_to_jiffies.cocci
+++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
@@ -7,26 +7,65 @@
 // Confidence: High
 // Copyright: (C) 2024 Easwar Hariharan, Microsoft
 // Keywords: secs, seconds, jiffies
-//
+// Options: --include-headers
 
 virtual patch
+virtual report
+virtual context
 
-@depends on patch@ constant C; @@
+@pconst depends on patch@ constant C; @@
 
 - msecs_to_jiffies(C * 1000)
 + secs_to_jiffies(C)
 
-@depends on patch@ constant C; @@
+@pconstms depends on patch@ constant C; @@
 
 - msecs_to_jiffies(C * MSEC_PER_SEC)
 + secs_to_jiffies(C)
 
-@depends on patch@ expression E; @@
+@pexpr depends on patch@ expression E; @@
 
 - msecs_to_jiffies(E * 1000)
 + secs_to_jiffies(E)
 
-@depends on patch@ expression E; @@
+@pexprms depends on patch@ expression E; @@
 
 - msecs_to_jiffies(E * MSEC_PER_SEC)
 + secs_to_jiffies(E)
+
+@r depends on report && !patch@
+constant C;
+expression E;
+position p;
+@@
+
+(
+  msecs_to_jiffies(C@p * 1000)
+|
+  msecs_to_jiffies(C@p * MSEC_PER_SEC)
+|
+  msecs_to_jiffies(E@p * 1000)
+|
+  msecs_to_jiffies(E@p * MSEC_PER_SEC)
+)
+
+@c depends on context && !patch@
+constant C;
+expression E;
+@@
+
+(
+* msecs_to_jiffies(C * 1000)
+|
+* msecs_to_jiffies(C * MSEC_PER_SEC)
+|
+* msecs_to_jiffies(E * 1000)
+|
+* msecs_to_jiffies(E * MSEC_PER_SEC)
+)
+
+@script:python depends on report@
+p << r.p;
+@@
+
+coccilib.report.print_report(p[0], "WARNING opportunity for secs_to_jiffies()")
-- 
2.43.0

