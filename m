Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A718A93C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072137; cv=none; b=PthFYUik3iPW9NT/d5DGNaDJIuMRQfsnX+d5x1KWFsQTSMyCKN+CtS0T3coROZrYHpvwK7wDI78DNnTY9hNNfCQO4aSAjyRmC6CSkF99ZwtyMJnLH9MRGTsuJsPkxwKm9q09G3g4Nwm4ULzOL130xRmgSGSo0bu4u0ZjpMguU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072137; c=relaxed/simple;
	bh=4RC/cbxW7b2FR10nfyVpZzLUl8JswYtGmQlR25DFX+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUggOFTbIryqDiHFOY8IJtby/KBAgVrzKc+BnzQKdNjZUYIcNRskOFS5Z1wsinCFzTQWZi/0zdxrb9a4B8mCY0mA39Lw84MjtfGr0W9xsKX+ixDT04uCFDzXbv/XoFF5p6ZIaLn/rAT/Mbrtud9bTr3DHv8/AU5ZVnWBrdRQ5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJ03iPsB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJ03iPsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749072135; x=1780608135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4RC/cbxW7b2FR10nfyVpZzLUl8JswYtGmQlR25DFX+A=;
  b=gJ03iPsBSQGqWbQ4Egf9S0VQmrelf/DNkQFxQbL+QSYXqWt2rs2kSkTL
   M0DEHJC6YQPd4qq/F4a6lnlshKra2WIE+kgLcNw7h9mUiizs2kUmbNd6n
   x+e+JS2DnCmcHi9e6oEAibJKg8THsgljzPaBW/+hkpx9Yfmp37fNI20zy
   QLNY6tWT/E3URzRrFGdKtFUjXGQLJ3+9dkgmFb+kN370rVy+pB1L37pxI
   I/PS6o8HwGYWrVJVPkkFWT3MGbVbwy8hbJWyfDc9IxCq3OLPeemr7HcEB
   OhSfLd3ABT7+uMXQY95YI+IR+J85VZY5Q8sVsPUXxIrvxMv8ybcC2lO8G
   Q==;
X-CSE-ConnectionGUID: musPgHJqRCyteB4BnIIstQ==
X-CSE-MsgGUID: W3KtzLE3RAuOrbo+bpRZGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="76572746"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="76572746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:22:14 -0700
X-CSE-ConnectionGUID: HLWwsXghTcWMFHvT0WTTkA==
X-CSE-MsgGUID: I+B1lpl7RMq5h8RB9a5ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150094180"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:22:14 -0700
From: Tony Luck <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v5 0/4 UPDATED] AET patches updated with Reinette feedback
Date: Wed,  4 Jun 2025 14:22:04 -0700
Message-ID: <20250604212208.49080-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since these four patches from the AET series may be the new basis
for Babu's ABMC series I've updated based on Reinette's comments.

Posting these separately while I work on the rest of the series.

Tony Luck (4):
  x86,fs/resctrl: Consolidate monitor event descriptions
  x86,fs/resctrl: Replace architecture event enabled checks
  x86/resctrl: Remove 'rdt_mon_features' global variable
  x86,fs/resctrl: Prepare for more monitor events

 include/linux/resctrl.h                | 24 +++++--
 include/linux/resctrl_types.h          | 15 +++--
 arch/x86/include/asm/resctrl.h         | 16 -----
 arch/x86/kernel/cpu/resctrl/internal.h |  9 +--
 fs/resctrl/internal.h                  | 13 +++-
 arch/x86/kernel/cpu/resctrl/core.c     | 59 ++++++++++-------
 arch/x86/kernel/cpu/resctrl/monitor.c  | 41 +++++-------
 fs/resctrl/ctrlmondata.c               |  4 +-
 fs/resctrl/monitor.c                   | 90 ++++++++++++++------------
 fs/resctrl/rdtgroup.c                  | 73 +++++++++++----------
 10 files changed, 180 insertions(+), 164 deletions(-)

-- 
2.49.0

