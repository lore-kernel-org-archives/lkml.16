Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF19F2BEC21
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156694; cv=none; b=maIsNpvNSnP0Rm6sAvhaiajbm9j4MoWSWs15lb9y72P2QR7JviZjuPf46OiZ3HpouWpGrxgDEPnYfKqGLUR5wIbB5m/1VpBYNeCxsqwcqNHrl+DAmK1WqgQFyrlgkTcALMXuWUmuyNsBsDmachNLriFjlu3vr69vdeycJAJCksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156694; c=relaxed/simple;
	bh=9AxsAFmEEOSoO+HCXppjK0tlr7VUTot7fuvK7TG4PgM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJTND+hqTyFiKuBUhKqkNIpU6fjARbnGME537IeixM0iKY7pRkO0IADnx71eakkQVw9chKbFGx3MXoUb1Zj28rxMae109Z3SSbimv61J3F1VQm4O3UTMtK+YZKwDvbAb5qwnYOglYRpw6NfVysaTDWZKrj1c+8cmW5Y3PUht0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=fail smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B5542C1D;
	Tue, 13 May 2025 10:18:01 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACEAC3F63F;
	Tue, 13 May 2025 10:18:08 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Babu Moger <babu.moger@amd.com>
Subject: [PATCH v11 28/30] fs/resctrl: Change internal.h's header guard macros
Date: Tue, 13 May 2025 17:15:45 +0000
Message-Id: <20250513171547.15194-29-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>
References: <20250513171547.15194-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in internal.h was moved by a script. The script didn't know to
change the header guard macros. Do that.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index ed7dfc071e6c..9a8cf6f11151 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_RESCTRL_INTERNAL_H
-#define _ASM_X86_RESCTRL_INTERNAL_H
+#ifndef _FS_RESCTRL_INTERNAL_H
+#define _FS_RESCTRL_INTERNAL_H
 
 #include <linux/resctrl.h>
 #include <linux/kernfs.h>
@@ -423,4 +423,4 @@ static inline int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp)
 static inline void rdtgroup_pseudo_lock_remove(struct rdtgroup *rdtgrp) { }
 #endif /* CONFIG_RESCTRL_FS_PSEUDO_LOCK */
 
-#endif /* _ASM_X86_RESCTRL_INTERNAL_H */
+#endif /* _FS_RESCTRL_INTERNAL_H */
-- 
2.39.5

