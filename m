Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A361189B91
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743126420; cv=none; b=BPc2vBZXbNL1mQfuE1h2eFW9N7nGVGk95VZRI9oBqb0hOEp1TZ0i42C3uM10CtAFVZZ4iswnIYslbHSMgmTDhCggc3kc0Jnwrgvr7qau/mzUnu6JyNwU15/lSVkf66Hj5t10lisI/OZzDzDILx1rPfEgvkMDkce4CGbV3LKKuGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743126420; c=relaxed/simple;
	bh=FNFJ4M34L5/lBW3NlP8+HVmOe1SwyG60irx9+x57OqU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=E+8SqirBuafgbLaKvsJIOwD7AZoQNrFeYgR/bSlst95p/jhoiHsgXZco3NZuF1OSNoE0kvpPAYjxrbQN7rEvEO9mlXIBdd1UgzPO9x6egID3A34Lw7JMw9IK49BCSsWwSooigdd7ODj8J9Um1V7OjiirBFnb8zMtqIjD/+ky3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ycKfQt5K; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ycKfQt5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743126412; bh=Mq5fPyYKCLwHLmmMwMzVJgV2ir8ne/Qe4zI+PeMQpDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ycKfQt5KgSbwJ9jkomY/W9lI/gEpnuwxKIhhRD9Yre9eBNi8iAGPPNTrTJxjI+E7P
	 GaLCHU9eWPZxHEx+H2nFDtIpFuzGW2LnT82wKtTqTZMpCGN/ejP+tYHu8HCL2yOJyN
	 CBbGtKR4WYJCEFUhTYu3IscoOPfFe7onrSRi92nU=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id A292C6EE; Fri, 28 Mar 2025 09:40:41 +0800
X-QQ-mid: xmsmtpt1743126041trxb4xuyd
Message-ID: <tencent_584C480878642207D716B173FEF7ADA47C05@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnaKfaRS3pLhf4rBECaEUd3RUQoWFvwk6NMO2Jp496MnGguhKu+P
	 E797zxl2PL9Epkc5lejxsCoDcxZQRYtOf8nLJtVkJvN2oD3zCM1HVtlCxBcfTscnP1sM6VGzT4b1
	 s6addm7dcSEVn2JHd1FH/muzJKvgqXoEyenlijXqg0VzgwjXTst4j2BHLDLEbI62Ay7HK+64akFV
	 nlq2FSfnpUZUqycHbIJFsro17vACZhvGrMBvGbQVTYOxYDdNTNBfyrgFCxQOivvv9vXVRyu84+xj
	 d6GighHy2z9pQjNeiha4n1dFO100AzK0X5IJpYyWFxUY0DFuOzPD0peVREfz+F4x1pjDt0wlExlP
	 2q96YefKdzS1FANIWoK5FD3WoTfGnwbNXIhBfCQOB5GRdR1vnAWXEwTUQa6z3EfY9pM5epdeQby/
	 dDHN8ADo3YR+Hk/h9l5dsXUEQ0wSCJlsXxpMQ7wOo9P/qXmzSCKDbT/50ic/a3vsY94jeDz67ZXi
	 Uk9YV1+jbjP6BmbzpyzakCOnMUnA3aPt4PQm9Joh49AwjLOS5UrXiTAWUohaIbcwag/bWKQD2XAQ
	 L2UAGQ3Kak3uAYtUxQoR/CADZmZ4dy9tzORAqJIOy2q7Q849J8NmqslaiTZPAa/BzlzRPpKHhgxi
	 DAWWQumfvVCHjAksl2ztvL0tdsVsKwbfZbbrv/RYhlSvZnpgDqo/k6Jhfwdfr7k78pR4L65GgCPK
	 5t3l3AW/ja1wI76umlo/0Q6WVVmnRU1QLXtxmsDmwvNK5Dt4y8fsEZCe63PLQeUJxVuf26G+oKOy
	 dW6UnfAmzepwpa35sv16w4F3HpTNTGGaCAMC8JP/sOtiW3VCjGrJwx596T8bsKzk8oYb7IQcdtMJ
	 S8YK5+PF4RgrHBZ9Is9ply6zvZEpgsicQt8Dp5PcW+5Gte1xCTy8UZVAFcGUVobbXH1qn/Jg4xo7
	 ZcpdhEJ38vkZYhrJPS7Q==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [PATCH v2 3/3] nvme: add per-controller sysfs interface for APST configuration
Date: Fri, 28 Mar 2025 09:40:40 +0800
X-OQ-MSGID: <20250328014040.95401-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_4A5421BA11BD9C5B5BF3CEA95FD212AB3107@qq.com>
References: <tencent_4A5421BA11BD9C5B5BF3CEA95FD212AB3107@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

Currently, APST (Autonomous Power State Transition) parameters are
configured as module parameters affecting all controllers uniformly,
 This lacks flexibility for heterogeneous systems.

This patch introduces per-controller sysfs attributes under each NVMe
controller's sysfs directory:
- apst_primary_timeout_ms
- apst_secondary_timeout_ms
- apst_primary_latency_tol_us
- apst_secondary_latency_tol_us

The attributes allow runtime configuration of: Timeout values for
primary/secondary states.

The existing module parameters are retained for backward compatibility
but now only serve as default values for new controllers.

Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
---
 drivers/nvme/host/core.c  | 16 ++++++++++------
 drivers/nvme/host/nvme.h  |  4 ++++
 drivers/nvme/host/sysfs.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 9dea1046b8b4..c999bd905d10 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2608,22 +2608,22 @@ static int nvme_configure_host_options(struct nvme_ctrl *ctrl)
  * timeout value is returned and the matching tolerance index (1 or 2) is
  * reported.
  */
-static bool nvme_apst_get_transition_time(u64 total_latency,
+static bool nvme_apst_get_transition_time(struct nvme_ctrl *ctrl, u64 total_latency,
 		u64 *transition_time, unsigned *last_index)
 {
-	if (total_latency <= apst_primary_latency_tol_us) {
+	if (total_latency <= ctrl->apst_primary_latency_tol_us) {
 		if (*last_index == 1)
 			return false;
 		*last_index = 1;
-		*transition_time = apst_primary_timeout_ms;
+		*transition_time = ctrl->apst_primary_timeout_ms;
 		return true;
 	}
 	if (apst_secondary_timeout_ms &&
-		total_latency <= apst_secondary_latency_tol_us) {
+		total_latency <= ctrl->apst_secondary_latency_tol_us) {
 		if (*last_index <= 2)
 			return false;
 		*last_index = 2;
-		*transition_time = apst_secondary_timeout_ms;
+		*transition_time = ctrl->apst_secondary_timeout_ms;
 		return true;
 	}
 	return false;
@@ -2728,7 +2728,7 @@ int nvme_configure_apst(struct nvme_ctrl *ctrl)
 		 * for higher power states.
 		 */
 		if (apst_primary_timeout_ms && apst_primary_latency_tol_us) {
-			if (!nvme_apst_get_transition_time(total_latency_us,
+			if (!nvme_apst_get_transition_time(ctrl, total_latency_us,
 					&transition_ms, &last_lt_index))
 				continue;
 		} else {
@@ -4856,6 +4856,10 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 	ctrl->ka_last_check_time = jiffies;
 
 	mutex_init(&ctrl->apst_lock);
+	ctrl->apst_primary_timeout_ms = apst_primary_timeout_ms;
+	ctrl->apst_secondary_timeout_ms = apst_secondary_timeout_ms;
+	ctrl->apst_primary_latency_tol_us = apst_primary_latency_tol_us;
+	ctrl->apst_secondary_latency_tol_us = apst_secondary_latency_tol_us;
 
 	BUILD_BUG_ON(NVME_DSM_MAX_RANGES * sizeof(struct nvme_dsm_range) >
 			PAGE_SIZE);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 7f8e10f5bf7a..ed9afc3c6781 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -387,6 +387,10 @@ struct nvme_ctrl {
 	/* Power saving configuration */
 	struct mutex apst_lock;
 	u64 ps_max_latency_us;
+	u64 apst_primary_timeout_ms;
+	u64 apst_secondary_timeout_ms;
+	u64 apst_primary_latency_tol_us;
+	u64 apst_secondary_latency_tol_us;
 	bool apst_enabled;
 
 	/* PCIe only: */
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 5003cb294d65..afa61e9c1366 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -684,6 +684,37 @@ static DEVICE_ATTR(dhchap_ctrl_secret, S_IRUGO | S_IWUSR,
 	nvme_ctrl_dhchap_ctrl_secret_show, nvme_ctrl_dhchap_ctrl_secret_store);
 #endif
 
+#define nvme_apst_show_and_store_function(field)				\
+static ssize_t field##_show(struct device *dev,		\
+			    struct device_attribute *attr, char *buf)	\
+{									\
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);			\
+	return sysfs_emit(buf, "%llu\n", ctrl->field);	\
+}									\
+									\
+static ssize_t field##_store(struct device *dev,		\
+			     struct device_attribute *attr,		\
+			     const char *buf, size_t size)		\
+{									\
+	int err;						\
+	u64 data = 0;					\
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);			\
+	err = kstrtou64(buf, 0, &data);		\
+	if (err < 0)						\
+		return err;						\
+							\
+	mutex_lock(&ctrl->apst_lock);		\
+	ctrl->field = data; 	\
+	mutex_unlock(&ctrl->apst_lock);		\
+	return size;			\
+}									\
+static DEVICE_ATTR_RW(field);
+
+nvme_apst_show_and_store_function(apst_primary_timeout_ms);
+nvme_apst_show_and_store_function(apst_secondary_timeout_ms);
+nvme_apst_show_and_store_function(apst_primary_latency_tol_us);
+nvme_apst_show_and_store_function(apst_secondary_latency_tol_us);
+
 static ssize_t apst_update_store(struct device *dev,
 					      struct device_attribute *attr,
 					      const char *buf, size_t size)
@@ -734,6 +765,11 @@ static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_dhchap_ctrl_secret.attr,
 #endif
 	&dev_attr_adm_passthru_err_log_enabled.attr,
+
+	&dev_attr_apst_primary_timeout_ms.attr,
+	&dev_attr_apst_secondary_timeout_ms.attr,
+	&dev_attr_apst_primary_latency_tol_us.attr,
+	&dev_attr_apst_secondary_latency_tol_us.attr,
 	&dev_attr_apst_update.attr,
 	NULL
 };
-- 
2.25.1

