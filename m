Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8316DEA9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738817058; cv=none; b=T0HW57nlewL5JKEJVYWH5g4/QReo6pApVuKMGwGpZRCZgkMRUZIWjN89trGB3OMvDV/P+ypfQBauJEbxBMQvB/NYKkY8hDTJWhNzjygJxOvR02l2SMx+hgvPrqr1Gp0wmCc8nAxZhUq25FHyBk7hEPyn/uQwEJqFEVci2ga2G5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738817058; c=relaxed/simple;
	bh=FCF4J27rl0Y1TlIx4gXdyeCjfh34nB394+2260jYXzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkP45ah2x3TnMNV1J3VijqEn0yL9thzcp8wTxHjLMNSyuaOzVnHrGd7mAbr2/9xUXnNa9GjItFMzxwkdpCWYukMpBDKYsUrTkyB44t3M1n+OIsfsoe2x9vTVQD5u/7uApfYzoKYgVYHtiRUQ0iTHaSC67K3QZsvNM/eoTMZWDJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tftjw-000000004tQ-2FVL;
	Wed, 05 Feb 2025 23:43:48 -0500
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
Subject: [PATCH v9 06/12] x86/mm: use INVLPGB for kernel TLB flushes
Date: Wed,  5 Feb 2025 23:43:25 -0500
Message-ID: <20250206044346.3810242-7-riel@surriel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206044346.3810242-1-riel@surriel.com>
References: <20250206044346.3810242-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

Use broadcast TLB invalidation for kernel addresses when available.

Remove the need to send IPIs for kernel TLB flushes.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/mm/tlb.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 36939b104561..227e972b6fbc 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1086,6 +1086,30 @@ void flush_tlb_all(void)
 	on_each_cpu(do_flush_tlb_all, NULL, 1);
 }
 
+static bool broadcast_kernel_range_flush(struct flush_tlb_info *info)
+{
+	unsigned long addr;
+	unsigned long nr;
+
+	if (!IS_ENABLED(CONFIG_X86_BROADCAST_TLB_FLUSH))
+		return false;
+
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+		return false;
+
+	if (info->end == TLB_FLUSH_ALL) {
+		invlpgb_flush_all();
+		return true;
+	}
+
+	for (addr = info->start; addr < info->end; addr += nr << PAGE_SHIFT) {
+		nr = min((info->end - addr) >> PAGE_SHIFT, invlpgb_count_max);
+		invlpgb_flush_addr_nosync(addr, nr);
+	}
+	tlbsync();
+	return true;
+}
+
 static void do_kernel_range_flush(void *info)
 {
 	struct flush_tlb_info *f = info;
@@ -1105,7 +1129,9 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	info = get_flush_tlb_info(NULL, start, end, PAGE_SHIFT, false,
 				  TLB_GENERATION_INVALID);
 
-	if (info->end == TLB_FLUSH_ALL)
+	if (broadcast_kernel_range_flush(info))
+		; /* Fall through. */
+	else if (info->end == TLB_FLUSH_ALL)
 		on_each_cpu(do_flush_tlb_all, NULL, 1);
 	else
 		on_each_cpu(do_kernel_range_flush, info, 1);
-- 
2.47.1

