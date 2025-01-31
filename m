Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8001B0408
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307438; cv=none; b=ARvlrUsVsPkQcYjFenRMW8aZJRamQtRP62qLfcaTV0Bcw4mxvjoPcSIPJlrAVjC16zK07ZWxiqhju0Xc3AjnBO9mE4Xc8cP7l0aXlqm7pHaCgJsJhCFiGwsge6aZVBwraG1A33NObYRHoi2CH6KfFSiMwOr+aPLmGzzlT3R+Cr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307438; c=relaxed/simple;
	bh=EFRN06YrP7HFKEdVqjzP/kCbiwK4F1EK5Ov4W3EfMrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+71JdXUr7cilUc0BNxCNsygtAdJE2brRAKEvWH8dMJXEbtO06j1+r8/nMvrzguZK2yT9jJ2pgo4KygHx/S3fxGBVBYJje6ri5g7k6esXeJOCLaIRPGKRKgGboTQvI3M+WJUzJU+52oOzAOiKD64+UvwvmAO+mCkMyPvvTuvsgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pfIltwQl; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pfIltwQl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BBLeT2PN/FG2eFSj93ESZQLZAda1GTvmFqlnUkA5aUU=; b=pfIltwQl+7OLaT/lqix49Y39oK
	3p88BcpXfVY8zBUUmtAiS2cAnO8/I/azujspX7VoF5hPvNekZQYf1i8/xiJCGMMR9XJNM8MfiwZFx
	wmdSbtu4U7W24QlyeD6yqVxiGpvh/sJquhZi5UNZiCjkWnrtjkpFxK5tpR7tjCWjCqsqYZbZDQpgZ
	CdppNsKBr8ECv0i/GhqRWoSNLWXhUiv0UZxdUuuFRcrdHqgexgSuDDM5LAop3SD0ssH71vyCtNw67
	pPQF5jfhvZerGmrarm4nVZIO4WKmqkjh83vuHfqVFusN6V6unhYt5QE9riqsAcT5KOw2JU+rEgFfT
	fplRuNCg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAW-001Kad-SL; Fri, 31 Jan 2025 08:10:31 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 10/11] sched_ext: Print core event count in scx_central scheduler
Date: Fri, 31 Jan 2025 16:09:37 +0900
Message-ID: <20250131070938.95551-11-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131070938.95551-1-changwoo@igalia.com>
References: <20250131070938.95551-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the scx_central scheduler to print the core event counter
every second.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/scx_central.bpf.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/sched_ext/scx_central.bpf.c b/tools/sched_ext/scx_central.bpf.c
index 50bc1737c167..376c14d5dd0d 100644
--- a/tools/sched_ext/scx_central.bpf.c
+++ b/tools/sched_ext/scx_central.bpf.c
@@ -256,6 +256,7 @@ static int central_timerfn(void *map, int *key, struct bpf_timer *timer)
 	u64 now = scx_bpf_now();
 	u64 nr_to_kick = nr_queued;
 	s32 i, curr_cpu;
+	struct scx_event_stats events;
 
 	curr_cpu = bpf_get_smp_processor_id();
 	if (timer_pinned && (curr_cpu != central_cpu)) {
@@ -291,6 +292,26 @@ static int central_timerfn(void *map, int *key, struct bpf_timer *timer)
 
 	bpf_timer_start(timer, TIMER_INTERVAL_NS, BPF_F_TIMER_CPU_PIN);
 	__sync_fetch_and_add(&nr_timers, 1);
+
+	/* print event counters every second */
+	if (nr_timers % 1000 == 0) {
+		scx_bpf_events(&events, sizeof(events));
+
+		bpf_printk("%35s: %llu\n", "SCX_EV_SELECT_CPU_FALLBACK",
+			   scx_read_event(&events, SCX_EV_SELECT_CPU_FALLBACK));
+		bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE",
+			   scx_read_event(&events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE));
+		bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_KEEP_LAST",
+			   scx_read_event(&events, SCX_EV_DISPATCH_KEEP_LAST));
+		bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SKIP_EXITING",
+			   scx_read_event(&events, SCX_EV_ENQ_SKIP_EXITING));
+		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DURATION",
+			   scx_read_event(&events, SCX_EV_BYPASS_DURATION));
+		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DISPATCH",
+			   scx_read_event(&events, SCX_EV_BYPASS_DISPATCH));
+		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_ACTIVATE",
+			   scx_read_event(&events, SCX_EV_BYPASS_ACTIVATE));
+	}
 	return 0;
 }
 
-- 
2.48.1

