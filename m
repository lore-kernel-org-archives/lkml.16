Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3E71EBA19
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322723; cv=none; b=IrQekbxSi0djr6larYTrqUhwLwdut9pn2TNUSWc7dmECrK64FM4MHKOYjA5s1Vxc/VVQgGuBEp42kr7XHzwGRIEiAw2WeyI5HJAm3LAhWPYDl70Xi0PdqJ98iN18VXScQzQ5q42EROltv2NNKdpX2rVu5mHCTxzvGmBds1u+Mj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322723; c=relaxed/simple;
	bh=ppHCXWGMtBjYqasFlq5USxa8F65s3HoS/cBJa+OZxBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=RAi3naYr9V7VMjnUFpfV3AKil3CyO5mmID2/UMwLfhRwwIByevzM4Ua+lp0jFOhhIwC0lL+N6jfJ4A42Il7JCVnX0K/ssQTMeuNTCrcfHfquzV+h7iJahyv5nBUWLf4g3Hkn7WLdy76PCnQIBU+N3eils0X2KBVbuKZoPKr7aAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A8D4FEC;
	Fri, 31 Jan 2025 03:25:47 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05D823F63F;
	Fri, 31 Jan 2025 03:25:20 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:15 +0000
Subject: [PATCH v2 15/18] firmware: arm_ffa: Stash ffa_device instead of
 notify_type in notifier_cb_info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-15-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=ppHCXWGMtBjYqasFlq5USxa8F65s3HoS/cBJa+OZxBc=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMRBuIh27ziuPfs8So1yLkq6OEw3A+xBlmlZ
 PbgP5yQQXuJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEQAKCRAAQbq8MX7i
 mKpDEAC+wz+pn3lmr5K+NgtpCsurmQj9U6ThCm0xmNbVsoYRdYuAoxX14DxTrXHgUJh2W1zK9Lv
 YgCBwijlkhcvzRHtRxTEa4z4H9Ef2yYPsjTsx8DiScEEC1eJAFXM9ldD4kuSITzX6BuxKmh+8LH
 4FLD3iCvxcnDQiNmymplcEJZHrcJcAF+9rCP4OO1zLB3dMnGWuEbK1BCvM4gLLsIJawZGsO7JSE
 LIUNFNt3RhwCw+nDJuV8ZN2Sk5xt1R87fnzlYLyHCiOkIfZ2xGUeiEE+F07i9trKhaK3EOZm4ku
 aE3ipHhKAJ3TQ2k0EU8YoigSTB/vp0L7Ljfq2NRIExkAU+ScpUMwr3CH6WDhbo7nD2nWhuY7M79
 eOl3EXZLLAEdNnhjtzK2EYPEF1invLtmw5uiDiQN5zWCUlehnDv0EXpuIE2+GLxdWY6vb+YXwnq
 6brJS0YQ9BkxjTe2tDp1eAakGK90v0Eq6VQBCK7wkREY8seX335Ra4hmgyQjYwSlB/AhH70rlzp
 r7TckNpY092suOxThHwSBe1hmgEUwOTWE5GzkrPX2FLa3e3uQCyMVNqrHgJXRHDgyE3MGcn1uXq
 cxNDYRBSLembSdT/s96tqHr4Jh2ZsdK6Xm2kpHI2hVV3KsYoftaBRMp17N6VhILOh7PzADal96u
 8t9YA02BYaqNBdw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently, we store the type of the notification in the notifier_cb_info
structure that is put into the hast list to identify if the notification
block is for the secure partition or the non secure VM.

In order to support framework notifications to reuse the hash list and
to avoid creating one for each time, we need store the ffa_device pointer
itself as the same notification ID in framework notifications can be
registered by multiple FF-A devices.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index dc2d05bb361272b4100802503dd883c17f8900f3..86c0667ff8825ca5e70547e9056a28b73b8ab251 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1116,9 +1116,9 @@ static int ffa_memory_lend(struct ffa_mem_ops_args *args)
 
 struct notifier_cb_info {
 	struct hlist_node hnode;
+	struct ffa_device *dev;
 	ffa_notifier_cb cb;
 	void *cb_data;
-	enum notify_type type;
 };
 
 static int ffa_sched_recv_cb_update(u16 part_id, ffa_sched_recv_cb callback,
@@ -1187,17 +1187,18 @@ notifier_hash_node_get(u16 notify_id, enum notify_type type)
 	struct notifier_cb_info *node;
 
 	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
-		if (type == node->type)
+		if (type == ffa_notify_type_get(node->dev->vm_id))
 			return node;
 
 	return NULL;
 }
 
 static int
-update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
+update_notifier_cb(struct ffa_device *dev, int notify_id, ffa_notifier_cb cb,
 		   void *cb_data, bool is_registration)
 {
 	struct notifier_cb_info *cb_info = NULL;
+	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 	bool cb_found;
 
 	cb_info = notifier_hash_node_get(notify_id, type);
@@ -1211,7 +1212,7 @@ update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
 		if (!cb_info)
 			return -ENOMEM;
 
-		cb_info->type = type;
+		cb_info->dev = dev;
 		cb_info->cb = cb;
 		cb_info->cb_data = cb_data;
 
@@ -1226,7 +1227,6 @@ update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
 static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
 {
 	int rc;
-	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 
 	if (ffa_notifications_disabled())
 		return -EOPNOTSUPP;
@@ -1236,7 +1236,7 @@ static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
 
 	mutex_lock(&drv_info->notify_lock);
 
-	rc = update_notifier_cb(notify_id, type, NULL, NULL, false);
+	rc = update_notifier_cb(dev, notify_id, NULL, NULL, false);
 	if (rc) {
 		pr_err("Could not unregister notification callback\n");
 		mutex_unlock(&drv_info->notify_lock);
@@ -1255,7 +1255,6 @@ static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 {
 	int rc;
 	u32 flags = 0;
-	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 
 	if (ffa_notifications_disabled())
 		return -EOPNOTSUPP;
@@ -1274,7 +1273,7 @@ static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 		return rc;
 	}
 
-	rc = update_notifier_cb(notify_id, type, cb, cb_data, true);
+	rc = update_notifier_cb(dev, notify_id, cb, cb_data, true);
 	if (rc) {
 		pr_err("Failed to register callback for %d - %d\n",
 		       notify_id, rc);

-- 
2.34.1

