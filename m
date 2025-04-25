Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5A51DF971
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602789; cv=none; b=uVXjfU/TJfVrNfyNpHoepwvw7n2NLs9ZAyCKkX77CmmY7nM3hWlRiO8mvGDBmz9WenyYXxvZYUoRYZ9FT2IM4PxeZX6sCCc4g/TYV6DpdrWrQBsOiTyUlgkKpOTvYfSgnXn+fW/CAX4LmEymNVeBc0JgBs9vuTo669zVtjsK8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602789; c=relaxed/simple;
	bh=5mkjlr2dxrsiu25ytFzdw2rU1ujIUFJPC1Pf36zHd8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9tkCit1y60maQWK6tcDmlYm1dqmBC9FvCweV+z7ku/Brf330rPN3adb4pyy6q4fryg9GrXaOcEfVx9bCrHnBqOhnMwbg+krzuqhUX6QN2fEBqk6iCSdEk9nOUH4CeAsu/TryAz+QvFrtawU8wiGRw6ViscOC7d+PLUQ5KUlH9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B6372103;
	Fri, 25 Apr 2025 10:39:42 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6C513F59E;
	Fri, 25 Apr 2025 10:39:43 -0700 (PDT)
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
Subject: [PATCH v9 14/27] x86/resctrl: Fix types in resctrl_arch_mon_ctx_alloc() and free stubs
Date: Fri, 25 Apr 2025 17:37:56 +0000
Message-Id: <20250425173809.5529-15-james.morse@arm.com>
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

resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
resctrl_event_id. This in turn requires the enum to be defined in
resctrl_types.h so that it is accessible to asm/resctrl.h.

The x86 stubs take an int. Fix that.

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v8:
 * This patch is new.
---
 arch/x86/include/asm/resctrl.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 7a39728b0743..bd149c37551c 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -194,13 +194,15 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
-static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
+static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
+					       enum resctrl_event_id evtid)
 {
 	might_sleep();
 	return NULL;
 };
 
-static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
+static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
+					     enum resctrl_event_id evtid,
 					     void *ctx) { };
 
 u64 resctrl_arch_get_prefetch_disable_bits(void);
-- 
2.39.5

