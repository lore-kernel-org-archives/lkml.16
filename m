Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351227D795
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350076; cv=none; b=Phg3LZEbkIgGKj7orJWQqNsoeLUuXiKJK/1jubVdZoDlovtb3WWk2BqOQNT2Rp88qu3q/sgDPWP3ypWASaAU3+Lb1QS6IdPPSp523LkAR2XxqAB1KDyP22y7w5bpECtXZecH5qZFgBetLBq0nBKO9qn4IPny2lclEzgYF55HIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350076; c=relaxed/simple;
	bh=NO6FtaESPRYJpWa3pRYGQg6ozRF+SKuxjJZ4vEwmzXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kN9KF0l9+1/Zc/98HVCQwh8SMhtZt/YSmsYmxo0PvY6EMn1wlBuu3lfaK1YX/LFn0HXLls5w1dJOhT2UYWP818njK/+ZoxE5Y/ahRSIl6G+T/v3W4pnVZO9oAL4kQy5ZlVhPLTAYbF/mk7uZzJhO29YTFlkqHyxtuNOqXKPcPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+fN8i83; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+fN8i83"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8239AC4CEE5;
	Fri, 11 Apr 2025 05:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350074;
	bh=NO6FtaESPRYJpWa3pRYGQg6ozRF+SKuxjJZ4vEwmzXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+fN8i83+EiBWRYSIjcpxnd01I350XamVr7qFHr6qL+lWYjK+YBgxWdpKJjldmPS9
	 VLJym9W4TLlxWUHFz7tIwH3pt/tP2HgYpvQ6OtGJ09Nx0zB0ktFdUsaAVgga7WPUrs
	 ZykWoJVP324IZlK9h5WBDo/RgDS/a8XSDXsNIvVDadcIo6iDqduX4Q02QURP/N8yWX
	 QyzJwN/WoJRVhChw5WaJBt1AdaypGRE18zIhJpPM0sPb9RIDDylecNqC6Mlye4GXmO
	 Fa6BoVQp1EuglR1ZLboWkpOWcqbzeu+qPbGNJxGpDvpITCJI86fOtkq0LTJbCKW+m9
	 nER0eSJlmYprg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Eric Dumazet <edumazet@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	Brian Gerst <brgerst@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH 01/53] x86/alternatives: Improve code-patching scalability by removing false sharing in poke_int3_handler()
Date: Fri, 11 Apr 2025 07:40:13 +0200
Message-ID: <20250411054105.2341982-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@google.com>

eBPF programs can be run 50,000,000 times per second on busy servers.

Whenever /proc/sys/kernel/bpf_stats_enabled is turned off,
hundreds of calls sites are patched from text_poke_bp_batch()
and we see a huge loss of performance due to false sharing
on bp_desc.refs lasting up to three seconds.

   51.30%  server_bin       [kernel.kallsyms]           [k] poke_int3_handler
            |
            |--46.45%--poke_int3_handler
            |          exc_int3
            |          asm_exc_int3
            |          |
            |          |--24.26%--cls_bpf_classify
            |          |          tcf_classify
            |          |          __dev_queue_xmit
            |          |          ip6_finish_output2
            |          |          ip6_output
            |          |          ip6_xmit
            |          |          inet6_csk_xmit
            |          |          __tcp_transmit_skb

Fix this by replacing bp_desc.refs with a per-cpu bp_refs.

Before the patch, on a host with 240 cores (480 threads):

  $ sysctl -wq kernel.bpf_stats_enabled=0

  text_poke_bp_batch(nr_entries=164) : Took 2655300 usec

  $ bpftool prog | grep run_time_ns
  ...
  105: sched_cls  name hn_egress  tag 699fc5eea64144e3  gpl run_time_ns
  3009063719 run_cnt 82757845 : average cost is 36 nsec per call

After this patch:

  $ sysctl -wq kernel.bpf_stats_enabled=0

  text_poke_bp_batch(nr_entries=164) : Took 702 usec

  $ bpftool prog | grep run_time_ns
  ...
  105: sched_cls  name hn_egress  tag 699fc5eea64144e3  gpl run_time_ns
  1928223019 run_cnt 67682728 : average cost is 28 nsec per call

Ie. text-patching performance improved 3700x: from 2.65 seconds
to 0.0007 seconds.

Since the atomic_cond_read_acquire(refs, !VAL) spin-loop was not triggered
even once in my tests, add an unlikely() annotation, because this appears
to be the common case.

[ mingo: Improved the changelog some more. ]

Signed-off-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lore.kernel.org/r/20250325043316.874518-1-edumazet@google.com
---
 arch/x86/kernel/alternative.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index bf82c6f7d690..85089c79a828 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2474,28 +2474,29 @@ struct text_poke_loc {
 struct bp_patching_desc {
 	struct text_poke_loc *vec;
 	int nr_entries;
-	atomic_t refs;
 };
 
+static DEFINE_PER_CPU(atomic_t, bp_refs);
+
 static struct bp_patching_desc bp_desc;
 
 static __always_inline
 struct bp_patching_desc *try_get_desc(void)
 {
-	struct bp_patching_desc *desc = &bp_desc;
+	atomic_t *refs = this_cpu_ptr(&bp_refs);
 
-	if (!raw_atomic_inc_not_zero(&desc->refs))
+	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return desc;
+	return &bp_desc;
 }
 
 static __always_inline void put_desc(void)
 {
-	struct bp_patching_desc *desc = &bp_desc;
+	atomic_t *refs = this_cpu_ptr(&bp_refs);
 
 	smp_mb__before_atomic();
-	raw_atomic_dec(&desc->refs);
+	raw_atomic_dec(refs);
 }
 
 static __always_inline void *text_poke_addr(struct text_poke_loc *tp)
@@ -2528,9 +2529,9 @@ noinstr int poke_int3_handler(struct pt_regs *regs)
 	 * Having observed our INT3 instruction, we now must observe
 	 * bp_desc with non-zero refcount:
 	 *
-	 *	bp_desc.refs = 1		INT3
-	 *	WMB				RMB
-	 *	write INT3			if (bp_desc.refs != 0)
+	 *	bp_refs = 1		INT3
+	 *	WMB			RMB
+	 *	write INT3		if (bp_refs != 0)
 	 */
 	smp_rmb();
 
@@ -2636,7 +2637,8 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
 	 * ensure reading a non-zero refcount provides up to date bp_desc data.
 	 */
-	atomic_set_release(&bp_desc.refs, 1);
+	for_each_possible_cpu(i)
+		atomic_set_release(per_cpu_ptr(&bp_refs, i), 1);
 
 	/*
 	 * Function tracing can enable thousands of places that need to be
@@ -2750,8 +2752,12 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
 	/*
 	 * Remove and wait for refs to be zero.
 	 */
-	if (!atomic_dec_and_test(&bp_desc.refs))
-		atomic_cond_read_acquire(&bp_desc.refs, !VAL);
+	for_each_possible_cpu(i) {
+		atomic_t *refs = per_cpu_ptr(&bp_refs, i);
+
+		if (unlikely(!atomic_dec_and_test(refs)))
+			atomic_cond_read_acquire(refs, !VAL);
+	}
 }
 
 static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
-- 
2.45.2

