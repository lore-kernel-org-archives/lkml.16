Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C661BC07A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749994383; cv=none; b=mxlu83qgBJX0XAjyfNqI8cWzTSGXNao+fZ+nCKPZvfBiH8iSctlifXLGPSdo5MIJHx36NWvvB0F6ahTDZJAVoOklampF/cIfuO0mI5xjr0+s/kV4PknZeUmcSL7tBptpHhNnvc3wzFwqK1jRrfeUHtba7BwN6IrPX/oXH65DaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749994383; c=relaxed/simple;
	bh=zTHKar8gQcQgQ/8Bbae0V50BJ9kXFhlYDUd+lTUcckI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXq2tGHZsBLslohboSSPWlzqss5pabgIkNc6ObO2tpgkyc5mcjdyFEbBT82DwLoVKswdUxQcNr3MwgjKYWhlGQcQ3CKZNirbym0CxEC+p4x3nL7aBfmWt6pQotCKaScARLosQCYCya4L+P3l1lGnv8J2jaS5q5YynOD7dRa7aJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=grbhd0iO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PSJgIP2j; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="grbhd0iO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PSJgIP2j"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5228111400E4;
	Sun, 15 Jun 2025 09:33:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 15 Jun 2025 09:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749994380; x=
	1750080780; bh=7XKP+PnrLFVclC5u7hONL2ciFO44TegrPitUkyB2ifg=; b=g
	rbhd0iOURs7p4kUhGn/cWqUAU3lbq4kQouX2g1HyeKqjfe2X6bywSbyue6v+xgxY
	O/fKyEXooQchINaqMU6kJkWTi+Juzj4AiRJzHn1LginSNB16A2OAIPfDDnuKhblK
	4JF4ko6QL2kD1ZHh/Z2PwOjFiqwpkMxQOPEcPKHS0dbFKTpkOQy7N0Zfra3L1/FQ
	HlTsVYbiaaHMga+89onDefXzJfWL8O0oCfOuSlavayaJwlvdBu4QpcsZ3X7DNbut
	4r0L68HcGY+vJ29BeCCng6xh7akL93YlslV8mtvFwM5CMSRolgDKnsRv51RBE0sO
	Ne+PZ11t4Guf2oNzIyTrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749994380; x=1750080780; bh=7
	XKP+PnrLFVclC5u7hONL2ciFO44TegrPitUkyB2ifg=; b=PSJgIP2jXhdkSUccK
	3JxCLCrK1pButSUVh+DGp/0ikOYsHwiSVwjwKKTStI0vnZyhV3mVJBCzEU1W5SUe
	q7ihE7lyCfJiYYB8XMRxc1P/wfH4h5ic+lkfMhJbSMyq5rMsHozh/vDBtiYItIdT
	vFfKeA1a8fDcDwuZ92CJ4TNzWzkJQ3jce8DxMdz20ZP4pNj8TSGxB0+NAcRtdFKI
	Y7jIBVs5wwtCpNt+CzXGe+Rl4PxeNpQRpXYRf2TrWMv0XybniFGTQUSCqwOziiIi
	hmUvda3OFzt6IGknMP8kRxPgBgXUGnTJ1JInvWGJi47xKtavQx+HNSFkmF6WbvKp
	FgsXQ==
X-ME-Sender: <xms:jMtOaD4JfC-SNiRywqegkeS9rIjEXOE81ParefWATyjGaFpk-sOszw>
    <xme:jMtOaI6_OzlGPvk0vw5yhEn0fy9CiugXEdLsGvF_Npif6_HbeZyxOh8AVuj4Mt2rp
    -XfbU_d6TvoSNX3mJ8>
X-ME-Received: <xmr:jMtOaKd70r7wnCXB-zI9gPefSInKvlytPCu7hhCpKggg-y5sudays8qc5ontSXmOEae9o5o0x0CLIPxhjZVWIpzb5mKU_Juj2un7jUhntelt9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgr
    mhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrf
    grthhtvghrnhepvdejgfejuedvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedv
    ffekvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidufeelgedquggvvh
    gvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jMtOaEIcjm-DmXTp6nuBIGqAaxBvN2lE_a_ODkQbVNm8xzJv_PNHQw>
    <xmx:jMtOaHIYAbK59VHULEAkuoB7bDpHxwq0Kcs9hIjyNgQy04N_Tigs1g>
    <xmx:jMtOaNxwbKx_F_rbxTLDGjID28tEJR1XbY3egxcandN18x4DXCx-dA>
    <xmx:jMtOaDJH_xwX8HLRYTOTISUvppWq6WhgNObraboQT-VJWVfBqo3FQA>
    <xmx:jMtOaA71QcpPShGVfZZ-am5QrL0cZwoJe6uiI9cNl00yfCGaEww1NDzq>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Jun 2025 09:32:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] firewire: core: allocate workqueue for AR/AT request/response contexts
Date: Sun, 15 Jun 2025 22:32:51 +0900
Message-ID: <20250615133253.433057-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250615133253.433057-1-o-takashi@sakamocchi.jp>
References: <20250615133253.433057-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some tasklets (softIRQs) are still used as bottom-halves to handle
events for 1394 OHCI AR/AT contexts. However, using softIRQs for IRQ
bottom halves is generally discouraged today.

This commit adds a per-fw_card workqueue to accommodate the behaviour
specified by the 1394 OHCI specification.

According to the 1394 OHCI specification, system memory pages are
reserved for each asynchronous DMA context. This allows concurrent
operation across contexts. In the 1394 OHCI PCI driver implementation,
the hardware generates IRQs either upon receiving asynchronous packets
from other nodes (incoming) or after completing transmission to them
(outgoing). These independent events can occur in the same transmission
cycle, therefore the max_active parameter for the workqueue is set to the
total number of AR/AT contexts (=4). The WQ_UNBOUND flag is used to
allow the work to be scheduled on any available core, since there is
little CPU cache affinity benefit for the data.

Each DMA context uses a circular descriptor list in system memory,
allowing deferred data processing in software as long as buffer overrun
are avoided. Since the overall operation is sleepable except for small
atomic regions, WQ_BH is not used. As the descriptors contain
timestamps, WQ_HIGHPRI is specified to support semi-real-time
processing.

The asynchronous context is also used by the SCSI over IEEE 1394
protocol implementation (sbp2), which can be part of memory reclaim paths.
Therefore, WQ_MEM_RECLAIM is required.

To allow uses to adjust CPU affinity according to workload, WQ_SYSFS is
specified so that workqueue attributes are exposed to user space.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 48 +++++++++++++++++++++++++-----------
 include/linux/firewire.h     |  1 +
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 2b6ad47b6d57..b3e48ca516fe 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -574,7 +574,6 @@ EXPORT_SYMBOL(fw_card_initialize);
 int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
 		unsigned int supported_isoc_contexts)
 {
-	struct workqueue_struct *isoc_wq;
 	int ret;
 
 	// This workqueue should be:
@@ -589,29 +588,48 @@ int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
 	//  * == WQ_SYSFS		Parameters are available via sysfs.
 	//  * max_active == n_it + n_ir	A hardIRQ could notify events for multiple isochronous
 	//				contexts if they are scheduled to the same cycle.
-	isoc_wq = alloc_workqueue("firewire-isoc-card%u",
-				  WQ_UNBOUND | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
-				  supported_isoc_contexts, card->index);
-	if (!isoc_wq)
+	card->isoc_wq = alloc_workqueue("firewire-isoc-card%u",
+					WQ_UNBOUND | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
+					supported_isoc_contexts, card->index);
+	if (!card->isoc_wq)
 		return -ENOMEM;
 
+	// This workqueue should be:
+	//  * != WQ_BH			Sleepable.
+	//  * == WQ_UNBOUND		Any core can process data for asynchronous context.
+	//  * == WQ_MEM_RECLAIM		Used for any backend of block device.
+	//  * == WQ_FREEZABLE		The target device would not be available when being freezed.
+	//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
+	//  * == WQ_SYSFS		Parameters are available via sysfs.
+	//  * max_active == 4		A hardIRQ could notify events for a pair of requests and
+	//				response AR/AT contexts.
+	card->async_wq = alloc_workqueue("firewire-async-card%u",
+					 WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
+					 4, card->index);
+	if (!card->async_wq) {
+		ret = -ENOMEM;
+		goto err_isoc;
+	}
+
 	card->max_receive = max_receive;
 	card->link_speed = link_speed;
 	card->guid = guid;
 
-	guard(mutex)(&card_mutex);
+	scoped_guard(mutex, &card_mutex) {
+		generate_config_rom(card, tmp_config_rom);
+		ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
+		if (ret < 0)
+			goto err_async;
 
-	generate_config_rom(card, tmp_config_rom);
-	ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
-	if (ret < 0) {
-		destroy_workqueue(isoc_wq);
-		return ret;
+		list_add_tail(&card->link, &card_list);
 	}
 
-	card->isoc_wq = isoc_wq;
-	list_add_tail(&card->link, &card_list);
-
 	return 0;
+err_async:
+	destroy_workqueue(card->async_wq);
+err_isoc:
+	destroy_workqueue(card->isoc_wq);
+	return ret;
 }
 EXPORT_SYMBOL(fw_card_add);
 
@@ -744,6 +762,7 @@ void fw_core_remove_card(struct fw_card *card)
 	dummy_driver.stop_iso		= card->driver->stop_iso;
 	card->driver = &dummy_driver;
 	drain_workqueue(card->isoc_wq);
+	drain_workqueue(card->async_wq);
 
 	scoped_guard(spinlock_irqsave, &card->lock)
 		fw_destroy_nodes(card);
@@ -753,6 +772,7 @@ void fw_core_remove_card(struct fw_card *card)
 	wait_for_completion(&card->done);
 
 	destroy_workqueue(card->isoc_wq);
+	destroy_workqueue(card->async_wq);
 
 	WARN_ON(!list_empty(&card->transaction_list));
 }
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index b632eec3ab52..c55b8e30e700 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -136,6 +136,7 @@ struct fw_card {
 	__be32 maint_utility_register;
 
 	struct workqueue_struct *isoc_wq;
+	struct workqueue_struct *async_wq;
 };
 
 static inline struct fw_card *fw_card_get(struct fw_card *card)
-- 
2.48.1

