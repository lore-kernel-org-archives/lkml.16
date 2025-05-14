Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA031D63C3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747198167; cv=none; b=V+I1uBY9lGtKRiPhr1pa4lVwRS0GF0cu/Ght7phFyAtgiktX9wll+FMf9A0qoCnhp+8rbeBAADzqf32FZtL62G0oVKRzYn2hSyc4q9/t7NUiRlyvcYiqCzymb3fEyDML91yScLLhBoLx6mCG4DQzefTzziPtiO9cH0Ia0bS0HSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747198167; c=relaxed/simple;
	bh=leJ17f5x1uBPKoosRxDCgkZ4svJ0A+4jycmEEfXU6t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9mj5c/zp8vZeRDtmqZSLI9h/Qncn5u0F+A8hg/AC7BMHs+DFoVOQT8cQWR7wAoGNWToZVUbmPeBKst+skg4bGkdjkM1CkXBXJPtMaAecwPh+bXCJB6Sla7IIUBiwTm54AiP/kL9fFRuz3gGyKlkLTSdtRODhWU/RKeIvyPIUdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3RwE4G1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3RwE4G1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D45FC4CEED;
	Wed, 14 May 2025 04:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747198166;
	bh=leJ17f5x1uBPKoosRxDCgkZ4svJ0A+4jycmEEfXU6t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3RwE4G1BOjtntKGyOo/bGj4uXrd0vDOPtilZ414IqiTMOjGfuinXNaS+HS5qySQg
	 l0fLg+OtpeSecq9P9jPnBPK/T0CxKzylY6XVZx4NbkFoobnVq/dDXO8p7CcNRt+0Xc
	 KTkZZeFBzzbqDT/vBNG3l6qkAhyrrxfhALtyxSFq8ucT1BC++Go661qkd6SuirC9AZ
	 e9jmvGL0zyvsCSdXsA7+Lf8EY1LOEyFIJOSva7JJIAwGL4Y9QfOJV33b4j4V7kVtvn
	 Fc8KUjPvV/DDGoAaODWY8d0XBT5g2eJswqKrhUMZDdR2JBbbuqjuDBKWTuMvsnRvqp
	 pdcXMts9liqjA==
Date: Wed, 14 May 2025 00:49:25 -0400
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4 sched_ext/for-6.16] sched_ext: Cleanup
 [__]scx_exit/error*()
Message-ID: <aCQg1Zg4Gkc-n1q5@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCQgqDY02LgevzFP@mtj.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCQgqDY02LgevzFP@mtj.duckdns.org>

__scx_exit() is the base exit implementation and there are three wrappers on
top of it - scx_exit(), __scx_error() and scx_error(). This is more
confusing than helpful especially given that there are only a couple users
of scx_exit() and __scx_error(). To simplify the situation:

- Make __scx_exit() take va_list and rename it to scx_vexit(). This is to
  ease implementing more complex extensions on top.

- Make scx_exit() a varargs wrapper around __scx_exit(). scx_exit() now
  takes both @kind and @exit_code.

- Convert existing scx_exit() and __scx_error() users to use the new
  scx_exit().

- scx_error() remains unchanged.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c |   48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1136,17 +1136,20 @@ static struct kset *scx_kset;
 
 static void process_ddsp_deferred_locals(struct rq *rq);
 static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
-static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
-				      const char *fmt, ...);
+static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
+		      va_list args);
 
-#define __scx_error(err, fmt, args...)						\
-	__scx_exit((err), 0, fmt, ##args)
+static __printf(3, 4) void scx_exit(enum scx_exit_kind kind, s64 exit_code,
+				    const char *fmt, ...)
+{
+	va_list args;
 
-#define scx_exit(code, fmt, args...)						\
-	__scx_exit(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
+	va_start(args, fmt);
+	scx_vexit(kind, exit_code, fmt, args);
+	va_end(args);
+}
 
-#define scx_error(fmt, args...)							\
-	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
+#define scx_error(fmt, args...)		scx_exit(SCX_EXIT_ERROR, 0, fmt, ##args)
 
 #define SCX_HAS_OP(sch, op)	test_bit(SCX_OP_IDX(op), (sch)->has_op)
 
@@ -3554,7 +3557,8 @@ static void handle_hotplug(struct rq *rq
 	else if (!online && SCX_HAS_OP(sch, cpu_offline))
 		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
 	else
-		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
+		scx_exit(SCX_EXIT_UNREG_KERN,
+			 SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 			 "cpu %d going %s, exiting scheduler", cpu,
 			 online ? "online" : "offline");
 }
@@ -3595,9 +3599,9 @@ static bool check_rq_for_timeouts(struct
 					last_runnable + scx_watchdog_timeout))) {
 			u32 dur_ms = jiffies_to_msecs(jiffies - last_runnable);
 
-			__scx_error(SCX_EXIT_ERROR_STALL,
-				    "%s[%d] failed to run for %u.%03us",
-				    p->comm, p->pid, dur_ms / 1000, dur_ms % 1000);
+			scx_exit(SCX_EXIT_ERROR_STALL, 0,
+				 "%s[%d] failed to run for %u.%03us",
+				 p->comm, p->pid, dur_ms / 1000, dur_ms % 1000);
 			timed_out = true;
 			break;
 		}
@@ -3635,9 +3639,9 @@ void scx_tick(struct rq *rq)
 				last_check + READ_ONCE(scx_watchdog_timeout)))) {
 		u32 dur_ms = jiffies_to_msecs(jiffies - last_check);
 
-		__scx_error(SCX_EXIT_ERROR_STALL,
-			    "watchdog failed to check in for %u.%03us",
-			    dur_ms / 1000, dur_ms % 1000);
+		scx_exit(SCX_EXIT_ERROR_STALL, 0,
+			 "watchdog failed to check in for %u.%03us",
+			 dur_ms / 1000, dur_ms % 1000);
 	}
 
 	update_other_load_avgs(rq);
@@ -5263,13 +5267,12 @@ static void scx_error_irq_workfn(struct
 	kthread_queue_work(sch->helper, &sch->disable_work);
 }
 
-static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
-				      const char *fmt, ...)
+static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
+		      va_list args)
 {
 	struct scx_sched *sch;
 	struct scx_exit_info *ei;
 	int none = SCX_EXIT_NONE;
-	va_list args;
 
 	rcu_read_lock();
 	sch = rcu_dereference(scx_root);
@@ -5285,9 +5288,7 @@ static __printf(3, 4) void __scx_exit(en
 	if (kind >= SCX_EXIT_ERROR)
 		ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
 #endif
-	va_start(args, fmt);
 	vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
-	va_end(args);
 
 	/*
 	 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
@@ -5391,7 +5392,8 @@ static void check_hotplug_seq(const stru
 	if (ops->hotplug_seq) {
 		global_hotplug_seq = atomic_long_read(&scx_hotplug_seq);
 		if (ops->hotplug_seq != global_hotplug_seq) {
-			scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
+			scx_exit(SCX_EXIT_UNREG_KERN,
+				 SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 				 "expected hotplug seq %llu did not match actual %llu",
 				 ops->hotplug_seq, global_hotplug_seq);
 		}
@@ -7125,7 +7127,7 @@ __bpf_kfunc void scx_bpf_exit_bstr(s64 e
 
 	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
 	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
-		__scx_exit(SCX_EXIT_UNREG_BPF, exit_code, "%s", scx_exit_bstr_buf.line);
+		scx_exit(SCX_EXIT_UNREG_BPF, exit_code, "%s", scx_exit_bstr_buf.line);
 	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
 }
 
@@ -7145,7 +7147,7 @@ __bpf_kfunc void scx_bpf_error_bstr(char
 
 	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
 	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
-		__scx_exit(SCX_EXIT_ERROR_BPF, 0, "%s", scx_exit_bstr_buf.line);
+		scx_exit(SCX_EXIT_ERROR_BPF, 0, "%s", scx_exit_bstr_buf.line);
 	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
 }
 
