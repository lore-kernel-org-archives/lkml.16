Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DD17BEBF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095363; cv=none; b=KYZE0epVjWnwjNXbKmblQR1TAAYP41OgAXRQmCMObnpxQmFGY6w1XQdRsKcSDU5B1jbk1Anm3rFiL93qlmds8sHx0Z0NMHfQh8yZDgCEiW/q1n9SkYjftyakoCvfPqCVnKpKOvruBx3ZAJb0Evp4X8PUNKB9rGOaHmplt+seyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095363; c=relaxed/simple;
	bh=q7ise6KOJzyBAl4GEgPgsl/5TL/Uz2OIZcoOm0xA+64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uz5F/M7Ff2zTRuT+SPe96QFtCC/cZ4DQz9LVsn62fw8dF6ZGFNlO2HdZxphr7MCLYFmy+X5w2UK6HEksgFnA8bL1DM9K1KsXHUZaei6h6H+pFvJ5FEE+uPfgpPX21QlU/BhOizVut8a4RFt9Fe04eJOsTB9N1IP0Hpx+9wnLDDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUnj60kR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUnj60kR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6C8C4CEEA;
	Mon, 16 Jun 2025 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095363;
	bh=q7ise6KOJzyBAl4GEgPgsl/5TL/Uz2OIZcoOm0xA+64=;
	h=Date:From:To:Cc:Subject:From;
	b=tUnj60kRcGP61jyVAlSYTv9rWI3kD+UEIcroFfwmRWCfmaMuQQ0Mufc57L/rQOvY4
	 kNQJ51LmLVbEpIfSzpCYALaZmsQVoijXjSfLlrihj4LL0Dg/50aK7XDbmPtBT3qJjI
	 Jxfma7D90EezufASMl6V+utzB/GzdfCfHwS2GZ+ruD+FLPkV/Cpmo0cbbxzCX5PB7N
	 Bqwles82HCtIGGMdS86yNLMXiaZKK6VJsKI0YxVuQoq8gNZ9saJPIa8xLX+XHkg1s4
	 GxcggTAPSjS8ZkxG8+qY92K4dxLK4L+a2f+4sF6huym0IvUeH01XIfd0YJdxDfPKxH
	 TCdSjoQGp9TrQ==
Date: Mon, 16 Jun 2025 14:36:00 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Kishon Vijay Abraham I <kvijayab@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 1/1 fyi] tools headers x86 cpufeatures: Sync with the kernel
 sources
Message-ID: <aFBWAI3kHYX5aL9G@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

To pick the changes from:

  faad6645e1128ec2 ("x86/cpufeatures: Add CPUID feature bit for the Bus Lock Threshold")
  159013a7ca18c271 ("x86/its: Enumerate Indirect Target Selection (ITS) bug")
  f9f27c4a377a8b45 ("x86/cpufeatures: Add "Allowed SEV Features" Feature")
  b02dc185ee86836c ("x86/cpufeatures: Add X86_FEATURE_APX")
  d88bb2ded2efdc38 ("KVM: x86: Advertise support for AMD's PREFETCHI")

This causes these perf files to be rebuilt and brings some X86_FEATURE
that may be used by:

      CC       /tmp/build/perf/bench/mem-memcpy-x86-64-asm.o
      CC       /tmp/build/perf/bench/mem-memset-x86-64-asm.o

And addresses this perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h

Please see tools/include/uapi/README for further details.

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: Chang S. Bae <chang.seok.bae@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Kishon Vijay Abraham I <kvijayab@amd.com>
Cc: Manali Shukla <manali.shukla@amd.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/include/asm/cpufeatures.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
index e02be2962a0181ec..ee176236c2be9908 100644
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@ -336,7 +336,7 @@
 #define X86_FEATURE_AMD_IBRS		(13*32+14) /* Indirect Branch Restricted Speculation */
 #define X86_FEATURE_AMD_STIBP		(13*32+15) /* Single Thread Indirect Branch Predictors */
 #define X86_FEATURE_AMD_STIBP_ALWAYS_ON	(13*32+17) /* Single Thread Indirect Branch Predictors always-on preferred */
-#define X86_FEATURE_AMD_IBRS_SAME_MODE (13*32+19) /* Indirect Branch Restricted Speculation same mode protection*/
+#define X86_FEATURE_AMD_IBRS_SAME_MODE	(13*32+19) /* Indirect Branch Restricted Speculation same mode protection*/
 #define X86_FEATURE_AMD_PPIN		(13*32+23) /* "amd_ppin" Protected Processor Inventory Number */
 #define X86_FEATURE_AMD_SSBD		(13*32+24) /* Speculative Store Bypass Disable */
 #define X86_FEATURE_VIRT_SSBD		(13*32+25) /* "virt_ssbd" Virtualized Speculative Store Bypass Disable */
@@ -379,6 +379,7 @@
 #define X86_FEATURE_V_SPEC_CTRL		(15*32+20) /* "v_spec_ctrl" Virtual SPEC_CTRL */
 #define X86_FEATURE_VNMI		(15*32+25) /* "vnmi" Virtual NMI */
 #define X86_FEATURE_SVME_ADDR_CHK	(15*32+28) /* SVME addr check */
+#define X86_FEATURE_BUS_LOCK_THRESHOLD	(15*32+29) /* Bus lock threshold */
 #define X86_FEATURE_IDLE_HLT		(15*32+30) /* IDLE HLT intercept */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (ECX), word 16 */
@@ -447,6 +448,7 @@
 #define X86_FEATURE_DEBUG_SWAP		(19*32+14) /* "debug_swap" SEV-ES full debug state swap support */
 #define X86_FEATURE_RMPREAD		(19*32+21) /* RMPREAD instruction */
 #define X86_FEATURE_SEGMENTED_RMP	(19*32+23) /* Segmented RMP support */
+#define X86_FEATURE_ALLOWED_SEV_FEATURES (19*32+27) /* Allowed SEV Features */
 #define X86_FEATURE_SVSM		(19*32+28) /* "svsm" SVSM present */
 #define X86_FEATURE_HV_INUSE_WR_ALLOWED	(19*32+30) /* Allow Write to in-use hypervisor-owned pages */
 
@@ -458,6 +460,7 @@
 #define X86_FEATURE_AUTOIBRS		(20*32+ 8) /* Automatic IBRS */
 #define X86_FEATURE_NO_SMM_CTL_MSR	(20*32+ 9) /* SMM_CTL MSR is not present */
 
+#define X86_FEATURE_PREFETCHI		(20*32+20) /* Prefetch Data/Instruction to Cache Level */
 #define X86_FEATURE_SBPB		(20*32+27) /* Selective Branch Prediction Barrier */
 #define X86_FEATURE_IBPB_BRTYPE		(20*32+28) /* MSR_PRED_CMD[IBPB] flushes all branch type predictions */
 #define X86_FEATURE_SRSO_NO		(20*32+29) /* CPU is not affected by SRSO */
@@ -482,7 +485,8 @@
 #define X86_FEATURE_AMD_HTR_CORES	(21*32+ 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
-#define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+ 9) /* Use thunk for indirect branches in lower half of cacheline */
+#define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
+#define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
 
 /*
  * BUG word(s)
@@ -535,6 +539,8 @@
 #define X86_BUG_BHI			X86_BUG( 1*32+ 3) /* "bhi" CPU is affected by Branch History Injection */
 #define X86_BUG_IBPB_NO_RET		X86_BUG( 1*32+ 4) /* "ibpb_no_ret" IBPB omits return target predictions */
 #define X86_BUG_SPECTRE_V2_USER		X86_BUG( 1*32+ 5) /* "spectre_v2_user" CPU is affected by Spectre variant 2 attack between user processes */
-#define X86_BUG_ITS			X86_BUG( 1*32+ 6) /* "its" CPU is affected by Indirect Target Selection */
-#define X86_BUG_ITS_NATIVE_ONLY		X86_BUG( 1*32+ 7) /* "its_native_only" CPU is affected by ITS, VMX is not affected */
+#define X86_BUG_OLD_MICROCODE		X86_BUG( 1*32+ 6) /* "old_microcode" CPU has old microcode, it is surely vulnerable to something */
+#define X86_BUG_ITS			X86_BUG( 1*32+ 7) /* "its" CPU is affected by Indirect Target Selection */
+#define X86_BUG_ITS_NATIVE_ONLY		X86_BUG( 1*32+ 8) /* "its_native_only" CPU is affected by ITS, VMX is not affected */
+
 #endif /* _ASM_X86_CPUFEATURES_H */
-- 
2.49.0

