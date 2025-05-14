Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0B1482E7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225587; cv=none; b=qH47OVLi/XqxPPcKdWWXiad4W7vvu7GmDxUYQ/8/2HTc19oNjl8FMs0QWKVG3hxup273BXDAUR6AM2k+DlV/IdVz/l8hSJMmFkGEWXxHd8VAFKzRqKoXEtaMFPZ7BrCg/SHNZtLwGPDFCi5HS5qjtN5Z9uNk2X49UE+KzgPMuW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225587; c=relaxed/simple;
	bh=JRz6gtjfi0l3nijbVi6JBY+F/cMu/h74UnfdiiyRKmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eQFeueszOqDxXzKNx7Ixw7rQINT4yuqBdbhE+nxzOMGJxWq+pX9j1qTwob1BEmPNS2YOBXGnYMz9ytOX5XtTT1ORK2nANh3HES3dku3vRVZ0sxYMNyKik1JSJ89dw0IE17KoAMZIEJArxhHyU6LQMEbtqvaxh/bf+TgcBC5CyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlacQYgg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlacQYgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747225586; x=1778761586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JRz6gtjfi0l3nijbVi6JBY+F/cMu/h74UnfdiiyRKmE=;
  b=PlacQYggWuSIUXUuDGML+6GsstDgYiFUPdI5D+4FsCu53lNkkKfENYyX
   lfILBB4HuxV278JuRJeOjuf6UiXU272iOqYPGR7COmgTRK7drKjNXg+ZJ
   n1wBIDzKN0yfMTPy4UWPCd2xIepmMcTEjkNRXfRNr/CG0mx7MvDkmGVFq
   qoKdZubyxElUC1VeS4/jWs4O7JRNyotQDN3JiegW+OCwkq0/ybZ8b68Wm
   Xtv4R/4JN1JhbOpDSDgwsIfckqGXlSZSphTAZg22eKPMGdrHv4Rll/lZc
   9bVNUiKxwd6rSbSm3cd94VN54WbwVc3WtLob+4dzhMUi1o1uqskEUtspf
   Q==;
X-CSE-ConnectionGUID: Wo1Er8viTAmSbj2cxw62Ag==
X-CSE-MsgGUID: u+vUrjkfSHqaAvSunRDUyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49098832"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49098832"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:26:25 -0700
X-CSE-ConnectionGUID: 6Shu7YU0S+C0THiBI0X0Zw==
X-CSE-MsgGUID: MtY9h327SZ6SmrL8BYR+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="137946702"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2025 05:26:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	lee@kernel.org,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/2] Auxiliary device support for MFD
Date: Wed, 14 May 2025 17:54:30 +0530
Message-Id: <20250514122432.4019606-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds auxiliary child device support for discoverable MFD and
as a prerequisite, introduces auxiliary device specific resource APIs to
to allow independent resource management.

v2: Introduce a shared struct mfd_aux_device
    Introduce auxiliary device opt-in flag (Greg)

v3: Fix device_type ABI breakage (Andy)
    Aesthetic adjustments (Andy)

v4: s/mfd_aux/maux
    Allow num_resources for child device (Andy)
    Fix build warning (Andy)

v5: Move resource() helpers from MFD to auxiliary subsystem (Lee)

Raag Jadav (2):
  driver core: auxiliary bus: Introduce auxiliary device resource
    management
  mfd: core: Support auxiliary device

 drivers/base/auxiliary.c      | 145 ++++++++++++++++++++++++++
 drivers/mfd/Kconfig           |   2 +-
 drivers/mfd/mfd-core.c        | 185 +++++++++++++++++++++++++---------
 include/linux/auxiliary_bus.h |  18 ++++
 include/linux/mfd/core.h      |   3 +
 5 files changed, 305 insertions(+), 48 deletions(-)

-- 
2.34.1

