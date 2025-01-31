Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430CA1B424F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307441; cv=none; b=g3r/8JO+Ew4A78GrivsyarTLgn+gIPlUHt5eXip55Q3l1HO+fmhzsMknfC0VVxutnhywM0noJ1Nt33W7QFZSHFDVKDk+zQgEuxLj4EU/lL3/JMqwpKO3Vlyp9DBnMmgZpbdk9ZL1P4YQVQ8BOLJHJ5ItmPWIX6mWe9x4mqwHGDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307441; c=relaxed/simple;
	bh=8otb0KKbmGHKVolYJnJWTGAB7EZCUUlADsUx9BPsyUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uu6/9D5tNdn/1xkANEzavQHtWDQXEHdZnveGdqN9K81l2XOFYN6PcoYgzStJ0p9M2aIzfoX8apK3cXVUGDI+AOxcP7yN/4EPswXf5uXQ2av64yXVEYpl5tiJ2WA2pqxwZmufVczoIINoBHCt0KG6nj96P2q5uZErLD21+MTgJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fubl1sb/; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fubl1sb/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PeObDfboIG5spdonwor3QD5AbHj0/Es/1OS62aZus6E=; b=fubl1sb/GRKvbkzQoYS9ASjG3r
	NifqygzojXTxO4kCGNEu6qHif2kFYTFUpIGebYjAPuLlWnDlqZhlqJPud62xQERplbdTSos3Tj9YB
	7QYN3gZtXUDV6mTQmFExTiG1w2eUtjKd/CyH4lDo5IwWjbrx69S5c8vUwm/I7e2PDByg5A1Ni2D3e
	pKDSKsShmvnHicb1pvCKwDTbaEw7uf0wRzSidyNJCzBKdUk43bdYU46/P7RoT7RN27sHWch9etQ98
	ZlJ1Hn/bqL8tgQ4twC17nXUj9d0lcBoWmBLR0pslk6sQCDhbooKwIT2QBzXowCqq/dzl1tzn9C9RA
	B/Eo5Xwg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAa-001Kak-SE; Fri, 31 Jan 2025 08:10:35 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 11/11] sched_ext: Print core event count in scx_qmap scheduler
Date: Fri, 31 Jan 2025 16:09:38 +0900
Message-ID: <20250131070938.95551-12-changwoo@igalia.com>
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

Modify the scx_qmap scheduler to print the core event counter
every second.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/scx_qmap.bpf.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/sched_ext/scx_qmap.bpf.c b/tools/sched_ext/scx_qmap.bpf.c
index 3a20bb0c014a..5edb79742e37 100644
--- a/tools/sched_ext/scx_qmap.bpf.c
+++ b/tools/sched_ext/scx_qmap.bpf.c
@@ -763,6 +763,8 @@ static void dump_shared_dsq(void)
 
 static int monitor_timerfn(void *map, int *key, struct bpf_timer *timer)
 {
+	struct scx_event_stats events;
+
 	bpf_rcu_read_lock();
 	dispatch_highpri(true);
 	bpf_rcu_read_unlock();
@@ -772,6 +774,23 @@ static int monitor_timerfn(void *map, int *key, struct bpf_timer *timer)
 	if (print_shared_dsq)
 		dump_shared_dsq();
 
+	scx_bpf_events(&events, sizeof(events));
+
+	bpf_printk("%35s: %llu\n", "SCX_EV_SELECT_CPU_FALLBACK",
+		   scx_read_event(&events, SCX_EV_SELECT_CPU_FALLBACK));
+	bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE",
+		   scx_read_event(&events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE));
+	bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_KEEP_LAST",
+		   scx_read_event(&events, SCX_EV_DISPATCH_KEEP_LAST));
+	bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SKIP_EXITING",
+		   scx_read_event(&events, SCX_EV_ENQ_SKIP_EXITING));
+	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DURATION",
+		   scx_read_event(&events, SCX_EV_BYPASS_DURATION));
+	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DISPATCH",
+		   scx_read_event(&events, SCX_EV_BYPASS_DISPATCH));
+	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_ACTIVATE",
+		   scx_read_event(&events, SCX_EV_BYPASS_ACTIVATE));
+
 	bpf_timer_start(timer, ONE_SEC_IN_NS, 0);
 	return 0;
 }
-- 
2.48.1

