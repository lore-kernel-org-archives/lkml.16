Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7AF23BF96
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694306; cv=none; b=peW3x2ggF3EUyiBXgSmp26S3oOHmR40Jxv7D69m1BqTgErLKR5RPEYeCcrtlJ9DcHI50dG1ztg+0meHriycZ4B9VvO/n3BKlerazHLW8sXuE07S1P399olHO5laGGtBiPeRKyqWBFaf//PVMpm+Kt+HD6jsL8rO9tOL7l7nSKu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694306; c=relaxed/simple;
	bh=wzuLOmtRR4w0kVhhyTv9Zja/J0wRL0qYIqsOHmP6Kvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NgVZZTzYE7WNWlnBLOhDXQqkUGn/yc4kdmcfFWkIgjgavtPYSSktfUJagH9eXxkdyrtCOgiNis/J+nUnIexbS6qQ4DYYbeNqJfx6FwDd0+dB326MGbZM0V3YlMEL1pBxwSbNTfCxt00CWulOJHldBql2ruKy+aw+fDlwIs4iZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiQNAGU+; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiQNAGU+"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so3548415a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744694304; x=1745299104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7xAbEEI7p+I6WmGNc8jAy6i7DcwaAU5md+L6Ye5HR0=;
        b=GiQNAGU+px264BGpv/tPstLBS/T9Nr2KJFzStsiQCs0BNUfCvPrfcdbpbIFTxOtKQ4
         xK8uHepjhgp6ebipUtYG0P/dK2h8c3uVE8lW0BfmWzQKWqTWf4y9NYFRczlsK9/koCLa
         sUF0hnv6n45+KtpU/qaTJQT9uteSf3rHVTDguHaaOX+9kzaf6C6p4H0eIgh24kG+/lLA
         H4NOOwL6eti5v65yam8at7uHTAzbcZkuGCPeBDAd2O7Ewfa2Qd0rh6RJk7vUb1OLBnpr
         yY9h94DH9R1VXPgNOhozPP0Hp3tDlwir3ylTEaW/qpCWc2Q1Fs7tTFSe4y4F6IFAsmLZ
         215w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694304; x=1745299104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7xAbEEI7p+I6WmGNc8jAy6i7DcwaAU5md+L6Ye5HR0=;
        b=pbIV83w0S4PT79xgFd65UzWv7R8ZWJiM5dBQfPtb3dnNyHQiuyhm9Cm1IUWV8Ttu36
         ZdnWL2mETWlw4o69+OFK7Uh4SqPB7t5y2SbqH+ygIaZvRIvIlKSBh4jszG4SkVQLyDcf
         w6cOLLMjo08yLO2gko1A01A6gyrngsmeAdyLVNo0Qh592VmJy8rUFdiL6QAghSFWC4pM
         HjAnsiHRMepX7pQXDGV4cns94ZnKTaGQEp2TFus/OOSEbvycyJjOiCSnIt5BJWESCwoB
         vfJmMlEjx0GBt4cRyVpzA9uS1gepAScKVtiyJteULUqaJ9aYSVlxSXkfJ5h7yuzf8p+/
         oPtQ==
X-Gm-Message-State: AOJu0Yylv95ufGqqsvB7/1SfEK6F7ydbq1n5VzfAxyfmWfFlrEexpd0t
	ODafcklFXidovNTsLA4B18W3LCVUrFhkN2BAj8DPhDAMjF4+znI1
X-Gm-Gg: ASbGncve3b5JtJjqEvpfUw1GWhuyqMaLSFk6mDz0MK7T4lB/MXimnhczUX+K5NwJQag
	gnTIZl1qW1aQsckc1T98KBkiO4wpAwQ0Duc42yzMcamYpBgBsueFQqM5HhRm4U+6fw2HA56/6e3
	KtNvUql6uBHL1Ua6yk4tBCwgG2i6/f6P7BfYSXoBzsJqC5avKvBO8Nw351dpHvKn2bSYsA1NkVJ
	Q/pejzx7RO2CfatocqHboa1M6JOYZZ55Z9jatUts/yBcKAu0lZ/5o//h9iII1tT3jZZ8oyRH1mn
	d2wRLM9dwmhH/hz4Rfqk3nFstCTsJw3QKjQ0D/zgiu575uMdmVI=
X-Google-Smtp-Source: AGHT+IH7xJOWztV6diobC/t4okiPR8RXZE7KG/DFe4goD1duyxZyyWmFTs7+pxBBFdGZSO4RmQCe6w==
X-Received: by 2002:a17:90b:57e8:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30823624894mr19795024a91.3.1744694303996;
        Mon, 14 Apr 2025 22:18:23 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:be8d:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm12127760a91.44.2025.04.14.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:18:23 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 1/2] i3c: master: svc: Receive IBI requests in interrupt context
Date: Tue, 15 Apr 2025 13:18:07 +0800
Message-Id: <20250415051808.88091-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com>
References: <20250415051808.88091-1-yschu@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanley Chu <yschu@nuvoton.com>

Moving the job from workqueue to ISR for two reasons.

1. Improve bus utilization.
If the requests are postponed to be received in the workqueue thread,
the SDA line remains low for a long time while the system loading is
high. During this period, the bus is not available for other targets
to raise requests.

2. Ensure prompt response to requests.
For timing-critical requests, the target may encouter a failure or the
event is missed if the request is not received in time.

IBI request is short, ISR can receive the data quickly and then queue a
work to handle it in the bottom half.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3..7ceaf3ec45bb 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -201,7 +201,6 @@ struct svc_i3c_drvdata {
  * @addrs: Array containing the dynamic addresses of each attached device
  * @descs: Array of descriptors, one per attached device
  * @hj_work: Hot-join work
- * @ibi_work: IBI work
  * @irq: Main interrupt
  * @pclk: System clock
  * @fclk: Fast clock (bus)
@@ -229,7 +228,6 @@ struct svc_i3c_master {
 	u8 addrs[SVC_I3C_MAX_DEVS];
 	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
 	struct work_struct hj_work;
-	struct work_struct ibi_work;
 	int irq;
 	struct clk *pclk;
 	struct clk *fclk;
@@ -487,9 +485,8 @@ static int svc_i3c_master_handle_ibi_won(struct svc_i3c_master *master, u32 msta
 	return ret;
 }
 
-static void svc_i3c_master_ibi_work(struct work_struct *work)
+static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 {
-	struct svc_i3c_master *master = container_of(work, struct svc_i3c_master, ibi_work);
 	struct svc_i3c_i2c_dev_data *data;
 	unsigned int ibitype, ibiaddr;
 	struct i3c_dev_desc *dev;
@@ -504,7 +501,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	 * schedule during the whole I3C transaction, otherwise, the I3C bus timeout may happen if
 	 * any irq or schedule happen during transaction.
 	 */
-	guard(spinlock_irqsave)(&master->xferqueue.lock);
+	guard(spinlock)(&master->xferqueue.lock);
 
 	/*
 	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
@@ -530,7 +527,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for IBIWON\n");
 		svc_i3c_master_emit_stop(master);
-		goto reenable_ibis;
+		return;
 	}
 
 	status = readl(master->regs + SVC_I3C_MSTATUS);
@@ -574,7 +571,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 
 		svc_i3c_master_emit_stop(master);
 
-		goto reenable_ibis;
+		return;
 	}
 
 	/* Handle the non critical tasks */
@@ -597,9 +594,6 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	default:
 		break;
 	}
-
-reenable_ibis:
-	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
 }
 
 static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
@@ -618,10 +612,12 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
 		return IRQ_HANDLED;
 
-	svc_i3c_master_disable_interrupts(master);
-
-	/* Handle the interrupt in a non atomic context */
-	queue_work(master->base.wq, &master->ibi_work);
+	/*
+	 * The SDA line remains low until the request is processed.
+	 * Receive the request in the interrupt context to respond promptly
+	 * and restore the bus to idle state.
+	 */
+	svc_i3c_master_ibi_isr(master);
 
 	return IRQ_HANDLED;
 }
@@ -1947,7 +1943,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 		return ret;
 
 	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
-	INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
 	mutex_init(&master->lock);
 
 	ret = devm_request_irq(dev, master->irq, svc_i3c_master_irq_handler,
-- 
2.34.1

