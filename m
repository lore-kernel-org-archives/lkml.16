Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D11C2DA2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227381; cv=none; b=E9bpfZC7Psuux1vme43u5aweMom1a3UeUGLjX1TvzCjx3+jqvbkPiRW3aTTJLCrW/NJ1+loH5cUtTUe6HRcNDz3snLARoscLGK9M1DEGr/kDQHkDcsNT4pcyhmbM/dUKlVPi/PHgRO4KuZE6Jio+944Q16Cg7+guXjXF6T7Xa2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227381; c=relaxed/simple;
	bh=pJ3AFthbhn2IjEmAwvy7YS/7fiOfR0wUHuutA87vzQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R0cbbnjwpEOJltbccdyB9laB17iLO5O2Eq5fvtY0FsDPpnYxHQw8KH6zQoO+6VYvWf31W8im9SejUD5KuGs5f0cympgJhphayJwD3W27xasDUT5wJcAO8xScbwjg2wyyFkXYlmsfPLE2xAgzmXLnzYA+3Py3CIWnretZ8VoK9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nXxFgAA0; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nXxFgAA0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739227377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YZhQ2JMipPfK0C7SvJ4X1y2p34Ne5eOf0xju/PAVEgM=;
	b=nXxFgAA0saOIfIGqqMlqUuO0hqMX8oWX+vVvSMN286mIl1tb52GqSsZ1FTC2eV6AqWmiDj
	TA7yuvuzQC2bZ2EVToHRyY7aGc8W2zxgEwz0oZmJ+4Y6pkYmXfPcM6jY/XVNcFTXMh83c5
	MXFdazgQqH9rDpiIPHMya/Fkjob+CHI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Shivaprasad G Bhat <sbhat@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Gaurav Batra <gbatra@linux.ibm.com>,
	Brian King <brking@linux.vnet.ibm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/iommu: Use str_disabled_enabled() helper
Date: Mon, 10 Feb 2025 23:42:44 +0100
Message-ID: <20250210224246.363318-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_disabled_enabled() helper.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/iommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0ebae6e4c19d..244eb4857e7f 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
 #include <linux/bitmap.h>
 #include <linux/iommu-helper.h>
@@ -769,8 +770,8 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	iommu_table_clear(tbl);
 
 	if (!welcomed) {
-		printk(KERN_INFO "IOMMU table initialized, virtual merging %s\n",
-		       novmerge ? "disabled" : "enabled");
+		pr_info("IOMMU table initialized, virtual merging %s\n",
+			str_disabled_enabled(novmerge));
 		welcomed = 1;
 	}
 
-- 
2.48.0

