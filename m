Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2FD1A2C27
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876045; cv=none; b=Gp/juzGyM7UBaNC2UsEhkAf2OgWdb0M3G4iKKSINNJrXN+GZytJV0PizbeJoZOaPlix6a6PYrPDsUMEq5y8rooi5i5PmzbgY7InH5PswJ4NHk9OkVo0NUKXKNDQJWq84vez1T0Sz7wVETAO3j151eEeIqInD4B9q04nn20zzGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876045; c=relaxed/simple;
	bh=/wFzhm8BagjNEX7771QnN7TjBjxVTulByRYh3pnCQYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYp9NflhO/Km7bFjGpxVMW//MV/VobA1G2VKwo9QVDJP+rM2E/FRyykcBS3iyDEQuMyQ20OIBtMW+yqUzuyp9btEqUWzOUxY1jkGAjFs4TbXqQokVUB2ExUNsXDQXXtHT8LPTJgHifjZalirPTnELuzVjPT6n7n5cXdbvfHBHmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXDaOjc1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXDaOjc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876043; x=1778412043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/wFzhm8BagjNEX7771QnN7TjBjxVTulByRYh3pnCQYI=;
  b=BXDaOjc1RP3PRsY7iv5tbt1D1pgULsIn2eGIeUcBYvQ4G8YRQykPDusK
   NlGzzhOQ1bdJxoR9yfMW1XZXk5KbJAwU6fVTsddf4Eixr8hbznxygOUFL
   Y1wmxRmviYeb0sAD6QhYG81pf9rdURp/Ka9rxaHBvAjZLMrYInegBJ3Eg
   GxTHrYyhz9AEQurciNw/EEWbRKcbxwOPCU7zctqjr/Z7EcIVff21IUgfj
   E2C8Njtmw3mL9lDXmY/wOK6S11fsPkccTvdl3FMVGRCWxSa7E5FWiy7En
   HeFxWo2yGjjyUvKWneFdxR5DCkwEpCK/SibfIOMY22QMymrrbmNjKyTuI
   Q==;
X-CSE-ConnectionGUID: S5mT5iE8Q4y4mUUo3bBxFQ==
X-CSE-MsgGUID: MbAP9tI9T6Cq0Z2S1oln6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71219281"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71219281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:42 -0700
X-CSE-ConnectionGUID: hHBLRo3WTLGtkcpLfUUjlA==
X-CSE-MsgGUID: FvRLXuFFTjGAM2UHOef/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136566460"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:39 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org,
	mingo@redhat.com
Cc: kirill.shutemov@linux.intel.com,
	hpa@zytor.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	isaku.yamahata@intel.com,
	reinette.chatre@intel.com,
	dan.j.williams@intel.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	nik.borisov@suse.com,
	sagis@google.com
Subject: [PATCH v2 0/5] TDX host: kexec/kdump support
Date: Sat, 10 May 2025 11:20:04 +0000
Message-ID: <cover.1746874095.git.kai.huang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave,

This series is the latest attempt to support kexec on TDX host following
your suggestion to use a percpu boolean to control WBINVD during kexec.
I appreciate if you can help to review.

The last attempt was to have one patch to make TDX and kexec mutually
exclusive at runtime while allowing them to be both enabled in Kconfig,
but it turns out to be overkill.  Dave proposed another option of using
a percpu boolean to track the need for flushing:

https://lore.kernel.org/lkml/20250416230259.97989-1-kai.huang@intel.com/

One advantage of the percpu boolean is for TDX we could do optimization
to do:

	wbinvd();
	percpu(boolean) = 0;

for all CPUs at early stage to avoid having to do WBINVD in
stop_this_cpu() at kexec time.  I made a RFC patch to show the idea:

https://github.com/intel/tdx/commit/d9f0123b1d63ba24f472da6971181939ce53d2e3

I'll also reply this RFC patch to this coverletter in case anyone wants
to have a discussion.  Nevertheless, my exception is this series can be
merged first w/o the RFC patch.  We can follow up the optimizations
later.

This series is tagged v2, since it's a closer follow on to the RFC
patchset, which was posted before the single patch:

https://lore.kernel.org/all/cover.1741778537.git.kai.huang@intel.com/

This series is based on today's tip/master.

=== More information ===

TDX private memory is memory that is encrypted with private Host Key IDs
(HKID).  If the kernel has ever enabled TDX, part of system memory
remains TDX private memory when kexec happens.  E.g., the PAMT (Physical
Address Metadata Table) pages used by the TDX module to track each TDX
memory page's state are never freed once the TDX module is initialized.
TDX guests also have guest private memory and secure-EPT pages.

After kexec, the new kernel will have no knowledge of which memory page
was used as TDX private page and can use all memory as regular memory.

1) Cache flush

Per TDX 1.5 base spec "8.6.1.Platforms not Using ACT: Required Cache
Flush and Initialization by the Host VMM", to support kexec for TDX, the
kernel needs to flush cache to make sure there's no dirty cachelines of
TDX private memory left over to the new kernel (when the TDX module
reports TDX_FEATURES.CLFLUSH_BEFORE_ALLOC as 1 in the global metadata for
the platform).  The kernel also needs to make sure there's no more TDX
activity (no SEAMCALL) after cache flush so that no new dirty cachelines
of TDX private memory are generated.

SME has similar requirement.  SME kexec support uses WBINVD to do the
cache flush.  WBINVD is able to flush cachelines associated with any
HKID.  Reuse the WBINVD introduced by SME to flush cache for TDX.

Currently the kernel explicitly checks whether the hardware supports SME
and only does WBINVD if true.  Instead of adding yet another TDX
specific check, this series uses a percpu boolean to indicate whether
WBINVD is needed on that CPU during kexec.

2) Reset TDX private memory using MOVDIR64B

The TDX spec (the aforementioned section) also suggests the kernel
*should* use MOVDIR64B to clear TDX private page before the kernel
reuses it as regular one.

However, in reality the situation can be more flexible.  Per TDX 1.5
base spec ("Table 16.2: Non-ACT Platforms Checks on Memory Reads in Ci
Mode" and "Table 16.3: Non-ACT Platforms Checks on Memory Reads in Li
Mode"), the read/write to TDX private memory using shared KeyID without
integrity check enabled will not poison the memory and cause machine
check.

Note on the platforms with ACT (Access Control Table), there's no
integrity check involved thus no machine check is possible to happen due
to memory read/write using different KeyIDs.

KeyID 0 (TME key) doesn't support integrity check.  This series chooses
to NOT reset TDX private memory but leave TDX private memory as-is to the
new kernel.  As mentioned above, in practice it is safe to do so.

3) One limitation

If the kernel has ever enabled TDX, after kexec the new kernel won't be
able to use TDX anymore.  This is because when the new kernel tries to
initialize TDX module it will fail on the first SEAMCALL due to the
module has already been initialized by the old kernel.

More (non-trivial) work will be needed for the new kernel to use TDX,
e.g., one solution is to just reload the TDX module from the location
where BIOS loads the TDX module (/boot/efi/EFI/TDX/).  This series
doesn't cover this, but leave this as future work.

4) Kdump support

This series also enables kdump with TDX, but no special handling is
needed for crash kexec (except turning on the Kconfig option):

 - kdump kernel uses reserved memory from the old kernel as system ram,
   and the old kernel will never use the reserved memory as TDX memory.
 - /proc/vmcore contains TDX private memory pages.  It's meaningless to
   read them, but it doesn't do any harm either.

5) TDX "partial write machine check" erratum

On the platform with TDX erratum, a partial write (a write transaction
of less than a cacheline lands at memory controller) to TDX private
memory poisons that memory, and a subsequent read triggers machine
check.  On those platforms, the kernel needs to reset TDX private memory
before jumping to the new kernel otherwise the new kernel may see
unexpected machine check.

The kernel currently doesn't track which page is TDX private memory.
It's not trivial to reset TDX private memory.  For simplicity, this
series simply disables kexec/kdump for such platforms.  This can be
enhanced in the future.

Kai Huang (5):
  x86/sme: Use percpu boolean to control wbinvd during kexec
  x86/virt/tdx: Mark memory cache state incoherent when making SEAMCALL
  x86/kexec: Disable kexec/kdump on platforms with TDX partial write
    erratum
  x86/virt/tdx: Remove the !KEXEC_CORE dependency
  x86/virt/tdx: Update the kexec section in the TDX documentation

 Documentation/arch/x86/tdx.rst       | 14 ++++++-------
 arch/x86/Kconfig                     |  1 -
 arch/x86/include/asm/kexec.h         |  2 +-
 arch/x86/include/asm/processor.h     |  2 ++
 arch/x86/include/asm/tdx.h           | 31 +++++++++++++++++++++++++++-
 arch/x86/kernel/cpu/amd.c            | 16 ++++++++++++++
 arch/x86/kernel/machine_kexec_64.c   | 31 +++++++++++++++++++++++-----
 arch/x86/kernel/process.c            | 16 +++-----------
 arch/x86/kernel/relocate_kernel_64.S | 15 ++++++++++----
 9 files changed, 96 insertions(+), 32 deletions(-)


base-commit: 5b036d3516a8be54c24c05d8d1dc86f9815ba53e
-- 
2.43.0

