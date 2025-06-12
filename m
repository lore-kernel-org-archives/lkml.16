Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF822D9ED
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771624; cv=none; b=nEWv/yhiJ1qONYFYjvmzLdb/7iUv12aKxYlWwP3u9zx/wNbixfjtnaEKuRdQYTVzxSsGX93iv/1lf3km2Gfr0rC7IoJ20q//EA1+hdNWxrAqEpaFjvWj6hUIDrRJDJKlWBXIs5QKI1KUwJTHeQXIRbgTF3qZp1EOyeFgPelnjV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771624; c=relaxed/simple;
	bh=HgPyG0zfBpsAaRmFh5Mf3XsW9TS09iDXSvGaz+lVQUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MUTYEuHytcaHB1hSTJ5Uq+mYiCbRfm6RYvoZgGnfBwqxweAME3A+pexcwZKEEfu2KQVCm95YnfKgmhw8yrCjQxYfPg/gO6x177J/AKMrlh1SCRrPENlZIjj/GoKQuI/27dYc+UZWc7jmduDMesHl/2ekfJw2zKQzHa7uLfJ64vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cXE+gUak; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nqDV+3wN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cXE+gUak";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nqDV+3wN"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zb4eFr8rBlyubPM4VLhXUTekr67Q/fq32/z731O4wf4=;
	b=cXE+gUakUqzqxEin8GONQYpIdHdkQu0bRG4QcNv2nz7cS2XAxjVzuzRq85tT4S6QM9tLzl
	IjQr1Zwz3wVRkKISw/hOBKyPZTiEZPWRPj8/5n7ufh27AYE2ew2CiJNoPZIFjTVD9dkM0d
	ZHNzgeyUU1zaJPN5qLjMNphJb20uYzlrRabeEMTv+h14w4FdSZix53JdcWxc9lWeGlHekm
	cAljy/b30q+G9m3Iwbi+uSJe1/+qC+i5nsPkql9U1JxAQhv86c0MeI22U3y6Lv6zSh/YMH
	N2T2XijaXDtRQUr9wm30LUUvmNq0Q6SfuIac9U8whGKZCd/zTCUIBO+/hwvnmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zb4eFr8rBlyubPM4VLhXUTekr67Q/fq32/z731O4wf4=;
	b=nqDV+3wNtZxkORqtCCHhdj/3LRHqDWeyua7ojBsVIBSCFDDkVkuHqivC8qQKin9x4U14ec
	rRKawdaYP7Ts/xDA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 00/44] x86: Introduce a centralized CPUID data model
Date: Fri, 13 Jun 2025 01:39:26 +0200
Message-ID: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series introduces a centralized CPUID model for the x86 subsystem.

Rationale for this work can be found at:

    https://lore.kernel.org/lkml/874ixernra.ffs@tglx

    https://gitlab.com/x86-cpuid.org/x86-cpuid-db

The first 19 patches can be independently applied.


Changelog v3
~~~~~~~~~~~~

* Transform the final CPUID(0x80000006) call site, inline C function
  cpuid_amd_hygon_has_l3_cache() at <asm/cpuid/api.h>, to the new parsed
  CPUID API.

  Due to this C inline function requiring access to 'struct cpuinfo_x86',
  a circular dependency emerged in the headers:

  <asm/cpuid/api.h>    includes    <asm/processor.h>	# for 'struct cpuinfo_x86'
  <asm/processor.h>    includes    <asm/cpuid/api.h>	# for CPUID types

  Turns out, <asm/processor.h> does not need <asm/cpuid/api.h>, and
  <asm/cpuid/types.h> is enough for it.

  Thus, let <asm/processor.h> include <asm/cpuid/types.h> instead.

  For all call sites that included the CPUID API header implicitly
  through <asm/processor.h>, transform them to explicitly include
  <asm/cpuid/api.h> instead.

  This <asm/processor.h>⇔CPUID-API headers disentanglement is done by
  patches 1=>19.

* Initially (at v1, v2), there were two CPUID parser functions to fill a
  CPUID table: cpuid_parser_scan_cpu() and cpuid_parser_rescan_cpu().
  The latter zeroed-out the CPUID table beforehand, while the former did
  not.

  For v3, let the CPUID parser provide only one function where the CPUID
  table is always zeroed beforehand: cpuid_parser_scan_cpu(),

  Rationale for this decision is explained at patch 21/44 ("x86/cpuid:
  Introduce a centralized CPUID parser"), inside
  cpuid_parser_scan_cpu()'s implementation.

* Minimize the code for leaf-specific CPUID parser code by removing some
  redundant steps: remove initial zeroing of "output->info->nr_entries",
  remove a static assert, etc.

* Drop the v2 patch, ("x86/cpuid: Warn once on invalid CPUID(0x2)
  iteration count"), from this model v3.  On AMD machines with zeroed
  CPUID(0x2) output, a false warning will be triggered.

  This is because the CPUID model generic leaves parser has no vendor
  filtering so far; i.e. all CPUID leaves are queried on all CPU vendors.
  This keeps the parser simple, but I'll think a bit if adding minimal
  vendor filtering will be useful for this PQ's next iteration.

* Apply more CPUID parser code readability enhancements.

* Series is on top of v6.16-rc1.


Changelog v2
~~~~~~~~~~~~

( [PATCH v2 00/27] x86: Introduce a centralized CPUID data model
  https://lore.kernel.org/x86-cpuid/20250605192356.82250-1-darwi@linutronix.de )

* Pre-requisite CPUID headers cleanups, requested by Ingo, are now merged:

    [PATCH v1 0/9] x86/cpuid: Headers cleanup
    https://lore.kernel.org/lkml/20250508150240.172915-1-darwi@linutronix.de

    [PATCH v2 0/2] x86/cpuid: Headers cleanup
    https://lore.kernel.org/lkml/20250515202143.34448-1-darwi@linutronix.de

  This v2 series is rebased on top of the above restructuring, where the
  CPUID headers become:

    include/asm/cpuid/
    ├── api.h
    ├── leaf_types.h		// x86-cpuid-db auto-generated file
    └── types.h

* At <asm/cpuid/api.h>, add a clear rational for call sites to use the
  new API:

   /*
    * External APIs for accessing parsed CPUID data:
    *
    * Call sites should use below APIs instead of invoking direct CPUID
    * queries.  Benefits include:
    *
    * - Return CPUID output as typed C structures that are auto-generated
    *   from a centralized database (see <cpuid/leaf_types.h).  Such data
    *   types have a full C99 bitfield layout per CPUID leaf/subleaf
    *   combination.  Call sites can thus avoid doing ugly and cryptic
    *   bitwise operations on raw CPUID data.
    *
    * - Return cached, per-CPU, CPUID output.  Below APIs do not invoke
    *   any CPUID queries, thus avoiding their side effects like
    *   serialization and VM exits.  Call-site-specific hard coded
    *   constants and macros for caching CPUID query outputs can also be
    *   avoided.
    *
    * - Return sanitized CPUID data.  Below APIs return NULL if the given
    *   CPUID leaf/subleaf input is not supported by hardware, or if the
    *   hardware CPUID output was deemed invalid by the CPUID parser.
    *   This centralizes all CPUID data sanitization in one place (the
    *   kernel's CPUID parser.)
    *
    * - A centralized global view of system CPUID data.  Below APIs will
    *   reflect any kernel-enforced feature masking or overrides, unlike
    *   ad hoc parsing of raw CPUID output by drivers and individual call
    *   sites.
    */

* Since this model's APIs will be the official kernel CPUID API, free the
  cpuid_subleaf() and cpuid_leaf() namespace and dedicate it to the model:

    patch 02/27 ("x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs")

  After some local iterative work, I've found below API names to make the
  most sense.  They look "so obvious" now, which is IMHO a good sign.
  The CPUID model APIs become:

    /*
     * For CPUID leaves with static, compile-time, subleaves
     */

    cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
    cpuid_leaf(_cpuinfo, _leaf)
    cpuid_leaf_regs(_cpuinfo, _leaf)

    /*
     * For CPUID leaves with dynamic subleaves
     */

    cpuid_subleaf_index(_cpuinfo, _leaf, _idx)
    cpuid_subleaf_index_regs(_cpuinfo, _leaf, _idx)
    cpuid_subleaf_count(_cpuinfo, _leaf)

  The difference between the static and dynamic parts of the API is
  described in detail at patch 04/27 ("x86/cpuid: Introduce a centralized
  CPUID data model").

  In general, all of the above APIs translate to a /single/ assembly
  instruction offset calculation.  For example:

    const struct leaf_0x7_0 *l7_0;
    const struct leaf_0x7_1 *l7_1;

    l7_0 = cpuid_subleaf(c, 0x7, 0);
                         |   |   └────────┐
                         |   └─────────┐  |
                         *             *  *
                        &c.cpuid.leaf_0x7_0[0]

    l7_1 = cpuid_subleaf(c, 0x7, 1);
                         |   |   └────────┐
                         |   └─────────┐  |
                         *             *  *
                        &c.cpuid.leaf_0x7_1[0]

* Per Ingo's feedback, avoid the "CPUID scanner" terminology and
  standardize on "CPUID parser".  Use the new terminology for all of the
  relevent data structures, functions, and file names: "cpuid_parser.h",
  cpuid_parser.c, 'struct cpuid_parse_entry', cpuid_parser_scan_cpu(),
  cpuid_parser_rescan_cpu(), etc.

* Standardize on "__cpuid_leaves_" and "__cpuid_table_" prefixes for all
  of the <cpuid/api.h> macros that are intended for internal CPUID usage.

* Apply multiple code clarity enhancements to the CPUID parser.  No
  change in functionality.

* For the series main patch, 04/27 ("x86/cpuid: Introduce a centralized
  CPUID data model"), expand it with full design and implementation
  details rational.

* Per Sohil's feedback, apply output formatting enhancements to the new
  CPUID debugfs files x86/cpuid/[0-ncpu]:

    patch 07/27 ("x86/cpuid: Introduce CPUID parser debugfs interface")

* Per Ingo's feedback, (lightly) log the cases where the CPUID parser
  encounters bogus hardware CPUID data:

    patch 13/27 ("x86/cpuid: Warn once on invalid CPUID(0x2) iteration count")

* Per Ingo's feedback, break CPUID(0x4) call-site patch into:

    patch 19/27 ("x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) code")
    patch 20/27 ("x86/cacheinfo: Use parsed CPUID(0x4)")

* Enhance all of the project's APIs kernel-doc.

* Massage all commit logs and code comments for overall clarity.


Changelog v1
~~~~~~~~~~~~

( [PATCH v1 00/26] x86: Introduce centralized CPUID model
  https://lore.kernel.org/lkml/20250506050437.10264-1-darwi@linutronix.de )

This series introduces a CPUID model for the x86 subsystem.

It is based on top of the CPUID refactorings and bugfixes currently
merged at tip:x86/cpu:

    [PATCH v1 00/40] x86: Leaf 0x2 and leaf 0x4 refactorings
    https://lore.kernel.org/lkml/20250304085152.51092-1-darwi@linutronix.de

    [PATCH v4 00/29] x86: Leaf 0x2 and leaf 0x4 refactorings
    https://lore.kernel.org/lkml/20250324133324.23458-1-darwi@linutronix.de

    [PATCH v2 0/2] x86/cacheinfo: Fixes for CPUID(0x80000005) and CPUID(0x80000006)
    https://lore.kernel.org/lkml/20250409122233.1058601-1-darwi@linutronix.de

    [PATCH v1 0/2] x86: CPUID refactorings: follow-up
    https://lore.kernel.org/lkml/20250411070401.1358760-1-darwi@linutronix.de

    [PATCH v3 00/20] tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.3
    https://lore.kernel.org/lkml/20250324142042.29010-1-darwi@linutronix.de

First, deploy <asm/cpuid/leaves.h>, as generated by x86-cpuid-db. [*]

The header is in the form:

    /* SPDX-License-Identifier: MIT */
    /* Generator: x86-cpuid-db v2.4 */

    /*
     * Leaf 0x0
     * Maximum standard leaf number + CPU vendor string
     */

    struct leaf_0x0_0 {
     	u32	max_std_leaf		: 32; // Highest standard CPUID leaf supported
     	u32	cpu_vendorid_0		: 32; // CPU vendor ID string bytes 0 - 3
     	u32	cpu_vendorid_2		: 32; // CPU vendor ID string bytes 8 - 11
     	u32	cpu_vendorid_1		: 32; // CPU vendor ID string bytes 4 - 7
    };

    /*
     * Leaf 0x1
     * CPU FMS (Family/Model/Stepping) + standard feature flags
     */

    struct leaf_0x1_0 {
	// eax
	u32	stepping		:  4, // Stepping ID
		base_model		:  4, // Base CPU model ID
		base_family_id		:  4, // Base CPU family ID
		...;
	// ebx
	u32	brand_id		:  8, // Brand index
		clflush_size		:  8, // CLFLUSH instruction cache line size
		n_logical_cpu		:  8, // Logical CPU count
		local_apic_id		:  8; // Initial local APIC physical ID
	// ecx
	...
    };

    ...

where for each 'struct leaf_0xN_M', N is the leaf number and M is the
subleaf.  The bitfields mirror the x86-cpuid-db kcpuid auto-generated
file, as already merged mainline at tools/arch/x86/kcpuid/cpuid.csv.

Create a 'struct cpuid_leaves' in <cpuid/types.h> to hold scanned CPUID
data:

    struct cpuid_leaves {
     	struct leaf_0x0_0	leaf_0x0_0[1];
     	struct leaf_query_info	leaf_0x0_0_info;

     	struct leaf_0x1_0	leaf_0x1_0[1];
     	struct leaf_query_info	leaf_0x0_0_info;

     	struct leaf_0x4_0	leaf_0x4_0[8];
     	struct leaf_query_info	leaf_0x4_0_info;
     	...
    };

where the 'struct leaf_0xN_M' definitions are auto-generated.  Use arrays
to handle CPUID leaves with uniform subleaf structures, which is typical
for enumerating hierarchical objects; e.g., CPUID(0x4) cache topology
enumeration, CPUID(0xd) XSAVE enumeration, CPUID(0x12) SGX enclaves
enumeration, and CPUID(0x8000001d) AMD cache enumeration.

For each entry in the CPUID table, associate a 'struct leaf_query_info'.
It is to be filled for each available CPUID leaf by the generic CPUID
scanning logic.

Define a 'struct cpuid_table' for caching each CPU's CPUID table, and
embed in it a 'struct cpuid_leaves' instance.  This way, global table
data can also be added.  Embed an instance of 'struct cpuid_table' in the
'struct cpuinfo_x86' CPU capability structure(s):

    struct cpuinfo_x86 {
     	...
     	struct cpuid_table	cpuid_table;
     	...
    };

This way, centralized CPUID data can be accessed on early boot using
'boot_cpu_data', and later on a per-CPU basis using the 'cpu_info'
per-CPU CPU capability structures.

Build the CPUID data in that "struct leaf_0xN_M leaf_0xN_M" format to
facilitate direct CPUID table and CPUID bitfields access.  Accessing
scanned CPUID bitfields can be done using statements like:

    u32 level = cpudata_cpuid(c, 0x0)->max_std_leaf;

    const struct leaf_0x1_0 *l1 = cpudata_cpuid(c, 0x1);
    c->x86_stepping		= l1->stepping;
    c->x86_clflush_size		= l1->clflush_size * 8;

    const struct leaf_0x80000005_0 *el5 = cpudata_cpuid(c, 0x80000005);
    unsigned assoc		= el5->l1_dcache_assoc;
    unsigned line_size		= el5->l1_dcache_line_size;

    unsigned l1d_index = 0;	// CPUID(0x4) subleaf 0: L1 data cache
    unsigned l1i_index = 1;	// CPUID(0x4) subleaf 1: L1 inst cache
    const struct leaf_0x4_0 *l1d = cpudata_cpuid_index(0x4, l1d_index);
    const struct leaf_0x4_0 *l1i = cpudata_cpuid_index(0x4, l1i_index);

    /* Then access l1d->cache_nways, l1d->cache_nsets, ... */

where in the above snippet, 'c' is the CPU's capability structure.
Define all macros at <cpuid/table_api.h>, and add proper kernel docs.

Beside the model's centralization benefits, this also avoids using the
ugly manual bit-fiddling common in a lot of CPUID call sites.  The late
part of this PQ clearly shows this.  As a start, switch the following
leaves to scanned CPUID access:

    CPUID(0x0)
    CPUID(0x1)
    CPUID(0x2)
    CPUID(0x4)
    CPUID(0x80000000)
    CPUID(0x80000005)
    CPUID(0x80000006)
    CPUID(0x8000001d)

With these converted, the entirety of the x86/cacheinfo code is void of
any direct CPUID queries.

Introduce the debugfs files 'x86/scanned_cpuid/[0-ncpus]' to dump the
cached CPUID table for each CPU.  This should help with tricky bug
reports in the future, if/when the scanned CPUID tables get
(unexpectedly) out of sync with actual hardware state.  Example output
from an Intel Core i5-8250U laptop:

   $ cat /sys/kernel/debug/x86/scanned_cpuid/cpus/1

    Leaf 0x00000000, subleaf 0:
    cached: EAX=0x00000016	EBX=0x756e6547	ECX=0x6c65746e	EDX=0x49656e69
    actual: EAX=0x00000016	EBX=0x756e6547	ECX=0x6c65746e	EDX=0x49656e69

    Leaf 0x00000001, subleaf 0:
    cached: EAX=0x000806ea	EBX=0x02100800	ECX=0x7ffafbbf	EDX=0xbfebfbff
    actual: EAX=0x000806ea	EBX=0x02100800	ECX=0x7ffafbbf	EDX=0xbfebfbff

    ...

Thanks!

8<-----

Ahmed S. Darwish (44):
  x86/cpuid: Remove transitional <asm/cpuid.h> header
  ASoC: Intel: avs: Include CPUID header at file scope
  x86/boot: Reorder sme.c headers alphabetically
  x86/cpu: Reorder scattered.c headers alphabetically
  x86/cpu/amd: Reorder headers alphabetically
  x86/cpu/topology: Reorder headers alphabetically
  x86/mce: Reorder core.c headers alphabetically
  x86/paravirt: Reorder headers alphabetically
  x86/perf/zhaoxin: Reorder headers alphabetically
  x86/resctrl: Reorder core.c headers alphabetically
  x86/tdx: Reorder headers alphabetically
  cpufreq: Reorder headers alphabetically
  hwmon: (fam15h_power) Reorder headers alphabetically
  hwmon: (k8temp) Reorder headers alphabetically
  perf/x86/amd/uncore: Reorder headers alphabetically
  thermal: intel: Reorder headers alphabetically
  treewide: Explicitly include <asm/cpuid/api.h>
  x86/cpuid: Rename cpuid_leaf()/cpuid_subleaf() APIs
  x86/cpuid: Introduce <asm/cpuid/leaf_types.h>
  x86/cpuid: Introduce a centralized CPUID data model
  x86/cpuid: Introduce a centralized CPUID parser
  x86/cpuid: Parse CPUID(0x80000000)
  x86/cpuid: Introduce CPUID parser debugfs interface
  x86/cpu: Use parsed CPUID(0x0)
  x86/cpu: Use parsed CPUID(0x80000000)
  x86/lib: Add CPUID(0x1) CPU family and model calculation
  x86/cpu: Use parsed CPUID(0x1)
  x86/cpuid: Parse CPUID(0x2)
  x86/cpuid: Introduce parsed CPUID(0x2) API
  x86/cpu: Use parsed CPUID(0x2)
  x86/cacheinfo: Use parsed CPUID(0x2)
  x86/cpuid: Remove direct CPUID(0x2) query API
  x86/cpuid: Parse deterministic cache parameters CPUID leaves
  x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) code
  x86/cacheinfo: Use parsed CPUID(0x4)
  x86/cacheinfo: Use parsed CPUID(0x8000001d)
  x86/cpuid: Parse CPUID(0x80000005) and CPUID(0x80000006)
  x86/cacheinfo: Use auto-generated data types
  x86/cacheinfo: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
  x86/amd_nb: Trickle down 'struct cpuinfo_x86' reference
  x86/cpu: <asm/processor.h>: Do not include CPUID API header
  x86/cpuid: Use parsed CPUID(0x80000006)
  x86/cpu: Rescan CPUID table after PSN disable
  x86/cpu: Rescan CPUID table after unlocking full CPUID range

 MAINTAINERS                                  |    1 +
 arch/x86/boot/compressed/pgtable_64.c        |    1 +
 arch/x86/boot/startup/sme.c                  |    9 +-
 arch/x86/coco/tdx/tdx.c                      |    6 +-
 arch/x86/events/amd/core.c                   |    2 +
 arch/x86/events/amd/ibs.c                    |    1 +
 arch/x86/events/amd/lbr.c                    |    2 +
 arch/x86/events/amd/power.c                  |    3 +
 arch/x86/events/amd/uncore.c                 |   15 +-
 arch/x86/events/intel/core.c                 |    1 +
 arch/x86/events/intel/lbr.c                  |    1 +
 arch/x86/events/zhaoxin/core.c               |   12 +-
 arch/x86/include/asm/acrn.h                  |    2 +
 arch/x86/include/asm/cpu.h                   |    6 +
 arch/x86/include/asm/cpuid.h                 |    8 -
 arch/x86/include/asm/cpuid/api.h             |  321 ++-
 arch/x86/include/asm/cpuid/leaf_types.h      | 2055 ++++++++++++++++++
 arch/x86/include/asm/cpuid/types.h           |  117 +
 arch/x86/include/asm/microcode.h             |    1 +
 arch/x86/include/asm/processor.h             |    3 +-
 arch/x86/include/asm/xen/hypervisor.h        |    1 +
 arch/x86/kernel/amd_nb.c                     |    9 +-
 arch/x86/kernel/cpu/Makefile                 |    3 +-
 arch/x86/kernel/cpu/amd.c                    |   21 +-
 arch/x86/kernel/cpu/cacheinfo.c              |  284 +--
 arch/x86/kernel/cpu/centaur.c                |    1 +
 arch/x86/kernel/cpu/common.c                 |   58 +-
 arch/x86/kernel/cpu/cpuid_debugfs.c          |  102 +
 arch/x86/kernel/cpu/cpuid_parser.c           |  201 ++
 arch/x86/kernel/cpu/cpuid_parser.h           |  109 +
 arch/x86/kernel/cpu/hygon.c                  |    1 +
 arch/x86/kernel/cpu/intel.c                  |   17 +-
 arch/x86/kernel/cpu/mce/core.c               |   63 +-
 arch/x86/kernel/cpu/mce/inject.c             |    1 +
 arch/x86/kernel/cpu/resctrl/core.c           |    6 +-
 arch/x86/kernel/cpu/resctrl/monitor.c        |    1 +
 arch/x86/kernel/cpu/scattered.c              |    3 +-
 arch/x86/kernel/cpu/sgx/main.c               |    3 +
 arch/x86/kernel/cpu/topology_amd.c           |    3 +-
 arch/x86/kernel/cpu/topology_common.c        |    3 +-
 arch/x86/kernel/cpu/topology_ext.c           |    3 +-
 arch/x86/kernel/cpu/transmeta.c              |    3 +
 arch/x86/kernel/cpu/zhaoxin.c                |    1 +
 arch/x86/kernel/cpuid.c                      |    6 +-
 arch/x86/kernel/paravirt.c                   |   29 +-
 arch/x86/kvm/cpuid.h                         |    3 +
 arch/x86/kvm/mmu/spte.c                      |    1 +
 arch/x86/lib/cpu.c                           |   41 +-
 drivers/cpufreq/speedstep-lib.c              |    6 +-
 drivers/firmware/efi/libstub/x86-5lvl.c      |    1 +
 drivers/hwmon/fam15h_power.c                 |   14 +-
 drivers/hwmon/k10temp.c                      |    2 +
 drivers/hwmon/k8temp.c                       |   12 +-
 drivers/thermal/intel/intel_hfi.c            |    1 +
 drivers/thermal/intel/x86_pkg_temp_thermal.c |   15 +-
 sound/soc/intel/avs/tgl.c                    |   25 +-
 56 files changed, 3215 insertions(+), 405 deletions(-)
 delete mode 100644 arch/x86/include/asm/cpuid.h
 create mode 100644 arch/x86/include/asm/cpuid/leaf_types.h
 create mode 100644 arch/x86/kernel/cpu/cpuid_debugfs.c
 create mode 100644 arch/x86/kernel/cpu/cpuid_parser.c
 create mode 100644 arch/x86/kernel/cpu/cpuid_parser.h

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

