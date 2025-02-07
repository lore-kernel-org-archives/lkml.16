Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA51D7E21
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921481; cv=none; b=RfrSU8fDDQuuQPf2RZskGALFnCnhXRwGdAqg6062po+m9lzT8j9FVRi0DpwiEZ9czkuZykMhBgiAKdS4HjSqHgQrcN/4kaR3Bi0tvV97QyGd5/HQGQFQfZka8m9hMljBvZC8jzDDC/nrYpHvWwVWJIo6iu7WM8NGZGRsI/uhgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921481; c=relaxed/simple;
	bh=pAzvpUcHqz6pHDmg7cp1GbIvS5Li6GN0WDVBgMBizMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ntD9+4UKufFV9V565TDxnZqWUuNR6Hvq8YmEKlyf8ZnLS/dHa226tMc4wHeCyAgkHJ/9hK54PSG55MWtIe0PVnqljnppobKBqEO5PkNmRvd8F8iOv+FIE2wciVOJ0w9MfMhNdnU2lvVPlz/VG6DsqmlM1UTH4wXN8D4yCQiKsds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ee+lIRoX; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ee+lIRoX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921469; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=6OliDxvKyBEcspL0hO2n4TFk9yLu1eglYM5udcyOR2M=;
	b=ee+lIRoXoS4qpTr8aJvnSxk9jH0gPQUA97N8vCdA998XHQL7qJaaOXxyZaJYOc4rrr0oKETF2A+ySDvDJttsDna+bzqAMEaNpDm4HwLhfSbp9GNghSL8jsWNlUi5t8fGf/YtFb3FyAX3TjWWkuHl3yK35u3KPTpUfmNormu1daQ=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz4ojL_1738921468 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:29 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] mm: shmem: drop the unused macro
Date: Fri,  7 Feb 2025 17:44:17 +0800
Message-Id: <69264cee1d938442477e657004e4924f8a5c4dd4.1738918357.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
References: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the unused 'BLOCKS_PER_PAGE' macro.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 745f130bfb4c..ddf800357e7a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -86,7 +86,6 @@ static struct vfsmount *shm_mnt __ro_after_init;
 
 #include "internal.h"
 
-#define BLOCKS_PER_PAGE  (PAGE_SIZE/512)
 #define VM_ACCT(size)    (PAGE_ALIGN(size) >> PAGE_SHIFT)
 
 /* Pretend that each entry is of this size in directory's i_size */
-- 
2.39.3

