Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A22741D0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458383; cv=none; b=PWNa7dkJtV7WwTLGuNIXWQgvSxPkaUuvq1oTSS0c0pJEx5m5EPj3b5foOLw1jPUskv9mtlBa9uet/Def0XZKHZxVR6ArcTqIoOTKGeXXRdtt56tNiwJNXoc2NYzZUg+Jmgz8dTQ93kLdmvBoqMrzNAG5cjvDUBirwbsW8Ajl5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458383; c=relaxed/simple;
	bh=FWv0wUWinfxRvRf2jp6kAyQT3DxEUSWPhksp51+zDRM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=gm2cyHRYErV6OvWpR1o6BnDh1SR0n/qrB3LeGzVFLpCvoiRflY06czPaLM9b6dHI5ONkb7u/ttSrGnkcUJb2nmMjCUuTmAH/2bNwLFp8vmbOy9PCspOSxTOECHH9lVYD+owJxLTwITKpqLCc0X2rYSy04179ksaLc84gdojiyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NWCWpilK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NWCWpilK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=8PPBxPGtoZgH0uq70gRQQr/CkrObDZsJfEUhnPhGB4E=; b=NWCWpilKWXwh5EOu/FlUk/CdNV
	5f0qzy1Bujnt91gQ+dKlk1p4SVR+BqH3VGu3rXSGniO90uo3U7uhJ2P8w+4MXnGFCGmN4iTkAOYU/
	L68EbPmaOBsZw+4Oqecz2p2Yz7QGOYvC9ufv+cgVhn4z4UVqXtf0/5LEP7JbzNnzcdY7H3LTe2QzF
	xGFk0N7n1ude0JJzEmn4yMvp3qEShVgd6yJQ1uT+9wn/wWlqpAPviuBxiA3+QwPXB/aypvxNwI1ZI
	/lJMwVKonvYgy3v5mknils0CwTjlLRAOPv0/KwyHaAa6twCGOgSeJcrNNoLc56RTfdSblTSGA/krR
	cRNOibwA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKW-00000009lFH-1t0f;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id DD50F300220; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121159.287358119@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 clm@meta.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [PATCH v2 09/12] sched: Clean up ttwu comments
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Various changes have rendered these comments slightly out-of-date.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4276,8 +4276,8 @@ int try_to_wake_up(struct task_struct *p
 		 * __schedule().  See the comment for smp_mb__after_spinlock().
 		 *
 		 * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
-		 * schedule()'s deactivate_task() has 'happened' and p will no longer
-		 * care about it's own p->state. See the comment in __schedule().
+		 * schedule()'s try_to_block_task() has 'happened' and p will no longer
+		 * care about its own p->state. See the comment in try_to_block_task().
 		 */
 		smp_acquire__after_ctrl_dep();
 
@@ -6708,8 +6708,8 @@ static void __sched notrace __schedule(i
 	preempt = sched_mode == SM_PREEMPT;
 
 	/*
-	 * We must load prev->state once (task_struct::state is volatile), such
-	 * that we form a control dependency vs deactivate_task() below.
+	 * We must load prev->state once, such that we form a control
+	 * dependency vs try_to_block_task() below.
 	 */
 	prev_state = READ_ONCE(prev->__state);
 	if (sched_mode == SM_IDLE) {


