Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DA8215783
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241242; cv=none; b=WOoAKQE4DlTCqS2aGmtDLqkYGmVvvyvYahzcUbvdUhcrwvBCdh6nl5S2X1iuxe01Pt1WkIM3Zd7f0iTqF0hCLb26aKJIrqd6nZrwc+YfmaayNk6gYjX5o4xL+auLIoEED4ya+ZGVf24SDsTt8RnjVeQv2bcYGflF2Sz4Zwct9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241242; c=relaxed/simple;
	bh=Y5HhM6EsVGkJyT/9D53oUbp7SPaw+yWlNrza0lyy1yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2LHnNtP73ZonxwYw+M5AWrrNUgh7pYgvEnFKPzGmM44JDDMwkOE9fv1bv5zR23uYZoUKOiY0gpHVj4cFp1mBGQUbxEGfKTBxpys3QaBmya7kHWuGpS1tlgK1XULQKIaxu9zcANFT+UwWezHcTU4PPA/A1peD1Xj5d3K65YCo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlctK6Il; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlctK6Il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241240; x=1775777240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y5HhM6EsVGkJyT/9D53oUbp7SPaw+yWlNrza0lyy1yQ=;
  b=WlctK6IlOdqSPaEglZxFOlsGamu9J9ndIv8nGeFhjWRzV0otjnpnKm38
   CEfNgTGf4KqDtK/MEmedBAoJDDbjAwfl1tQX3hnluGpX4o1hMEnyK9Wmw
   v87JPNoh8fU6PKnuK9kacWjkLkuGTRi/4/DeLJ0IhhCq1f2vuVYokWy9z
   6/VEiIHeUjBFjG/jcnVndAopoxWgFxc+xrwCmPJWDKvYSvyt9LVaZJhio
   txFAPgkQgqgX5WQdUCT1mOOh8FragJn+4D0kBLodk1jtILxGqEzobev3i
   DdVDiSkWtvYumr8vLWNQZ934mZIRMQ9TIDWS2cJJXuG3/NPDVR+wKpbAS
   g==;
X-CSE-ConnectionGUID: f/UMs7kmQRqtDHzC5J7RLw==
X-CSE-MsgGUID: G3atcde+SNeRw1hInfkR5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224036"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224036"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:16 -0700
X-CSE-ConnectionGUID: xYuDvFZiT364WBcycUH0fw==
X-CSE-MsgGUID: VXsmifrDTE+CeuC8Oj2FOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593029"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:15 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	colinmitchell@google.com,
	chao.gao@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 0/6] x86: Support for Intel Microcode Staging Feature
Date: Wed,  9 Apr 2025 16:27:07 -0700
Message-ID: <20250409232713.4536-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250320234104.8288-1-chang.seok.bae@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is another revision addressing feedback from the last posting [1]
over the past few weeks:

  *  Dave suggested using a local variable to clarify the scope handled
     by each helper, via a function argument [2]. Accordingly, the patch
     order was adjusted (patch 2 <-> patch 3).

  *  Chao provided helpful feedback, leading to additional refinements.

This round contains relatively smaller changes compared to the last one,
but I hope this iteration provide a chance to draw more reviews or even
collect a few tags.

As before, the patch series is based on tip/master and is also available
in this repo:
    git://github.com/intel-staging/microcode.git staging_v3

Thanks,
Chang

[1]: V2: https://lore.kernel.org/lkml/Z+O8DK5NZJL43Nt6@intel.com/
[2]: https://lore.kernel.org/lkml/b01224ee-c935-4b08-a76f-5dc49341182d@intel.com/

Chang S. Bae (6):
  x86/microcode: Introduce staging step to reduce late-loading time
  x86/microcode/intel: Establish staging control logic
  x86/microcode/intel: Define staging state struct
  x86/microcode/intel: Implement staging handler
  x86/microcode/intel: Support mailbox transfer
  x86/microcode/intel: Enable staging when available

 arch/x86/include/asm/msr-index.h         |   9 +
 arch/x86/include/asm/topology.h          |   1 +
 arch/x86/kernel/cpu/microcode/core.c     |  11 +
 arch/x86/kernel/cpu/microcode/intel.c    | 338 +++++++++++++++++++++++
 arch/x86/kernel/cpu/microcode/internal.h |   4 +-
 5 files changed, 362 insertions(+), 1 deletion(-)


base-commit: 033163360247053bec75b81ac2d34aeb9d994e59
-- 
2.45.2

