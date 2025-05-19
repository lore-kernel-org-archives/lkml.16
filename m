Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882712116F2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689295; cv=none; b=L/hDThvLMd8i5IFEKqv6SnVU/pDzX3wbDFHsci/rDw1oUwGlHO1Cwg/avYpEHR/CW9t9fOAFAW9c+mFn2plI4owCismgJloDUT0NJgdbbq6vvowoDMR6jh7fcvYHxlQPS3PPcpakLk04xglpKUBiNBQ+Io73evXIR9T6jXlxesE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689295; c=relaxed/simple;
	bh=qx+yJToTgznisPaKQ0tu8vZ6/s5mpC2KHIepWrlE2/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/Cg0LM7cp4MSa/9oud/rhkM70jQUR7kqvvvyYyFXUZ50zW+AjTq+7bnwpGnSOsUY4100kP2/Exh/DqLcIOabK28yBL3o+7Ns/Mx+pomoVFLr3Haux/V5szMAQtrCO88xzjznk+r1hPQUIfqDitjDTCCQ3jWrd4LPncQE0aJiRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=w0YBehPz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="w0YBehPz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YXwpzfXWK/fhvKs0xuOgmE8U/L8nhcWlhpfO+B4LPWU=; b=w0YBehPz2Bls7nN5fK9gUfqhuw
	AnsGVInFdP0E1nGZ1tb6j9JcKdMMTQkDW6FCc44Wq+AoG7pDdeoCln+N5Ds9t7qHaki70zaeYBLW8
	uouMbk28f0K6lmXQARhbugjczUFYCy5I3xawc3qv/TJE6A3Ec86bpujL57lBHhSnZ/LZMN9no5oNj
	bdFKh5fHdUWe0DP/eatElaxaaTb1tJf01NzlAcDEFtg0MySV/IkAL9VlNQVOSn0Ldw6p65DVrM8DY
	+0kaC0ZfW3IDiRAlH/tkEtnbYJkFbozzQ8fOnbLeRDa9OuK+sUuuTiVZBfjcnAsx5urCbCp/Y2PoB
	IQCgOIdQ==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7oz-0000000AV13-1biT;
	Mon, 19 May 2025 21:14:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] futex: fix waitwake kernel-doc warnings
Date: Mon, 19 May 2025 14:14:51 -0700
Message-ID: <20250519211451.903973-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match a function comment to the actual function name. [futex_do_wait()]
Drop the kernel-doc for a removed function parameter. [@hb]
Use @task: for a function parameter description. [futex_wait_setup()]

kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
kernel/futex/waitwake.c:594: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 kernel/futex/waitwake.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-next-20250516.orig/kernel/futex/waitwake.c
+++ linux-next-20250516/kernel/futex/waitwake.c
@@ -334,8 +334,7 @@ out_unlock:
 static long futex_wait_restart(struct restart_block *restart);
 
 /**
- * futex_wait_queue() - futex_queue() and wait for wakeup, timeout, or signal
- * @hb:		the futex hash bucket, must be locked by the caller
+ * futex_do_wait() - futex_queue() and wait for wakeup, timeout, or signal
  * @q:		the futex_q to queue up on
  * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
  */
@@ -578,7 +577,7 @@ int futex_wait_multiple(struct futex_vec
  * @flags:	futex flags (FLAGS_SHARED, etc.)
  * @q:		the associated futex_q
  * @key2:	the second futex_key if used for requeue PI
- * task:	Task queueing this futex
+ * @task:	Task queueing this futex
  *
  * Setup the futex_q and locate the hash_bucket.  Get the futex value and
  * compare it with the expected value.  Handle atomic faults internally.
