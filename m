Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C9021D3F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751437480; cv=none; b=KWSVqdEG7gHwBfOXIfNWeJ2qc05eN7IJTW4ZRfqzXm1egiP8BXFEwnsvtuVvt7TIN1AduC4CDDHSnoGh01QImxiw178j1PXWgcnajtWX1ABzdSKZu7SBNUHBd0QUqgEOcCjYuqlWPuTQbkgZN2XUv5xjlp3uVksDaAHacehVOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751437480; c=relaxed/simple;
	bh=k3L69VK1wkPc8lRm/1FDNbJEO+xgJFXnO/wFhkwFc8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQDMn0QKC3CpQA0+8ag11y9oPvZYTrp8SfXltbsLlSvz10vyTSp6ykUf7iJgRqzSaGW/tAJoXzyCfdk9j1JaQPjPEYhdnFbgZvK4RiVzMeeOFbYWdgiB5WtDzLcKi89N3CTJ7xPKsL+HsnEnD6s9itGkE3PFlw0HBXckj6yxD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SDNElFwj; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SDNElFwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GA
	yDNsxr/LBxtPmypf/npxg36f0bzKvFxsKMt/9v9E4=; b=SDNElFwj3xcsZTBz0h
	OR7bvJzltlVfllnadSkqtgLzgl4dud0jiCNYHWpr14eXaPj3ueoiTc2NnsFaDUZ/
	drEIZe7+9HnCO5KdCfkV+lGOwAzQQbBBkbfXln4XbLORsS9l54xgjzk66TGdnCzi
	YMn1LUod/ZuCath30lrX34BFM=
Received: from ly-pc.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDXjQmB0GRo2CFPCA--.3028S4;
	Wed, 02 Jul 2025 14:24:05 +0800 (CST)
From: Xuanye Liu <liuqiye2025@163.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Xuanye Liu <liuqiye2025@163.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: remove outdated filename comment in percpu-stats.c
Date: Wed,  2 Jul 2025 14:23:59 +0800
Message-ID: <20250702062400.207619-1-liuqiye2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXjQmB0GRo2CFPCA--.3028S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeNtIDUUUU
X-CM-SenderInfo: 5olx1xd1hsijqv6rljoofrz/xtbBDRR+UGhky0GO-gAAsB

The comment had the old filename. It's also unnecessary, so drop it.

Signed-off-by: Xuanye Liu <liuqiye2025@163.com>
---
 mm/percpu-stats.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/percpu-stats.c b/mm/percpu-stats.c
index dd3590dfc23d..9b9d5d6accae 100644
--- a/mm/percpu-stats.c
+++ b/mm/percpu-stats.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/percpu-debug.c
  *
  * Copyright (C) 2017		Facebook Inc.
  * Copyright (C) 2017		Dennis Zhou <dennis@kernel.org>
-- 
2.43.0

