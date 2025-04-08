Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D28C33CA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102743; cv=none; b=VaHYxv1kdzjlkSje/j/KVG+w9Xbs/noKwROTLqKLunFX9xv/ar7nOf40kqtwmvj/o7jNYzIGCsjusUQyw4Z/uBdNt12P/0OywX/exZVc9NdrogVEolt2msemaBc3Nkycp+Oqubwq7snPbwOF/3rT2mtAiU0C8Ev28vIHzHURuqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102743; c=relaxed/simple;
	bh=72jwfitser1aQb9gjC6pY+/0SixGdsnc79rvI3BbmAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q2ro/kJZGSFdAXFeo27RAi9iG6yqGfGKhONDU0jpWZ97jFJkWTzHNxdnOwfj6I7BDCFRJ9ueZak2kWtjC2RNDduGYHXBHhOi0ggZ0l/7IcuQFGXLdpA1Wamu4gIcXQXrI/Avl8xq6loy5vuV8hZ8pbVZovRfSJ1A8lX8/FZIcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DZ5qJ+c0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DZ5qJ+c0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zKhG9
	qiEMRLJS/mGX8jO8pyM5ReATHHbxqdxWWXsPx8=; b=DZ5qJ+c0PnOUua2pWcX9w
	MAkfLRn2tolNjzPPBDRwOJ/120UmLBKlssIdgsWiCq1umm/otz5XdwNI/7UuOqk+
	vo7XJPCRlnBwwkRmiUkM3XWUhfPqmuHgXBSpc4W5uJ3P5SxJboDpkQmPLNr8xsmA
	xl/yBB/UfBP2cuGTFh5E0g=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHF00m5fRnQGxPEw--.37725S2;
	Tue, 08 Apr 2025 16:58:14 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: dev.jain@arm.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	ioworker0@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	xavier_qy@163.com
Subject: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue,  8 Apr 2025 16:58:09 +0800
Message-Id: <20250408085809.2217618-2-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408085809.2217618-1-xavier_qy@163.com>
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHF00m5fRnQGxPEw--.37725S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18ZFWxZrykJw17ZFy3twb_yoW8Xw4xpr
	y8CwnIqr17JFnxG393Jw1rJry5Jws3tFW7ArnIya1UJryF9rn5u34Fk34a9rWUGrZ5X3y8
	Zw1UtrnruFW7CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piXyCJUUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTQwpEGf03i7+0gAAs3

This commit optimizes the contpte_ptep_get function by adding early
 termination logic. It checks if the dirty and young bits of orig_pte
 are already set and skips redundant bit-setting operations during
 the loop. This reduces unnecessary iterations and improves performance.

Signed-off-by: Xavier <xavier_qy@163.com>
---
 arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..034d153d7d19 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(__contpte_try_unfold);
 
+#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
+	do { \
+		int _start = start; \
+		pte_t *_ptep = ptep; \
+		while (_start++ < CONT_PTES) { \
+			if (pte_##flag(__ptep_get(_ptep++))) { \
+				orig_pte = pte_mk##flag(orig_pte); \
+				break; \
+			} \
+		} \
+	} while (0)
+
 pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 {
 	/*
@@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 	for (i = 0; i < CONT_PTES; i++, ptep++) {
 		pte = __ptep_get(ptep);
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
+			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
+			break;
+		}
 
-		if (pte_young(pte))
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
+			break;
+		}
 	}
 
 	return orig_pte;
-- 
2.34.1

