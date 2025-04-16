Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDED15667D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769847; cv=none; b=VmiVgDRKO9vEK+ZzouEQ5XTbcFTsfTx55zCfFYkskHK2cc/9nY8UpRkaD7TDP6xUmLGHl/NN9kC9pNW153Xdrbsz6R6Rj9BVVEYYpjnC09tGG8wqd8wcsGbNHgmszsRLGuQW7NW5+MDhGNKYTkxF+ow/XyRQ1/oEky+u+5wV580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769847; c=relaxed/simple;
	bh=0NOUdZZRChYHImQ02dSmDZLXklot2I+deaNSwOpMs8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lbap5iE/+fwRA5ynaDESvjHxKAgaIOcY9NbxYTlZI6JizuIEmy0yCdhPQ23Y/avWsF9MoxuI0mYM9D++2ua3j7Ll9Hf5OqA6VBLqPThr6feyfeR4/GZn1H5IpOElIpLw/TlCxf0M87+9/XYg0yz03Bo6+R+YpcHqBBVwQlbrYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aK86mO5y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aK86mO5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769845; x=1776305845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0NOUdZZRChYHImQ02dSmDZLXklot2I+deaNSwOpMs8U=;
  b=aK86mO5yl6XJTbTeIcUUHz/TmwLouhQ3iY1yuqlhZpm5J43PiDOS+CeS
   fNwZj1dWzN/mdYSlnD5K2QVMeRWvRD7IF7LiEDaErAjfm1KXjxTJc4o5M
   8CvuPXfBWQLQg30ckpSnzVtYdRAdLG2mEL+cNSWgi3fhu5Du7uoIQFkmw
   5L9VTeYoSuZatlONTyxP/rRcZ2BaTj77ogiiw35mJWzh+94PHUloL9Gmz
   Fnv1wKUdyanjZm7HsYsopQO8Sq303bO9v2jp5uR73EcAt58EdhEY5hwMH
   b2UjPWLIm0ySfON/eQx/NGp4qd8kK89sCc6kRLcrtC/MN0WeL4sL0iMyi
   A==;
X-CSE-ConnectionGUID: wfeu5d/uQrGw7pHawLCJ9g==
X-CSE-MsgGUID: H9+piu3mT4+BeUmB7a1bUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998138"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:25 -0700
X-CSE-ConnectionGUID: XiZtNW+WTzOM9vTip7qsqQ==
X-CSE-MsgGUID: K5ZdU/xtRD+LX2yzWQqkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260386"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:25 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH 00/10] x86/fpu: APX enablement and assorted FPU code improvements
Date: Tue, 15 Apr 2025 19:16:50 -0700
Message-ID: <20250416021720.12305-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <Z_onl1QbH9L1-8dq@gmail.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/12/2025 1:43 AM, Ingo Molnar wrote:
>
> Chang, mind sending a series of the latest version of all the pending
> APX patches you have at the moment (and any other pending FPU patches
> you may have), with Reviewed-by tags rolled in, etc.

Hi Ingo,

Here’s the updated patch set following up on the previous APX series [1],
along with a collection of additional FPU-related cleanups and
improvements that were previously posted or discussed.

The series is organized into two parts:

  1. APX Enabling (PATCH 1–5)

     These patches complete the APX bring-up. After laying the groundwork,
     this portion finalizes the enablement:

     *  Patches 1, 2, and 4 are typical xfeature plumbing.

     *  Patch 3 handles MPX conflict -- unexpected hardware issue

     *  Patch 5 adds a test case.

  2. Miscellaneous FPU Code Improvements (PATCH 6–10)

     This batch includes various standalone improvements:

     *  Patch 6: Centralizes the XSAVE disablement message

     *  Patches 7-8: Simplifies PKRU update in XSTATE_BV on sigframe

     *  Patch 9: Removes the unused mxcsr_feature_mask export

     *  Patch 10: Renames fpu_reset_fpregs() for clarity

     Each patch includes context and links to earlier discussions or
     revisions.

As you noted in [2], the series is based on the x86/fpu branch and is
available at:

    git://github.com/intel/apx.git apx-and-misc

[1]: https://lore.kernel.org/lkml/20250320234301.8342-1-chang.seok.bae@intel.com
[2]: https://lore.kernel.org/lkml/Z_zGCCNE_Qt3IlMZ@gmail.com

Thanks,
Chang

Chang S. Bae (10):
  x86/cpufeatures: Add X86_FEATURE_APX
  x86/fpu/apx: Define APX state component
  x86/fpu/apx: Disallow conflicting MPX presence
  x86/fpu/apx: Enable APX state support
  selftests/x86/apx: Add APX test
  x86/fpu: Log XSAVE disablement consistently
  x86/fpu: Refactor xfeature bitmask update code for sigframe XSAVE
  x86/pkeys: Simplify PKRU update in signal frame
  x86/fpu: Remove export of mxcsr_feature_mask
  x86/fpu: Rename fpu_reset_fpregs() to fpu_reset_fpstate_regs()

 arch/x86/include/asm/cpufeatures.h   |  1 +
 arch/x86/include/asm/fpu/types.h     |  9 +++++++++
 arch/x86/include/asm/fpu/xstate.h    |  3 ++-
 arch/x86/kernel/cpu/cpuid-deps.c     |  1 +
 arch/x86/kernel/cpu/scattered.c      |  1 +
 arch/x86/kernel/fpu/core.c           |  6 +++---
 arch/x86/kernel/fpu/init.c           |  1 -
 arch/x86/kernel/fpu/signal.c         | 11 +----------
 arch/x86/kernel/fpu/xstate.c         | 23 ++++++++++++++++++++---
 arch/x86/kernel/fpu/xstate.h         | 21 +++++++++++++++------
 tools/testing/selftests/x86/Makefile |  3 ++-
 tools/testing/selftests/x86/apx.c    | 10 ++++++++++
 tools/testing/selftests/x86/xstate.c |  3 ++-
 tools/testing/selftests/x86/xstate.h |  2 ++
 14 files changed, 69 insertions(+), 26 deletions(-)
 create mode 100644 tools/testing/selftests/x86/apx.c


base-commit: e3a52b67f54aa36ab21265eeea016460b5fe1c46
-- 
2.45.2

