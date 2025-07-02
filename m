Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D470808
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417915; cv=none; b=KfUcCun0LolLWT1WajkpF3OCPLRpLAEfY+PTfa7TNFEY+FlZFTZFxV6X2qeB4BZ5+gJw8YXjsEmO03tvtdWROeIc023b/0CLyqwoOVQZHmGYxZHSM5BPc3mfw/evTRcsXy2vBw/RS9cPc/sEknrSJiwvMSI2qReyCbxumJ2jmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417915; c=relaxed/simple;
	bh=VXNIZYL4TDNV74rDgxN9LTztkyCjwTb19kJ9JH/Ew7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYwf8KlKI7s/HqqLQMRBbewLapNWEDZbq1FjGATS69nlhtxMHGVvEnVzSnKLnzmt6EWOR4v4seH7BWqVv6cvWn5JHXvX8A+8hvioIQPr0V6OC9ZBHuMJUy6gTez9XMxlqaWlY7eTp4rl3GJnsR6UlHTEHSsDWqEJOJGqOfnFKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=T/qm3F3x; arc=none smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="T/qm3F3x"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1751417913; x=1782953913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VXNIZYL4TDNV74rDgxN9LTztkyCjwTb19kJ9JH/Ew7U=;
  b=T/qm3F3xPHwHmy7uFnBymY9IdCC2s6QZgcjtdvTdKa4bj1Z/2TtTVcAB
   LaMZJZCGRgdEFCqrsqaJsSU8j8eW0Fob3XzRH1celh34IVXX/Me5B1kde
   sgdHKEm1ocRZPJ8tOsb0Jd6EOpzZXjmDjQCTbqWWW8oGYlQ9dBkJMtGw+
   tepfeKYmeHEb6tHVgU41Ap9zIaJvwZH/FNvzL70h+7VizloSQV4BLbki3
   6z42F3SRg1XLIXtJWh06I6Mych4A52Cp/PO+1K93qez6isk1HHnnFvfFR
   ly3DpSlp6JYawQQuRbBgUJyAVFfQnhpv/UTgaeLBZvFKnYpRq+jviuNVB
   Q==;
X-CSE-ConnectionGUID: U62vqzczQsWshdsbix/z0w==
X-CSE-MsgGUID: bofuy6GnTkqVUk6tpkPq9w==
X-IronPort-AV: E=Sophos;i="6.16,280,1744041600"; 
   d="scan'208";a="85608347"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2025 08:58:31 +0800
IronPort-SDR: 686475ad_Z3uo29qHjcScXXFtKbpNLCCqGaAC+MKj6s6KWUSazad4j5s
 XvHN80xBsQeVMRh6ZjRFLR7ks3y5hfAL/+vgaAw==
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
Subject: [PATCH v2 3/3] nvme: prevent ioq creation for discovery controllers
Date: Tue,  1 Jul 2025 17:58:29 -0700
Message-ID: <20250702005830.889217-4-kamaljit.singh1@wdc.com>
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

Prevent ioq creation for discovery-controllers as the spec prohibits
them, similarly to the administrative controllers.

Reference: NVMe Base rev 2.2, sec 3.1.3.4, fig 28.

Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
---
 drivers/nvme/host/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c310634e75f3..3ad3b1da8b34 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3155,12 +3155,12 @@ static inline bool nvme_admin_ctrl(struct nvme_ctrl *ctrl)
 }
 
 /*
- * An admin controller has one admin queue, but no I/O queues.
+ * An admin or discovery controller has one admin queue, but no I/O queues.
  * Override queue_count so it only creates an admin queue.
  */
 void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl)
 {
-	if (nvme_admin_ctrl(ctrl))
+	if (nvme_admin_ctrl(ctrl) || nvme_discovery_ctrl(ctrl))
 		ctrl->queue_count = 1;
 }
 EXPORT_SYMBOL_GPL(nvme_override_prohibited_io_queues);
-- 
2.43.0

