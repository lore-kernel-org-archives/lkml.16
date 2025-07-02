Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06941C6B4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417914; cv=none; b=IBlnZtl2rs+Sq+r0FQrUWsXmKr/tEGkDLbh1TzHrxwZBq+oLtl12KBT7m8RAriFNVMYfH/cFxXUm2PMaBdxeLmua0pEqwPcQAEkQ4Sdsk9pNEH902S6WWTtTwmQQk/6U9GMHktvkKJ8EGczv55za1kggH3jPBbdD4w4IlbN/xB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417914; c=relaxed/simple;
	bh=x74/qhqgQxLvud4UWv+6frY0teSYowTdLUNXu3hBbpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVKh9yOov8ZmVk7RgCgm3+7oClBhAyBA+/1QTPnleqnVJAvNeQtekKTLhTEHYA1GY/I0lzxZTzL+GDOKDVUfgdqCW8Pq8slg0spcyJlQ+9UG16tMKit1y5/pX4q1Mvkg00LLOOK6C6ND1qIgdPIWEJPxkQo0xcuah9oHVe3Zg0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=ZEkr9YR0; arc=none smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ZEkr9YR0"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1751417912; x=1782953912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x74/qhqgQxLvud4UWv+6frY0teSYowTdLUNXu3hBbpc=;
  b=ZEkr9YR0R3cVUFiY0l2F7FpckP+S7AzQlOgfDEP0Jj+PudBWwXEarGS2
   pnbpv2TJ0Bh2h7Z32HL/n6PnOGV4zvxRoPKy4K6k55aeib5QIZu0TMaLA
   z2rQAoCu+5wBVm9SQBtM0AVkRiYUp8fBRV085qAYqT4ammbxFEVzMJtZD
   ScwdQkRMg6D3FEemI0Tnm/dgcnWCNmELGYDOxvWSxIwDQdAyb+lXtnZwW
   c8dDZB8c6S2KvsXzqBit8089A+2vuPX00VQHFhqUbP90csPmkQHXZ7pth
   nbTQ0+1tc8p6TfSHUXktLEfmfc4LRK6bYrgppK7SLanCnF+5zEBNQfRye
   A==;
X-CSE-ConnectionGUID: KkOOZEZHT5GsUk4TWREyjw==
X-CSE-MsgGUID: rkLqzUXRTGSvmpOx9GR08w==
X-IronPort-AV: E=Sophos;i="6.16,280,1744041600"; 
   d="scan'208";a="85608345"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2025 08:58:30 +0800
IronPort-SDR: 686475ac_JTcd8b+UQ+jInL/0ZWszZ2ymAOxcJytt20CrogUBAR4FaT4
 zIz6r2iqJEaKFTUCPTbX/wenx959G4ankKSL9eQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 16:56:28 -0700
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
Subject: [PATCH v2 1/3] nvme: add capability to connect to an admin controller
Date: Tue,  1 Jul 2025 17:58:27 -0700
Message-ID: <20250702005830.889217-2-kamaljit.singh1@wdc.com>
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

Suggested-by: Niklas Cassel <cassel@kernel.org>

Add capability to connect to an administrative controller by
preventing ioq creation for admin-controllers.

* Add helper nvme_admin_ctrl() to check for an administrative controller
* Add helper nvme_override_prohibited_io_queues() to override
  queue_count in nvme_ctrl

Reference: NVMe Base rev 2.2, sec 3.1.3.4, fig 28.

Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
---
 drivers/nvme/host/core.c | 21 +++++++++++++++++++++
 drivers/nvme/host/nvme.h |  1 +
 drivers/nvme/host/rdma.c |  2 ++
 drivers/nvme/host/tcp.c  |  2 ++
 4 files changed, 26 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index e533d791955d..a1155fb8d5be 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3149,6 +3149,22 @@ static inline bool nvme_discovery_ctrl(struct nvme_ctrl *ctrl)
 	return ctrl->opts && ctrl->opts->discovery_nqn;
 }
 
+static inline bool nvme_admin_ctrl(struct nvme_ctrl *ctrl)
+{
+	return (ctrl->cntrltype == NVME_CTRL_ADMIN);
+}
+
+/*
+ * An admin controller has one admin queue, but no I/O queues.
+ * Override queue_count so it only creates an admin queue.
+ */
+void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl)
+{
+	if (nvme_admin_ctrl(ctrl))
+		ctrl->queue_count = 1;
+}
+EXPORT_SYMBOL_GPL(nvme_override_prohibited_io_queues);
+
 static bool nvme_validate_cntlid(struct nvme_subsystem *subsys,
 		struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
 {
@@ -3215,6 +3231,11 @@ static int nvme_init_subsystem(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
 		kfree(subsys);
 		return -EINVAL;
 	}
+	if (nvme_admin_ctrl(ctrl))
+		dev_info(ctrl->device,
+			"Subsystem %s is an administrative controller",
+			subsys->subnqn);
+
 	nvme_mpath_default_iopolicy(subsys);
 
 	subsys->dev.class = &nvme_subsys_class;
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 7df2ea21851f..5e07ba634e97 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -1212,6 +1212,7 @@ struct nvme_ctrl *nvme_ctrl_from_file(struct file *file);
 struct nvme_ns *nvme_find_get_ns(struct nvme_ctrl *ctrl, unsigned nsid);
 bool nvme_get_ns(struct nvme_ns *ns);
 void nvme_put_ns(struct nvme_ns *ns);
+void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl);
 
 static inline bool nvme_multi_css(struct nvme_ctrl *ctrl)
 {
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 9bd3646568d0..7d50a2f31c3a 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -1026,6 +1026,8 @@ static int nvme_rdma_setup_ctrl(struct nvme_rdma_ctrl *ctrl, bool new)
 		goto destroy_admin;
 	}
 
+	nvme_override_prohibited_io_queues(&ctrl->ctrl);
+
 	if (ctrl->ctrl.opts->queue_size > ctrl->ctrl.sqsize + 1) {
 		dev_warn(ctrl->ctrl.device,
 			"queue_size %zu > ctrl sqsize %u, clamping down\n",
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index d924008c3949..bfb52a487c45 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2381,6 +2381,8 @@ static int nvme_tcp_setup_ctrl(struct nvme_ctrl *ctrl, bool new)
 		goto destroy_admin;
 	}
 
+	nvme_override_prohibited_io_queues(ctrl);
+
 	if (opts->queue_size > ctrl->sqsize + 1)
 		dev_warn(ctrl->device,
 			"queue_size %zu > ctrl sqsize %u, clamping down\n",
-- 
2.43.0

