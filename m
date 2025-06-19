Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BC3256C6D;
	Thu, 19 Jun 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335634; cv=none; b=MMIl+EfHtGPedA94KJdDfujZ9xF/YfJtwkNlo8YA/Nwd+NoaDoXuHF1bipfsAn8m3tRINosD+bF7NugohJt6m0NpUGgWvPW5z1lndpoEVxEZkAXvpdyE+wL0y1ewGw7PNA62SUJI2J+Nt9Q6WbhbD1eFPdKTrRIoip6AzAti+7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335634; c=relaxed/simple;
	bh=34J/Q9Gqn/8ZZ73Va2vW5AGxOEj4S15ZUEmJ+4pihow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBtV/TwqofKuTWJDJ3rjcyKTfzML4kLXEacNH7+fz721I22bgsz+6Mt0r73BWkRrtl9x1gotSAVBcZ1bzA5Ool6MVA9w7nko/Tfh2TjGm4wJYYBc7ft0WyUbV6Vh7v1AuwBqonXrr+f3nhfa5QpDtqDqemcm870QuUcFE+zir2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27F61106F;
	Thu, 19 Jun 2025 05:20:12 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFE263F66E;
	Thu, 19 Jun 2025 05:20:30 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing functionality
Date: Thu, 19 Jun 2025 12:20:04 +0000
Message-Id: <20250619122004.3705976-5-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds scmi_inflight_count function to fetch the current xfer
inflight count to use in trace

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/common.h   |  1 +
 drivers/firmware/arm_scmi/driver.c   | 17 +++++++++++++++--
 drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index ad9232c982ce..07b9e629276d 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -505,4 +505,5 @@ static struct platform_driver __drv = {					       \
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
+int scmi_inflight_count(const struct scmi_handle *handle);
 #endif /* _SCMI_COMMON_H */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index c6657582c9ab..d128d497f96e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1443,7 +1443,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion, 0);
+			      xfer->hdr.poll_completion,
+				  scmi_inflight_count(&info->handle));
 
 	/* Clear any stale status */
 	xfer->hdr.status = SCMI_SUCCESS;
@@ -1479,7 +1480,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 		info->desc->ops->mark_txdone(cinfo, ret, xfer);
 
 	trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
-			    xfer->hdr.protocol_id, xfer->hdr.seq, ret, 0);
+			    xfer->hdr.protocol_id, xfer->hdr.seq, ret,
+				scmi_inflight_count(&info->handle));
 
 	return ret;
 }
@@ -3416,6 +3418,17 @@ static struct dentry *scmi_debugfs_init(void)
 	return d;
 }
 
+int scmi_inflight_count(const struct scmi_handle *handle)
+{
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS)) {
+		struct scmi_info *info = handle_to_scmi_info(handle);
+
+		return atomic_read(&info->dbg->counters[XFERS_INFLIGHT]);
+	} else {
+		return 0;
+	}
+}
+
 static int __init scmi_driver_init(void)
 {
 	scmi_quirks_initialize();
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 2ccb6b3f0e64..eebe1a5297ef 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -476,7 +476,7 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 
 		trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
 				    xfer->hdr.protocol_id, xfer->hdr.seq,
-				    ret, 0);
+				    ret, scmi_inflight_count(raw->handle));
 
 		/* Wait also for an async delayed response if needed */
 		if (!ret && xfer->async_done) {
@@ -643,7 +643,8 @@ static int scmi_do_xfer_raw_start(struct scmi_raw_mode_info *raw,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion, 0);
+			      xfer->hdr.poll_completion,
+				  scmi_inflight_count(raw->handle));
 
 	ret = raw->desc->ops->send_message(rw->cinfo, xfer);
 	if (ret) {
-- 
2.25.1

