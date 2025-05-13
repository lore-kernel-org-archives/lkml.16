Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C482C10B7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156659; cv=none; b=BrvEcTov2ff0gC5fCLxgV4qL+jqA8HQnvsyRLrn1f278uwQpGvo4v9eAt4JQqddtzNk4xBbENXMvrnu2+JxGwgOoZ1Lgw4cl1JSsIdKIHzJYzqXlShduEbp4QAYJ8iz4VBRxN1TnykP4UfSLfjePuAjITiBCO/UhKSy3yn9G5qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156659; c=relaxed/simple;
	bh=AgwzCD8iSnrWepDGv+7t9ARZZphB9VkgUTgKq74uFY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJuG0MF1w+eBlVPFBuN/8vMLpwgginQ367tlFeh6Z5C6x4l5vG/LTvQGa7W/1gpZzc3FS8ngP0zW/mxXeRHZI+7aV3DQAndux5LtCICyy20tvt2EFWV5xNF8oEdX5dsNyQKouXCK0t4p6lYBDv8QuCBLSz36Q61M8laG4BTe6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20132BC4;
	Tue, 13 May 2025 10:17:25 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A3563F63F;
	Tue, 13 May 2025 10:17:33 -0700 (PDT)
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
	Babu Moger <babu.moger@amd.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v11 19/30] x86/resctrl: Move pseudo lock prototypes to include/linux/resctrl.h
Date: Tue, 13 May 2025 17:15:36 +0000
Message-Id: <20250513171547.15194-20-james.morse@arm.com>
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

The resctrl pseudo-lock feature allows an architecture to allocate data
into particular cache portions, which are then treated as reserved to
avoid that data ever being evicted. Setting this up is deeply architecture
specific as it involves disabling prefetchers etc. It is not possible
to support this kind of feature on arm64. Risc-V is assumed to be the
same.

The prototypes for the architecture code were added to x86's asm/resctrl.h,
with other architectures able to provide stubs for their architecture. This
forces other architectures to provide identical stubs.

Move the prototypes and stubs to linux/resctrl.h, and switch between them
using the existing Kconfig symbol.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
I'm assuming risc-v's hardware prefetcher controls are restricted to the
higehst privilege level, and that this isn't where linux runs.

Changes since v9:
 * Typo fix in commit message.

Changse since v8:
 * This patch is new.
---
 arch/x86/include/asm/resctrl.h |  5 -----
 include/linux/resctrl.h        | 13 +++++++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index a2e20fe90a2c..ad497ab196d1 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -205,11 +205,6 @@ static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 					     enum resctrl_event_id evtid,
 					     void *ctx) { }
 
-u64 resctrl_arch_get_prefetch_disable_bits(void);
-int resctrl_arch_pseudo_lock_fn(void *_plr);
-int resctrl_arch_measure_cycles_lat_fn(void *_plr);
-int resctrl_arch_measure_l2_residency(void *_plr);
-int resctrl_arch_measure_l3_residency(void *_plr);
 void resctrl_cpu_detect(struct cpuinfo_x86 *c);
 
 #else
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 5ef972cbf56b..9ba771f2ddea 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -534,4 +534,17 @@ extern unsigned int resctrl_rmid_realloc_limit;
 int resctrl_init(void);
 void resctrl_exit(void);
 
+#ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
+u64 resctrl_arch_get_prefetch_disable_bits(void);
+int resctrl_arch_pseudo_lock_fn(void *_plr);
+int resctrl_arch_measure_cycles_lat_fn(void *_plr);
+int resctrl_arch_measure_l2_residency(void *_plr);
+int resctrl_arch_measure_l3_residency(void *_plr);
+#else
+static inline u64 resctrl_arch_get_prefetch_disable_bits(void) { return 0; }
+static inline int resctrl_arch_pseudo_lock_fn(void *_plr) { return 0; }
+static inline int resctrl_arch_measure_cycles_lat_fn(void *_plr) { return 0; }
+static inline int resctrl_arch_measure_l2_residency(void *_plr) { return 0; }
+static inline int resctrl_arch_measure_l3_residency(void *_plr) { return 0; }
+#endif /* CONFIG_RESCTRL_FS_PSEUDO_LOCK */
 #endif /* _RESCTRL_H */
-- 
2.39.5

