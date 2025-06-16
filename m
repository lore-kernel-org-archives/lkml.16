Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B3288CBE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096533; cv=none; b=lV95gXzFn9y78z4b2aFwuYu1D7MUOMVEsbZ6lBFj3crmph9f1KxDJT16bmwRPPZl5ATyDsAbJUJGa0P/xyyANYzmzxaeO4c5+C4l6IyYYdNP6fkPWB721wg6itgZ9p5wsf0SOws78wKH28t3rZB+5ptst4ZG4ffPQe657uWlFLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096533; c=relaxed/simple;
	bh=R66iD/Ci+AFavLjKTygk3kuhxuoIhV12L9DjFvnYdDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dimz5PXR7TkDMou7vG+npgudRm04j+8mS697/ICKub0gllz0Om48hKy951+46sjVncIdlkw7VYEGaNoUM0rIMehrhin8H82vZa309TJqqYUMI7E91WZXbw7Xxt+EKgOX66kprawfEVfKvMB/mLSdTUM32ZJqEELIYGErOWiJ+r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNbXlbQA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNbXlbQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750096531; x=1781632531;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R66iD/Ci+AFavLjKTygk3kuhxuoIhV12L9DjFvnYdDY=;
  b=FNbXlbQA8aQWHi2IqFeLqrplYemj5Pb7s1QXasbK2Ik6w7aTPbB5BEf2
   2j0x41ulO/cuAEPxBNHsczSu0qa5Kf/2p7nwWItI8P+9o4BiYt8AfSBbE
   NByJoAkK7ypcEdmcS7D6W8S2NNrzF6KdCdw77wP4zfq/0u1LgYyRQVjEg
   M+PAlPWCWns05G9IwGQo4+jLF4n3uArhkXNY3dPy6QAl5vdN9/j7+GDz1
   XLr0S1mUDNkMrnLjNNq4Ewfy0hjXNdgTgl8rVSKROrzuHf5oEhPiDjF6A
   hEtoxXt5a2QgC/gy4bpfbOec1FcKE9oRAVa27U0s9/Mdc5acjoI1vfEqj
   w==;
X-CSE-ConnectionGUID: kIoyLdNvR9GtY04Ad4KfGA==
X-CSE-MsgGUID: G+zFcmQMQ+i686HUkuPW0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55929021"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="55929021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 10:55:31 -0700
X-CSE-ConnectionGUID: Xn6LRwr9S/S7YV9OZaaEGw==
X-CSE-MsgGUID: rZ23xyElSnWMh2Va+0hccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="152377964"
Received: from viggo.jf.intel.com (HELO ray2.sr71.net) ([10.54.77.144])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2025 10:55:29 -0700
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/urgent for 6.16-rc3
Date: Mon, 16 Jun 2025 10:55:28 -0700
Message-Id: <20250616175528.1973014-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull some x86/urgent changes for 6.16-rc3.

This is a pretty scattered set of fixes. The majority of them are further
fixups around the recent ITS mitigations. The rest don't really have a
coherent story.

 * Some flavors of Xen PV guests don't support large pages, but the
   set_memory.c code assumes all CPUs support them. Avoid problems with
   a quick CPU feature check.
 * The TDX code has some wrappers to help retry calls to the TDX module.
   They use function pointers to assembly functions and the compiler
   usually generates direct CALLs. But some new compilers, plus -Os
   turned them in to indirect CALLs and the assembly code was not
   annotated for indirect calls. Force inlining of the helper to fix
   it up.
 * Last, a FRED issue showed up when single-stepping. It's fine when
   using an external debugger, but was getting stuck returning from
   a SIGTRAP handler otherwise. Clear the FRED "swevent" bit to ensure
   that forward progress is made.

--

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_6.16-rc3

for you to fetch changes up to 7cd9a11dd0c3d1dd225795ed1b5b53132888e7b5:

  Revert "mm/execmem: Unify early execmem_cache behaviour" (2025-06-11 11:20:52 +0200)

----------------------------------------------------------------
 * Further fixups for ITS mitigation
 * Avoid using large pages for kernel mappings when PSE is not enumerated
 * Avoid ever making indirect calls to TDX assembly helpers
 * Fix a FRED single step issue when not using an external debugger

----------------------------------------------------------------
Juergen Gross (1):
      x86/mm/pat: don't collapse pages without PSE set

Kai Huang (1):
      x86/virt/tdx: Avoid indirect calls to TDX assembly functions

Mike Rapoport (Microsoft) (3):
      x86/Kconfig: only enable ROX cache in execmem when STRICT_MODULE_RWX is set
      x86/its: move its_pages array to struct mod_arch_specific
      Revert "mm/execmem: Unify early execmem_cache behaviour"

Peter Zijlstra (Intel) (1):
      x86/its: explicitly manage permissions for ITS pages

Xin Li (Intel) (2):
      x86/fred/signal: Prevent immediate repeat of single step trap on return from SIGTRAP handler
      selftests/x86: Add a test to detect infinite SIGTRAP handler loop

 arch/x86/Kconfig                           |   2 +-
 arch/x86/include/asm/module.h              |   8 +++
 arch/x86/include/asm/sighandling.h         |  22 +++++++
 arch/x86/include/asm/tdx.h                 |   2 +-
 arch/x86/kernel/alternative.c              |  79 +++++++++++++++-------
 arch/x86/kernel/signal_32.c                |   4 ++
 arch/x86/kernel/signal_64.c                |   4 ++
 arch/x86/mm/init_32.c                      |   3 -
 arch/x86/mm/init_64.c                      |   3 -
 arch/x86/mm/pat/set_memory.c               |   3 +
 arch/x86/virt/vmx/tdx/tdx.c                |   5 +-
 include/linux/execmem.h                    |   8 +--
 include/linux/module.h                     |   5 --
 mm/execmem.c                               |  40 +-----------
 tools/testing/selftests/x86/Makefile       |   2 +-
 tools/testing/selftests/x86/sigtrap_loop.c | 101 +++++++++++++++++++++++++++++
 16 files changed, 207 insertions(+), 84 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigtrap_loop.c
