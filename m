Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0E019E7D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670589; cv=none; b=aFGPMxd2fQl1+Awq6VqATsZOxwSCyRP4Fx+uIU6mE//njS+383Tzcp323cpnvOILuvIG6uPmQEXi0t+2Uh3hKzzNeW0kxQHCMSK2SuM60WzRdXL4Q9cg54LvwplwSenlXijMB1BVvW2/jHmgdaEZbpMRixWY7ViIBhoit/aDoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670589; c=relaxed/simple;
	bh=Hd4Si+xILJyJIG5jtkXwM+Ouh5/HNXXQ/bqZuHD2lkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJC2h4CHNrdQu5lOOfoiGRGZfwUkB6vKhhFLjc2xsvnT7KB0HDbOD0XNS+DRkjFBevDn7HgGwUzvjb7UuIg16nzb0oWO2Nf75sLkxAOCSow6dkOInXr6jI8IMBmFe2FX+rtXn4c7xFVrffHGjgqqGYiIAMGJnMTuwb+LG+jfrWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMkB3gUS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMkB3gUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A89C4CEE3;
	Thu,  3 Apr 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743670588;
	bh=Hd4Si+xILJyJIG5jtkXwM+Ouh5/HNXXQ/bqZuHD2lkg=;
	h=From:To:Cc:Subject:Date:From;
	b=qMkB3gUSUFZc++3tM2UnDjv0v4LSLp8w18anwy5n5hU/+AtuiohT1AiQCyNivPKpi
	 YrEf4qtZuv9Kz9U1UiJNKBCMnvAX/RUcPW9kbq0E4H6Df4gx2m1CuXyqZf51+QsODZ
	 g1oK0Js6xkKdiOSMwCzMbJYcfyCYRtRVTw2kwaRVRDEcKabNfUNa71199Gf4kTlVT9
	 CwgZ6Q+m8DvL46DODPaUHl2l1YRPZY+tIGYxkz4R1Jmlqz59frM1pwy9WTqgDaL/FG
	 njiw1M2P5qZzd6cZ2BFjzguUfPvyvjGLlPYIPUTDZpZb47Kj/kGTg8JenOqrZ6fCgy
	 IJQCCBoTrkgfw==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] x86/tlb: Simplify choose_new_asid()
Date: Thu,  3 Apr 2025 10:56:23 +0200
Message-ID: <20250403085623.20824-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Have it return the two things it does return:

 - a new ASID and
 - the need to flush the TLB or not,

in a struct which fits in a single 32-bit register and whack the IO
parameters.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/mm/tlb.c | 63 +++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index e459d97ef397..d00ae21d0ee2 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -215,16 +215,20 @@ static void clear_asid_other(void)
 
 atomic64_t last_mm_ctx_id = ATOMIC64_INIT(1);
 
+struct new_asid {
+	unsigned int asid	: 16;
+	unsigned int need_flush : 1;
+};
 
-static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
-			    u16 *new_asid, bool *need_flush)
+static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tlb_gen)
 {
+	struct new_asid ns;
 	u16 asid;
 
 	if (!static_cpu_has(X86_FEATURE_PCID)) {
-		*new_asid = 0;
-		*need_flush = true;
-		return;
+		ns.asid = 0;
+		ns.need_flush = 1;
+		return ns;
 	}
 
 	/*
@@ -235,9 +239,9 @@ static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
 		u16 global_asid = mm_global_asid(next);
 
 		if (global_asid) {
-			*new_asid = global_asid;
-			*need_flush = false;
-			return;
+			ns.asid = global_asid;
+			ns.need_flush = 0;
+			return ns;
 		}
 	}
 
@@ -249,22 +253,23 @@ static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
 		    next->context.ctx_id)
 			continue;
 
-		*new_asid = asid;
-		*need_flush = (this_cpu_read(cpu_tlbstate.ctxs[asid].tlb_gen) <
-			       next_tlb_gen);
-		return;
+		ns.asid = asid;
+		ns.need_flush = (this_cpu_read(cpu_tlbstate.ctxs[asid].tlb_gen) < next_tlb_gen);
+		return ns;
 	}
 
 	/*
 	 * We don't currently own an ASID slot on this CPU.
 	 * Allocate a slot.
 	 */
-	*new_asid = this_cpu_add_return(cpu_tlbstate.next_asid, 1) - 1;
-	if (*new_asid >= TLB_NR_DYN_ASIDS) {
-		*new_asid = 0;
+	ns.asid = this_cpu_add_return(cpu_tlbstate.next_asid, 1) - 1;
+	if (ns.asid >= TLB_NR_DYN_ASIDS) {
+		ns.asid = 0;
 		this_cpu_write(cpu_tlbstate.next_asid, 1);
 	}
-	*need_flush = true;
+	ns.need_flush = true;
+
+	return ns;
 }
 
 /*
@@ -781,9 +786,9 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	bool was_lazy = this_cpu_read(cpu_tlbstate_shared.is_lazy);
 	unsigned cpu = smp_processor_id();
 	unsigned long new_lam;
+	struct new_asid ns;
 	u64 next_tlb_gen;
-	bool need_flush;
-	u16 new_asid;
+
 
 	/* We don't want flush_tlb_func() to run concurrently with us. */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING))
@@ -854,7 +859,7 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		/* Check if the current mm is transitioning to a global ASID */
 		if (mm_needs_global_asid(next, prev_asid)) {
 			next_tlb_gen = atomic64_read(&next->context.tlb_gen);
-			choose_new_asid(next, next_tlb_gen, &new_asid, &need_flush);
+			ns = choose_new_asid(next, next_tlb_gen);
 			goto reload_tlb;
 		}
 
@@ -889,8 +894,8 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		 * TLB contents went out of date while we were in lazy
 		 * mode. Fall through to the TLB switching code below.
 		 */
-		new_asid = prev_asid;
-		need_flush = true;
+		ns.asid = prev_asid;
+		ns.need_flush = true;
 	} else {
 		/*
 		 * Apply process to process speculation vulnerability
@@ -918,21 +923,21 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 			cpumask_set_cpu(cpu, mm_cpumask(next));
 		next_tlb_gen = atomic64_read(&next->context.tlb_gen);
 
-		choose_new_asid(next, next_tlb_gen, &new_asid, &need_flush);
+		ns = choose_new_asid(next, next_tlb_gen);
 	}
 
 reload_tlb:
 	new_lam = mm_lam_cr3_mask(next);
-	if (need_flush) {
-		VM_WARN_ON_ONCE(is_global_asid(new_asid));
-		this_cpu_write(cpu_tlbstate.ctxs[new_asid].ctx_id, next->context.ctx_id);
-		this_cpu_write(cpu_tlbstate.ctxs[new_asid].tlb_gen, next_tlb_gen);
-		load_new_mm_cr3(next->pgd, new_asid, new_lam, true);
+	if (ns.need_flush) {
+		VM_WARN_ON_ONCE(is_global_asid(ns.asid));
+		this_cpu_write(cpu_tlbstate.ctxs[ns.asid].ctx_id, next->context.ctx_id);
+		this_cpu_write(cpu_tlbstate.ctxs[ns.asid].tlb_gen, next_tlb_gen);
+		load_new_mm_cr3(next->pgd, ns.asid, new_lam, true);
 
 		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
 	} else {
 		/* The new ASID is already up to date. */
-		load_new_mm_cr3(next->pgd, new_asid, new_lam, false);
+		load_new_mm_cr3(next->pgd, ns.asid, new_lam, false);
 
 		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, 0);
 	}
@@ -941,7 +946,7 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	barrier();
 
 	this_cpu_write(cpu_tlbstate.loaded_mm, next);
-	this_cpu_write(cpu_tlbstate.loaded_mm_asid, new_asid);
+	this_cpu_write(cpu_tlbstate.loaded_mm_asid, ns.asid);
 	cpu_tlbstate_update_lam(new_lam, mm_untag_mask(next));
 
 	if (next != prev) {
-- 
2.43.0

