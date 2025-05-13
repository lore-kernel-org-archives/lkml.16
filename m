Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78F52BF3C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156597; cv=none; b=b4WcxE9x7PN0sZXlHYcvIOrLjUNA/QP7BFWZInDe7xKG3JpSupoipvCrDUZwoYCCDCe0xhhOfBg5psTmBoTP2edoPTaFBNWqbuOlOZ6rsvlhNUFONhuwLvP9gREKy3r9AeVdIhXF9O9FOotq9GOkbPV7vr/ikl2kI2XZCsTY++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156597; c=relaxed/simple;
	bh=7pGNjnpyut+wnAzq0W/mlo5fTDMDiqWHJdTfYeLtrKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YFlMnMm7zlHNULQ5ri/Wyd5RggYHse7ePpfX/QL3Iw+s5vf6DHzuftCW9iszQiEP2miprCgEoPMDeUVXMcJ26LrmgGAU7hYnB2B3fCbsxXcInJ+xR4Zr7e8BwHtD3ZxuNSgj0s47Ml3np5HwhfY5Xclpf6PNdGqrw4RdtOWxaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07C2A22F8;
	Tue, 13 May 2025 10:16:24 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 727A63F63F;
	Tue, 13 May 2025 10:16:29 -0700 (PDT)
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
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v11 04/30] x86/resctrl: Optimize cpumask_any_housekeeping()
Date: Tue, 13 May 2025 17:15:21 +0000
Message-Id: <20250513171547.15194-5-james.morse@arm.com>
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

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

With the lack of cpumask_any_andnot_but(), cpumask_any_housekeeping()
has to abuse cpumask_nth() functions.

Update cpumask_any_housekeeping() to use the new cpumask_any_but()
and cpumask_any_andnot_but(). These two functions understand
RESCTRL_PICK_ANY_CPU, which simplifies cpumask_any_housekeeping()
significantly.

Tested-by: James Morse <james.morse@arm.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: James Morse <james.morse@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index eaae99602b61..25b61e466715 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -47,30 +47,16 @@
 static inline unsigned int
 cpumask_any_housekeeping(const struct cpumask *mask, int exclude_cpu)
 {
-	unsigned int cpu, hk_cpu;
-
-	if (exclude_cpu == RESCTRL_PICK_ANY_CPU)
-		cpu = cpumask_any(mask);
-	else
-		cpu = cpumask_any_but(mask, exclude_cpu);
-
-	/* Only continue if tick_nohz_full_mask has been initialized. */
-	if (!tick_nohz_full_enabled())
-		return cpu;
-
-	/* If the CPU picked isn't marked nohz_full nothing more needs doing. */
-	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
-		return cpu;
+	unsigned int cpu;
 
 	/* Try to find a CPU that isn't nohz_full to use in preference */
-	hk_cpu = cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
-	if (hk_cpu == exclude_cpu)
-		hk_cpu = cpumask_nth_andnot(1, mask, tick_nohz_full_mask);
+	if (tick_nohz_full_enabled()) {
+		cpu = cpumask_any_andnot_but(mask, tick_nohz_full_mask, exclude_cpu);
+		if (cpu < nr_cpu_ids)
+			return cpu;
+	}
 
-	if (hk_cpu < nr_cpu_ids)
-		cpu = hk_cpu;
-
-	return cpu;
+	return cpumask_any_but(mask, exclude_cpu);
 }
 
 struct rdt_fs_context {
-- 
2.39.5

