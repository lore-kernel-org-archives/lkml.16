Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E334545
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719662; cv=none; b=eTA/ozgNf3V40s0YNUxaazEE9xP4RTUhcnuAT+ZaN3CO2e/ftsnueWAefXGZijz6abIKuIYyMm8ovqwAIRiMtgxn2YT5xuXQ3YJZyB9cIfTjManSZlh3PWr7FEn5OfAvjbiydd0ETGPFlEtuIsGg3OALG2iOJd1LAsCVeAwM9wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719662; c=relaxed/simple;
	bh=i+++SASEOGD19IVsqN/2m3gYyijmpi9IV5d573c+/GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3LJ9Ncz/aDw2VaBKauAw3uCmp86kYlKQZzGFKFergQj/u/QP/iX+gr3/ZJr8Tbdbv34P4ubQTb9Lzf2sn9eRLHUwW/gGL7VzGANUDz0VaaHMBcSBwhGAAfRerV5Ytb9etanrVn4lQUbt2sFffnNBYTOzoAzKsEf6edmNkI8eNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tfUP4-000000004Cs-35hO;
	Tue, 04 Feb 2025 20:40:34 -0500
From: Rik van Riel <riel@surriel.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	bp@alien8.de,
	peterz@infradead.org,
	dave.hansen@linux.intel.com,
	zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com,
	thomas.lendacky@amd.com,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	mhklinux@outlook.com,
	andrew.cooper3@citrix.com,
	Rik van Riel <riel@surriel.com>,
	Manali Shukla <Manali.Shukla@amd.com>
Subject: [PATCH v8 08/12] x86/mm: use broadcast TLB flushing for page reclaim TLB flushing
Date: Tue,  4 Feb 2025 20:39:57 -0500
Message-ID: <20250205014033.3626204-9-riel@surriel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205014033.3626204-1-riel@surriel.com>
References: <20250205014033.3626204-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

In the page reclaim code, we only track the CPU(s) where the TLB needs
to be flushed, rather than all the individual mappings that may be getting
invalidated.

Use broadcast TLB flushing when that is available.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/mm/tlb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 43e1abd4bcb0..25c13416a0e8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1326,7 +1326,9 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 	 * a local TLB flush is needed. Optimize this use-case by calling
 	 * flush_tlb_func_local() directly in this case.
 	 */
-	if (cpumask_any_but(&batch->cpumask, cpu) < nr_cpu_ids) {
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+		invlpgb_flush_all_nonglobals();
+	} else if (cpumask_any_but(&batch->cpumask, cpu) < nr_cpu_ids) {
 		flush_tlb_multi(&batch->cpumask, info);
 	} else if (cpumask_test_cpu(cpu, &batch->cpumask)) {
 		lockdep_assert_irqs_enabled();
-- 
2.47.1

