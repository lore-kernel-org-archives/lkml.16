Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D087146A72
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502465; cv=none; b=abOFDctbO1eWlqKWPBp1xgcVrsaOi14Mh6dZfF0Bjpze7pTi6i2QQFIljk0oUVGBDGPlWRZBEaYWs4afCUCAgjuaeMj6VNNB/XPXEu/tq32rYdoAc8A662I+NK1UjWbPcYcz1VbZ1RY9Li8XREQJOBPv375qB6VyHgdPOddKb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502465; c=relaxed/simple;
	bh=mi7gb/givjuTFPzj9twpzNDqJZoors0Dk6n64Aw/rdk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M1Kd5/aIUpMm0hIdeEXAPqSULr8zpOEfpvefjJVT7JFIG2KpZ6vf0FIVhvgBS79QWssF6q9ochTcKm5vK+a2/9mrSyx6AqkHZ9lxp8zFBQZwmtLXAztjIj4eMA+HkV4kiL0muSXFhJEB/XZCGLO5xAX5BvSmggaTRg0fpAlBxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7QWrPeV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7QWrPeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745502464; x=1777038464;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mi7gb/givjuTFPzj9twpzNDqJZoors0Dk6n64Aw/rdk=;
  b=U7QWrPeV8xL4JjdfBjwVMUs0hiqNgwPcxwgbt8mlVpArUyDr5DUA4G3t
   +cjyJJd76p1dPUihZZwQp8/kQE2UW0LnRcGw2gI+vWpZ2PDFQMb7KyRoo
   CNMMkuzDkeuA4PN0aoQHQJudJ5MjMw1gssOL0h0FeRyJnQSZAitr2C14M
   nHQ4R+mC8VKfQNL8MjtQUfdQqBYoxdSBEVukdm31dVNLN0A6eqQQQyf7E
   xtof8mHeBEo+bTFlQYZ6wKJ/D21LjMSyya4Vi5HwYTucQMMzAc5tXYL6r
   p8w4T6ZdwXWgDz89eQ6rOrWXuHC6eG2JEX9GqxNi0w2OQTDTVI6xVq604
   w==;
X-CSE-ConnectionGUID: McxrXS0iSUmKWwM5EHwT7g==
X-CSE-MsgGUID: /8TD3P9TS9Wq9XSz6JyNYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58508191"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58508191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:47:43 -0700
X-CSE-ConnectionGUID: wrrKC5G8TUWqzgqlmzYn4Q==
X-CSE-MsgGUID: Tf+nEA31R+6shza2+/23uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137718956"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 06:47:43 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH V2 0/5] Several fixes for group flag and counters-snapshotting
Date: Thu, 24 Apr 2025 06:47:13 -0700
Message-Id: <20250424134718.311934-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The patch series includes several fixes for the new Intel features.

The first 4 patches are to fix the group flag issue which impacts the
branch counters, PEBS counters-snapshotting and ACR.
The V1 can be found at
https://lore.kernel.org/lkml/20250423221015.268949-1-kan.liang@linux.intel.com/

The last patch is to fix an issue of counters-snapshotting.
The V1 can be found at
https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/

Kan Liang (5):
  perf/x86/intel: Only check the group flag for X86 leader
  perf/x86/intel: Check the X86 leader for pebs_counter_event_group
  perf/x86/intel: Check the X86 leader for ACR group
  perf/x86: Optimize the is_x86_event
  perf/x86/intel/ds: Fix counter backwards of non-precise events
    counters-snapshotting

 arch/x86/events/core.c       | 19 ++++++++++---------
 arch/x86/events/intel/ds.c   | 21 +++++++++++++++++++--
 arch/x86/events/perf_event.h | 14 ++++++++++----
 3 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.38.1

