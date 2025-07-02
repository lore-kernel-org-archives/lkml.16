Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0023D2A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458375; cv=none; b=bjiPUAokMRqd5FcQTs4EWdPLPGdrxxhti+CdO6WoJCmA7OmlO+AxlEMZmkh1Oe6+Jx5HlBfKDapYx/2/67aQMHzcE1130+Sj4garx4JEMb1dyVbq3DaqMrBy/PTsA3MFD11UxhOpS0TVvJ9mGuJ+G5WqOcnmw7/L+Y9RQVKxxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458375; c=relaxed/simple;
	bh=n6YvUoh5mJjmncI/HyrKP8JIi1UurM6NTiEAnfPMinE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=tEJk7d9td+gWQLDOhvTdXww5t+VuSLYIvC6oEiWyHyav7GGcTiEI6Lvsai4RoDMwBdiX4JARDbdFGzdFo0Tox2QfONy3XHHs8TmGJIA93qK83R36U+PQh9BAeVPkKsh7REk6wEIBQ9vPtLMjGinWdVRC4Jd0i1d23lQWxfV3UaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OQMsyfLv; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OQMsyfLv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=aEfrksgxUVyoL9HQyfY6r7osBGPHcSr7/3n7z+lf8so=; b=OQMsyfLvpprv4hggis5FxeTPS+
	UZodVo/hcaiqdZU1lXDDItorNTV6yquE1VspiEh1gQ8EA7FbTBi9SHufMYEw0CzRoQI/yBIi5p9ud
	78u7anqCKIXsJgZc9z/5zCdcrB2AfATrLDOvR+4XEOSEstbqGMsJcS+29YJsczNAkVK4BZft1smo0
	VLcKSvwYwp4EiHvgHGeQZsj0P42oEnSb2fojMllhTyKEmtDDDs2avNti2/u9Gu2+CkoJPHGHrWfbz
	/aLiof8nSWEZuEEeSz1I1IGEKYmqVfHtPqh/h+6Ac2O0dvnPWg10jKpvVnfL3flAKJxGI9JzGuhnk
	nKW8zsxw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKW-00000007LoF-1zUB;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E614A300237; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121159.535226098@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:35 +0200
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
Subject: [PATCH v2 11/12] sched: Change ttwu_runnable() vs sched_delayed
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Change how TTWU handles sched_delayed tasks.

Currently sched_delayed tasks are seen as on_rq and will hit
ttwu_runnable(), which treats sched_delayed tasks the same as other
on_rq tasks, it makes them runnable on the runqueue they're on.

However, tasks that were dequeued (and not delayed) will get a
different wake-up path, notably they will pass through wakeup
balancing.

Change ttwu_runnable() to dequeue delayed tasks and report it isn't
on_rq after all, ensuring the task continues down the regular wakeup
path.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3793,8 +3793,10 @@ static int ttwu_runnable(struct task_str
 		return 0;
 
 	update_rq_clock(rq);
-	if (p->se.sched_delayed)
-		enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+	if (p->se.sched_delayed) {
+		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_DELAYED | DEQUEUE_SLEEP);
+		return 0;
+	}
 	if (!task_on_cpu(rq, p)) {
 		/*
 		 * When on_rq && !on_cpu the task is preempted, see if


