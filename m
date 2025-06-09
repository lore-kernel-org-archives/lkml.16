Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A79220F4F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494445; cv=none; b=tv/qQOonPbo1WGn340rgWucifywWFyfb4tAYH1ER12hv3E1yL9TJzU2If3lradIm/5otlzgOm1t4blbJYf5M7Uhv9jzYle2h7tJvGm+tft3yCbwPFnEsByb1eglNiYTBJmtyG+rLH37m6/UKYbMICeNjoyk3OF0BWjxtvT3LxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494445; c=relaxed/simple;
	bh=QCRiqA7VAn5Bzf/uSF17xCHxhjH76+/XxZuTS3QiaZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NpAOpISKITpmUmsTvRyE5rSbshS0n+Eb8no+bPa68PkwAgu59I+cZNVuUK2gq/Z7Tl2+3EHKk5wib4EGk81FED8g1Bk+yBf+4boTHcsCeWBV55HoEgPqiJRc30x0lQ00IC8kM4JmcqdtpN3WV25xcEqrL9cj2Kwg49vzQd0U4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RrpKECT9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RrpKECT9"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235c897d378so43076395ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749494443; x=1750099243; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1Y0C/FAqHRDO+LbKE5JJcds0KjGxqFEGkislmx1t1o=;
        b=RrpKECT98/x2di4uwa527TrM4LE/i4EmuRgX9QMjjy+YJtlYu2Ti9UsekvPmZCwjkr
         ZqyTgevU7/cKlUylNfwcBzLxGptCAF9YbCDdvRAtlLUCmQLUZp21MY8QHMJDYP+yi8d0
         6XYPHqZIH606c2sJ0+kw1QWoBw31Hc7/ySCkZodDbkSfdPLI3ON9unVyQW8y1S5vdX0K
         bTsWVBBOD3cHJ5uY5ffF+SJt5bzGjyB12F1h+PzWfnoYbAl41NM2YBhGkNm9/U/ymZhg
         Wld9p52cFRYMVJLvpc88/cKli5J6trsudMrg3L+M3YduJBel03VYwJ00T55RYRT3ZhLF
         qQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494443; x=1750099243;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1Y0C/FAqHRDO+LbKE5JJcds0KjGxqFEGkislmx1t1o=;
        b=PXzQl4Tuctv0x/TQlfWpQ2JXmQ2Tpt7O9/6gScOCz5NmJcaIfZtWM7qKg15pd5iaTF
         OGcNNlv/zgJ4/jijZ/ROStcgXXg8lYB/FPck3+AUOekSC/RJ/hES1M6k1WGznYj+gApf
         IuYF1cHV5kgvX+KnfAXGd0aHW0KNX+H/a/v2P+4CnGgeMlm6ZqWzKCRXyeDkZQRp9Inj
         LQ1WxiJe0iqaefOWqsdOBEvHH5jMbgG0dFwDXd3ymYcwWNWfcSKm0O46Rj5DYhpJlt7h
         S6DCwllFDAC9mOmtfC3KaRsC2dJ5HYgAF5zDibqK/pti7bWtPOdZZFnGZeDPIIzgda2e
         cTzA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ttJExIlxoZ0u3ZPWcpWjIheQ0GIiJXEtQzF5nvqEMdADhCd/31eUOYUuKl7Qwfis71678rqHoLZpVI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySa/CC7Y+9I5Na74nSZxaEgb/roYZLBIZRM+sCY9ZuQq1Er5DG
	UAq+eU69hNf6Ibq7WhLFYcg+kQMoAmdBzUHKL0CK5fWbqYMVmU0+++VKNHvQDsZLjHlQ14JMy1T
	nk/6X/WDOEuNNOIxBx0htCQC6lQ==
X-Google-Smtp-Source: AGHT+IGB3OBVlk0SWiXjb3AMVXr9DDsoik9k3mZFUm83Ee4eF5UbNhOncUDYbatUZI+8Qmpaz+R6DWjZTE/muCLw/A==
X-Received: from pgcv10.prod.google.com ([2002:a05:6a02:530a:b0:b2f:556f:74a2])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b47:b0:234:c549:da13 with SMTP id d9443c01a7336-23601e4b749mr207119415ad.17.1749494443018;
 Mon, 09 Jun 2025 11:40:43 -0700 (PDT)
Date: Mon,  9 Jun 2025 18:40:27 +0000
In-Reply-To: <20250609184029.2634345-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609184029.2634345-7-hramamurthy@google.com>
Subject: [PATCH net-next v4 6/8] gve: Add rx hardware timestamp expansion
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

From: John Fraker <jfraker@google.com>

Allow the rx path to recover the high 32 bits of the full 64 bit rx
timestamp.

Use the low 32 bits of the last synced nic time and the 32 bits of the
timestamp provided in the rx descriptor to generate a difference, which
is then applied to the last synced nic time to reconstruct the complete
64-bit timestamp.

This scheme remains accurate as long as no more than ~2 seconds have
passed between the last read of the nic clock and the timestamping
application of the received packet.

Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 Changes in v3:
 - Change the last_read to be u64 (Vadim Fedorenko)

 Changes in v2:
 - Add the missing READ_ONCE (Joe Damato)
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index dcb0545baa50..9aadf8435f8b 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -437,6 +437,29 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
 	skb_set_hash(skb, le32_to_cpu(compl_desc->hash), hash_type);
 }
 
+/* Expand the hardware timestamp to the full 64 bits of width, and add it to the
+ * skb.
+ *
+ * This algorithm works by using the passed hardware timestamp to generate a
+ * diff relative to the last read of the nic clock. This diff can be positive or
+ * negative, as it is possible that we have read the clock more recently than
+ * the hardware has received this packet. To detect this, we use the high bit of
+ * the diff, and assume that the read is more recent if the high bit is set. In
+ * this case we invert the process.
+ *
+ * Note that this means if the time delta between packet reception and the last
+ * clock read is greater than ~2 seconds, this will provide invalid results.
+ */
+static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
+{
+	u64 last_read = READ_ONCE(rx->gve->last_sync_nic_counter);
+	struct sk_buff *skb = rx->ctx.skb_head;
+	u32 low = (u32)last_read;
+	s32 diff = hwts - low;
+
+	skb_hwtstamps(skb)->hwtstamp = ns_to_ktime(last_read + diff);
+}
+
 static void gve_rx_free_skb(struct napi_struct *napi, struct gve_rx_ring *rx)
 {
 	if (!rx->ctx.skb_head)
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

