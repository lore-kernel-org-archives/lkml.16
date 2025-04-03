Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558C23F422
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665254; cv=none; b=JYsOwiAGc5Kif4bj8DZ8EL9EdvMGuzUNX7I0JdLB6tH5HdYXbum7++V85PZlEwRGdxaUlaJdgI+ajbj44fIH9ehCp7XDAU0Ko6oWJBQYwTbjaQh0dfBg490zATXIpmHe5t9oA56p4FTGZHIpBsQaQBrBh9tnL+QhGCyO3Mr8BFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665254; c=relaxed/simple;
	bh=xUhfi3gUw/QjVJbcUhIpWx5w9OxwRdvISb3WEdQ4YAY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ua4RqFdzole/JGaBasvVKqplFAnpx32VbVhdjsA159GBUMhzvJO2BMU0dJc+9fNXwAUwG5Re14iV7I+k7NcRWbXSiksKHzLkApiseF3OUbahMXaZxyBPS2fgqFGLhBef/i/kb31OX+DKwSaukxTu3G9XHSg+fpKzmr/gCKx0gdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=UVQvVpKP; arc=none smtp.client-ip=43.163.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="UVQvVpKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743664939; bh=PEO11pdJTf99eBXLbA9i5RAduuXXjkaH7AWwQjlYo8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UVQvVpKP3Oa8O8BGJjaQ7rkxDhtAyGmMBbZhObZxjaaHitUoyvaSkcO2t/EBxY2F2
	 Ypp9k/g1Miu30r94NeVYIZH2ip7vv56725u1kpI6Iaw6W5aP+jl1O1A8fj4+p+Z8BJ
	 WzIwAaaTddhWP+l1z+DVo8CQWk+zRuVqOYOD9i+4=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 591AD8D9; Thu, 03 Apr 2025 15:22:17 +0800
X-QQ-mid: xmsmtpt1743664937toxqeymfr
Message-ID: <tencent_776C8C1D08FD8F3CE58CD91E7572FEA6970A@qq.com>
X-QQ-XMAILINFO: M+5cKLn0wXDtul2pnIgRndmKtcEfFHQLBP08+4LFHc7zPPxdtnlrz4wvl7nTIT
	 Rcjd0i88/nIHeEkSVNC0bpHFcHp8mhcum5U+4+4LclAz/b0suif5RLln11sekyn7gu/NLEBIqrAj
	 rbOXfPrqC1E3RqFRCxLGhFmqyp7OaXI044ef7i4dO6mvMKH3Ei3ccB3dfC2DIjyaz04JaBdGCchO
	 HOYAwmlkWOVU2bXvDnOkId2XQi+jvKkfDj4WwSa7JEXQu5ODF8vgbuBMPq867RiQAvjfZpLEsnfc
	 noWCenxCK/6fGFt5M5z16OblloX95lIbxy/lAjvFH0gANR/67TGN24UrCeR+WIHAatHyDOaH5Whn
	 vjhPlvNeVeZC+r4tTmvbk3ydIfD3MaiU6qXnlO+g/JdoNJpoJVoNcLV1Azl5pUyOEn1djpABVnvs
	 I+eer28ymaHAWK5FCiAuIlagt+I6agcw7Z5dYc7J53vbwsaEO0m3AkwmSS2CmL2ZRI7p1mOg2p3w
	 ZRJYsyoQJ4Ci1itDnJw5TXek7gAWmRm/R0Aj+/uTOUr22yRhPWubsO3Nxbnhs2y58RSJM0rkkZwS
	 Fdgk5aJv2SE44b8uSOjMWQc1RuPQXiIVaPaZJnlXIO4mund+3ksO2f1QlmHJJSdtgNpddT3bW4El
	 QaTECJPjpFMcP+EGOdOX7rs5aTVHHKhYcQkj1YUP9MIYY2KC9ssUWekIIYGKPFlNSLq6+fmo648F
	 6LuOOMuPnAWJ42LF5vW7X+fztiNyIU4hjfx9UE6JzNYFQWLg4TYf995AMkBvvMNt1cHDT7dQcEIJ
	 gjF3WZG98JPlrN6xUnTkd9c5WJwp5OsOjRcTMTycO2mJVOAVD2Qx8Xcg8I6O6rLN9HjGAWzrDwGD
	 q3kt1WvJwRf7c9Bl1K39cyuO3NMpSmG5mLIHVFPWk4lb5TPInA/8NSz16DgI8VdzFXV4KyQFJ8iD
	 qrhb6Ocubv4/1vm7SewotkoA20BI5coNxn4ruX/CmfaNuwXSR6Bn5Ye7JvENBcJLoI4QJPvhQJTo
	 9tkoZXBQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanyak@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH v4 2/3] nvme: add sysfs interface for APST table updates
Date: Thu,  3 Apr 2025 15:22:16 +0800
X-OQ-MSGID: <20250403072216.1208677-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_A9D89C90E6484E0EBFED4F67D6EF4589F506@qq.com>
References: <tencent_A9D89C90E6484E0EBFED4F67D6EF4589F506@qq.com>
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

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Signed-off-by: Yaxiong Tian  <tianyaxiong@kylinos.cn>
---
 drivers/nvme/host/core.c  |  9 +++++++--
 drivers/nvme/host/nvme.h  |  2 ++
 drivers/nvme/host/sysfs.c | 24 ++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index eca0d0d2c2b4..19438da102e5 100644
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
@@ -2779,8 +2779,11 @@ static void nvme_set_latency_tolerance(struct device *dev, s32 val)
 
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
 
@@ -4853,6 +4856,8 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
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

