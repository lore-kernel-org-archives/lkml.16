Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D722D4FF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006893; cv=none; b=oeKYf+tvCTp8U1r+ewMzo6gmAG1/+WtbcMG+qRlrPVL2DGl8MOTLtcLUnq3An9eWIw4BjfT5grbKuyaEjp6xlFzxYNgsNIOdYL2dS0BqEDLP3R2d4FZXjzvpIn994IwaHejH+cZAqco2YPNlBXhSflWyCTE7ipq79OPzkuVLLWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006893; c=relaxed/simple;
	bh=IxWrOl6yraJgWsjjSbwOKMoqvM9S4o4ta0FZh23EHuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KfYYJhpBuhbye7v26Kyix1SzS6M54QkU38dzx53IrOX+FPh1V/MV0j+vmRhCG6hCvZ+8l2wq8h+JmIuFQ+Vkhs49hN1lkyvm7QH8rT4xsd65rGFx7LqNNeCfmq2TZW4nY1lhtMGqnUqsoSw9OsCdbIq+iKnUccocKXd3oBIJF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=VToQliux; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="VToQliux"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=rBpKADHVY8zlIgAD1G/TvUFi0gFBT0bXo9zYp8kOjh8=; b=VToQliuxAgYUidpe
	T36L785za5zHQ9AIbl1mIi7Ro0xNLu3vNDtqUKwSAlvQhxmekFC02TQnwDLILQHSe8K0JBrETLo5x
	QFxzOuZXhnQvCQ92nGxryhsG3hN4M77nuEsOpiTiXygmz0AYtaWyj4Xahet+fpmRuB+QZqvD9O1sz
	Knrv3iRmZMaxHZBlyUV4hYABPcXsiv/IJTN9UjtHm4yt84P0L4mm0GEITyyLnq1AIraZIN1G4QK8i
	we7olQQezNIY6STYKmOKd95YxLLHA7F0m+mSqubZ5LIXq5O/kT9+QkP3s99KoDXlLjvLmtaCKsXM/
	DYev7vyTQKgP6//sVw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u5s0J-00Ca8w-2V;
	Fri, 18 Apr 2025 20:08:03 +0000
From: linux@treblig.org
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] timers: Remove unused __round_jiffies(_up)
Date: Fri, 18 Apr 2025 21:08:03 +0100
Message-ID: <20250418200803.427911-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Remove two trivial but long unused functions.

__round_jiffies() has been unused since 2008's
commit 9c133c469d38 ("Add round_jiffies_up and related routines")

__round_jiffies_up() has been unused since 2019's
commit 7ae3f6e130e8 ("powerpc/watchdog: Use hrtimers for per-CPU
heartbeat")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/timer.h |  2 --
 kernel/time/timer.c   | 42 ------------------------------------------
 2 files changed, 44 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a34..e17aac74b5b3 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -172,12 +172,10 @@ extern void init_timers(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
 
-unsigned long __round_jiffies(unsigned long j, int cpu);
 unsigned long __round_jiffies_relative(unsigned long j, int cpu);
 unsigned long round_jiffies(unsigned long j);
 unsigned long round_jiffies_relative(unsigned long j);
 
-unsigned long __round_jiffies_up(unsigned long j, int cpu);
 unsigned long __round_jiffies_up_relative(unsigned long j, int cpu);
 unsigned long round_jiffies_up(unsigned long j);
 unsigned long round_jiffies_up_relative(unsigned long j);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4d915c0a263c..1b2a884f66e8 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -385,32 +385,6 @@ static unsigned long round_jiffies_common(unsigned long j, int cpu,
 	return time_is_after_jiffies(j) ? j : original;
 }
 
-/**
- * __round_jiffies - function to round jiffies to a full second
- * @j: the time in (absolute) jiffies that should be rounded
- * @cpu: the processor number on which the timeout will happen
- *
- * __round_jiffies() rounds an absolute time in the future (in jiffies)
- * up or down to (approximately) full seconds. This is useful for timers
- * for which the exact time they fire does not matter too much, as long as
- * they fire approximately every X seconds.
- *
- * By rounding these timers to whole seconds, all such timers will fire
- * at the same time, rather than at various times spread out. The goal
- * of this is to have the CPU wake up less, which saves power.
- *
- * The exact rounding is skewed for each processor to avoid all
- * processors firing at the exact same time, which could lead
- * to lock contention or spurious cache line bouncing.
- *
- * The return value is the rounded version of the @j parameter.
- */
-unsigned long __round_jiffies(unsigned long j, int cpu)
-{
-	return round_jiffies_common(j, cpu, false);
-}
-EXPORT_SYMBOL_GPL(__round_jiffies);
-
 /**
  * __round_jiffies_relative - function to round jiffies to a full second
  * @j: the time in (relative) jiffies that should be rounded
@@ -482,22 +456,6 @@ unsigned long round_jiffies_relative(unsigned long j)
 }
 EXPORT_SYMBOL_GPL(round_jiffies_relative);
 
-/**
- * __round_jiffies_up - function to round jiffies up to a full second
- * @j: the time in (absolute) jiffies that should be rounded
- * @cpu: the processor number on which the timeout will happen
- *
- * This is the same as __round_jiffies() except that it will never
- * round down.  This is useful for timeouts for which the exact time
- * of firing does not matter too much, as long as they don't fire too
- * early.
- */
-unsigned long __round_jiffies_up(unsigned long j, int cpu)
-{
-	return round_jiffies_common(j, cpu, true);
-}
-EXPORT_SYMBOL_GPL(__round_jiffies_up);
-
 /**
  * __round_jiffies_up_relative - function to round jiffies up to a full second
  * @j: the time in (relative) jiffies that should be rounded
-- 
2.49.0

