Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DCC236A98;
	Wed,  2 Apr 2025 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590580; cv=none; b=nl25Um7EIn/9iq68T6kp+ZiKznw1HV6TL4f9yJOVzEgyIC0Nfj7o4jBVssh+fSqYV98kzV+gL3pd3MNNhymyZLi/0b9KhpwyQ8CnHtPFW8fAsU/aTTORpUzF4Bb9hGI4X0xwkZHqySD8lqEn4UWWDn62u5VXDWo8JPyKlbuydJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590580; c=relaxed/simple;
	bh=rlDlw3yUfuqzlrhTpPvQV6Fd9LaYQCd9M9OhxHLbQ8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqKRExLt7zHZW+4Iy91RTcu1NPE48FuWf3kqp7WvV9XTZFeJYC4h5VM6IDNo6nCRQFOasBrUojRge5TBomiTN3YLdb7icLfkSBet8rKiMVD4s9mZW3TgfSoz771f5XgG2cdJnnslDCfc1oyYf+J5eKOPFKZZkhnNayyNhxMXEAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvOfbbLM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvOfbbLM"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so51854311fa.2;
        Wed, 02 Apr 2025 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743590576; x=1744195376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1mbvCMn3XwC0PBtIyIiFWpjjAurXmIwAPDT7wRHCMU=;
        b=gvOfbbLMFRcHGfrWbYqqMxc0MDNzG6NaLYIKHaqVAkDHuw1NeIMAezcwMmaDaHxugP
         VsWmfKsmNdRtRZOYGFSKNjZt2kEjEE9TPRH1QU6JWVwlqkuQLYHKMDIl/hU6BAICQmaQ
         sLVaIPIUdbu8WejN6kDSUNcvChmt+XlMIo9Hl34Se2i0TEwi5qm2IEUwKGyK9E5A71Lr
         qfI5/ECDQrH4vPPJvid3hnT08jz0HMJHf9uQjTxe6C9kovKG5yIBMv1twqA22vShVhNP
         LvVI9L50GC727svBCqCSweaG9s5RbxwwJhGBlxP60iBFPfX//KrN9I/6WVKGESV469bL
         viKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743590576; x=1744195376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1mbvCMn3XwC0PBtIyIiFWpjjAurXmIwAPDT7wRHCMU=;
        b=J/dHOEhhp68nYdsLsj2X5k5DhAJv8iLZPIwD4PBZOzOyTkFAgQUkHRIYZqaRgjNqbT
         gIdWHIKxPmkZOqCUM4cQblHsPQ/xnMGLTp3uL1Qc/DIQe0qDWcmEXd1AtnNEX2AwlITW
         Y737fV4jsm2SAg9sXQv2EpzLlbkPecm2qfFMFnJ6CzxUkR5s648ETvk4wCnB3/URYx/8
         ru+hukb7bBBhBKUmbZqKp495PepyZ8/o4CUK/AANd0GgYZVktHfK36G8jNh3SgceHDUd
         oaXbSKIKziUjaY3UEveOL156KQ4wcirXfC2C/Dvexxvh+WuQhroL8oLH0ddAVVFBmSUN
         AAVg==
X-Gm-Message-State: AOJu0YzfQPCcjjpZv//crAwdh+uQ6rk6/EKG+9dxO+UGayhclkt4lsq6
	fbgN3OPEWMQ1alddYEJsWM6cnnPsS3+74l4ZAkP2pcNXBdRYukvbhe4nO19KGBk=
X-Gm-Gg: ASbGncuYnB0gnBbhX1pwGzCWwDTeun2e5xqhszUepyJiSI4UUu6ANxv0mNfOHnnQGm/
	ozPRvGlQh2BNKRAqe2JlCsxm9uDroKBRdcRrGMgdcyoiMGFS6Dnlzvp25UYwcOk8sF2IJRVsV8y
	dSpwOa9PXHzYxjnIRJEE38RD/UPM8WjXfDoDiL+0PXN8D+eXUnUv9Hb7O62wIxeKbYMx+XXZMcR
	K7BaR7oF2zOdg4aoz78f+NLDSMJNQsDB5wFwb/UrW2sn5lYwExGd1sLRhjfi6Apb8E2oAtE2NLI
	D/uXH7OmSlBnxgdKtHnGNf/D1Sv1flBa5Lb66Y/OrAPBmDFWE7zSAdVN
X-Google-Smtp-Source: AGHT+IHUnkrYXSw/2I9Wcm8+rw+8y4bSPSdJ8VkZy3rq67co93W4W8kouj6dzFPAvTT6KftaxQ23kw==
X-Received: by 2002:a2e:bd84:0:b0:30b:d562:c154 with SMTP id 38308e7fff4ca-30de0278501mr68735231fa.19.1743590575982;
        Wed, 02 Apr 2025 03:42:55 -0700 (PDT)
Received: from NB-5360.corp.yadro.com ([89.250.166.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ab84afsm21033121fa.35.2025.04.02.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:42:55 -0700 (PDT)
From: Matthew Bystrin <dev.mbstr@gmail.com>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] firmware: arm_scmi: add timeout in do_xfer_with_response()
Date: Wed,  2 Apr 2025 13:42:54 +0300
Message-ID: <20250402104254.149998-1-dev.mbstr@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add timeout argument to do_xfer_with_response() with subsequent changes
in corresponding drivers. To maintain backward compatibility use
previous hardcoded timeout value.

According to SCMI specification [1] there is no defined timeout for
delayed messages in the interface. While hardcoded 2 seconds timeout
might be good enough for existing protocol drivers, moving it to the
function argument may be useful for vendor-specific protocols with
different timing needs.

Link: https://developer.arm.com/Architectures/System%20Control%20and%20Management%20Interface
Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
---
 drivers/firmware/arm_scmi/clock.c     | 2 +-
 drivers/firmware/arm_scmi/common.h    | 1 -
 drivers/firmware/arm_scmi/driver.c    | 6 ++++--
 drivers/firmware/arm_scmi/powercap.c  | 2 +-
 drivers/firmware/arm_scmi/protocols.h | 3 ++-
 drivers/firmware/arm_scmi/reset.c     | 2 +-
 drivers/firmware/arm_scmi/sensors.c   | 4 ++--
 drivers/firmware/arm_scmi/voltage.c   | 2 +-
 include/linux/scmi_protocol.h         | 1 +
 9 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 2ed2279388f0..4b5cd73384c3 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -596,7 +596,7 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 	cfg->value_high = cpu_to_le32(rate >> 32);
 
 	if (flags & CLOCK_SET_ASYNC) {
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_msg_resp_set_rate_complete *resp;
 
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 10ea7962323e..34527366c909 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -29,7 +29,6 @@
 
 #define SCMI_MAX_CHANNELS		256
 
-#define SCMI_MAX_RESPONSE_TIMEOUT	(2 * MSEC_PER_SEC)
 
 #define SCMI_SHMEM_MAX_PAYLOAD_SIZE	104
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1c75a4c9c371..51c6634d5505 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1490,6 +1490,7 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
  *
  * @ph: Pointer to SCMI protocol handle
  * @xfer: Transfer to initiate and wait for response
+ * @timeout_ms: Delayed response wait timeout, if unsure use SCMI_DEFAULT_TIMEOUT
  *
  * Using asynchronous commands in atomic/polling mode should be avoided since
  * it could cause long busy-waiting here, so ignore polling for the delayed
@@ -1509,9 +1510,10 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
  *	return corresponding error, else if all goes well, return 0.
  */
 static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
-				 struct scmi_xfer *xfer)
+				 struct scmi_xfer *xfer, unsigned long timeout_ms)
 {
-	int ret, timeout = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
+	int ret;
+	unsigned long timeout = msecs_to_jiffies(timeout_ms);
 	DECLARE_COMPLETION_ONSTACK(async_response);
 
 	xfer->async_done = &async_response;
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1fa79bba492e..82565dacd301 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -386,7 +386,7 @@ static int scmi_powercap_xfer_cap_set(const struct scmi_protocol_handle *ph,
 	if (!pc->async_powercap_cap_set || ignore_dresp) {
 		ret = ph->xops->do_xfer(ph, t);
 	} else {
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_msg_resp_powercap_cap_set_complete *resp;
 
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index aaee57cdcd55..b1e3cf3601fe 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -307,7 +307,8 @@ struct scmi_xfer_ops {
 	int (*do_xfer)(const struct scmi_protocol_handle *ph,
 		       struct scmi_xfer *xfer);
 	int (*do_xfer_with_response)(const struct scmi_protocol_handle *ph,
-				     struct scmi_xfer *xfer);
+				     struct scmi_xfer *xfer,
+				     unsigned long timeout_ms);
 	void (*xfer_put)(const struct scmi_protocol_handle *ph,
 			 struct scmi_xfer *xfer);
 };
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..a458b1c16c51 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -198,7 +198,7 @@ static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
 	dom->reset_state = cpu_to_le32(state);
 
 	if (flags & ASYNCHRONOUS_RESET)
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 	else
 		ret = ph->xops->do_xfer(ph, t);
 
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 791efd0f82d7..9a07399237f5 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -871,7 +871,7 @@ static int scmi_sensor_reading_get(const struct scmi_protocol_handle *ph,
 	s = si->sensors + sensor_id;
 	if (s->async) {
 		sensor->flags = cpu_to_le32(SENSOR_READ_ASYNC);
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_resp_sensor_reading_complete *resp;
 
@@ -943,7 +943,7 @@ scmi_sensor_reading_get_timestamped(const struct scmi_protocol_handle *ph,
 	sensor->id = cpu_to_le32(sensor_id);
 	if (s->async) {
 		sensor->flags = cpu_to_le32(SENSOR_READ_ASYNC);
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			int i;
 			struct scmi_resp_sensor_reading_complete_v3 *resp;
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index fda6a1573609..26b1f034256b 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -348,7 +348,7 @@ static int scmi_voltage_level_set(const struct scmi_protocol_handle *ph,
 		ret = ph->xops->do_xfer(ph, t);
 	} else {
 		cmd->flags = cpu_to_le32(0x1);
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_resp_voltage_level_set_complete *resp;
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..2426daae8a87 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -16,6 +16,7 @@
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
 #define SCMI_MAX_NUM_RATES		16
+#define SCMI_DEFAULT_TIMEOUT		(2 * MSEC_PER_SEC)
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.47.2

