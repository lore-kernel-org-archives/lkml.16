Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB5A253F26
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328367; cv=none; b=H9+61RLBI4XEqYfxrlN+cQ09mhkgMahmr4nKJVqnDO7byLoxUHTAq7LfXSr4D9ZGSBPg6bvlDrhBlClv1hiUTR48gX4jEIJ2jG8sxeXXtnP7/urxvZU8gRKjOeC+Lc7RUtjcg5ywrinzM78haoHLdpD6Z9TFF9K+F7OfQWAs2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328367; c=relaxed/simple;
	bh=532qm4GIb+6V2M5RqC1hMn3KRKMDktXYA+mTH2xY0Hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jkbXxu7VpwPcbybnDaUIxTb6C60o2UFxN7fl/vpbNHXEzE8rYOWE3u1seP8C9q1FXPvHoEnjrTlJ/NZZWbrMuDZUEMv6rTALE4XUV2PMvIb/+u8fDGcjFYTnjcHn3HKRdcMpWa8vQbO/DCjhWLGl0Ecfiss7BlTswNX9bu02qmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C9B106F;
	Thu, 15 May 2025 09:59:10 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39CD73F63F;
	Thu, 15 May 2025 09:59:19 -0700 (PDT)
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
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v12 03/25] cpumask: add cpumask_{first,next}_andnot() API
Date: Thu, 15 May 2025 16:58:33 +0000
Message-Id: <20250515165855.31452-4-james.morse@arm.com>
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

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

With the lack of the functions, client code has to abuse less efficient
cpumask_nth().

Tested-by: James Morse <james.morse@arm.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: James Morse <james.morse@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 include/linux/cpumask.h | 59 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index a3ee875df508..6a569c7534db 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -178,6 +178,19 @@ unsigned int cpumask_first_and(const struct cpumask *srcp1, const struct cpumask
 	return find_first_and_bit(cpumask_bits(srcp1), cpumask_bits(srcp2), small_cpumask_bits);
 }
 
+/**
+ * cpumask_first_andnot - return the first cpu from *srcp1 & ~*srcp2
+ * @srcp1: the first input
+ * @srcp2: the second input
+ *
+ * Return: >= nr_cpu_ids if no such cpu found.
+ */
+static __always_inline
+unsigned int cpumask_first_andnot(const struct cpumask *srcp1, const struct cpumask *srcp2)
+{
+	return find_first_andnot_bit(cpumask_bits(srcp1), cpumask_bits(srcp2), small_cpumask_bits);
+}
+
 /**
  * cpumask_first_and_and - return the first cpu from *srcp1 & *srcp2 & *srcp3
  * @srcp1: the first input
@@ -284,6 +297,25 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
 		small_cpumask_bits, n + 1);
 }
 
+/**
+ * cpumask_next_andnot - get the next cpu in *src1p & ~*src2p
+ * @n: the cpu prior to the place to search (i.e. return will be > @n)
+ * @src1p: the first cpumask pointer
+ * @src2p: the second cpumask pointer
+ *
+ * Return: >= nr_cpu_ids if no further cpus set in both.
+ */
+static __always_inline
+unsigned int cpumask_next_andnot(int n, const struct cpumask *src1p,
+				 const struct cpumask *src2p)
+{
+	/* -1 is a legal arg here. */
+	if (n != -1)
+		cpumask_check(n);
+	return find_next_andnot_bit(cpumask_bits(src1p), cpumask_bits(src2p),
+		small_cpumask_bits, n + 1);
+}
+
 /**
  * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
  *			   @n+1. If nothing found, wrap around and start from
@@ -458,6 +490,33 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,
 	return cpumask_next_and(cpu, mask1, mask2);
 }
 
+/**
+ * cpumask_any_andnot_but - pick an arbitrary cpu from *mask1 & ~*mask2, but not this one.
+ * @mask1: the first input cpumask
+ * @mask2: the second input cpumask
+ * @cpu: the cpu to ignore
+ *
+ * If @cpu == -1, the function returns the first matching cpu.
+ * Returns >= nr_cpu_ids if no cpus set.
+ */
+static __always_inline
+unsigned int cpumask_any_andnot_but(const struct cpumask *mask1,
+				    const struct cpumask *mask2,
+				    int cpu)
+{
+	unsigned int i;
+
+	/* -1 is a legal arg here. */
+	if (cpu != -1)
+		cpumask_check(cpu);
+
+	i = cpumask_first_andnot(mask1, mask2);
+	if (i != cpu)
+		return i;
+
+	return cpumask_next_andnot(cpu, mask1, mask2);
+}
+
 /**
  * cpumask_nth - get the Nth cpu in a cpumask
  * @srcp: the cpumask pointer
-- 
2.39.5

