Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FD1CAA79
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750850; cv=none; b=h1rgqHGuOUZBeMS3HTm8gb48orIbdzsDpfcfnwg6BUUsB6+ARlHPYSKWChYlX6oCe01ftJ7ZJ30rGDCWLkbuAxMDSwVGuoFFboJyEYiUf4tkTkGzZxwvrkzcJAVPUaJfyEOx9NzP0r3D5tvLAzCVwZgXJJaPAw/mGpn5K7zi5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750850; c=relaxed/simple;
	bh=Va5qoeMEVdGv0YapZun5gFjoj2QQybjvFlAWerI0i/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hCAzDyDy37R7pinrTZ4JWMN9PM93Mz/28XhJrvg9s2JOS1koqp7nkoSUrn20VqF9LMddBnFK50CnxcPVgId1iopOfSy/99vgm9B7EZ9Pboxdoqr/m6dwrSaKvC4JTSNVqm3ktEv52hRHCW1bBhCnq9sP9t+gCYa2HDYHDUQ7ey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHNpc-000000002GA-2mBp;
	Tue, 20 May 2025 10:20:36 -0400
Date: Tue, 20 May 2025 10:20:36 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, kernel-team@meta.com, dave.hansen@linux.intel.com,
 luto@kernel.org, mingo@redhat.com, bp@alien8.de, peterz@infradead.org,
 nadav.amit@gmail.com
Subject: [PATCH] x86/mm: fix race between flush_tlb_func and idle task
 leave_mm
Message-ID: <20250520102036.5d61f565@fangorn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: riel@surriel.com

There is a tiny race window between flush_tlb_func() and the call to
leave_mm() from cpuidle_enter_state() in the idle task.

The race happens when a CPU goes idle, through enter_lazy_tlb(),
while the process on the CPU is transitioning to a global ASID.

If the TLB flush IPI arrives between the call to enter_lazy_tlb(),
and the CPU actually going idle, the mm_needs_global_asid()
branch in flush_tlb_func() will switch the CPU to the global
ASID, and return with the CPU no longer in lazy TLB mode.

If the system then selects a deeper idle state, the warning in
leave_mm() will trigger.

This race has not been observed with only the INVLPGB code running
on several thousand hosts over several weeks, but it's showing up
several times a minute in my tests with the RAR code.

Avoid the race by moving the .is_lazy test to before the global ASID
test in flush_tlb_func().

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: 4afeb0ed1753 x86/mm: Enable broadcast TLB invalidation for multi-threaded processes
Cc: stable@kernel.org
---
 arch/x86/mm/tlb.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 3feb6ae2b678..9010bcfdfc20 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1150,6 +1150,20 @@ static void flush_tlb_func(void *info)
 	if (unlikely(loaded_mm == &init_mm))
 		return;
 
+	if (this_cpu_read(cpu_tlbstate_shared.is_lazy)) {
+		/*
+		 * We're in lazy mode.  We need to at least flush our
+		 * paging-structure cache to avoid speculatively reading
+		 * garbage into our TLB.  Since switching to init_mm is barely
+		 * slower than a minimal flush, just switch to init_mm.
+		 *
+		 * This should be rare, with native_flush_tlb_multi() skipping
+		 * IPIs to lazy TLB mode CPUs.
+		 */
+		switch_mm_irqs_off(NULL, &init_mm, NULL);
+		return;
+	}
+
 	/* Reload the ASID if transitioning into or out of a global ASID */
 	if (mm_needs_global_asid(loaded_mm, loaded_mm_asid)) {
 		switch_mm_irqs_off(NULL, loaded_mm, NULL);
@@ -1168,20 +1182,6 @@ static void flush_tlb_func(void *info)
 	VM_WARN_ON(is_dyn_asid(loaded_mm_asid) && loaded_mm->context.ctx_id !=
 		   this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id));
 
-	if (this_cpu_read(cpu_tlbstate_shared.is_lazy)) {
-		/*
-		 * We're in lazy mode.  We need to at least flush our
-		 * paging-structure cache to avoid speculatively reading
-		 * garbage into our TLB.  Since switching to init_mm is barely
-		 * slower than a minimal flush, just switch to init_mm.
-		 *
-		 * This should be rare, with native_flush_tlb_multi() skipping
-		 * IPIs to lazy TLB mode CPUs.
-		 */
-		switch_mm_irqs_off(NULL, &init_mm, NULL);
-		return;
-	}
-
 	if (is_dyn_asid(loaded_mm_asid))
 		local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
 
-- 
2.47.1


