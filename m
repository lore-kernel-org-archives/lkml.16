Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D731A5BAD;
	Wed, 21 May 2025 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747869170; cv=none; b=HKeREFkBVve9WeY+dobx8H7D90/fpcoluSh7ibmWZTPmfXkkbGbYAuYmz6rtPTi83LZxghSHcxX2wdjTkWn4EF4sislAxIIWz1MDBZuRdlewZQF63+HgjbhmGi0/7CWabfS+63sZUW8hX5KNcUHNYnJHblpzaMHqMpz3GOKkE00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747869170; c=relaxed/simple;
	bh=SzseE/GOp9/4sPYk2ZOvtO1euTONkwHI48EPU5s5EgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivV3bmJYQZNH/lWrHhXFd9RDFJlIg8hasbFwkBeqyZTMr+UxTCicSlvEQYIGyvNJwrbU4nu2zFS4KsrgCAc49bC1pCP+Ror44IGD1c0kTcS3vHUShwCZTaiS8qiX6muugHKxHaFQZY1dxQ5KiYU2/JtTSSWYMZIP1wK+bBlHCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmAzq0gY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmAzq0gY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747869168; x=1779405168;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SzseE/GOp9/4sPYk2ZOvtO1euTONkwHI48EPU5s5EgA=;
  b=CmAzq0gYrTfv6FtfojLi+n3myzK62v6Bb0F9+QQWBJM7oeF+/1mqo9ra
   5feoGf28WHHursjtuzIJqwDwU9WVTkWTDQhSPoLVHBLkbd26wBHknRBm7
   6YRHY+O1Xo8VJKci0LLbF7Du9NO5ZhP1g1QQhLuTD0JuUEm4Ofdofspz/
   tLxVIT//+J+Zr9jeQlM96CUh9CkYruOfdc+a708WEpmc9SHyH7jWpfsMd
   2WFD1+asdj9ldOpMCWrPFhIxmScVGZ8iZoUmY1m33nCJW83wlGzLQmfa7
   jHvr2v/rwX+v5w7+ucTckp+5naYUC93kPglg5hpFJ9U4jvOSvdus0Lroz
   Q==;
X-CSE-ConnectionGUID: hJM1UmFgRxCGi9Hic3aICw==
X-CSE-MsgGUID: IFS2tFKuQrOyfw9y7Dr5Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49973431"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49973431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:12:47 -0700
X-CSE-ConnectionGUID: WoYKJzgbQ+SqtSywhYGDig==
X-CSE-MsgGUID: 5JensFr+TOuPHAbR1T+tXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145024119"
Received: from dev.sc.intel.com ([172.25.103.134])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:12:47 -0700
From: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
To: dave.jiang@intel.com,
	vinicius.gomes@intel.com,
	fenghuay@nvidia.com,
	vkoul@kernel.org
Cc: anil.s.keshavamurthy@intel.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: idxd: Fix warning for deadcode.deadstore
Date: Wed, 21 May 2025 19:13:31 -0400
Message-ID: <20250521231331.889204-1-anil.s.keshavamurthy@intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deletes the  second initialization as the value stored to 'dev' during
its initialization (struct device *dev = &idxd->pdev->dev;) is
sufficient.

../drivers/dma/idxd/init.c:988:17: warning: Value stored to 'dev' during
its initialization is never read [deadcode.DeadStores]
  988 |         struct device *dev = &idxd->pdev->dev;
      |                        ^~~   ~~~~~~~~~~~~~~~~

Signed-off-by: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
---
 drivers/dma/idxd/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index fca1d2924999..b7664136fc67 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -989,7 +989,6 @@ static void idxd_reset_prepare(struct pci_dev *pdev)
 	const char *idxd_name;
 	int rc;
 
-	dev = &idxd->pdev->dev;
 	idxd_name = dev_name(idxd_confdev(idxd));
 
 	struct idxd_saved_states *idxd_saved __free(kfree) =
-- 
2.47.1

