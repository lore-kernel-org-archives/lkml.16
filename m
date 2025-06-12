Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42EA1531E3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762134; cv=none; b=CRDrdVWJVJcjdKVn8s45s2T/PA2VRJQem7VgT9Ge8QOEflQUvW25Yr6CRj5djzi6u2I7+p/19icZan/yoCn3ids+gN2E9pnesuwVHcNhTsFgXhxweHNr0BYOSzYDMwLc88Cz7GIJ8n+NuscnmWNQ/ZBocoBM/2ZryVoi2DZbk68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762134; c=relaxed/simple;
	bh=X8PI2xesg0dfchr5HTiNbziALoHIeFE7KHjgiyrd2g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSwBRiRGDyR0HeD71Pxk5M8wJMHzTJ7fRkpcmmWtTyE9x0IPZ0rSlXNN2M52Y7JuD9L/PAX3r5yoGanGzNj1/qd9EkrlBNj/W5NWQz9CezU2avV0W6DqUqNSUCf6BAbSon5KTh2wqaRQKcEUv2eWeqWXBNRMIo7ZzLQQOCbN74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dl8No3jE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dl8No3jE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0E6C4CEEA;
	Thu, 12 Jun 2025 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762133;
	bh=X8PI2xesg0dfchr5HTiNbziALoHIeFE7KHjgiyrd2g4=;
	h=Date:From:To:Cc:Subject:From;
	b=dl8No3jErBzSgMd2d38Tdu5H4Z5OqpX69TUWagyV8BlqbJpMOD4/4b+9pEkm4OOoQ
	 M7sMGsL7GqXiJzqAXyqiCvJVzdDY7kQElL9NfFGyw+1zUCIxLA5UgDBWDI1vazrEi9
	 JXyk6uxrh9pJgBDkC2lqUeDYIcMSlCqnIMarfIb0YKlYfHC0lqQpJOc4XxUef+eM15
	 AGo8145lrFAkRRsGOn5KB1JO8KZrRS63WMw6+9QcuNV3fpXnJQTd1L1z8Mys13SIzb
	 MIEbIgg0NwUyD0+m0oZb8tfU6EwYCbc7uv1tNBCl9cH+d/QLoxcBof8yMPXHjM9eBz
	 8VGbPwZkkggPQ==
Date: Thu, 12 Jun 2025 18:02:10 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 1/1 fyi] tools arch x86: Sync the msr-index.h copy with the
 kernel sources
Message-ID: <aEtAUg83OQGx8Kay@x1>
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

To pick up the changes from these csets:

  159013a7ca18c271 ("x86/its: Enumerate Indirect Target Selection (ITS) bug")
  f4138de5e41fae1a ("x86/msr: Standardize on u64 in <asm/msr-index.h>")
  ec980e4facef8110 ("perf/x86/intel: Support auto counter reload")

That cause no changes to tooling as it doesn't include a new MSR to be
captured by the tools/perf/trace/beauty/tracepoints/x86_msr.sh script.

Just silences this perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/include/asm/msr-index.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index e7d2f460fcc699e4..b7dded3c811328fa 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -533,7 +533,7 @@
 #define MSR_HWP_CAPABILITIES		0x00000771
 #define MSR_HWP_REQUEST_PKG		0x00000772
 #define MSR_HWP_INTERRUPT		0x00000773
-#define MSR_HWP_REQUEST 		0x00000774
+#define MSR_HWP_REQUEST			0x00000774
 #define MSR_HWP_STATUS			0x00000777
 
 /* CPUID.6.EAX */
@@ -550,16 +550,16 @@
 #define HWP_LOWEST_PERF(x)		(((x) >> 24) & 0xff)
 
 /* IA32_HWP_REQUEST */
-#define HWP_MIN_PERF(x) 		(x & 0xff)
-#define HWP_MAX_PERF(x) 		((x & 0xff) << 8)
+#define HWP_MIN_PERF(x)			(x & 0xff)
+#define HWP_MAX_PERF(x)			((x & 0xff) << 8)
 #define HWP_DESIRED_PERF(x)		((x & 0xff) << 16)
-#define HWP_ENERGY_PERF_PREFERENCE(x)	(((unsigned long long) x & 0xff) << 24)
+#define HWP_ENERGY_PERF_PREFERENCE(x)	(((u64)x & 0xff) << 24)
 #define HWP_EPP_PERFORMANCE		0x00
 #define HWP_EPP_BALANCE_PERFORMANCE	0x80
 #define HWP_EPP_BALANCE_POWERSAVE	0xC0
 #define HWP_EPP_POWERSAVE		0xFF
-#define HWP_ACTIVITY_WINDOW(x)		((unsigned long long)(x & 0xff3) << 32)
-#define HWP_PACKAGE_CONTROL(x)		((unsigned long long)(x & 0x1) << 42)
+#define HWP_ACTIVITY_WINDOW(x)		((u64)(x & 0xff3) << 32)
+#define HWP_PACKAGE_CONTROL(x)		((u64)(x & 0x1) << 42)
 
 /* IA32_HWP_STATUS */
 #define HWP_GUARANTEED_CHANGE(x)	(x & 0x1)
@@ -602,7 +602,11 @@
 /* V6 PMON MSR range */
 #define MSR_IA32_PMC_V6_GP0_CTR		0x1900
 #define MSR_IA32_PMC_V6_GP0_CFG_A	0x1901
+#define MSR_IA32_PMC_V6_GP0_CFG_B	0x1902
+#define MSR_IA32_PMC_V6_GP0_CFG_C	0x1903
 #define MSR_IA32_PMC_V6_FX0_CTR		0x1980
+#define MSR_IA32_PMC_V6_FX0_CFG_B	0x1982
+#define MSR_IA32_PMC_V6_FX0_CFG_C	0x1983
 #define MSR_IA32_PMC_V6_STEP		4
 
 /* KeyID partitioning between MKTME and TDX */
-- 
2.49.0

