Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E7A1A3BA1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705384; cv=none; b=GCTly5SoaLRdjCLis7BRw2m3659Wciynp69UGUh6HeSBGRc1DIya1dLleO0HZQHIWrTwXTazkNeP5zgvVslwlaVia75iS5tuoH6BJ1/74ytKwGB0AJrinRNf473NJ/T0UTr/8F+axb8ga0vVabW61szFO4tAfeW5lIdU8k0dxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705384; c=relaxed/simple;
	bh=P+blD4yF/JyaUWkUosgGZbH5ySqtARJVPo15T/um8hQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xnb5DWNzQKGopD8VOTd1pf9xriRBLgYfBBgSSXsG4/UBQBVJ+45bcqAWmSAatDqfmU89gaw2dEi1asiOP6KjwDVFXnEJGupAisLG0xq22S+rYj8Ih/0HZqILbBS2oLggM1u7nFuWn7nc8LdoaYQiOgB55I+QSIWJVUy/U1Y+xFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eiYwfh3b; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eiYwfh3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JOyJ3
	bbxtTyHnbUxiYgYRtegI1lip9bbHwf/0u573ho=; b=eiYwfh3b9Gv+hi0GvBuzY
	g4/bqySGRTR8KN4ak8/zV3dCSxHtXt9v2XuIqBSdbw4pwApRNle8ZcN/UeyK69/h
	C/hEl91J28fg8cil1oVq3/bOsQfAyG425QqgxklF7hq00LDoJ155cCjL3RCHRlyK
	GxGtLonTAWowIDIR1Moac4=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXIEsxF_5n1K_IAA--.17854S2;
	Tue, 15 Apr 2025 16:22:10 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: ryan.roberts@arm.com,
	dev.jain@arm.com,
	ioworker0@gmail.com,
	21cnbao@gmail.com
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com
Subject: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue, 15 Apr 2025 16:22:05 +0800
Message-Id: <20250415082205.2249918-2-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415082205.2249918-1-xavier_qy@163.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXIEsxF_5n1K_IAA--.17854S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18ZFWxZrykGr48ur1DGFg_yoW8WF1Upr
	y8Cw1aqr1xJF13Jas3tw1rtrW5Jwn3tay7ArnIya1UA34rZr95uryFk3ya9rWUGrWFq3y8
	Zw1jqrsrCFW7CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJUUUUUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhowEGf+Eoi2tQAAs4

This commit optimizes the contpte_ptep_get function by adding early
 termination logic. It checks if the dirty and young bits of orig_pte
 are already set and skips redundant bit-setting operations during
 the loop. This reduces unnecessary iterations and improves performance.

Signed-off-by: Xavier <xavier_qy@163.com>
---
 arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..0acfee604947 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(__contpte_try_unfold);
 
+/* Note: in order to improve efficiency, using this macro will modify the
+ * passed-in parameters.*/
+#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
+    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
+		if (pte_##flag(__ptep_get(ptep))) { \
+				orig_pte = pte_mk##flag(orig_pte); \
+				break; \
+		} \
+    }
+
 pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 {
 	/*
@@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
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

