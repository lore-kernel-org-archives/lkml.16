Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12D26D4E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458375; cv=none; b=H0inbS5FKSAH7pbly89ugQ4Y0RxFE6e990IJ6o8QcGPkvz8YvtVn8aSh+Z98SAF1qMmVFhaEwImJy0RLkeTCbMSQ2CZtNPHB42x+3PAN75ApxW6KRRkP/Ed9nosVlnKCt/yRKC0bH6zWPhNSmosTX518r9CvpLxdOPbZ0rWrFVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458375; c=relaxed/simple;
	bh=xo1fc3NqjbobotA/bdTPvvoK1PWxBcIdl8XWayqHS7g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=svJqcDpSSL72ysC48UO4zhsIprc9CLFmLzyTaOougaRvlVGgISwwxDoikbNVeqRoIj7/7eQV4/GTnd5YoEs65JC9g85dZTr1vgzORjOaPnkc/hywp/94tpFZAdlO7KHNcHqlEV7vhcCAglKTyEGvUOPOA4pL67SWPV5vC8JkG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gI47Ux83; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gI47Ux83"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=08lm1e1J7UNKF0ChbTwoML968O+ldkunmaw1MPPMELY=; b=gI47Ux83fuBKsTqik12bS3ZTv2
	S+gysos9W4A+XDX52d32DbhxyfIv2gmG5Y2drqImaDdYp8yOSrz7XE6ydhSsxB0lZl2PLRLt6DtCR
	6Xq9GRiCKU43ohuuRQytRCfRmbt0syr2k3NGoIcqykzDO2QkkfKj6LDST2+T9rFqTel5O4gfVGKzP
	a4e8c541TPyN5igbzPpE4zjhFchaLUew/71YmW3pb+lkM6zbR8W5bmsMnIfpAqw1DM/OCJM7hWRD8
	nXsx+LyvxXR7HYmUuGhhYEhregf0io1BQVsEGmNTxML2mRDpTbC/hXYO4ngslPspXuqn65Dk7UeFy
	1+bCqeOw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKW-00000007LoE-1y26;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E18BA300233; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121159.418420130@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:34 +0200
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
Subject: [PATCH v2 10/12] sched: Use lock guard in sched_ttwu_pending()
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3827,22 +3827,26 @@ void sched_ttwu_pending(void *arg)
 	struct llist_node *llist = arg;
 	struct rq *rq = this_rq();
 	struct task_struct *p, *t;
-	struct rq_flags rf;
 
 	if (!llist)
 		return;
 
-	rq_lock_irqsave(rq, &rf);
+	CLASS(rq_lock_irqsave, guard)(rq);
 	update_rq_clock(rq);
 
 	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
+		int wake_flags = WF_TTWU;
+
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
 		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
 			set_task_cpu(p, cpu_of(rq));
 
-		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
+		if (p->sched_remote_wakeup)
+			wake_flags |= WF_MIGRATED;
+
+		ttwu_do_activate(rq, p, wake_flags, &guard.rf);
 	}
 
 	/*
@@ -3856,7 +3860,6 @@ void sched_ttwu_pending(void *arg)
 	 * Since now nr_running > 0, idle_cpu() will always get correct result.
 	 */
 	WRITE_ONCE(rq->ttwu_pending, 0);
-	rq_unlock_irqrestore(rq, &rf);
 }
 
 /*


