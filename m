Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BA1C7018
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105143; cv=none; b=TFg0znFJzqI41enslZVwW+tvGd0lXqscVZB+/awLSaP9XrhC/PLNlh+vrJ3K7SmjVZd0EX1/BhoY7jX7CLXpypIgZqleXZt3eumJXmdNbHK0aY2d2YbA1mutZp5K8jeY6hDW2fYHCRNTnuNUOiVL22Imzk2eOrRL1aVYY1Fn6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105143; c=relaxed/simple;
	bh=hTEcAgFyabQdDOMvXUf1ra7M0I32RQuujqQop3hQj8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AI4VXHM0ZNOtic2cNvLZ0damQ1OI2wxA+B4ehd2kgZxmTSsIfhn3PBBMN4o90O4FmHS64OvJbSadIIODv9DtJRMJf4QBNUGr+h8X7k8wjDim1aEJjpVRopuXqySOcY0Lae63z+CY1mTl6XV9lIOiPGBajjRaRS95U9Sf52wwKVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imqEb3S2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imqEb3S2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743105142; x=1774641142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hTEcAgFyabQdDOMvXUf1ra7M0I32RQuujqQop3hQj8E=;
  b=imqEb3S21cWvov1heHcO1YrxOFfaAdXzTSAmdiTOwWS+EYrSmRFyD9mt
   WgqkY/69n0e5W58kMZqoN5RKlgF0BDHjy0kQKCPPIt8lWn+HiAMeiypWO
   x2iDzq7ZzVdR0Omg/YroCn+OWpmzzjetf7WofmDp/akUaIEP1gNEwBcyH
   WTKwUqrvF0RliR8bsQm69CT5DwH8gdBbNix+F7/kvA5//yZoBEMT5iRx+
   dxSiA2tcghUHDApbOtDRLDdaa3wz97BTNqqnbfHH1v4N8gyJ6oEbxRmTJ
   JdyJIB5nSzkZ+kjBUJTrRxnXgjtvxcAL8RaM6aehgbt5xVvxkR+7W7kEM
   A==;
X-CSE-ConnectionGUID: wX+Gp4UIRvW4oVBWRsP9Ww==
X-CSE-MsgGUID: 7wQRXqOYT4iLPo4v53mCsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48115673"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48115673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:52:18 -0700
X-CSE-ConnectionGUID: RojT5B91QWyeDEZl5Wby3g==
X-CSE-MsgGUID: XTOR6rydQLeoz78q4ArLQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125207692"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 12:52:17 -0700
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
Subject: [PATCH V4 3/5] perf: Extend the bit width of the arch-specific flag
Date: Thu, 27 Mar 2025 12:52:15 -0700
Message-Id: <20250327195217.2683619-4-kan.liang@linux.intel.com>
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

The auto counter reload feature requires an event flag to indicate an
auto counter reload group, which can only be scheduled on specific
counters that enumerated in CPUID. However, the hw_perf_event.flags has
run out on X86.

Two solutions were considered to address the issue.
- Currently, 20 bits are reserved for the architecture-specific flags.
  Only the bit 31 is used for the generic flag. There is still plenty
  of space left. Reserve 8 more bits for the arch-specific flags.
- Add a new X86 specific hw_perf_event.flags1 to support more flags.

The former is implemented. Enough room is still left in the global
generic flag.

Tested-by: Thomas Falcon <thomas.falcon@intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/perf_event_flags.h | 41 +++++++++++++++---------------
 include/linux/perf_event.h         |  2 +-
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/x86/events/perf_event_flags.h b/arch/x86/events/perf_event_flags.h
index 1d9e385649b5..70078334e4a3 100644
--- a/arch/x86/events/perf_event_flags.h
+++ b/arch/x86/events/perf_event_flags.h
@@ -2,23 +2,24 @@
 /*
  * struct hw_perf_event.flags flags
  */
-PERF_ARCH(PEBS_LDLAT,		0x00001) /* ld+ldlat data address sampling */
-PERF_ARCH(PEBS_ST,		0x00002) /* st data address sampling */
-PERF_ARCH(PEBS_ST_HSW,		0x00004) /* haswell style datala, store */
-PERF_ARCH(PEBS_LD_HSW,		0x00008) /* haswell style datala, load */
-PERF_ARCH(PEBS_NA_HSW,		0x00010) /* haswell style datala, unknown */
-PERF_ARCH(EXCL,			0x00020) /* HT exclusivity on counter */
-PERF_ARCH(DYNAMIC,		0x00040) /* dynamic alloc'd constraint */
-PERF_ARCH(PEBS_CNTR,		0x00080) /* PEBS counters snapshot */
-PERF_ARCH(EXCL_ACCT,		0x00100) /* accounted EXCL event */
-PERF_ARCH(AUTO_RELOAD,		0x00200) /* use PEBS auto-reload */
-PERF_ARCH(LARGE_PEBS,		0x00400) /* use large PEBS */
-PERF_ARCH(PEBS_VIA_PT,		0x00800) /* use PT buffer for PEBS */
-PERF_ARCH(PAIR,			0x01000) /* Large Increment per Cycle */
-PERF_ARCH(LBR_SELECT,		0x02000) /* Save/Restore MSR_LBR_SELECT */
-PERF_ARCH(TOPDOWN,		0x04000) /* Count Topdown slots/metrics events */
-PERF_ARCH(PEBS_STLAT,		0x08000) /* st+stlat data address sampling */
-PERF_ARCH(AMD_BRS,		0x10000) /* AMD Branch Sampling */
-PERF_ARCH(PEBS_LAT_HYBRID,	0x20000) /* ld and st lat for hybrid */
-PERF_ARCH(NEEDS_BRANCH_STACK,	0x40000) /* require branch stack setup */
-PERF_ARCH(BRANCH_COUNTERS,	0x80000) /* logs the counters in the extra space of each branch */
+PERF_ARCH(PEBS_LDLAT,		0x0000001) /* ld+ldlat data address sampling */
+PERF_ARCH(PEBS_ST,		0x0000002) /* st data address sampling */
+PERF_ARCH(PEBS_ST_HSW,		0x0000004) /* haswell style datala, store */
+PERF_ARCH(PEBS_LD_HSW,		0x0000008) /* haswell style datala, load */
+PERF_ARCH(PEBS_NA_HSW,		0x0000010) /* haswell style datala, unknown */
+PERF_ARCH(EXCL,			0x0000020) /* HT exclusivity on counter */
+PERF_ARCH(DYNAMIC,		0x0000040) /* dynamic alloc'd constraint */
+PERF_ARCH(PEBS_CNTR,		0x0000080) /* PEBS counters snapshot */
+PERF_ARCH(EXCL_ACCT,		0x0000100) /* accounted EXCL event */
+PERF_ARCH(AUTO_RELOAD,		0x0000200) /* use PEBS auto-reload */
+PERF_ARCH(LARGE_PEBS,		0x0000400) /* use large PEBS */
+PERF_ARCH(PEBS_VIA_PT,		0x0000800) /* use PT buffer for PEBS */
+PERF_ARCH(PAIR,			0x0001000) /* Large Increment per Cycle */
+PERF_ARCH(LBR_SELECT,		0x0002000) /* Save/Restore MSR_LBR_SELECT */
+PERF_ARCH(TOPDOWN,		0x0004000) /* Count Topdown slots/metrics events */
+PERF_ARCH(PEBS_STLAT,		0x0008000) /* st+stlat data address sampling */
+PERF_ARCH(AMD_BRS,		0x0010000) /* AMD Branch Sampling */
+PERF_ARCH(PEBS_LAT_HYBRID,	0x0020000) /* ld and st lat for hybrid */
+PERF_ARCH(NEEDS_BRANCH_STACK,	0x0040000) /* require branch stack setup */
+PERF_ARCH(BRANCH_COUNTERS,	0x0080000) /* logs the counters in the extra space of each branch */
+PERF_ARCH(ACR,			0x0100000) /* Auto counter reload */
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 2fa0cd6772f1..aaffe31b78da 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -144,7 +144,7 @@ struct hw_perf_event_extra {
  * PERF_EVENT_FLAG_ARCH bits are reserved for architecture-specific
  * usage.
  */
-#define PERF_EVENT_FLAG_ARCH			0x000fffff
+#define PERF_EVENT_FLAG_ARCH			0x0fffffff
 #define PERF_EVENT_FLAG_USER_READ_CNT		0x80000000
 
 static_assert((PERF_EVENT_FLAG_USER_READ_CNT & PERF_EVENT_FLAG_ARCH) == 0);
-- 
2.38.1

