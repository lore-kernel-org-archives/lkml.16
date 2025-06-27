Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255A72BF3FC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025133; cv=none; b=HOfRtZeQI4AofDA+2h7Pm7iN8D2nLA4kqNV0ZPIb9VVNw+9wDWkuG8juBqbdTRLcTliapBdASIrMoyMHA9PeJlbf7JfuBhH/1YWzglFhz1LgXr196RX/yAP8+xLm3We3FuF1L5MOCZFlLSBcytpP/GofuySSvJj9XncWUx9UXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025133; c=relaxed/simple;
	bh=B1fDgTPvcW5CNOENUIG20E3kZIfrYCCjaLOj12iKS54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JekGIRmPCEwfuRUgL2NyPKcX7NIbkMGKokAWetPimHxrx12ZKpkLxxlNYTzk2Ffm33t3v8WH9ug8sj0obqlaVc1wt2VBDFzMiyibd6RTenA1DetXPpMMIYwgTXqarGi42lEqEs+HLP2wnAF3Kbu0vhzeKNHWjv1EVxAa5GfvlaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cbi11tNe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cbi11tNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5vSNy0YZG1hcCr6zeagT5BwkVdXA07NqtiRR9wtVcQ=;
	b=cbi11tNe1dd1XRQxM2MfkM37lL5URIhj9LbdCUyRych2epZmbIy/sq0hYP/gJpfaDfcK2a
	0MBCec1uQ+w/E7gRBRaeECAfYGQhClqelzmzfzR2kd73Rij/qQDDxwIy3WT/Md+OiCl5T9
	xJGYXmvA84ag5CURYR8uM7EHgquQf3E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-hv7pZnlCN1mjkOBSAXu05Q-1; Fri,
 27 Jun 2025 07:52:07 -0400
X-MC-Unique: hv7pZnlCN1mjkOBSAXu05Q-1
X-Mimecast-MFC-AGG-ID: hv7pZnlCN1mjkOBSAXu05Q_1751025126
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 147421801BD8;
	Fri, 27 Jun 2025 11:52:06 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.44.32.84])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E10E19560AB;
	Fri, 27 Jun 2025 11:52:00 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 3/5] sched/deadline: Fix accounting after global limits change
Date: Fri, 27 Jun 2025 13:51:16 +0200
Message-ID: <20250627115118.438797-4-juri.lelli@redhat.com>
In-Reply-To: <20250627115118.438797-1-juri.lelli@redhat.com>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

A global limits change (sched_rt_handler() logic) currently leaves stale
and/or incorrect values in variables related to accounting (e.g.
extra_bw).

Properly clean up per runqueue variables before implementing the change
and rebuild scheduling domains (so that accounting is also properly
restored) after such a change is complete.

Reported-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/deadline.c | 4 +++-
 kernel/sched/rt.c       | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 7a3b556d45a99..187f324565f92 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3166,6 +3166,9 @@ void sched_dl_do_global(void)
 	if (global_rt_runtime() != RUNTIME_INF)
 		new_bw = to_ratio(global_rt_period(), global_rt_runtime());
 
+	for_each_possible_cpu(cpu)
+		init_dl_rq_bw_ratio(&cpu_rq(cpu)->dl);
+
 	for_each_possible_cpu(cpu) {
 		rcu_read_lock_sched();
 
@@ -3181,7 +3184,6 @@ void sched_dl_do_global(void)
 		raw_spin_unlock_irqrestore(&dl_b->lock, flags);
 
 		rcu_read_unlock_sched();
-		init_dl_rq_bw_ratio(&cpu_rq(cpu)->dl);
 	}
 }
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 15d5855c542cb..be6e9bcbe82b6 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2886,6 +2886,12 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
 	sched_domains_mutex_unlock();
 	mutex_unlock(&mutex);
 
+	/*
+	 * After changing maximum available bandwidth for DEADLINE, we need to
+	 * recompute per root domain and per cpus variables accordingly.
+	 */
+	rebuild_sched_domains();
+
 	return ret;
 }
 
-- 
2.49.0

