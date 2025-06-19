Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9F723FC54;
	Thu, 19 Jun 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335631; cv=none; b=dj9RhgsG3iiGuwwiZAKgEpNCSp18UJDVk1A5PDugWGceG3muB1gUQH7b0sUzK5+deBHqSHDJycduxKO0LHtMzODrojG99rN1n7jLWpsSeZA+oJsiQLwzlXiVV+YZfvAflHRG55QMTVxJWsSgSEsVwobAxkHe3roQ5sHzQFALFoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335631; c=relaxed/simple;
	bh=cmOfFV54TgDt8Kv2nldVli2TIrUourJVFOaNm2q4ee8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oapS8afRe5L8UdiBbCCvoHl/P03ZWv4ETqOdIMJ0GQujcmV6CSaziEC2S2dswDwIKYgV/Z+qCUztC4e2aD0gpqG1dayNAdd7G52Ypjl8v74sNE67n4rRcLaRWaUZ04x+lhpPFi1b6IBdXpntetukv2JySKVHHRAYxRGltXRAUbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC59012FC;
	Thu, 19 Jun 2025 05:20:09 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 760423F66E;
	Thu, 19 Jun 2025 05:20:28 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 3/4] include: trace: Add inflight_xfer counter tracepoint
Date: Thu, 19 Jun 2025 12:20:03 +0000
Message-Id: <20250619122004.3705976-4-philip.radford@arm.com>
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

Add tracepoint for inflight_xfers and patch all related callsites.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/driver.c   |  4 ++--
 drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
 include/trace/events/scmi.h          | 24 ++++++++++++++----------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5a4dac27afdf..c6657582c9ab 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1443,7 +1443,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion);
+			      xfer->hdr.poll_completion, 0);
 
 	/* Clear any stale status */
 	xfer->hdr.status = SCMI_SUCCESS;
@@ -1479,7 +1479,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 		info->desc->ops->mark_txdone(cinfo, ret, xfer);
 
 	trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
-			    xfer->hdr.protocol_id, xfer->hdr.seq, ret);
+			    xfer->hdr.protocol_id, xfer->hdr.seq, ret, 0);
 
 	return ret;
 }
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 3d543b1d8947..2ccb6b3f0e64 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -475,7 +475,8 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 			raw->desc->ops->mark_txdone(rw->cinfo, ret, xfer);
 
 		trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
-				    xfer->hdr.protocol_id, xfer->hdr.seq, ret);
+				    xfer->hdr.protocol_id, xfer->hdr.seq,
+				    ret, 0);
 
 		/* Wait also for an async delayed response if needed */
 		if (!ret && xfer->async_done) {
@@ -642,7 +643,7 @@ static int scmi_do_xfer_raw_start(struct scmi_raw_mode_info *raw,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion);
+			      xfer->hdr.poll_completion, 0);
 
 	ret = raw->desc->ops->send_message(rw->cinfo, xfer);
 	if (ret) {
diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index 127300481123..703b7bb68e44 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -36,8 +36,8 @@ TRACE_EVENT(scmi_fc_call,
 
 TRACE_EVENT(scmi_xfer_begin,
 	TP_PROTO(int transfer_id, u8 msg_id, u8 protocol_id, u16 seq,
-		 bool poll),
-	TP_ARGS(transfer_id, msg_id, protocol_id, seq, poll),
+		 bool poll, int inflight),
+	TP_ARGS(transfer_id, msg_id, protocol_id, seq, poll, inflight),
 
 	TP_STRUCT__entry(
 		__field(int, transfer_id)
@@ -45,6 +45,7 @@ TRACE_EVENT(scmi_xfer_begin,
 		__field(u8, protocol_id)
 		__field(u16, seq)
 		__field(bool, poll)
+		__field(int, inflight)
 	),
 
 	TP_fast_assign(
@@ -53,11 +54,12 @@ TRACE_EVENT(scmi_xfer_begin,
 		__entry->protocol_id = protocol_id;
 		__entry->seq = seq;
 		__entry->poll = poll;
+		__entry->inflight = inflight;
 	),
 
-	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X poll=%u",
-		__entry->protocol_id, __entry->msg_id, __entry->seq,
-		__entry->transfer_id, __entry->poll)
+	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X poll=%u inflight=%d",
+		  __entry->protocol_id, __entry->msg_id, __entry->seq,
+		  __entry->transfer_id, __entry->poll, __entry->inflight)
 );
 
 TRACE_EVENT(scmi_xfer_response_wait,
@@ -90,8 +92,8 @@ TRACE_EVENT(scmi_xfer_response_wait,
 
 TRACE_EVENT(scmi_xfer_end,
 	TP_PROTO(int transfer_id, u8 msg_id, u8 protocol_id, u16 seq,
-		 int status),
-	TP_ARGS(transfer_id, msg_id, protocol_id, seq, status),
+		 int status, int inflight),
+	TP_ARGS(transfer_id, msg_id, protocol_id, seq, status, inflight),
 
 	TP_STRUCT__entry(
 		__field(int, transfer_id)
@@ -99,6 +101,7 @@ TRACE_EVENT(scmi_xfer_end,
 		__field(u8, protocol_id)
 		__field(u16, seq)
 		__field(int, status)
+		__field(int, inflight)
 	),
 
 	TP_fast_assign(
@@ -107,11 +110,12 @@ TRACE_EVENT(scmi_xfer_end,
 		__entry->protocol_id = protocol_id;
 		__entry->seq = seq;
 		__entry->status = status;
+		__entry->inflight = inflight;
 	),
 
-	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X s=%d",
-		__entry->protocol_id, __entry->msg_id, __entry->seq,
-		__entry->transfer_id, __entry->status)
+	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X s=%d inflight=%d",
+		  __entry->protocol_id, __entry->msg_id, __entry->seq,
+		  __entry->transfer_id, __entry->status, __entry->inflight)
 );
 
 TRACE_EVENT(scmi_rx_done,
-- 
2.25.1

