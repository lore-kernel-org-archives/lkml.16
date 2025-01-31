Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B2D145B3F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307401; cv=none; b=gW78/vrCb42m6gvhg0+2UFNcXGXxymHptlBkzVizJYybFP6mYRtjNbqdyARD+M/kY9kboKITIdiKqkbccsaQzhENLDUBzfjxknG/0UNReKvzh2mGF0Cju4qpIyoYgY/0IGa7SB4oIodikSCgN2WVy/RjHAP+pCmqH3oO+89SqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307401; c=relaxed/simple;
	bh=o1Yo6Yo7fZFV6OCfNCbKfJM/kbpQzIj3FE0+3TQE2g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRWPUQRGA6M+pKQx2drfpQXt/VG1VAYGWCu7kDdpWkBoxhBLFw8Ko1mcHBc+xk9Uv+e/6EPi2Q0ii7vcA+FDJExmsi0TXNzIQ5SA5eY49foxU6R+KHR6Z+9EeSRDAsCtm+C8rxPRyBYAuYgmVWdYtt7kp8+/ZzkfpECXYmas648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=A7HQXr1S; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="A7HQXr1S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ew2+CCsZd4F3S7dVu3kPbF1zR6N1+Mxu2aPCZoPthO4=; b=A7HQXr1Sq8Ygjh1wHZamDiLF64
	kuq7yDzZyTNe9Yyc8UoCUFyHofU+ZSFa9tHbuRpv7WIEYYQNtK2cxiCZdenZTV0cQgF5/SNykaS6t
	j8kNdCAdFuhjo8xi5oY1DleKIW3JS1+frMpC5iD5j1KOmFvUVR/1VBTh6NHDyZmln9DZPg7aGBF6s
	mjU21tGvFRkzjGi3KG1tjng5isC8w7i2lS7s0HdntxC/DkmO+3Y2AzYMm5GjbSEh3S28lo9Y7XJs9
	jl+Gclk43VQJ1YCIiRm255RUpARLrR9uXmmsGfCnSYSFUOJRZsyfw05aIZd6Ha3cEf6/BitdSTPIV
	HwwaqnBg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdl9s-001KY4-Ru; Fri, 31 Jan 2025 08:09:51 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 01/11] sched_ext: Implement event counter infrastructure
Date: Fri, 31 Jan 2025 16:09:28 +0900
Message-ID: <20250131070938.95551-2-changwoo@igalia.com>
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

Collect the statistics of specific types of behavior in the sched_ext core,
which are not easily visible but still interesting to an scx scheduler.

An event type is defined in 'struct scx_event_stats.' When an event occurs,
its counter is accumulated using 'scx_add_event()' and '__scx_add_event()'
to per-CPU 'struct scx_event_stats' for efficiency. 'scx_bpf_events()'
aggregates all the per-CPU counters and exposes a system-wide counters.

For convenience and readability of the code, 'scx_agg_event()' and
'scx_dump_event()' are provided.

The collected events can be observed after a BPF scheduler is unloaded
beforea new BPF scheduler is loaded so the per-CPU 'struct scx_event_stats'
are reset.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 103 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 5f6a425d4ffe..4e28e88e88d4 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1440,6 +1440,64 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
 	return p;
 }
 
+/*
+ * Collection of event counters. Event types are placed in descending order.
+ */
+struct scx_event_stats {
+};
+
+/*
+ * The event counter is organized by a per-CPU variable to minimize the
+ * accounting overhead without synchronization. A system-wide view on the
+ * event counter is constructed when requested by scx_bpf_get_event_stat().
+ */
+static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
+
+/**
+ * scx_add_event - Increase an event counter for 'name' by 'cnt'
+ * @name: an event name defined in struct scx_event_stats
+ * @cnt: the number of the event occured
+ *
+ * This can be used when preemption is not disabled.
+ */
+#define scx_add_event(name, cnt) do {						\
+	this_cpu_add(event_stats_cpu.name, cnt);				\
+} while(0)
+
+/**
+ * __scx_add_event - Increase an event counter for 'name' by 'cnt'
+ * @name: an event name defined in struct scx_event_stats
+ * @cnt: the number of the event occured
+ *
+ * This should be used only when preemption is disabled.
+ */
+#define __scx_add_event(name, cnt) do {						\
+	__this_cpu_add(event_stats_cpu.name, cnt);				\
+} while(0)
+
+/**
+ * scx_agg_event - Aggregate an event counter 'kind' from 'src_e' to 'dst_e'
+ * @dst_e: destination event stats
+ * @src_e: source event stats
+ * @kind: a kind of event to be aggregated
+ */
+#define scx_agg_event(dst_e, src_e, kind) do {					\
+	(dst_e)->kind += READ_ONCE((src_e)->kind);				\
+} while(0)
+
+/**
+ * scx_dump_event - Dump an event 'kind' in 'events' to 's'
+ * @s: output seq_buf
+ * @events: event stats
+ * @kind: a kind of event to dump
+ */
+#define scx_dump_event(s, events, kind) do {					\
+	dump_line(&(s), "%30s: %16llu", #kind, (events)->kind);			\
+} while (0)
+
+
+static void scx_bpf_events(struct scx_event_stats *events, size_t events__sz);
+
 static enum scx_ops_enable_state scx_ops_enable_state(void)
 {
 	return atomic_read(&scx_ops_enable_state_var);
@@ -4785,6 +4843,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		.at_jiffies = jiffies,
 	};
 	struct seq_buf s;
+	struct scx_event_stats events;
 	unsigned long flags;
 	char *buf;
 	int cpu;
@@ -4893,6 +4952,12 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		rq_unlock(rq, &rf);
 	}
 
+	dump_newline(&s);
+	dump_line(&s, "Event counters");
+	dump_line(&s, "--------------");
+
+	scx_bpf_events(&events, sizeof(events));
+
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
 		       trunc_marker, sizeof(trunc_marker));
@@ -5000,6 +5065,15 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	mutex_lock(&scx_ops_enable_mutex);
 
+	/*
+	 * Clear event counters so a new scx scheduler gets
+	 * fresh event counter values.
+	 */
+	for_each_possible_cpu(cpu) {
+		struct scx_event_stats *e = per_cpu_ptr(&event_stats_cpu, cpu);
+		memset(e, 0, sizeof(*e));
+	}
+
 	if (!scx_ops_helper) {
 		WRITE_ONCE(scx_ops_helper,
 			   scx_create_rt_helper("sched_ext_ops_helper"));
@@ -7001,6 +7075,34 @@ __bpf_kfunc u64 scx_bpf_now(void)
 	return clock;
 }
 
+/*
+ * scx_bpf_events - Get a system-wide event counter to
+ * @events: output buffer from a BPF program
+ * @events__sz: @events len, must end in '__sz'' for the verifier
+ */
+__bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
+				size_t events__sz)
+{
+	struct scx_event_stats e_sys, *e_cpu;
+	int cpu;
+
+	/* Aggregate per-CPU event counters into the system-wide counters. */
+	memset(&e_sys, 0, sizeof(e_sys));
+	for_each_possible_cpu(cpu) {
+		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
+	}
+
+	/*
+	 * We cannot entirely trust a BPF-provided size since a BPF program
+	 * might be compiled against a different vmlinux.h, of which
+	 * scx_event_stats would be larger (a newer vmlinux.h) or smaller
+	 * (an older vmlinux.h). Hence, we use the smaller size to avoid
+	 * memory corruption.
+	 */
+	events__sz = min(events__sz, sizeof(*events));
+	memcpy(events, &e_sys, events__sz);
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(scx_kfunc_ids_any)
@@ -7033,6 +7135,7 @@ BTF_ID_FLAGS(func, scx_bpf_cpu_rq)
 BTF_ID_FLAGS(func, scx_bpf_task_cgroup, KF_RCU | KF_ACQUIRE)
 #endif
 BTF_ID_FLAGS(func, scx_bpf_now)
+BTF_ID_FLAGS(func, scx_bpf_events, KF_TRUSTED_ARGS)
 BTF_KFUNCS_END(scx_kfunc_ids_any)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_any = {
-- 
2.48.1

