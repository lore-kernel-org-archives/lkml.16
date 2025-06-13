Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6734191F84
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822617; cv=none; b=EXrmkMI9Wqr6fgkZZ+8OAYKLd7SGUYUdPCoExTFOdgzsaheWL0r27BqQvrv3LM4q0FGfoRj5mumOGIL7swYZlGLWdZbD3ERlaSxop35s5NTUGQg+01hwTrtnd4qZ29cn/j21a5tBvTE4mvKZMWwRdUFKKv8235k+/5AiHqGdqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822617; c=relaxed/simple;
	bh=wvswiUX9KL+CSfsq+NBsxpwVD0hxpn2FLWO0CHcERHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i4JfWWal6thjszEHuFw1PyCfBip+WbuOclD9d1FSK4T8DN1gtqdDJLL+cLVB/eEctvVDu8AFQkljffY2pMA0sQZ0RVg8eoyjsDJQz8XKyqRXYfcp44339ADvbmFc5WSstWdL7YDeScwbVsRg5hY7+0cxuPsNaPxPhLAxtO0/eU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTj11mKk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTj11mKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822616; x=1781358616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wvswiUX9KL+CSfsq+NBsxpwVD0hxpn2FLWO0CHcERHU=;
  b=GTj11mKkAH70reTq4pi8DFH6xPGJ/yXe9vz/YYft/h4HIb/r7k8x3O+O
   1A50RdFFGKnoU0Cor56vVsSj0cgNgoewyVodu1Fpyso2vJnAyroPeLyxk
   yFcgSNaRFXqDZ6vQuIiNlFF8zUp7ElsHppNOvrCWwk0KyYHIqkx9LMg0I
   NetYFXfGYY3Xvt/+hxTLuydj/ePAzOxNJwuIRGqp3go1Yc3Q99bhcN55I
   vuMT+bRn0/jPznqJRo4PkV6a9nKDNpQjV7F5bJB0g8uo0ZasKYMrZQHY9
   QBqrII3cd2HxVzNMrHTY7YPBwRyPTF5n008ufz4oGOLVwgaJ3iqvkMvwC
   w==;
X-CSE-ConnectionGUID: iz4N+fulQ6GB2eQxGAGDiA==
X-CSE-MsgGUID: bv5mMF1OQpmH1vHS/CCPow==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837543"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:15 -0700
X-CSE-ConnectionGUID: EbeouDvnQRCND3ty3obTaQ==
X-CSE-MsgGUID: Lb8uIDXWSQGTRYgHbkW1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017593"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:15 -0700
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
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH 00/12] Support vector and more extended registers in perf
Date: Fri, 13 Jun 2025 06:49:31 -0700
Message-Id: <20250613134943.3186517-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

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

Open:
The new registers include YMM, ZMM, OPMASK, SSP, and APX.
The sample_regs_user/intr has run out. A new field in the
struct perf_event_attr is required for the registers.
There could be several options as below for the new field.

- Follow a similar format to XSAVES. Introduce the below fields to store
  the bitmap of the registers.
  struct perf_event_attr {
        ...
        __u64   sample_ext_regs_intr[2];
        __u64   sample_ext_regs_user[2];
        ...
  }
  Includes YMMH (16 bits), APX (16 bits), OPMASK (8 bits),
           ZMMH0-15 (16 bits), H16ZMM (16 bits), SSP
  For example, if a user wants YMM8, the perf tool needs to set the
  corresponding bits of XMM8 and YMMH8, and reconstruct the result.
  The method is similar to the existing method for
  sample_regs_user/intr, and match the XSAVES format.
  The kernel doesn't need to do extra configuration and reconstruction.
  It's implemented in the patch set.

- Similar to the above method. But the fields are the bitmap of the
  complete registers, E.g., YMM (16 bits), APX (16 bits),
  OPMASK (8 bits), ZMM (32 bits), SSP.
  The kernel needs to do extra configuration and reconstruction,
  which may brings extra overhead.

- Combine the XMM, YMM, and ZMM. So all the registers can be put into
  one u64 field.
        ...
        union {
                __u64 sample_ext_regs_intr;   //sample_ext_regs_user is simiar
                struct {
                        __u32 vector_bitmap;
                        __u32 vector_type   : 3, //0b001 XMM 0b010 YMM 0b100 ZMM
                              apx_bitmap    : 16,
                              opmask_bitmap : 8,
                              ssp_bitmap    : 1,
                              reserved      : 4,

                };
        ...
  For example, if the YMM8-15 is required,
  vector_bitmap: 0x0000ff00
  vector_type: 0x2
  This method can save two __u64 in the struct perf_event_attr.
  But it's not straightforward since it mixes the type and bitmap.
  The kernel also needs to do extra configuration and reconstruction.

Please let me know if there are more ideas.

Thanks,
Kan



Kan Liang (12):
  perf/x86: Use x86_perf_regs in the x86 nmi handler
  perf/x86: Setup the regs data
  x86/fpu/xstate: Add xsaves_nmi
  perf: Move has_extended_regs() to header file
  perf/x86: Support XMM register for non-PEBS and REGS_USER
  perf: Support extension of sample_regs
  perf/x86: Add YMMH in extended regs
  perf/x86: Add APX in extended regs
  perf/x86: Add OPMASK in extended regs
  perf/x86: Add ZMM in extended regs
  perf/x86: Add SSP in extended regs
  perf/x86/intel: Support extended registers

 arch/arm/kernel/perf_regs.c           |   9 +-
 arch/arm64/kernel/perf_regs.c         |   9 +-
 arch/csky/kernel/perf_regs.c          |   9 +-
 arch/loongarch/kernel/perf_regs.c     |   8 +-
 arch/mips/kernel/perf_regs.c          |   9 +-
 arch/powerpc/perf/perf_regs.c         |   9 +-
 arch/riscv/kernel/perf_regs.c         |   8 +-
 arch/s390/kernel/perf_regs.c          |   9 +-
 arch/x86/events/core.c                | 226 ++++++++++++++++++++++++--
 arch/x86/events/intel/core.c          |  49 ++++++
 arch/x86/events/intel/ds.c            |  12 +-
 arch/x86/events/perf_event.h          |  58 +++++++
 arch/x86/include/asm/fpu/xstate.h     |   1 +
 arch/x86/include/asm/perf_event.h     |   6 +
 arch/x86/include/uapi/asm/perf_regs.h | 101 ++++++++++++
 arch/x86/kernel/fpu/xstate.c          |  22 +++
 arch/x86/kernel/perf_regs.c           |  85 +++++++++-
 include/linux/perf_event.h            |  23 +++
 include/linux/perf_regs.h             |  29 +++-
 include/uapi/linux/perf_event.h       |   8 +
 kernel/events/core.c                  |  63 +++++--
 21 files changed, 699 insertions(+), 54 deletions(-)

-- 
2.38.1

