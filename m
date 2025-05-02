Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DD2253B65
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189117; cv=none; b=cVZ0ZeOAmxo405ilsBDwAecpPBPjejaQ6a26FpLtTzdGlWCglae0Am3U4yhm6kz8/eJRGUsSA3SdQxFMv0lwI2X68gQw5e5UtYS0QO+PlyP0x+ikO3nllFaBSBKiNpDpm6smWGGKRga7ea+MYM7+aFdxnba39ACWcrudiiUNvHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189117; c=relaxed/simple;
	bh=GkXiLNgzW9mmgGjaUY3tIVBfD72D6XNB+kAGB4cYukg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvoeJBdVFpfnEJ0AeT0yTRl4uwPxP+8lCC+Ue+g/eHEoOqXFMQdakZC+iihGkugkL53eClhrZDsjSp6JdKftHrzKzJ9BtXTUOjFlCNi935uBazHKojhpbjjDrA+/vgrUwSQch/Amga6ohUcv0fMC7/sJCDB9V7DHYhmC35Cd7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K54sUJUw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K54sUJUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189116; x=1777725116;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GkXiLNgzW9mmgGjaUY3tIVBfD72D6XNB+kAGB4cYukg=;
  b=K54sUJUwg8FnuS1RjpwkDfDMlPFd7J1Eshpd3Z/PVo+CxASDi068uXJJ
   Hk+9fKO1gQJcCAxbuWm9p5xEZIHaHaqCGNfi+9diETSCHmH0QRjH5/H5h
   nweD7U5BtWNYe0L2AE5Pdf6XDtFuK/0PV2q6R9N4d+0VrwAloeJ3lG7XS
   eL4ar1UM/lXMp5A8DVu9ygxaAM//0Wyr8zl6pC05JbQrysVPkFufC7L2E
   H7lvh1LHIse02M9JlQFKLHwvyxckxQuAohsujojDwQ+0riMV1dWPnmzo1
   gTPjSXJn6PSAhIWCURZOBKI7q2KVQ7x2qBWDUL3L//PndQO+sp9Uwb3Me
   Q==;
X-CSE-ConnectionGUID: 0UIkHLssTv+352pEdx/6dw==
X-CSE-MsgGUID: aUEmNInFRzu30cSeNOWSkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47955293"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47955293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:52 -0700
X-CSE-ConnectionGUID: fEDrHztITBqrs7z5ZuNUEQ==
X-CSE-MsgGUID: vvB4fXKhRdGMltDoUWVaAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135592035"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 05:31:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DE3EC1A1; Fri, 02 May 2025 15:31:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
Date: Fri,  2 May 2025 15:29:36 +0300
Message-ID: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the platforms may have no legacy COM ports and only provide
an MMIO accessible UART. Add support for such to earlyprintk for the
boot phase of the kernel.

Andy Shevchenko (6):
  x86/boot: Convert early_serial_base to unsigned long
  x86/boot: Introduce helpers for serial I/O
  x86/boot: Split out parse_serial_port() helper for earlyprintk
  x86/boot: Allow longer parameter list for earlyprintk
  x86/boot: Also share MMIO accessors
  x86/boot: Introduce MMIO accessors and their support in earlyprintk

 arch/x86/boot/boot.h                          |   4 +-
 .../boot/compressed/early_serial_console.c    |   5 +-
 arch/x86/boot/compressed/misc.c               |   4 +-
 arch/x86/boot/compressed/misc.h               |   8 +-
 arch/x86/boot/early_serial_console.c          | 114 ++++++++++++++----
 arch/x86/boot/tty.c                           |   9 +-
 arch/x86/include/asm/io.h                     |  65 ----------
 arch/x86/include/asm/shared/io.h              |  68 +++++++++++
 8 files changed, 177 insertions(+), 100 deletions(-)

-- 
2.47.2

