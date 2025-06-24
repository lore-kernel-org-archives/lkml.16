Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35D252906
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750120; cv=none; b=tP6xuP/eXeawcAMNgArVEmnmWfx1FMLOpkdkIxIh6zuS4V9hTU6GiLH4XqUZl03bMfJ0074NEuT0k2Qaz2MIUm2Wp1sVEXPVGFGnx+Mn8ncjTqLksxPs2yA2Wo4AVb454JxpVJO8Ht0/tiswC0O/At9F+JsbwWTscmcH2HIsc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750120; c=relaxed/simple;
	bh=TtfC8PQ5NJ7veeU9guOOT4owM20qjxMZAt56llMj1Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWsJsVDm3M08g95/U6BA98O29yThDlYGCnSdYzpzJIAwQwbGEJAoI/Yk8fSO+TqBFRjJOa8nt6C/niHycyAdDcawbfC1Jk4oVbTCursuYFezFeHniwE2SI/TtTn3KrqYvMPgVP1yIsymfAC/FuS0pis2oWB98gE1SBrb6usatxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKeXnPms; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKeXnPms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750750120; x=1782286120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TtfC8PQ5NJ7veeU9guOOT4owM20qjxMZAt56llMj1Xw=;
  b=aKeXnPmsXBdciHjO4Oa12j7rAmDexy0MzooiIo+lzOIMW2O2BFk+Wk/u
   76x+iMbDicGHoxnzt+tCI+TkLTWBZQ/Djr16pVPj7ZnhSyivrftlJxisy
   51HI6mRT+Lsc6LseahsPZxpzHlxGfeuu16lG7wrpdjZ2df69vVC+lPdnU
   JPXZOA/EhGPOlwVbfyPQecAVD03Gq8YkR35mKR4i0Tvl7rFgbS/nWLunV
   vH7b3/xu2IikkEW4Xdlg3x9bS87AwO6/VrZkPKxnt9iTjDqeYgNTYRkuI
   Ow7Wnlp7h4PyUGSNyWlfRQQoMfqtfo1brZL+1W+dp2BARAeZU0Zu3uF2c
   A==;
X-CSE-ConnectionGUID: ltj9rdKrRUiLruy+0FLFBg==
X-CSE-MsgGUID: od6NDZkrRMCl7Wt/2V3ZcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53067734"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53067734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:28:39 -0700
X-CSE-ConnectionGUID: D+4ixqVxQjiaEtGvPBM4fw==
X-CSE-MsgGUID: xAQVapMkT0OUnaP4a4b1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152540689"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:28:37 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next] mei: bus: fix device leak
Date: Tue, 24 Jun 2025 10:15:21 +0300
Message-ID: <20250624071521.1281436-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus rescan function creates bus devices for all clients.
The fixup routine is executed on all devices, unneeded
devices are removed and fully initialized once set
is_added flag to 1.

If link to firmware is reset right after all devices are
initialized, but before fixup is executed, the rescan tries
to remove devices.
The is_added flag is not set and the mei_cl_bus_dev_destroy
returns prematurely.
Allow to clean up device when is_added flag is unset to
account for above scenario.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/bus.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..f2e5d550c6b4 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -1430,17 +1430,14 @@ static void mei_cl_bus_dev_stop(struct mei_cl_device *cldev)
  */
 static void mei_cl_bus_dev_destroy(struct mei_cl_device *cldev)
 {
-
 	WARN_ON(!mutex_is_locked(&cldev->bus->cl_bus_lock));
 
-	if (!cldev->is_added)
-		return;
-
-	device_del(&cldev->dev);
+	if (cldev->is_added) {
+		device_del(&cldev->dev);
+		cldev->is_added = 0;
+	}
 
 	list_del_init(&cldev->bus_list);
-
-	cldev->is_added = 0;
 	put_device(&cldev->dev);
 }
 
-- 
2.43.0

