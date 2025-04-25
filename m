Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6081A2586F6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602785; cv=none; b=kcTpxqs9+JxRS1GLFnqtZ39N89pPDFtmPkx7lfm4ndOQLiPmjv0iP+zlePKJwLdg3rVf33l/kyryj7hSRU5wu/daY9PpJa32N6DJbOsytBOwsgA8zeN0OuRN/ZRCj9j0OSP7xkESMSm7TFTZTuNF0hB6hyeRt+ZwND8d4BKVNSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602785; c=relaxed/simple;
	bh=de/BaNMHPSrEs3yxfX5qnuyI3n3Kxg4bkODngkt7b3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rd64+2Z43Su/q1yn+fzxVAGEC6VZkE4NnSjNNuLY9Qo8bbFo145ZopUPK9giYkldfQ+LyEIrAVIiuCX7hoMl2a1mjLRgXQc0UHa95v6otCzsAvyTSctyY23KPZ8DPFKVBflQrpOch2611biURFj05V7zgjGYZWucEUdu5neJDtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13ECC20E3;
	Fri, 25 Apr 2025 10:39:38 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 338113F762;
	Fri, 25 Apr 2025 10:39:40 -0700 (PDT)
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
Subject: [PATCH v9 13/27] x86/resctrl: Move enum resctrl_event_id to resctrl.h
Date: Fri, 25 Apr 2025 17:37:55 +0000
Message-Id: <20250425173809.5529-14-james.morse@arm.com>
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

A previous patch moved enum resctrl_event_id into a smaller header file,
resctrl_types.h, so that architectures could use these types in their
definitions of asm/resctrl.h. Specifically this was for
resctrl_arch_get_cdp_enabled() and resctrl_arch_set_cdp_enabled().

Those two functions are no longer inlined by any architecture, so
the enum can be moved to resctrl.h.

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v8:
 * This patch is new.
---
 include/linux/resctrl.h       | 10 ++++++++++
 include/linux/resctrl_types.h | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index b9d1f2916e9c..5ef972cbf56b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -48,6 +48,16 @@ int proc_resctrl_show(struct seq_file *m,
 	for_each_rdt_resource((r))					      \
 		if ((r)->mon_capable)
 
+enum resctrl_res_level {
+	RDT_RESOURCE_L3,
+	RDT_RESOURCE_L2,
+	RDT_RESOURCE_MBA,
+	RDT_RESOURCE_SMBA,
+
+	/* Must be the last */
+	RDT_NUM_RESOURCES,
+};
+
 /**
  * enum resctrl_conf_type - The type of configuration.
  * @CDP_NONE:	No prioritisation, both code and data are controlled or monitored.
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a66e7936943e..a25fb9c4070d 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -34,16 +34,6 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
-enum resctrl_res_level {
-	RDT_RESOURCE_L3,
-	RDT_RESOURCE_L2,
-	RDT_RESOURCE_MBA,
-	RDT_RESOURCE_SMBA,
-
-	/* Must be the last */
-	RDT_NUM_RESOURCES,
-};
-
 /*
  * Event IDs, the values match those used to program IA32_QM_EVTSEL before
  * reading IA32_QM_CTR on RDT systems.
-- 
2.39.5

