Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7403A1BA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217318; cv=none; b=hY3GWfV3L9E7aiyX64j6RxYSK/jcu+4afZdNGbtTd8m8DG7nbxdYHDNRXTykI117gvbWEwir9mIZnJXgbuXDp9p1hYwlnNA0S8CPPRfu2FKOSVBcLwKuDtGJkUzJ6L2VFf25SzHP4mtzuQPiM/4a2zPkYlL8lLelWSg0xYGTGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217318; c=relaxed/simple;
	bh=9nLwSViwc+aWV16xCbkbc68VQlSagffWIhULfrfxBu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IveEvbhu6iJHJhJYJDscoYZ9u7uv3ypW4tNCE0+Joaqu3y9MXKRnRlRbhiuNrPLR6arEs8Fn+uy1IhwXm5Oh16/bbSoSSjfuEGClLzDV0ZcY7+PKw4EiArMamXlcPOa/OxqDaF1hEcTFl1AVC4OVJnApNLyBpoRp74pvnPkzP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cacx1iEy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cacx1iEy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so14128085e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749217313; x=1749822113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTFOzWRKtno69oZOUe1NTizA/xt3mfhoIf6VlgXm33Q=;
        b=cacx1iEyTvCfe7IQU8l+6wGSFSEQvDRGeow0bZsqQE1OPWQSOKlgA0I0ThSJFKAsgb
         ztPS8fpTGrFKkMKmiOnKGARVHDC0fpOQf59yfI+N/q62aF/ySIcxnwNDygcfV5BWZkhN
         nTqeZkgwA+mD+cMUA8i9XEcKIqhh5byGLyTRJ3+TVrhD0lVCG8onhEGXiTcdjeVluU48
         +oUrK3o+T98kuH+qxiUMvKcdq38Tb4eYpbV2PwO88rBv3keOJ+/ZX6NTGfBiuveoO9oa
         nRCuhjzXJtQRUDO76ihVaxmtQ0YLONAm9M9rvGIVlfvqmG9yZiZvq2k9oRc28ydOgJw+
         4Hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217313; x=1749822113;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTFOzWRKtno69oZOUe1NTizA/xt3mfhoIf6VlgXm33Q=;
        b=sp+ecAseWH8wBJ6Nn/NKwzWbC4P2HuCDLB/Q7Tf8Jt0FYuaFhU2vnkSewXHMkJ2+e5
         EuN/4UfoTFpVsIALpdr/+XYG+s4GlXVQtxF/cnS6yX9V/Vi0ahet2hQFIs+omaEU6Snw
         anPWPfvw2COEN9EThXB9Hoe/JBUGz+0Db48IKDJuuLXDoTiDtDS5+JuXmtmvccGGwucR
         2CRf1LJYRNUEk5h0h8g312+3Luu55H3IZml5jBFPKRP8e++AXRrdZzYRsQJRMU7e54pW
         c/oZEiPT8aM6YJPag7eJgrfJgt6mlo9xiSI8r7Q4JFbDp+00JKh7IfIB/J6sIiFB/X7+
         Md/g==
X-Forwarded-Encrypted: i=1; AJvYcCXXNjQqCbNm9cb/Shve2u8nrW+MfQdvqj3yG+UKX/DmNLMsCWPxcbo34nUX3bTbenijlQFoopFOc569Nds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTugWpocFswzG0PgdObtWRKr5pMtVwzjELG9RNbxXl3m34ZHN
	k6CTiYKDT9Pbk4NtQaZ7PB6TTbtPACZH0cR4mg+DkN5UBNKI0UClOlG1gsJtZswrLTc=
X-Gm-Gg: ASbGncvieiuTs5k224eWj5r2dTo019N8mrU+Kc7pSTi3QLBh3Hhw6XRMbGvE19i13vU
	0XN1f/ZHV9M1hFIFtjdaFCE38TDUUN2koEWI520phG2KLR6g3z+NzrmLg0KDuxfxvgx/jK3BcKb
	9bPiOi22DBBbwEQcdZaluMYCfgQxAP9cZm2//mIoUz5H8EXP/FNon7IEL5BbqKxl/SOl9S/P30C
	x3MlSI27+dj/9c4gXVlyZZKoBGgoo58FryG0xQwNfmSgkL+fT12bE+6jpQ5//5ri10j8hnKj3Ea
	oeCxbeIUxUBfG5L8JIoKeu5SsM4k/0ig2I2H1Fq009QAG2V12sMwhHK7Wj78k6caVptHKewIWhh
	4EqnkHKpwGDtkXNl9u5htpNib8442m2boLmv460vEPg==
X-Google-Smtp-Source: AGHT+IE1rwwQG+rrsjon14loLoaLqiSSZKx9HHA2Hy4/99w3nYKxkficVfbYFMwV7U9uCCDFDR7jUg==
X-Received: by 2002:a05:600c:6099:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-452013bb38dmr43474495e9.17.1749217313338;
        Fri, 06 Jun 2025 06:41:53 -0700 (PDT)
Received: from ta2.c.googlers.com (213.20.187.35.bc.googleusercontent.com. [35.187.20.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm21744355e9.25.2025.06.06.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:41:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 06 Jun 2025 13:41:47 +0000
Subject: [PATCH] mailbox: stop the release and reacquire of the chan lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
X-B4-Tracking: v=1; b=H4sIABrwQmgC/x3MSwqAMAwA0atI1gaq2ApeRVzYNmrwU01RBPHuF
 pdvMfNAJGGK0GQPCF0cOWwJRZ6Bm/ptJGSfDKUqtTLK4GrDjV7CjkK9O04WwiW4GYvK1k77wWj
 rIeW70MD3v2679/0A0bwLw2oAAAA=
X-Change-ID: 20250606-mbox-drop-reacquire-lock-14b7c5df65bd
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, cristian.marussi@arm.com, sudeep.holla@arm.com, 
 kernel-team@android.com, arm-scmi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749217312; l=4642;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9nLwSViwc+aWV16xCbkbc68VQlSagffWIhULfrfxBu4=;
 b=yN4/VRu2saV+kafEgQ/J98zKsJ5c/2AtnH4fkCjwcQCOOssEK0vbYLKHc3ubvIscEIATb5UE6
 rIpC5QBMDZUDAE+3ENPq6msKD+CmxZbAON0pZc8TugUi1B9xRzibRA0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

There are two cases where the chan lock is released and reacquired
were it shouldn't really be:

1/ released at the end of add_to_rbuf() and reacquired at the beginning
of msg_submit(). After the lock is released at the end of add_to_rbuf(),
if the mailbox core is under heavy load, the mailbox software queue may
fill up without any of the threads getting the chance to drain the
software queue.
	T#0 acquires chan lock, fills rbuf, releases the lock, then
	T#1 acquires chan lock, fills rbuf, releases the lock, then
	...
	T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
We shall drain the software queue as fast as we can, while still holding
the channel lock.

2/ tx_tick() releases the lock after setting chan->active_req = NULL.
This gives again the possibility for the software queue to fill up, as
described in case 1/.

Address the cases from above by draining the software queue while still
holding the channel lock.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/mailbox.c | 75 ++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae22207309fadbe8fe7f6fd8b4bc2c345cfd..b064a0bd98fd07bfa4dc4186c90e5989d5dfd510 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -26,8 +26,6 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 {
 	int idx;
 
-	guard(spinlock_irqsave)(&chan->lock);
-
 	/* See if there is any space left */
 	if (chan->msg_count == MBOX_TX_QUEUE_LEN)
 		return -ENOBUFS;
@@ -48,49 +46,49 @@ static void msg_submit(struct mbox_chan *chan)
 {
 	unsigned count, idx;
 	void *data;
-	int err = -EBUSY;
-
-	scoped_guard(spinlock_irqsave, &chan->lock) {
-		if (!chan->msg_count || chan->active_req)
-			break;
 
-		count = chan->msg_count;
-		idx = chan->msg_free;
-		if (idx >= count)
-			idx -= count;
-		else
-			idx += MBOX_TX_QUEUE_LEN - count;
+	count = chan->msg_count;
+	idx = chan->msg_free;
+	if (idx >= count)
+		idx -= count;
+	else
+		idx += MBOX_TX_QUEUE_LEN - count;
 
-		data = chan->msg_data[idx];
+	data = chan->msg_data[idx];
 
-		if (chan->cl->tx_prepare)
-			chan->cl->tx_prepare(chan->cl, data);
-		/* Try to submit a message to the MBOX controller */
-		err = chan->mbox->ops->send_data(chan, data);
-		if (!err) {
-			chan->active_req = data;
-			chan->msg_count--;
-		}
+	if (chan->cl->tx_prepare)
+		chan->cl->tx_prepare(chan->cl, data);
+	/* Try to submit a message to the MBOX controller */
+	if (!chan->mbox->ops->send_data(chan, data)) {
+		chan->active_req = data;
+		chan->msg_count--;
 	}
+}
 
-	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
-		/* kick start the timer immediately to avoid delays */
-		scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
-			hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
-	}
+static void mbox_kick_start_timer(struct mbox_chan *chan)
+{
+	/* kick start the timer immediately to avoid delays */
+	scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
+		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
 }
 
 static void tx_tick(struct mbox_chan *chan, int r)
 {
+	bool sent = false;
 	void *mssg;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		mssg = chan->active_req;
 		chan->active_req = NULL;
+
+		if (chan->msg_count) {
+			msg_submit(chan);
+			sent = true;
+		}
 	}
 
-	/* Submit next message */
-	msg_submit(chan);
+	if (sent && (chan->txdone_method & TXDONE_BY_POLL))
+		mbox_kick_start_timer(chan);
 
 	if (!mssg)
 		return;
@@ -243,18 +241,27 @@ EXPORT_SYMBOL_GPL(mbox_client_peek_data);
  */
 int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
+	bool sent = false;
 	int t;
 
 	if (!chan || !chan->cl)
 		return -EINVAL;
 
-	t = add_to_rbuf(chan, mssg);
-	if (t < 0) {
-		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
-		return t;
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		t = add_to_rbuf(chan, mssg);
+		if (t < 0) {
+			dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
+			return t;
+		}
+
+		if (!chan->active_req) {
+			msg_submit(chan);
+			sent = true;
+		}
 	}
 
-	msg_submit(chan);
+	if (sent && (chan->txdone_method & TXDONE_BY_POLL))
+		mbox_kick_start_timer(chan);
 
 	if (chan->cl->tx_block) {
 		unsigned long wait;

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250606-mbox-drop-reacquire-lock-14b7c5df65bd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

