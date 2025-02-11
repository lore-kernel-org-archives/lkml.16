Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79166262175
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299855; cv=none; b=naMtLI9aR6IIwKVOX0VCINhtatHApQw7trLxTcG7MY3U141CrnoCKSl1lIG2NJNCZJEQ+IyNoDxxxoX0WGNkmagGLbKycKriQ+WgxZuP0nwcrNR5Alq/3joLXYFdYEhGJtwh8fcUva933Ax+VcoH5uv3EGlRTpCiPRvyGfJ+2r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299855; c=relaxed/simple;
	bh=kyDm0PTrKtGkLlMNu0FPB29JJtDL74GPskH5mAi0zBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dY3X1zumveLOSj5AYxzFzJIKalychwsN7rS/QjpOWbyRWcTxe1TCTcjZomWINzGpbrZgrKvEAGjK8lO2cSnhw2WJY3b5fOMP5+zQ7unF3UOJLnHUnlFURtMy0kfXvHUPhDdz7HUTeOzaNqYKBA1Bw95ouR8j/ELI7w3O8kKHK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6G8IcZV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6G8IcZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299853; x=1770835853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kyDm0PTrKtGkLlMNu0FPB29JJtDL74GPskH5mAi0zBY=;
  b=E6G8IcZV7O2ic/mfU0nIVKUckssS3JZ6Z5yl0StNZurvV6aKphHGS7m1
   JycIDaVGDqd/3ZBqQj3kNXxYFHtyw2CtrjVsdFt5CbjY0y+N+O3r5Bt7B
   IQJDKponrKxC5dDEtZvU9oIISxeV6pySsH8AypdQ/xEvfVQnjlLx9JCjj
   tb64Ghdh44zNYGwh4XQ05HQ5BrW1JJkhZ+IjzmigukylaRg3FZk2wgyti
   xH2veXmc+O0Gf2S16QhxVk4evS2q8KDBOdILeEi28oHlwmifSabFDXTXl
   M2GPQt74bprZk3jR+CjPHSAm57uTo0k0hS0wMRcx1hzJb4aABwGlyxzT5
   A==;
X-CSE-ConnectionGUID: AJCTvHTqQXmQEiqKD7UBaA==
X-CSE-MsgGUID: 2M8zsC0XQES5cmqbTrAONA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57345434"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57345434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:50:53 -0800
X-CSE-ConnectionGUID: RDEdeHgiRwCDYIkVG4rr0g==
X-CSE-MsgGUID: Cm5PZ908ShShACozo4NYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149780206"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 10:50:52 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [PATCH 0/5] intel_th: Fixes for v6.14
Date: Tue, 11 Feb 2025 20:50:12 +0200
Message-ID: <20250211185017.1759193-1-alexander.shishkin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here are 5 patches that I'd like to get into this cycle; 3 are new PCI
IDs and 2 are kernel-doc warning fixes. Please take a look and consider
applying.

Alexander Shishkin (3):
  intel_th: msu: Fix less trivial kernel-doc warnings
  intel_th: pci: Add Panther Lake-H support
  intel_th: pci: Add Panther Lake-P/U support

Andy Shevchenko (1):
  intel_th: msu: Fix kernel-doc warnings

Pawel Chmielewski (1):
  intel_th: pci: Add Arrow Lake support

 drivers/hwtracing/intel_th/msu.c | 13 +++++++++++--
 drivers/hwtracing/intel_th/pci.c | 15 +++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.47.2

