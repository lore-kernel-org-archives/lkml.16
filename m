Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9701EE03C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322724; cv=none; b=MOsxcmj/u4r8lTY+dQ2a/vAYiOVb4BrQsWhPe7azuaDx9PoPPEvbPYSwGcw2iTlbdihfW/GQhmsb01/BDpWT9wnXkizfE3HfmpVUCQ4iyLrHPR3SFQfzDUwo91Yct95/80CpK50NRiRDZqSRu86BEnyUxRL5m/qp1dHoKqavM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322724; c=relaxed/simple;
	bh=zcyzebsWIlYLRHHpo1SJ3JoTTLC7QBrC9EzF3zvfDuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=LNY26fhVnkawDrgUguRWLtY5aOuWPHI9px38B+ogChRFNauHzhsutmYZre4Z8k9ZW+TpB31gHc9mnNxgvqIZxKgwobsxCjGBtAUEr+j208c744n9dgOI2RJZ6Xwkx9NDnhLoBkvEmzM67eMrUa3Rg70fypYxvSrj8k6xlavuCRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30C4A1007;
	Fri, 31 Jan 2025 03:25:48 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C07F3F63F;
	Fri, 31 Jan 2025 03:25:21 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:16 +0000
Subject: [PATCH v2 16/18] firmware: arm_ffa: Add support for
 {un,}registration of framework notifications
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-16-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8692; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=zcyzebsWIlYLRHHpo1SJ3JoTTLC7QBrC9EzF3zvfDuI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMRIIxP6ZVgWI/kvUHcecNEhfF/tPnrU55i/
 cKAvDEoq/KJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEQAKCRAAQbq8MX7i
 mB1DEACP69rVjhWh3jbSTP7eVwviytHQsdurJRG8onMmAyp5ePmdisBOGsMtCCXBOu5mMRLlK7S
 /x1IQ8W2M11Q/LEj+Kt6hp6/wL7+LP1i0zbsw4VFsmfufMPvbodJ4t+Gd2cS+9VbzuhMRJw1rWz
 n/wFyw7/vabWL97ng2U0kIA7tnvsD+hgZDP4WI7vBrvETjqdMlDw8Cw/jXBSkCzhD+K+cSdEfNy
 5MaoeDcph0kXcGBaGx6f8fq9FntsyeW1jHUdjD+HNjpzyEgK2XTQ/0TVJld+Eph5kK0pSPA/gsU
 CBZVuulTvWHndqUqBkqAvsHTBhC6kd8+ZgLXzTp56J0zTqPT5qvu9yBEJKuMKntm44HBA5wWbP0
 x/OZfXWmX4XyaMvkGUreQQ4qvvCWLfDe4oxtRFznD/g3BwH/f/qsUs9vjigiNDzIR6i5+wI4pMV
 WYJKUqneoU9dVk1JZu+2tEGfum7z2S3FtmrzdDCKWfSYnljklxBZ2tws5QDxXXKvO0ZjCf/LY/6
 PZzYz7mLnVg/jUs/Sght04Tlt+XkMle6jR0B/wADJMWadUvOcDfOfdBR8bct13HISIB58qaG5WG
 AjbhHEcqRI+jC+5B3toTP08ldUMSqaxItuKxh5zCCQoqWCIQKbj4fIDL8LaVQJbdC8IJqVdGsS+
 cugempK5YWQLMcA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Framework notifications are doorbells that are rung by the partition
managers to signal common events to an endpoint. These doorbells cannot
be rung by an endpoint directly. A partition manager can signal a
Framework notification in response to an FF-A ABI invocation by an
endpoint.

Two additional notify_ops interface is being added for any FF-A device/
driver to register and unregister for such a framework notifications.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 113 +++++++++++++++++++++++++++++++-------
 include/linux/arm_ffa.h           |   5 ++
 2 files changed, 97 insertions(+), 21 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 86c0667ff8825ca5e70547e9056a28b73b8ab251..f0e853584b51645cd7f590e4cb8d01ca1e7914dc 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1117,6 +1117,7 @@ static int ffa_memory_lend(struct ffa_mem_ops_args *args)
 struct notifier_cb_info {
 	struct hlist_node hnode;
 	struct ffa_device *dev;
+	ffa_fwk_notifier_cb fwk_cb;
 	ffa_notifier_cb cb;
 	void *cb_data;
 };
@@ -1180,28 +1181,61 @@ static enum notify_type ffa_notify_type_get(u16 vm_id)
 		return NON_SECURE_VM;
 }
 
-/* Should be called while the notify_lock is taken */
+/* notifier_hnode_get* should be called with notify_lock held */
 static struct notifier_cb_info *
-notifier_hash_node_get(u16 notify_id, enum notify_type type)
+notifier_hnode_get_by_vmid(u16 notify_id, int vmid)
 {
 	struct notifier_cb_info *node;
 
 	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
-		if (type == ffa_notify_type_get(node->dev->vm_id))
+		if (node->fwk_cb && vmid == node->dev->vm_id)
+			return node;
+
+	return NULL;
+}
+
+static struct notifier_cb_info *
+notifier_hnode_get_by_vmid_uuid(u16 notify_id, int vmid, const uuid_t *uuid)
+{
+	struct notifier_cb_info *node;
+
+	if (uuid_is_null(uuid))
+		return notifier_hnode_get_by_vmid(notify_id, vmid);
+
+	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
+		if (node->fwk_cb && vmid == node->dev->vm_id &&
+		    uuid_equal(&node->dev->uuid, uuid))
+			return node;
+
+	return NULL;
+}
+
+static struct notifier_cb_info *
+notifier_hnode_get_by_type(u16 notify_id, enum notify_type type)
+{
+	struct notifier_cb_info *node;
+
+	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
+		if (node->cb && type == ffa_notify_type_get(node->dev->vm_id))
 			return node;
 
 	return NULL;
 }
 
 static int
-update_notifier_cb(struct ffa_device *dev, int notify_id, ffa_notifier_cb cb,
-		   void *cb_data, bool is_registration)
+update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
+		   void *cb_data, bool is_registration, bool is_framework)
 {
 	struct notifier_cb_info *cb_info = NULL;
 	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 	bool cb_found;
 
-	cb_info = notifier_hash_node_get(notify_id, type);
+	if (is_framework)
+		cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, dev->vm_id,
+							  &dev->uuid);
+	else
+		cb_info = notifier_hnode_get_by_type(notify_id, type);
+
 	cb_found = !!cb_info;
 
 	if (!(is_registration ^ cb_found))
@@ -1213,8 +1247,11 @@ update_notifier_cb(struct ffa_device *dev, int notify_id, ffa_notifier_cb cb,
 			return -ENOMEM;
 
 		cb_info->dev = dev;
-		cb_info->cb = cb;
 		cb_info->cb_data = cb_data;
+		if (is_framework)
+			cb_info->fwk_cb = cb;
+		else
+			cb_info->cb = cb;
 
 		hash_add(drv_info->notifier_hash, &cb_info->hnode, notify_id);
 	} else {
@@ -1224,7 +1261,8 @@ update_notifier_cb(struct ffa_device *dev, int notify_id, ffa_notifier_cb cb,
 	return 0;
 }
 
-static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
+static int __ffa_notify_relinquish(struct ffa_device *dev, int notify_id,
+				   bool is_framework)
 {
 	int rc;
 
@@ -1236,22 +1274,35 @@ static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
 
 	mutex_lock(&drv_info->notify_lock);
 
-	rc = update_notifier_cb(dev, notify_id, NULL, NULL, false);
+	rc = update_notifier_cb(dev, notify_id, NULL, NULL, false,
+				is_framework);
 	if (rc) {
 		pr_err("Could not unregister notification callback\n");
 		mutex_unlock(&drv_info->notify_lock);
 		return rc;
 	}
 
-	rc = ffa_notification_unbind(dev->vm_id, BIT(notify_id));
+	if (!is_framework)
+		rc = ffa_notification_unbind(dev->vm_id, BIT(notify_id));
 
 	mutex_unlock(&drv_info->notify_lock);
 
 	return rc;
 }
 
-static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
-			      ffa_notifier_cb cb, void *cb_data, int notify_id)
+static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
+{
+	return __ffa_notify_relinquish(dev, notify_id, false);
+}
+
+static int ffa_fwk_notify_relinquish(struct ffa_device *dev, int notify_id)
+{
+	return __ffa_notify_relinquish(dev, notify_id, true);
+}
+
+static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
+				void *cb, void *cb_data,
+				int notify_id, bool is_framework)
 {
 	int rc;
 	u32 flags = 0;
@@ -1264,26 +1315,44 @@ static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 
 	mutex_lock(&drv_info->notify_lock);
 
-	if (is_per_vcpu)
-		flags = PER_VCPU_NOTIFICATION_FLAG;
+	if (!is_framework) {
+		if (is_per_vcpu)
+			flags = PER_VCPU_NOTIFICATION_FLAG;
 
-	rc = ffa_notification_bind(dev->vm_id, BIT(notify_id), flags);
-	if (rc) {
-		mutex_unlock(&drv_info->notify_lock);
-		return rc;
+		rc = ffa_notification_bind(dev->vm_id, BIT(notify_id), flags);
+		if (rc) {
+			mutex_unlock(&drv_info->notify_lock);
+			return rc;
+		}
 	}
 
-	rc = update_notifier_cb(dev, notify_id, cb, cb_data, true);
+	rc = update_notifier_cb(dev, notify_id, cb, cb_data, true,
+				is_framework);
 	if (rc) {
 		pr_err("Failed to register callback for %d - %d\n",
 		       notify_id, rc);
-		ffa_notification_unbind(dev->vm_id, BIT(notify_id));
+		if (!is_framework)
+			ffa_notification_unbind(dev->vm_id, BIT(notify_id));
 	}
 	mutex_unlock(&drv_info->notify_lock);
 
 	return rc;
 }
 
+static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
+			      ffa_notifier_cb cb, void *cb_data, int notify_id)
+{
+	return __ffa_notify_request(dev, is_per_vcpu, cb, cb_data, notify_id,
+				    false);
+}
+
+static int
+ffa_fwk_notify_request(struct ffa_device *dev, ffa_fwk_notifier_cb cb,
+		       void *cb_data, int notify_id)
+{
+	return __ffa_notify_request(dev, false, cb, cb_data, notify_id, true);
+}
+
 static int ffa_notify_send(struct ffa_device *dev, int notify_id,
 			   bool is_per_vcpu, u16 vcpu)
 {
@@ -1313,7 +1382,7 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 			continue;
 
 		mutex_lock(&drv_info->notify_lock);
-		cb_info = notifier_hash_node_get(notify_id, type);
+		cb_info = notifier_hnode_get_by_type(notify_id, type);
 		mutex_unlock(&drv_info->notify_lock);
 
 		if (cb_info && cb_info->cb)
@@ -1386,6 +1455,8 @@ static const struct ffa_notifier_ops ffa_drv_notifier_ops = {
 	.sched_recv_cb_unregister = ffa_sched_recv_cb_unregister,
 	.notify_request = ffa_notify_request,
 	.notify_relinquish = ffa_notify_relinquish,
+	.fwk_notify_request = ffa_fwk_notify_request,
+	.fwk_notify_relinquish = ffa_fwk_notify_relinquish,
 	.notify_send = ffa_notify_send,
 };
 
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 4fcbdc70cbc985eabb90733329c974384d229053..5bded24dc24fea8cdcbe42bf79c7c025c3fa5f4b 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -468,6 +468,7 @@ struct ffa_cpu_ops {
 
 typedef void (*ffa_sched_recv_cb)(u16 vcpu, bool is_per_vcpu, void *cb_data);
 typedef void (*ffa_notifier_cb)(int notify_id, void *cb_data);
+typedef void (*ffa_fwk_notifier_cb)(int notify_id, void *cb_data, void *buf);
 
 struct ffa_notifier_ops {
 	int (*sched_recv_cb_register)(struct ffa_device *dev,
@@ -476,6 +477,10 @@ struct ffa_notifier_ops {
 	int (*notify_request)(struct ffa_device *dev, bool per_vcpu,
 			      ffa_notifier_cb cb, void *cb_data, int notify_id);
 	int (*notify_relinquish)(struct ffa_device *dev, int notify_id);
+	int (*fwk_notify_request)(struct ffa_device *dev,
+				  ffa_fwk_notifier_cb cb, void *cb_data,
+				  int notify_id);
+	int (*fwk_notify_relinquish)(struct ffa_device *dev, int notify_id);
 	int (*notify_send)(struct ffa_device *dev, int notify_id, bool per_vcpu,
 			   u16 vcpu);
 };

-- 
2.34.1

