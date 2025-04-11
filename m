Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA2921E0BE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389852; cv=none; b=H1q2WNqO9VxyPe4XmKzxUUAeRP7u1ayiywxpKrgKR92rOMj2DY5mdY1frjpKzHG9Q1UoxGyUxeLwKE34Vngq/fPyr1N0HnlOCaivjti5Ih0rUbMao36M9LPZ/RN/FP+HLF5AApZ5UtSSCI90RI/Uoxavy56FMAXyZhUzpoAm+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389852; c=relaxed/simple;
	bh=tBRi0MnA4nkgJqMlE8WrplzkTuqZfJ4AzKGyFEIRPMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c3JMihTgcvRbrcmFcV9Klh3CMv1LaKW45tU9Rhjo/TpCbS1+uLbUCVTrG9Sw0dyg/BLCvFsNI8l1rzGnur0+vwPBhSG2ZEHw6Pszpvhdt3f5SoxlEpTvjPj6q8hWoW4Uq4+RZJ+RI0nrC+Zn7IPNKLZHoAYJE6uob9XpA0akuHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99FD3237B;
	Fri, 11 Apr 2025 09:44:10 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C58463F694;
	Fri, 11 Apr 2025 09:44:07 -0700 (PDT)
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
Subject: [PATCH v8 16/21] x86/resctrl: Always initialise rid field in rdt_resources_all[]
Date: Fri, 11 Apr 2025 16:42:24 +0000
Message-Id: <20250411164229.23413-17-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250411164229.23413-1-james.morse@arm.com>
References: <20250411164229.23413-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86 has an array, rdt_resources_all[], of all possible resources.
The for-each-resource walkers depend on the rid field of all
resources being initialised.

If the array ever grows due to another architecture adding a resource
type that is not defined on x86, the for-each-resources walkers will
loop forever.

Initialise all the rid values in resctrl_arch_late_init() before
any for-each-resource walker can be called.

Signed-off-by: James Morse <james.morse@arm.com>

---
Changes since v7:
 * Split out of a previous patch due to a botched merged conflict.
---
 arch/x86/kernel/cpu/resctrl/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 58d7c6accdf2..ce684da600bc 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -60,7 +60,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 	[RDT_RESOURCE_L3] =
 	{
 		.r_resctrl = {
-			.rid			= RDT_RESOURCE_L3,
 			.name			= "L3",
 			.ctrl_scope		= RESCTRL_L3_CACHE,
 			.mon_scope		= RESCTRL_L3_CACHE,
@@ -74,7 +73,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 	[RDT_RESOURCE_L2] =
 	{
 		.r_resctrl = {
-			.rid			= RDT_RESOURCE_L2,
 			.name			= "L2",
 			.ctrl_scope		= RESCTRL_L2_CACHE,
 			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_L2),
@@ -86,7 +84,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 	[RDT_RESOURCE_MBA] =
 	{
 		.r_resctrl = {
-			.rid			= RDT_RESOURCE_MBA,
 			.name			= "MB",
 			.ctrl_scope		= RESCTRL_L3_CACHE,
 			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_MBA),
@@ -96,7 +93,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 	[RDT_RESOURCE_SMBA] =
 	{
 		.r_resctrl = {
-			.rid			= RDT_RESOURCE_SMBA,
 			.name			= "SMBA",
 			.ctrl_scope		= RESCTRL_L3_CACHE,
 			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_SMBA),
@@ -996,7 +992,11 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)
 static int __init resctrl_arch_late_init(void)
 {
 	struct rdt_resource *r;
-	int state, ret;
+	int state, ret, i;
+
+	/* Initialise all rid values for_each_rdt_resource() */
+	for (i = 0; i < RDT_NUM_RESOURCES; i++)
+		rdt_resources_all[i].r_resctrl.rid = i;
 
 	/*
 	 * Initialize functions(or definitions) that are different
-- 
2.20.1

