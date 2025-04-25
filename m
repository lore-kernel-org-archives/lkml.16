Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5928F1F4C9B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602743; cv=none; b=OLY1jg8fSC4vEfgGAsyQBqMKBMot+ayXmxDrE04rKpDkzVqp6RYYDOTfqT751I0Kj2wPNQzKuW0Bgq0bmwfdGkDinGjBUeEGEVFurKP5TH0I6syba/6laii9xVr46rKI2RoBQhpT7LT+arOKCXFtAmFnDTdoIeWrO8PqocnNklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602743; c=relaxed/simple;
	bh=j1qy5ZoHvKGII3/JwwsJW2kQNjn/n3z4MI6995pE6Qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NJGtyDKErobBHeEaIZohOYtqqexqzuSxk/I3NByJLkFq0S6P09ak/UPqmR8BRhbSuA6evCC7qabzqcuelu/J4M867aR1AIFxImR4tHLD+o+FJ/kGRIrM89V1M9CoO+Jb5dsTuZRNNF8hR7EHOKhTiEM4qEX3KWKxIsLo7k2kCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7E481DB5;
	Fri, 25 Apr 2025 10:38:55 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EDD73F59E;
	Fri, 25 Apr 2025 10:38:57 -0700 (PDT)
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
	fenghuay@nvidia.com
Subject: [PATCH v9 03/27] x86/resctrl: Check all domains are offline in resctrl_exit()
Date: Fri, 25 Apr 2025 17:37:45 +0000
Message-Id: <20250425173809.5529-4-james.morse@arm.com>
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

resctrl_exit() removes things like the resctrl mount point directory
and unregisters the filesystem prior to freeing data structures that
were allocated during resctrl_init().

This assumes that there are no online domains when resctrl_exit() is
called. If any domain were online, the limbo or overflow handler could
be scheduled to run.

Add a check for any online control or monitor domains, and document that
the architecture code is required to do this.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v8:
 * This patch is new.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 88197afbbb8a..f617ac97758b 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
 	return ret;
 }
 
+static bool __exit resctrl_online_domains_exist(void)
+{
+	struct rdt_resource *r;
+
+	for_each_rdt_resource(r) {
+		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * resctrl_exit() - Remove the resctrl filesystem and free resources.
+ *
+ * When called by the architecture code, all CPUs and resctrl domains must be
+ * offline. This ensures the limbo and overflow handlers are not scheduled to
+ * run, meaning the data structures they access can be freed by
+ * resctrl_mon_resource_exit().
+ */
 void __exit resctrl_exit(void)
 {
+	cpus_read_lock();
+	WARN_ON_ONCE(resctrl_online_domains_exist());
+	cpus_read_unlock();
+
 	debugfs_remove_recursive(debugfs_resctrl);
 	unregister_filesystem(&rdt_fs_type);
 	sysfs_remove_mount_point(fs_kobj, "resctrl");
-- 
2.39.5

