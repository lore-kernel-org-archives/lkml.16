Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6002D29BB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958269; cv=none; b=UrtkSsz+JYURgnJfrHLKV0E3+B5gukDek/UfE5ezu381je8mO329fJ2hmUArW1QxdgZWTdB2BSJs83RGhovWeFtig4wioO2Ck8FHqv9H6mmyOM+OTrk9S0u6Q2qO/+AAFXljkr1mXuK6RNtvFhTXSr4QocGUaag6id1FqJT7Te8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958269; c=relaxed/simple;
	bh=rKe+adcj5bthS6JtPka9p9/KvrSfZnM2t7JaWTyjfNU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nMwwuEvjv6GMJsQW7KZOO3y37BxnJTC6aQNfYqpw+QkjUK4kQpBFyl6X9EI4lf82n2/NSpILr4YuG4mbeby3DnXdT+2vFijGbNTTH2ngQYgDeY8MF3zxWi20xEhS4jCNm+PMZ7QiReUVTtrE0oBZiMDQEfQgw9ONC1LjFiptVYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3UYYgsOn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3UYYgsOn"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742cc20e11eso3880148b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958267; x=1748563067; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=55JMcrpNKoKOC4/lL88wetlCV1r8D6JepOyDlFCl+80=;
        b=3UYYgsOnlZspws09n7VVyadA13QuGoH5g7L/L9d/1zR+lnyrKEuBL8znhOxbTa7qkL
         mwkivrztGGSsgNrAQ44ue8BDOfNdWiaT5nYJ7j3QgkvkIrhYzHqvHPRSThzhngkK+SFY
         kpn6P3dVFhQEKJ3TeP1MWi+i09ydVvKuPwapJgVf/N5o29ZfQiIuAUdnmSXrgr+6/1np
         EAx7+cwcDlX3JBDqxnwib9BqHWT+GSHC8HWocu9JHSwDBYbd4eFyCz1vz4/0c2erJNup
         Vg2fK5CT+LCRBM9kg5hV0uXSLrfQ4DeDWU3ilBRWhDzlVnNb3k8NvNUywyMxcnruwABU
         gBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958267; x=1748563067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55JMcrpNKoKOC4/lL88wetlCV1r8D6JepOyDlFCl+80=;
        b=LTINjwNNxcBX0h0OPguNiLHUh6hzVcf1WYxAtUYZYl/ErZSTittI8V/61MD4W9+PHp
         DI9EJB0N0cfxBWWAfP4CWq+hBlvEopHy8zugO7Hb4bTJM3FYf62PNpgrePm8W/hPG83s
         YdYuB3bNgOycqAo8aATiWNNq8kMlvnYQINtvGPUue+33F2/yAB60cNKrAVzYLpopDCxw
         Su5OjPDVvzAmEvHeBpKnBlFeCyyewFDKSXh84AxKiOhZYSuNBOVIo9DwCzKrhzE492Qf
         X+5P0F42Ff7o3wcSpY6XJRxHWmjhrwmPHvWC/bH16ZmqG4AuxQkx6WoTmsyytFOeP0at
         PJhw==
X-Forwarded-Encrypted: i=1; AJvYcCUz6ZlsRx2a/kuFiEviB3Wm5vhq6nba8JLfYjV4x5cyiI26gRIHBoXxlE6CmmxULgleF2VLib5qyLHZxRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnXlLvba2n+0JRxBMy+h572pdC0W2XNGF6Hor01h3EFdYqNOZQ
	iMNHB4lM0d7OS4nivFTtk36uToywrL699MODjZZQTpFBrEVcE21u0Z8rfeRGjVU+UjGWQOtDmBB
	bChE4u30cwiLDob1hx6b6AWtQuQ==
X-Google-Smtp-Source: AGHT+IFisGKBNBcLluR0PM+qcaDfXiwv7i9aqZZIIJ1lyzKt+SV81C987vnjksRoorMicy9+6u0N9DO1L4Fz9roekQ==
X-Received: from pfhj12.prod.google.com ([2002:a62:e90c:0:b0:736:38af:afeb])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:88c8:0:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-742accc545emr40187202b3a.8.1747958266813;
 Thu, 22 May 2025 16:57:46 -0700 (PDT)
Date: Thu, 22 May 2025 23:57:33 +0000
In-Reply-To: <20250522235737.1925605-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235737.1925605-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235737.1925605-5-hramamurthy@google.com>
Subject: [PATCH net-next v3 4/8] gve: Add adminq lock for queues creation and destruction
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, richardcochran@gmail.com, jdamato@fastly.com, 
	vadim.fedorenko@linux.dev, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ziwei Xiao <ziweixiao@google.com>

Adminq commands for queues creation and destruction were not
consistently protected by the driver's adminq_lock. This was previously
benign as these operations were always initiated from contexts holding
kernel-level locks (e.g., rtnl_lock, netdev_lock), which provided
serialization.

Upcoming PTP aux_work will issue adminq commands directly from the
driver to read the NIC clock, without such kernel lock protection.
To prevent race conditions with this new PTP work, this patch ensures
the adminq_lock is held during queues creation and destruction.

Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 Changes in v2:
 - Send this patch together with the rx timestamping patches to net-next
   instead of sending it to net (Jakub Kicinski)
 - Remove the unnecessary cleanup (Jakub Kicinski)
---
 drivers/net/ethernet/google/gve/gve_adminq.c | 47 +++++++++++++++-----
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index f57913a673b4..a0cc05a9eefc 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -463,6 +463,8 @@ static int gve_adminq_kick_and_wait(struct gve_priv *priv)
 	int tail, head;
 	int i;
 
+	lockdep_assert_held(&priv->adminq_lock);
+
 	tail = ioread32be(&priv->reg_bar0->adminq_event_counter);
 	head = priv->adminq_prod_cnt;
 
@@ -488,9 +490,6 @@ static int gve_adminq_kick_and_wait(struct gve_priv *priv)
 	return 0;
 }
 
-/* This function is not threadsafe - the caller is responsible for any
- * necessary locks.
- */
 static int gve_adminq_issue_cmd(struct gve_priv *priv,
 				union gve_adminq_command *cmd_orig)
 {
@@ -498,6 +497,8 @@ static int gve_adminq_issue_cmd(struct gve_priv *priv,
 	u32 opcode;
 	u32 tail;
 
+	lockdep_assert_held(&priv->adminq_lock);
+
 	tail = ioread32be(&priv->reg_bar0->adminq_event_counter);
 
 	// Check if next command will overflow the buffer.
@@ -733,13 +734,19 @@ int gve_adminq_create_tx_queues(struct gve_priv *priv, u32 start_id, u32 num_que
 	int err;
 	int i;
 
+	mutex_lock(&priv->adminq_lock);
+
 	for (i = start_id; i < start_id + num_queues; i++) {
 		err = gve_adminq_create_tx_queue(priv, i);
 		if (err)
-			return err;
+			goto out;
 	}
 
-	return gve_adminq_kick_and_wait(priv);
+	err = gve_adminq_kick_and_wait(priv);
+
+out:
+	mutex_unlock(&priv->adminq_lock);
+	return err;
 }
 
 static void gve_adminq_get_create_rx_queue_cmd(struct gve_priv *priv,
@@ -812,13 +819,19 @@ int gve_adminq_create_rx_queues(struct gve_priv *priv, u32 num_queues)
 	int err;
 	int i;
 
+	mutex_lock(&priv->adminq_lock);
+
 	for (i = 0; i < num_queues; i++) {
 		err = gve_adminq_create_rx_queue(priv, i);
 		if (err)
-			return err;
+			goto out;
 	}
 
-	return gve_adminq_kick_and_wait(priv);
+	err = gve_adminq_kick_and_wait(priv);
+
+out:
+	mutex_unlock(&priv->adminq_lock);
+	return err;
 }
 
 static int gve_adminq_destroy_tx_queue(struct gve_priv *priv, u32 queue_index)
@@ -844,13 +857,19 @@ int gve_adminq_destroy_tx_queues(struct gve_priv *priv, u32 start_id, u32 num_qu
 	int err;
 	int i;
 
+	mutex_lock(&priv->adminq_lock);
+
 	for (i = start_id; i < start_id + num_queues; i++) {
 		err = gve_adminq_destroy_tx_queue(priv, i);
 		if (err)
-			return err;
+			goto out;
 	}
 
-	return gve_adminq_kick_and_wait(priv);
+	err = gve_adminq_kick_and_wait(priv);
+
+out:
+	mutex_unlock(&priv->adminq_lock);
+	return err;
 }
 
 static void gve_adminq_make_destroy_rx_queue_cmd(union gve_adminq_command *cmd,
@@ -885,13 +904,19 @@ int gve_adminq_destroy_rx_queues(struct gve_priv *priv, u32 num_queues)
 	int err;
 	int i;
 
+	mutex_lock(&priv->adminq_lock);
+
 	for (i = 0; i < num_queues; i++) {
 		err = gve_adminq_destroy_rx_queue(priv, i);
 		if (err)
-			return err;
+			goto out;
 	}
 
-	return gve_adminq_kick_and_wait(priv);
+	err = gve_adminq_kick_and_wait(priv);
+
+out:
+	mutex_unlock(&priv->adminq_lock);
+	return err;
 }
 
 static void gve_set_default_desc_cnt(struct gve_priv *priv,
-- 
2.49.0.1143.g0be31eac6b-goog

