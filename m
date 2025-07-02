Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0BD26D4D9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458375; cv=none; b=RW4gHSbkKlIu1BLtV3t245UdRrLPnLzLWjoGiYnDgS/z1jVlFqDXDPghx0+OLvRWbs8ai1ugrj9HAlueE7kozCfobDyMBQpWJWlt+oGMBXHV/Ka6rrOyiksdupHRpgRCY5Mp5t/QQwkFMfNsL60f9P714BeRq5JsJ/TLei3+TvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458375; c=relaxed/simple;
	bh=OJ5GCBmIvAPN0pMDBWv2WeEEvtrkmyaMrK9hOo6rLP8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GzOpKmEBTtPWhBz8tBTAoBm/ljulu6vfZSUMHtGJxwBy5mojMGhiB4U7yKIGASblqiIjhY/VC9b5ke/IwZLZZrH/cVM2lP4pXABefb/ZXy0pTBcnH2PW5EZ7YMJBGbVEUFHiE5ju1mF484cWqANZJAB+85qTiJ/nuoFkLi4rKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q+OU4Rwe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q+OU4Rwe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=onhBm3Dupd3NVH6sTDnfi4lnWVArcDQumqorYE8AWno=; b=Q+OU4RweT1hcq/jHY1l7Nd8S9M
	xMDR0gwrG9M407kRfKybl0ZGGoqx8RefbpLYVX9HklxqTL1lqBbWKJiCbycJ3LHCwoW6EkhHiIrj0
	14KNlB7Uiq5hHxWhRFRO9bPdMFDcgEmiMFCrUsJ2K/OTR56BTHaIuFWSM1pGIJKI04u1dTlPidi4j
	9q+xxZ0d9Uo6tHfrqaSQuu7f+Gr4Yt1eqpAykRLksrMu+0efonc3rrreFOlz+WWj06o1LNYtpVeP4
	oswI59fHhGj8HqshWe5LZqfJVJ2yjgLnE4FrMGxXrECxPTO4Ms98ZJ30FjtfU9EuzE4nVeHNSOnUz
	l89HGT2g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKW-00000007LoD-013a;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D911A300212; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121159.172688305@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:32 +0200
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
Subject: [PATCH v2 08/12] sched: Re-arrange __ttwu_queue_wakelist()
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The relation between ttwu_queue_wakelist() and __ttwu_queue_wakelist()
is ill defined -- probably because the former is the only caller of
the latter and it grew into an arbitrary subfunction.

Clean things up a little such that __ttwu_queue_wakelist() no longer
takes the wake_flags argument, making for a more sensible separation.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3848,11 +3848,11 @@ bool call_function_single_prep_ipi(int c
  * via sched_ttwu_wakeup() for activation so the wakee incurs the cost
  * of the wakeup instead of the waker.
  */
-static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
+static void __ttwu_queue_wakelist(struct task_struct *p, int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
 
-	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+	sched_clock_cpu(cpu); /* Sync clocks across CPUs */
 
 	WRITE_ONCE(rq->ttwu_pending, 1);
 #ifdef CONFIG_SMP
@@ -3954,8 +3954,9 @@ static bool ttwu_queue_wakelist(struct t
 	if (!ttwu_queue_cond(p, cpu, def))
 		return false;
 
-	sched_clock_cpu(cpu); /* Sync clocks across CPUs */
-	__ttwu_queue_wakelist(p, cpu, wake_flags);
+	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+
+	__ttwu_queue_wakelist(p, cpu);
 	return true;
 }
 


