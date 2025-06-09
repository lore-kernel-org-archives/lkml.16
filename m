Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC31442F4;
	Mon,  9 Jun 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486110; cv=none; b=emZDaq4Jo1fCxqPpSD3KWPf/hrKIUUnlaayVZLvW2lzSG4m6gogZfYKIQPMvDJBxXbKb6DdUPrURL1h4Qg7uXS86ID4yeVfxCKVHyA3HrwjytziNFXuf3hz5SMwWWOx8U/6B5ZdfI6xtSjmWnBKCXpgwVXnxF8wqrRtHYnyKoUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486110; c=relaxed/simple;
	bh=S8W9pKfGD46UcyJiaj63/I+Z7qOZIyuO7ZYLQnyfQtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XszHVItPkmQH6svvrlV8g9qlQzlBx2s4JzkYoASXfucFVnWbH0x58aOkTs8MWW9D8gugah1xt6GwJ70uI8zDCvN0vn+aHKMjYKV3MXECpmBqIGv55RuWL2VaY/2odxNeYdy0bjdYrxuHK793giYW1gLkuEpZTVmXEYD6pJxdwPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT6XvCaD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT6XvCaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749486109; x=1781022109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S8W9pKfGD46UcyJiaj63/I+Z7qOZIyuO7ZYLQnyfQtE=;
  b=TT6XvCaDNvdmul0wYHJtcOSTW+hGQhjJooyqDyp0+ct+4C+mKnjrHV27
   k6xjX0d/vuh6zbHpSx/zWegPhrjHPxKNbuMOlvEBhhz9zlAQf+Tg8AdNc
   viHvw/3nUK3WauuNekcnhh4pn7rYEKVSehabr6EWzxZRYVJo4A7zdj+Os
   EACnez5XkUm1KmNH6rPJ2K9D6fQlWlFs/0ffUxb81umt1/nYufvHvAfBn
   sBi+cSyT2eE4pmmuhAjxslJTud6eM9gsH1ERZ7M29gbm219eR0YB5as2d
   ykuFNiacX0kQoILvM6ZJExYjDa8sSxeWLSjGk5LnXckjr2QDsRHF96vbX
   w==;
X-CSE-ConnectionGUID: ZwGoraQgSDawkfAPlr5nzw==
X-CSE-MsgGUID: ZBF7x5lDTHmgpcy7sF7+mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55234348"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55234348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:21:48 -0700
X-CSE-ConnectionGUID: SHcsAKXJR4GtbEXPSc+MSw==
X-CSE-MsgGUID: GH4bAfNWRUq7o9w9ydzuIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177465788"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:21:47 -0700
From: Tony Luck <tony.luck@intel.com>
To: babu.moger@amd.com
Cc: Xiaojian.Du@amd.com,
	akpm@linux-foundation.org,
	alexandre.chartre@oracle.com,
	andrew.cooper3@citrix.com,
	ardb@kernel.org,
	bmoger@amd.com,
	bp@alien8.de,
	corbet@lwn.net,
	daniel.sneddon@linux.intel.com,
	dave.hansen@linux.intel.com,
	dave.martin@arm.com,
	ebiggers@google.com,
	eranian@google.com,
	fenghuay@nvidia.com,
	gautham.shenoy@amd.com,
	gregkh@linuxfoundation.org,
	hpa@zytor.com,
	james.morse@arm.com,
	jpoimboe@kernel.org,
	kai.huang@intel.com,
	kan.liang@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maciej.wieczor-retman@intel.com,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	paulmck@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	perry.yuan@amd.com,
	peternewman@google.com,
	reinette.chatre@intel.com,
	rostedt@goodmis.org,
	seanjc@google.com,
	sohil.mehta@intel.com,
	tglx@linutronix.de,
	thomas.lendacky@amd.com,
	thuth@redhat.com,
	tony.luck@intel.com,
	x86@kernel.org,
	xiaoyao.li@intel.com,
	xin3.li@intel.com,
	xin@zytor.com
Subject: [PATCH 0/5] Latest version of initial patches in AET series
Date: Mon,  9 Jun 2025 09:21:34 -0700
Message-ID: <20250609162139.91651-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: 00d1f3c0-4d10-43d8-b33d-f9bbeb111613@amd.com
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Babu,

Here's my latest version of those four patches (build on top of Qinyun's
patch that I believe should go upstream via tip/urgent).

I believe I addressed all the comments[1] in these four patches

[1] https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

-Tony

Qinyun Tan (1):
  x86,fs/resctrl: Remove unappropriate references to cacheinfo in the
    resctrl subsystem.

Tony Luck (4):
  x86,fs/resctrl: Consolidate monitor event descriptions
  x86,fs/resctrl: Replace architecture event enabled checks
  x86/resctrl: Remove 'rdt_mon_features' global variable
  x86,fs/resctrl: Prepare for more monitor events

 include/linux/resctrl.h                | 28 +++++---
 include/linux/resctrl_types.h          | 15 ++--
 arch/x86/include/asm/resctrl.h         | 16 -----
 arch/x86/kernel/cpu/resctrl/internal.h |  9 +--
 fs/resctrl/internal.h                  | 17 +++--
 arch/x86/kernel/cpu/resctrl/core.c     | 65 +++++++++--------
 arch/x86/kernel/cpu/resctrl/monitor.c  | 41 +++++------
 fs/resctrl/ctrlmondata.c               | 17 +++--
 fs/resctrl/monitor.c                   | 96 ++++++++++++++------------
 fs/resctrl/rdtgroup.c                  | 79 +++++++++++----------
 10 files changed, 204 insertions(+), 179 deletions(-)

-- 
2.49.0

