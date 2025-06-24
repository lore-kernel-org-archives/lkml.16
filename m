Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D801F3B9E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763919; cv=none; b=cTVHHbi9vI3yFKRX8fZy3HINNx4LM+6KzjShPJX2xI+vQqpQWZA8nT3PJb4A/3hZuV3GKnXt3Mwtc8vVZgVRy6C4QBugKvozpU4i66elbyp8SpB/ZxwpxoicntRom2CsABY8O5B8SrMv/wyjCuKi3ZS+YQJG7ygRWiPizoH+0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763919; c=relaxed/simple;
	bh=1ap+QjOY8hp1HnLTsr/YMx4rqJ5F5CXHENt+R0rpaes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFd8bE2Gh8I4gVdCJOXsn2WunjuWb2t2qXmlNg4HZztfZogckdf6Xh/mShBlNY2QbKQjBliFfhVaF9VqmHXwAMAljLScyl11Ky2wYqK41DRW8c+yCCBFEyHsZauTscrMJzT3J7NmjWQHghGnnzVKO8sT2aLkX6BT7X4G2pkUAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maM7tyZJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maM7tyZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750763918; x=1782299918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1ap+QjOY8hp1HnLTsr/YMx4rqJ5F5CXHENt+R0rpaes=;
  b=maM7tyZJa8fupRGfLc9gGQiX/YgaNbr8tZR3XW8oY9K525HG25IUFWIm
   Bvxi4d3cjMYjrH5NVJtj2pZCKq4LqHly7JGaYFmJJ2o7Zl+KY2f48XVwo
   IdlKSWssPnn8PA4BVcnn7eEcjqRyNQJRSk6A1uNFWXF8WwHM5flXgAQzz
   aFuPfR8dSPOEFe2IZZnMYmvdpW7Qwk/XtRXc+icyuFEny37UX27A208wj
   n5M8Cohs+olkQZX8shcH/3Z52AuBbi8PxDTOfQ53BEQdOGfB4h7m0BHOP
   pZy119u8lIP24admnkHE0M3BCnZsNWAsvC4J+f3J6gYWap8T1PAoPQnGC
   g==;
X-CSE-ConnectionGUID: wlW6ONX9QM2zSVlbZM7HBA==
X-CSE-MsgGUID: P2zN6/1USxmG9OqZsrOECQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53136036"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53136036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:18:38 -0700
X-CSE-ConnectionGUID: xYKLToauRQKMjPuCh/RVUg==
X-CSE-MsgGUID: g/95QdzwTCGqHo5A/I1WzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="175488488"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:18:36 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next v2] mei: bus: fix device leak
Date: Tue, 24 Jun 2025 14:05:20 +0300
Message-ID: <20250624110520.1403597-1-alexander.usyskin@intel.com>
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

Fixes: 6009595a66e4 ("mei: bus: link client devices instead of host clients")
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

