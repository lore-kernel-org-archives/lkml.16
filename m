Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F72638AF
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749994384; cv=none; b=dZ6KMXH98luwF1675rIYn07AIW/XiDm5gle3Gb+YFUrBTxitL4t1g9Io0OJXjKQG+YHwweoV+PO6mcN3Jg9br5taDxKT+rwthVhPRWk+X9Bv1Fc89mVvldUuT4tk1+Tyekx66L/Meb4V92MRHkwIxnEfruLZuUt9widEQX3kSzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749994384; c=relaxed/simple;
	bh=ITbtmPf4cpk3X83sE0SP/sCMpsGJGN4Oib1B9xSOsRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtD74bVI4rcDNYd4/UtLkQCet3foDl+ovNiUjo6ej/UZw5VZildl0ECwuCD/G1ILSzEWgDifJ+ufijX2IhZPxwxCEjqRT0NpsrLfW5eAPyWwEvwziBFiIj8pczKe6UD5bf5tWOoEWe4RXCNgDZ+3QbwRxW3Cs9o3l/YTsAy0uH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=TYx+XqQD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MiNymviJ; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="TYx+XqQD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MiNymviJ"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ADD2F11400CA;
	Sun, 15 Jun 2025 09:33:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 15 Jun 2025 09:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749994381; x=
	1750080781; bh=s0mnxanqQ2wO103H6uaQ4iaNpdz2HeEAgNvMawAzuog=; b=T
	Yx+XqQDkNA1d0fNk+GET5cNRh8dcrgtANydQ8wI3JXsrP8IwOSEEIAQbJK7YKEpt
	HAZcwQRkArpaOCg8C4OLcfjeub5XqNgF+Q/DA/z9thlIo6PSFHvRnzp9JQfiqR/V
	YLceItY2fBNYtf97rB39NMVYWPxKZyXqPJRvyHt+S9RJL/rMiIVCeSRppfZD+B2V
	k5fE19zRp0TsICzyX8e2rpNJNM+ohL3EhzutCqjN2ObVmT0ITEc6zFMPDnX6zXNy
	mTzFgTBcBVcMTHUQ2HryKe9WFWa4H+x8vOJmSlADALrFzuGU+hcFhuNzsO5cHJJL
	op76J6QDchbl5aV1uxcLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749994381; x=1750080781; bh=s
	0mnxanqQ2wO103H6uaQ4iaNpdz2HeEAgNvMawAzuog=; b=MiNymviJDC+UG8E7A
	ynk4F//JysZmGvIB7LjdKHBuPd+h6tJOBuyGhNBhju1XvRmJFbRCIB7oAMuM2oL7
	eqWy0i1QknLpxx7yMuDFyHhPVsJXReE1VHNtqgcf6ftMpvKB+nkZep/Wq+Fxt3QJ
	Q9Wu7rQYKm7vnHZhkTErF2PYOqdxWXxGsZw3K7mEiZdqHBqgX0WWxkfjDVH1Mq8X
	5/9oZBcDf8Em/it1VRT/Pukx5AVAEJokNnbrcjZvMPslf0JtJ9S2VNVidlR+J58V
	HWuvGF8evU/g+r6s+n7c0ne/kqe6nd5RwmYMX6J30PDARpOswpWnHrZAwfIy4D4V
	hTLkA==
X-ME-Sender: <xms:jctOaFVnuQ4gylQL8nSFIMI-Ivk2omRwIh2q68KPDDb1n9pAkm5ABQ>
    <xme:jctOaFl5GRjovdr_i8goz2NUmAC41AD35bHZGTL_YD1gs0jLmQyI2pWeMviuIuLoT
    QQVsschLAG1mTzJN68>
X-ME-Received: <xmr:jctOaBb5Sili3hVK4XxPl-NZtU_ts5LK5uJiTjZeIQB8vx-NUWaHn0gIjCAiONEbVhE2DyOySoS3NPOicFWdR8whcqRy_E3QKmgJ82H16wLVsQ>
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
X-ME-Proxy: <xmx:jctOaIU-4el0qGjo5ZZhVL--iyofDNNDRPBPZCc8Pk6bizMGM8nKcg>
    <xmx:jctOaPng8id6MYNKeJlWPiA4Qmw0raVSHJAVppSnDfIdRtMdkvoDLQ>
    <xmx:jctOaFcc_AxSDzLA6IiZqRjfuGU_b1acBcBOnCz0U5w7Y8vcjtpLqA>
    <xmx:jctOaJHMnw1-JRzl5OTYWl6DzlbMKaelCwVOP5AkKlzupam3qK9APA>
    <xmx:jctOaB3DiDRQMmTZDm60udxrQuNJYjpK8oiR5nl-oGiZSGn98SRB39ei>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Jun 2025 09:33:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] firewire: ohci: use workqueue to handle events of AR request/response contexts
Date: Sun, 15 Jun 2025 22:32:52 +0900
Message-ID: <20250615133253.433057-3-o-takashi@sakamocchi.jp>
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

This commit adds a work item to handle events of 1394 OHCI AR
request/response contexts, and queues the item to the specific workqueue.
The call of struct fw_address_handler.address_callback() is done in the
workqueue when receiving any requests from the remove nodes. Additionally,
the call of struct fw_packet.callback() is done in the workqueue too when
receiving acknowledge to the asynchronous packet for the response
subaction of split transaction to the remote nodes.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c |  7 ++++---
 drivers/firewire/ohci.c             | 27 +++++++++++----------------
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 2bd5deb9054e..d28477d84697 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -557,9 +557,10 @@ const struct fw_address_region fw_unit_space_region =
  *
  * region->start, ->end, and handler->length have to be quadlet-aligned.
  *
- * When a request is received that falls within the specified address range,
- * the specified callback is invoked.  The parameters passed to the callback
- * give the details of the particular request.
+ * When a request is received that falls within the specified address range, the specified callback
+ * is invoked.  The parameters passed to the callback give the details of the particular request.
+ * The callback is invoked in the workqueue context in most cases. However, if the request is
+ * initiated by the local node, the callback is invoked in the initiator's context.
  *
  * To be called in process context.
  * Return value:  0 on success, non-zero otherwise.
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 40313a3ec63e..68317b5a64a7 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -101,7 +101,7 @@ struct ar_context {
 	void *pointer;
 	unsigned int last_buffer_index;
 	u32 regs;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 };
 
 struct context;
@@ -1016,9 +1016,9 @@ static void ar_recycle_buffers(struct ar_context *ctx, unsigned int end_buffer)
 	}
 }
 
-static void ar_context_tasklet(unsigned long data)
+static void ohci_ar_context_work(struct work_struct *work)
 {
-	struct ar_context *ctx = (struct ar_context *)data;
+	struct ar_context *ctx = from_work(ctx, work, work);
 	unsigned int end_buffer_index, end_buffer_offset;
 	void *p, *end;
 
@@ -1026,23 +1026,19 @@ static void ar_context_tasklet(unsigned long data)
 	if (!p)
 		return;
 
-	end_buffer_index = ar_search_last_active_buffer(ctx,
-							&end_buffer_offset);
+	end_buffer_index = ar_search_last_active_buffer(ctx, &end_buffer_offset);
 	ar_sync_buffers_for_cpu(ctx, end_buffer_index, end_buffer_offset);
 	end = ctx->buffer + end_buffer_index * PAGE_SIZE + end_buffer_offset;
 
 	if (end_buffer_index < ar_first_buffer_index(ctx)) {
-		/*
-		 * The filled part of the overall buffer wraps around; handle
-		 * all packets up to the buffer end here.  If the last packet
-		 * wraps around, its tail will be visible after the buffer end
-		 * because the buffer start pages are mapped there again.
-		 */
+		// The filled part of the overall buffer wraps around; handle all packets up to the
+		// buffer end here.  If the last packet wraps around, its tail will be visible after
+		// the buffer end because the buffer start pages are mapped there again.
 		void *buffer_end = ctx->buffer + AR_BUFFERS * PAGE_SIZE;
 		p = handle_ar_packets(ctx, p, buffer_end);
 		if (p < buffer_end)
 			goto error;
-		/* adjust p to point back into the actual buffer */
+		// adjust p to point back into the actual buffer
 		p -= AR_BUFFERS * PAGE_SIZE;
 	}
 
@@ -1057,7 +1053,6 @@ static void ar_context_tasklet(unsigned long data)
 	ar_recycle_buffers(ctx, end_buffer_index);
 
 	return;
-
 error:
 	ctx->pointer = NULL;
 }
@@ -1073,7 +1068,7 @@ static int ar_context_init(struct ar_context *ctx, struct fw_ohci *ohci,
 
 	ctx->regs        = regs;
 	ctx->ohci        = ohci;
-	tasklet_init(&ctx->tasklet, ar_context_tasklet, (unsigned long)ctx);
+	INIT_WORK(&ctx->work, ohci_ar_context_work);
 
 	for (i = 0; i < AR_BUFFERS; i++) {
 		ctx->pages[i] = dma_alloc_pages(dev, PAGE_SIZE, &dma_addr,
@@ -2238,10 +2233,10 @@ static irqreturn_t irq_handler(int irq, void *data)
 	}
 
 	if (event & OHCI1394_RQPkt)
-		tasklet_schedule(&ohci->ar_request_ctx.tasklet);
+		queue_work(ohci->card.async_wq, &ohci->ar_request_ctx.work);
 
 	if (event & OHCI1394_RSPkt)
-		tasklet_schedule(&ohci->ar_response_ctx.tasklet);
+		queue_work(ohci->card.async_wq, &ohci->ar_response_ctx.work);
 
 	if (event & OHCI1394_reqTxComplete)
 		tasklet_schedule(&ohci->at_request_ctx.tasklet);
-- 
2.48.1

