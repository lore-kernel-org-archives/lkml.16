Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFFD101FF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060625; cv=none; b=gxce4R4hrEn5FLMbwkQnKCbLqrzWQhNvdikIMqHlJstYyUFNpys74OY0jJvohTLQpRSk87mPQqGuufFz53lErcvKFrfzGooh9OHUeGWInk60W56Cr56DBSw+hJr0dwaFB+Nu6+26m9Cwk2i4rvi7gfVZDO2an6K6JwCp5McweGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060625; c=relaxed/simple;
	bh=+M677mgd/sSsdVkhH54Lqj1MBC357vHJ5VTrVt2r70o=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gOHnUuG2umdymAflHDW2/+S4X6ssvsz+dJ48BTzfENF9+zWMbPql9gf7ORSNJaVU9iUc3UZQwMPjJpR5s/oI3IYD1498k/yIzwOKhmISBr93o8ATdCEeDsgiJ3GySgr9SWdqf+B6knC6NBqQ3rdeCt/L3CLWIyQVxZTS/M5gD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bLMjQ39Hlz1d1gq;
	Mon, 16 Jun 2025 15:54:50 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 36B5F1402F3;
	Mon, 16 Jun 2025 15:56:59 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 15:56:59 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 15:56:58 +0800
CC: Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>, Will Deacon
	<will@kernel.org>, James Morse <james.morse@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Jinqian Yang <yangjinqian1@huawei.com>, "Douglas
 Anderson" <dianders@chromium.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, "Ian
 Rogers" <irogers@google.com>, James Clark <james.clark@linaro.org>, Jiri Olsa
	<jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Namhyung Kim
	<namhyung@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, Yicong Yang
	<yangyicong@hisilicon.com>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <aEyGg98z-MkcClXY@x1>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
Date: Mon, 16 Jun 2025 15:56:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aEyGg98z-MkcClXY@x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)

+ linux-arm-kernel

On 2025/6/14 4:13, Arnaldo Carvalho de Melo wrote:
> Hi,
> 
> tools/perf (and other tools/ living code) uses a file from the kernel, a
> copy, so that we don't break its build when something changes in the
> kernel that tooling uses.
> 
> There is this tools/perf/check-headers.sh that does the "copy coherency
> check", while trying to act on such a warning I stumbled on the report
> below.
> 
> More details at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README
> 
> 
> If you could please take a look at this that would be great, the initial
> copy was made at:
> 
> commit 1314376d495f2d79cc58753ff3034ccc503c43c9
> Author: Ali Saidi <alisaidi@amazon.com>
> Date:   Thu Mar 24 18:33:20 2022 +0000
> 
>     tools arm64: Import cputype.h
>     
>     Bring-in the kernel's arch/arm64/include/asm/cputype.h into tools/
>     for arm64 to make use of all the core-type definitions in perf.
>     
>     Replace sysreg.h with the version already imported into tools/.
>     
>     Committer notes:
>     
>     Added an entry to tools/perf/check-headers.sh, so that we get notified
>     when the original file in the kernel sources gets modified.
>     
>     Tester notes:
>     
>     LGTM. I did the testing on both my x86 and Arm64 platforms, thanks for
>     the fixing up.
>     
>     Signed-off-by: Ali Saidi <alisaidi@amazon.com>
>     Tested-by: Leo Yan <leo.yan@linaro.org>
> 
> - Arnaldo
> 
> ⬢ [acme@toolbx perf-tools]$ m
> rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
> make: Entering directory '/home/acme/git/perf-tools/tools/perf'
>   BUILD:   Doing 'make -j32' parallel build
> Warning: Kernel ABI header differences:
>   diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
>   diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
> 
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                                 libperl: [ on  ]
> ...                               libpython: [ on  ]
> ...                               libcrypto: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                               get_cpuid: [ on  ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
> 
>   INSTALL libsubcmd_headers
>   INSTALL libperf_headers
>   INSTALL libapi_headers
>   INSTALL libsymbol_headers
>   INSTALL libbpf_headers
>   INSTALL binaries
>   INSTALL tests
>   INSTALL libperf-jvmti.so
>   INSTALL libexec
>   INSTALL perf-archive
>   INSTALL perf-iostat
>   INSTALL perl-scripts
>   INSTALL python-scripts
>   INSTALL dlfilters
>   INSTALL perf_completion-script
>   INSTALL perf-tip
> make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
>  18: 'import perf' in python                                         : Ok
> ⬢ [acme@toolbx perf-tools]$ cp arch/arm64/include/asm/cputype.h tools/arch/arm64/include/asm/cputype.h
> ⬢ [acme@toolbx perf-tools]$ m
> rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
> make: Entering directory '/home/acme/git/perf-tools/tools/perf'
>   BUILD:   Doing 'make -j32' parallel build
> Warning: Kernel ABI header differences:
>   diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
> 
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                                 libperl: [ on  ]
> ...                               libpython: [ on  ]
> ...                               libcrypto: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                               get_cpuid: [ on  ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
> 
>   INSTALL libsubcmd_headers
>   INSTALL libperf_headers
>   INSTALL libapi_headers
>   INSTALL libsymbol_headers
>   INSTALL libbpf_headers
>   CC      /tmp/build/perf-tools/util/arm-spe.o
> util/arm-spe.c: In function ‘arm_spe__synth_ds’:
> util/arm-spe.c:885:43: error: passing argument 1 of ‘is_midr_in_range_list’ makes pointer from integer without a cast [-Wint-conversion]
>   885 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
>       |                                           ^~~~
>       |                                           |
>       |                                           u64 {aka long unsigned int}
> In file included from util/arm-spe.c:37:
> util/../../arch/arm64/include/asm/cputype.h:306:53: note: expected ‘const struct midr_range *’ but argument is of type ‘u64’ {aka ‘long unsigned int’}
>   306 | bool is_midr_in_range_list(struct midr_range const *ranges);
>       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
> util/arm-spe.c:885:21: error: too many arguments to function ‘is_midr_in_range_list’; expected 1, have 2
>   885 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
>       |                     ^~~~~~~~~~~~~~~~~~~~~       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> util/../../arch/arm64/include/asm/cputype.h:306:6: note: declared here
>   306 | bool is_midr_in_range_list(struct midr_range const *ranges);
>       |      ^~~~~~~~~~~~~~~~~~~~~
> make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:85: /tmp/build/perf-tools/util/arm-spe.o] Error 1
> make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:142: util] Error 2
> make[2]: *** [Makefile.perf:798: /tmp/build/perf-tools/perf-util-in.o] Error 2
> make[1]: *** [Makefile.perf:290: sub-make] Error 2
> make: *** [Makefile:119: install-bin] Error 2
> make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
> ⬢ [acme@toolbx perf-tools]$ 
> 
> 

The changes should be introduced by arm64's errata management on live migration[1], specifically:
- commit e3121298c7fc ("arm64: Modify _midr_range() functions to read MIDR/REVIDR internally")
  which changed the implementation of is_midr_in_range() that the MIDR to
  test is always read on the current CPU. This isn't true in perf since
  the MIDR is acquired from the perf.data.
- commit c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported function")
  which moves the implementation out of the header file.

Below patch should keep the copy coherency of cputype.h to implement the _midr_in_range_list()
as before.

[1] https://lore.kernel.org/all/20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com/

Thanks.

From 44900e7d3d9fa34c817396275f55a2aab611cd32 Mon Sep 17 00:00:00 2001
From: Yicong Yang <yangyicong@hisilicon.com>
Date: Mon, 16 Jun 2025 15:18:11 +0800
Subject: [PATCH] arm64: cputype: Allow copy coherency on cputype.h between
 tools/ and arch/
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

arch/arm64/include/asm/cputype.h is copied from arch/arm64 and used
by perf to parsing vendor specific SPE packets according to the MIDR.
The header diverge after errata management handling for VM live
migration merged [1]:
- commit e3121298c7fc ("arm64: Modify _midr_range() functions to read MIDR/REVIDR internally")
  which changed the implementation of is_midr_in_range() that the MIDR to
  test is always read on the current CPU. This isn't true in perf since
  the MIDR is acquired from the perf.data.
- commit c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported function")
  which moves the implementation out of the header file.

In order to allow copy coherency on cputype.h [2], implement
is_midr_in_range_list() as before [1]. Introduce is_cpuid_in_range_list()
for kernel space to test the MIDR of current running CPU is within the
target MIDR ranges. Move cpu_errata_set_target_impl() and
is_cpuid_in_range_list() to cpufeature.h since they're only used by
errata management in the kernel space and don't needed by tools/.

No funtional changes intended.

[1] https://lore.kernel.org/all/20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com/
[2] https://lore.kernel.org/lkml/aEyGg98z-MkcClXY@x1/#t
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/include/asm/cpufeature.h           | 11 +++++
 arch/arm64/include/asm/cputype.h              | 40 +++++++++++--------
 arch/arm64/kernel/cpu_errata.c                | 30 +++++---------
 arch/arm64/kernel/cpufeature.c                |  6 +--
 arch/arm64/kernel/proton-pack.c               | 20 +++++-----
 arch/arm64/kvm/vgic/vgic-v3.c                 |  2 +-
 drivers/clocksource/arm_arch_timer.c          |  2 +-
 .../coresight/coresight-etm4x-core.c          |  2 +-
 8 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index c4326f1cb917..ba2d474fb393 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -1048,6 +1048,17 @@ static inline bool cpu_has_lpa2(void)
 #endif
 }

+struct target_impl_cpu {
+	u64 midr;
+	u64 revidr;
+	u64 aidr;
+};
+
+bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
+
+/* Different from is_midr_in_range() on using the MIDR of current CPU */
+bool is_cpuid_in_range_list(struct midr_range const *ranges);
+
 #endif /* __ASSEMBLY__ */

 #endif
diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 661735616787..89fd197e2f03 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -251,16 +251,6 @@

 #define read_cpuid(reg)			read_sysreg_s(SYS_ ## reg)

-/*
- * The CPU ID never changes at run time, so we might as well tell the
- * compiler that it's constant.  Use this function to read the CPU ID
- * rather than directly reading processor_id or read_cpuid() directly.
- */
-static inline u32 __attribute_const__ read_cpuid_id(void)
-{
-	return read_cpuid(MIDR_EL1);
-}
-
 /*
  * Represent a range of MIDR values for a given CPU model and a
  * range of variant/revision values.
@@ -296,14 +286,30 @@ static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
 	return _model == model && rv >= rv_min && rv <= rv_max;
 }

-struct target_impl_cpu {
-	u64 midr;
-	u64 revidr;
-	u64 aidr;
-};
+static inline bool is_midr_in_range(u32 midr, struct midr_range const *range)
+{
+	return midr_is_cpu_model_range(midr, range->model,
+				       range->rv_min, range->rv_max);
+}

-bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
-bool is_midr_in_range_list(struct midr_range const *ranges);
+static inline bool
+is_midr_in_range_list(u32 midr, struct midr_range const *ranges)
+{
+	while (ranges->model)
+		if (is_midr_in_range(midr, ranges++))
+			return true;
+	return false;
+}
+
+/*
+ * The CPU ID never changes at run time, so we might as well tell the
+ * compiler that it's constant.  Use this function to read the CPU ID
+ * rather than directly reading processor_id or read_cpuid() directly.
+ */
+static inline u32 __attribute_const__ read_cpuid_id(void)
+{
+	return read_cpuid(MIDR_EL1);
+}

 static inline u64 __attribute_const__ read_cpuid_mpidr(void)
 {
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f..531ae67c7086 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -27,38 +27,28 @@ bool cpu_errata_set_target_impl(u64 num, void *impl_cpus)
 	return true;
 }

-static inline bool is_midr_in_range(struct midr_range const *range)
+bool is_cpuid_in_range_list(struct midr_range const *ranges)
 {
+	u32 midr = read_cpuid_id();
 	int i;

 	if (!target_impl_cpu_num)
-		return midr_is_cpu_model_range(read_cpuid_id(), range->model,
-					       range->rv_min, range->rv_max);
+		return is_midr_in_range_list(midr, ranges);

-	for (i = 0; i < target_impl_cpu_num; i++) {
-		if (midr_is_cpu_model_range(target_impl_cpus[i].midr,
-					    range->model,
-					    range->rv_min, range->rv_max))
+	for (i = 0; i < target_impl_cpu_num; i++)
+		if (is_midr_in_range_list(midr, ranges))
 			return true;
-	}
-	return false;
-}

-bool is_midr_in_range_list(struct midr_range const *ranges)
-{
-	while (ranges->model)
-		if (is_midr_in_range(ranges++))
-			return true;
 	return false;
 }
-EXPORT_SYMBOL_GPL(is_midr_in_range_list);
+EXPORT_SYMBOL_GPL(is_cpuid_in_range_list);

 static bool __maybe_unused
 __is_affected_midr_range(const struct arm64_cpu_capabilities *entry,
 			 u32 midr, u32 revidr)
 {
 	const struct arm64_midr_revidr *fix;
-	if (!is_midr_in_range(&entry->midr_range))
+	if (!is_midr_in_range(midr, &entry->midr_range))
 		return false;

 	midr &= MIDR_REVISION_MASK | MIDR_VARIANT_MASK;
@@ -92,7 +82,7 @@ is_affected_midr_range_list(const struct arm64_cpu_capabilities *entry,
 			    int scope)
 {
 	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
-	return is_midr_in_range_list(entry->midr_range_list);
+	return is_cpuid_in_range_list(entry->midr_range_list);
 }

 static bool __maybe_unused
@@ -244,7 +234,7 @@ has_neoverse_n1_erratum_1542419(const struct arm64_cpu_capabilities *entry,
 	const struct midr_range range = MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1);

 	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
-	return is_midr_in_range(&range) && has_dic;
+	return is_cpuid_in_range_list(&range) && has_dic;
 }

 static const struct midr_range impdef_pmuv3_cpus[] = {
@@ -276,7 +266,7 @@ static bool has_impdef_pmuv3(const struct arm64_cpu_capabilities *entry, int sco
 	if (pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
 		return false;

-	return is_midr_in_range_list(impdef_pmuv3_cpus);
+	return is_cpuid_in_range_list(impdef_pmuv3_cpus);
 }

 static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *__unused)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..e89bed0e7358 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1807,7 +1807,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
 	char const *str = "kpti command line option";
 	bool meltdown_safe;

-	meltdown_safe = is_midr_in_range_list(kpti_safe_list);
+	meltdown_safe = is_cpuid_in_range_list(kpti_safe_list);

 	/* Defer to CPU feature registers */
 	if (has_cpuid_feature(entry, scope))
@@ -1877,7 +1877,7 @@ static bool has_nv1(const struct arm64_cpu_capabilities *entry, int scope)

 	return (__system_matches_cap(ARM64_HAS_NESTED_VIRT) &&
 		!(has_cpuid_feature(entry, scope) ||
-		  is_midr_in_range_list(nv1_ni_list)));
+		  is_cpuid_in_range_list(nv1_ni_list)));
 }

 #if defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) && defined(ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2)
@@ -2082,7 +2082,7 @@ static bool cpu_has_broken_dbm(void)
 		{},
 	};

-	return is_midr_in_range_list(cpus);
+	return is_cpuid_in_range_list(cpus);
 }

 static bool cpu_can_use_dbm(const struct arm64_cpu_capabilities *cap)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index edf1783ffc81..144441ad2aed 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -172,7 +172,7 @@ static enum mitigation_state spectre_v2_get_cpu_hw_mitigation_state(void)
 		return SPECTRE_UNAFFECTED;

 	/* Alternatively, we have a list of unaffected CPUs */
-	if (is_midr_in_range_list(spectre_v2_safe_list))
+	if (is_cpuid_in_range_list(spectre_v2_safe_list))
 		return SPECTRE_UNAFFECTED;

 	return SPECTRE_VULNERABLE;
@@ -331,7 +331,7 @@ bool has_spectre_v3a(const struct arm64_cpu_capabilities *entry, int scope)
 	};

 	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
-	return is_midr_in_range_list(spectre_v3a_unsafe_list);
+	return is_cpuid_in_range_list(spectre_v3a_unsafe_list);
 }

 void spectre_v3a_enable_mitigation(const struct arm64_cpu_capabilities *__unused)
@@ -475,7 +475,7 @@ static enum mitigation_state spectre_v4_get_cpu_hw_mitigation_state(void)
 		{ /* sentinel */ },
 	};

-	if (is_midr_in_range_list(spectre_v4_safe_list))
+	if (is_cpuid_in_range_list(spectre_v4_safe_list))
 		return SPECTRE_UNAFFECTED;

 	/* CPU features are detected first */
@@ -864,7 +864,7 @@ static bool is_spectre_bhb_safe(int scope)
 	if (scope != SCOPE_LOCAL_CPU)
 		return all_safe;

-	if (is_midr_in_range_list(spectre_bhb_safe_list))
+	if (is_cpuid_in_range_list(spectre_bhb_safe_list))
 		return true;

 	all_safe = false;
@@ -917,17 +917,17 @@ static u8 spectre_bhb_loop_affected(void)
 		{},
 	};

-	if (is_midr_in_range_list(spectre_bhb_k132_list))
+	if (is_cpuid_in_range_list(spectre_bhb_k132_list))
 		k = 132;
-	else if (is_midr_in_range_list(spectre_bhb_k38_list))
+	else if (is_cpuid_in_range_list(spectre_bhb_k38_list))
 		k = 38;
-	else if (is_midr_in_range_list(spectre_bhb_k32_list))
+	else if (is_cpuid_in_range_list(spectre_bhb_k32_list))
 		k = 32;
-	else if (is_midr_in_range_list(spectre_bhb_k24_list))
+	else if (is_cpuid_in_range_list(spectre_bhb_k24_list))
 		k = 24;
-	else if (is_midr_in_range_list(spectre_bhb_k11_list))
+	else if (is_cpuid_in_range_list(spectre_bhb_k11_list))
 		k = 11;
-	else if (is_midr_in_range_list(spectre_bhb_k8_list))
+	else if (is_cpuid_in_range_list(spectre_bhb_k8_list))
 		k =  8;

 	return k;
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index b9ad7c42c5b0..852f8d769244 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -632,7 +632,7 @@ static const struct midr_range broken_seis[] = {
 static bool vgic_v3_broken_seis(void)
 {
 	return ((kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_SEIS) &&
-		is_midr_in_range_list(broken_seis));
+		is_cpuid_in_range_list(broken_seis));
 }

 /**
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 981a578043a5..c881ceb76ec2 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -842,7 +842,7 @@ static u64 __arch_timer_check_delta(void)
 		{},
 	};

-	if (is_midr_in_range_list(broken_cval_midrs)) {
+	if (is_cpuid_in_range_list(broken_cval_midrs)) {
 		pr_warn_once("Broken CNTx_CVAL_EL1, using 31 bit TVAL instead.\n");
 		return CLOCKSOURCE_MASK(31);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403ad..2ea5ca6708d2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1280,7 +1280,7 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
 	 * recorded value for 'drvdata->ccitmin' to workaround
 	 * this problem.
 	 */
-	if (is_midr_in_range_list(etm_wrong_ccitmin_cpus)) {
+	if (is_cpuid_in_range_list(etm_wrong_ccitmin_cpus)) {
 		if (drvdata->ccitmin == 256)
 			drvdata->ccitmin = 4;
 	}
-- 
2.24.0


