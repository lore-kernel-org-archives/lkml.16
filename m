Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586D92749D8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908548; cv=none; b=qvfJFHQie0cc3MXfSmkzOYhd1+epHTJLSQC+MlvlL3p+LRCIg8xRz2kQ0KwkAGkC6YvYCe0APCa69q1VZFtTYOufM3GD++oMxs9eCcmH5tUuhoFqST1YqY9h33MTsss0MY8St02TnNkggMNT0fpZoed/u+nXywb65e8cTuMx730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908548; c=relaxed/simple;
	bh=kGVRxUlzoEJB4qXKwlBh+TaHXZU8T8gOZTim9slD8MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1Ibv/x6tQ9KyTSGQ58lPasWZxmE9SXc/30vEdW8fNJ4NCRJ9JOF2STex3BzfVgF/9oLKk7NPK1VIfmZsfmxtlduIzTtXtpNpHZ7ip1aq0HhTO2BlBdcAo+pXnVjAH2Jzr1Tjxk2TNVkRxW2Hy+OjMqcn/1SRs5T/KHTEo+TGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/Yedh9q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/Yedh9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745908547; x=1777444547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kGVRxUlzoEJB4qXKwlBh+TaHXZU8T8gOZTim9slD8MM=;
  b=E/Yedh9q/5q862LqhBYtRbu/mxWiqHqxc7q2IFJBZVIuvRy+RhwF042Q
   a6QZHxwO/YeoB9pTU4sJZ114vdNZnE5APp+QkfITg/dWY0u4ZXVYbiztB
   zRzwsLG92wtOHEwORTiTmOxgHofAvjDFkrMqUoxUZBsRvbv9t3kHusPvA
   jDX7OHU0CoexzT4MfsTEdNfitZpSlKAtDBJNTs9X2fhi2nMTFLDhKRG2Z
   wUtSHHbI8QjPM34JxoxbmflHIY8L1PNv7Cwqz2qIjdOjC4rH/2FLdL7IT
   F7CtBiNpEaSuURRRFIO6BqD3e1+bs1b2a00iNBDYln3i9iKQQtM3Mdzi+
   w==;
X-CSE-ConnectionGUID: e3NmC6w7QlKM/pNK0jJuXQ==
X-CSE-MsgGUID: Kj1WJOXyQUWLj73ckRzFXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="64937629"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="64937629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:35:46 -0700
X-CSE-ConnectionGUID: vi0G0E8RRb+fV6w4HGJ3UQ==
X-CSE-MsgGUID: kK4hmxZUSpe7uRE8Ov9/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134254076"
Received: from unknown (HELO CannotLeaveINTEL.bj.intel.com) ([10.238.153.146])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2025 23:35:42 -0700
From: Jun Miao <jun.miao@intel.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jun.miao@intel.com,
	fan.du.com,
	zhiquan1.li@intel.com
Subject: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE was not successful
Date: Tue, 29 Apr 2025 10:31:14 -0400
Message-ID: <20250429143114.1724280-2-jun.miao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429143114.1724280-1-jun.miao@intel.com>
References: <20250429143114.1724280-1-jun.miao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhiquan Li <zhiquan1.li@intel.com>

The ENUM_TOPOLOGY and VIRT_CPUID2 virtualization control are the subset
of the REDUCE_VE control, TD enabling REDUCE_VE will also implicitly
enable ENUM_TOPOLOGY and VIRT_CPUID2.  Both features were introduced
earlier than REDUCE_VE.  Now if enabling REDUCE_VE is failed
will fall back to enabling ENUM_TOPOLOGY, the same reason is applicable
for VIRT_CPUID2.

The VIRT_CPUID2 feature allows TDX module provides fixed values
eax=0x00feff01, ebx=0, ecx=0 and edx=0, meaning "cache data is returned
by CPUID leaf 0x4" and "TLB data is returned by CPUID leaf 0x18" while
TD guest execution of CPUID leaf 0x2, instead the kernel CPUID #VE
handler returns all zeros.  It is quite useful for backward
compatibility.

REDUCE_VE can only be enabled if x2APIC_ID has been properly configured
with unique values for each VCPU.  Check if VMM has provided an activated
topology configuration first as it is the prerequisite of REDUCE_VE and
ENUM_TOPOLOGY, so move it to reduce_unnecessary_ve().  The function
enable_cpu_topology_enumeration() was very little and can be
integrated into reduce_unnecessary_ve().

Only try to enable VIRT_CPUID2 when REDUCE_VE was not successful and the
depended x2APIC_ID didn't set to each TD vCPU.

Fixes: cd9ce8217345 ("x86/tdx: Disable unnecessary virtualization exceptions")
Co-developed-by: Jun Miao <jun.miao@intel.com>
Signed-off-by: Jun Miao <jun.miao@intel.com>
Signed-off-by: Zhiquan Li <zhiquan1.li@intel.com>
---
 arch/x86/coco/tdx/tdx.c | 52 +++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index edab6d6049be..94062dbf57fd 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -247,43 +247,59 @@ static void disable_sept_ve(u64 td_attr)
 }
 
 /*
+ * Newer TDX modules provide a "REDUCE_VE" feature.  When enabled, it
+ * drastically cuts cases when guests receive #VE on MSR and CPUID accesses,
+ * and TDX module also forces ENUM_TOPOLOGY and VIRT_CPUID to enabled.
+ *
+ * But REDUCE_VE can only be enabled if x2APIC_ID has been properly configured
+ * with unique values for each VCPU. So check if VMM has provided a valid
+ * topology configuration first.
+ *
  * TDX 1.0 generates a #VE when accessing topology-related CPUID leafs (0xB and
  * 0x1F) and the X2APIC_APICID MSR. The kernel returns all zeros on CPUID #VEs.
  * In practice, this means that the kernel can only boot with a plain topology.
  * Any complications will cause problems.
  *
  * The ENUM_TOPOLOGY feature allows the VMM to provide topology information.
- * Enabling the feature  eliminates topology-related #VEs: the TDX module
+ * Enabling the feature eliminates topology-related #VEs: the TDX module
  * virtualizes accesses to the CPUID leafs and the MSR.
  *
- * Enable ENUM_TOPOLOGY if it is available.
+ * The VIRT_CPUID2 feature allows TDX module provides fixed values
+ * eax=0x00feff01, ebx=0, ecx=0 and edx=0, meaning "cache data is returned by
+ * CPUID leaf 0x4" and "TLB data is returned by CPUID leaf 0x18" while TD
+ * guest execution of CPUID leaf 0x2, instead the kernel CPUID #VE handler
+ * returns all zeros. It is quite useful for backward compatibility.
+ *
+ * Both ENUM_TOPOLOGY and VIRT_CPUID2 are earlier than REDUCE_VE, fall back to
+ * enable them if REDUCE_VE was not successful.
  */
-static void enable_cpu_topology_enumeration(void)
+static void reduce_unnecessary_ve(void)
 {
+	u64 err = TDX_SUCCESS;
 	u64 configured;
 
 	/* Has the VMM provided a valid topology configuration? */
 	tdg_vm_rd(TDCS_TOPOLOGY_ENUM_CONFIGURED, &configured);
-	if (!configured) {
-		pr_err("VMM did not configure X2APIC_IDs properly\n");
-		return;
-	}
-
-	tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_ENUM_TOPOLOGY, TD_CTLS_ENUM_TOPOLOGY);
-}
 
-static void reduce_unnecessary_ve(void)
-{
-	u64 err = tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_REDUCE_VE, TD_CTLS_REDUCE_VE);
+	if (configured) {
+		err = tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_REDUCE_VE, TD_CTLS_REDUCE_VE);
 
-	if (err == TDX_SUCCESS)
-		return;
+		/*
+		 * Enabling REDUCE_VE includes ENUM_TOPOLOGY. Only try to
+		 * enable ENUM_TOPOLOGY if REDUCE_VE was not successful.
+		 */
+		if (err != TDX_SUCCESS)
+			tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_ENUM_TOPOLOGY, TD_CTLS_ENUM_TOPOLOGY);
+	} else
+		pr_err("VMM did not configure X2APIC_IDs properly\n");
 
 	/*
-	 * Enabling REDUCE_VE includes ENUM_TOPOLOGY. Only try to
-	 * enable ENUM_TOPOLOGY if REDUCE_VE was not successful.
+	 * Enabling REDUCE_VE includes VIRT_CPUID2. Only try to enable
+	 * VIRT_CPUID2 if REDUCE_VE was not successful.
 	 */
-	enable_cpu_topology_enumeration();
+	if (!configured || err != TDX_SUCCESS)
+		tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_VIRT_CPUID2, TD_CTLS_VIRT_CPUID2);
+
 }
 
 static void tdx_setup(u64 *cc_mask)
-- 
2.43.0

