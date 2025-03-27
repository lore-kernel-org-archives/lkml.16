Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A77FBA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119344; cv=none; b=r8qgAeM73bRHvZU0W6fIHEVmOA986abJveDXxgKX2lGhsmQEahK6+K1zq093UZIaM6KJglDBx7exAnibCQjb9pSN0jkI+MBNx3KmkTQy0w8H8Rjuxjc8D3xZq7TkIcDHTIBusaLf1aZx5IYVJywbvZm1wBywYD7vQdBMiOrQxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119344; c=relaxed/simple;
	bh=4kyKLp7Ehky23r1EB2s5Va433N7WZBHjcZnTU3/Er8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/MlI5/jcESMxJ/FdQS1bt7Q6gREdoxrUlZGF9DtQ2R3jftnif+4IbvADF/YVrKTxEdWRaeDAz8pMJ6x3EtCjrhYq0fLEnye8JKTE11zYYxq1p3SVaUCx7IudsuVsW6Ktw9oIM5seqTq4VKFjEUf1l9sW7fn2Gso7WrmHrIRVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kW7isZMX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kW7isZMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119343; x=1774655343;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4kyKLp7Ehky23r1EB2s5Va433N7WZBHjcZnTU3/Er8I=;
  b=kW7isZMXlhmp3IDHMsycKS9TcljEeTg3jX4n5jNn7kOOoD0uEx/IZJ7w
   Ftbny00eGos7RPfrN3G8PIjGF2Kld8eNObuICNmA7koKdpkFyf0aHBj9d
   h7iI8RiHq1XWGc+J96qbp4UuOsF/8ABtPPCKSz7ZRT3CvokI4QaC2zZ9m
   Nl3XG6C5x9oJS3I80ZiJFV6UaGq/UfeIK0BYXXsLgvnI49tpAYLZCqtSF
   BwfyrAh7AsW1HwIVrT4oUxDfBUee0GHLrDc3madSNg0drQRW2Kx2ZFszk
   Nun1LwrNkLmJ8hrsBDQyGSCNU2njloDzF8NdUXfcbi7ZjFy7nqdkdjGtQ
   Q==;
X-CSE-ConnectionGUID: BVGASZuESr+IPOAEkI2IcA==
X-CSE-MsgGUID: oHX9DnlvRaKExPvpKBi97w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627931"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:02 -0700
X-CSE-ConnectionGUID: bv15OuhXSD2WSFYqEBiO3w==
X-CSE-MsgGUID: Q1uPSpJLRMG8Hg8yWu+CQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150466"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:01 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] x86: Cleanup NMI handling
Date: Thu, 27 Mar 2025 23:46:20 +0000
Message-ID: <20250327234629.3953536-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reworking the NMI-source patches[1], I spent quite a few days
understanding the existing NMI handling code. The intention of this series is
to fix the inconsistencies and redundancies that I encountered.

This series also includes improved documentation to make the code easier to
follow. It does not introduce any significant functional changes.

I have tried to split the patches logically to make them easier to review. Let
me know if some of them should be combined. The patches are in no particular
order and can be picked up independently. 

The documentation updates in patches (5, 6, 7) are to the best of my ability.
However, I would really appreciate extra eyes to ensure it is precise.

The updated NMI-source patches will follow this series sometime later.

@Ingo, I tried to format the commit references the way you prefer:

  Commit:
    feeaf5512947 ("x86: Move sysctls into arch/x86")

However, checkpatch seems to dislike it, so I reformatted them as below:

  Commit feeaf5512947 ("x86: Move sysctls into arch/x86")

Is there a specific guideline for x86?

[1]: https://lore.kernel.org/lkml/20240709143906.1040477-1-jacob.jun.pan@linux.intel.com/

Sohil Mehta (9):
  x86/nmi: Simplify unknown NMI panic handling
  x86/nmi: Consolidate NMI panic variables
  x86/nmi: Use a macro to initialize NMI descriptors
  x86/nmi: Remove export of local_touch_nmi()
  x86/nmi: Fix comment in unknown NMI handling
  x86/nmi: Improve and relocate NMI handler comments
  x86/nmi: Improve NMI header documentation
  x86/nmi: Clean up NMI selftest
  x86/nmi: Improve NMI duration console print

 arch/x86/include/asm/nmi.h      | 49 +++++++++++++++++--
 arch/x86/include/asm/x86_init.h |  1 +
 arch/x86/kernel/dumpstack.c     |  2 -
 arch/x86/kernel/nmi.c           | 87 ++++++++++++++++-----------------
 arch/x86/kernel/nmi_selftest.c  | 52 ++++++--------------
 arch/x86/kernel/setup.c         | 37 ++++++--------
 include/linux/panic.h           |  2 -
 7 files changed, 122 insertions(+), 108 deletions(-)

-- 
2.43.0

