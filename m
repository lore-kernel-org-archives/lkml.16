Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDB425B2F4;
	Mon, 30 Jun 2025 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280967; cv=none; b=T9wNQqOMK7+YFwLxvGgnHw23sdK/bxVAgqwrEXo5tpJpOuRxQ4LK80IeEhIOvzwtp3rbSi0+qYfIRxfVGHfGhUBmZql0e6YqTQRV3dWv3Kwkv9BPqSvbvtQ2PmlDfeHnBtrbROeOGCXrrHAzncW1C+28bYmFPViY60LR46CPxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280967; c=relaxed/simple;
	bh=UDtO93Ewr9G4bfy7ZqLigw2eIdqG7Zr/5Eq1eSR2TFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FB78ZYzyYsxv4um3GYiQGODF+/xu3FBkwOBF1rgIksmsV79apuffLQ+WGY479SPyutUC0+IgXC9zPSobAQwvOEXXeU8LMnJxr+XD6Oy0vH9M5Ii3/uVFvgM6XoGuO0KkNIVzMGKL0nBM0d1AmWNZC5EUE+g2sAlo0dX635eR6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6C31FCD;
	Mon, 30 Jun 2025 03:55:49 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320183F6A8;
	Mon, 30 Jun 2025 03:56:04 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH v2 2/3] firmware: arm_scmi: Add xfer_inflight counter
Date: Mon, 30 Jun 2025 10:55:42 +0000
Message-Id: <20250630105544.531723-3-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630105544.531723-1-philip.radford@arm.com>
References: <20250630105544.531723-1-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a counter to the debug_counters struct to record the current
number of outstanding inflight xfers.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V1->V2
- Amended commit message
---
 drivers/firmware/arm_scmi/common.h |  1 +
 drivers/firmware/arm_scmi/driver.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index c6495c4a0e8a..ad9232c982ce 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -305,6 +305,7 @@ enum debug_counters {
 	ERR_MSG_INVALID,
 	ERR_MSG_NOMEM,
 	ERR_PROTOCOL,
+	XFERS_INFLIGHT,
 	SCMI_DEBUG_COUNTERS_LAST
 };
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 2699c8efef0a..46f15c5b4998 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -190,6 +190,7 @@ struct scmi_info {
 };
 
 #define handle_to_scmi_info(h)	container_of(h, struct scmi_info, handle)
+#define tx_minfo_to_scmi_info(h) container_of(h, struct scmi_info, tx_minfo)
 #define bus_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, bus_nb)
 #define req_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, dev_req_nb)
 
@@ -603,9 +604,14 @@ static inline void
 scmi_xfer_inflight_register_unlocked(struct scmi_xfer *xfer,
 				     struct scmi_xfers_info *minfo)
 {
+	/* In this context minfo will be tx_minfo due to the xfer pending */
+	struct scmi_info *info = tx_minfo_to_scmi_info(minfo);
+
 	/* Set in-flight */
 	set_bit(xfer->hdr.seq, minfo->xfer_alloc_table);
 	hash_add(minfo->pending_xfers, &xfer->node, xfer->hdr.seq);
+	scmi_inc_count(info->dbg->counters, XFERS_INFLIGHT);
+
 	xfer->pending = true;
 }
 
@@ -807,9 +813,13 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 	spin_lock_irqsave(&minfo->xfer_lock, flags);
 	if (refcount_dec_and_test(&xfer->users)) {
 		if (xfer->pending) {
+			struct scmi_info *info = tx_minfo_to_scmi_info(minfo);
+
 			scmi_xfer_token_clear(minfo, xfer);
 			hash_del(&xfer->node);
 			xfer->pending = false;
+
+			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
 		}
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
@@ -2909,6 +2919,7 @@ static const char * const dbg_counter_strs[] = {
 	"err_msg_invalid",
 	"err_msg_nomem",
 	"err_protocol",
+	"xfers_inflight",
 };
 
 static ssize_t reset_all_on_write(struct file *filp, const char __user *buf,
-- 
2.25.1

