Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331160B8A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417913; cv=none; b=mh076EGJZLxO69ycQxWbJ1sfItg31lyhFYUITCLD2imGluG9eSXtPo3Z0INmqpPB8bq+jSNfsLz29RYIsoXUhQM7p6tGS18seSlC9rJHN2/muiIIKnWdoJxbjyudefMs9C4RhXkh6T6H2s6HIeTE7kM9eD6ET38LJA73HGothOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417913; c=relaxed/simple;
	bh=n42XEmlwI9c+//NMG8q8fg4flyY6Xnx1t5tK0abhNT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JG7DevR/hf4OLIlJjFYvYb/dgQk4CuLwkxkJ491XV23SCvJRF2Hkci3TT/WeKRtA7H6Nr23eLKiddxeBYUY4ux4EdgMEzd1inthsegYBAsr2rY9wsSiObMizew9gceKsiwHja3KnqMtJp3/ZD2xYKbyHb3KunsYttHbQrqRLntM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=B98D6JKw; arc=none smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="B98D6JKw"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1751417911; x=1782953911;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n42XEmlwI9c+//NMG8q8fg4flyY6Xnx1t5tK0abhNT4=;
  b=B98D6JKwGuLtU52QIBpNbmMNcSFQJucYnPW20gmFdCf94MdTXqNWlYR8
   WJmykF39s9ID+v7WvgoP1WgEhxRz7hlB0GRxvvw3DFBfti35U9sJzAYcv
   8bRYhhvLilkLBz0GxWLjzf6IUywL5Q1b0pknhePELW+np3Hj2ORP7RwH3
   nkt28JfClAgWl3D0FvyWhcKZE27OGJzTi14dZ1koVh1rwCMCGIIrWOfxF
   1NxJ7HEyuLrbRPT5KreahltUBCm0hHfv6hf2hbIcNFBwAFjhfKodkdrDV
   4E1gcSatevbtC6CPvXvIaImyV0+nE3rQkxZ4+QwcBdDkhOzKh93J7Bm65
   A==;
X-CSE-ConnectionGUID: pg3dfwkoR0izrxg2MAp9Jw==
X-CSE-MsgGUID: sSYHyNVQQH2KDp7ak8vy3g==
X-IronPort-AV: E=Sophos;i="6.16,280,1744041600"; 
   d="scan'208";a="85608344"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2025 08:58:30 +0800
IronPort-SDR: 686475ac_1sz6cVN+I6UX6Uu2U8M7tWaTQEB9zGp6Yu8g5SRdjpKCMiV
 Y1JLSruaNoHfbgbstDgTTwjqLxI1KBPqdXKGvYg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 16:56:28 -0700
WDCIronportException: Internal
Received: from ros-3.wdc.com ([10.23.145.79])
  by uls-op-cesaip01.wdc.com with ESMTP; 01 Jul 2025 17:58:31 -0700
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
Subject: [PATCH v2 0/3] Support for Administrative Controllers
Date: Tue,  1 Jul 2025 17:58:26 -0700
Message-ID: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[1] Add capability to connect to an admin controller
    - prevents ioq creation for admin-controllers.

[2] Prevent admin controller from smart log fetch (LID 2)
    - LID 2 is optional for admin controllers.

[3] Prevent ioq creation for discovery controllers
    - prohibited by spec



Kamaljit Singh (3):
  nvme: add capability to connect to an admin controller
  nvme: prevent admin controller from smart log fetch (LID 2)
  nvme: prevent ioq creation for discovery controllers

 drivers/nvme/host/core.c | 23 ++++++++++++++++++++++-
 drivers/nvme/host/nvme.h |  1 +
 drivers/nvme/host/rdma.c |  2 ++
 drivers/nvme/host/tcp.c  |  2 ++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.43.0

