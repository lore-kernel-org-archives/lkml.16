Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2120C034
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719660; cv=none; b=uK+kKosKGL8xD91pNS5ECObbhGj2fhS33HcMalJ9aEu8/Wuhgi4FY4s59G8HZMN9TP1uUm+HxZ7pwixteslemjnLmqQUOnGF/vS/KeC6bu0EOcuAgju/qnJoyZjBs9nxSLgIkl2IyM76RcLL9n6LnZUEbcYjBR9htQfajd61laI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719660; c=relaxed/simple;
	bh=Ft/O0RncNKY751ZakPXjNDyAkt0whslOXDCWNGndtvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0eMcdrv6mer9qXDFIre6RBIksVk+DmXtARocOC+9sArrLKKA4oz0eeS3PNmeUV+VRKOedbYyQRpRE7kxOawwK0LDGGNVCZMX1U5xIsHDsSuX0GvFfcN04Qs2lfmcMza+PDb/UzSMUQ71U9Ot/4jjRwXs/nnwKvZYMbptSK/cQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tfUP4-000000004Cs-2ubK;
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
Subject: [PATCH v8 06/12] x86/mm: use INVLPGB for kernel TLB flushes
Date: Tue,  4 Feb 2025 20:39:55 -0500
Message-ID: <20250205014033.3626204-7-riel@surriel.com>
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

Use broadcast TLB invalidation for kernel addresses when available.

Remove the need to send IPIs for kernel TLB flushes.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/mm/tlb.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 02e1f5c5bca3..7945624afc98 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1082,6 +1082,30 @@ void flush_tlb_all(void)
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
@@ -1101,7 +1125,9 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
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

