Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C322F767
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955526; cv=none; b=XDZaZIHjpdkbGH3Zao86wf9po9Jd0vtVF2MLjwNtvDPRh0JrRKMAgAcc6V4153aM3Epj7PAJmFj5DGteHP4XXDTLBZUMhJZMfLObKgvjIN6sS+RYeDpTBbi2ZdI1hxt/Z0rOXjbMWkF3jJ1dVtc2cLevvywhDhYfPlY3K3v+TsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955526; c=relaxed/simple;
	bh=i0ipTVZMn4xud36lBPQ5xxeGeZ1w9Dl/ZcxYE0u4/e4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iZsPzejqU93GiuNfd0lVw5iTi026h/GxkNs1WA/Z8zN9fhnOhmr7fxaA2wqGI4VW7cjHu41xBD1u97h7YDX9OQqE3Xp2ScessAFtrXnIC6uVhg+CKsey2TRqq83tfrbNk6mOQkHjVV7765zEW17LoYslif15bkD+0siGWLnlbxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bBW2W5xcJz1fy6C;
	Tue,  3 Jun 2025 20:57:23 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id AF71E14022E;
	Tue,  3 Jun 2025 20:58:33 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 20:58:32 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<fenghuay@nvidia.com>, <bp@alien8.de>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
Subject: [PATCH v2] fs/resctrl: Restore the rdt_last_cmd_clear() calls after acquiring rdtgroup_mutex
Date: Tue, 3 Jun 2025 20:58:28 +0800
Message-ID: <20250603125828.1590067-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)

A lockdep fix removed two rdt_last_cmd_clear() calls that were used
to clear the last_cmd_status buffer but called without holding the
required rdtgroup_mutex. The impacted resctrl commands are:
writing to the cpus or cpus_list files and creating a new monitor
or control group. With stale data in the last_cmd_status buffer the
impacted resctrl commands report the stale error on success, or append
its own failure message to the stale error on failure.

Consequently, restore the rdt_last_cmd_clear() calls after acquiring
rdtgroup_mutex.

Fixes: c8eafe149530 ("x86/resctrl: Fix potential lockdep warning")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
Changes in v2:
1. Move rdt_last_cmd_clear() to be right after acquiring the mutex.
2. Rewrite the commit message in imperative tone, add explanation of the
   error phenomenon.
Link to v1: https://lore.kernel.org/all/20250529113353.3275066-1-zengheng4@huawei.com/

 fs/resctrl/rdtgroup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc37f58b47dd..1beb124e25f6 100644
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
@@ -3472,6 +3474,8 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}

+	rdt_last_cmd_clear();
+
 	/*
 	 * Check that the parent directory for a monitor group is a "mon_groups"
 	 * directory.
--
2.25.1

