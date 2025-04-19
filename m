Received: from pku.edu.cn (mx18.pku.edu.cn [162.105.129.181])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F8840C03
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.105.129.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745065704; cv=none; b=pFRdSVQz0d79hxyfQjg41o/VyvURHulArmINzAMxY3BRj7RjdMDkgPfsFtcuP51C+iIVXdEG/QafxTNhXzAB0Vvf/dnJtZFoiPxMEr81tyOcUBig3VACq3nleyQsBjtBRe5hxjredK5Ow3A9XkHjBKGE9XDOaLy4zl2gu3iXNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745065704; c=relaxed/simple;
	bh=T7pZyfFtltRKU8k5UDVjsavlSdq1vMGHTPf1tegOrB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilmZKlzhK7EfzCjZIOyejoKwPomhAKroeX9M+ygzGGeRAatj5eDYAFNhaVWuEyGj26wHu0quyvj2yRrH6peysHGrHI9RFtVcTYG1O6F3doLes+sJpD3cL+AOrlKrLifun1c234Lkb+ZKU3m8+Fl+yxz44P3p2/1Jzuq/fH/WZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn; spf=pass smtp.mailfrom=pku.edu.cn; dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b=a1VqtP9H; arc=none smtp.client-ip=162.105.129.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b="a1VqtP9H"
Received: from pku.edu.cn (unknown [10.4.225.203])
	by mtasvr (Coremail) with SMTP id _____7DwLbLclgNotwAvAQ--.9105S3;
	Sat, 19 Apr 2025 20:28:13 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=AObsAtduGZ
	63th88XycIDz+dXpqaRhb4xccEN4ZKHaA=; b=a1VqtP9HtQjtOMdjWoGnCmnSC9
	RNQm6MK2DRhpFhBnL2ikKQxceb1sz3SZlTBemCJ2dQwpO+kpEbJ6OxFJbHGDaZF5
	qw3zm4xGd5uGvGKOICjsjt8QNCfJlx7zR28p+qRJ8Rl8MTylVm1Z1jX64vEHzllc
	LR19kBvzEExW/NVQ4=
Received: from localhost.localdomain (unknown [10.4.225.203])
	by front02 (Coremail) with SMTP id 54FpogBnnIbXlgNoWRgsAA--.10176S2;
	Sat, 19 Apr 2025 20:28:11 +0800 (CST)
From: Ruihan Li <lrh2000@pku.edu.cn>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v2] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Date: Sat, 19 Apr 2025 20:28:01 +0800
Message-ID: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:54FpogBnnIbXlgNoWRgsAA--.10176S2
X-CM-SenderInfo: yssqiiarrvmko6sn3hxhgxhubq/1tbiAgEIBWf35XUDOwATsl
X-CM-DELIVERINFO: =?B?v6pnrqaAH6dYjNjDbLdWX9VB7ttaQFyXTaecYZzOeDisy/krtsX5TsLkpeAzENeCPc
	0+BDdXjm5Mlm64oODP/CxX7CeybRmcZ7rayCADYg0BJ4IOAwTj6yjmtNJFLQfpT0pZ9XtN
	E9kYHVEAf5DxtctTFKA9+LYltjuEh7gBQ6bC/pEBgmTyCKL+0ViVPTiC8IUBvA==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Currently, memmap_init initializes pfn_hole with 0 instead of
ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
page from the page at address zero to the first available page, but it
won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
won't pass.

If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
kernel is used as a library and loaded at a very high address), the
pointless iteration for pages below ARCH_PFN_OFFSET will take a very
long time, and the kernel will look stuck at boot time.

This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
avoids the problematic and useless iteration mentioned above.

This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
unavailable struct pages").

Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
---
Link to v1:
 - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
Changes since v1:
 - Removed the unnecessary Fixes tag.
 - Fixed the build issue for CONFIG_SPARSEMEM.

 mm/mm_init.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 84f14fa12..a697a83ff 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -969,6 +969,15 @@ static void __init memmap_init(void)
 	unsigned long hole_pfn = 0;
 	int i, j, zone_id = 0, nid;
 
+#ifdef CONFIG_FLATMEM
+	/*
+	 * Pages below ARCH_PFN_OFFSET are invalid as far as pfn_valid is
+	 * concerned, so don't waste time iterating on them when looking
+	 * for holes.
+	 */
+	hole_pfn = ARCH_PFN_OFFSET;
+#endif
+
 	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
 		struct pglist_data *node = NODE_DATA(nid);
 
-- 
2.49.0

