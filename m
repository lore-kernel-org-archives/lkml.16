Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E671E1E98FD
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322722; cv=none; b=aY9K3v8v92MFFqJkCSWiBhmg4pRpN3R0vAQe+E8Oq4W7D7FaFFacF6uDkIUmzEp8G6cLG4YvlaGfcy4AJVStjICWKwxgVvnvhWHWJQrW3ih+eHbBZAsQ7jlJzyLL2friwVeGN7h4OVLDbUlT9Kc1u0CLDjK20c4Wh92w76fHXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322722; c=relaxed/simple;
	bh=ZgcR4BPDkgJOhaFYnmGOT7W84Ut3jJpHa2LiCo3aynI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=WmX8qHLV6S18rR2Mlo8NWTQ83EkKtyzIduEDDdRH8TDJdKqphs91GrCvzaTuC6uc1JPUAF1qTceEtrdhEbCsvYgpJFMhY3FLcgzp9Vq+8uHT/p8+iT/gJnxn6jjHFE9srgF6O4YwgWA5Xi7eCMW6P3b0eY7RnnZFXk3P8Y6Kxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24617497;
	Fri, 31 Jan 2025 03:25:46 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3BBC3F63F;
	Fri, 31 Jan 2025 03:25:19 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:14 +0000
Subject: [PATCH v2 14/18] firmware: arm_ffa: Refactoring to prepare for
 framework notification support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-14-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4795; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=ZgcR4BPDkgJOhaFYnmGOT7W84Ut3jJpHa2LiCo3aynI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQsqAE30dOKy62jz2nUZR/oYdHf0sbSiENx
 g8B81NL/uyJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mFzhD/4qNj1Wd7+GkduNChQUy4XYLB2hxQxIfPfU35qn6Skmesb+jplAAx0k7saDEEIJYmbGIz2
 4O4dLuyExjRXvTuCLNEVvFux0Lp5f53w56F7nxeBFd7/83bW/3sG+hwnUAJG1d3s4XanCZZdSRO
 hUbA3znldhzU6265D73ZOo9BW8YXUTmpSF2MFK4q3NjMpGhLh6juM1F+7lDoqwIzxRaH2HRebgv
 yRutLF9szg6TUAfeCH+W8i7JDa+BIM0tl2/urE8wrrum3arkPUG0S5H+d98sU6k7DADgArRiBTy
 cGuaAduP0JJ8AJw7zigtGwYM1XyoZHJX1wt/pfAfQq5WHZWj5SysbG9IWJ2FoXRok0Je7Vz8G1b
 xI6xU+XULj0dXXEINYf1GwvQ/SEGIwKiLrc9h78GzNnB5BPh53fcPRjJDERQwhGtaNPDdeGjQPh
 XuKfvx28/yvk5ymTmd8GcckoDM/CCTPAw/gy8k0mqVJ+WhAZoXOcc+CT4EMNSkMidxUbdSV5MDL
 7/cl/oNBYW6Rx/p17PnyzdTZuiQUlxyGp0T7V/7X2OKtl2dIynLFJ1YwbXYbUXmGEAlaKbrqIEX
 FjDr2rjnWsx42lqwTXpNyNxVkppbSTF7g4Zq9f4/QLOw3zn51tOmlkJSkW7RhHNEGy/wqqMmMRA
 smSX6IlNj0Izp+w==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently, the framework notifications are not supported at all.
handle_notif_callbacks() doesn't handle them though it is called with
framework bitmap. Make that explicit by adding checks for the same.

Also, we need to further classify the framework notifications as Secure
Partition Manager(SPM) and NonSecure Hypervisor(NS_HYP). Extend/change
notify_type enumeration to accommodate all the 4 type and rejig the
values so that it can be reused in the bitmap enable mask macros.

While at this, move ffa_notify_type_get() so that it can be used in
notifier_hash_node_get() in the future.

No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 57 +++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 7282aeb3ee498b09010aa2867ef94bf3e0248008..dc2d05bb361272b4100802503dd883c17f8900f3 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -807,6 +807,13 @@ static int ffa_notification_bitmap_destroy(void)
 	return 0;
 }
 
+enum notify_type {
+	SECURE_PARTITION,
+	NON_SECURE_VM,
+	SPM_FRAMEWORK,
+	NS_HYP_FRAMEWORK,
+};
+
 #define NOTIFICATION_LOW_MASK		GENMASK(31, 0)
 #define NOTIFICATION_HIGH_MASK		GENMASK(63, 32)
 #define NOTIFICATION_BITMAP_HIGH(x)	\
@@ -830,10 +837,17 @@ static int ffa_notification_bitmap_destroy(void)
 #define MAX_IDS_32				10
 
 #define PER_VCPU_NOTIFICATION_FLAG		BIT(0)
-#define SECURE_PARTITION_BITMAP			BIT(0)
-#define NON_SECURE_VM_BITMAP			BIT(1)
-#define SPM_FRAMEWORK_BITMAP			BIT(2)
-#define NS_HYP_FRAMEWORK_BITMAP			BIT(3)
+#define SECURE_PARTITION_BITMAP_ENABLE		BIT(SECURE_PARTITION)
+#define NON_SECURE_VM_BITMAP_ENABLE		BIT(NON_SECURE_VM)
+#define SPM_FRAMEWORK_BITMAP_ENABLE		BIT(SPM_FRAMEWORK)
+#define NS_HYP_FRAMEWORK_BITMAP_ENABLE		BIT(NS_HYP_FRAMEWORK)
+#define FFA_BITMAP_ENABLE_MASK			\
+	(SECURE_PARTITION_BITMAP_ENABLE | SPM_FRAMEWORK_BITMAP_ENABLE)
+
+#define FFA_SECURE_PARTITION_ID_FLAG		BIT(15)
+
+#define SPM_FRAMEWORK_BITMAP(x)			NOTIFICATION_BITMAP_LOW(x)
+#define NS_HYP_FRAMEWORK_BITMAP(x)		NOTIFICATION_BITMAP_HIGH(x)
 
 static int ffa_notification_bind_common(u16 dst_id, u64 bitmap,
 					u32 flags, bool is_bind)
@@ -1098,16 +1112,8 @@ static int ffa_memory_lend(struct ffa_mem_ops_args *args)
 	return ffa_memory_ops(FFA_MEM_LEND, args);
 }
 
-#define FFA_SECURE_PARTITION_ID_FLAG	BIT(15)
-
 #define ffa_notifications_disabled()	(!drv_info->notif_enabled)
 
-enum notify_type {
-	NON_SECURE_VM,
-	SECURE_PARTITION,
-	FRAMEWORK,
-};
-
 struct notifier_cb_info {
 	struct hlist_node hnode;
 	ffa_notifier_cb cb;
@@ -1166,6 +1172,14 @@ static int ffa_notification_unbind(u16 dst_id, u64 bitmap)
 	return ffa_notification_bind_common(dst_id, bitmap, 0, false);
 }
 
+static enum notify_type ffa_notify_type_get(u16 vm_id)
+{
+	if (vm_id & FFA_SECURE_PARTITION_ID_FLAG)
+		return SECURE_PARTITION;
+	else
+		return NON_SECURE_VM;
+}
+
 /* Should be called while the notify_lock is taken */
 static struct notifier_cb_info *
 notifier_hash_node_get(u16 notify_id, enum notify_type type)
@@ -1209,14 +1223,6 @@ update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
 	return 0;
 }
 
-static enum notify_type ffa_notify_type_get(u16 vm_id)
-{
-	if (vm_id & FFA_SECURE_PARTITION_ID_FLAG)
-		return SECURE_PARTITION;
-	else
-		return NON_SECURE_VM;
-}
-
 static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
 {
 	int rc;
@@ -1299,6 +1305,9 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 	int notify_id;
 	struct notifier_cb_info *cb_info = NULL;
 
+	if (type == SPM_FRAMEWORK || type == NS_HYP_FRAMEWORK)
+		return;
+
 	for (notify_id = 0; notify_id <= FFA_MAX_NOTIFICATIONS && bitmap;
 	     notify_id++, bitmap >>= 1) {
 		if (!(bitmap & 1))
@@ -1318,16 +1327,18 @@ static void notif_get_and_handle(void *unused)
 	int rc;
 	struct ffa_notify_bitmaps bitmaps;
 
-	rc = ffa_notification_get(SECURE_PARTITION_BITMAP |
-				  SPM_FRAMEWORK_BITMAP, &bitmaps);
+	rc = ffa_notification_get(FFA_BITMAP_ENABLE_MASK, &bitmaps);
 	if (rc) {
 		pr_err("Failed to retrieve notifications with %d!\n", rc);
 		return;
 	}
 
+	handle_notif_callbacks(SPM_FRAMEWORK_BITMAP(bitmaps.arch_map),
+			       SPM_FRAMEWORK);
+	handle_notif_callbacks(NS_HYP_FRAMEWORK_BITMAP(bitmaps.arch_map),
+			       NS_HYP_FRAMEWORK);
 	handle_notif_callbacks(bitmaps.vm_map, NON_SECURE_VM);
 	handle_notif_callbacks(bitmaps.sp_map, SECURE_PARTITION);
-	handle_notif_callbacks(bitmaps.arch_map, FRAMEWORK);
 }
 
 static void

-- 
2.34.1

