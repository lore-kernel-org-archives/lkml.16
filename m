Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966D22ACD0;
	Wed,  5 Feb 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745152; cv=none; b=inH+EdOZN2Y1SDXTJHOlTDKQeKbrjB9FRZKjMu9MHN5AWEQIKITRBfAg/5ucx6OMRXGGCP/ymansb80yyE1V2rGL+zRC84eOYrfky/RFfiNgJUy8KnwwOBgEFRGFV9KVb/Q5TRHnOOeXIvOqMvFejmR0iMVUUO2tQUGfR31KmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745152; c=relaxed/simple;
	bh=LQwC/nQvLyv/dmplx7riZpznrwK9WeET+tsgAx+K96s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nRJCfce/lBTsFZ63xR6fZ8/T7aDm2p5XH39K2Th54iSb1tKL5B01RWUlljDdiuH3S6aMhTBR6k+SRCO7mdboLQ5svZTtk+PPuUhpJGUsZ7jVFc4InZi4pdPdXY0llJeuYHjtuC62PE0ItvbDnWU7Wvv5F8uO48Qwa5cE07dFHPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUIEFT7j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUIEFT7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745150; x=1770281150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LQwC/nQvLyv/dmplx7riZpznrwK9WeET+tsgAx+K96s=;
  b=CUIEFT7jZigda3UOJ9Qn4ezvL+he58Al6AJ/j0WYE3MGQ89/YwvQNAj0
   3ZFLBKVQiijXp+qhjTnjrOQnfokJMdL/xjXlDNoJCpHSv9QiIiFzxDVR7
   uzWfK/LyCLMxSiT7l26WKDbNhju4uaR2nOdNiJxEztVbsbjX+PVtH/7xn
   3HEtwOB16Uet4Km53+5GTStSRpsJn7yeeOd/TYqOTvkVQwQhowxPP7NjH
   ksHbHpJD7ZJTJRd9gj1U1C8soYqVxWQbESUCvuqb5nlKS16VxhknugwFW
   r8QxidTx9rAWj4oj7laigfNkGcf19Ky1+6LExShGgc2ykKhYKUUj20vkd
   Q==;
X-CSE-ConnectionGUID: CUgd4n1+Q2uiz3bt1aaV9g==
X-CSE-MsgGUID: UXTY4rEKQrmJiItB6ra4nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532519"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532519"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:50 -0800
X-CSE-ConnectionGUID: 7cXVJW29SXiMpHvqHXXZrA==
X-CSE-MsgGUID: 5hINKueNQDqay/k1RzJZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887853"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:50 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 07/16] soundwire: bus: add send_async/wait APIs for BPT protocol
Date: Wed,  5 Feb 2025 16:45:21 +0800
Message-ID: <20250205084531.158763-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Add definitions and helpers for the BPT/BRA protocol. Peripheral
drivers (aka ASoC codec drivers) can use this API to send bulk data
such as firmware or tables. The design intent is however NOT to
directly use this API but to rely on an intermediate regmap layer.

The API is only available when no other audio streams have been
allocated, and only one BTP/BRA stream is allowed per link. To avoid
the addition of yet another lock, the refcount tests are handled in
the stream master_runtime alloc/free routines where the bus_lock is
already held. Another benefit of this approach is that the same
bus_lock is used to handle runtime and port linked lists, which
reduces the potential for misaligned configurations.

In addition to exclusion with audio streams, BPT transfers have a lot
of overhead, specifically registers writes are needed to enable
transport in DP0. Most DMAs don't handle too well very small data sets
and they may have alignment limitations.

The size and alignment requirements are for now not handled by the
core but must be checked by platform-specific drivers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/bus.c       | 43 +++++++++++++++++++++++++++++++++++
 drivers/soundwire/bus.h       | 18 +++++++++++++++
 drivers/soundwire/stream.c    | 30 ++++++++++++++++++++++++
 include/linux/soundwire/sdw.h | 23 +++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9b295fc9acd5..b72549429adb 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -2038,3 +2038,46 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 	}
 }
 EXPORT_SYMBOL(sdw_clear_slave_status);
+
+int sdw_bpt_send_async(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg)
+{
+	if (msg->len > SDW_BPT_MSG_MAX_BYTES) {
+		dev_err(bus->dev, "Invalid BPT message length %d\n", msg->len);
+		return -EINVAL;
+	}
+
+	/* check device is enumerated */
+	if (slave->dev_num == SDW_ENUM_DEV_NUM ||
+	    slave->dev_num > SDW_MAX_DEVICES) {
+		dev_err(&slave->dev, "Invalid device number %d\n", slave->dev_num);
+		return -ENODEV;
+	}
+
+	/* make sure all callbacks are defined */
+	if (!bus->ops->bpt_send_async ||
+	    !bus->ops->bpt_wait) {
+		dev_err(bus->dev, "BPT callbacks not defined\n");
+		return -EOPNOTSUPP;
+	}
+
+	return bus->ops->bpt_send_async(bus, slave, msg);
+}
+EXPORT_SYMBOL(sdw_bpt_send_async);
+
+int sdw_bpt_wait(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg)
+{
+	return bus->ops->bpt_wait(bus, slave, msg);
+}
+EXPORT_SYMBOL(sdw_bpt_wait);
+
+int sdw_bpt_send_sync(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg)
+{
+	int ret;
+
+	ret = sdw_bpt_send_async(bus, slave, msg);
+	if (ret < 0)
+		return ret;
+
+	return sdw_bpt_wait(bus, slave, msg);
+}
+EXPORT_SYMBOL(sdw_bpt_send_sync);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index fc990171b3f7..02651fbb683a 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -72,6 +72,24 @@ struct sdw_msg {
 	bool page;
 };
 
+/**
+ * struct sdw_btp_msg - Message structure
+ * @addr: Start Register address accessed in the Slave
+ * @len: number of bytes to transfer. More than 64Kb can be transferred
+ * but a practical limit of SDW_BPT_MSG_MAX_BYTES is enforced.
+ * @dev_num: Slave device number
+ * @flags: transfer flags, indicate if xfer is read or write
+ * @buf: message data buffer (filled by host for write, filled
+ * by Peripheral hardware for reads)
+ */
+struct sdw_bpt_msg {
+	u32 addr;
+	u32 len;
+	u8 dev_num;
+	u8 flags;
+	u8 *buf;
+};
+
 #define SDW_DOUBLE_RATE_FACTOR		2
 #define SDW_STRM_RATE_GROUPING		1
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 45e69ed3168d..3fc2d1acaa46 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1226,6 +1226,20 @@ static struct sdw_master_runtime
 	struct sdw_master_runtime *m_rt, *walk_m_rt;
 	struct list_head *insert_after;
 
+	if (stream->type == SDW_STREAM_BPT) {
+		if (bus->stream_refcount > 0 || bus->bpt_stream_refcount > 0) {
+			dev_err(bus->dev, "%s: %d/%d audio/BPT stream already allocated\n",
+				__func__, bus->stream_refcount, bus->bpt_stream_refcount);
+			return ERR_PTR(-EBUSY);
+		}
+	} else {
+		if (bus->bpt_stream_refcount > 0) {
+			dev_err(bus->dev, "%s: BPT stream already allocated\n",
+				__func__);
+			return ERR_PTR(-EAGAIN);
+		}
+	}
+
 	m_rt = kzalloc(sizeof(*m_rt), GFP_KERNEL);
 	if (!m_rt)
 		return NULL;
@@ -1254,6 +1268,8 @@ static struct sdw_master_runtime
 	m_rt->stream = stream;
 
 	bus->stream_refcount++;
+	if (stream->type == SDW_STREAM_BPT)
+		bus->bpt_stream_refcount++;
 
 	return m_rt;
 }
@@ -1302,6 +1318,8 @@ static void sdw_master_rt_free(struct sdw_master_runtime *m_rt,
 	list_del(&m_rt->bus_node);
 	kfree(m_rt);
 
+	if (stream->type == SDW_STREAM_BPT)
+		bus->bpt_stream_refcount--;
 	bus->stream_refcount--;
 }
 
@@ -2000,6 +2018,12 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	m_rt = sdw_master_rt_find(bus, stream);
 	if (!m_rt) {
 		m_rt = sdw_master_rt_alloc(bus, stream);
+		if (IS_ERR(m_rt)) {
+			ret = PTR_ERR(m_rt);
+			dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s: %d\n",
+				__func__, stream->name, ret);
+			goto unlock;
+		}
 		if (!m_rt) {
 			dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
 				__func__, stream->name);
@@ -2115,6 +2139,12 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		 * So, allocate m_rt and add Slave to it.
 		 */
 		m_rt = sdw_master_rt_alloc(slave->bus, stream);
+		if (IS_ERR(m_rt)) {
+			ret = PTR_ERR(m_rt);
+			dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s: %d\n",
+				__func__, stream->name, ret);
+			goto unlock;
+		}
 		if (!m_rt) {
 			dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
 				__func__, stream->name);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ba58e2a52322..69f3e700796d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -824,6 +824,15 @@ struct sdw_defer {
 	struct completion complete;
 };
 
+/*
+ * Add a practical limit to BPT transfer sizes. BPT is typically used
+ * to transfer firmware, and larger firmware transfers will increase
+ * the cold latency beyond typical OS or user requirements.
+ */
+#define SDW_BPT_MSG_MAX_BYTES  (1024 * 1024)
+
+struct sdw_bpt_msg;
+
 /**
  * struct sdw_master_ops - Master driver ops
  * @read_prop: Read Master properties
@@ -839,6 +848,10 @@ struct sdw_defer {
  * @get_device_num: Callback for vendor-specific device_number allocation
  * @put_device_num: Callback for vendor-specific device_number release
  * @new_peripheral_assigned: Callback to handle enumeration of new peripheral.
+ * @bpt_send_async: reserve resources for BPT stream and send message
+ * using BTP protocol
+ * @bpt_wait: wait for message completion using BTP protocol
+ * and release resources
  */
 struct sdw_master_ops {
 	int (*read_prop)(struct sdw_bus *bus);
@@ -855,6 +868,9 @@ struct sdw_master_ops {
 	void (*new_peripheral_assigned)(struct sdw_bus *bus,
 					struct sdw_slave *slave,
 					int dev_num);
+	int (*bpt_send_async)(struct sdw_bus *bus, struct sdw_slave *slave,
+			      struct sdw_bpt_msg *msg);
+	int (*bpt_wait)(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
@@ -961,6 +977,8 @@ struct sdw_stream_runtime {
  * @defer_msg: Defer message
  * @params: Current bus parameters
  * @stream_refcount: number of streams currently using this bus
+ * @btp_stream_refcount: number of BTP streams currently using this bus (should
+ * be zero or one, multiple streams per link is not supported).
  * @ops: Master callback ops
  * @port_ops: Master port callback ops
  * @prop: Master properties
@@ -998,6 +1016,7 @@ struct sdw_bus {
 	struct sdw_defer defer_msg;
 	struct sdw_bus_params params;
 	int stream_refcount;
+	int bpt_stream_refcount;
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
 	struct sdw_master_prop prop;
@@ -1045,6 +1064,10 @@ int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
 void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 bool is_clock_scaling_supported_by_slave(struct sdw_slave *slave);
 
+int sdw_bpt_send_async(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
+int sdw_bpt_wait(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
+int sdw_bpt_send_sync(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
+
 #if IS_ENABLED(CONFIG_SOUNDWIRE)
 
 int sdw_stream_add_slave(struct sdw_slave *slave,
-- 
2.43.0

