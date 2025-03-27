Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B7F1C5D63
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105142; cv=none; b=IAOgdYLKVFuiVgA8c6t8MWkbtTds5qAFQ+035hFcoV7mIzYF3+n/ZeGobiKA+yI/+8jwxo6F6MvfwfbPScjOtNGEZFl4urUvrzPd9uuI4yZK4aIs15YWLjQC+NrBDRgdKjsTWMgCQQghM5E9DOTT5uL0Czyp4wMA3w4c0hcvb60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105142; c=relaxed/simple;
	bh=kuKRMi5M1SSbjhT4HxBTWUEUqp9MJDzOyzfDJYb7Nok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/Y4SUH24h7CkNQIBE/ExxUkoOqWX4ikUv37Rh1NtFZz/Lm8eCzVLVLpyGPGeBSBq+Xt445+YFNKmr5X0K3EkcL6vYayyxaoWC+DPPYUxhJ2w3GmI6tCNWG7EBqHDhkUTtJghEp/hnL7BlT7xsPrOT4pJTrG4M0Qimq0mpIeBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaJxtCbf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaJxtCbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743105141; x=1774641141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kuKRMi5M1SSbjhT4HxBTWUEUqp9MJDzOyzfDJYb7Nok=;
  b=BaJxtCbfHnRiBI3QPejwVpEbRCHYLA6H6cygL4gDfzTiKqWaMf4qIZmP
   YmsDLSNpPeHqzRcSNMAx1FVzR3J5dPyONZfS/UZ5mhLa1P6fvnYhv4ut9
   PjiajryfBuuUWZPHgnokvWEp3bWrY+UDeZrPVYLOtYDXGfZ9Zu8icrkiu
   5vguNg2rmu/6p6ZTU8C4PvzDMja8ERC9Cuog2x5tzrW1E/F+9qJ5MIdnh
   Q3cCpDPPyEoJngsE5kpC7KieV5OOmG9TDrKahCRUFtsK2R/8HId/omIfy
   uihWacIVKY0B9MjEPoMIHmw7/ud2s7/P1y0WF69p8uMIlHlv2S7LVyfK8
   A==;
X-CSE-ConnectionGUID: ZzyZZkGOQRGEwdBPBtp1Pw==
X-CSE-MsgGUID: LawJEaPJS8eAa9KNniV9Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48115679"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48115679"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:52:19 -0700
X-CSE-ConnectionGUID: s1PJpyKxRxCD6iY3NotpiA==
X-CSE-MsgGUID: +nOzmPq1Q4CRtuc8enXmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125207696"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 12:52:18 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	ak@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: eranian@google.com,
	thomas.falcon@intel.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH V4 4/5] perf/x86/intel: Add CPUID enumeration for the auto counter reload
Date: Thu, 27 Mar 2025 12:52:16 -0700
Message-Id: <20250327195217.2683619-5-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250327195217.2683619-1-kan.liang@linux.intel.com>
References: <20250327195217.2683619-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The counters that support the auto counter reload feature can be
enumerated in the CPUID Leaf 0x23 sub-leaf 0x2.

Add acr_cntr_mask to store the mask of counters which are reloadable.
Add acr_cause_mask to store the mask of counters which can cause reload.
Since the e-core and p-core may have different numbers of counters,
track the masks in the struct x86_hybrid_pmu as well.

Tested-by: Thomas Falcon <thomas.falcon@intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/core.c      | 10 ++++++++++
 arch/x86/events/perf_event.h      | 17 +++++++++++++++++
 arch/x86/include/asm/perf_event.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 66c42f856636..42cf474ee520 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5069,6 +5069,16 @@ static void update_pmu_cap(struct x86_hybrid_pmu *pmu)
 		pmu->fixed_cntr_mask64 = fixed_cntr;
 	}
 
+	if (eax.split.acr_subleaf) {
+		cpuid_count(ARCH_PERFMON_EXT_LEAF, ARCH_PERFMON_ACR_LEAF,
+			    &cntr, &fixed_cntr, &ecx, &edx);
+		/* The mask of the counters which can be reloaded */
+		pmu->acr_cntr_mask64 = cntr | ((u64)fixed_cntr << INTEL_PMC_IDX_FIXED);
+
+		/* The mask of the counters which can cause a reload of reloadable counters */
+		pmu->acr_cause_mask64 = ecx | ((u64)edx << INTEL_PMC_IDX_FIXED);
+	}
+
 	if (!intel_pmu_broken_perf_cap()) {
 		/* Perf Metric (Bit 15) and PEBS via PT (Bit 16) are hybrid enumeration */
 		rdmsrl(MSR_IA32_PERF_CAPABILITIES, pmu->intel_cap.capabilities);
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 84943243b05d..b68b653d3a01 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -725,6 +725,15 @@ struct x86_hybrid_pmu {
 			u64		fixed_cntr_mask64;
 			unsigned long	fixed_cntr_mask[BITS_TO_LONGS(X86_PMC_IDX_MAX)];
 	};
+
+	union {
+			u64		acr_cntr_mask64;
+			unsigned long	acr_cntr_mask[BITS_TO_LONGS(X86_PMC_IDX_MAX)];
+	};
+	union {
+			u64		acr_cause_mask64;
+			unsigned long	acr_cause_mask[BITS_TO_LONGS(X86_PMC_IDX_MAX)];
+	};
 	struct event_constraint		unconstrained;
 
 	u64				hw_cache_event_ids
@@ -823,6 +832,14 @@ struct x86_pmu {
 			u64		fixed_cntr_mask64;
 			unsigned long	fixed_cntr_mask[BITS_TO_LONGS(X86_PMC_IDX_MAX)];
 	};
+	union {
+			u64		acr_cntr_mask64;
+			unsigned long	acr_cntr_mask[BITS_TO_LONGS(X86_PMC_IDX_MAX)];
+	};
+	union {
+			u64		acr_cause_mask64;
+			unsigned long	acr_cause_mask[BITS_TO_LONGS(X86_PMC_IDX_MAX)];
+	};
 	int		cntval_bits;
 	u64		cntval_mask;
 	union {
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 812dac3f79f0..70d1d94aca7e 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -195,6 +195,7 @@ union cpuid10_edx {
  */
 #define ARCH_PERFMON_EXT_LEAF			0x00000023
 #define ARCH_PERFMON_NUM_COUNTER_LEAF		0x1
+#define ARCH_PERFMON_ACR_LEAF			0x2
 
 union cpuid35_eax {
 	struct {
-- 
2.38.1

