Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA472E7642
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967819; cv=none; b=da9vvuDVto8Bt0NGMsA9oZYKzyZzA7vPethBUPaQ62zeobHlyHxsBsbgsMDSbhsTebCYRf16iBkDkLSJ58B9M/sXKEB92s7ULIAUq6UjbA/GSg2sGp3vb4pPi3W6qJAkNkduE350dbgvC2j53G5B41n/FXv1p5g3Tfco5LZZuxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967819; c=relaxed/simple;
	bh=Hz5qfDuf2BhtpB5QYG7AvKinpyvhexWAweAF2lFE2Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tKQvX+EdQSvNpVCq7C6j/WWuSFg91/GPRVaWzCpgKO9CKBKl9xCiYrQUf5ogVlsw/5wxylSi6+LqyYnC2sx/7sL2azK2I8UCmgWDSJV4dqiU471fCUMngb0ZhIa3qjLCu2BLFaRFtOyKZS/r/OBsyUdnX5RrnKGYRAtzCafpeBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVMRRY88; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVMRRY88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967817; x=1782503817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hz5qfDuf2BhtpB5QYG7AvKinpyvhexWAweAF2lFE2Ow=;
  b=VVMRRY88btbODM1rFcNZQga45WyggHzGgCxQvtOkOmqJSMVhJeWnofKk
   TSgcg56aonJhwaA576kB86T7Bqk3rvSHW+O1pcRd/JGwE/cBdln83LgLe
   swfaVeWwvBRw5Z8+e3nefMdW0vlvg6Z9IoZt3A2DGTV/3z4gFaHzzEjHM
   AtwerHbu+a4JSoElXTqij7zj0I6jlbzdTU08YdQJrXILkB1uTuvomO756
   a56VZ/ORwKYzLUb+KEaEefkV+PPZbMjDi1tY/lgn9BUQEGK20xbd6KMl/
   Wp9VYRKzCQE4cpEq1pORqSmQeMKFBTw5bqIixeAtMyXDsvaZy23APg2Rg
   g==;
X-CSE-ConnectionGUID: +DRIVUIMSE2C5/t438J1pw==
X-CSE-MsgGUID: 3E/Im0uGSsiGMVomiyWebA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002114"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:56:57 -0700
X-CSE-ConnectionGUID: 07PW83HjRoqg37ksru7bsw==
X-CSE-MsgGUID: U6XvUvYLSLyIg+pEvn54qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902889"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:56 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	irogers@google.com,
	adrian.hunter@intel.com,
	jolsa@kernel.org,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com,
	ak@linux.intel.com,
	zide.chen@intel.com,
	mark.rutland@arm.com,
	broonie@kernel.org,
	ravi.bangoria@amd.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH V2 00/13] Support vector and more extended registers in perf
Date: Thu, 26 Jun 2025 12:55:57 -0700
Message-Id: <20250626195610.405379-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Changes since V1:
- Apply the new interfaces to configure and dump the SIMD registers
- Utilize the existing FPU functions, e.g., xstate_calculate_size,
  get_xsave_addr().

Starting from the Intel Ice Lake, the XMM registers can be collected in
a PEBS record. More registers, e.g., YMM, ZMM, OPMASK, SPP and APX, will
be added in the upcoming Architecture PEBS as well. But it requires the
hardware support.

The patch set provides a software solution to mitigate the hardware
requirement. It utilizes the XSAVES command to retrieve the requested
registers in the overflow handler. The feature isn't limited to the PEBS
event or specific platforms anymore.
The hardware solution (if available) is still preferred, since it has
low overhead (especially with the large PEBS) and is more accurate.

In theory, the solution should work for all X86 platforms. But I only
have newer Inter platforms to test. The patch set only enable the
feature for Intel Ice Lake and later platforms.

The new registers include YMM, ZMM, OPMASK, SSP, and APX.
The sample_regs_user/intr has run out. A new field in the
struct perf_event_attr is required for the registers.

After a long discussion in V1,
https://lore.kernel.org/lkml/3f1c9a9e-cb63-47ff-a5e9-06555fa6cc9a@linux.intel.com/

The new field looks like as below.
@@ -543,6 +545,25 @@ struct perf_event_attr {
        __u64   sig_data;

        __u64   config3; /* extension of config2 */
+
+
+       /*
+        * Defines set of SIMD registers to dump on samples.
+        * The sample_simd_regs_enabled !=0 implies the
+        * set of SIMD registers is used to config all SIMD registers.
+        * If !sample_simd_regs_enabled, sample_regs_XXX may be used to
+        * config some SIMD registers on X86.
+        */
+       union {
+               __u16 sample_simd_regs_enabled;
+               __u16 sample_simd_pred_reg_qwords;
+       };
+       __u32 sample_simd_pred_reg_intr;
+       __u32 sample_simd_pred_reg_user;
+       __u16 sample_simd_vec_reg_qwords;
+       __u64 sample_simd_vec_reg_intr;
+       __u64 sample_simd_vec_reg_user;
+       __u32 __reserved_4;
 };
@@ -1016,7 +1037,15 @@ enum perf_event_type {
         *      } && PERF_SAMPLE_BRANCH_STACK
         *
         *      { u64                   abi; # enum perf_sample_regs_abi
-        *        u64                   regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
+        *        u64                   regs[weight(mask)];
+        *        struct {
+        *              u16 nr_vectors;
+        *              u16 vector_qwords;
+        *              u16 nr_pred;
+        *              u16 pred_qwords;
+        *              u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+        *        } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
+        *      } && PERF_SAMPLE_REGS_USER
         *
         *      { u64                   size;
         *        char                  data[size];
@@ -1043,7 +1072,15 @@ enum perf_event_type {
         *      { u64                   data_src; } && PERF_SAMPLE_DATA_SRC
         *      { u64                   transaction; } && PERF_SAMPLE_TRANSACTION
         *      { u64                   abi; # enum perf_sample_regs_abi
-        *        u64                   regs[weight(mask)]; } && PERF_SAMPLE_REGS_INTR
+        *        u64                   regs[weight(mask)];
+        *        struct {
+        *              u16 nr_vectors;
+        *              u16 vector_qwords;
+        *              u16 nr_pred;
+        *              u16 pred_qwords;
+        *              u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+        *        } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
+        *      } && PERF_SAMPLE_REGS_INTR
         *      { u64                   phys_addr;} && PERF_SAMPLE_PHYS_ADDR
         *      { u64                   cgroup;} && PERF_SAMPLE_CGROUP
         *      { u64                   data_page_size;} && PERF_SAMPLE_DATA_PAGE_SIZE


Since there is only one vector qwords field, the qwords for the newest
vector should be set by the tools. For example, if the end user wants
XMM0 and YMM1, the vector qwords should be 4. The vector mask should be
0x3. The YMM0 and YMM1 will be dumped to the userspace. It's the tool's
responsibility to output the XMM0 and YMM1 to the end user.

I had a POC perf tool patch for testing purposes. I didn't include it in
this RFC series. I will send a complete patch set (include both kernel
and perf tool), when the interface is accepted and there is no NAK for
the solution.

Kan Liang (13):
  perf/x86: Use x86_perf_regs in the x86 nmi handler
  perf/x86: Setup the regs data
  x86/fpu/xstate: Add xsaves_nmi
  perf: Move has_extended_regs() to header file
  perf/x86: Support XMM register for non-PEBS and REGS_USER
  perf: Support SIMD registers
  perf/x86: Move XMM to sample_simd_vec_regs
  perf/x86: Add YMM into sample_simd_vec_regs
  perf/x86: Add ZMM into sample_simd_vec_regs
  perf/x86: Add OPMASK into sample_simd_pred_reg
  perf/x86: Add eGPRs into sample_regs
  perf/x86: Add SSP into sample_regs
  perf/x86/intel: Enable PERF_PMU_CAP_SIMD_REGS

 arch/x86/events/core.c                | 281 ++++++++++++++++++++++++--
 arch/x86/events/intel/core.c          |  73 ++++++-
 arch/x86/events/intel/ds.c            |  12 +-
 arch/x86/events/perf_event.h          |  32 +++
 arch/x86/include/asm/fpu/xstate.h     |   3 +
 arch/x86/include/asm/perf_event.h     |  30 ++-
 arch/x86/include/uapi/asm/perf_regs.h |  44 +++-
 arch/x86/kernel/fpu/xstate.c          |  32 ++-
 arch/x86/kernel/perf_regs.c           | 105 ++++++++--
 include/linux/perf_event.h            |  21 ++
 include/linux/perf_regs.h             |   5 +
 include/uapi/linux/perf_event.h       |  46 ++++-
 kernel/events/core.c                  |  97 ++++++++-
 13 files changed, 731 insertions(+), 50 deletions(-)

-- 
2.38.1

