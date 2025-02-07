Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F34B1DE4D4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952421; cv=none; b=tkRt59xJGB2ns9B1MjZHvnLaCZAeMkxuq4Ap1Fl+wlWaaPn2AQ2psDtOlWl/8n1EVcEqgzF269DfW1R0F3sl/HEptWTiDb8YtLHcp2qGTPJiy8X32HKMtaCEAInQKlREve88bfHy0wACpeAz7FPacB5vt7LqylctewzUB4X+Hi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952421; c=relaxed/simple;
	bh=bmciXJaZV9HHK4Q9ivAqMxBoZlpxNrpk/8Wd+W2iqaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EObZn/e+oGePkdHZMdciZD9btxPUDjiiixtVi1VEmvUDerrAhawpHJSujYVQ6xQno5Tjma1qR0q0ft3XivSrbQAIONqCW+YAZDxIajTspje4uAY5FBexegXojkk1P0Pm2RfzcGyDH5CcCukaFqMoVXL4O2AjkInbqDzHV3eeQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D1271EA6;
	Fri,  7 Feb 2025 10:20:41 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749EE3F63F;
	Fri,  7 Feb 2025 10:20:15 -0800 (PST)
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
Subject: [PATCH v6 27/42] x86/resctrl: Move RFTYPE flags to be managed by resctrl
Date: Fri,  7 Feb 2025 18:18:08 +0000
Message-Id: <20250207181823.6378-28-james.morse@arm.com>
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

resctrl_file_fflags_init() is called from the architecture specific code
to make the 'thread_throttle_mode' file visible. The architecture specific
code has already set the membw.throttle_mode in the rdt_resource.

This forces the RFTYPE flags used by resctrl to be exposed to the
architecture specific code.

This doesn't need to be specific to the architecture, the throttle_mode
can be used by resctrl to determine if the 'thread_throttle_mode' file
should be visible. This allows the RFTYPE flags to be private to resctrl.

Add thread_throttle_mode_init(), and use it to call
resctrl_file_fflags_init()  from resctrl_setup(). This avoids
publishing an extra function between the architecture and filesystem
code.

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v5:
 * Added checking for SMBA.
 * Added printing of undefined to rdt_thread_throttle_mode_show().
 * Major juggling around commit 2937f9c361f7 ("x86/resctrl: Introduce resctrl_file_fflags_init() to initialize fflags")
 * Dropped tags, split patch
---
 arch/x86/kernel/cpu/resctrl/core.c     |  3 ---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 1fb4eb4e0ea9..e4b676879227 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -229,9 +229,6 @@ static __init bool __get_mem_config_intel(struct rdt_resource *r)
 	else
 		r->membw.throttle_mode = THREAD_THROTTLE_MAX;
 
-	resctrl_file_fflags_init("thread_throttle_mode",
-				 RFTYPE_CTRL_INFO | RFTYPE_RES_MB);
-
 	r->alloc_capable = true;
 
 	return true;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index e59271515a46..58feba3feefd 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2064,6 +2064,16 @@ static struct rftype *rdtgroup_get_rftype_by_name(const char *name)
 	return NULL;
 }
 
+static void thread_throttle_mode_init(void)
+{
+	struct rdt_resource *r_mba;
+
+	r_mba = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	if (r_mba->membw.throttle_mode != THREAD_THROTTLE_UNDEFINED)
+		resctrl_file_fflags_init("thread_throttle_mode",
+					 RFTYPE_CTRL_INFO | RFTYPE_RES_MB);
+}
+
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
 {
 	struct rftype *rft;
@@ -4277,6 +4287,8 @@ int __init resctrl_init(void)
 
 	rdtgroup_setup_default();
 
+	thread_throttle_mode_init();
+
 	ret = resctrl_mon_resource_init();
 	if (ret)
 		return ret;
-- 
2.39.2

