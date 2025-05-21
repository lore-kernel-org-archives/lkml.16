Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B2D19D07B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747792351; cv=none; b=r9Qga88ZoE5q20vvjbxAqL0LyCxH4qG5V84gKfnJwT+SIktFp5fjbRux6RuakvyOIJJnQK80XYPg7t2FczElHweHi0ZeFn2ooKZasf6z/Y1B5B3QYi61TcL2gn4scTzizEv36wXQLtwOCOYRafBtHsiUW6nUklhzmYbnQugUthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747792351; c=relaxed/simple;
	bh=eJukfN/QnEFuUjo5/8Cknbd639EiAbrOw0Td6RFxca8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aihvg08F0RLa5NNKiCRsl9M3ORTgJFNNq8/E4t0QuZXO0Y0SE9e6LGzqieMFIG1fscSvVz0u5z18zHjCNUjB9UoM7lNdiXx0cAtL/SkQR7He7JVsek2o48BnFU3LJCkZyRLWnB/ijSNrNxEdPRF/eFPNgAoF8EP93BXGY+K+Rek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jq/x3oBV; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jq/x3oBV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747792339; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=xTkM+0D8//f566GySy7EXd19ZJqJeoizAhZSsoZc1/w=;
	b=jq/x3oBVN8+aFaoF3JKdf5G8q2g1Bel5+s5wWudzdc23hoC8g5TMPj6rGgAryAwAxQYQ60HbwVeiMVDqkI58qjTpFEdDP+aLTYWSXCbP+QdsvYm63ClV3bAvJobR7YHRPxzcwiHyEK6cEOhom1zr+816N4pOt1SJJPjsJSG6qHc=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WbPY5eZ_1747792022 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 21 May 2025 09:47:02 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH RFC] arm64/mm: Lift the cma address limit when CONFIG_DMA_NUMA_CMA=y
Date: Wed, 21 May 2025 09:47:01 +0800
Message-Id: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When porting an cma related usage from x86_64 server to arm64 server,
the "cma=4G" setup failed on arm64, and the reason is arm64 has 4G (32bit)
address limit for cma reservation.

The limit is reasonable due to device DMA requirement, but for NUMA
servers which have CONFIG_DMA_NUMA_CMA enabled, the limit is not required
as that config already allows cma area to be reserved on different NUMA
nodes whose memory very likely goes beyond 4G limit.

Lift the cma limit for platform with such configuration.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 arch/arm64/mm/init.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index b99bf3980fc6..661758678cc4 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -312,6 +312,7 @@ void __init arm64_memblock_init(void)
 void __init bootmem_init(void)
 {
 	unsigned long min, max;
+	phys_addr_t cma_limit;
 
 	min = PFN_UP(memblock_start_of_DRAM());
 	max = PFN_DOWN(memblock_end_of_DRAM());
@@ -343,8 +344,14 @@ void __init bootmem_init(void)
 
 	/*
 	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
+	 *
+	 * When CONFIG_DMA_NUMA_CMA is enabled, system may have CMA reserved
+	 * area in different NUMA nodes, which likely goes beyond the 32bit
+	 * limit, thus use (PHYS_MASK+1) as cma limit.
 	 */
-	dma_contiguous_reserve(arm64_dma_phys_limit);
+	cma_limit = IS_ENABLED(CONFIG_DMA_NUMA_CMA) ?
+			(PHYS_MASK + 1) : arm64_dma_phys_limit;
+	dma_contiguous_reserve(cma_limit);
 
 	/*
 	 * request_standard_resources() depends on crashkernel's memory being
-- 
2.39.5 (Apple Git-154)

