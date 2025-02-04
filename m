Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D1C204687
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646507; cv=none; b=e54zBT0cfGegJG3s6f8XTkDfUlxZXvLXRX9AHV8M4tKsphnffUEgiDMU3YRAzlixxoElubKunHof4jMqzCXLatYH1U/bK/EQSs0+0j7VlqIRe1m3/YUn8KKud1I4KGwiZrmcNopEU3un6a4pJifRdvRdmVx5Y6bon9xzHuD/Ze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646507; c=relaxed/simple;
	bh=8otb0KKbmGHKVolYJnJWTGAB7EZCUUlADsUx9BPsyUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENh2Lko6YFbWCxaNhf5j6+oLlsI0XWTwLw1eJUcv0pX8Df5tDhzhICZKgN9hwpN2UYTEO6vkSeaO8vf7n22DU/XoHvuq8bfibOWiaiv0t41a/PJwQgoihocgJD2lpVUCLGCwq+Mx7gaQMWW11S/c4pdqTxOtegQXxUkHfdi7esY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kreWNwFy; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kreWNwFy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PeObDfboIG5spdonwor3QD5AbHj0/Es/1OS62aZus6E=; b=kreWNwFyK5821rHUDHSMQe7atO
	q3u8HeB6yrpkR4c1CFMFEwRNtpUdDNqz6tRbIu5LTuYRlQPTQc0eXGfqQ6OV9INLGsvK1mMjmS6NR
	LWICZHene/GUuJEunC8sTAQd6Hvkwx058SYM6u2S4ssT0+6wUIkiHGka1WNf7gt18IVYRXdRJcGXU
	kKMegLFr80TqSz5YpH/F5dSgEMCc38F4B+b4R+ap66dQiTTksTFw7pyfOpvMkqq+ovnaapEeHtDSG
	MOmTAD+82sUKuFz/f00ze1XeFM4Z1kGz2gy37Y/DoH4rDsmGLaCfclffWG2XWStrKYcR6sB5OT3Ih
	1bI+IRuA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBNN-003J2X-Ob; Tue, 04 Feb 2025 06:21:40 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 7/7] sched_ext: Print core event count in scx_qmap scheduler
Date: Tue,  4 Feb 2025 14:20:57 +0900
Message-ID: <20250204052057.67776-8-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204052057.67776-1-changwoo@igalia.com>
References: <20250204052057.67776-1-changwoo@igalia.com>
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

