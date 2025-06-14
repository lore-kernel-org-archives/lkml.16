Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63DD2C08CA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749900900; cv=none; b=AQmVUyx55zgt+PEcTALhCZvzNznvO+nj4j0OyfITIuQXzWk+BEWmxYTdC7ut3kwNZ7fHn/OwSUE8ur5JCZKf+ydPctWhhQrRaJoyqMQdHNVwht7t+/4uMizdulAxY5+U3ic+BwvqNlvJJB+cta2sZ+XSZt1yoF9kQ5GJNFV1eTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749900900; c=relaxed/simple;
	bh=ITbtmPf4cpk3X83sE0SP/sCMpsGJGN4Oib1B9xSOsRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhvVXE4K3+zM8SrswurHEK2jvN+PEgv6Ewb/Izs+ncNSpsot2+ZJK+rEdgK/Gd+XVXL6GpQIFPuUvpQHkAbx0X94ogUyulgVWV1vfFaif71ZMzvA6pzTt5YebvpOn0dVQBcrDYfRoEB2qQIhdKc3cLb/6bSOjo5B8VErdqODQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Moko1dNr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VD6dlCH0; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Moko1dNr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VD6dlCH0"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BC1AD1140158;
	Sat, 14 Jun 2025 07:34:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 14 Jun 2025 07:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749900896; x=
	1749987296; bh=s0mnxanqQ2wO103H6uaQ4iaNpdz2HeEAgNvMawAzuog=; b=M
	oko1dNr4MZoInYSMchUHTnfgqG2VROiw7dEsWSSmlwVCZHT/3b/qVWIW2PANhCFF
	dImHODEmZ+3j9+22BXQ8D9x+OKlMASj3fu2F8qgTlezXWbdxbQ7dy8TkqOBLpzax
	cAtasytFJFta7P1u+2Xc6U8eTfKkWQozcY+zVqrY9FcHizKu1irjO6qL7lbNdHwo
	o8OEZXsCa/hvKrqD7rRcJ8tYtSSNMxG6A1Ucmsg4m0OLuI2dnHb2Vnpdvgb7Vmd5
	EanMlZNTypPuAGBuSBDbXCIhkwdE6Jygb7P6KapIiIQeejyUzG4bt6vysutKg/w/
	ZFIjFMj1ybV1oocpCJrHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749900896; x=1749987296; bh=s
	0mnxanqQ2wO103H6uaQ4iaNpdz2HeEAgNvMawAzuog=; b=VD6dlCH080Z65LQg7
	16XFlW1JYQR0EBPs84LZKCD4VlwBdRNj3DVvyCkB0NYR0YLgnSK1Sa/+AhzqSAIg
	JJCVwVn1eIOWK1e/yyfUK8TKp1UF9VAaY/aOC/PlvEoIGVnIX71dQnSsrtse+/Ps
	LmTtGgewcikCkqowa4d6ngbv9TnM5ZLju3CsB5Gom7z8sPQ57K7wLsaWvHHsRaST
	6CQpkunHQEygFDfd91k73NPSIBflYEcR7hBm4nbBYFnRJS1QStgOde2qPevSY+9V
	VgfuWbG9zcBkE11XUhRIbsTgRkrgjUpo3gLSSjgl1S+SOlgc/QalV3I4cOzoSlKU
	KdG3w==
X-ME-Sender: <xms:YF5NaKHnIHWdNo5kbvP9lHlXsqN_JW9D0W8SFRTgFA6hEDqXxvNJ_A>
    <xme:YF5NaLVhf93rotzEF6TLrXngcx-sKI1oUZstJPQ588drqkYrGhABV7xcC1HCd_zWz
    d0fNMXfuwBtU7WXBJQ>
X-ME-Received: <xmr:YF5NaEKQQcEs94Qi9MLY-YdDDoPvsfRLbtGceKVVC80oL8je3iI5yMbx2dwR_qp4ZERMZ8LAdNh5wuvHAzdGXq2HjXO2ixIVOBP-_McV4iyd>
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
X-ME-Proxy: <xmx:YF5NaEEkQa5vHy_3ccpgv0TGc0f5GHo6mpg7r9kNH4pGchyIh_YlXQ>
    <xmx:YF5NaAWafr6aK9iaFG7Gu1YcXLeWbr3w3qdw-ItxsgMhVvrnz_CEpg>
    <xmx:YF5NaHOuyq213XrpGFoOwMtvMdQEgSunG5_i3tLHkaVYhUd9Kr65Qg>
    <xmx:YF5NaH0qqRa5WCkp6XT5j4ifA8LBqDurDS30wRwTNzYsbOILa5Vz2A>
    <xmx:YF5NaMkWmEQw3PZWQX4fLfUicYIuHswktYFVI32nnIuhv4EDVoHP7BMl>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 07:34:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] firewire: ohci: use workqueue to handle events of AR request/response contexts
Date: Sat, 14 Jun 2025 20:34:48 +0900
Message-ID: <20250614113449.388758-3-o-takashi@sakamocchi.jp>
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

