Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDB52BFC73
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156666; cv=none; b=LfDmBj8hs32IZ0M1rINf2tKlLG6UY2cjU/tk//stOZHEqrI1vdh0zIQ5MNRwKn+tFpG1Tq9dVBOiL2BE6pZ4EKGokKfl9NdjgPEThYQqazPiwsrjcU+BeaDtgIstKLDd7oDqpdnB2hNyMraYqkOO+K3RNdt57ONHN8j37QA1354=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156666; c=relaxed/simple;
	bh=K7q9cXxGK3QYb28h3CmHgJoznCS0OoSNYy/7peaf1ZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sdCcdUtP5t6slCeIMml7JrPFMV12GwJpW9LMtQfIJ8YiqyHJDhD9B4GK6tvEsUs6dgTmMBmEe16mZjhvmOlLGHvYg7EIzjHeU2naCW5HJwUagJ361UxV65sROs12Sco+6RijvegdfwrPNFJhTcl1l9YovOhb72S//a45iCQ6Rl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 644C22BC6;
	Tue, 13 May 2025 10:17:33 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC1913F63F;
	Tue, 13 May 2025 10:17:40 -0700 (PDT)
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
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Babu Moger <babu.moger@amd.com>
Subject: [PATCH v11 21/30] x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
Date: Tue, 13 May 2025 17:15:38 +0000
Message-Id: <20250513171547.15194-22-james.morse@arm.com>
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

From: Dave Martin <Dave.Martin@arm.com>

rdt_init_fs_context() sizes a typed allocation using an explicit
sizeof(type) expression, which checkpatch.pl complains about.

Since this code is about to be factored out and made generic, this
is a good opportunity to fix the code to size the allocation based
on the target pointer instead, to reduce the chance of future mis-
maintenance.

Fix it.

No functional change.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 02c5f626bce1..ace86b6dcede 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2951,7 +2951,7 @@ static int rdt_init_fs_context(struct fs_context *fc)
 {
 	struct rdt_fs_context *ctx;
 
-	ctx = kzalloc(sizeof(struct rdt_fs_context), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-- 
2.39.5

