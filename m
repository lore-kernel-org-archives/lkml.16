Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61BA230BF0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389867; cv=none; b=L/vNIrOBMSMS039AbBJ9zM9IlRDFzCokkDDtZqXtvYp3xL47WeW3wPDWkhxqj5SYUtez4fk/RnVT+ZX83vbMEqJQzNU4C6HjBL5sGpLUzUHM2ci/qAImG+/jym2I8EVC9rIBtRybiDBmHvEIQ3WpdeEXIREm53GsyxxG3MgU0bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389867; c=relaxed/simple;
	bh=xpcL2AMGkxX5/E1me0lqUfpTvYaZAbKebP/piHiLOZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U/QRfP1LhB4YOIP8VOhoAmnkTP6dkFsUQ1zxl3a8BZebUFg7iEHQuan8++pLbt6ME9GDqCWuJBRMvihne08l9PA3XzDHJdN7LUHZkMsUIVrHGZbKFek0NukuMh1U3HK2bD8voMiPGwpw1v2ZsvOIAvGGCmfPXA41Db/Nm1OF/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367C72444;
	Fri, 11 Apr 2025 09:44:25 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29E843F762;
	Fri, 11 Apr 2025 09:44:22 -0700 (PDT)
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
Subject: [PATCH v8 20/21] fs/resctrl: Change internal.h's header guard macros
Date: Fri, 11 Apr 2025 16:42:28 +0000
Message-Id: <20250411164229.23413-21-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250411164229.23413-1-james.morse@arm.com>
References: <20250411164229.23413-1-james.morse@arm.com>
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
index 8a5c692142cd..058c9fc9f952 100644
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
2.20.1

