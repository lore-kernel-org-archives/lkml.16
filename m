Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906DD30E84F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364030; cv=none; b=IKvi9I8ibWGliE52l4kIhRP5uxwG3m8HRz4Q40BcBW1BU5zONPjdcYONrvMNnrUAdeWelOQAtaGq0WKWVoxPvtX3MftLnnReRikxpfSH8EzrXC9rl3NKXCJIQ53E4rkjArPmrcecwx1pjSEx8dCgGg7V/vEAQDoADYaY9Vv3gN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364030; c=relaxed/simple;
	bh=xR2GATWvtT7K0WDhtq6quOlxEBwkLwdI0hvfuAeWvcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zjjrd/kPoxLXyRQJRjykn2h104uQm0OcVMxrGeT3hhVbyxSQq69LTEKeWTgJqNZb1Le5DFXyAxM1y48tyJA0c1iYZQ2kcJFRPUPErdCMDZd0WzvqVnkea27beQEm2W0V+Wi+ETix4KHqP4OsiWDJM1aVwXYvewnuZYig6lPniLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=mVVgocVP; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="mVVgocVP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Njqfd1V34EDc3gdJJICc7zOO8FOT70GrNPNIY7ze66k=; b=mVVgocVPXureDbVbybeI+nKTop
	gHDquOzyCOavmM0jFskm9cadKN8sbbhjJxE/hwEVR+pLSSnW7p7hZMWRacK+f3Ti2wZqjmEri1ioi
	E3w6Bb1qWpcqZZRDHraN2H01bASrJzMjDc6CGB2wwC7ZFTXoHwoo4gMXyKJ1HJ9eTCPAiq9vWEExh
	bFf2M0QqfMVrLaXTj15eO5mEyLoy0cHXxSe62HW7sh0060g/hRsFNhBq3N3Xq6kIvgjJBnM+dwqlN
	+flHuSuc8JHNVyZ/yv0M+lFBMBGNUUOsQLEE82yCJX6eXsd9sZXv5zPwwv2LirLG1rsO0853osHDy
	vVOkbAfQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSLV6-000000000CT-25tR;
	Thu, 19 Jun 2025 16:04:44 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Rik van Riel <riel@meta.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v4 8/8] x86/tlb: flush the local TLB twice (DEBUG)
Date: Thu, 19 Jun 2025 16:04:00 -0400
Message-ID: <20250619200442.1694583-9-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619200442.1694583-1-riel@surriel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rik van Riel <riel@meta.com>

The RAR code attempts to flush the local TLB in addition to remote TLBs,
if the local TLB is in the cpumask. This can be seen in that the status
for the local CPU is changed from RAR_PENDING to RAR_SUCCESS.

However, it appears that the local TLB is not actually getting flushed
when the microcode flips the status to RAR_SUCCESS!

The RAR white paper suggests it should work:

"At this point, the ILP may invalidate its own TLB by signaling RAR
 to itself in order to invoke the RAR handler locally as well."

I would really appreciate some guidance from Intel on how to move
forward here.

Is the RAR code doing something wrong?

Is the CPU not behaving quite as documented?

What is the best way forward?

Not-signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/mm/tlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 590742838e43..f12eff2dbcc8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1469,22 +1469,22 @@ static void rar_tlb_flush(struct flush_tlb_info *info)
 {
 	unsigned long asid = mm_global_asid(info->mm);
 	cpumask_t *cpumask = mm_cpumask(info->mm);
+	int cpu = raw_smp_processor_id();
 	u16 pcid = kern_pcid(asid);
 
 	if (info->trim_cpumask)
 		trim_cpumask(info);
 
 	/* Only the local CPU needs to be flushed? */
-	if (cpumask_equal(cpumask, cpumask_of(raw_smp_processor_id()))) {
+	if (cpumask_test_cpu(cpu, cpumask)) {
 		lockdep_assert_irqs_enabled();
 		local_irq_disable();
 		flush_tlb_func(info);
 		local_irq_enable();
-		return;
 	}
 
 	/* Flush all the CPUs at once with RAR. */
-	if (cpumask_weight(cpumask)) {
+	if (cpumask_any_but(cpumask, cpu)) {
 		smp_call_rar_many(mm_cpumask(info->mm), pcid, info->start, info->end);
 		if (cpu_feature_enabled(X86_FEATURE_PTI))
 			smp_call_rar_many(mm_cpumask(info->mm), user_pcid(asid), info->start, info->end);
-- 
2.49.0

