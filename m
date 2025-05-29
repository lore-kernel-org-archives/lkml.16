Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C428EBE0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518444; cv=none; b=bQWlO7t8t0dWDy9ZM9v98w6PZHt0+gmPkoKnt7dV1he8j0whAvrXdyE0xD4no88KkH5lcvj3ezzV62AWPti/RLfJD5UrttQQc9l5NQbp3BL0cHfEqLxH6aPg/UYm7SJ71b/M+FiNuiPoOIR1zA6A2o3QV1shmn1xku0BE9cRTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518444; c=relaxed/simple;
	bh=90jdpPdy5MJPlO0VsqmQUiIMq26REgMBEcbWb0Vbdlk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JM/+1/OMDOfKsdDgwQ9F5D1wX88TmMw8qqdYCTN4//vQpyBIW3B4QwgLOt+2oZlQyEzQ/MCKfenIjjICrKMEp156kcRFNtLyH1McJ9D1HQYujnjUbvXb5/3zUwkHNH94F3K2QwsDX8v8EaUmstMclDd/7Fg8dakVE7k7OctAlyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4b7PPN4Pzkz23jS4;
	Thu, 29 May 2025 19:32:56 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D827818005F;
	Thu, 29 May 2025 19:33:58 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 May
 2025 19:33:58 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <bp@suse.de>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <james.morse@arm.com>,
	<xiaochen.shen@intel.com>, <fenghua.yu@intel.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] fs/resctrl: Restore the missing rdt_last_cmd_clear()
Date: Thu, 29 May 2025 19:33:53 +0800
Message-ID: <20250529113353.3275066-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)

The fixes tag patch resolves the lockdep warning. However, directly
removing rdt_last_cmd_clear() would leave the last_cmd_status interface
with stale logs, which does not conform to the functional definition before
the fix. Therefore, the rdt_last_cmd_clear() operation is performed after
successfully acquiring the rdtgroup_mutex.

Fixes: c8eafe149530 ("x86/resctrl: Fix potential lockdep warning")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc37f58b47dd..4aae9eb74215 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -536,6 +536,8 @@ static ssize_t rdtgroup_cpus_write(struct kernfs_open_file *of,
 		goto unlock;
 	}
 
+	rdt_last_cmd_clear();
+
 	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
 	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
 		ret = -EINVAL;
@@ -3481,6 +3483,8 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}
 
+	rdt_last_cmd_clear();
+
 	if (rtype == RDTMON_GROUP &&
 	    (prdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
 	     prdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)) {
-- 
2.25.1

