Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0521EDA26
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233926; cv=none; b=YbyxA8FYIrsHkeP+W1a0FZb0L1kBGj9Z7srG1Oxq2MisidQKLECnAkEZd4SdpEHo3u7yV7iKxIFNozQ6sDh4WqEtSh9iFeKrAoW8o0ZE9+zZzfKcse267e2WaQitQFJuB2a6DWra9gFZAldZy/6CyRdxU/PZvkL0Ci4rmHwCqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233926; c=relaxed/simple;
	bh=ya8pUWgWN5Mv9CNUeXkubc0pOZk8S+YcmBfsr2iGzpY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Na5JJERX13kEfAxXcLnWq9A6gPK0BUQ5JbsaOHEJhuhVxRaDu4sZ/J7m0Ti/YtsCBRvZZNRpeMyCFavNRH7jiNUcTk3QACNgw5bx5OliOzWm5KtBEiffY7gRLvhMPSRuLTE9HzRe0Dlghop6O/LDltzX58jBjPyFE7+Ln3LTjak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jA16xLb/; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jA16xLb/"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-234f1acc707so44653845ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750233924; x=1750838724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ISMy7wjC+6TEkD7QmOftNULtyhHMY+2SKB0Kw0ePygE=;
        b=jA16xLb/jJTTz9GoHnBD6ZLq53iS6chEJPDG+iAaz+ATIGZ1BcdatzIAsp3mXUID8J
         SqQkCxwQDA5nPN/7u1PflssElUzqTvQq6MK3a8k3W1sUPCRHVk0ldXM0uzWf+SlkzJYo
         RbOR15Bb6aQ4jUp3C8nM8ujoDOFlXDbdxXXMhq93VbF8kqUXpr9Ey/FYzCDCaJQ+m6z1
         5P4FvZjaTftArkNhsYuoPQP9jlHMH8XwhQ19NPGYgPWGA4tXKZct/k5BiYzi4kCOu9T6
         olgzjiNkJhcBb4ix24/uuMqxNnfTyq0vSBZ+qT55RJAI4zJxLZvDlupn77VHVXgEfQct
         37rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750233924; x=1750838724;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISMy7wjC+6TEkD7QmOftNULtyhHMY+2SKB0Kw0ePygE=;
        b=MoxehbMSYB5aymCDYg8LonToSPjUvDNeZMvEOJSYHViWjypPpC598KLRl67Uir7nvE
         5Q+uAfo/t6gqwJ1A6XcN0urb6ra+Oh/vWKPtkdGFW7V6xLsHW015V/s0IGdPjsyIdF37
         cK0wyTaA+jywXgtAAaVA5kfHu3I60wOCAK3U9j68+W14a6JOlH4wIhDQ1Napm1xr9XVu
         n6dKii2XAZMfPNkLgdkSwHiFnYpQCwl635K+XzkJcXLJ31A/f7AJjK2iQBnIBlya3EJ8
         xRZYhzD7poFZnbu9FW/Vf/yyVoMvOjN7tZ67FlDDL1D88O2HVRA+S2CqjxyCx7jyuHTt
         aObA==
X-Gm-Message-State: AOJu0YwAhvYBlyA73PMdoq2+f4IVykXKOu9zbQEpsNCmFkjWRr4uIC+z
	Xo6QCcmAiMkFM6DlTGh36wm35Ng1i8XDYx07L9Jb9lKX7tITSguB7ELy+WfKUZsEbRpSPQoisih
	eqdTCfj1jlJ+qdEtywLjCSbwFiw==
X-Google-Smtp-Source: AGHT+IHDsO6LfpIVRX6FVKKDm+QCCj5B3W4Kt/vUe7hJ67EzF3vTc0shyWU8r3nPUAL4OYOZEa3UAhorkfGqQh8Nfw==
X-Received: from plbbi12.prod.google.com ([2002:a17:902:bf0c:b0:234:9fce:6635])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:40d2:b0:234:b41e:378f with SMTP id d9443c01a7336-2366b32ce2emr260588975ad.15.1750233924486;
 Wed, 18 Jun 2025 01:05:24 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:05:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618080514.987118-1-joonwonkang@google.com>
Subject: [PATCH 2/2] mailbox: Make mbox_send_message() return error code when
 tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, Joonwon Kang <joonwonkang@google.com>
Content-Type: text/plain; charset="UTF-8"

When the mailbox controller failed transmitting message, the error code
was only passed to the client's tx done handler and not to
mbox_send_message(). For this reason, the function could return a false
success. This commit resolves the issue by introducing the tx status and
checking it before mbox_send_message() returns.

Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 17 +++++++++++++----
 include/linux/mailbox_controller.h |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 80cd310964a8..7c2e7b149bb6 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -22,7 +22,8 @@
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
-static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx_complete)
+static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx_complete,
+		       int *tx_status)
 {
 	int idx;
 
@@ -35,6 +36,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx
 	idx = chan->msg_free;
 	chan->msg_data[idx].data = mssg;
 	chan->msg_data[idx].tx_complete = tx_complete;
+	chan->msg_data[idx].tx_status = tx_status;
 	chan->msg_count++;
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
@@ -86,12 +88,14 @@ static void tx_tick(struct mbox_chan *chan, int r)
 	int idx;
 	void *mssg = NULL;
 	struct completion *tx_complete = NULL;
+	int *tx_status = NULL;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		idx = chan->active_req;
 		if (idx >= 0) {
 			mssg = chan->msg_data[idx].data;
 			tx_complete = chan->msg_data[idx].tx_complete;
+			tx_status = chan->msg_data[idx].tx_status;
 			chan->active_req = -1;
 		}
 	}
@@ -106,8 +110,10 @@ static void tx_tick(struct mbox_chan *chan, int r)
 	if (chan->cl->tx_done)
 		chan->cl->tx_done(chan->cl, mssg, r);
 
-	if (r != -ETIME && chan->cl->tx_block)
+	if (r != -ETIME && chan->cl->tx_block) {
+		*tx_status = r;
 		complete(tx_complete);
+	}
 }
 
 static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
@@ -252,15 +258,16 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
 	struct completion tx_complete;
+	int tx_status = 0;
 
 	if (!chan || !chan->cl)
 		return -EINVAL;
 
 	if (chan->cl->tx_block) {
 		init_completion(&tx_complete);
-		t = add_to_rbuf(chan, mssg, &tx_complete);
+		t = add_to_rbuf(chan, mssg, &tx_complete, &tx_status);
 	} else {
-		t = add_to_rbuf(chan, mssg, NULL);
+		t = add_to_rbuf(chan, mssg, NULL, NULL);
 	}
 
 	if (t < 0) {
@@ -283,6 +290,8 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 		if (ret == 0) {
 			t = -ETIME;
 			tx_tick(chan, t);
+		} else if (tx_status < 0) {
+			t = tx_status;
 		}
 	}
 
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ae29fba3bc46..5fd81f3ec594 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -106,10 +106,12 @@ struct mbox_controller {
  * struct mbox_message - Internal representation of a mailbox message
  * @data:		Data packet
  * @tx_complete:	Pointer to the transmission completion
+ * @tx_status:		Pointer to the transmission status
  */
 struct mbox_message {
 	void *data;
 	struct completion *tx_complete;
+	int *tx_status;
 };
 
 /**
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

