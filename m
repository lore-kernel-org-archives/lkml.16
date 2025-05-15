Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3315F255F24
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328429; cv=none; b=HL8AiKNf5W6r9DzQtN433BoLDwIoyDYKHP1Pny9ADiJeIvbj33FRn1vRd2A687beyKKf4jgLVRj2d/qCs9q7j7tG1n4oa5eUqBwbGDot8/m8kJt1mtW3v9EEjwgTsMipoWW8CmsnHjufCKtqTFjXhviSMM/a17+iAPN5H0I4S9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328429; c=relaxed/simple;
	bh=UKzmrsGjXWaLMpceaDTBKqtS1N8SPkQ4b1lKiqBkxqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QBrZOoC5QJESu4qJEFBCpYUw4nfkXbopBskn/zfyIhqfvpF8yGOZd1vX2zs5IxM/LsSfD2c0JtAS5s6G8xl/Xc6xwBUHIA03niKo+cjmOvUkLURxAY5CXjJ+0LwElxw3eo/s7f5Rzb3aPZHFn+Kr+B//+fOzK6mErRBe0fK5Svo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCE3F267F;
	Thu, 15 May 2025 10:00:15 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1DFC3F63F;
	Thu, 15 May 2025 10:00:23 -0700 (PDT)
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
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Babu Moger <babu.moger@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v12 20/25] x86/resctrl: Squelch whitespace anomalies in resctrl core code
Date: Thu, 15 May 2025 16:58:50 +0000
Message-Id: <20250515165855.31452-21-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250515165855.31452-1-james.morse@arm.com>
References: <20250515165855.31452-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Martin <Dave.Martin@arm.com>

checkpatch.pl complains about some whitespace anomalies in the
resctrl core code.

This doesn't matter, but since this code is about to be factored
out and made generic, this is a good opportunity to fix these
issues and so reduce future checkpatch fuzz.

Fix them.

No functional change.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index ac4baf172269..02c5f626bce1 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1024,7 +1024,7 @@ static int rdt_num_closids_show(struct kernfs_open_file *of,
 }
 
 static int rdt_default_ctrl_show(struct kernfs_open_file *of,
-			     struct seq_file *seq, void *v)
+				 struct seq_file *seq, void *v)
 {
 	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
 	struct rdt_resource *r = s->res;
@@ -1034,7 +1034,7 @@ static int rdt_default_ctrl_show(struct kernfs_open_file *of,
 }
 
 static int rdt_min_cbm_bits_show(struct kernfs_open_file *of,
-			     struct seq_file *seq, void *v)
+				 struct seq_file *seq, void *v)
 {
 	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
 	struct rdt_resource *r = s->res;
@@ -1150,7 +1150,7 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
 }
 
 static int rdt_min_bw_show(struct kernfs_open_file *of,
-			     struct seq_file *seq, void *v)
+			   struct seq_file *seq, void *v)
 {
 	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
 	struct rdt_resource *r = s->res;
@@ -1185,7 +1185,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 }
 
 static int rdt_bw_gran_show(struct kernfs_open_file *of,
-			     struct seq_file *seq, void *v)
+			    struct seq_file *seq, void *v)
 {
 	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
 	struct rdt_resource *r = s->res;
@@ -1195,7 +1195,7 @@ static int rdt_bw_gran_show(struct kernfs_open_file *of,
 }
 
 static int rdt_delay_linear_show(struct kernfs_open_file *of,
-			     struct seq_file *seq, void *v)
+				 struct seq_file *seq, void *v)
 {
 	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
 	struct rdt_resource *r = s->res;
@@ -2068,7 +2068,6 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_closid_show,
 		.fflags		= RFTYPE_CTRL_BASE | RFTYPE_DEBUG,
 	},
-
 };
 
 static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
@@ -3628,7 +3627,6 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 			rdt_last_cmd_puts("Failed to initialize allocations\n");
 			goto out;
 		}
-
 	}
 
 	rdtgrp->mode = RDT_MODE_SHAREABLE;
-- 
2.39.5

