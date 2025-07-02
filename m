Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A38482F2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417914; cv=none; b=XgXrMj+IaVZWSBPzzVIA3lFCWT7Y43Y0o8oy4usGLh+PRAOigB0FV9H1x4ZiAhSTx7EPNcwu1X9ZuBryi4uHE5hJfyhwdyXit9JC3ofRdrGbNhUYUBLAaX/6LQURvJtL7jDhHVhjkbEjf84dYjevPPvqQmeOIvcZn+odjXE7els=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417914; c=relaxed/simple;
	bh=g65gumUQfZ8kgOdiv2LMg63fItTV1vT54Qwnc+0Aczc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epD1YlOcePJ5fcwxzpcBxTvNpPqtH57uw/CIcIbB78LWp5x3jXbXBFwlvakJCW8SGfNr8pFgcGnKzVhOr+Eez7U47SdIeLAT0GQzPd91VfS2QL8Omsb9lr7yqiSES22R+s+W25/g1+qFSPlI5XcR3sUwLQXa5XYxrtk9P7zQSAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=eiVVAApb; arc=none smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="eiVVAApb"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1751417913; x=1782953913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g65gumUQfZ8kgOdiv2LMg63fItTV1vT54Qwnc+0Aczc=;
  b=eiVVAApbevJZ8KVI1VAPy0f4WPrDLddz2bKW77aI6Gfpo9rU8jZYmRQA
   pI+WQfsx4ifieVyboM3ef9pbDj0u+9cqwgAmXcw4CKjkotUgMn3HnnmO/
   j4R9pdCSyylD5r27yafJ9XSzXuvvNmu54F1wWFMJ1sQWgl6XPuNVAXYPc
   GSVeNp19FwLFuR07kvdMoCoicIdpHdDBhS/aWqI+cRN68kUKwBzX049r2
   QM961Xjnkj6WiPJZIhIMq5pqqmex+awB2bAwFeJ1cduTf2bbFx7yiPtPl
   GZJ/OIrTw7v23L+CTXQVwY1R+csSNTdoASc57r5wl9iJCJmsmr+Io+b7y
   g==;
X-CSE-ConnectionGUID: GYUOnNPSToiZmjHNfqXx3A==
X-CSE-MsgGUID: Q15XlPxPS/mfbBdIHlP2rQ==
X-IronPort-AV: E=Sophos;i="6.16,280,1744041600"; 
   d="scan'208";a="85608346"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2025 08:58:31 +0800
IronPort-SDR: 686475ad_bkArkAOOVtIgggta6S2MiIc+E6sodQ8Lfh5KkHv3od4SEFb
 ExXKOKDqVszLyRd0+sExrK1kUg0j9YRtz7NQVdw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 16:56:29 -0700
WDCIronportException: Internal
Received: from ros-3.wdc.com ([10.23.145.79])
  by uls-op-cesaip01.wdc.com with ESMTP; 01 Jul 2025 17:58:32 -0700
From: Kamaljit Singh <kamaljit.singh1@wdc.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	kamaljit.singh1@wdc.com
Subject: [PATCH v2 2/3] nvme: prevent admin controller from smart log fetch (LID 2)
Date: Tue,  1 Jul 2025 17:58:28 -0700
Message-ID: <20250702005830.889217-3-kamaljit.singh1@wdc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to a discovery ctrl, prevent an admin-ctrl from getting a smart
log. LID 2 is optional for admin controllers to support.

In the future when support for the newly added LID=0 (supported log
pages) is added, GLP accesses can be made smarter by basing such calls
on response from LID=0 reads.

Reference: NVMe Base rev 2.2, sec 3.1.3.5, fig 31.

Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
---
 drivers/nvme/host/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a1155fb8d5be..c310634e75f3 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3705,7 +3705,7 @@ int nvme_init_ctrl_finish(struct nvme_ctrl *ctrl, bool was_suspended)
 
 	nvme_configure_opal(ctrl, was_suspended);
 
-	if (!ctrl->identified && !nvme_discovery_ctrl(ctrl)) {
+	if (!ctrl->identified && !nvme_discovery_ctrl(ctrl) && !nvme_admin_ctrl(ctrl)) {
 		/*
 		 * Do not return errors unless we are in a controller reset,
 		 * the controller works perfectly fine without hwmon.
-- 
2.43.0

