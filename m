Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E355D1D5CEA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952399; cv=none; b=P2Zu7CSLyN0MAl6kunDPjJMqDh3+NYH0ll6NSPKyYWS2FShIZ5TI3qghQjYJVm9OyC2SUkKndoRzEme/24eswZYwlpsMxrxm8V/GFGDsMyYwAMP5uDO/AMAQwAF37DdFVHdDImj6Dc2klLZ95D17rOykXi8HFBclkxVf2Ihn3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952399; c=relaxed/simple;
	bh=f4fcM8XvZ9CzY75WIY4tgMxnh2xtt7iB3qm+EJzMoQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FfMPNKytrK3AmpIzGZ6Cxr6C5ITU07r6VwNAvr2dhqWkUcCziIm4sN47Emf81U9WPHkzoOm43FiUlNh1FHeGzNPyKs+G3wX8c5X69uZfdEAAtG9at5Zq10RBIX+mg1VGDSIhmPBoqb8RJlOG023u8n0E5TJGeKaJX8V4tUgRLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45CC612FC;
	Fri,  7 Feb 2025 10:20:20 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EE0C3F7D8;
	Fri,  7 Feb 2025 10:19:54 -0800 (PST)
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
	Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH v6 21/42] x86/resctrl: Move mba_mbps_default_event init to filesystem code
Date: Fri,  7 Feb 2025 18:18:02 +0000
Message-Id: <20250207181823.6378-22-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250207181823.6378-1-james.morse@arm.com>
References: <20250207181823.6378-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mba_mbps_default_event is initialised base on whether mbm_local or
mbm_total is supported. In the case of both, it is initialised to
mbm_local. mba_mbps_default_event is initialised in core.c's
get_rdt_mon_resources(), while all the readers are in rdtgroup.c.

After this code is split into architecture specific and filesystem code,
get_rdt_mon_resources() remains part of the architecture code, which
would mean mba_mbps_default_event has to be exposed by the filesystem
code.

Move the initialisation to the filesystem's resctrl_mon_resource_init()

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/x86/kernel/cpu/resctrl/core.c    | 5 -----
 arch/x86/kernel/cpu/resctrl/monitor.c | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 43a9291988d3..1fb4eb4e0ea9 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -924,11 +924,6 @@ static __init bool get_rdt_mon_resources(void)
 	if (!rdt_mon_features)
 		return false;
 
-	if (resctrl_arch_is_mbm_local_enabled())
-		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
-	else if (resctrl_arch_is_mbm_total_enabled())
-		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
-
 	return !rdt_get_mon_l3_config(r);
 }
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index ab8f33f2277e..17968cafc288 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1216,6 +1216,11 @@ int __init resctrl_mon_resource_init(void)
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 
+	if (resctrl_arch_is_mbm_local_enabled())
+		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
+	else if (resctrl_arch_is_mbm_total_enabled())
+		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
+
 	return 0;
 }
 
-- 
2.39.2

