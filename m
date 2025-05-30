Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD710FD
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590291; cv=none; b=myzpUlLyrycOjp7olr6+fNVD7J5+bfNxI4qVe8Toz7+DtXhwu1RMHJS3FBqlbliZTnQJi2mCig4MPkCKTn0EipfKec2+rG6OwiDO+DDC6LY1upt3yO2EuBFxZzRQBw9gTZ+ARwE+vaMPkO/dvRg4RBLc+A0h1PClmZ195e70XWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590291; c=relaxed/simple;
	bh=4kWdTAYOz5Pc5WNpJNLqZME+zHvxxbllcD5V1Sv5q6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM9LQv4aNk/rwusARK+Ku1viRguKZPx1NV6ti3WvSgqkPNgN/1PS54B1os/CFa5D2WxO50uBoPjCUWdHLTtuPrGAOyeoVnmEex3IHZypYiu1jYBQN4siWTMw5pcdUCY2Sn9GqYBxklLggQ/Le8nA5X6EGaPkrs2k/hGD23INxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lnkwtJqW; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lnkwtJqW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748590285; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=sUdJS8owTGJQ26ayrRUygOFvVD5DOZcz8FU13W0N0M4=;
	b=lnkwtJqWiifuNG2n4tgc3acC6Il9R9qniL4/LlJ3+3tnudrm0fRWa3pbXsmNrGj9uwPn5lO8iEMsBeT4cAv5aF9ipA4ntYTWsghEpOGIgDY2edsd3nn0UPf88tki3lsoZxFSUWmDfk34m2L7FPjt5JILup2L9GSlavbLbV7ttH0=
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0WcKViDG_1748590283 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 May 2025 15:31:24 +0800
From: Bitao Hu <yaoma@linux.alibaba.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yaoma@linux.alibaba.com,
	kanie@linux.alibaba.com
Subject: [PATCH] nvme: Support per-device timeout settings
Date: Fri, 30 May 2025 15:31:21 +0800
Message-Id: <20250530073121.26683-1-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current 'admin_timeout' and 'io_timeout' parameters in
the NVMe driver are global, meaning they apply to all NVMe
devices in the system. However, in certain scenarios, it is
necessary to set separate timeout values for different
types of NVMe devices.

To address this requirement, we propose adding two new fields,
'admin_timeout' and 'io_timeout', to the sysfs interface for
each NVMe device. By default, these values will be consistent
with the global parameters. If a user sets these values
individually for a specific device, the user-defined values
will take precedence.

Usage example:
To set admin_timeout=100 and io_timeout=50 for the NVMe device nvme1,
use the following commands:

echo 100 > /sys/class/nvme/nvme1/admin_timeout
echo 50  > /sys/class/nvme/nvme1/io_timeout

Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
---
 drivers/nvme/host/apple.c |  2 +-
 drivers/nvme/host/core.c  |  6 ++--
 drivers/nvme/host/nvme.h  |  2 +-
 drivers/nvme/host/pci.c   |  4 +--
 drivers/nvme/host/rdma.c  |  2 +-
 drivers/nvme/host/sysfs.c | 62 +++++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/tcp.c   |  2 +-
 7 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index b1fddfa33ab9..ec7c7cfcdf5b 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -821,7 +821,7 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
 	 * doing a safe shutdown.
 	 */
 	if (!dead && shutdown && freeze)
-		nvme_wait_freeze_timeout(&anv->ctrl, NVME_IO_TIMEOUT);
+		nvme_wait_freeze_timeout(&anv->ctrl);
 
 	nvme_quiesce_io_queues(&anv->ctrl);
 
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f69a232a000a..32eade3418f8 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -725,11 +725,10 @@ void nvme_init_request(struct request *req, struct nvme_command *cmd)
 		struct nvme_ns *ns = req->q->disk->private_data;
 
 		logging_enabled = ns->head->passthru_err_log_enabled;
-		req->timeout = NVME_IO_TIMEOUT;
 	} else { /* no queuedata implies admin queue */
 		logging_enabled = nr->ctrl->passthru_err_log_enabled;
-		req->timeout = NVME_ADMIN_TIMEOUT;
 	}
+	req->timeout = req->q->rq_timeout;
 
 	if (!logging_enabled)
 		req->rq_flags |= RQF_QUIET;
@@ -5174,10 +5173,11 @@ void nvme_unfreeze(struct nvme_ctrl *ctrl)
 }
 EXPORT_SYMBOL_GPL(nvme_unfreeze);
 
-int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl, long timeout)
+int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl)
 {
 	struct nvme_ns *ns;
 	int srcu_idx;
+	long timeout = ctrl->tagset->timeout;
 
 	srcu_idx = srcu_read_lock(&ctrl->srcu);
 	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index ad0c1f834f09..50b5f2848f85 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -833,7 +833,7 @@ void nvme_sync_queues(struct nvme_ctrl *ctrl);
 void nvme_sync_io_queues(struct nvme_ctrl *ctrl);
 void nvme_unfreeze(struct nvme_ctrl *ctrl);
 void nvme_wait_freeze(struct nvme_ctrl *ctrl);
-int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl, long timeout);
+int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl);
 void nvme_start_freeze(struct nvme_ctrl *ctrl);
 
 static inline enum req_op nvme_req_op(struct nvme_command *cmd)
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index e0bfe04a2bc2..e0b29b385d0b 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2690,7 +2690,7 @@ static bool __nvme_delete_io_queues(struct nvme_dev *dev, u8 opcode)
 	unsigned long timeout;
 
  retry:
-	timeout = NVME_ADMIN_TIMEOUT;
+	timeout = dev->ctrl.admin_q->rq_timeout;
 	while (nr_queues > 0) {
 		if (nvme_delete_queue(&dev->queues[nr_queues], opcode))
 			break;
@@ -2871,7 +2871,7 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
 		 * if doing a safe shutdown.
 		 */
 		if (!dead && shutdown)
-			nvme_wait_freeze_timeout(&dev->ctrl, NVME_IO_TIMEOUT);
+			nvme_wait_freeze_timeout(&dev->ctrl);
 	}
 
 	nvme_quiesce_io_queues(&dev->ctrl);
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index b5a0295b5bf4..01a9250810cf 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -888,7 +888,7 @@ static int nvme_rdma_configure_io_queues(struct nvme_rdma_ctrl *ctrl, bool new)
 	if (!new) {
 		nvme_start_freeze(&ctrl->ctrl);
 		nvme_unquiesce_io_queues(&ctrl->ctrl);
-		if (!nvme_wait_freeze_timeout(&ctrl->ctrl, NVME_IO_TIMEOUT)) {
+		if (!nvme_wait_freeze_timeout(&ctrl->ctrl)) {
 			/*
 			 * If we timed out waiting for freeze we are likely to
 			 * be stuck.  Fail the controller initialization just
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 29430949ce2f..9b8c29435bfa 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -10,6 +10,66 @@
 #include "nvme.h"
 #include "fabrics.h"
 
+static ssize_t admin_timeout_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", ctrl->admin_tagset->timeout / HZ);
+}
+
+static ssize_t admin_timeout_store(struct device *dev,
+				   struct device_attribute *attr, const char *buf,
+				   size_t count)
+{
+	int ret;
+	unsigned int timeout;
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	ret = kstrtouint(buf, 10, &timeout);
+	if (ret < 0 || timeout == 0)
+		return -EINVAL;
+
+	timeout = timeout * HZ;
+	ctrl->admin_tagset->timeout = timeout;
+	blk_queue_rq_timeout(ctrl->admin_q, timeout);
+
+	return count;
+}
+static DEVICE_ATTR_RW(admin_timeout);
+
+static ssize_t io_timeout_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", ctrl->tagset->timeout / HZ);
+}
+
+static ssize_t io_timeout_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	int ret, srcu_idx;
+	unsigned int timeout;
+	struct nvme_ns *ns;
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	ret = kstrtouint(buf, 10, &timeout);
+	if (ret < 0 || timeout == 0)
+		return -EINVAL;
+
+	timeout = timeout * HZ;
+	ctrl->tagset->timeout = timeout;
+	srcu_idx = srcu_read_lock(&ctrl->srcu);
+	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
+				srcu_read_lock_held(&ctrl->srcu)) {
+		blk_queue_rq_timeout(ns->queue, timeout);
+	}
+	srcu_read_unlock(&ctrl->srcu, srcu_idx);
+
+	return count;
+}
+static DEVICE_ATTR_RW(io_timeout);
+
 static ssize_t nvme_sysfs_reset(struct device *dev,
 				struct device_attribute *attr, const char *buf,
 				size_t count)
@@ -722,6 +782,8 @@ static DEVICE_ATTR(dhchap_ctrl_secret, S_IRUGO | S_IWUSR,
 static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_reset_controller.attr,
 	&dev_attr_rescan_controller.attr,
+	&dev_attr_admin_timeout.attr,
+	&dev_attr_io_timeout.attr,
 	&dev_attr_model.attr,
 	&dev_attr_serial.attr,
 	&dev_attr_firmware_rev.attr,
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index f6379aa33d77..c66c98e2cfe4 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2169,7 +2169,7 @@ static int nvme_tcp_configure_io_queues(struct nvme_ctrl *ctrl, bool new)
 	if (!new) {
 		nvme_start_freeze(ctrl);
 		nvme_unquiesce_io_queues(ctrl);
-		if (!nvme_wait_freeze_timeout(ctrl, NVME_IO_TIMEOUT)) {
+		if (!nvme_wait_freeze_timeout(ctrl)) {
 			/*
 			 * If we timed out waiting for freeze we are likely to
 			 * be stuck.  Fail the controller initialization just
-- 
2.39.5 (Apple Git-154)

