Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A425A34A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298372; cv=none; b=mP1ohsOnNcaFvSsJSTtiKvJYbBELGycaaOchO1gvhQvl1s3UtbMbqEAo0fKZij8bWiwv/duDCZIRXV0D0EjliO8B0hAGftJMm7LaHWBRtJx26YKxiq2S7E5JpDKRX97+8m5kEiALEx2QwLkAB/G8GM20USx4Oj82vzSHZvc7Wy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298372; c=relaxed/simple;
	bh=gALJf/aZN+OFGmzdamG43Z/c3e9zCysH8NbpvnFkMqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5Ac8g0c9ksQOb6r1TAaXviYaD1NDhuWKCrG0ut6re8KEg7+OYC3KG5YDQSxFwylmu+KTw6yAdRamxLGuhV3HF1yWVI3DiYLH/iCedATtLQJX2ruJ0y5mWO13fQM+mA7AYvdpI29KB/d/CwHfFjmFlmbZ4k28yDygxV2rMJMCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=Ybmo94hD; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="Ybmo94hD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739298367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ge0IZaVhj6bYPb7IYImWFci1To9h0GU7LfN7WXAzDQg=;
	b=Ybmo94hD5UHHt5O9IVJN0SV8pvCtcE0ivNp3/n1zhklYBqNjltkMOMPFHyeJx5KMlCElq6
	E4kQU2TxImK8S2dl/koS4OlfG2yvr1MNzTylIpBcfIFx87VuQ6QfngqCUqtA5SuYb5drXi
	cQjoZWnVadk4ndtTaQ5eJ61exw5vEA2w2+aOjegisGHupEq8T+UvqjexQgfXfvN//uguy9
	8fIzc7A66BIF2Mk8NeqrPmY0tx+V4v+iObyK9n4CawAT2TIvCHD3kekscg7lHo6IumTVLy
	6Tww43KxYN1itL4og2plMDX+2NldcDAY4Ezcqmur0VZJ2bor+yqtupo0aZaQYQ==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 13:25:59 -0500
Subject: [PATCH 3/3] apple-nvme: defer cache flushes by a specified amount
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-nvme-fixes-v1-3-6958b3aa49fe@rosenzweig.io>
References: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
In-Reply-To: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4209; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=XdAPgabJp3Th1VF3dW5IHPK3KhszAX1ZDwJh3vdU+rs=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq5Y3LVwFvjEt/Oee7LPZ30kNPyq8CqXKwpOxw
 cgxkAAh8ICJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uWNwAKCRD+/lBaCvVY
 Df8pD/41JdixnbjBPDORaqiQEXeFWOiGuKrkuQnkmT4IDcLlme7arNTYhFy4qlp1QSVcgeWHLsI
 Hed2NG2jpq0DD5uWlXx5fe1asg4+KvdwJ9EBGBHz29MLxM/PMBSa2k9RYvGfQlcFvAfdRUHQE5T
 d/PnE+t0vHutgLo5Ba9/rNuyvIaq+qkle/OwXSsjeq0q/L8vOtlJBvoYWuod0C1G2+EV21KkGhq
 XL98CYSgN5uPiA4WBt3x3NoWRFzXUK23fXQ/jE2EkxAFHX9k1VUUJC1OV4DwOaCCHLSCywLq/qX
 4aYYECjAAQlgjq/oBH3vyTc05BaWoQceQzceLVYR+U+vtH0iC6354OdeeEz6lld9JzMnkSZaKQI
 qAuxX07xFR8osmSkWSFb8+/IzmO9mHjuqS0+/qXZ6hJ1C3wGlpWYjx3xSsBkJiKFbSnV6zRyfFy
 e+owMrQ27m4YV4NoqcE6rSR/aqrQAEBh9meE0O0aWOwM8ShJolQPM+WerbUN63G0XwWNIrP0X/Z
 4hZKEfqnhDbS3yuhr7bIzEc4ZZDCBUvBIeIPr2YsyMjRfhWinT0hiw4KVOT580lPyknu3zeFod9
 4+v0hP4Tuj42OaPcMc/HtBdLHL7jUOfb/ZzLVy/fMFZS0WECDRCJJ3NuddFW4G7WeKyOO+87dC7
 WFM2C460AzrUvLw==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT

From: Jens Axboe <axboe@kernel.dk>

Cache flushes on the M1 nvme are really slow, taking 17-18 msec to
complete. This can slow down workloads considerably, pure random writes
end up being bound by the flush latency and hence run at 55-60 IOPS.

Add a deferred flush work around to provide better performance, at a
minimal risk. By default, flushes are delayed at most 1 second, but this
is configurable.

With this work-around, a pure random write workload runs at ~12K IOPS
rather than 56 IOPS.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/nvme/host/apple.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index a060f69558e76970bfba046cca5127243e8a51b7..2dfb0442d56195756df91e0fbc913b751c74d0ea 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -195,8 +195,20 @@ struct apple_nvme {
 
 	int irq;
 	spinlock_t lock;
+
+	/*
+	 * Delayed cache flush handling state
+	 */
+	struct nvme_ns *flush_ns;
+	unsigned long flush_interval;
+	unsigned long last_flush;
+	struct delayed_work flush_dwork;
 };
 
+unsigned int flush_interval = 1000;
+module_param(flush_interval, uint, 0644);
+MODULE_PARM_DESC(flush_interval, "Grace period in msecs between flushes");
+
 static_assert(sizeof(struct nvme_command) == 64);
 static_assert(sizeof(struct apple_nvmmu_tcb) == 128);
 
@@ -729,6 +741,26 @@ static int apple_nvme_remove_sq(struct apple_nvme *anv)
 	return nvme_submit_sync_cmd(anv->ctrl.admin_q, &c, NULL, 0);
 }
 
+static bool apple_nvme_delayed_flush(struct apple_nvme *anv, struct nvme_ns *ns,
+				     struct request *req)
+{
+	if (!anv->flush_interval || req_op(req) != REQ_OP_FLUSH)
+		return false;
+	if (delayed_work_pending(&anv->flush_dwork))
+		return true;
+	if (time_before(jiffies, anv->last_flush + anv->flush_interval)) {
+		kblockd_mod_delayed_work_on(WORK_CPU_UNBOUND, &anv->flush_dwork,
+						anv->flush_interval);
+		if (WARN_ON_ONCE(anv->flush_ns && anv->flush_ns != ns))
+			goto out;
+		anv->flush_ns = ns;
+		return true;
+	}
+out:
+	anv->last_flush = jiffies;
+	return false;
+}
+
 static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 					const struct blk_mq_queue_data *bd)
 {
@@ -764,6 +796,12 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	}
 
 	nvme_start_request(req);
+
+	if (apple_nvme_delayed_flush(anv, ns, req)) {
+		blk_mq_complete_request(req);
+		return BLK_STS_OK;
+	}
+
 	apple_nvme_submit_cmd(q, cmnd);
 	return BLK_STS_OK;
 
@@ -1398,6 +1436,28 @@ static void devm_apple_nvme_mempool_destroy(void *data)
 	mempool_destroy(data);
 }
 
+static void apple_nvme_flush_work(struct work_struct *work)
+{
+	struct nvme_command c = { };
+	struct apple_nvme *anv;
+	struct nvme_ns *ns;
+	int err;
+
+	anv = container_of(work, struct apple_nvme, flush_dwork.work);
+	ns = anv->flush_ns;
+	if (WARN_ON_ONCE(!ns))
+		return;
+
+	c.common.opcode = nvme_cmd_flush;
+	c.common.nsid = cpu_to_le32(anv->flush_ns->head->ns_id);
+	err = nvme_submit_sync_cmd(ns->queue, &c, NULL, 0);
+	if (err) {
+		dev_err(anv->dev, "Deferred flush failed: %d\n", err);
+	} else {
+		anv->last_flush = jiffies;
+	}
+}
+
 static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1553,6 +1613,14 @@ static int apple_nvme_probe(struct platform_device *pdev)
 		goto out_uninit_ctrl;
 	}
 
+	if (flush_interval) {
+		anv->flush_interval = msecs_to_jiffies(flush_interval);
+		anv->flush_ns = NULL;
+		anv->last_flush = jiffies - anv->flush_interval;
+	}
+
+	INIT_DELAYED_WORK(&anv->flush_dwork, apple_nvme_flush_work);
+
 	nvme_reset_ctrl(&anv->ctrl);
 	async_schedule(apple_nvme_async_probe, anv);
 
@@ -1590,6 +1658,7 @@ static void apple_nvme_shutdown(struct platform_device *pdev)
 {
 	struct apple_nvme *anv = platform_get_drvdata(pdev);
 
+	flush_delayed_work(&anv->flush_dwork);
 	apple_nvme_disable(anv, true);
 	if (apple_rtkit_is_running(anv->rtk)) {
 		apple_rtkit_shutdown(anv->rtk);

-- 
2.48.1

