Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B6214205
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071426; cv=none; b=dOc9G14SOXT1/QYIrSv6X3ap3ZluBSE+vqr+YsYfGnNX1n5vlVJ1Fvi3JcOIE/wQFS6xJ+XoNIhIbQ6j63kEWgzBVregf6TjNc/x0b6S/csV2sthQydV3FqeQTEqM17SUKDDexra26/p/lZfoZHpE4Jjbn4T7CC9uAsN9R0l9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071426; c=relaxed/simple;
	bh=JZmwNsDqLZxIgq2TSsWv+OrlfHD4sc+gRut+0sfnc0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iw5rZiTroH2IC9qHJ8URRzOlEVUJXbMLzsFr4ou34T6YS01qZ35pm8BczNzADwDdyidcwDmHODZt4NC9e2MyyblEnARY8EpSp7jH0aT5xdOjf9VQdHh9c6u51Mo7UGUcKsRh1vJuFWobAIQTT5urJN4H72HG5+3+HkNSfLKslhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLxE7xlS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLxE7xlS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3850C4CEEA;
	Thu, 27 Mar 2025 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071425;
	bh=JZmwNsDqLZxIgq2TSsWv+OrlfHD4sc+gRut+0sfnc0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pLxE7xlSByCNsAadhCeaUBswG2X4q4UoPTRxF6kjpv/B0VNPi6s3FysAgMAvZk5mY
	 1DEiVC8CZZZ2o17GZINu68KAvQQOaiOBGcqt9WaEVJHs0kOdqIj1b/XWHddh5QJLjR
	 M6VFMi5YtB8LY/2uM9ckW5jsnRE29tMJI0BzUlJ/Nm3ZiEwePb0d+y+g/hXgqAqTmP
	 tayHtdO9aySFBQDXgHQDZ4I79esvrfyRPv5cAvzYke0D5IuSQwsWsApt0rEThAiJ9I
	 oijrfNwz7C3ojtbmghze4bz6suCLf01RJnNBo9NiARXNw2yipsRKrKywhm1MRr9KPl
	 OA/PO1AiexQWg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 14/14] bugs/core: Reorganize fields in the first line of WARNING output, add ->comm[] output
Date: Thu, 27 Mar 2025 11:29:53 +0100
Message-ID: <20250327102953.813608-15-mingo@kernel.org>
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

With the introduction of the condition string as part of the 'file'
string output of kernel warnings, the first line has become a bit
harder to read:

   WARNING: CPU: 0 PID: 0 at [ptr == 0 && 1] kernel/sched/core.c:8511 sched_init+0x20/0x410

Re-order the fields by importance (higher to lower), make the 'at' meaningful
again, and add '->comm[]' output which is often more valuable than a PID.

Also, remove the 'PID' prefix - in combination with comm it's clear what it is.

These changes make the output only slightly longer:

   WARNING: [ptr == 0 && 1] kernel/sched/core.c:8511 at sched_init+0x20/0x410 CPU#0: swapper/0

While adding more information and making it better organized.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: <linux-arch@vger.kernel.org>
---
 kernel/panic.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index d8635d5cecb2..e57a61faa05f 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -724,13 +724,15 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 
 	disable_trace_on_warning();
 
-	if (file)
-		pr_warn("WARNING: CPU: %d PID: %d at %s:%d %pS\n",
-			raw_smp_processor_id(), current->pid, file, line,
-			caller);
-	else
-		pr_warn("WARNING: CPU: %d PID: %d at %pS\n",
-			raw_smp_processor_id(), current->pid, caller);
+	if (file) {
+		pr_warn("WARNING: %s:%d at %pS, CPU#%d: %s/%d\n",
+			file, line, caller,
+			raw_smp_processor_id(), current->comm, current->pid);
+	} else {
+		pr_warn("WARNING: at %pS, CPU#%d: %s/%d\n",
+			caller,
+			raw_smp_processor_id(), current->comm, current->pid);
+	}
 
 #pragma GCC diagnostic push
 #ifndef __clang__
-- 
2.45.2

