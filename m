Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4EF21FF2C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602843; cv=none; b=VPjtow7VDbz1+wxHnMcOfo9nHc8qqeNhEfcl7d0XX6qhY8bf//mLm/lCwQ0huoUDH6xs6TNfpZzP3ziUv7EMRshcDizZYDpsN2Z/WU1l0AKYDcGixKW2gjhkTKVSv/RJp+sD4pdXM/JFR3MU3S9PH/WSiqnjEWkPceWpnPGHCcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602843; c=relaxed/simple;
	bh=cWfGVvH5laaqsXeTcct/Yw+jAml/lQNHzaseX++QnjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HbvUhJA2hGHRmCJ7fp3CVTHUjpI3fVWJI/GpHsigkR9su5cKG0So4V23aJNZjktcZHI1s4nDYi1OiHJQdvL7Qnn6aMCBq4I3T+cDcx2wpAiUndt6oK/a7bFtoNfibnKfvHD/bVRhGLA4e0oqL3yA66VQNvtdNnEI77IWkxvtDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 379B12308;
	Fri, 25 Apr 2025 10:40:36 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454263F59E;
	Fri, 25 Apr 2025 10:40:37 -0700 (PDT)
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
Subject: [PATCH v9 25/27] fs/resctrl: Change internal.h's header guard macros
Date: Fri, 25 Apr 2025 17:38:07 +0000
Message-Id: <20250425173809.5529-26-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250425173809.5529-1-james.morse@arm.com>
References: <20250425173809.5529-1-james.morse@arm.com>
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
---
 fs/resctrl/internal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 06173b5f0a47..6dd2a74cf3ec 100644
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
@@ -437,4 +437,4 @@ static inline int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp)
 static inline void rdtgroup_pseudo_lock_remove(struct rdtgroup *rdtgrp) { }
 #endif /* CONFIG_RESCTRL_FS_PSEUDO_LOCK */
 
-#endif /* _ASM_X86_RESCTRL_INTERNAL_H */
+#endif /* _FS_RESCTRL_INTERNAL_H */
-- 
2.39.5

