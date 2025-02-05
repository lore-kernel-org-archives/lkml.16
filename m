Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A1D537FF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719661; cv=none; b=MYtoZVX3YdFhlb7FuDwROCg47aEU4STEmHR9W7wf1ubSVcxSO1FX81i6JTyPcJapvTmsIWkS+5Gwj4NYZXaCM5ZL8x7NW0QgtMS+132BaFbu8wpaH5m+DAuyPy8waOwtVg6QDY7ip5Li5C90o3Lew57eoUUkdIrc+SIAyv/UdGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719661; c=relaxed/simple;
	bh=Fx0WbaHWpxDNQVGH3hoEI7JvWoIRK1wa/e6Vvj62ZiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJ+iZ3S+I4w/jE+ZtFQ6t8WF8BKSLoFMLHxHpRSiof1tq6l4mNpy5cChKvdwJCbjvhlnFAVatLG332Nuj9lqSbPJeasHLN98j9roBLsoAjMw9LKPf2MnfTLblbNeXMB4GIFcg59gqJA1An/K0pZM4Ip8Slw/Wm3G0VmuC8M7JJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tfUP4-000000004Cs-3UtC;
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
Subject: [PATCH v8 12/12] x86/mm: only invalidate final translations with INVLPGB
Date: Tue,  4 Feb 2025 20:40:01 -0500
Message-ID: <20250205014033.3626204-13-riel@surriel.com>
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

Use the INVLPGB_FINAL_ONLY flag when invalidating mappings with INVPLGB.
This way only leaf mappings get removed from the TLB, leaving intermediate
translations cached.

On the (rare) occasions where we free page tables we do a full flush,
ensuring intermediate translations get flushed from the TLB.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/include/asm/invlpgb.h | 10 ++++++++--
 arch/x86/mm/tlb.c              |  8 ++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/invlpgb.h b/arch/x86/include/asm/invlpgb.h
index a1d5dedd5217..5fba41671a6d 100644
--- a/arch/x86/include/asm/invlpgb.h
+++ b/arch/x86/include/asm/invlpgb.h
@@ -67,9 +67,15 @@ static inline void invlpgb_flush_user(unsigned long pcid,
 static inline void invlpgb_flush_user_nr_nosync(unsigned long pcid,
 						unsigned long addr,
 						u16 nr,
-						bool pmd_stride)
+						bool pmd_stride,
+						bool freed_tables)
 {
-	__invlpgb(0, pcid, addr, nr - 1, pmd_stride, INVLPGB_PCID | INVLPGB_VA);
+	unsigned long flags = INVLPGB_PCID | INVLPGB_VA;
+
+	if (!freed_tables)
+		flags |= INVLPGB_FINAL_ONLY;
+
+	__invlpgb(0, pcid, addr, nr - 1, pmd_stride, flags);
 }
 
 /* Flush all mappings for a given PCID, not including globals. */
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index c064e27df1f3..7b116898c547 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -518,10 +518,10 @@ static void broadcast_tlb_flush(struct flush_tlb_info *info)
 		nr = min(maxnr, (info->end - addr) >> info->stride_shift);
 		nr = max(nr, 1);
 
-		invlpgb_flush_user_nr_nosync(kern_pcid(asid), addr, nr, pmd);
+		invlpgb_flush_user_nr_nosync(kern_pcid(asid), addr, nr, pmd, info->freed_tables);
 		/* Do any CPUs supporting INVLPGB need PTI? */
 		if (static_cpu_has(X86_FEATURE_PTI))
-			invlpgb_flush_user_nr_nosync(user_pcid(asid), addr, nr, pmd);
+			invlpgb_flush_user_nr_nosync(user_pcid(asid), addr, nr, pmd, info->freed_tables);
 
 		addr += nr << info->stride_shift;
 	} while (addr < info->end);
@@ -1688,10 +1688,10 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			batch->used_invlpgb = true;
 			migrate_disable();
 		}
-		invlpgb_flush_user_nr_nosync(kern_pcid(asid), uaddr, 1, false);
+		invlpgb_flush_user_nr_nosync(kern_pcid(asid), uaddr, 1, false, false);
 		/* Do any CPUs supporting INVLPGB need PTI? */
 		if (static_cpu_has(X86_FEATURE_PTI))
-			invlpgb_flush_user_nr_nosync(user_pcid(asid), uaddr, 1, false);
+			invlpgb_flush_user_nr_nosync(user_pcid(asid), uaddr, 1, false, false);
 
 		/*
 		 * Some CPUs might still be using a local ASID for this
-- 
2.47.1

