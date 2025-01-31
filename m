Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9601BD9FF
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322726; cv=none; b=GRPwuPInPya+owWJhrC6tVATijgKVx4EvdzLJIxZXPN9M0QkNFZYJL+BW/O3GsZKu2Fc6XmvqR8qdvzCH/pTCOYW/Lus5MWvN66UReFN7LxahsKvQ8MS2nxuWDeSezeKfUPbKLW6kKSbf4wzjEtk4WTiO3BN/YSTk1KEpMFfOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322726; c=relaxed/simple;
	bh=tKQtXeBcDSeq+ploR2WzRap4P0UUs9Qp+htINEVCR1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=oDZVMfrxOFrWb6f6zxT+XdBpfVSBCKPb6t6Va7/JAtsXuxpsX3VkdVZSIV8TOpBFtMMaud4O0YEq7U/AADhtGioagJlr2ehmCqNFZ49wUuyaDdamxroa3YYwre4WibMW0Mgza4CTHPXpnetb/xkE8BZiDsfIL6tkqplY9cOViuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36FCFFEC;
	Fri, 31 Jan 2025 03:25:49 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 124173F63F;
	Fri, 31 Jan 2025 03:25:22 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:17 +0000
Subject: [PATCH v2 17/18] firmware: arm_ffa: Add support for handling
 framework notifications
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3890; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=tKQtXeBcDSeq+ploR2WzRap4P0UUs9Qp+htINEVCR1o=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMRaBLHl9ojapsEGCM6b2KTz+ItevgFDZIDQ
 g1S8E9JRRGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEQAKCRAAQbq8MX7i
 mErdEACJ1il05A/YjFwK7OClKWTbrQKJfoMoYp/6nGQ4xmdevFT9uEaHdcSOnw8OfpvPO7Pq3Fl
 NX2H4NJUsvf++KeU7RdXwJASw6ZvOrnab/N/u85tTJWYN9nlaOStrtFx9lDxACy/xQ7oGWeNLA0
 59N8lMfKkCf8hF3E/KX4iDftiAeCqWgAk3X0JSUktyTkd02+WI0D4RvTcazRvuqEu9O4+GBZ0C6
 lQ4yFSxe2bgNPyWNqVl/+RlLBaaq+/8ubge8bnRsv50gGCCcksD+PfXarBoQlmJWFt0/JTv1KO7
 5rdEbM70DS3QzjOwDIXP9s6ckkphFfl3U0nKWck04htjSLtRCqLCOz8/UxeQh4Xw+EfwzcgZtLI
 BKE460F5Dp/cxjCpDKg9TZxKqI1Z3wudPW/wLacFGuGnV1eSE5rRWqophcA79u0HpQKawO/Aijc
 35X9DKkP8WZPP6zVjw2yJbIMzypmF7RebfQEwCqvwPjVOwZ93ZpMqMiZ1DPeAgLswqdu8oGzjUc
 oyxPmdZKeHl8/51VskArCJtlULpjus8r+assS8viiFd+H3TV8RhT5tNs/NUXxR3MVq3QmE1Dzid
 /aiM1EchQm0hI0d28y9Jsj16B0ESOxhaxVdIODlPavUuALVqSqfGvBQm2CWUa32t1FMPl3WiMGr
 Mg5Yg0oj8cjwPYQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently FF-A specification defines only one framework notification:
RX buffer full notification. This notification is signaled by the
partition manager during transmission of a partition message through
indirect messaging to,

1. Notify an endpoint that it has a pending message in its Rx buffer.
2. Inform the message receiver’s scheduler via the schedule receiver
   interrupt that the receiver must be run.

In response to an FFA_MSG_SEND2 invocation by a sender endpoint, the
framework performs the following actions after the message is copied
from the Tx buffer of the sender to the Rx buffer of the receiver:

1. The notification is pended in the framework notification bitmap of
   the receiver.
2. The partition manager of the endpoint that contains receiver’s
   scheduler pends the schedule receiver interrupt for this endpoint.

The receiver receives the notification and copies out the message from
its Rx buffer.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 50 +++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f0e853584b51645cd7f590e4cb8d01ca1e7914dc..ab50836adc75ab4bdab3c2da7e23ec5d11826e8b 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -848,6 +848,7 @@ enum notify_type {
 
 #define SPM_FRAMEWORK_BITMAP(x)			NOTIFICATION_BITMAP_LOW(x)
 #define NS_HYP_FRAMEWORK_BITMAP(x)		NOTIFICATION_BITMAP_HIGH(x)
+#define FRAMEWORK_NOTIFY_RX_BUFFER_FULL		BIT(0)
 
 static int ffa_notification_bind_common(u16 dst_id, u64 bitmap,
 					u32 flags, bool is_bind)
@@ -1373,9 +1374,6 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 	int notify_id;
 	struct notifier_cb_info *cb_info = NULL;
 
-	if (type == SPM_FRAMEWORK || type == NS_HYP_FRAMEWORK)
-		return;
-
 	for (notify_id = 0; notify_id <= FFA_MAX_NOTIFICATIONS && bitmap;
 	     notify_id++, bitmap >>= 1) {
 		if (!(bitmap & 1))
@@ -1390,6 +1388,46 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 	}
 }
 
+static void handle_fwk_notif_callbacks(u32 bitmap)
+{
+	void *buf;
+	uuid_t uuid;
+	int notify_id = 0, target;
+	struct ffa_indirect_msg_hdr *msg;
+	struct notifier_cb_info *cb_info = NULL;
+
+	/* Only one framework notification defined and supported for now */
+	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
+		return;
+
+	mutex_lock(&drv_info->rx_lock);
+
+	msg = drv_info->rx_buffer;
+	buf = kmalloc(msg->size, GFP_KERNEL);
+	if (!buf) {
+		mutex_unlock(&drv_info->rx_lock);
+		return;
+	}
+	memcpy(buf, (void *)msg + msg->offset, msg->size);
+	target = SENDER_ID(msg->send_recv_id);
+	if (msg->offset >= sizeof(*msg))
+		uuid_copy(&uuid, &msg->uuid);
+	else
+		uuid_copy(&uuid, &uuid_null);
+
+	mutex_unlock(&drv_info->rx_lock);
+
+	ffa_rx_release();
+
+	mutex_lock(&drv_info->notify_lock);
+	cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, target, &uuid);
+	mutex_unlock(&drv_info->notify_lock);
+
+	if (cb_info && cb_info->fwk_cb)
+		cb_info->fwk_cb(notify_id, cb_info->cb_data, buf);
+	kfree(buf);
+}
+
 static void notif_get_and_handle(void *unused)
 {
 	int rc;
@@ -1401,10 +1439,8 @@ static void notif_get_and_handle(void *unused)
 		return;
 	}
 
-	handle_notif_callbacks(SPM_FRAMEWORK_BITMAP(bitmaps.arch_map),
-			       SPM_FRAMEWORK);
-	handle_notif_callbacks(NS_HYP_FRAMEWORK_BITMAP(bitmaps.arch_map),
-			       NS_HYP_FRAMEWORK);
+	handle_fwk_notif_callbacks(SPM_FRAMEWORK_BITMAP(bitmaps.arch_map));
+	handle_fwk_notif_callbacks(NS_HYP_FRAMEWORK_BITMAP(bitmaps.arch_map));
 	handle_notif_callbacks(bitmaps.vm_map, NON_SECURE_VM);
 	handle_notif_callbacks(bitmaps.sp_map, SECURE_PARTITION);
 }

-- 
2.34.1

