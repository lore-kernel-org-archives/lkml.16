Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321031B0F11
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952374; cv=none; b=i74v7Y7xzbK0b0uIYGOU6zhsLDTlFqDFZ830SLBkKEtL6rUHaAtWGiNUWy7V8YzhQwP32EZ7eXoCzrhPS7oUY5EDJH4O04i9GHjZbfNFByQnNg8clW/86YRI1uCgGtJhgtUoqoGZgFuXT4vB3XFfIeMw9NBesOJsy8McBbZougc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952374; c=relaxed/simple;
	bh=Z3Xbn9Cj4b8g2Iz0iuCFyMeiV1pxb+nYr6HwHjhio/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PvsmXQjlFjDL+38ysHrs18wV6IYDzxkfMIIiVEYK8WyN1zrTnKKuU1Ozzss1owNbS+i+oYDceK8HnHLoyv50MbDrFIsQCBiiSg6RFqG/iRz9HuheQXv61uskRz2M3pnl0lToXfWvxZQs06Gnk7PGUjWX6dggfSdUYUOoQsDOklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 490F712FC;
	Fri,  7 Feb 2025 10:19:55 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 472563F63F;
	Fri,  7 Feb 2025 10:19:29 -0800 (PST)
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
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 14/42] x86/resctrl: Add an arch helper to reset one resource
Date: Fri,  7 Feb 2025 18:17:55 +0000
Message-Id: <20250207181823.6378-15-james.morse@arm.com>
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

On umount(), resctrl resets each resource back to its default
configuration. It only ever does this for all resources in one go.

reset_all_ctrls() is architecture specific as it works with struct
rdt_hw_resource.

Make reset_all_ctrls() an arch helper that resets one resource.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v5:
 * Move the arch/fs split into the for-each loop at Reinette's suggestion.
 * Dropped a bunch of tags and rewrote the commit message.

Changes since v1:
 * Rename the for_each_capable_rdt_resource() introduced in the new
   function resctrl_arch_reset_resources(), back to
   for_each_alloc_capable_rdt_resource() as it was in the original code.

   The change looked unintentional; and presumably a resource that does
   not support resource allocation doesn't have any properties to
   reset...
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 9 +++++----
 include/linux/resctrl.h                | 9 +++++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index b2dad689e780..9eb57ebb36c6 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2867,7 +2867,7 @@ static int rdt_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
-static int reset_all_ctrls(struct rdt_resource *r)
+void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	struct rdt_hw_ctrl_domain *hw_dom;
@@ -2896,7 +2896,7 @@ static int reset_all_ctrls(struct rdt_resource *r)
 		smp_call_function_any(&d->hdr.cpu_mask, rdt_ctrl_update, &msr_param, 1);
 	}
 
-	return 0;
+	return;
 }
 
 /*
@@ -3015,9 +3015,10 @@ static void rdt_kill_sb(struct super_block *sb)
 
 	rdt_disable_ctx();
 
-	/*Put everything back to default values. */
+	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
-		reset_all_ctrls(r);
+		resctrl_arch_reset_all_ctrls(r);
+
 	rmdir_all_sub();
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 74cfd48e69ee..4444bc05e39c 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -414,6 +414,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
  */
 void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
 
+/**
+ * resctrl_arch_reset_all_ctrls() - Reset the control for each CLOSID to its
+ *				    default.
+ * @r:		The resctrl resource to reset.
+ *
+ * This can be called from any CPU.
+ */
+void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.39.2

