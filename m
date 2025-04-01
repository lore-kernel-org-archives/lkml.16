Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6552AEFE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499943; cv=none; b=Me79sUCsPEnOXtwMdXUF3uzY3KKR0TmgAc9h80k0wQN262BkTdIr4+b1ej/uI5Z+6fa6DaGX+mc7xL6l+GC5d9rHVRTcK4E09x0aoTZGTa1Hz617l8h/s6ZTmWf1ldaZLtBVYa481cC+LHBzNmP5w3bmYFjpPtg0c4cMxMdcirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499943; c=relaxed/simple;
	bh=OAKVSvRwfQi5FNmnLndFBbj2HUDr15x02ukw7LAYHkY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=EG/KGKVGflTB/ptEReA1ot14CumNRvo47aBRsXon9umUoouBpNpCNE9P3E90IxXV+9QTm9CnJAZu+WlTrwnsqGkKfZMmwNkSk3YcD47FND9gmECvTWb4BblCUOz5U6wP/mNqczFooTj3H/8TL8Xqa5NorSgMqlgFT/OxP/sDAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=yzJjk7lv; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="yzJjk7lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743499626; bh=rHnNmt3+i6+Fmmxq3LKb4Rz5gmJ6NIMisYM0ZQcKssA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yzJjk7lvm4rMAyz3Fuf3CKntuGeNeE6UGeKvFpTQWZh/sW92MKYKH5WYanzQDhKz8
	 i1kWs40Pf15vKlYCi5m5dT3BaAhI19fXVhduwcEprzCmK6D4MpNM2VjuIp2JdaCdRZ
	 6xx3BT3xwlMtsF8/g16CwfrAccjvPv3393U+fKbU=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 6C41646E; Tue, 01 Apr 2025 17:27:04 +0800
X-QQ-mid: xmsmtpt1743499624txlq3fgvi
Message-ID: <tencent_46894AB4C702852846EC72D26C273B817E09@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuPn2KFxiEiDoj/jELAQe4blJkXPNJwF33bp2e/1jHKrg4+l/tpb
	 +FNG6swqazzHmsJ7vA8SZ0ez7lULzJc/kX1EqGyjlDD6WLwfenzEv0Tapnn2ZrzmBcL0CJOWnW/c
	 2ZJCGYFTKN7/UgvON1GePZmqSvRXki4jDPsFwvLm0Sk4wOe3giuG/WVfqcQAJGkISXVZknD3nXoC
	 X9qu3L+217VWL88XNpGXOMDx5onruI7ObrzHnGJXF64Wbve4oL1QbcjL9/XkzacxKhY2qQIXJai+
	 NXZGH2q7XQ/DmbAreNQRtr7lN3Io/NH7UNNI7L3/AQdjlLoDwd5jqI4l4x7r61kWR9VR44asJ5Va
	 6W8mjNIaDQcqQxeXy0gaiKM6O7QSCwTOJZk3mfoZmMaCm0zBP8yvubcjSnohY0jW5a0oBQPgltYC
	 0bT0tsL7qVNRDB4UxnXjEfrfajOXX1qJs0SW+icYXNymIkJRh34rXf4swG8ez7hROl96i7lgnPIX
	 Zy6xshhtYLeGsOVZ4HpEDPNB+3ur2H8K7Bx2akuPlTvRglHxL5r2TSWduWz2Ry+n3663aZ9U/eop
	 kqUDjtVmqgG3rWQwsJCfvBOAbGe1kLqjcBV2M7Qd95s/uu7EJlwqbvi/puEFxDKQbPILInN4ZvqV
	 ZplKy7AUoxPjoR/VOW1zsv8Kx64JJe1irFhpBypaHIFJb7BapReEixHPmJpVoSCQUXtouVLLksOh
	 LSBTEbp9VMDrYpHsCQHUJ/Ec9Qc2UODqdID5vIgYuHXZ30b/wlOEurkcM3BxtjlE9GMU12ldDn+8
	 ro1KNzMRPB7tz6wYc4ZacJ/koQGoLYA7cxx2wkALt7DeaTHNEe5EMSlclkGEVAJGJlrMHyfpuN1p
	 t3gtF3YHDRAyb3F761TAdy5Z10XX+lG0Wxd4p33YcUWyux1ws736wVl+EAkIoU7QbYz+8FZtML3b
	 7MHpEodAS1O2JuF3gY+WoX0m1UvP0s83Rzlq5oTfFQEgA/9YEfUQIJRbO1wbrLIkOHdkcMU5/CCn
	 kxv5nYuhsnr12eWbiU
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanyak@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [PATCH v3 2/3] nvme: add sysfs interface for APST table updates
Date: Tue,  1 Apr 2025 17:27:02 +0800
X-OQ-MSGID: <20250401092702.1558230-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

In desktop systems, users can choose between power-saving mode and
performance mode. These two modes involve different trade-offs between
NVMe performance and power efficiency, thus requiring dynamic updates to APST.

Currently, the APST (Autonomous Power State Transition) table can only be
updated during module initialization via module parameters or indirectly
by setting QoS latency requirements. This patch adds a direct sysfs
interface to allow dynamic updates to the APST table at runtime.

The new sysfs entry is created at:
/sys/class/nvme/<controller>/apst_update

This provides more flexibility in power management tuning without
requiring module reload or QoS latency changes.

Example usage:
update nvme module parameters.
echo 1  > /sys/class/nvme/nvme0/apst_update

Signed-off-by: Yaxiong Tian  <tianyaxiong@kylinos.cn>
---
 drivers/nvme/host/core.c  |  9 +++++++--
 drivers/nvme/host/nvme.h  |  2 ++
 drivers/nvme/host/sysfs.c | 24 ++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index fb0404fee551..9dea1046b8b4 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2654,7 +2654,7 @@ static bool nvme_apst_get_transition_time(u64 total_latency,
  *
  * Users can set ps_max_latency_us to zero to turn off APST.
  */
-static int nvme_configure_apst(struct nvme_ctrl *ctrl)
+int nvme_configure_apst(struct nvme_ctrl *ctrl)
 {
 	struct nvme_feat_auto_pst *table;
 	unsigned apste = 0;
@@ -2778,8 +2778,11 @@ static void nvme_set_latency_tolerance(struct device *dev, s32 val)
 
 	if (ctrl->ps_max_latency_us != latency) {
 		ctrl->ps_max_latency_us = latency;
-		if (nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE)
+		if (nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE) {
+			mutex_lock(&ctrl->apst_lock);
 			nvme_configure_apst(ctrl);
+			mutex_unlock(&ctrl->apst_lock);
+		}
 	}
 }
 
@@ -4852,6 +4855,8 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 	ctrl->ka_cmd.common.opcode = nvme_admin_keep_alive;
 	ctrl->ka_last_check_time = jiffies;
 
+	mutex_init(&ctrl->apst_lock);
+
 	BUILD_BUG_ON(NVME_DSM_MAX_RANGES * sizeof(struct nvme_dsm_range) >
 			PAGE_SIZE);
 	ctrl->discard_page = alloc_page(GFP_KERNEL);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 51e078642127..7f8e10f5bf7a 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -385,6 +385,7 @@ struct nvme_ctrl {
 	key_serial_t tls_pskid;
 
 	/* Power saving configuration */
+	struct mutex apst_lock;
 	u64 ps_max_latency_us;
 	bool apst_enabled;
 
@@ -828,6 +829,7 @@ void nvme_unfreeze(struct nvme_ctrl *ctrl);
 void nvme_wait_freeze(struct nvme_ctrl *ctrl);
 int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl, long timeout);
 void nvme_start_freeze(struct nvme_ctrl *ctrl);
+int nvme_configure_apst(struct nvme_ctrl *ctrl);
 
 static inline enum req_op nvme_req_op(struct nvme_command *cmd)
 {
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 6d31226f7a4f..20146eb4c671 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -684,6 +684,29 @@ static DEVICE_ATTR(dhchap_ctrl_secret, S_IRUGO | S_IWUSR,
 	nvme_ctrl_dhchap_ctrl_secret_show, nvme_ctrl_dhchap_ctrl_secret_store);
 #endif
 
+static ssize_t apst_update_store(struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t size)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+	bool bool_data = false;
+	int err;
+
+	err = kstrtobool(buf, &bool_data);
+
+	if (err)
+		return err;
+
+	if (bool_data && nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE) {
+		mutex_lock(&ctrl->apst_lock);
+		nvme_configure_apst(ctrl);
+		mutex_unlock(&ctrl->apst_lock);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_WO(apst_update);
+
 static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_reset_controller.attr,
 	&dev_attr_rescan_controller.attr,
@@ -712,6 +735,7 @@ static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_dhchap_ctrl_secret.attr,
 #endif
 	&dev_attr_adm_passthru_err_log_enabled.attr,
+	&dev_attr_apst_update.attr,
 	NULL
 };
 
-- 
2.25.1

