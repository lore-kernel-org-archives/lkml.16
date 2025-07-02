Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B012741DC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458382; cv=none; b=Fe4yhwII3mO642/3upOPUxtfX9dd87y4sL+B0RtPaVGY5/RjBHkPIp5Mlpcx/QWif7p90t6CNnFWWp4C4HP3whYmZuees0PHoltnaH3kmpaa2sO26TKeCag//OgnR7wrMPLTcR9F5s+IQFS44OATM3LQ6G2Yjz8gTsv+aj+IcjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458382; c=relaxed/simple;
	bh=pWr1ZEmSxdu1Q+j4kV6uZ6Vskf1/ejlgABe69Z/8ER0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=SY4JACQlxT6ohbbgmXmPrB7c94qamONHrX8shyd+LNgZupxa+bjkF4BUt87gOZ06DD/PEPv/KjhG3svZ5RE7673IkGG1kYZlDrEVN2yt4ZJ1OoimGhC5grUBXg0YThpzon/xaBoAb8Rf3mANk2xlIFE0zKVyWJBVfKcOuQMiFY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mPTLMmfD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mPTLMmfD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=6JH/Lq31BAbDb+mcJJZiHYiB9yKZHuZJZ5ndhniSOZg=; b=mPTLMmfD5kmirj+/mS1DCHTiu8
	HsFWQuY3p5WAN3HxtYLTR4vX4yCMS6ACbrEmddnVd1R5ihtVul1S3OhliEjNpVkhpRXAeILqpYIWZ
	Dh4fH5cZQry0B4TS4dAMZpyHCXDxkF/ZOv5g+/acIGZ6W0JTVypvcY/qZmtipzB/8kWTA95cPnH5L
	BDjdPomERbS7HhAeD8o1IZZMC1uVpSgEGEWopcKfca+LidQHsYwWBUj6Et99exQmh0Ty/f84z4m33
	ZdOnqBtzRl81mGaGot4cdluXEC52aqvKiX+gX2f4oPHWYlF3dKFGW4xOtYvwiNkjof/ZOZN1XreUZ
	AxZJ0RRw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000009lFC-471V;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D0A253001F0; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121158.932926181@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:30 +0200
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
Subject: [PATCH v2 06/12] sched: Introduce ttwu_do_migrate()
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Split out the migration related bits into their own function for later
re-use.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3774,6 +3774,21 @@ static int ttwu_runnable(struct task_str
 	return 1;
 }
 
+static inline bool ttwu_do_migrate(struct task_struct *p, int cpu)
+{
+	if (task_cpu(p) == cpu)
+		return false;
+
+	if (p->in_iowait) {
+		delayacct_blkio_end(p);
+		atomic_dec(&task_rq(p)->nr_iowait);
+	}
+
+	psi_ttwu_dequeue(p);
+	set_task_cpu(p, cpu);
+	return true;
+}
+
 void sched_ttwu_pending(void *arg)
 {
 	struct llist_node *llist = arg;
@@ -4268,17 +4283,8 @@ int try_to_wake_up(struct task_struct *p
 		 * their previous state and preserve Program Order.
 		 */
 		smp_cond_load_acquire(&p->on_cpu, !VAL);
-
-		if (task_cpu(p) != cpu) {
-			if (p->in_iowait) {
-				delayacct_blkio_end(p);
-				atomic_dec(&task_rq(p)->nr_iowait);
-			}
-
+		if (ttwu_do_migrate(p, cpu))
 			wake_flags |= WF_MIGRATED;
-			psi_ttwu_dequeue(p);
-			set_task_cpu(p, cpu);
-		}
 
 		ttwu_queue(p, cpu, wake_flags);
 	}


