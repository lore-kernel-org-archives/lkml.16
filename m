Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6A1A08B1
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004154; cv=none; b=K+i/mrtCfyJPHcWON77FnUwMOxHibI5l9BbyHu7idOnYPwbQw1LMyKr0qlH8/264iLsDFx+deUARdPTxKowA+OlAhiOEk4TVPHs/ss1d9WbG5sV/hhyUEnptevn785X5zeraKyNDdWXoErY75LShW2ZEMA6q0xxJXwS+yjs5rBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004154; c=relaxed/simple;
	bh=XWjEaLkpvVgO4EQpdM4R4ZYAmR5GMcGiqQHTSHOkYek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fO5GJGZ5kmfQZPW+/g8uJsySOVfjWT5c/js8eYfX/+4Ag8xx/CwemFQeIpTM3VJ2zX7ITAbjzgMwoe9AeJLbp6brAWvWQid1C9ykiFD4xQcTIlJVxQ4G4j/CaxjAfKIYTe3ckg5Gf8M2QIRj/zz/qdN5m02Bmq4azhZGqpbFVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjssoYM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjssoYM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD8BC4CED6;
	Sat,  8 Feb 2025 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739004154;
	bh=XWjEaLkpvVgO4EQpdM4R4ZYAmR5GMcGiqQHTSHOkYek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RjssoYM86liAq2aK2fGgWPUtWhSUuf8o4dkbYMCauuewmRK91ie/2DWoQvlK0bjYh
	 XF4FdKbGEA1mg0GW57Pdj4nQXEOHnqFPc2cukysYQfC6pdUTjnTbT5J+BBumLRXSm0
	 5WjUoOEEuLyTp8e/nEJcjPYtl1q9aqoDsrtqgQhH5xJS/EWvf7fUWQmCeKZIVWkCi5
	 uH3QhOd5+KyhwSE6wM556UOftz/VjvxD/BXccUx+gZZnm8IP3AxongV2xxgGAH7LA4
	 5IlczBTu4QiqzdBTUTMADAHJzs6clkYelv/QSQtlltWuk7ahw7Od5RRDHrJy7eGQxz
	 0OUk3DoiaZkXw==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 1/3] tool/sched_ext: Event counter dumping updates
Date: Fri,  7 Feb 2025 22:42:15 -1000
Message-ID: <20250208084229.1274399-2-tj@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208084229.1274399-1-tj@kernel.org>
References: <20250208084229.1274399-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- There's no need to dump event counters from both scx_qmap and scx_central.
  Drop counter dumping from scx_central.

- bpf_printk() implies a trailing new line and the explicit new line leads
  to double new lines. Drop the explicit new lines.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 tools/sched_ext/scx_central.bpf.c | 21 ---------------------
 tools/sched_ext/scx_qmap.bpf.c    | 16 ++++++++--------
 2 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/tools/sched_ext/scx_central.bpf.c b/tools/sched_ext/scx_central.bpf.c
index 907a844723c1..5c165af1fa27 100644
--- a/tools/sched_ext/scx_central.bpf.c
+++ b/tools/sched_ext/scx_central.bpf.c
@@ -293,27 +293,6 @@ static int central_timerfn(void *map, int *key, struct bpf_timer *timer)
 	bpf_timer_start(timer, TIMER_INTERVAL_NS, BPF_F_TIMER_CPU_PIN);
 	__sync_fetch_and_add(&nr_timers, 1);
 
-	/* print event counters every second */
-	if (nr_timers % 1000 == 0) {
-		scx_bpf_events(&events, sizeof(events));
-
-		bpf_printk("%35s: %llu\n", "SCX_EV_SELECT_CPU_FALLBACK",
-			   scx_read_event(&events, SCX_EV_SELECT_CPU_FALLBACK));
-		bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE",
-			   scx_read_event(&events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE));
-		bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_KEEP_LAST",
-			   scx_read_event(&events, SCX_EV_DISPATCH_KEEP_LAST));
-		bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SKIP_EXITING",
-			   scx_read_event(&events, SCX_EV_ENQ_SKIP_EXITING));
-		bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SLICE_DFL",
-			   scx_read_event(&events, SCX_EV_ENQ_SLICE_DFL));
-		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DURATION",
-			   scx_read_event(&events, SCX_EV_BYPASS_DURATION));
-		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DISPATCH",
-			   scx_read_event(&events, SCX_EV_BYPASS_DISPATCH));
-		bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_ACTIVATE",
-			   scx_read_event(&events, SCX_EV_BYPASS_ACTIVATE));
-	}
 	return 0;
 }
 
diff --git a/tools/sched_ext/scx_qmap.bpf.c b/tools/sched_ext/scx_qmap.bpf.c
index 7d9d1e5d2358..e0e766d402e1 100644
--- a/tools/sched_ext/scx_qmap.bpf.c
+++ b/tools/sched_ext/scx_qmap.bpf.c
@@ -776,21 +776,21 @@ static int monitor_timerfn(void *map, int *key, struct bpf_timer *timer)
 
 	scx_bpf_events(&events, sizeof(events));
 
-	bpf_printk("%35s: %llu\n", "SCX_EV_SELECT_CPU_FALLBACK",
+	bpf_printk("%35s: %llu", "SCX_EV_SELECT_CPU_FALLBACK",
 		   scx_read_event(&events, SCX_EV_SELECT_CPU_FALLBACK));
-	bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE",
+	bpf_printk("%35s: %llu", "SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE",
 		   scx_read_event(&events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE));
-	bpf_printk("%35s: %llu\n", "SCX_EV_DISPATCH_KEEP_LAST",
+	bpf_printk("%35s: %llu", "SCX_EV_DISPATCH_KEEP_LAST",
 		   scx_read_event(&events, SCX_EV_DISPATCH_KEEP_LAST));
-	bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SKIP_EXITING",
+	bpf_printk("%35s: %llu", "SCX_EV_ENQ_SKIP_EXITING",
 		   scx_read_event(&events, SCX_EV_ENQ_SKIP_EXITING));
-	bpf_printk("%35s: %llu\n", "SCX_EV_ENQ_SLICE_DFL",
+	bpf_printk("%35s: %llu", "SCX_EV_ENQ_SLICE_DFL",
 		   scx_read_event(&events, SCX_EV_ENQ_SLICE_DFL));
-	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DURATION",
+	bpf_printk("%35s: %llu", "SCX_EV_BYPASS_DURATION",
 		   scx_read_event(&events, SCX_EV_BYPASS_DURATION));
-	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_DISPATCH",
+	bpf_printk("%35s: %llu", "SCX_EV_BYPASS_DISPATCH",
 		   scx_read_event(&events, SCX_EV_BYPASS_DISPATCH));
-	bpf_printk("%35s: %llu\n", "SCX_EV_BYPASS_ACTIVATE",
+	bpf_printk("%35s: %llu", "SCX_EV_BYPASS_ACTIVATE",
 		   scx_read_event(&events, SCX_EV_BYPASS_ACTIVATE));
 
 	bpf_timer_start(timer, ONE_SEC_IN_NS, 0);
-- 
2.48.1

