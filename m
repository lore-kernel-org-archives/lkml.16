Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE6F4ED
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533711; cv=none; b=ulCPehJceWLj/3ay/qI+c9Ubq3vATZLjtsaP0B6NFSk1lQxosYaDR0ZloFCqsNFl58oVB7i/AFmWKlQiq0RCWURK4QlRoVq6i1VNY/vZPGa+FERAjEl3S2uGFUEl+Qm9vfAvMu+ZS4+aF8A0vwNLDXWW0mCGxla+DRDMJJYbUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533711; c=relaxed/simple;
	bh=oSc/52whvcgAmssn9KVM7qBByZzNo2YGs0czzpZk7zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZXVJsmKJw4X/NAigBYvknBg8pVU4gs90Q0WNLNAb+JaiJji+eSmUB+v+qPaPTjLo5MTVGy4r5xEmTKGH0bTSGhbsw1AlNmUytKuCiWABMXpUiEPnswwsN5N5YxiCLw5yHXsH3QrwM+juaFyuZjoeoFjVyPx50shqkdveIX6jIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqIaLQdd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqIaLQdd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E25DC4CEDD;
	Sun, 13 Apr 2025 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533710;
	bh=oSc/52whvcgAmssn9KVM7qBByZzNo2YGs0czzpZk7zg=;
	h=From:To:Cc:Subject:Date:From;
	b=rqIaLQdd/JXjxvVQAzMEZiQX9QCGHkjPGfnDo7JQPqDGymHARUhTcpuQ1I8afwXGn
	 0LnBSJxa+zT3oPoqkILW+8VaWXV3kTyamC5NHKpsBGRG66lAVOZbDVcp2A84aM9sc5
	 lxe1faNTzu8LA+iL1e0RYvc3b/uxxuwRtzABMrFF6X3M1jfpNji/sl8cPNNoJ6/KSo
	 3Sm+Z/THlGI9eu73+VYDqjMwBIKF3Papf9mqaedrqglY6NJ6txqKOTMHffjnUPUdMx
	 upG+kZ8IKQIvO4tu39wN9hf0pBC+H0I5Z4uQ/wv+beoutGpKjCkpUCtGEz0z1RHRwW
	 VDULTUy324C+g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 0/6] x86/platform: Move AMD specific headers to <asm/amd/*.h>
Date: Sun, 13 Apr 2025 10:41:38 +0200
Message-ID: <20250413084144.3746608-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also clean up some details while at it.

The Git tree of these patches can also be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/platform

Thanks,

	Ingo

===============>
Ingo Molnar (6):
  x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
  x86/platform/amd: Add standard header guards to <asm/amd/ibs.h>
  x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/amd/nb.h>
  x86/platform/amd: Move the <asm/amd_hsmp.h> header to <asm/amd/hsmp.h>
  x86/platform/amd: Clean up the <asm/amd/hsmp.h> header guards a bit
  x86/platform/amd: Move the <asm/amd_node.h> header to <asm/amd/node.h>

 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 MAINTAINERS                                        | 6 +++---
 arch/x86/events/amd/ibs.c                          | 2 +-
 arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h}    | 4 ++--
 arch/x86/include/asm/{amd-ibs.h => amd/ibs.h}      | 5 +++++
 arch/x86/include/asm/{amd_nb.h => amd/nb.h}        | 2 +-
 arch/x86/include/asm/{amd_node.h => amd/node.h}    | 0
 arch/x86/kernel/amd_gart_64.c                      | 2 +-
 arch/x86/kernel/amd_nb.c                           | 2 +-
 arch/x86/kernel/amd_node.c                         | 2 +-
 arch/x86/kernel/aperture_64.c                      | 2 +-
 arch/x86/kernel/cpu/cacheinfo.c                    | 2 +-
 arch/x86/kernel/cpu/mce/inject.c                   | 2 +-
 arch/x86/mm/amdtopology.c                          | 2 +-
 arch/x86/mm/numa.c                                 | 2 +-
 arch/x86/pci/amd_bus.c                             | 2 +-
 arch/x86/pci/fixup.c                               | 2 +-
 drivers/char/agp/amd64-agp.c                       | 2 +-
 drivers/edac/amd64_edac.c                          | 4 ++--
 drivers/hwmon/k10temp.c                            | 2 +-
 drivers/platform/x86/amd/hsmp/acpi.c               | 4 ++--
 drivers/platform/x86/amd/hsmp/hsmp.c               | 2 +-
 drivers/platform/x86/amd/hsmp/plat.c               | 4 ++--
 drivers/platform/x86/amd/pmc/mp1_stb.c             | 2 +-
 drivers/platform/x86/amd/pmc/pmc.c                 | 2 +-
 drivers/platform/x86/amd/pmf/core.c                | 2 +-
 drivers/pnp/quirks.c                               | 2 +-
 drivers/ras/amd/atl/internal.h                     | 4 ++--
 sound/soc/amd/acp/acp-rembrandt.c                  | 2 +-
 sound/soc/amd/acp/acp63.c                          | 2 +-
 sound/soc/amd/acp/acp70.c                          | 2 +-
 sound/soc/sof/amd/acp.c                            | 2 +-
 tools/perf/check-headers.sh                        | 2 +-
 tools/perf/util/amd-sample-raw.c                   | 2 +-
 34 files changed, 44 insertions(+), 39 deletions(-)
 rename arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h} (91%)
 rename arch/x86/include/asm/{amd-ibs.h => amd/ibs.h} (98%)
 rename arch/x86/include/asm/{amd_nb.h => amd/nb.h} (98%)
 rename arch/x86/include/asm/{amd_node.h => amd/node.h} (100%)

-- 
2.45.2

