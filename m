Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD02BEFF3;
	Tue, 17 Jun 2025 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142957; cv=none; b=cZL095vbHVgTVN2wxvcfliPR/ttOeUsRr3V3eD5HKpEWBdBEYQ0bCNX7+hdOsga2pJqjRrH+RVSvnnJ5w0tujGvxEskcYDWevxJG6cJwtm8vnfKFDytEpqFPIWAKpHoFGkRrHdHBKJgF2USpHXntzN06ZbQCipmG18cVBN40HCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142957; c=relaxed/simple;
	bh=afbruXRiRAdGzO24ALgtU6hQMdXGytgUclxJMzccXAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJwgiVRyNZ/eey80MkbL6F47U+gnhd61oVGvNZc5mKVVt/AkwVU3fj1fRnz2Hkk2G9CU1z1WWBmuTLLpy6/7ms5cWoONBwWv/2f2yqGWPIcqQvlWVwmydFPemBQmSC9KP/rNLX6GwfpmtmbtCor4dwzr4JfvkERVT9qHOfT74fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUNFA54N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUNFA54N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A14C4CEE3;
	Tue, 17 Jun 2025 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750142956;
	bh=afbruXRiRAdGzO24ALgtU6hQMdXGytgUclxJMzccXAM=;
	h=From:To:Cc:Subject:Date:From;
	b=tUNFA54No695GK6zOlxAjnrXVs7/njUKdBQZI/imt8Qtw79UUJ4hvFaApke72cfsX
	 9Ut8WDQNhzAX48ZM0yrcNMSReE0cIsixd6UErVRGxFqIn/r/x3PRc5BzMEtH9hLvcK
	 E1vlSrYsuPlRxtJWKTEeho7+Ck/Za/idK5WloZQKPZ0lp8jgkoyq6qVA0sO5xnSS5t
	 TAofOx1aQqhgdTzf6/bdLzAwvQr3dhNSgvhQCapXftabLOctbFWKPrFHT0hnFFka3+
	 ooh6ABJzRdbohuDiQckKiabylHVhs3RNQTN9ANQ7o/UaVEOpnzof1SkvMZhG3cqlRr
	 5/guSvjKC83ww==
From: Manivannan Sadhasivam <mani@kernel.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] bus: mhi: host: Make local functions static
Date: Tue, 17 Jun 2025 12:19:06 +0530
Message-ID: <20250617064906.14079-1-mani@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

These functions were not used outside of the file defining them. So make
them static as they should be.

Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/bus/mhi/host/init.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 7 -------
 drivers/bus/mhi/host/main.c     | 2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 13e7a55f54ff..7f72aab38ce9 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -176,7 +176,7 @@ static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
-void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
+static void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 {
 	int i;
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
@@ -191,7 +191,7 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 	free_irq(mhi_cntrl->irq[0], mhi_cntrl);
 }
 
-int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
+static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -254,7 +254,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
-void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
+static void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 {
 	int i;
 	struct mhi_ctxt *mhi_ctxt = mhi_cntrl->mhi_ctxt;
@@ -299,7 +299,7 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	mhi_cntrl->mhi_ctxt = NULL;
 }
 
-int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
+static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_ctxt *mhi_ctxt;
 	struct mhi_chan_ctxt *chan_ctxt;
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ce566f7d2e92..9336fb775226 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -383,19 +383,12 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 
 /* Initialization methods */
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl);
-int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl);
-void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl);
-int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
-void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
 int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 
 /* Automatically allocate and queue inbound buffers */
 #define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
-int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan, unsigned int flags);
-
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 9bb0df43ceef..3041ee6747e3 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1435,7 +1435,7 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 	mutex_unlock(&mhi_chan->mutex);
 }
 
-int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
+static int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 			struct mhi_chan *mhi_chan, unsigned int flags)
 {
 	int ret = 0;
-- 
2.43.0

