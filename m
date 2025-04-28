Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC828BA8A;
	Mon, 28 Apr 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859813; cv=none; b=ggl1mR9aWOvLMhwMuJA1Ak/MamaoIiaVytQMGGwQsmuqXGMCQf5QpCDF/TvTcbRSsIQWR4UGiV+zFiFdBt81wTLNytjX/n9vgl+89Zw9Xj8iRFyGtUYdXLxiH58MN4e13fkbnSN4kpNOpVg3ZKOmdCcvS3r82Hnwnfna6kd9pFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859813; c=relaxed/simple;
	bh=3NyzGHI0Yu5Pn9IcjSsWG3teBLgkWEFF8HiBKretWI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjpgT47Iy4y7d2DDT0d3xpNdBDqxPgGrTsZzd0wiFqa6mT5zemHJQKthvb0FMAgw/XUejddGItRQ/nsT0OVI/bMBSAAoLY8C8wAAdM/UsC6QrID5ubr0ZQHMqV7Q+qft7aSbm66Et2IDagecnjnnjn/HkU+ztjQe4OgEg8iar9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bft7YcrI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bft7YcrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745859811; x=1777395811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3NyzGHI0Yu5Pn9IcjSsWG3teBLgkWEFF8HiBKretWI0=;
  b=Bft7YcrIInHiwO5PHP3OjcXKX0do0mpnArKprKsg5FrlJ92CL2w6WBcc
   l8LnHtgT5Tk7BICMKcKlIBLDW+aDbqy34b+yyK4XBQE0ms9ntokGRjNWK
   FLVyVE2YYw2R1Sor6TRnoJ9nstrlUPhTTZK4zDX/1H2Yb8c306NxuK+N5
   WgPldsgk1oWItpNEULjhfyrsfc/EDdRXDs5/9BzK/TKKjRbajBNXYed8m
   iegR3kbpPpKpiYV01dvNApBsgDSqgeNhC7cs8mwST32S9fgZC45OvRFwn
   opK4WyY1LXfx6s5xir7d9ScJOYy6VJeX+mg9QgHY1fiIQMzZr1k/VeoOL
   w==;
X-CSE-ConnectionGUID: 7nj+yKINTDmCr2Vu88F/lA==
X-CSE-MsgGUID: IOpbfcC/RVicj6Qll4DiyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58111434"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="58111434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 10:03:25 -0700
X-CSE-ConnectionGUID: xa3gxVrOSw+TPdKlQRQ81A==
X-CSE-MsgGUID: deAUh0DvSZGmgMmW3FjmQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133309594"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2025 10:03:25 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/5] intel-uncore-freq: Add agent_types and die_id attributes
Date: Mon, 28 Apr 2025 10:03:11 -0700
Message-ID: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
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

v2:
In patch 5/5 fix grammar as reported by Alok Tiwari

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

