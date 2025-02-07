Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323501ACEDF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952445; cv=none; b=oz0rn08ppcJItbPirWQB9dk4QGqBpOPGLYnlj4gZb2oKEXsabObD8FHec6z0ZBPqplcZtMDN4dODPqg3OZtSuRVxAOrfuVQ3YIOc91y5VbaKtrJbEg3DL1hB7Cj24Mz7xKWAuwJwCrJJCbKLznOSRABYS5/xIe7eFCzl86IRLYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952445; c=relaxed/simple;
	bh=iY4qX0TWlCwy2SawK4wCfwGpPHl1IGh3+W5Jre7MmlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pc6V4+bzYq6p/dlS7kEoX461ZN8P5wGRLVv1BQkLX4qRltNdDll52gLVkj3zujVPShiIm1fuHCNZtDnfiMpeyW0b/wCQWsY+Z8zV7z08a1J1wvPUjlo6vsSJwhL2vqvS+fwDB0Ojw1D3kb//JNbrQ6E0AKyJqoDcEPXXxlxgIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65C2412FC;
	Fri,  7 Feb 2025 10:21:02 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470263F63F;
	Fri,  7 Feb 2025 10:20:36 -0800 (PST)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 33/42] x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
Date: Fri,  7 Feb 2025 18:18:14 +0000
Message-Id: <20250207181823.6378-34-james.morse@arm.com>
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

resctrl_exit() was intended for use when the 'resctrl' module was unloaded.
resctrl can't be built as a module, and the kernfs helpers are not exported
so this is unlikely to change. MPAM has an error interrupt which indicates
the MPAM driver has gone haywire. Should this occur tasks could run with
the wrong control values, leading to bad performance for important tasks.
The MPAM driver needs a way to tell resctrl that no further configuration
should be attempted.

Using resctrl_exit() for this leaves the system in a funny state as
resctrl is still mounted, but cannot be un-mounted because the sysfs
directory that is typically used has been removed. Dave Martin suggests
this may cause systemd trouble in the future as not all filesystems
can be unmounted.

Add calls to remove all the files and directories in resctrl, and
remove the sysfs_remove_mount_point() call that leaves the system
in a funny state. When triggered, this causes all the resctrl files
to disappear. resctrl can be unmounted, but not mounted again.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v5:
 * Serialise rdtgroup_destroy_root() against umount().
 * Check rdtgroup_default.kn to protect against duplicate calls.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6e30283358d4..424622d2f959 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -4092,8 +4092,12 @@ static int rdtgroup_setup_root(struct rdt_fs_context *ctx)
 
 static void rdtgroup_destroy_root(void)
 {
-	kernfs_destroy_root(rdt_root);
-	rdtgroup_default.kn = NULL;
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (rdtgroup_default.kn) {
+		kernfs_destroy_root(rdt_root);
+		rdtgroup_default.kn = NULL;
+	}
 }
 
 static void __init rdtgroup_setup_default(void)
@@ -4371,9 +4375,12 @@ int __init resctrl_init(void)
 
 void __exit resctrl_exit(void)
 {
+	mutex_lock(&rdtgroup_mutex);
+	rdtgroup_destroy_root();
+	mutex_unlock(&rdtgroup_mutex);
+
 	debugfs_remove_recursive(debugfs_resctrl);
 	unregister_filesystem(&rdt_fs_type);
-	sysfs_remove_mount_point(fs_kobj, "resctrl");
 
 	resctrl_mon_resource_exit();
 }
-- 
2.39.2

