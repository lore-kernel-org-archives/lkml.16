Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979732C08C8
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749900899; cv=none; b=STe73wAzAo5b4qGWOd9EvbQWLhGLgWhatO11YPSi7l9d8LvjmI4Tm3qQip4TVDSuRQIjORrjHVzN7YeB/Vh3kSQnMHZq/jFba26LiwtjP2pPOkf3JgHHdxag+sC/QWAZTE62uCAbXT38J61iSVMcgqX23TzIP1IQ+QN5txTMa+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749900899; c=relaxed/simple;
	bh=ZMM52/9e/aI7mUDgMJjkPnTcqRxwMxNSPQV8mEfRSpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkxd0bHS9bZ0gwTn5+XVwNOuyHwMO/tZjQKiRMoLI2kjA41VYGIS5lDFBLkSyK4CbhoEPRDWq0nOuHHdCNBkGDDUfRmnR+GX16VX5lVSEtTWZYErLlr9frhGDTzwN/oAMVAi0VNfj4IinDKRj7Y0PQ8YFSx0yMl8gntQyyiFGKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Y9v7mtbC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qh0Qky5m; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Y9v7mtbC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qh0Qky5m"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 68F16114011D;
	Sat, 14 Jun 2025 07:34:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 14 Jun 2025 07:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749900895; x=
	1749987295; bh=6xLU0HqKW2HQImmVnnNgGa5HUcIsGUZk+o6aTIYe1Ks=; b=Y
	9v7mtbC7TeFi+d5hrg9MKw6hQ2G1AXCOrd3UXH0ar8Y372cld8OjCFmQNiY/ftHZ
	CeIUoWK1x/m7nPthJt5atkQPsrxawDje6UkRgDhlyqfjX9+YN7gES+hI47C+bhoY
	WEkTuKFzGlekU4biW6kiwLPL7DB53/1DkLo5aS4/8rBxcllunpkcKYjnwUA/rG7z
	umZP++66Ij7Uv5Al33r6o5yNaC7BoLdgPSP4l9ff3KXtJ+XG+5miZoPqPWEherOt
	sc79+gcvh4NacsIaGRS5LGoPNArcB1jUkcNOzxvlT69Npn8Irq1ku5ZLHslaVeqJ
	e7Lt6ttLQiV6zyKDinnwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749900895; x=1749987295; bh=6
	xLU0HqKW2HQImmVnnNgGa5HUcIsGUZk+o6aTIYe1Ks=; b=qh0Qky5mZDRMS674P
	ZlbpkoiE1M0exVSO23LmZxtoOa0bu28U1OndqwYTsY4d5thiF53tVkFxbBRb0EW2
	H8VaV21P0Vt22+yiubjfBpZAgZx7lMFqiAwy/Og28MXZOWSUBPuTanCd7wVLUyeq
	yg4w8uWS1BG0erumBOImBe7QdCJixSVMmNHqM/fFZR2isl+7HPA2seNM+FKaQ6WE
	+7mLLOuwiA3kx1sNAgMrbgdE9V/zt7lh3QbSSsrmxBXOhgHvF5ugvy362Rx7E4qC
	bAaaZuKti1jlvwW1LEJVtE/eDSiHacNk+wWgDOhfQszCtjQaKC+Sl5fuxak0uUpc
	H/sWQ==
X-ME-Sender: <xms:X15NaCI_5nK05hsyAPL2fQwlwZ_sXVHAd1m70VnGdnQ0vkI9WWPqqA>
    <xme:X15NaKKJD8Ap_W-dT5RnqEv1Y0o_hQcCF2zOknlTdYW_MdvlcVWlxBwM7RXnfz2Qf
    uV2v2kglx0sSmxBufE>
X-ME-Received: <xmr:X15NaCt-_RDYRCCAb3lj2touix-WD-K7jUKc7dL-3cy0IcKhoI97-Pmr7n9pWHeqb_DoXVgTF_vHP2FPYj6VGYeqsuGRhY_n5XRBJZyfy1El>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvtdejvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:X15NaHbG0NnMhMRjVTHoj6mxWaliOYI0-sI9XqMQM_05VblCZHyg3w>
    <xmx:X15NaJZIPtWiTM4oXxT_lD-_8zNV6UGjY5w-hCGMPyY6eF0b9jtqYA>
    <xmx:X15NaDBI6j8vELqHYudaNX16PwHSBvOQhZlxQNQxDJXLjttecDP09A>
    <xmx:X15NaPZteVLmHL9op065jVdQD5eRL0c4Zn-49mmS29g4hd64btAHvw>
    <xmx:X15NaBINs-neI-i3n87DnvpL0jN2Yh7XMLcINEVMbyOqHKx0T8egWTYo>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 07:34:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] firewire: core: allocate workqueue for AR/AT request/response contexts
Date: Sat, 14 Jun 2025 20:34:47 +0900
Message-ID: <20250614113449.388758-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250614113449.388758-1-o-takashi@sakamocchi.jp>
References: <20250614113449.388758-1-o-takashi@sakamocchi.jp>
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
 drivers/firewire/core-card.c | 40 +++++++++++++++++++++++++++---------
 include/linux/firewire.h     |  1 +
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 2b6ad47b6d57..df0bb5b96ddc 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -574,7 +574,6 @@ EXPORT_SYMBOL(fw_card_initialize);
 int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
 		unsigned int supported_isoc_contexts)
 {
-	struct workqueue_struct *isoc_wq;
 	int ret;
 
 	// This workqueue should be:
@@ -589,12 +588,29 @@ int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
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
@@ -603,15 +619,17 @@ int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
 
 	generate_config_rom(card, tmp_config_rom);
 	ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
-	if (ret < 0) {
-		destroy_workqueue(isoc_wq);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_async;
 
-	card->isoc_wq = isoc_wq;
 	list_add_tail(&card->link, &card_list);
 
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

