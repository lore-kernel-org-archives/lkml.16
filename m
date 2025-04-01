Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C6212FA7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547402; cv=none; b=WlyWRo3096WzL6CwuJP+q2InU9q1Wnj6Ij6uCGD6NcrtfQvZUaR4Y7eiFtZBkDNEbbIntL5lJoyXMt6orHV+4ZJXlyf7+2GSeKA9ypKdEgQTQqghbP4jhZTwd4qBI/7DoGOU44cBfuybnSVO91qG+FSYhMcRpTpscsUZK0P40OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547402; c=relaxed/simple;
	bh=x6pOZtUPGI5SJ4aoNf9xFwvzlCCzcUMVV+An2Isnjsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eGQz/dR3ixMjtEZJ3uy2Pb6qotxwt7cbLxp54TX7DEbKgD4eIn5eqyNHTdRrGYxxfnu0Ewd8smtXudIoV3booz1ISLtI2Jjoxb84Tmnys3Qb1zKznUiP8sCyn/SL8hJhGjAVOaR9vw2JHvn73u3+kjvRMm8Mvdl6o0ekY0dufaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+uhVIZU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+uhVIZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743547401; x=1775083401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6pOZtUPGI5SJ4aoNf9xFwvzlCCzcUMVV+An2Isnjsg=;
  b=V+uhVIZUjdXYyTGRFeOPuN+4lY2JAogHIXGYsDGrY6oYygSqmgudXBO2
   tP8lBLnlKXAY69+Z8H9U6VshyKgBZTDv+MP1k9skfT0GVQA0lGqhJNWFW
   d/M8lvjlzTdZ2YmuXpjl9yaGpZhbiN187QEOshLTlUoBybXLkgh28Gw7s
   co51VEchS4kcn0Hz9OBFEo+f5O/Xr/06Wjlmo3++CAEj8syZi48eFHy2l
   EcSUr6jU9pOw4cq7IGvrUvu4cGKBFxX02GahAlvEOYInqbuKzGwi3dzTb
   80lVgH0Bpy2yY0SBRitxnbt4u1FZtvoTk6nX8Nl0yRSb6mL98/iBIQW+C
   g==;
X-CSE-ConnectionGUID: v56SmmbxTwy/mb3Au2c0sQ==
X-CSE-MsgGUID: XSuUpz3ySw+5V6JJ08MzpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55088755"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="55088755"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:43:19 -0700
X-CSE-ConnectionGUID: aS88Mj65RMKxcr9sQVPkTg==
X-CSE-MsgGUID: ngy2hFT2T1aUt3kgdlCJoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126410555"
Received: from viggo.jf.intel.com (HELO ray2.sr71.net) ([10.54.77.144])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 15:43:19 -0700
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/tdx for 6.15-rc1
Date: Tue,  1 Apr 2025 15:43:12 -0700
Message-Id: <20250401224312.3264346-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull some x86/tdx changes for 6.15-rc1. This is coming during the
merge window, but it is really a bug fix.

TDX guests aren't expected to use the HLT instruction directly. It
causes a virtualization exception (#VE). While the #VE _can_ be
handled, the current handling is slow and buggy and the easiest thing
is just to avoid HLT in the first place. Plus, the kernel already has
paravirt infrastructure that makes it relatively painless.

Make TDX guests require paravirt and add some TDX-specific paravirt
handlers which avoid HLT in the normal halt routines. Also add a warning
in case another HLT sneaks in.

There was a report that this leads to a "major performance improvement"
on specjbb2015, probably because of the extra #VE overhead or missed
wakeups from the buggy HLT handling.

--

The following changes since commit 0d86c2395390efd61d111698ec120b5a79303b99:

  Merge tag 'ras_core_for_v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2025-03-25 14:13:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_tdx_for_6.15-rc1

for you to fetch changes up to e8f45927ee5d99fa52f14205a2c7ac3820c64457:

  x86/tdx: Emit warning if IRQs are enabled during HLT #VE handling (2025-03-26 08:52:10 +0100)

----------------------------------------------------------------
 * Avoid direct HLT instruction execution in TDX guests

----------------------------------------------------------------
Kirill A. Shutemov (1):
      x86/paravirt: Move halt paravirt calls under CONFIG_PARAVIRT

Vishal Annapurve (2):
      x86/tdx: Fix arch_safe_halt() execution for TDX VMs
      x86/tdx: Emit warning if IRQs are enabled during HLT #VE handling

 arch/x86/Kconfig                      |  1 +
 arch/x86/coco/tdx/tdx.c               | 34 ++++++++++++++++++++++++++++-
 arch/x86/include/asm/irqflags.h       | 40 +++++++++++++++++++----------------
 arch/x86/include/asm/paravirt.h       | 20 +++++++++---------
 arch/x86/include/asm/paravirt_types.h |  3 +--
 arch/x86/include/asm/tdx.h            |  4 ++--
 arch/x86/kernel/paravirt.c            | 14 ++++++------
 arch/x86/kernel/process.c             |  2 +-
 8 files changed, 78 insertions(+), 40 deletions(-)
