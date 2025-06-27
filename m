Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F61E521D;
	Fri, 27 Jun 2025 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060888; cv=none; b=Tem7/AAlHoWNh0R1D1gmhv/uMRsnnP+AN9tVsSjHlRVzed+R+z+oSvC2RcRezw5fDW9ybnOikEjb60MVwTEAfjkyIVgcjLyzY1E/tV0vIqqKOiqm/zRzgKRHiyEAnpX/g52z8hxMjDyaDUF7pbcaCwWrYvf5VeYZpRaqFrOFEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060888; c=relaxed/simple;
	bh=KrT9visr8JuUFyc9dCKnyKiJKRMau3o6/bKp1lg+dTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YlzGo7dZdrU7lnvDtzrmNCfELeBOJyxOd2+jBxH4oFf/h1OsC6URz1VFH7tbId80WmnHfjhR5PFCgyFTU4S7xzgiD1aNEwwZN0e1+8QgaYvAQ/+qX8Vv7HJo9tJ8xAOFk9aaJqUsvjDLqFqoa3b4higowSvPUdYC7cFPcfzEW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgnf6ziA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgnf6ziA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751060887; x=1782596887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KrT9visr8JuUFyc9dCKnyKiJKRMau3o6/bKp1lg+dTE=;
  b=Cgnf6ziAWC3M5VO06/FeJ+DRkJhYPIpB75QgceWwYfyQ9uExIGN7qG67
   peVmEDKkFGQi5+abl98I/0Ofy2dzg9xe1t2eLCVHWtvcbWuleruei9t6J
   bOFiROuUlKT1VPbF0XLmpjrDF0gSqP6JLQcZzI31qH7wi4TBOD47nkzbC
   HrKQS5CVIEFTVmnEqUWSvzWdNa+EldSjMWYX89firdvi63NFM0IPzWUGg
   glSjH7MH9BuWjU+CX/qjt/j/qInKLWH87MZYVoJxGRs33/dXlJ0c9x3Bj
   CYTsZI2EfRMZ2Z+n7nPkLaaG709k7TZ98PSTLjrl0p/a4ewQyElTwp9iy
   Q==;
X-CSE-ConnectionGUID: qcLNqlINQMaK3NI1zXO3dA==
X-CSE-MsgGUID: iPNpC49BRAG6hroHHIO9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53254365"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53254365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:48:05 -0700
X-CSE-ConnectionGUID: dvCZF54UQ+WvtuBXGynaRw==
X-CSE-MsgGUID: aMbgSoumSz+wLZCV6vgFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153625860"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:48:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: early: xhci-dbc: Fix early_ioremap leak
Date: Fri, 27 Jun 2025 14:47:47 -0700
Message-ID: <20250627-xdbc-v1-1-43cc8c317b1b@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250627-xdbc-0fe0b64c9560
X-Mailer: b4 0.15-dev-a7f9c
Content-Transfer-Encoding: 8bit

Using the kernel param earlyprintk=xdbc,keep without proper hardware
setup leads to this:

	[ ] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
	...
	[ ] xhci_dbc:early_xdbc_setup_hardware: failed to setup the connection to host
	...
	[ ] calling  kmemleak_late_init+0x0/0xa0 @ 1
	[ ] kmemleak: Kernel memory leak detector initialized (mem pool available: 14919)
	[ ] kmemleak: Automatic memory scanning thread started
	[ ] initcall kmemleak_late_init+0x0/0xa0 returned 0 after 417 usecs
	[ ] calling  check_early_ioremap_leak+0x0/0x70 @ 1
	[ ] ------------[ cut here ]------------
	[ ] Debug warning: early ioremap leak of 1 areas detected.
	    please boot with early_ioremap_debug and report the dmesg.
	[ ] WARNING: CPU: 11 PID: 1 at mm/early_ioremap.c:90 check_early_ioremap_leak+0x4e/0x70

When early_xdbc_setup_hardware() fails, make sure to call
early_iounmap() since xdbc_init() won't handle it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/usb/early/xhci-dbc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 341408410ed93..41118bba91978 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -681,6 +681,10 @@ int __init early_xdbc_setup_hardware(void)
 
 		xdbc.table_base = NULL;
 		xdbc.out_buf = NULL;
+
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		xdbc.xhci_base = NULL;
+		xdbc.xhci_length = 0;
 	}
 
 	return ret;



