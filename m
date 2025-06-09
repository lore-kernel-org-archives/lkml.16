Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7121FF32
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494441; cv=none; b=I6OnyzdetyqVCPhLBllx58KY3EIs/5KOIfEK6I0i5udxZdsWVkiJUnQA6n9+PZDEuSxSoH330cpxq2Q5SaEQowGV7V73K2iE2s5Mw+G9A0L/I+5qaYcWkb7DnmMLyxl/yOPzSlTfW+EdQ4LdmBrHkg4FAjtTdaKTQH3s2/e8GmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494441; c=relaxed/simple;
	bh=yQa6m4QTWQuWwuSQIKl2AzKMwcKVsSDV5+YV2XGQmUA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YAYdmafnoLvhTNmMkz5excESDKfNmJFgIyYHE5jHVhQ+Cd8KRhgHgzCBDtQHbK7M4M2cw32ZR1XeBVgpMzAQd5qB1xfZcVMWAXKCk865arWABi2Y9nEhQZDsmWznRk42VFWeiq1UkoQbOdXtwr3YW+thF3JiRPwH1fdP0eZqnro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iOlMaYdB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iOlMaYdB"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so3202907a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749494439; x=1750099239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcLwwmfx7bRMuR2c4/AzHTkhnnrnIq+RybS5E5Bf73k=;
        b=iOlMaYdB7DZ21r0W5RuTiYlKrM65iDkQLJbvQ4YiVRdIBeN3Hi2YGiIj8p1HuytA9Y
         IPTaDj0Sn76r1zVQCsoq6TpSScbqmjU8VO4rmL5mC8Wotw8x9NV2vK2zUHcUSGkDxY07
         IUTER1+gxWcfWOECA3QS5CmhO9RcQIjD11VTcUxaYlxr8Gbrfg3vUVqQMcjfTBUAAqgI
         uK7WKQiEelZLEgrld4hXlIk0LmuSxvTMKQfmqIyN2u9o9j8/P3FCccxSTAK+QdZSBAsG
         weKszDcFW7d0Q8QaYoWB4jHjINwxWjCXhrRt04mPxc420cSJdqAr2aMzc3yYD/Dy5h5C
         jEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494439; x=1750099239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcLwwmfx7bRMuR2c4/AzHTkhnnrnIq+RybS5E5Bf73k=;
        b=ZubYsU2Oa4BxmSKe63hbrXYdGHmuDgpskLtMjBG3o+TV9V/deLyswwaNZx/wFXvxum
         /4mRvq2lCyMa8aNnHDJO5zgs2lxZzjaNBGfMPECUqI0uOZSHR1b9LP1SlG7vkdv7WCk6
         CSimFzNVmlayhrig+4bB77tEFxYeHtk1kzXULEL+8cH1VFN0hoSNRIIcwmuKX0I/gFbJ
         gqcOrisBEJPWP+DWimocZMZtQ0FnX+vrjSkO5BCZ6OLiQ9kVqUeVXNHutXZ+Dl9Gp77W
         Vffu8DG9a9xdXHVUMler/gq/38gZp4WF00lbceOHV6JLb0MYLilFlgCAfp8FSt2eCmI7
         WeSw==
X-Forwarded-Encrypted: i=1; AJvYcCVXp9UAHiIYmF94B7qw54BczOaI7GorNEhMO7S7M3oFQSCw08+OtkTidtF5HkJ/VESTsZLrRpb2/szzWrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzi+cVT1XHK2m38dxDfM9WhrpYe7X4jLSRMFE7WjTJgtM7qqUv
	bnoz3py/h47ti5DXTPOygGX62iqYCp77v9l0M4f4bPDTE5hNG8gpi93t9PpzvBrCwumqUZd0m/9
	4/X7jJSBxt2jPDd2yoABtjsP52g==
X-Google-Smtp-Source: AGHT+IH25qL2Mwp6kaHwBIcHvYYOIefFIHQyD6mAtoeGj8d1VX7EEScix8eZdD2u9Wj50hNeZGtSS5EK8Hn+GEEOYA==
X-Received: from pgmm37.prod.google.com ([2002:a05:6a02:5525:b0:b2e:b684:1f9e])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3282:b0:1f5:7f2e:5c3c with SMTP id adf61e73a8af0-21ee257b971mr17627959637.1.1749494439469;
 Mon, 09 Jun 2025 11:40:39 -0700 (PDT)
Date: Mon,  9 Jun 2025 18:40:25 +0000
In-Reply-To: <20250609184029.2634345-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609184029.2634345-5-hramamurthy@google.com>
Subject: [PATCH net-next v4 4/8] gve: Add adminq lock for queues creation and destruction
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
2.50.0.rc0.604.gd4ff7b7c86-goog

