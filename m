Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8522877D9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241362; cv=none; b=YbS6xbjTgczqxtAaanx3DwbU+vaIyw0eEwTivJESYk4dg56ZaTttDLdVsB4eBwtvTNnNP5o66Pp858jF81uxkvFtZSxKh/8Kx0hxojujwQd4UoUqBNuHF70gNmed/6V6Pjl9jtC4c1VZ7qTvM8UeGzVk/1W+WvvgA2VUNsdnvJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241362; c=relaxed/simple;
	bh=8aJBHTaoDwbPr+X9duP3A0ddPan1c4bJ9DT1hCoqjF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GR12ttjPvUXzzqPyNWVSSew7NkTZLUBAcPHnFvHwCj7TCjd6rJEcgmkrLEqpZJ6jR6/32ouHpA9zQhWVxOkpzPEYKZ72YypkZEst/X3r2xL+ctioKI7v+XTwJ8cwKFE8gyKvyPz0jcy+kMqdUtU+wNL+Al5UQOfcJaVH36lqAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKUcom2R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKUcom2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750241361; x=1781777361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8aJBHTaoDwbPr+X9duP3A0ddPan1c4bJ9DT1hCoqjF8=;
  b=NKUcom2RFSiJ6FTBMBTDakSkTEsZEs8AWVM7rFX+d5nHUyhBgqlGfImE
   oIATziK4Cn52bWlEDvs2E6ucxfH2iWsm0EE+H+91VbyoVgDvSHeVSucdv
   NxGzc/ZY1wm4gPMNe+a7Xvr1yQnL66Mupafcf7oOHoTI1YN7qSqIqe+L3
   rUcgZ6gudR3kHRU5yx9nM/gCdSjGWdynIGeeH6Ug8PvHU0uIRM8jAYHkd
   8pZqCVjyQuGISc88w1PQCNlSFX/YJKGkHVUHBkO3LqKSqA2sItieGrOFn
   e+Hr2MIJI07CJtq9rSzdmhvDzkKvkAjnVFlPb5ZVnwpTIz2OyHPLdcuPs
   g==;
X-CSE-ConnectionGUID: yfHYi5QjQyq5FtzTEEtThA==
X-CSE-MsgGUID: Y4UM5nUBSeqRfbY5C7Mxzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52591011"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52591011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:10 -0700
X-CSE-ConnectionGUID: Lc2DfxmERHWb0PFOl04oeA==
X-CSE-MsgGUID: 8CAy3dduRJKbPjJehl/w4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149461238"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:09 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next 2/3] mei: set parent for char device
Date: Wed, 18 Jun 2025 12:54:32 +0300
Message-ID: <20250618095433.3943546-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618095433.3943546-1-alexander.usyskin@intel.com>
References: <20250618095433.3943546-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connect char device to parent device to avoid
parent device unload while char device is
still held open by user-space.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 03898246ab16..c160703d0782 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -1229,6 +1229,7 @@ int mei_register(struct mei_device *dev, struct device *parent)
 	devno = MKDEV(MAJOR(mei_devt), dev->minor);
 	cdev_init(&dev->cdev, &mei_fops);
 	dev->cdev.owner = parent->driver->owner;
+	cdev_set_parent(&dev->cdev, &parent->kobj);
 
 	/* Add the device */
 	ret = cdev_add(&dev->cdev, devno, 1);
-- 
2.43.0

