Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0B28373;
	Thu,  8 May 2025 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745375; cv=none; b=HWFLnP8loB1DKpmCvKmHfpQxWzHKCDR4WS6sNrfoD3ZgKFFIQhutLgPlhbhRSaMgHN6Pu0gxQhyOzv4o2zl07vJsT3ZMr8cuv/97H3JOlju+SsJRIs3mDCp4ERmwh00yOrYGTbpSGgX8anJP9THqo7IIqY8MX0qsHO342b6E6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745375; c=relaxed/simple;
	bh=gJWXUSndmVl17E9Y2XjPcpnu1BbAJjZMWMv8Wn7btwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNQ+UHP4LkwjEeXC185J4uTKSTI6jwLPkUs4843HcskNmORwxWGBMiETas2eVKwy41XsCfmEOY6GolCgycuCTiPCemNgXrocJ4BrENSv55vz6MJrGPVi+vb/+aVJwb8Oihf+6zBjNHyzizcywhi5QKGXxP0sxZ+nuR8NsvM++LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzXBNlWk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzXBNlWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745374; x=1778281374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gJWXUSndmVl17E9Y2XjPcpnu1BbAJjZMWMv8Wn7btwg=;
  b=XzXBNlWk0umolIKurcm04G5EToKkiVW6qC0Wb36uFbrfJLvG9j/RxM9R
   0SIOO3dPDkwEKoObWvxFjU5BNcUqrnS0/O25CAd9NUxvjfVJLAzOgEsE7
   UQQR4aOY4TMs06mEz8JFro/hfw8X6rQPyVh0EgCwtqoUFbvKMwT9NBYQE
   5ZJiyD87p+aXZgbNXr9MVZd5WS06rIm0JdPt0SFsMOJXoGCMT4xF543Zs
   HDcxrD2y+BvzJinwY+vOSxnnS62JV12fKmpv7ndMdW2gyMxLLXTQIeIYj
   pZFyrxZDirO55oW72CArjqgh+oxnh4rMIruJ9+VT+DMY5yl1lLI69RIU2
   w==;
X-CSE-ConnectionGUID: TDyo2Y4DQd+K9SOVMwbZ8Q==
X-CSE-MsgGUID: ejMedFMPQ7qcNvhyeemnmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59552592"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59552592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:02:54 -0700
X-CSE-ConnectionGUID: 69lszKMiQ3yJOV5I4+xNRg==
X-CSE-MsgGUID: 2b7/HwreSfuCnASo2eFlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136931250"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 16:02:53 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 0/5] intel-uncore-freq: Add agent_types and die_id attributes
Date: Thu,  8 May 2025 16:02:37 -0700
Message-ID: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
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

v3:
Patch 1/5 has changes to change to loops

v2:
In patch 5/5 fix grammar as reported by Alok Tiwari

Srinivas Pandruvada (5):
  platform/x86/intel-uncore-freq: Add attributes to show agent types
  Documentation: admin-guide: pm: Add documentation for agent_types
  platform/x86/intel: power-domains: Add interface to get Linux die ID
  platform/x86/intel-uncore-freq: Add attributes to show die_id
  Documentation: admin-guide: pm: Add documentation for die_id

 .../pm/intel_uncore_frequency_scaling.rst     | 10 ++++
 .../platform/x86/intel/tpmi_power_domains.c   | 34 +++++++++++--
 .../platform/x86/intel/tpmi_power_domains.h   |  1 +
 .../uncore-frequency-common.c                 | 34 +++++++++++++
 .../uncore-frequency-common.h                 | 20 +++++++-
 .../uncore-frequency/uncore-frequency-tpmi.c  | 49 +++++++++++++++++++
 6 files changed, 143 insertions(+), 5 deletions(-)

-- 
2.49.0

