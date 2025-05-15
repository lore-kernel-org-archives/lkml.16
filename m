Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E6C2586EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328395; cv=none; b=afywrE6xEmWdK3M57omGncaknx/ntWIGe0SJC1zdWFoymJFJPwf8w3duPUqbuXE1J03qbCJ+6ImLDND7AavIAE8EaHt6Kc+OmVs725cYMVxnoUbhX9nhdDHfh27+bHndTMphQd2HSylhbwgI5wQ+Jy1J74Pp+3QKxeeMBKkgALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328395; c=relaxed/simple;
	bh=O/Nw7g7K/Ln8YiQqgVER71qknSiAiuxgxDU+9b76RUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WNdxXOrAUzXVNV5uQFcV6PBmOhQgxRH2GfnM/wYri5BT1Y8E83QL8rUwZ5/Ex2zSUCFOJCb8JWfWMImq05Xi5WqmvpuSjYSH7uGzlY/YkTIfb1E+F0xquzi8kmwaOFexuNsOhShQlY+4PgJ909zJMGygKAehbD8bmm9UtmPNaB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 790C125E2;
	Thu, 15 May 2025 09:59:41 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B77BA3F63F;
	Thu, 15 May 2025 09:59:49 -0700 (PDT)
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
Subject: [PATCH v12 11/25] x86/resctrl: Add end-marker to the resctrl_event_id enum
Date: Thu, 15 May 2025 16:58:41 +0000
Message-Id: <20250515165855.31452-12-james.morse@arm.com>
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

The resctrl_event_id enum gives names to the counter event numbers on x86.
These are used directly by resctrl.

To allow the MPAM driver to keep an array of these the size of the enum
needs to be known.

Add a 'num_events' enum entry which can be used to size an array.
This is added to the enum to reduce conflicts with another series,
which in turn requires get_arch_mbm_state() to have a default case.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since v8:
 * Move the last marker into the enum and add a default case.
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 9 ++++-----
 include/linux/resctrl_types.h         | 3 +++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 73e3fe4f4c87..4962ae4bc596 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -260,12 +260,11 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
 		return &hw_dom->arch_mbm_total[rmid];
 	case QOS_L3_MBM_LOCAL_EVENT_ID:
 		return &hw_dom->arch_mbm_local[rmid];
+	default:
+		/* Never expect to get here */
+		WARN_ON_ONCE(1);
+		return NULL;
 	}
-
-	/* Never expect to get here */
-	WARN_ON_ONCE(1);
-
-	return NULL;
 }
 
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index f26450b3326b..69bf740130ac 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -49,6 +49,9 @@ enum resctrl_event_id {
 	QOS_L3_OCCUP_EVENT_ID		= 0x01,
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
+
+	/* Must be the last */
+	QOS_NUM_EVENTS,
 };
 
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.39.5

