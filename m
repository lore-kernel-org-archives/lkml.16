Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6E25CC54;
	Tue, 22 Apr 2025 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357686; cv=none; b=MqdFlD385FOBVysM8GxKjRzqyw1bJVilzZbndwdEObCrQBrONM2TP2ictymTwcXlXERaIWdHxhcJ6vVrhVi8rxmP2qZkkj5rXMHmZFgS2yl3VMT1PKSniRuXRjGAzzzEeG3yaiVNcaz2HZr/kc7uRWlzznnAY24aRI7XiYoFgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357686; c=relaxed/simple;
	bh=jyjeQnJ0O2WuI0gKxcdb0KXCGDP/1YD/gsJSDhxXty4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsvYbwcm4x+Zon4Bd9LZLNC2C2OkLsab5LiyUHDApQeKspn5y6dBdDtYRo+TIslUyzWa8aCMu/Or+DihTYWTbcDUElZ+COEZ+BcCyF7AtUNFNE7gh65TRefbQAPlHfyD46IQ0azYqjd8UHp1pFJLa+84ODf3ri1UWsVNI/DE9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/VB0O3E; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/VB0O3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745357684; x=1776893684;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jyjeQnJ0O2WuI0gKxcdb0KXCGDP/1YD/gsJSDhxXty4=;
  b=W/VB0O3ETpjL8Jin0TITwXTpgN27DILXzh5XyAcZDgsdpRyqc6HQ7mix
   D6/4ZSclQbs/MV6tCjI886kxr26tczsOT8lO6pQHm+XZLWZN6sIAFGNUt
   M6lcfae132DXUngyCOYKF4HZH5K/sOlnL7x0WdvJl0hLTSGOKwjaczvX4
   gzirhtczHnKgtzNcWLqjwDbhz9wE2j+CBt3AY22lGslFa52mRFT6BWXvx
   ljgm5Er3hPc3gzq3x0IiUMmZIdJFCly6P69XC5C/6GFWHEWkBXeg/V9lZ
   Iefaqas2YhOOknJffawaE4Fb53bEPxbQtLW7sKb0zgkLLS2HTd/RCNHw2
   g==;
X-CSE-ConnectionGUID: LMfKPAvTSH+MSS1sPHUXAA==
X-CSE-MsgGUID: 6Rng6ICTSreyNWzNXD/4rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46053985"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46053985"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 14:34:43 -0700
X-CSE-ConnectionGUID: VQP00nAoTxmKAhcM4IWyxQ==
X-CSE-MsgGUID: IILVZBlSQKq41sANahvCTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="133070682"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2025 14:34:43 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/5] intel-uncore-freq: Add agent_types and die_id attributes
Date: Tue, 22 Apr 2025 14:34:22 -0700
Message-ID: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two new attributes, so that orchestration software like Kubernetes can
target specific dies and agents for uncore frequency control.

Srinivas Pandruvada (5):
  platform/x86/intel-uncore-freq: Add attributes to show agent types
  Documentation: admin-guide: pm: Add documentation for agent_types
  platform/x86/intel: power-domains: Add interface to get Linux die ID
  platform/x86/intel-uncore-freq: Add attributes to show die_id
  Documentation: admin-guide: pm: Add documentation for die_id

 .../pm/intel_uncore_frequency_scaling.rst     | 10 ++++
 .../platform/x86/intel/tpmi_power_domains.c   | 34 +++++++++--
 .../platform/x86/intel/tpmi_power_domains.h   |  1 +
 .../uncore-frequency-common.c                 | 31 ++++++++++
 .../uncore-frequency-common.h                 | 19 ++++++-
 .../uncore-frequency/uncore-frequency-tpmi.c  | 56 +++++++++++++++++++
 6 files changed, 146 insertions(+), 5 deletions(-)

-- 
2.48.1

