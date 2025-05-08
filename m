Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FF528C849
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724870; cv=none; b=p/FiK0/87uKKxgevNSa9UnP/27PdT3dboNCnfBQUQ+TXmGZUsSBJ4eyDUEPaicFegNidfOPtZzvzP+OyUJzLp7DR6FnJhbfSjg8UvuIGHJlnTIs45OBOW477GN8A8mTI0ESHL4dmNJZ2d6M6Tj5eumuUVjGxJejaidrzm22jHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724870; c=relaxed/simple;
	bh=5PK4LLyDZCUFsHN81CVTBuac4FVFIA6T5SqRLb/gsFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRL/50v4i5602JSfqGdCwJwMZjmzN6aVVYYFpCFTtrVbzhfKj4dpZcG0qlVs5A/0mk2EZixuUIZcl8LSaRDa91aJSjilfqmLRNemztLYPQvih23HVt+LDfRV75Pv02JMXji1UTStoptaGDZPgnz0h0zVodA/rNuCAqS6m2OpN94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86E0C2641;
	Thu,  8 May 2025 10:20:57 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26353F58B;
	Thu,  8 May 2025 10:21:04 -0700 (PDT)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Babu Moger <babu.moger@amd.com>
Subject: [PATCH v10 29/30] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
Date: Thu,  8 May 2025 17:18:57 +0000
Message-Id: <20250508171858.9197-30-james.morse@arm.com>
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

The filesystem code has moved from arch/x86 to fs. Move the documentation
too.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
Tested-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/arch/x86/index.rst                    | 1 -
 Documentation/filesystems/index.rst                 | 1 +
 Documentation/{arch/x86 => filesystems}/resctrl.rst | 0
 MAINTAINERS                                         | 2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c               | 2 +-
 fs/resctrl/Kconfig                                  | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/{arch/x86 => filesystems}/resctrl.rst (100%)

diff --git a/Documentation/arch/x86/index.rst b/Documentation/arch/x86/index.rst
index 8ac64d7de4dc..00f9a99689fb 100644
--- a/Documentation/arch/x86/index.rst
+++ b/Documentation/arch/x86/index.rst
@@ -31,7 +31,6 @@ x86-specific Documentation
    pti
    mds
    microcode
-   resctrl
    tsx_async_abort
    buslock
    usb-legacy-support
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index a9cf8e950b15..32618512a965 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -113,6 +113,7 @@ Documentation for filesystem implementations.
    qnx6
    ramfs-rootfs-initramfs
    relay
+   resctrl
    romfs
    smb/index
    spufs/index
diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/filesystems/resctrl.rst
similarity index 100%
rename from Documentation/arch/x86/resctrl.rst
rename to Documentation/filesystems/resctrl.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index e8f3b28e5db6..e54b9019e942 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20365,7 +20365,7 @@ M:	Tony Luck <tony.luck@intel.com>
 M:	Reinette Chatre <reinette.chatre@intel.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	Documentation/arch/x86/resctrl*
+F:	Documentation/filesystems/resctrl.rst
 F:	arch/x86/include/asm/resctrl.h
 F:	arch/x86/kernel/cpu/resctrl/
 F:	fs/resctrl/
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3936bab81411..3fc4d9f56f0d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -40,7 +40,7 @@ unsigned int rdt_mon_features;
 static int snc_nodes_per_l3_cache = 1;
 
 /*
- * The correction factor table is documented in Documentation/arch/x86/resctrl.rst.
+ * The correction factor table is documented in Documentation/filesystems/resctrl.rst.
  * If rmid > rmid threshold, MBM total and local values should be multiplied
  * by the correction factor.
  *
diff --git a/fs/resctrl/Kconfig b/fs/resctrl/Kconfig
index 478a8e2ad99f..21671301bd8a 100644
--- a/fs/resctrl/Kconfig
+++ b/fs/resctrl/Kconfig
@@ -21,7 +21,7 @@ config RESCTRL_FS
 	  On architectures where this can be disabled independently, it is
 	  safe to say N.
 
-	  See <file:Documentation/arch/x86/resctrl.rst> for more information.
+	  See <file:Documentation/filesystems/resctrl.rst> for more information.
 
 config RESCTRL_FS_PSEUDO_LOCK
 	bool
-- 
2.39.5

