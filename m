Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6F219A8D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241242; cv=none; b=jqKWqNe6+FEXeBVTpb/dvdmvPnhNU8+rHYv1P4AXaYBPMIvv1ehObiaSyndvYRGqZ2A2bAF8QKRBSTPsA9PpGFciJZ6WSNAw/Ij1k3IoFiiek6OUNGen4+/Gil6Q8agE5PPSz7L/xOVJA10xuU49bahXpZkk5SIandiTr7zOdh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241242; c=relaxed/simple;
	bh=hH3SUrwCp37OhgTu/NJHcziW87G4A6SpXgss3QBXtCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkfiLtuqg8WHH2FgMF0THVvemNw26/XJWSGHyup77Cd8eKemyefGcD1LEgrQWyYnd7/4IeUg29g4bMlXigL24nDSIKrU6coRlIM1NZR7MKcRVltQ0aX3jzcKdscOidjqCAM1pVM/K7KxVnf4LouHjUuJ9k35rdBpFMCxgd+W4ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdUhJ5uN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdUhJ5uN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241241; x=1775777241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hH3SUrwCp37OhgTu/NJHcziW87G4A6SpXgss3QBXtCc=;
  b=bdUhJ5uN3bQ7w/l7GxDeLrgXsKP8pbHONCKexp9AKIw0bZR29/CI5aAB
   aX/y6oQKhd6z0KBLUn1aYZjTWafhAPjZAcp80I3GOZEmFeEsdKQkepk+1
   Zt+E4rJJkWuCecKjXgiwU3XEIuxwRd3fStxpxhOtLcDGbp9GtkCDdmDvs
   vnQgMJkG/CJpCYDVUbdb79TjLah/033wXrsR07vZKJ61bja/Vh+Yokelg
   H8jAnByqfdtZ/gtQy7IyoS076ao2vTgZB0XujMbf8SkWXF6SrE6zPoWtH
   Aa620d530v3hYt1KgwdI+0VhjTPCq9XPTK8m7IKL9flX04C9UhWszXsIR
   w==;
X-CSE-ConnectionGUID: 1EXbobfFT0uehoP6DDhoBQ==
X-CSE-MsgGUID: vk02pv3rSQitnhtPgqDkgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224043"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:18 -0700
X-CSE-ConnectionGUID: oVQEIDjmREGQotCT/2AWqg==
X-CSE-MsgGUID: foUvzKrcQr6D0WH3AWvLkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593067"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:17 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	colinmitchell@google.com,
	chao.gao@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 1/6] x86/microcode: Introduce staging step to reduce late-loading time
Date: Wed,  9 Apr 2025 16:27:08 -0700
Message-ID: <20250409232713.4536-2-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409232713.4536-1-chang.seok.bae@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As microcode patch sizes continue to grow, late-loading latency spikes
can lead to timeouts and disruptions in running workloads. This trend of
increasing patch sizes is expected to continue, so a foundational
solution is needed to address the issue.

To mitigate the problem, a new staging feature is introduced. This option
processes most of the microcode update (excluding activation) on a
non-critical path, allowing CPUs to remain operational during the
majority of the update. By offloading work from the critical path,
staging can significantly reduces latency spikes.

Integrate staging as a preparatory step in late-loading. Introduce a new
callback for staging, which is invoked at the beginning of
load_late_stop_cpus(), before CPUs enter the rendezvous phase.

Staging follows an opportunistic model:

  *  If successful, it reduces CPU rendezvous time
  *  Even though it fails, the process falls back to the legacy path to
     finish the loading process but with potentially higher latency.

Extend struct microcode_ops to incorporate staging properties, which will
be implemented in the vendor code separately.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V2 -> V3: No change

Note:

There were discussions about whether staging success should be enforced
by a configurable option. That topic is identified as follow-up work,
separate from this series.

    https://lore.kernel.org/lkml/54308373-7867-4b76-be34-63730953f83c@intel.com/

V1 -> V2:
* Move invocation inside of load_late_stop_cpus() (Boris)
* Add more note about staging (Dave)
---
 arch/x86/kernel/cpu/microcode/core.c     | 11 +++++++++++
 arch/x86/kernel/cpu/microcode/internal.h |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..c4aff44a7ffc 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -541,6 +541,17 @@ static int load_late_stop_cpus(bool is_safe)
 		pr_err("You should switch to early loading, if possible.\n");
 	}
 
+	/*
+	 * Pre-load the microcode image into a staging device. This
+	 * process is preemptible and does not require stopping CPUs.
+	 * Successful staging simplifies the subsequent late-loading
+	 * process, reducing rendezvous time.
+	 *
+	 * Even if the transfer fails, the update will proceed as usual.
+	 */
+	if (microcode_ops->use_staging)
+		microcode_ops->stage_microcode();
+
 	atomic_set(&late_cpus_in, num_online_cpus());
 	atomic_set(&offline_in_nmi, 0);
 	loops_per_usec = loops_per_jiffy / (TICK_NSEC / 1000);
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 5df621752fef..4b983b4cddbd 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -31,10 +31,12 @@ struct microcode_ops {
 	 * See also the "Synchronization" section in microcode_core.c.
 	 */
 	enum ucode_state	(*apply_microcode)(int cpu);
+	void			(*stage_microcode)(void);
 	int			(*collect_cpu_info)(int cpu, struct cpu_signature *csig);
 	void			(*finalize_late_load)(int result);
 	unsigned int		nmi_safe	: 1,
-				use_nmi		: 1;
+				use_nmi		: 1,
+				use_staging	: 1;
 };
 
 struct early_load_data {
-- 
2.45.2

