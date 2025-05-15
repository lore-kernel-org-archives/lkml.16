Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B77125CC5C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328421; cv=none; b=Sm4HehaV3HY2m42cwlNLwHKej0Que1MbOBLqvnqGrW79AAFNUVRfjyC5+9QAgvOpNXcqpgqPrMq4MQ7x1tBiFdop1dWExlCym208Z3bpQjjr5J1KEzxKUjeesbDUylKqc4ZgmSFJ/8V+1CKcr0q0PPmSCMyUBasnWVKPvvTjioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328421; c=relaxed/simple;
	bh=rwxYwbe8YAgBmNM0PTYhHIZUjU4aRa+Bfe8SC92Dg0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N8es2Mz8Lapzbv9ePV6WpdU8c5XGyzBqVHxCbdaICYmNVCjmRUI2KMin5qZR6bxgabSsrE8OIw2wXeLBIz/MLm9XhhWXjKNfaw6aSPJGEvuV6MZIT7eBbSAshxd4/B3vLm0SYXLeePED8Za7CTu/tItJFyLGKo6QXnHAhpt9B2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EBAE2661;
	Thu, 15 May 2025 10:00:08 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E9873F792;
	Thu, 15 May 2025 10:00:16 -0700 (PDT)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v12 18/25] x86/resctrl: Fix types in resctrl_arch_mon_ctx_{alloc,free}() stubs
Date: Thu, 15 May 2025 16:58:48 +0000
Message-Id: <20250515165855.31452-19-james.morse@arm.com>
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

resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
resctrl_event_id that is already defined in resctrl_types.h to be
accessible to asm/resctrl.h.

The x86 stubs take an int. Fix that.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since v10:
 * Removed a stray semicolon in the commit message.

Changes since v9:
 * Removed two stray semicolons.
 * Reworded the commit message.

Changes since v8:
 * This patch is new.
---
 arch/x86/include/asm/resctrl.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 7a39728b0743..a2e20fe90a2c 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -194,14 +194,16 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
-static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
+static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
+					       enum resctrl_event_id evtid)
 {
 	might_sleep();
 	return NULL;
-};
+}
 
-static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
-					     void *ctx) { };
+static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
+					     enum resctrl_event_id evtid,
+					     void *ctx) { }
 
 u64 resctrl_arch_get_prefetch_disable_bits(void);
 int resctrl_arch_pseudo_lock_fn(void *_plr);
-- 
2.39.5

