Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FB52868B0
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724776; cv=none; b=Uu9eDbMtf+xEAauJYQ2pKwrj5qFrbFUD+O2ZVZRh1DNenw+x85Ua5yq4oJr4wGMSs28oiI5D11ePxjGRB38DDVmGpvPXrtxH40/VULhtlaS2ks9gRjcNvIDkjfeg5a+MO3apEMVJgqcASbdMkRvmtHtTzdMmtc43cMzxoBNDZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724776; c=relaxed/simple;
	bh=U3HWYbN3FGWUPEd/xaVKrZ8ciXW+QGYoeCWXYsQjQsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YnEZilJZzi5vdZLl+WVFNx13glt0T3vNCyzxUJ0WShUaIIWcd+uA3nETwyPrB17L4z2sDYTlE5gqkcb+xLz7N/zlALauycTEQ2DaomVyfUzoqK8sfK3UNLjYtz6wQ6hveOOGTn/HPu6E+jqwB2Au9RtIuRAqieMpWU8NFzNVzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54AB72309;
	Thu,  8 May 2025 10:19:24 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 864CB3F58B;
	Thu,  8 May 2025 10:19:31 -0700 (PDT)
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
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH v10 04/30] x86/resctrl: Optimize cpumask_any_housekeeping()
Date: Thu,  8 May 2025 17:18:32 +0000
Message-Id: <20250508171858.9197-5-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508171858.9197-1-james.morse@arm.com>
References: <20250508171858.9197-1-james.morse@arm.com>
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
Reviewed-by: James Morse <james.morse@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
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

