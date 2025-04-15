Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8BD2DFA5C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744687577; cv=none; b=Yn++VGAopDjMU0M3Sot1PyjOXux8bHcX6jszjbGVyhlyOw3+dlp2hht4UguifGOaXyMfEW1GRT3royQyhQymhFfGAugwww6uSvN1XSaAUyj/fSKPTB9vg6DdupWK5w0bC2OhTJPgObcBnXGhigtDnuMbzO0xV9VfTseNyHPBFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744687577; c=relaxed/simple;
	bh=ipvXwkSLgKG9eT+6Ar4t3cXkImZb3ZOztj1W14AFlaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tAXH1/8IpV7t6brvvMVAbQksjdS5UHuZFMmwG/tGpMGpMDPw2rKn98y3cyn2rv13N0jJELO2lTWw7Qm2IgFeNqtdv9hmoK4bLPwDGUVMXVyUIhA3mR6HmNImloHJxiEmDJMDtGXiffzsORjZNvajuJvBiovfhVmhNe+POkGTe6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=EziKt6um; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="EziKt6um"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744687565; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2h1Ulu7ziMCEKdHQqCt2h7p4RwUGmDgkuAyWL+LmEVc=;
	b=EziKt6umfmgVf+W+FjWM3R14NwQYvvBahi++kuRkueUrP1W90fDWIcL16H383jiECoe5MrT4CMbovst9vH3msvnjfE+/Mf5XNgwmQ5yTThipdgHtSGU1dGRXk3xQSpWt5/tZeVCJolEovobL1MyOyWFjdT2lMG0AAsMBXtP2pVg=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WX1khlJ_1744687564 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Apr 2025 11:26:04 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v4] sched/debug: Dump end of stack when detected corrupted
Date: Tue, 15 Apr 2025 11:26:04 +0800
Message-Id: <20250415032604.98915-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When debugging a kernel hang during suspend/resume [1], there were random
memory corruptions in different places like ACPI, file systems, network
subsystems, and reported by slub_debug+KASAN or detected by scheduler with
error message:

  "Kernel panic - not syncing: corrupted stack end detected inside scheduler"

So dump the corrupted memory around the stack end to give more direct
hints about how the memory is corrupted:

 "
 Corrupted Stack: ff11000122770000: ff ff ff ff ff ff 14 91 82 3b 78 e8 08 00 45 00  .........;x...E.
 Corrupted Stack: ff11000122770010: 00 1d 2a ff 40 00 40 11 98 c8 0a ef 30 2c 0a ef  ..*.@.@.....0,..
 Corrupted Stack: ff11000122770020: 30 ff a2 00 22 3d 00 09 9a 95 2a 00 00 00 00 00  0..."=....*.....
 ...
 Kernel panic - not syncing: corrupted stack end detected inside scheduler
 "

And with it, the culprit was quickly identified to be ethernet driver
that it frees RX related memory back to kernel in suspend hook, but
its HW is not really stopped, and still send RX data to those old
buffer through DMA.

The intention is trying to find a common pattern by comparing the dumped
memory of many different reproduced samples, for those hard-to-track
random memory corruption cases.

[1]. https://bugzilla.kernel.org/show_bug.cgi?id=217854

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
Changlog:

  since v3:
      * Refine commit log and rebase to latest kernel 
      * Update email address

  since v2:
      * Change code format (Adrian)
      * Add Reviewed tag from Adrian
      
  since v1:
      * Refine the commit log with more info, and rebase againt 6.8-rc3

 kernel/sched/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 87540217fc09..a894d402e576 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5929,8 +5929,19 @@ static noinline void __schedule_bug(struct task_struct *prev)
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
 #ifdef CONFIG_SCHED_STACK_END_CHECK
-	if (task_stack_end_corrupted(prev))
+	if (task_stack_end_corrupted(prev)) {
+		unsigned long *ptr = end_of_stack(prev);
+
+		/* Dump 16 ulong words around the corruption point */
+#ifdef CONFIG_STACK_GROWSUP
+		ptr -= 15;
+#endif
+		print_hex_dump(KERN_ERR, "Corrupted Stack: ",
+			DUMP_PREFIX_ADDRESS, 16, 1, ptr,
+			16 * sizeof(unsigned long), true);
+
 		panic("corrupted stack end detected inside scheduler\n");
+	}
 
 	if (task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
-- 
2.39.5 (Apple Git-154)

