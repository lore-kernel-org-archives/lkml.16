Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1930542A97
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017850; cv=none; b=pVu7qYcW2MCFAtYe7NiUjzIZr2+EIuuhrrpMjYpa15bUnPhMpm61O5DY6K7Y1NEelk18qAIu5LCjkJMqIEkV3AI9KVRdctl1dcHBkVXmkoI+C5mcBtoIbwRtFDzxMqAy7CwmmGCNc69K6TPeU+241xaDWrn6Rj3JDkcZvrPY65U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017850; c=relaxed/simple;
	bh=gq1Xj/M3orWe8oAAO6fD3x0IRJTeENqeec0izr4rszg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bmsGAzuAST+LH6JbBNeplZVOfqJa96HQb5syHFrDMIQzpYmPNj5nTjDfdXZimX7Dar9Xy80ZwKBTY5UnvlxFLRHAoVg1yO6oBOAnCLUWjYgKMG/EEYVMVbNqc1AIt4tbcl0ZUK+th1ZHIVP134KTFDKNsxLBWJPKbYf8sVHnGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=d3JbWkbc; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="d3JbWkbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8TN9/
	6BnKvyU3e8vS2iprMvt0bdbH7kVE3wStXcniB4=; b=d3JbWkbc94Y9e0M1/KoJZ
	kJCyNIX5hYPPv5KEDfpgU49ogkrXWuQDHG99CC1liP2oR3dx8/IgApfkGGeUbeDF
	n7xib3tanF2iFbJPf+/cjXtxJqYpwkjKpUT6vn+EejgVSGa8fgxK9zigJF+vNWNF
	IrkHR5+Jej5uuiiwHABwNg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDn32p6mfNne6pOEw--.1721S2;
	Mon, 07 Apr 2025 17:23:06 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	ioworker0@gmail.com
Cc: xavier_qy@163.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
Date: Mon,  7 Apr 2025 17:22:43 +0800
Message-Id: <20250407092243.2207837-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn32p6mfNne6pOEw--.1721S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur43Cr17tw15uF4xZry7KFg_yoWkArb_Zr
	4xtasxXF1UJFyjgFyUt398Gryjgayj93W3JFn29r1UXryfW3yfXrZ2qF92gF1xWrWagr45
	trn8Jr13uFnrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNE_MDUUUUU==
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTh8oEGfzkOnw9AABsB

This commit optimizes the contpte_ptep_get function by adding early
 termination logic. It checks if the dirty and young bits of orig_pte
 are already set and skips redundant bit-setting operations during
 the loop. This reduces unnecessary iterations and improves performance.

Signed-off-by: Xavier <xavier_qy@163.com>
---
 arch/arm64/mm/contpte.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..ca15d8f52d14 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 
 	pte_t pte;
 	int i;
+	bool dirty = false;
+	bool young = false;
 
 	ptep = contpte_align_down(ptep);
 
 	for (i = 0; i < CONT_PTES; i++, ptep++) {
 		pte = __ptep_get(ptep);
 
-		if (pte_dirty(pte))
+		if (!dirty && pte_dirty(pte)) {
+			dirty = true;
 			orig_pte = pte_mkdirty(orig_pte);
+		}
 
-		if (pte_young(pte))
+		if (!young && pte_young(pte)) {
+			young = true;
 			orig_pte = pte_mkyoung(orig_pte);
+		}
+
+		if (dirty && young)
+			break;
 	}
 
 	return orig_pte;
-- 
2.34.1

