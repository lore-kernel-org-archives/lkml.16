Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F021628F501
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156582; cv=none; b=e1RoSF91F81wtWNWNQL+YWudBpVUb8q/ZNI3p9K6eUqgXvR9tYjW+WcIhFuuyuTXl+1atuUL86NZ55F1ws+J7CnoHVCpw8zbBNNX14Jis7OWCUUvQXRnVrCAlYBEiCBk3nJdwLqFWsuy5kCulRung6/xWexW32DUT/l+FJy0yWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156582; c=relaxed/simple;
	bh=BG+vkr2MmKllU4XAVvx67UKzhs9mNW2vhBDs+9FeyAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MMsPpCpdWYbp9A45sAb4kcS3WsEt333Z7ubZyJkqvozejUjZs1TCMBG+WMODO4btM+YNVzzDv2XuvCb0cPl8LwK6y0Xg9D7YMdmOkWlJ7950nMO/gGbf7yEtNsIczfRrD76RzRfgfszG5hPyy4cjT9cm0JTT+R72fS8OxSVnKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43667168F;
	Tue, 13 May 2025 10:16:09 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE5853F63F;
	Tue, 13 May 2025 10:16:16 -0700 (PDT)
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
Subject: [PATCH v11 01/30] cpumask: relax cpumask_any_but()
Date: Tue, 13 May 2025 17:15:18 +0000
Message-Id: <20250513171547.15194-2-james.morse@arm.com>
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

Similarly to other cpumask search functions, accept -1, and consider
it as 'any cpu' hint. This helps users to avoid coding special cases.

Tested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 include/linux/cpumask.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index f9a868384083..a3ee875df508 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -413,14 +413,18 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
  * @cpu: the cpu to ignore.
  *
  * Often used to find any cpu but smp_processor_id() in a mask.
+ * If @cpu == -1, the function is equivalent to cpumask_any().
  * Return: >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
-unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
+unsigned int cpumask_any_but(const struct cpumask *mask, int cpu)
 {
 	unsigned int i;
 
-	cpumask_check(cpu);
+	/* -1 is a legal arg here. */
+	if (cpu != -1)
+		cpumask_check(cpu);
+
 	for_each_cpu(i, mask)
 		if (i != cpu)
 			break;
@@ -433,16 +437,20 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
  * @mask2: the second input cpumask
  * @cpu: the cpu to ignore
  *
+ * If @cpu == -1, the function is equivalent to cpumask_any_and().
  * Returns >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
 unsigned int cpumask_any_and_but(const struct cpumask *mask1,
 				 const struct cpumask *mask2,
-				 unsigned int cpu)
+				 int cpu)
 {
 	unsigned int i;
 
-	cpumask_check(cpu);
+	/* -1 is a legal arg here. */
+	if (cpu != -1)
+		cpumask_check(cpu);
+
 	i = cpumask_first_and(mask1, mask2);
 	if (i != cpu)
 		return i;
-- 
2.39.5

